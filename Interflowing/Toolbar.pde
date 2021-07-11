class Toolbar
{
    float x,y,w,h,moveX,moveY;                                                //position & position of mouse in the toolbar
    boolean pressed,deformedUp,deformedDown,deformedLeft,deformedRight;       //pessed? deformed?
    Toolbar(float x_,float y_,float w_,float h_)
    {
        x=x_;
        y=y_;
        w=w_;
        h=h_;
        pressed=deformedUp=deformedDown=deformedLeft=deformedRight=false;     //initialization
    }
    int barPressed()
    {
        if(!toolOver(1))
        {
            moveX=mouseX-x;
            moveY=mouseY-y;
            pressed=true;
            if(mouseY>=y+h-10)
            {
                deformedDown=true;
            }
            if(mouseX>=x+w-10)
            {
                deformedRight=true;
            }
            if(mouseY<y+10)
            {
                deformedUp=true;
            }
            if(mouseX<=x+10)
            {
                deformedLeft=true;
            }
        }
        for(int i=0;i<buttons.size();i++)
         {
             Button b=buttons.get(i);
             if(b.buttonOver())
             { 
                 b.buttonPressed();
                 deformedLeft=deformedUp=deformedRight=deformedDown=pressed=false;
                 if(newButton[i]||i==CHOOSE)
                 {
                     if(i!=CHOOSE&&buttons.get(CHOOSE).check&&numOfChoose==-1)
                     {
                         buttons.get(CHOOSE).check=false;
                     }
                     for(int j=0;j<=numOfButton;j++)
                     {
                         if(newButton[j]&&j!=i&&!buttons.get(SETTING).check)
                         {
                             buttons.get(j).check=false;
                         }
                     }
                 }
                 return i;
             }
         }
         if(buttons.get(SETTING).check)
         {
             numOfPropertyPressed=buttons.get(numOfButtonPressed).propertiesOver(x+w,y);
             return numOfButtonPressed;
         }
         return -1;
    }
    boolean toolOver(int t)
    {
        if(!buttons.get(SETTING).check)
        {
            return false;
        }
        t=buttons.get(numOfButtonPressed).properties.size();
        if(mouseX>=x+w&&mouseY>=y&&mouseX<=x+w+150&&mouseY<=y+t*45+62)
        {
            return true;
        }
        return false;
    }
    boolean toolOver()
    {
        if(mouseX>=x&&mouseX<=x+w&&mouseY>=y&&mouseY<=y+h)
        {
            return true;
        }
        return false;
    }
    void display()
    {
        if(buttons.get(SETTING).check)
        {
            image(imgSet_1,x,y,w,h);
            if(numOfButtonPressed!=-1)
            {
                buttons.get(numOfButtonPressed).propertiesDisplay(x+w,y);
            }
        }
        else
        {
            image(imgBar,x,y,w,h);    
        }
        build();
    }
    void build()
    {
        int numX,numY;
        float whiteX,whiteY;
        for(numX=1;numX*120+20<=w;numX++);
        for(numY=1;numY*82+20<=h;numY++);
        numX--;
        numY--;
        whiteX=(w-numX*100)/(numX+1);
        whiteY=(h-numY*62)/(numY+1);
        int bitX=0,bitY=0;
        for(Button b:buttons)
        {
            if(bitY>=numY)
            {
                b.buttonMove(-10000,-10000);
                continue;
            }
            b.buttonMove(x+whiteX*(bitX+1)+bitX*100,y+whiteY*(bitY+1)+bitY*62);
            if(b.pressed||b.check)
            {
                b.display(PRESSED);
            }
            else if(b.buttonOver())
            {
                b.display(OVER);
            }
            else
            {
                b.display(USU);
            }
            if(++bitX>=numX)
            {
                bitX=0;
                ++bitY;
            }
        }
    }
    void move()
    {
        x=mouseX-moveX;
        y=mouseY-moveY;
        build();
    } 
    void distortion()
    {
        if(deformedDown)
        {
            if(mouseY-y<102)
            {
                h=102;
            }
            else
            {
                h=mouseY-y;
            }
        }
        if(deformedRight)
        {
            if(mouseX-x<140)
            {
                w=140;
            }
            else
            {
                w=mouseX-x;
            }
        }
        if(deformedUp)
        {
            if(h+y-mouseY<102)
            {
                h=102;
            }
            else
            {
                h+=y-mouseY;
                y=mouseY;
            }
        }
        if(deformedLeft)
        {
            if(w+x-mouseX<140)
            {
                w=140;
            }
            else
            {
                w+=x-mouseX;
                x=mouseX;
            }
        }
        build();
    }
}