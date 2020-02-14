class Dot
{
    float x,y,r;           //position & radiu
    Dot(float x_,float y_,float r_)
    {
        x=x_;
        y=y_;
        r=r_;              //initialization
    }
    boolean over()
    {
        if((mouseX-x)*(mouseX-x)+(mouseY-y)* (mouseY-y)<=r*r)        //mouse is over the dot?
        {
            return true;
        }
        return false;
    }
    void display()                       //display the dot
    {
        noFill();
        strokeWeight(1);
        ellipse(x,y, r*2, r*2);
        line(x-5,y,x+5,y);
        line(x,y-5,x,y+5);
    }
    void attractionOn()
    {
        for(Particle p: particles)      //attracted all balls
        {
            Vec2 worldTarget = box2d.coordPixelsToWorld(x,y);        //position of attraction point in the world
            Vec2 bodyVec = p.body.getWorldCenter();                  //position of ball's body in the world
            worldTarget.subLocal(bodyVec);                           //set position of ball
            worldTarget.normalize();                                 //normalize
            worldTarget.mulLocal((float) 10);                        //attractive force = 10N
            p.body.applyForce(worldTarget, bodyVec);                 //open attraction
        }
        for(Grain g:grains)             //attracted all grains
        {
            Vec2 worldTarget = box2d.coordPixelsToWorld(x,y);        //position of attraction point in the world
            Vec2 bodyVec = g.body.getWorldCenter();                  //position of grain's body in the world
            worldTarget.subLocal(bodyVec);                           //set position of grain
            worldTarget.normalize();                                 //normalize
            worldTarget.mulLocal((float) 10);                        //attractive force = 10N
            g.body.applyForce(worldTarget, bodyVec);                 //open attraction
        }
    }
    void move(float x_,float y_)                //follow with mouse
    {
        x=x_;
        y=y_;
    }
}