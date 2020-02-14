static final int USU=0;
static final int OVER=1;
static final int PRESSED=2;
                                       //define
class Button
{
    float x,y,w,h;                     //position & width & height
    ArrayList<Property> properties;
    boolean check,pressed;
    /*
        check:button has been turned on?
        pressed:button has been pressed?
    */
    PImage imageU,imageO,imageP,imageH;
    /*
        U:usual
        O:over
        P:pressed
    */
    Button(PImage imageU_,PImage imageO_,PImage imageP_,PImage imageH_)     //get images form img1...img3
    {
        properties=new ArrayList<Property>();
        imageU=imageU_;
        imageO=imageO_;
        imageP=imageP_;
        imageH=imageH_;
        w=100;
        h=62;                          //initialization
        check=pressed=false;           //turn off the button
    }
    void buttonPressed()
    {
        pressed=true;                  //button has been pressed
        display(PRESSED);              //display "PRESSED"
    }
    boolean buttonOver()
    {
        if(mouseX>=x&&mouseX<=x+w&&mouseY>=y&&mouseY<=y+h)    //mouse is over the button?
        {
            return true;
        }
        return false;
    }
    boolean buttonReleased()
    {
        pressed=false;                 //mouse has released when it over the button
        if(buttonOver())
        {
            check=check?false:true;    //change state
            return true;
        }
        else return false;
    }
    void buttonMove(float moveToX,float moveToY)              //button follow with toolbar
    {
        x=moveToX;
        y=moveToY;
    }
    void display(int v)                //display the button in true state
    {
        if(v==USU)
        {
            image(imageU,x,y,w,h);
        }
        if(v==PRESSED) 
        {
            image(imageP,x,y,w,h);
        }
        if(v==OVER)
        {
            image(imageO,x,y,w,h);
        }
    }
    void propertiesDisplay(float x_,float y_)
    {
        image(imgSet_2,x_,y_,150,h);
        image(imageH,x_+25,y_,w,h);
        for(int i=properties.size()-1;i>=0;i--)
        {
            properties.get(i).display(x_,y_+h+i*45);
        }
    }
    int propertiesOver(float x_,float y_)
    {
        for(int i=properties.size()-1;i>=0;i--)
        {
            if(properties.get(i).over(x_,y_+h+i*45))
            {
                return i;
            }
        }
        return -1;
    }
    void addProperty(String propertyName)
    {
        img1=loadImage(propertyName+"_1.png");
        img2=loadImage(propertyName+"_2.png");
        img3=loadImage(propertyName+"_3.png");
        properties.add(new Property(img1,img2,img3,this));
    }
    void addProperty(String propertyName,boolean o)
    {
        img1=loadImage(propertyName+"_1.png");
        img2=loadImage(propertyName+"_2.png");
        img3=loadImage(propertyName+"_3.png");
        properties.add(new Property(img1,img2,img3,this,o));
    }
}
void checkButton()
{
    if(buttons.get(SETTING).check)
    {
        if(buttons.get(numOfButtonPressed).buttonReleased()&&numOfButtonPressed!=SETTING)
        {
            buttons.get(numOfButtonPressed).buttonReleased();
        }
        else
        {
            numOfPropertyPressed=-1;
            return;
        }
        
    }
    else if(buttons.get(numOfButtonPressed).buttonReleased())    //judge button which was pressed will be check or not
    {
        if(numOfButtonPressed==PAUSE)
        {
            if(buttons.get(numOfButtonPressed).check)
            {
                oStep=false;
                if(buttons.get(RECORD).check)
                {
                    if(!oTimer)
                    {
                        output.print("        case "+timer+": ");
                        oTimer=true;
                    }
                    output.print("\n            oStep=false;");
                }
            }
            else
            {
                oStep=true;
                if(buttons.get(RECORD).check)
                {
                    if(!oTimer)
                    {
                        output.print("        case "+timer+": ");
                        oTimer=true;
                    }
                    output.print("\n            oStep=true;");
                }
            }
        }
        if(numOfButtonPressed==ATTRACTION)
        {
            if(buttons.get(numOfButtonPressed).check)
            {
                oAtt=true;
                if(buttons.get(RECORD).check)
                {
                    if(!oTimer)
                    {
                        output.print("        case "+timer+": ");
                        oTimer=true;
                    }
                    output.print("\n            oAtt=true;");
                }
            }
            else
            {
                oAtt=false;
                if(buttons.get(RECORD).check)
                {
                    if(!oTimer)
                    {
                        output.print("        case "+timer+": ");
                        oTimer=true;
                    }
                    output.print("\n            oAtt=false;");
                }
            }
        }
        if(numOfButtonPressed==CLEAR)                             //CLEAR : remove all bodies and dots
        {
            if(buttons.get(RECORD).check)
            {
                if(!oTimer)
                {
                    output.print("        case "+timer+": ");
                    oTimer=true;
                }
                output.print("\n            numOfChoose=-1;\n            for (int i = paddles.size()-1; i >= 0; i--)\n            {\n                Paddle p = paddles.get(i);\n                box2d.destroyBody(p.body);\n                paddles.remove(i);\n            }\n            for (int i = particles.size()-1; i >= 0; i--)\n            {\n                Particle p = particles.get(i);\n                box2d.destroyBody(p.body);\n                particles.remove(i);\n            }\n            for(int i = dots.size()-1; i >= 0; i--)\n            {\n                dots.remove(i);\n            }\n            for(int i = boxes.size()-1; i >= 0; i--)\n            {\n                Box b = boxes.get(i);\n                box2d.destroyBody(b.body);\n                boxes.remove(i);\n            }\n            for(int i = grains.size()-1; i >= 0; i--)\n            {\n                Grain g = grains.get(i);\n                box2d.destroyBody(g.body);\n                grains.remove(i);\n            }\n            for(int i=lines.size()-1;i>=0;i--)\n            {  \n                Surface s=lines.get(i);\n                box2d.destroyBody(s.body);\n                lines.remove(i);\n            }");
            }
            buttons.get(numOfButtonPressed).check=false;
            buttons.get(CHOOSE).check=false;
            numOfChoose=-1;
            typeOfChoose=-1;
            for(int i=slingshots.size()-1;i>=0;i--)    //codes are not recorded
            {
                slingshots.remove(i);
            }
            for(int i=paddles.size()-1;i>=0;i--)
            {
                Paddle p=paddles.get(i);
                p.killBody();
                paddles.remove(i);
            }
            for (int i = particles.size()-1; i >= 0; i--)
            {
                Particle p = particles.get(i);
                box2d.destroyBody(p.body);
                particles.remove(i);
            }
            for(int i=bridges.size()-1;i>=0;i--)
            {
                Bridge b=bridges.get(i);
                b.killBody();
                bridges.remove(i);
            }
            for (int i = bombs.size()-1; i >= 0; i--)
            {
                Bomb b = bombs.get(i);
                box2d.destroyBody(b.body);
                bombs.remove(i);
            }
            for(int i = dots.size()-1; i >= 0; i--)
            {
                dots.remove(i);
            }
            for(int i = boxes.size()-1; i >= 0; i--)
            {
                Box b = boxes.get(i);
                box2d.destroyBody(b.body);
                boxes.remove(i);
            }
            for(int i = grains.size()-1; i >= 0; i--)
            {
                Grain g = grains.get(i);
                box2d.destroyBody(g.body);
                grains.remove(i);
            }
            for(int i=lines.size()-1;i>=0;i--)
            {  
                Surface s=lines.get(i);
                box2d.destroyBody(s.body);
                lines.remove(i);
            }
            for(int i=rockers.size()-1;i>=0;i--)
            {
                rockers.remove(i);
            }
        }
        if(numOfButtonPressed==G)                                //G : set gravity
        {
            if(buttons.get(RECORD).check&&!oTimer)  
            {
                output.print("        case "+timer+": ");
                oTimer=true;
            }
            if(buttons.get(numOfButtonPressed).check)
            {
                if(buttons.get(RECORD).check)
                {
                    output.print("\n                box2d.setGravity(0,-50);\n                for(Particle p:particles)\n                {\n                    p.body.applyForce(new Vec2(0,0.0001), p.body.getWorldCenter());      //a bit of force\n                }\n                for(Box b:boxes)\n                {\n                    b.body.applyForce(new Vec2(0,0.0001), b.body.getWorldCenter());      //a bit of force  \n                }\n                for(Grain g:grains)\n                {\n                    g.body.applyForce(new Vec2(0,0.0001), g.body.getWorldCenter());      //a bit of force\n                }\n                for(Bridge b:bridges)\n                {\n                    b.particles.get(b.numPoints/2).body.applyForce(new Vec2(0,0.0001), b.particles.get(b.numPoints/2).body.getWorldCenter());    //a bit of force\n                }\n                for(Bomb b:bombs)\n                {\n                    b.body.applyForce(new Vec2(0,0.0001), b.body.getWorldCenter());      //a bit of force\n                }");
                }
                box2d.setGravity(0,-50);
                for(Particle p:particles)
                {
                    p.body.applyForce(new Vec2(0,0.0001), p.body.getWorldCenter());      //a bit of force
                }
                for(Box b:boxes)
                {
                    b.body.applyForce(new Vec2(0,0.0001), b.body.getWorldCenter());      //a bit of force  
                }
                for(Grain g:grains)
                {
                    g.body.applyForce(new Vec2(0,0.0001), g.body.getWorldCenter());      //a bit of force
                }
                for(Bridge b:bridges)
                {
                    b.particles.get(b.numPoints/2).body.applyForce(new Vec2(0,0.0001), b.particles.get(b.numPoints/2).body.getWorldCenter());    //a bit of force
                }
                for(Bomb b:bombs)
                {
                    b.body.applyForce(new Vec2(0,0.0001), b.body.getWorldCenter());      //a bit of force
                }
                
            }
            else
            {
                if(buttons.get(RECORD).check)
                {
                    output.print("\n                box2d.setGravity(0,0);");
                }
                box2d.setGravity(0,0);
            }
        }
        if(numOfButtonPressed==ELASTICITY)                       //ELASTICITY : set balls' elasticity
        {
            if(buttons.get(RECORD).check&&!oTimer)  
            {
                output.print("        case "+timer+": ");
                oTimer=true;
            }
            if(buttons.get(numOfButtonPressed).check)
            {
                if(buttons.get(RECORD).check)
                {
                    output.print("\n                Restitution=1;                                   //change restitution\n                for(Particle p:particles)\n                {\n                    p.fd.setRestitution(1);\n                    p.body.createFixture(p.fd);                  //change all balls\' restitution\n                }");
                }
                Restitution=1;                                   //change restitution
                for(Particle p:particles)
                {
                    p.fd.setRestitution(1);
                    p.body.createFixture(p.fd);                  //change all balls' restitution
                }
            }
            else
            {
                if(buttons.get(RECORD).check)
                {
                    output.print("\n                Restitution=0;                                   //change restitution\n                for(Particle p:particles)\n                {\n                    p.fd.setRestitution(0);\n                    p.body.createFixture(p.fd);\n                    Vec2 pos = box2d.getBodyPixelCoord(p.body);\n                    Vec2 vel=p.body.getLinearVelocity();\n                    float a = p.body.getAngle();\n                    box2d.destroyBody(p.body);\n                    p.makeBody(pos.x,pos.y,p.r);\n                    p.body.setLinearVelocity(vel);\n                    p.body.setTransform(p.body.getPosition(),a);\n                                                                 //make a new bodies for evey ball  \n                }");
                }
                Restitution=0;                                   //change restitution
                for(Particle p:particles)
                {
                    p.fd.setRestitution(0);
                    p.body.createFixture(p.fd);
                    Vec2 pos = box2d.getBodyPixelCoord(p.body);
                    Vec2 vel=p.body.getLinearVelocity();
                    float a = p.body.getAngle();
                    box2d.destroyBody(p.body);
                    p.makeBody(pos.x,pos.y,p.r, 0.005,BodyType.DYNAMIC);
                    p.body.setLinearVelocity(vel);
                    p.body.setTransform(p.body.getPosition(),a);
                                                                 //make a new bodies for evey ball  
                }
            }  
        }
        if(numOfButtonPressed==WALL)                             //WALL : build a wall to surround the background
        {
            if(buttons.get(RECORD).check&&!oTimer)  
            {
                output.print("        case "+timer+": ");
                oTimer=true;
            }
            if(buttons.get(numOfButtonPressed).check)
            {
                if(buttons.get(RECORD).check)
                {
                    output.print("\n                surfaces.add(new Vec2(0,0));\n                surfaces.add(new Vec2(0,height));\n                surfaces.add(new Vec2(width,height));\n                surfaces.add(new Vec2(width,0));\n                surfaces.add(new Vec2(0,0));\n                wall=new Surface();                              //add a wall just like add a line or surface\n                for(int i=surfaces.size()-1;i>=0;i--)\n                {\n                    surfaces.remove(i);                          //cleaned out the surfaces\n                }");
                }
                surfaces.add(new Vec2(0,0));
                surfaces.add(new Vec2(0,height));
                surfaces.add(new Vec2(width,height));
                surfaces.add(new Vec2(width,0));
                surfaces.add(new Vec2(0,0));
                wall=new Surface();                              //add a wall just like add a line or surface
                for(int i=surfaces.size()-1;i>=0;i--)
                {
                    surfaces.remove(i);                          //cleaned out the surfaces
                }
            }
            else
            {
                if(buttons.get(RECORD).check)
                {
                    output.print("\n                box2d.destroyBody(wall.body);                    //break the wall");
                }
                box2d.destroyBody(wall.body);                    //break the wall
            }
        }
        if(numOfButtonPressed==CHOOSE)                           //CHOOSE : choose a ball or a dot
        {
            if(!buttons.get(numOfButtonPressed).check)
            {
                numOfChoose=-1;                                  //initialization
                typeOfChoose=-1;
                for(Slingshot s:slingshots)
                {
                    s.clean();
                }
            }
        }
        if(numOfButtonPressed==RECORD)
        {
            if(buttons.get(numOfButtonPressed).check)
            {
                oAtt=false; 
                for (int i = particles.size()-1; i >= 0; i--)
                {
                    Particle p = particles.get(i);
                    box2d.destroyBody(p.body);
                    particles.remove(i);
                }
                for(int i = dots.size()-1; i >= 0; i--)
                {
                    dots.remove(i);
                }
                for(int i=paddles.size()-1; i >= 0; i--)
                {
                    paddles.get(i).killBody();
                    paddles.remove(i);
                }
                for(int i = boxes.size()-1; i >= 0; i--)
                {
                    Box b = boxes.get(i);
                    box2d.destroyBody(b.body);
                    boxes.remove(i);
                }
                for(int i = grains.size()-1; i >= 0; i--)
                {
                    Grain g = grains.get(i);
                    box2d.destroyBody(g.body);
                    grains.remove(i);
                }
                for(int i=lines.size()-1;i>=0;i--)
                {  
                    Surface s=lines.get(i);
                    box2d.destroyBody(s.body);
                    lines.remove(i);
                }
                for(int i=bombs.size()-1;i>=0;i--)
                {
                    Bomb b=bombs.get(i);
                    box2d.destroyBody(b.body);
                    bombs.remove(i);
                }
                for(int i=bridges.size()-1;i>=0;i--)
                {
                    Bridge b=bridges.get(i);
                    b.killBody();
                    bridges.remove(i);
                }
                for(int i=rockers.size()-1;i>=0;i--)
                {
                    rockers.remove(i);
                }
                                                                    //delete all body
                if(buttons.get(G).check)
                {
                    box2d.setGravity(0,0);
                }
                if(buttons.get(ELASTICITY).check)
                {
                    Restitution=0;
                }
                if(buttons.get(WALL).check)
                {
                    box2d.destroyBody(wall.body);                   //break the wall
                }
                if(buttons.get(CHOOSE).check)
                {
                    numOfChoose=-1;
                }
                for(int i=buttons.size()-1;i>=0;i--) 
                {
                    if(buttons.get(i).check&&i!=RECORD)
                    {
                        buttons.get(i).check=false;
                    }
                }                                                  //turn off all button
                for(numOfFile=1;loadBytes("record\\record_"+numOfFile+"\\record_"+numOfFile+".pde")!=null;numOfFile++);
                timer=0;
                printF();
            }
            else 
            {
                saveData="\n    }\n    Display();\n}\n";
                output.print(saveData);
                output.flush();     // writes the remaining data to the file
                output.close();     // finishes the file
            }
        }
    }
}