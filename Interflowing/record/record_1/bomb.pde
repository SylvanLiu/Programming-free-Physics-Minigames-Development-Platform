class Bomb
{
    Body body;                  //box2D body
    float r,moveX,moveY;        //radiu & position to move
    FixtureDef fd;              //body defition
    float time;
    Bomb(float x, float y, float r_,float time_)
    {
        r = r_;                        
        time=time_;                    //initialization
        fd = new FixtureDef();         //apply memory for body defition
        makeBody(x, y, r);             //gave boom a body
        body.setUserData(this);
    }
    boolean done() 
    {
        Vec2 pos = box2d.getBodyPixelCoord(body);
        if (pos.y > height+r*2||pos.y<-height||pos.x>width*2||pos.x<-width) 
        {
            box2d.destroyBody(body);
            return true;
        }
        return false;
    }
    void display()
    {
        Vec2 pos = box2d.getBodyPixelCoord(body);           //get position
        float a = body.getAngle();
        pushMatrix();                                       //push
        translate(pos.x, pos.y);
        rotate(-a);
        image(imgBomb_1,-r,-r,2*r,2*r);
        tint(255,255-time);
        image(imgBomb_2,-r,-r,2*r,2*r);
        tint(255,255);                                      //heighlight
        popMatrix();                                        //pop
    }
    void makeBody(float x, float y, float r)                //make body just like grain
    {
        CircleShape cs = new CircleShape();
        cs.m_radius = box2d.scalarPixelsToWorld(r);
        fd.shape = cs;
        fd.density = 0.005;
        fd.friction = 1;
        fd.restitution= Restitution;
        BodyDef bd = new BodyDef();
        bd.position = box2d.coordPixelsToWorld(x, y);
        bd.type = BodyType.DYNAMIC;
        body = box2d.createBody(bd);
        body.createFixture(fd);
        body.setAngularVelocity( 0 );
    }
    boolean over()
    {
        if((mouseX-box2d.getBodyPixelCoord(body).x)*(mouseX-box2d.getBodyPixelCoord(body).x)+(mouseY-box2d.getBodyPixelCoord(body).y)* (mouseY-box2d.getBodyPixelCoord(body).y)<=r*r)
        {                                              //x^2 + y^2 <= r^2
            return true;
        }
        return false;
    }
    void move(float x_,float y_)                                        //follow mouse
    {
        Vec2 vel=body.getLinearVelocity();
        float a = body.getAngle();
        box2d.destroyBody(body);
        makeBody(x_-moveX,y_-moveY,r);
        body.setLinearVelocity(vel);
        body.setAngularVelocity(a);
    }
}