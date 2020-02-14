void mousePressed()
{
    if(bar.toolOver()||bar.toolOver(SETTING))
    {
         numOfButtonPressed=bar.barPressed();            //get the number of the button which is pressed
    }
    else
    {
        Choose();
        addOverInPressed();                              //add something when pressed(discontinues)
        readyToAdd();                                    //need to be prepared before add something
        readyToMove();                                   //need to be prepared before move something
    }
}
void mouseDragged()
{
    if(bar.deformedUp||bar.deformedDown||bar.deformedLeft||bar.deformedRight)
    {
        bar.distortion();                                //distortion
    }
    else if(bar.pressed)
    {
        bar.move();                                      //move the toolbar
    }
}
void mouseReleased()
{
    initializationMouse();                              //mouse data initialization
    if(oMove)
    {
        moveOver();
    }
    if(numOfPropertyPressed!=-1)
    {
        checkProperty();
    }
    if(numOfButtonPressed!=-1)                          //means a button have been pressed
    {
        checkButton();                                  //check the button and achieve the function
        if(!buttons.get(SETTING).check)
        {
            numOfButtonPressed=-1;                      //initialization
        }  
    }
    addOverInReleased();
}
void initializationMouse()                              //the boolean which is true only when mousePressed will be false when mouseReleased
{
    if(oParticleMove)
    {
        oParticleMove=false;
    }
    if(oDotMove)
    {
        oDotMove=false;
    }
    if(bar.pressed)
    {
        bar.pressed=false;
    }
    if(bar.deformedLeft)
    {
        bar.deformedLeft=false;
    }
    if(bar.deformedRight)
    {
        bar.deformedRight=false;
    }
    if(bar.deformedUp)
    {
        bar.deformedUp=false;
    }
    if(bar.deformedDown)
    {
        bar.deformedDown=false;
    }
    for(int i=0;i<rockers.size();i++)
    {
        if(rockers.get(i).pressed)
        {
            rockers.get(i).release();
        }
    }
    if(!buttons.get(BRIDGE).check&&!buttons.get(SURFACE_LINE).check&&!buttons.get(SURFACE).check&&surfaces.size()!=0)
    {
        for(int i=surfaces.size()-1;i>=0;i--)
        {
            surfaces.remove(i);                               //cleaned out the surfaces
        }
    }
}
void Cursor()
{
/*
    oHand=false;
    for(Button b:buttons)
    if(b.buttonOver())
    {
        cursor(HAND);
        oHand=true;
        break;
    }
    if(!oHand)
    {
        if(bar.pressed&&!(bar.deformedUp||bar.deformedDown||bar.deformedLeft||bar.deformedRight))
        {
            cursor(MOVE);
        }
        else if(bar.toolOver())
        {
            if((mouseY>=bar.y+bar.h-10&&mouseX>=bar.x+bar.w-10)||(mouseY<=bar.y+10&&mouseX<=bar.x+10))
            {
                cursor(img3);
            }
            else if((mouseY>=bar.y+bar.h-10&&mouseX<=bar.x+10)||(mouseY<=bar.y+10&&mouseX>=bar.x+bar.w-10))
            {
                cursor(img4);
            }
            else if(mouseY>=bar.y+bar.h-10) 
            {
                cursor(img1,5,5);
            }
            else if(mouseY<=bar.y+10)
            {
                cursor(img1,10,10);
            }
            else if(mouseX>=bar.x+bar.w-10)
            {
                cursor(img2,5,5);
            }
            else if(mouseX<=bar.x+10)
            {
                cursor(img2,10,10);
            }
            else
            {
                cursor(ARROW);
            }
        }
        else if(buttons.get(9).check||buttons.get(BALL).check||buttons.get(7).check||buttons.get(10).check)
        {
            cursor(img5,10,10);
        }
        else
        {
            cursor(ARROW);
        }
    }
*/
}