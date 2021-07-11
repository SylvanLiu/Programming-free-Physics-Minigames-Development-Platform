void addOverInPressed()                            //dot and rocker are added in mousePressed()
{
    if(buttons.get(DOT).check)
    {
        dots.add(new Dot(mouseX,mouseY,5));        //add dot when mouse is pressed
        if(buttons.get(RECORD).check)
        {
            if(!oTimer)
            {
                output.print("        case "+timer+": ");
                oTimer=true;
            }
            output.print("\n                dots.add(new Dot("+mouseX+","+mouseY+",5));");
        }
    }
    if(buttons.get(ROCKER).check)
    {
        rockers.add(new Rocker(mouseX,mouseY));    //add rocker when mouse is pressed
        while(rockers.size()>=3)
        {
            rockers.remove(0);                 //only have 2 rockers
        }
    }
}
void readyToAdd()                                  //need to be prepared before add ball,box,surface or line
{
    if(buttons.get(BALL).check)                    //will ready to add ball if mouse is pressed
    {
        boxX=mouseX;
        boxY=mouseY;                               //get position of ball
        oParticle=true;
    }
    if(buttons.get(BOMB).check)                    //will ready to add bamb if mouse is pressed
    {
        boxX=mouseX;
        boxY=mouseY;                               //get position of ball
        oBomb=true;
    }
    if(buttons.get(BOXES).check)                   //will ready to add box if mouse is pressed
    {
        boxX=mouseX;
        boxY=mouseY;                               //get position of box
        oBox=true;
    }
    if(buttons.get(PADDLE).check)
    {
        boxX=mouseX;
        boxY=mouseY;
        oPaddle=true;
    }
    if(buttons.get(SLINGSHOT).check)
    {
        boxX=mouseX;
        boxY=mouseY;
        oSlingshot=true;
    }
    if(buttons.get(SURFACE).check)                 //will ready to add surface if mouse is pressed
    {
        surfaces.add(new Vec2(mouseX,mouseY));     //get the first position of surface
        oSurface=true;  
    }
    if(buttons.get(SURFACE_LINE).check)            //will ready to add line if mouse is pressed
    {
        surfaces.add(new Vec2(mouseX,mouseY));
        oLine=true;
        if(buttons.get(RECORD).check)
        {
            if(!oTimer)
            {
                output.print("        case "+timer+": ");
                oTimer=true;
            }
            output.print("surfaces.add(new Vec2("+mouseX+","+mouseY+"));");
        }
    }
    if(buttons.get(BRIDGE).check)
    {
        surfaces.add(new Vec2(mouseX,mouseY));
        oBridge=true;
        if(buttons.get(RECORD).check)
        {
            if(!oTimer)
            {
                output.print("        case "+timer+": ");
                oTimer=true;
            }
            output.print("surfaces.add(new Vec2("+mouseX+","+mouseY+"));");
        }
    }
}
void Adding()                                      //display the demo and get the shape data from mouse position
{
    if(oLine||oBridge)
    {
        strokeWeight(3);
        line(surfaces.get(0).x,surfaces.get(0).y,mouseX,mouseY); 
    }
    if(oSlingshot)
    {
        strokeWeight(1);
        noFill();
        ellipse(boxX,boxY,5,5);
        ellipse(mouseX,mouseY,5,5);
        line(boxX,boxY,mouseX,mouseY);
    }
    if(oBomb)
    {
        strokeWeight(1);
        noFill();
        ellipse(boxX, boxY,sqrt((boxX-mouseX)*(boxX-mouseX)+(boxY-mouseY)*(boxY-mouseY)) *2, sqrt((boxX-mouseX)*(boxX-mouseX)+(boxY-mouseY)*(boxY-mouseY))*2);
        line(mouseX,mouseY,boxX,boxY);
                                                        //display the demo
    }
    if(oParticle)
    { 
        strokeWeight(1);
        noFill();
        ellipse(boxX, boxY,sqrt((boxX-mouseX)*(boxX-mouseX)+(boxY-mouseY)*(boxY-mouseY)) *2, sqrt((boxX-mouseX)*(boxX-mouseX)+(boxY-mouseY)*(boxY-mouseY))*2);
        line(mouseX,mouseY,boxX,boxY);
                                                        //display the demo
    }
    if(oBox||oPaddle)
    {
        strokeWeight(1);
        rectMode(CORNER);
        noFill();
        if(boxX!=-1000&&boxY!=-1000)
        {
            rect(boxX,boxY,mouseX-boxX,mouseY-boxY);
        }                                  
                                                       //display the demo
    }
    if(oSurface)
    {
        strokeWeight(3);
        if(mouseX-surfaces.get(surfaces.size()-1).x>1||mouseX-surfaces.get(surfaces.size()-1).x<-1||mouseY-surfaces.get(surfaces.size()-1).y>1||mouseY-surfaces.get(surfaces.size()-1).y<-1)
        {
            surfaces.add(new Vec2(mouseX,mouseY));     //get the shape data from mouse position
        }
        for(int i=0;i<surfaces.size()-1;i++)
        {
            line(surfaces.get(i).x,surfaces.get(i).y,surfaces.get(i+1).x,surfaces.get(i+1).y);
        }
        line(surfaces.get(surfaces.size()-1).x,surfaces.get(surfaces.size()-1).y,mouseX,mouseY);
                                                       //display the demo
    }
    if(buttons.get(GRAIN).check&&!bar.toolOver()&&!bar.deformedDown&&!bar.deformedUp&&!bar.deformedLeft&&!bar.deformedRight)
    {
        for(int i=1;i<=3;i++)
        {
            grainR=random(3)+1;
            grainC_1=random(255);
            grainC_2=random(255);
            grainC_3=random(255);
            grains.add(new Grain(mouseX,mouseY,grainR,color(grainC_1,grainC_2,grainC_3)));          //add grains when mouse is pressed
            if(buttons.get(RECORD).check)
            {
                if(!oTimer)
                {
                    output.print("        case "+timer+": ");
                    oTimer=true;
                }
                output.print("\n                grains.add(new Grain("+mouseX+","+mouseY+","+grainR+",color("+grainC_1+","+grainC_2+","+grainC_3+")));");
            }
        }
    }
}
void addOverInReleased()                               //box , ball , surface and line are added in mouseReleased()
{
    if(oSlingshot)
    {
        slingshots.add(new Slingshot(boxX,boxY,mouseX,mouseY));
        oSlingshot=false;
        //somthing ab
    }
    if(oBox)
    {
        strokeWeight(1);
        float tx,ty;
        if(boxX>mouseX)
        {
            tx=boxX;boxX=mouseX;
        }
        else
        {
            if(boxX==mouseX)
            {
                boxX=mouseX-1; 
            }
            tx=mouseX;
        }
        if(boxY>mouseY)
        {
            ty=boxY;boxY=mouseY;
        }
        else
        {
            if(boxY==mouseY)
            {
                boxY=mouseY-1;
            }
            ty=mouseY;
        }
                                                                              //make sure the box's data is valid
        grainC_1=random(255);
        grainC_2=random(255);
        grainC_3=random(255);
        boxes.add(new Box(boxX/2+tx/2,boxY/2+ty/2,tx-boxX,ty-boxY,color(grainC_1,grainC_2,grainC_3)));          //add box
        if(buttons.get(RECORD).check)
        {
            if(!oTimer)
            {
                output.print("        case "+timer+": ");
                oTimer=true;
            }
            output.print("\n                boxes.add(new Box("+(boxX/2+tx/2)+","+(boxY/2+ty/2)+","+(tx-boxX)+","+(ty-boxY)+",color("+grainC_1+","+grainC_2+","+grainC_3+")));");
        }
        oBox=false;
    }
    if(oPaddle)
    {
        float tx,ty;
        if(boxX>mouseX)
        {
            tx=boxX;boxX=mouseX;
        }
        else
        {
            if(boxX==mouseX)
            {
                boxX=mouseX-1; 
            }
            tx=mouseX;
        }
        if(boxY>mouseY)
        {
            ty=boxY;boxY=mouseY;
        }
        else
        {
            if(boxY==mouseY)
            {
                boxY=mouseY-1;
            }
            ty=mouseY;
        }
        paddles.add(new Paddle(boxX/2+tx/2,boxY/2+ty/2,tx-boxX,ty-boxY));
        if(buttons.get(RECORD).check)
        {
            if(!oTimer)
            {
                output.print("        case "+timer+": ");
                oTimer=true;
            }
            output.print("\n                paddles.add(new Paddle("+(boxX/2+tx/2)+","+(boxY/2+ty/2)+","+(tx-boxX)+","+(ty-boxY)+"));");
        }
        oPaddle=false;
    }
    if(oParticle)
    {
        strokeWeight(1);
        grainR=random(2);
        particles.add(new Particle(boxX,boxY,sqrt((boxX-mouseX)*(boxX-mouseX)+(boxY-mouseY)*(boxY-mouseY)),grainR)); 
                                                                              //add ball
        if(buttons.get(RECORD).check)
        {
            if(!oTimer)
            {
                output.print("        case "+timer+": ");
                oTimer=true;
            }
            output.print("\n                particles.add(new Particle("+boxX+","+boxY+",sqrt(("+(boxX-mouseX)+")*("+(boxX-mouseX)+")+("+(boxY-mouseY)+")*("+(boxY-mouseY)+")),"+grainR+"));");
        }
        oParticle=false;
    }
    if(oBomb)
    {
        strokeWeight(1);
        grainR=random(2);
        bombs.add(new Bomb(boxX,boxY,sqrt((boxX-mouseX)*(boxX-mouseX)+(boxY-mouseY)*(boxY-mouseY)),200)); 
                                                                              //add bomb
        if(buttons.get(RECORD).check)
        {
            if(!oTimer)
            {
                output.print("        case "+timer+": ");
                oTimer=true;
            }
            output.print("\n                bombs.add(new Bomb("+boxX+","+boxY+",sqrt(("+(boxX-mouseX)+")*("+(boxX-mouseX)+")+("+(boxY-mouseY)+")*("+(boxY-mouseY)+")),200));");
        }
        oBomb=false;
    }
    if(oSurface)
    {
        strokeWeight(3);
        if(mouseX-surfaces.get(surfaces.size()-1).x>1||mouseX-surfaces.get(surfaces.size()-1).x<-1||mouseY-surfaces.get(surfaces.size()-1).y>1||mouseY-surfaces.get(surfaces.size()-1).y<-1)
        {
            surfaces.add(new Vec2(mouseX,mouseY));    //add the last position
        }
        if(surfaces.size()>1)
        {
            lines.add(new Surface());                 //add surface
        }
        if(buttons.get(RECORD).check)
        {
            if(!oTimer)  
            {
                output.print("        case "+timer+": ");
                oTimer=true;
            }
            for(Vec2 s:surfaces)
            {
                output.print("\n                 surfaces.add(new Vec2("+s.x+","+s.y+"));");
            }
            output.print("\n                 lines.add(new Surface());");
            output.print("\n                 for(int i=surfaces.size()-1;i>=0;i--) surfaces.remove(i);");
        }
        for(int i=surfaces.size()-1;i>=0;i--)
        {
            surfaces.remove(i);                       //cleaned out the surfaces
        }
        oSurface=false;
    }
    if(oLine)
    {
        oLine=false;
        if(mouseX-surfaces.get(surfaces.size()-1).x>1||mouseX-surfaces.get(surfaces.size()-1).x<-1||mouseY-surfaces.get(surfaces.size()-1).y>1||mouseY-surfaces.get(surfaces.size()-1).y<-1)
        {
            surfaces.add(new Vec2(mouseX,mouseY));     //add the last position
            lines.add(new Surface());                  //add line
            if(buttons.get(RECORD).check)
            {
                if(!oTimer)  
                {
                    output.print("        case "+timer+": ");
                    oTimer=true;
                }
                output.print("\n                 surfaces.add(new Vec2("+mouseX+","+mouseY+"));"); 
                output.print("\n                 lines.add(new Surface());");
                output.print("\n                 for(int i=surfaces.size()-1;i>=0;i--) surfaces.remove(i);");
            }
        }
        for(int i=surfaces.size()-1;i>=0;i--)
        {
            surfaces.remove(i);                    //cleaned out the surfaces
        }
    }
    if(oBridge)
    {
        oBridge=false;
        bridges.add(new Bridge((surfaces.get(0)),new Vec2(mouseX,mouseY)));
        if(buttons.get(RECORD).check)
        {
            if(!oTimer)  
            {
                output.print("        case "+timer+": ");
                oTimer=true;
            }
            output.print("\n                 bridges.add(new Bridge((surfaces.get(0)),new Vec2("+mouseX+","+mouseY+")));");
            output.print("\n                 for(int i=surfaces.size()-1;i>=0;i--) surfaces.remove(i);");
        }
        for(int i=surfaces.size()-1;i>=0;i--)
        {
            surfaces.remove(i);                    //cleaned out the surfaces
        }
    }
}
void readyToMove()                                         //check something which will be moved
{
    for(int i=rockers.size()-1;i>=0;i--)
    {
        if(rockers.get(i).over())
        {
            rockers.get(i).pressed=true;                   //ready to move rocker
            return;                                        //rocker is prior to dot and ball
        }
    }
    if(numOfChoose!=-1)
    {
        switch(typeOfChoose)
        {
            case DOT:
                if(dots.get(numOfChoose).over())
                {
                    oDotMove=true;                            //ready to move
                    oMove=true;
                }
                break;
            case BALL:
                if(particles.get(numOfChoose).over())
                {
                    oParticleMove=true;                           //ready to move
                    oMove=true;
                    particles.get(numOfChoose).moveX=mouseX-box2d.getBodyPixelCoord(particles.get(numOfChoose).body).x;
                    particles.get(numOfChoose).moveY=mouseY-box2d.getBodyPixelCoord(particles.get(numOfChoose).body).y;        //get position of mouse in the ball
                }
                break;
        }
    }
}
void Move()                                               //move something which is ready to move
{
    for(int i=0;i<=numOfButton;i++)
    {
        if(newButton[i]&&buttons.get(i).check)
        {
            return;                             //you cannot move anybody when "newButton" is check 
        }
    }
    for(int i=rockers.size()-1;i>=0;i--)
    {
        if(rockers.get(i).pressed)
        {
            rockers.get(i).move(mouseX,mouseY);
            return;                              //rocker is prior to dot and ball
        }
    }
    if(oMove)
    {
       for(Slingshot s:slingshots)
        {
            s.display(0);
        }
    }
    if(oDotMove)
    {
        dots.get(numOfChoose).move(mouseX,mouseY);            //move the dot which was ready to move
        {
            if(buttons.get(RECORD).check)
            {
                if(!oTimer)  
                {
                    output.print("        case "+timer+": ");
                    oTimer=true;
                }
                output.print("\n                dots.get("+numOfChoose+").move("+mouseX+","+mouseY+");");
            }
        }
    }
    else if(oParticleMove)                       //dot is prior to ball
    {
        particles.get(numOfChoose).move(mouseX,mouseY);       //move the ball which was ready to move
        for(Slingshot s:slingshots)
        {
            if(s.check(typeOfChoose,numOfChoose))
            {
                s.move(particles.get(numOfChoose).getX(),particles.get(numOfChoose).getY());
            }
        }
        if(buttons.get(RECORD).check)
        {
            if(!oTimer)
            {
                output.print("        case "+timer+": ");
                oTimer=true;
            }
            output.print("\n                particles.get(numOfChoose).move("+mouseX+","+mouseY+");");
        }
    }
}
void moveWithoutPressed()
{
    if(numOfChoose!=-1&&typeOfChoose==PADDLE)
    {
        Vec2 pos = box2d.getBodyPixelCoord(paddles.get(numOfChoose).body); 
        if((mouseX==pos.x&&mouseY==pos.y)||(!buttons.get(PADDLE).properties.get(LATERAL_FREE).check&&!buttons.get(PADDLE).properties.get(VERTICAL_FREE).check)||!buttons.get(PADDLE).properties.get(FOLLOW).check)
        {
            //break;
        }
        else if(!buttons.get(PADDLE).properties.get(LATERAL_FREE).check)
        {
            paddles.get(numOfChoose).move(pos.x,mouseY);
            if(buttons.get(RECORD).check)
            {
                if(!oTimer)
                {
                    output.print("        case "+timer+": ");
                    oTimer=true;
                }
                output.print("\n            paddles.get("+numOfChoose+").move("+pos.x+","+mouseY+");");
            }
        }
        else if(!buttons.get(PADDLE).properties.get(VERTICAL_FREE).check)
        {
            paddles.get(numOfChoose).move(mouseX,pos.y);
            if(buttons.get(RECORD).check)
            {
                if(!oTimer)
                {
                    output.print("        case "+timer+": ");
                    oTimer=true;
                }
                output.print("\n            paddles.get("+numOfChoose+").move("+mouseX+","+pos.y+");");
            }
        }
        else
        {
            paddles.get(numOfChoose).move(mouseX,mouseY);
            if(buttons.get(RECORD).check)
            {
                if(!oTimer)
                {
                    output.print("        case "+timer+": ");
                    oTimer=true;
                }
                output.print("\n            paddles.get("+numOfChoose+").move("+mouseX+","+mouseY+");");
            }
        }
    }
}
void moveOver()
{
    oMove=false;
    for(Slingshot s:slingshots)
    {
        if(s.check(typeOfChoose,numOfChoose))
        {
            s.move(mouseX,mouseY);
        }
    }
    for(Slingshot s:slingshots)
    {
        if(s.over(mouseX,mouseY)&&s.typeOfStuff==-1&&typeOfChoose==BALL)
        {
            s.stuff(typeOfChoose,numOfChoose);
        }
    }
}
void Choose()
{
    if(buttons.get(CHOOSE).check&&numOfChoose==-1)
    {
        for(int i=dots.size()-1;i>=0;i--)
        {
            Dot d=dots.get(i);
            if(d.over())
            {
                typeOfChoose=DOT;
                numOfChoose=i;                                  //get number of the dot which will be choosed
                break;
            }
        }
        if(typeOfChoose==-1)                                               //dot is prior to ball
        {
            for(int i=particles.size()-1;i>=0;i--)
            {
                Particle p=particles.get(i);
                if(p.over()) 
                {
                    numOfChoose=i;                              //get number of the ball which will be choosed
                    typeOfChoose=BALL;
                    break;
                }
            }
        }
        if(typeOfChoose==-1)
        {
            for(int i=paddles.size()-1;i>=0;i--)
            {
                Paddle p=paddles.get(i);
                {
                    if(p.over())
                    {
                        numOfChoose=i;
                        typeOfChoose=PADDLE;
                        break;
                    }
                }
            }
        }
    }
}