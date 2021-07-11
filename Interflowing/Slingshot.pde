class Slingshot
{
    float x1,y1,x2,y2;
    float pressX,pressY;
    float pX,pY;
    int typeOfStuff,numOfStuff;
    Slingshot(float x1_,float y1_,float x2_,float y2_)
    {
        pressX=x1=x1_;
        pressY=y1=y1_;
        x2=x2_;
        y2=y2_;
        typeOfStuff=-1;
        numOfStuff=-1;
    }
    
    void move(float x,float y)
    {
        switch(typeOfStuff)
        {
            case BALL:
               particles.get(numOfChoose).body.applyForce(getForce(x,y), particles.get(numOfChoose).body.getWorldCenter());
               break;
            case BOXES:
               boxes.get(numOfChoose).body.applyForce(getForce(x,y), boxes.get(numOfChoose).body.getWorldCenter());
               break;
        }
        pX=pressX=x;
        pY=pressY=y;
    }
    
    
    
    
    void stuff(int typeOfStuff_,int numOfStuff_)
    {
        typeOfStuff=typeOfStuff_;
        numOfStuff=numOfStuff_;
        switch(typeOfStuff)
        {
            case BALL:
                particles.get(numOfStuff).moveTo((x1+x2)/2,(y1+y2)/2);
        }
    }
    
    
    
    boolean over(float x,float y)
    {
        if((x-x1)*(x-x1)+(y-y1)*(y-y1)<=400||(x-x2)*(x-x2)+(y-y2)*(y-y2)<=400)
        {
            return true;
        }
        return false;
    }
    
    boolean atWork()
    {
        float k=(y2-y1)/(x2-x1);
        float b=y2-k*x2;
        if(k*pX+b-pY>-0.001)
        {
            if(k*pressX+b-pressY>-0.001)
            {
                return true;
            }
        }
        else  if(k*pressX+b-pressY<0.001)
        {
            return true;
        }
        return false;
    }
    
    boolean check(int typeOfStuff_,int numOfStuff_)
    {
        if(typeOfStuff_==typeOfStuff&&numOfStuff_==numOfStuff)
        {
            return true;
        }
        return false;
    }
    
    void clean()
    {
        typeOfStuff=-1;
        numOfStuff=-1;
        pressX=x1;
        pressY=y1;
    }
    
    Vec2 getForce(float x_,float y_)
    {
        return new Vec2(((x1+x2)/2-x_)*100,-((y1+y2)/2-y_)*100);
    }
    
    void display()
    {
        switch(typeOfStuff)
        {
            case BALL:
                pressX=particles.get(numOfStuff).getX();
                pressY=particles.get(numOfStuff).getY();
        }
        if(!atWork())
        {
            clean();
        }
        if(typeOfStuff==-1&&pressX!=x1)
        {
            pressX=x1;
            pressY=y1;
        }
        strokeWeight(1);
        noFill();
        ellipse(x1,y1,5,5);
        ellipse(x2,y2,5,5);
        line(x1,y1,pressX,pressY);
        line(pressX,pressY,x2,y2);
    }
    
    void display(int t)
    {
        strokeWeight(1);
        noFill();
        ellipse(x1,y1,40,40);
        ellipse(x2,y2,40,40);
    }
}