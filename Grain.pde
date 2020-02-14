class Grain
{
    Body body;                          //box2D body
    float r;                            //radius
    color col;                          //color
    Grain(float x, float y,float r_,color col_) 
    {
        r=r_;                  //initialization
        col=col_;      //initialization
        FixtureDef fd = new FixtureDef();                    //apply memory for body defition
        CircleShape cs = new CircleShape();                  //apply memory for shape
        cs.m_radius = box2d.scalarPixelsToWorld(r);          //build shape by radius
        fd.shape = cs;                                       //set shape
        fd.density = 0.1;                                    //density
        fd.friction = 0;                                     //friction
        fd.restitution= 1;                                   //elasticity
        BodyDef bd = new BodyDef();                          //apply memory for body defition
        bd.position = box2d.coordPixelsToWorld(x, y);        //set position
        bd.type = BodyType.DYNAMIC;                          //grains are dynamic
        body = box2d.createBody(bd);                         //create body by defition
        body.createFixture(fd);                              //set body physical property by fixture
        body.setAngularVelocity(0);                          //angular velocity is 0
        body.setUserData(this);
    }
    boolean done() 
    {
        Vec2 pos = box2d.getBodyPixelCoord(body);            //get position of body in the world
        if(pos.y > height+r*2||pos.y<-height||pos.x>width*2||pos.x<-width)         //go out from the world?
        {
            box2d.destroyBody(body);                         //kill the body
            return true;
        }
        return false;
    }
    void killBody()
    {
        box2d.destroyBody(body);
    }
    void display() 
    {
        strokeWeight(1);
        Vec2 pos = box2d.getBodyPixelCoord(body);            //get position of body in the world
        pushMatrix();                                        //push
        translate(pos.x,pos.y);
        fill(col);
        stroke(0);
        rectMode(CENTER);
        ellipse(0,0,r*2,r*2);
        popMatrix();                                         //pop
    }
}