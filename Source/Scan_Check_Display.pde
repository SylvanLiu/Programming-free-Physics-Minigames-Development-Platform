static final int BALL=0;
static final int G=1;
static final int ELASTICITY=2;
static final int WALL=3;
static final int DOT=4;
static final int CLEAR=5;
static final int ATTRACTION=6;
static final int BOXES=7;
static final int SURFACE=8;
static final int SURFACE_LINE=9;
static final int GRAIN=10;
static final int ROCKER=11;
static final int PAUSE=12;
static final int CHOOSE=13;
static final int RECORD=14;
static final int ERASER=15;
static final int BOMB=16;
static final int BRIDGE=17;
static final int SETTING=18;
static final int PADDLE=19;
static final int SLINGSHOT=20;

//BALL
static final int BOX_KILLER=0;

//PADLLE
static final int FOLLOW=0;
static final int LATERAL_FREE=1;
static final int VERTICAL_FREE=2;

                                                    //define
void scanData()
{
    imgBar=loadImage("bar.png");
    imgSet_1=loadImage("set_1.png");
    imgSet_2=loadImage("set_2.png");
    imgBomb_1=loadImage("bomb_1.png");
    imgBomb_2=loadImage("bomb_2.png");
    imgBall_1=loadImage("ball_1.png");
    imgBall_2=loadImage("ball_2.png");
    imgBall_3=loadImage("ball_3.png");
    imgRocker_1=loadImage("rocker_1.png");
    imgRocker_2=loadImage("rocker_2.png");
    imgBridge=loadImage("bridge.png");
    imgBackground=loadImage("background.png");
    imgPaddle=loadImage("paddle.png");
    
    String[] buttonName={"newBall","G","FN","wall","newDot",
                         "clear","F","box","surface","line",
                         "grain","newRocker","pause","choose","record",
                         "eraser","newBomb","newBridge","setting","paddle",
                         "slingshot"};
    for(int i=0;i<buttonName.length;i++)
    {
        img1=loadImage(buttonName[i]+"_1.png");
        img2=loadImage(buttonName[i]+"_2.png");
        img3=loadImage(buttonName[i]+"_3.png");
        img4=loadImage(buttonName[i]+"_4.png");
        numOfButton++;
        buttons.add(new Button(img1,img2,img3,img4));
    }
    
    buttons.get(BALL).addProperty("box_killer");
    
    buttons.get(PADDLE).addProperty("follow");
    buttons.get(PADDLE).addProperty("lateral_free",true);
    buttons.get(PADDLE).addProperty("vertical_free");
    
                                                    //scan image of button
                                                    //you can add new button here
    for(int i=0;i<=numOfButton;i++)
    {
        newButton[i]=false;
    }
    newButton[BALL]=true;
    newButton[DOT]=true;
    newButton[BOXES]=true;
    newButton[SURFACE]=true;
    newButton[SURFACE_LINE]=true;
    newButton[GRAIN]=true;
    newButton[ROCKER]=true;
    newButton[ERASER]=true;
    newButton[BOMB]=true;
    newButton[BRIDGE]=true;
    newButton[PADDLE]=true;
    newButton[SLINGSHOT]=true;
                                                    //if the button is "newButton" , please make a flag
    img1=loadImage("001.png");
    img2=loadImage("002.png");
    img3=loadImage("003.png");
    img4=loadImage("004.png");
    img5=loadImage("005.png");
                                                    //scan image of cursor
}
void Check()
{
    if(oStep)                   //step
    {    
        box2d.step();
        if(oAtt)                    //attraction
        {
            for(Dot d:dots)
            {
                d.attractionOn();
            }
        }
    }
    if(killed.size()!=0)
    {
        for(int i=killed.size()-1;i>=0;i--)
        {
            if(killed.get(i).getClass()==Box.class)
            {
                for(int j=boxes.size()-1;j>=0;j--)
                {
                    if(boxes.get(j)==(Box)killed.get(i))
                    {
                        box2d.destroyBody(boxes.get(j).body);
                        boxes.remove(j);
                        if(buttons.get(RECORD).check)
                        {
                            if(!oTimer)
                            {
                                output.print("        case "+timer+": ");
                                oTimer=true;
                            }
                            output.print("\n            boxes.get("+j+").killBody();\n            boxes.remove("+j+");");
                        }
                    }
                }
            }
            killed.remove(i);
        }
    }
    if(mousePressed)
    {
        if(buttons.get(ERASER).check&&!bar.toolOver())
        {
            for(int i=paddles.size()-1;i>=0;i--)
            {
                Paddle p=paddles.get(i);
                float boxX=box2d.getBodyPixelCoord(p.body).x;
                float boxY=box2d.getBodyPixelCoord(p.body).y;
                if((boxX-mouseX)*(boxX-mouseX)+(boxY-mouseY)*(boxY-mouseY)<=0.0004*width*height)
                {
                    p.killBody();
                    paddles.remove(i);
                    if(buttons.get(RECORD).check)
                    {
                        if(!oTimer)
                        {
                            output.print("        case "+timer+": ");
                            oTimer=true;
                        }
                        output.print("\n            paddles.get("+i+").killBody();\n            paddles.remove("+i+");");
                    }
                    if(typeOfChoose==PADDLE&&numOfChoose!=-1)
                    {
                        for(Slingshot s:slingshots)
                        {
                            if(s.check(typeOfChoose,numOfChoose))
                            {
                                if(i==numOfChoose)
                                {
                                    s.clean();
                                }
                                else if(i<numOfChoose)
                                {
                                    s.numOfStuff--;
                                }
                            }
                        }
                        if(i==numOfChoose)
                        {
                            numOfChoose=-1;
                            typeOfChoose=-1;
                            buttons.get(CHOOSE).check=false;
                            if(buttons.get(RECORD).check)
                            {
                                output.print("\n            numOfChoose=-1;");
                            }
                        }
                        else if(i<numOfChoose)
                        {
                            numOfChoose--;
                            if(buttons.get(RECORD).check)
                            {
                                output.print("\n            numOfChoose--;");
                            }
                        }
                    }
                }
            }
            for(int i=bridges.size()-1;i>=0;i--)
            {
                Bridge b=bridges.get(i);
                if((b.start.x-mouseX)*(b.start.x-mouseX)+(b.start.y-mouseY)*(b.start.y-mouseY)<=0.0004*width*height || (b.end.x-mouseX)*(b.end.x-mouseX)+(b.end.y-mouseY)*(b.end.y-mouseY)<=0.0004*width*height)
                {
                    b.killBody();
                    bridges.remove(i);
                    if(buttons.get(RECORD).check)
                    {
                        if(!oTimer)
                        {
                            output.print("        case "+timer+": ");
                            oTimer=true;
                        }
                        output.print("\n            bridges.get("+i+").killBody();\n            bridges.remove("+i+");");
                    }
                }
            }
            for (int i = particles.size()-1; i >= 0; i--)
            {
                Particle p = particles.get(i);
                float particleX=box2d.getBodyPixelCoord(p.body).x;
                float particleY=box2d.getBodyPixelCoord(p.body).y;
                if((particleX-mouseX)*(particleX-mouseX)+(particleY-mouseY)*(particleY-mouseY)<=0.0004*width*height)
                {
                    if(buttons.get(RECORD).check)
                    {
                        if(!oTimer)
                        {
                            output.print("        case "+timer+": ");
                            oTimer=true;
                        }
                        output.print("\n            box2d.destroyBody(particles.get("+i+").body);\n            particles.remove("+i+");");
                    }
                    if(typeOfChoose==BALL&&numOfChoose!=-1)
                    {
                        if(i==numOfChoose)
                        {
                            numOfChoose=-1;
                            typeOfChoose=-1;
                            buttons.get(CHOOSE).check=false;
                            if(buttons.get(RECORD).check)
                            {
                                output.print("\n            numOfChoose=-1;");
                            }
                        }
                        else if(i<numOfChoose)
                        {
                            numOfChoose--;
                            if(buttons.get(RECORD).check)
                            {
                                output.print("\n            numOfChoose--;");
                            }
                        }
                    }
                    box2d.destroyBody(p.body);
                    particles.remove(i);
                }
            }
            for(int i = slingshots.size()-1;i>=0;i--)
            {
                if((slingshots.get(i).x1-mouseX)*(slingshots.get(i).x1-mouseX)+(slingshots.get(i).y1-mouseY)*(slingshots.get(i).y1-mouseY)<=0.0004*width*height||
                   (slingshots.get(i).x2-mouseX)*(slingshots.get(i).x2-mouseX)+(slingshots.get(i).y2-mouseY)*(slingshots.get(i).y2-mouseY)<=0.0004*width*height)
                slingshots.remove(i);
            }
            for(int i = dots.size()-1; i >= 0; i--)
            {
                if((dots.get(i).x-mouseX)*(dots.get(i).x-mouseX)+(dots.get(i).y-mouseY)*(dots.get(i).y-mouseY)<=0.0004*width*height)
                {
                    if(buttons.get(RECORD).check)
                    {
                        if(!oTimer)
                        {
                            output.print("        case "+timer+": ");
                            oTimer=true;
                        }
                        output.print("\n            dots.remove("+i+");");
                    }
                    if(typeOfChoose==DOT&&numOfChoose!=-1)
                    {
                        if(i==numOfChoose)
                        {
                            if(buttons.get(RECORD).check)
                            {
                                output.print("\n            numOfChoose=-1;\n            oDot=false;");
                            }
                            buttons.get(CHOOSE).check=false;
                            numOfChoose=-1;
                            typeOfChoose=-1;
                        }
                        else if(i<numOfChoose)
                        {
                            if(buttons.get(RECORD).check)
                            {
                                output.print("\n            numOfChoose=--;");
                            }
                            numOfChoose--;
                        }
                    }
                    dots.remove(i);
                }
            }
            for(int i = boxes.size()-1; i >= 0; i--)
            {
                Box b = boxes.get(i);
                float boxX=box2d.getBodyPixelCoord(b.body).x;
                float boxY=box2d.getBodyPixelCoord(b.body).y;
                if((boxX-mouseX)*(boxX-mouseX)+(boxY-mouseY)*(boxY-mouseY)<=0.0004*width*height)
                {
                    if(buttons.get(RECORD).check)
                    {
                        if(!oTimer)
                        {
                            output.print("        case "+timer+": ");
                            oTimer=true;
                        }
                        output.print("\n            box2d.destroyBody(boxes.get("+i+").body);\n            boxes.remove("+i+");");
                    }
                    box2d.destroyBody(b.body);
                    boxes.remove(i);
                }
            }
            for(int i = grains.size()-1; i >= 0; i--)
            {
                Grain g = grains.get(i);
                float grainX=box2d.getBodyPixelCoord(g.body).x;
                float grainY=box2d.getBodyPixelCoord(g.body).y;
                if((grainX-mouseX)*(grainX-mouseX)+(grainY-mouseY)*(grainY-mouseY)<=0.0004*width*height)
                {
                    if(buttons.get(RECORD).check)
                    {
                        if(!oTimer)
                        {
                            output.print("        case "+timer+": ");
                            oTimer=true;
                        }
                        output.print("\n            box2d.destroyBody(grains.get("+i+").body);\n            grains.remove("+i+");");
                    }
                    box2d.destroyBody(g.body);
                    grains.remove(i);
                }
            }
            for(int i=lines.size()-1;i>=0;i--)
            {  
                Surface s=lines.get(i);
                if(s.split(mouseX,mouseY))
                {
                    if(buttons.get(RECORD).check)
                    {
                        if(!oTimer)
                        {
                            output.print("        case "+timer+": ");
                            oTimer=true;
                        }
                        output.print("\n            if(lines.get("+i+").split("+mouseX+","+mouseY+"));\n            box2d.destroyBody(lines.get("+i+").body);\n            lines.remove("+i+");");
                    }
                    box2d.destroyBody(s.body);
                    lines.remove(i);
                }
            }
            for(int i=rockers.size()-1;i>=0;i--)
            {
                if((rockers.get(i).x*width-mouseX)*(rockers.get(i).x*width-mouseX)+(rockers.get(i).y*height-mouseY)*(rockers.get(i).y*height-mouseY)<=0.0004*width*height)
                {
                    rockers.remove(i);
                }
            }
        }
        Adding();                                    //display the demo and get the shape data from mouse position
        Move();                                      //move something which is ready to move
    }
    moveWithoutPressed();
}
void Display()
{
    
    for(int i = boxes.size()-1; i >= 0; i--)
    {
        Box b = boxes.get(i);
        if (b.done())
        {
            boxes.remove(i);
        }
    }                                                //check boxes
    for(int i = particles.size()-1; i >= 0; i--)
    {
        Particle p = particles.get(i);
        if (p.done())
        {
            if(typeOfChoose==BALL&&numOfChoose!=-1)
            {
                if(i==numOfChoose)
                {
                    buttons.get(CHOOSE).check=false;
                    numOfChoose=-1;
                    typeOfChoose=-1;
                }
                else if(i<numOfChoose)
                {
                    numOfChoose--;
                }
            }
            particles.remove(i);
        }
    }                                               //check balls and numOfChoose
    for(int i = bombs.size()-1; i >= 0; i--)
    {
        Bomb b = bombs.get(i);
        if (b.done())
        {
            bombs.remove(i);
        }
        float pX=0,bX=0,pY=0,bY=0;
        if(b.time--==0)
        {
            for(int j = particles.size()-1; j >= 0; j--)
            {
                pX=box2d.getBodyPixelCoord(particles.get(j).body).x;
                bX=box2d.getBodyPixelCoord(b.body).x;
                pY=box2d.getBodyPixelCoord(particles.get(j).body).y;
                bY=box2d.getBodyPixelCoord(b.body).y;
                if((pX-bX)*(pX-bX)+(pY-bY)*(pY-bY)<=b.r*b.r*9)
                {
                    particles.get(j).body.applyForce(new Vec2((pX-bX)*10,(bY-pY)*10), particles.get(j).body.getWorldCenter());
                }
            }
            for(int j = grains.size()-1; j >= 0; j--)
            {
                pX=box2d.getBodyPixelCoord(grains.get(j).body).x;
                bX=box2d.getBodyPixelCoord(b.body).x;
                pY=box2d.getBodyPixelCoord(grains.get(j).body).y;
                bY=box2d.getBodyPixelCoord(b.body).y;
                if((pX-bX)*(pX-bX)+(pY-bY)*(pY-bY)<=b.r*b.r*9)
                {
                    grains.get(j).body.applyForce(new Vec2((pX-bX)*10,(bY-pY)*10), grains.get(j).body.getWorldCenter());
                }
            }
            box2d.destroyBody(b.body);
            bombs.remove(i);
        }
    }
    for(int i = grains.size()-1; i >= 0; i--)
    {
        Grain g = grains.get(i);
        if (g.done())
        {
            grains.remove(i);
        }
    }                                               //check grains
    for(Slingshot s:slingshots)
    {
        s.display();
    }
    for(Rocker r:rockers)
    {
        r.display();
    }    
    for(Bomb b:bombs)
    {
        b.display();
    }                                               //display bombs
    for(Paddle p:paddles)
    {
        p.display();
    }                                               //display paddles
    for(Dot d:dots)
    {
        d.display();
    }                                               //display dots
    for(Surface s:lines)
    {
        s.display();
    }                                               //display lines
    for(Particle p:particles)
    {
        p.display(); 
    }                                               //display balls
    for(Grain g:grains)
    {
        g.display(); 
    }                                               //display grains
    for(Box b:boxes)
    {
        b.display(); 
    }                                               //display boxes
    for(Bridge b:bridges)                           //display bridges
    {
        b.display();
    }                                             //display rockers
    if(buttons.get(WALL).check)
    {
        wall.display();
    }                                               //display the wall
    if(!bar.toolOver())
    {
        if(buttons.get(DOT).check)
        {
            strokeWeight(1);
            noFill();
            ellipse(mouseX, mouseY, 5, 5);
            ellipse(mouseX,mouseY, 10, 10);
            line(mouseX-5,mouseY,mouseX+5,mouseY);
            line(mouseX,mouseY-5,mouseX,mouseY+5);
        }                                           //display the demo of dot
        if(buttons.get(ROCKER).check)
        {
            noFill();
            strokeWeight(1);
            ellipse(mouseX,mouseY,0.08*sqrt(width*height)*2,0.08*sqrt(width*height)*2);  
            ellipse(mouseX,mouseY,0.04*sqrt(width*height)*2,0.04*sqrt(width*height)*2);
        }                                          //display the demo of rocker
        if(buttons.get(ERASER).check)
        {
            strokeWeight(1);
            noFill();
            ellipse(mouseX,mouseY,0.02*sqrt(width*height)*2,0.02*sqrt(width*height)*2);
        }                                          //display the demo of eraser
    }
    if(numOfChoose!=-1)
    {
        strokeWeight(2);
        noFill();
        switch (typeOfChoose)
        {
            case DOT:
                ellipse(dots.get(numOfChoose).x,dots.get(numOfChoose).y,50,50);
                line(dots.get(numOfChoose).x-25,dots.get(numOfChoose).y,dots.get(numOfChoose).x+25,dots.get(numOfChoose).y);
                line(dots.get(numOfChoose).x,dots.get(numOfChoose).y-25,dots.get(numOfChoose).x,dots.get(numOfChoose).y+25);
                break;
            case BALL:
                if(numOfChoose<particles.size())
                {
                    Particle pa=particles.get(numOfChoose);
                    Vec2 p = box2d.getBodyPixelCoord(pa.body); 
                    line(p.x-pa.r,p.y-pa.r,p.x+pa.r,p.y-pa.r);
                    line(p.x-pa.r,p.y-pa.r,p.x-pa.r,p.y+pa.r);
                    line(p.x+pa.r,p.y+pa.r,p.x+pa.r,p.y-pa.r);
                    line(p.x+pa.r,p.y+pa.r,p.x-pa.r,p.y+pa.r);       //display chooser
                }
                break;
            case PADDLE:
                Paddle pa=paddles.get(numOfChoose);
                Vec2 p = box2d.getBodyPixelCoord(pa.body);
                line(p.x-pa.w/2,p.y-pa.h/2,p.x-pa.w/2,p.y+pa.h/2);
                line(p.x-pa.w/2,p.y+pa.h/2,p.x+pa.w/2,p.y+pa.h/2);
                line(p.x+pa.w/2,p.y+pa.h/2,p.x+pa.w/2,p.y-pa.h/2);
                line(p.x-pa.w/2,p.y-pa.h/2,p.x+pa.w/2,p.y-pa.h/2);
                break;
        }
    }
    bar.display();                                 //display the toolbar
}