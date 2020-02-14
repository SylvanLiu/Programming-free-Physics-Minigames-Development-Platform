class Rocker
{
    float x,y,r,R;                                        //position & radius of button & radius of background
    boolean pressed;                                      //rocker is pressed?
    Vec2 a;                                               //rotation angle
    Rocker(float x_,float y_)
    {
        x=x_/width;                        
        y=y_/height;                               
        r=0.04;                                            
        R=0.08;
        a=new Vec2(0,0);                                  //initialization
    }
    void move(float x_,float y_)                          //follow mouse
    {
        a.x=x_-x*width;  
        a.y=y_-y*height;
        if(a.x*a.x+a.y*a.y>(R-r)*(R-r)*width*height)
        {
            if(a.x==0)
            {
                if(a.y>0) a.y=(R-r)*sqrt(width*height);
                else a.y=(r-R)*sqrt(width*height);
            }
            else
            {
                float m=a.y/a.x;
                if(a.x>0)
                {
                    a.x=sqrt((R-r)*(R-r)*width*height/(1+m*m));
                }
                else
                {
                    a.x=-sqrt((R-r)*(R-r)*width*height/(1+m*m));
                }
                a.y=a.x*m;  
            }   
        }                                                 //make sure that the button is in the bakcground
    }
    boolean over()
    {
        if((mouseX-x*width)*(mouseX-x*width)+(mouseY-y*height)*(mouseY-y*height)<=R*R*width*height)
        {
            return true;                                  //x^2 + y^2 <= r^2
        }
        return false;
    }
    void display()
    {
        noFill();
        strokeWeight(1);
        //ellipse(x*width,y*height,R*sqrt(width*height)*2,R*sqrt(width*height)*2);  
        //ellipse(x*width+a.x,y*height+a.y,r*sqrt(width*height)*2,r*sqrt(width*height)*2);
        pushMatrix();                                     //push
        translate(x*width, y*height);
        image(imgRocker_1,-R*sqrt(width*height),-R*sqrt(width*height),R*sqrt(width*height)*2,R*sqrt(width*height)*2);
        popMatrix();                                      //pop
        pushMatrix(); 
        translate(x*width+a.x, y*height+a.y);
        image(imgRocker_2,-r*sqrt(width*height),-r*sqrt(width*height),r*sqrt(width*height)*2,r*sqrt(width*height)*2);
        popMatrix(); 
                                                          //display
        /**************************************************************************************/
                                                          //you can add new function here
        if(numOfChoose!=-1&&(a.x>=0.1||a.x<=-0.1)&&(a.y>=0.1||a.y<=-0.1))
        {
            switch(typeOfChoose)
            {
                case DOT:
                    dots.get(numOfChoose).x+=a.x*0.2;
                    dots.get(numOfChoose).y+=a.y*0.2;
                    if(buttons.get(RECORD).check)
                    {
                        if(!oTimer)
                        {
                            output.print("        case "+timer+": ");
                            oTimer=true;
                        }
                        output.print("\n                    dots.get("+numOfChoose+").x+="+a.x*0.2+";\n                    dots.get("+numOfChoose+").y+="+a.y*0.2+";");
                    }
                    break;
                case BALL:
                    if(numOfChoose<particles.size())
                    {
                        particles.get(numOfChoose).body.applyForce(new Vec2(a.x*0.2,-a.y*0.2), particles.get(numOfChoose).body.getWorldCenter());
                        if(buttons.get(RECORD).check)
                        {
                            if(!oTimer)
                            {
                                output.print("        case "+timer+": ");
                                oTimer=true;
                            }
                            output.print("\n                    particles.get("+numOfChoose+").body.applyForce(new Vec2("+(a.x*0.2)+","+(-a.y*0.2)+"), particles.get("+numOfChoose+").body.getWorldCenter());");
                        }
                    }
                    break;
                case PADDLE:
                    Vec2 pos = box2d.getBodyPixelCoord(paddles.get(numOfChoose).body);
                    if(buttons.get(PADDLE).properties.get(VERTICAL_FREE).check||buttons.get(PADDLE).properties.get(LATERAL_FREE).check)
                    {
                        if(!buttons.get(PADDLE).properties.get(VERTICAL_FREE).check)
                        {
                            paddles.get(numOfChoose).move(pos.x+a.x*0.5,pos.y);
                            if(buttons.get(RECORD).check)
                            {
                                if(!oTimer)
                                {
                                    output.print("        case "+timer+": ");
                                    oTimer=true;
                                }
                                output.print("\n                    paddles.get("+numOfChoose+").move("+(pos.x+a.x*0.5)+","+pos.y+");");
                            }
                        }
                        else if(!buttons.get(PADDLE).properties.get(LATERAL_FREE).check)
                        {
                            paddles.get(numOfChoose).move(pos.x,pos.y+a.y*0.5);
                            if(buttons.get(RECORD).check)
                            {
                                if(!oTimer)
                                {
                                    output.print("        case "+timer+": ");
                                    oTimer=true;
                                }
                                output.print("\n                    paddles.get("+numOfChoose+").move("+pos.x+","+(pos.y+a.y*0.5)+");");
                            }
                        }
                        else
                        {
                            paddles.get(numOfChoose).move(pos.x+a.x*0.5,pos.y+a.y*0.5);
                            if(buttons.get(RECORD).check)
                            {
                                if(!oTimer)
                                {
                                    output.print("        case "+timer+": ");
                                    oTimer=true;
                                }
                                output.print("\n                    paddles.get("+numOfChoose+").move("+(pos.x+a.x*0.5)+","+(pos.y+a.y*0.5)+");");
                            }  
                        }
                    }
                    break;
            }
        }
        else if((a.x>=0.1||a.x<=-0.1)&&(a.y>=0.1||a.y<=-0.1))
        {
            for(Particle p:particles)
            {
                p.body.applyForce(new Vec2(a.x*0.2,-a.y*0.2), p.body.getWorldCenter());
            }
            if(buttons.get(RECORD).check)
            {
                if(!oTimer)
                {
                    output.print("        case "+timer+": ");
                    oTimer=true;
                }
                output.print("\n            for(Particle p:particles)\n            {\n                p.body.applyForce(new Vec2("+(a.x*0.2)+","+(-a.y*0.2)+"), p.body.getWorldCenter());\n            }");
            }
        }
    }
    void release()
    {
        pressed=false;
        a.x=a.y=0;                                        //initialization
    } 
}