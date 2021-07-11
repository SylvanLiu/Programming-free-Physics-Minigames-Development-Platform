class Property
{
    float w,h;
    PImage imageU,imageO,imageP;
    boolean check,pressed;
    Button master;
    Property(PImage imageU_,PImage imageO_,PImage imageP_,Button master_)
    {
        imageU=imageU_;
        imageO=imageO_;
        imageP=imageP_;
        master=master_;
        w=150;
        h=45;
        check=pressed=false;
    }
    Property(PImage imageU_,PImage imageO_,PImage imageP_,Button master_,boolean check_)
    {
        imageU=imageU_;
        imageO=imageO_;
        imageP=imageP_;
        master=master_;
        w=150;
        h=45;
        check=check_;
        pressed=false;
    }
    void display(float x,float y)
    {
        if(check||pressed)
        {
            image(imageP,x,y,w,h);
        }
        else if(over(x,y))      
        {
            image(imageO,x,y,w,h);
        }
        else
        {
            image(imageU,x,y,w,h);
        }
    }
    boolean over(float x,float y)
    {
        if(mouseX>=x&&mouseX<=x+w&&mouseY>=y&&mouseY<=y+h)
        {
            return true;
        }
        return false;
    }
    void pressed()
    {
        pressed=true;
    }
    boolean released(float x,float y)
    {
        if(over(x,y))
        {
            check=check?false:true;
            return true;
        }
        return false;
    }
}
void checkProperty()
{
    if(buttons.get(numOfButtonPressed).properties.get(numOfPropertyPressed).released(bar.x+bar.w,bar.y+numOfPropertyPressed*45+62))
    {
        switch(numOfButtonPressed)
        {
            case BALL:
            {
                switch(numOfPropertyPressed)
                {
                    case BOX_KILLER:
                    //record something
                    
                        break;
                }
            }
            break;
            case PADDLE:
            {
                switch(numOfPropertyPressed)
                {
                    case FOLLOW: 
                    //record something    
                        break;
                    case LATERAL_FREE: 
                    //record something    
                        break;
                    case VERTICAL_FREE: 
                    //record something    
                        break;
                }
            }
        }
    }
}