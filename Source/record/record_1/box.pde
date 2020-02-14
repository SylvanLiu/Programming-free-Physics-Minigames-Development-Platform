class Box 
{
    Body body;                                                 //box2D body
    float w,h;                                                 //width & height
    color col;                                                 //color
    Box(float x, float y,float w_,float h_,color col_)                    //scan position & shape data
    {
        w = w_;                                                //initialization
        h = h_;                                                //initialization
        col=col_;                                            //initialization
        BodyDef bd = new BodyDef();                            //apply memory for body defition
        bd.type = BodyType.DYNAMIC;                            //boxes are dynamic
        bd.position.set(box2d.coordPixelsToWorld(x,y));        //set position
        body = box2d.createBody(bd);                           //create body by defition
        PolygonShape sd = new PolygonShape();                  //apply memory for shape
        sd.setAsBox(box2d.scalarPixelsToWorld(w/2), box2d.scalarPixelsToWorld(h/2));      //set shape by width & height
        FixtureDef fd = new FixtureDef();                      //apply memory for fixture
        fd.shape = sd;                         //shape
        fd.density = 1;                        //density
        fd.friction = 0.3;                     //friction
        fd.restitution = 0.5;                  //elasticity
        body.createFixture(fd);                //set body physical property by fixture
    }
    boolean done() 
    {
        Vec2 pos = box2d.getBodyPixelCoord(body);              //get the position of body now
        if(pos.y > height+w*2||pos.y<-height||pos.x>width*2||pos.x<-width)  //when body go out of the world
        {
            box2d.destroyBody(body);                           //kill the body
            return true;
        }
        return false;
    }
    void display() 
    {
        strokeWeight(1);                                   //weight of stroke is 1
        Vec2 pos = box2d.getBodyPixelCoord(body);          //get the position of body now
        float a = body.getAngle();                         //get the acceleration of body now
        pushMatrix();                                      //push
        translate(pos.x,pos.y);                            //(0,0) -> position
        rotate(-a);                                        //rotate a
        fill(col);                                         //set the color of box
        stroke(0);                                         //set the color of stroke
        rectMode(CENTER);                                  //display from center
        rect(0,0,w,h);                                     //display the box
        popMatrix();                                       //pop
    }
    void killBody()
    {
        box2d.destroyBody(body);
    }
}