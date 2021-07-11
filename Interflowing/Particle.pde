class Particle 
{
    Body body;                  //box2D body
    float r,moveX,moveY;        //radiu & position to move
    PImage imgBall;             //image of the ball
    FixtureDef fd;              //body defition
    Particle(float x, float y, float r_,float d_)
    {
        r = r_;                        //initialization
        fd = new FixtureDef();         //apply memory for body defition
        makeBody(x, y, r, 0.005,BodyType.DYNAMIC);             //gave ball a body
        body.setUserData(this);
        imgBall=d_>1?imgBall_1:imgBall_3;            //random ball
    }
    Particle(float x, float y, float r_,float d_,float den,org.jbox2d.dynamics.BodyType bt)
    {
        r = r_;                        //initialization
        fd = new FixtureDef();         //apply memory for body defition
        makeBody(x, y, r, den,bt);             //gave ball a body
        body.setUserData(this);
        if(d_==3)
        {
            imgBall=imgBridge;
        }
        else
        {
            imgBall=d_>1?imgBall_1:imgBall_3;            //random ball
        }
    }
    boolean done() 
    {
        Vec2 pos = box2d.getBodyPixelCoord(body);
        if (pos.y > height+r*2||pos.y<-height||pos.x>width*2||pos.x<-width) 
        {
            killBody();
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
        Vec2 pos = box2d.getBodyPixelCoord(body);           //get position
        float a = body.getAngle();
        pushMatrix();                                       //push
        translate(pos.x, pos.y);
        image(imgBall_2,-r,-r,2*r,2*r);
        rotate(-a);
        image(imgBall,-r,-r,2*r,2*r);                       //heighlight
        popMatrix();                                        //pop
    }
    void makeBody(float x, float y, float r,float den,org.jbox2d.dynamics.BodyType bt)                //make body just like grain
    {
        CircleShape cs = new CircleShape();
        cs.m_radius = box2d.scalarPixelsToWorld(r);
        fd.shape = cs;
        fd.density = den;
        fd.friction = 1;
        fd.restitution= Restitution;
        BodyDef bd = new BodyDef();
        bd.position = box2d.coordPixelsToWorld(x, y);
        bd.type = bt;
        body = box2d.createBody(bd);
        body.createFixture(fd);
        body.setAngularVelocity( 0 );
        body.setUserData(this);
    }
    boolean over()
    {
        if((mouseX-getX())*(mouseX-getX())+(mouseY-getY())* (mouseY-getY())<=r*r)
        {                                              //x^2 + y^2 <= r^2
            return true;
        }
        return false;
    }
    void move(float x_,float y_)                                        //follow mouse
    {
        // Vec2 vel=body.getLinearVelocity();
        // float a = body.getAngle();
        box2d.destroyBody(body);
        makeBody(x_-moveX,y_-moveY,r, 0.005,BodyType.DYNAMIC);
        // body.setLinearVelocity(vel);
        // body.setAngularVelocity(a);
    }
    void moveTo(float x_,float y_)
    {
        box2d.destroyBody(body);
        makeBody(x_,y_,r, 0.005,BodyType.STATIC);
    }
    float getX()
    {
        return box2d.getBodyPixelCoord(body).x;
    }
    float getY()
    {
        return box2d.getBodyPixelCoord(body).y;
    }
}