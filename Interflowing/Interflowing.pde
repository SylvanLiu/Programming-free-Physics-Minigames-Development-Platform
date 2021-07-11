import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;
import org.jbox2d.callbacks.ContactImpulse;
import org.jbox2d.callbacks.ContactListener;
import org.jbox2d.collision.Manifold;
import org.jbox2d.dynamics.contacts.Contact;
Box2DProcessing box2d;
                                                 //import box2D
ArrayList<Particle> particles;
ArrayList<Button> buttons;
ArrayList<Dot> dots;
ArrayList<Box> boxes;
ArrayList<Grain> grains;
ArrayList<Vec2> surfaces;
ArrayList<Surface> lines;
ArrayList<Rocker> rockers;
ArrayList<Bomb> bombs;
ArrayList<Bridge> bridges;
ArrayList<Object> killed;
ArrayList<Paddle> paddles;
ArrayList<Slingshot> slingshots;
                                                 //statement arraylists
PrintWriter output;                              //to print file
PImage img1,img2,img3,img4,img5,imgBar,imgSet_1,imgSet_2,imgBall_1,imgBall_2,imgBall_3,imgRocker_1,imgRocker_2,imgBomb_1,imgBomb_2,imgBridge,imgBackground,imgPaddle;
/*
    img1...img3 to load images of buttons
    img1...img5 to load images of cursor in the end
    imgBar to load image of toolbar
    imgBall to load imges of balls
    imgRocker to load imges of rockers
*/
Toolbar bar;    //statemeny the toolbar
boolean oHand,oBox,oParticle,oSurface,oLine,oDotMove,oParticleMove,oBomb,oTimer,oStep,oAtt,oBridge,oPaddle,oSlingshot,oMove;
/*
    oHand:cursor is HAND?
    oBox:ready to build a box?
    oParticle:ready to build a ball?
    oSurface:ready to build a surface?
    oLine:ready to build a line?
    oDotMove:a dot is moved?
    oParticleMove:a ball is moved?
    oEraser:eraser is used?
*/
float boxX=-1000,boxY=-1000,Restitution=0;
//boxX & boxY are Vec2 of mouse in the body which is being moved
//Restitution is next ball's data
int numOfChoose,typeOfChoose=-1;   //the address of the body which is choosed in arraylist
Surface wall;      //statement walls
boolean[] newButton= new boolean[50];    //make flags
int numOfButton=-1,numOfButtonPressed=-1,numOfPropertyPressed=-1;    //number of button which has been pressed
int timer;        //timer for recording
float grainR;
float grainC_1,grainC_2,grainC_3;
String saveData;
int numOfFile;
void setup()
{
    size(displayWidth,displayHeight,P3D);                //Full screen
    
    buttons=new ArrayList<Button>();
    particles = new ArrayList<Particle>();
    dots = new ArrayList<Dot>();
    boxes=new ArrayList<Box>();
    surfaces=new ArrayList<Vec2>();
    lines=new ArrayList<Surface>();
    grains=new ArrayList<Grain>();
    rockers=new ArrayList<Rocker>();
    bombs=new ArrayList<Bomb>();
    bridges=new ArrayList<Bridge>();
    paddles=new ArrayList<Paddle>();
    slingshots=new ArrayList<Slingshot>();
    killed=new ArrayList<Object>();
                                                         //apply memory for arraylists
    scanData();      //scan all images form "data" and add buttons to arraylist
    oMove=oSlingshot=oPaddle=oTimer=oParticleMove=oDotMove=oLine=oSurface=oParticle=oBox=oBomb=oAtt=oBridge=false;    //all initial booleans = false
    oStep=true;
    bar=new Toolbar(width*7/8,height/5,140,500);         //initial position of toolbar
    bar.build();     //initial position of buttons in the toolbar
    box2d = new Box2DProcessing(this);                   //apply memory for the world
    box2d.createWorld();               //create the world
    box2d.setGravity(0,0);             //initial g=0 just like weightlessness
    box2d.world.setContactListener(new CustomListener());
    frameRate(40);                     //limit number of frames
    orientation(LANDSCAPE);            //ban turn screen
    numOfChoose=-1;
}
void draw()
{
    background(255);
    image(imgBackground,0,0,displayWidth,displayHeight);
    Cursor();             //judgment cursor shape
    Check();              //check button state
    Display();            //display all body
    if(buttons.get(RECORD).check)
    {
        timer++;
    }
    if(oTimer)
    {
        oTimer=false;
        output.print("\n                break;\n");
    }
}