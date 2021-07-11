class Bridge 
{
    float totalLength;
    int numPoints;
    ArrayList<Particle> particles;
    ArrayList<DistanceJoint> joints;
    Vec2 start;
    Vec2 end;
    Bridge(Vec2 _start, Vec2 _end)
    {
        start=_start;
        end=_end;
        totalLength = sqrt((start.x-end.x)*(start.x-end.x)+(start.y-end.y)*(start.y-end.y));
        numPoints = int(totalLength/10);
        particles = new ArrayList<Particle>();
        joints=new ArrayList<DistanceJoint>();
        float lenX = (end.x-start.x) / numPoints;
        float lenY = (end.y-start.y) / numPoints;
        float len=sqrt(lenX*lenX+lenY*lenY);
        Particle p = new Particle(start.x,start.y,6,3,5,BodyType.STATIC);
        particles.add(p);
        for(int i=1;i<numPoints;i++)
        {
            p = new Particle(start.x+i*lenX,start.y+i*lenY,6,3,5,BodyType.DYNAMIC);
            particles.add(p);
            DistanceJointDef djd = new DistanceJointDef();
            djd.bodyA = particles.get(i-1).body;
            djd.bodyB = p.body;
            djd.length = box2d.scalarPixelsToWorld(len);
            djd.frequencyHz = 0;
            djd.dampingRatio = 0;
            box2d.world.createJoint(djd);
        }
        p = new Particle(end.x,end.y,6,3,5,BodyType.STATIC);
        particles.add(p);
        DistanceJointDef djd = new DistanceJointDef();
        djd.bodyA = particles.get(particles.size()-2).body;
        djd.bodyB = p.body;
        djd.length = box2d.scalarPixelsToWorld(len);
        djd.frequencyHz = 0;
        djd.dampingRatio = 0;
        joints.add((DistanceJoint)box2d.world.createJoint(djd));
    }
    void display()
    {
        for (Particle p: particles)
        {
            p.display();
        }
    }
    void killBody()
    {
        for(DistanceJoint j:joints)
        {
            box2d.world.destroyJoint(j);
        }
        for(Particle p:this.particles)
        {
            p.killBody();
        }
    }
}