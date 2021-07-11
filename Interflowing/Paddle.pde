class Paddle
{
    float w,h;
    Body body;
    FixtureDef fd;

    Paddle(float x, float y,float w_,float h_)                    //scan position & shape data
    {
        w = w_;                                                //initialization
        h = h_;                                                //initialization
        fd = new FixtureDef(); 
        makeBody(x,y,w,h);
    }
    
    void makeBody(float x, float y, float w,float h)                //make body just like grain
    {
        BodyDef bd = new BodyDef();
        PolygonShape sd = new PolygonShape();
        bd.position = box2d.coordPixelsToWorld(x, y);
        sd.setAsBox(box2d.scalarPixelsToWorld(w/2), box2d.scalarPixelsToWorld(h/2));
        fd.shape=sd;
        bd.type = BodyType.STATIC; 
        body = box2d.createBody(bd);
        body.createFixture(fd);
        body.setUserData(this);
    }
    
    void display() 
    {
        Vec2 pos = box2d.getBodyPixelCoord(body);          //get the position of body now
        pushMatrix();                                      //push
        translate(pos.x,pos.y);                            //(0,0) -> position
        rectMode(CENTER);                                  //display from center
        image(imgPaddle,-w/2,-h/2,w,h);
        popMatrix();                                       //pop
    }
    
    void killBody()
    {
        box2d.destroyBody(body);
    }
    
    boolean over()
    {
        if(mouseX>=box2d.getBodyPixelCoord(body).x-w/2&&mouseX<=box2d.getBodyPixelCoord(body).x+w/2&&mouseY>=box2d.getBodyPixelCoord(body).y-h/2&&mouseY<=box2d.getBodyPixelCoord(body).y+h/2)
        {
            return true;
        }
        return false;
    }
    void move(float x,float y)
    {
            killBody();
            makeBody(x,y,w,h);
    }
}