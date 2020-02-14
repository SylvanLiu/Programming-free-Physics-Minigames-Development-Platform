import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;
Box2DProcessing box2d;
                                                 //import box2D
ArrayList<Particle> particles;
ArrayList<Dot> dots;
ArrayList<Box> boxes;
ArrayList<Grain> grains;
ArrayList<Vec2> surfaces;
ArrayList<Surface> lines;
ArrayList<Bomb> bombs;
ArrayList<Bridge> bridges;
ArrayList<Paddle> paddles;
                                                 //statement arraylists
PImage imgBall_1,imgBall_2,imgBall_3,imgBomb_1,imgBomb_2,imgBridge,imgBackground,imgPaddle;
int Restitution=0,numOfChoose=0,timer=-1;
boolean oDot=false,oAtt=false,oStep=true,oWall=false,oBridge=false,oBomb=false;
Surface wall;      //statement walls
void setup()
{
    size(displayWidth,displayHeight,P3D);                //Full screen
    particles = new ArrayList<Particle>();
    dots = new ArrayList<Dot>();
    paddles = new ArrayList<Paddle>();
    boxes=new ArrayList<Box>();
    surfaces=new ArrayList<Vec2>();
    paddles=new ArrayList<Paddle>();
    lines=new ArrayList<Surface>();
    grains=new ArrayList<Grain>();
    bombs=new ArrayList<Bomb>();
    bridges=new ArrayList<Bridge>();
    imgBall_1=loadImage("ball_1.png");
    imgBall_2=loadImage("ball_2.png");
    imgBall_3=loadImage("ball_3.png");
    imgBomb_1=loadImage("bomb_1.png");
    imgBomb_2=loadImage("bomb_2.png");
    imgBackground=loadImage("background.png");
    imgPaddle=loadImage("paddle.png");
    imgBridge=loadImage("bridge.png");
    box2d = new Box2DProcessing(this);                   //apply memory for the world
    box2d.createWorld();               //create the world
    box2d.setGravity(0,0);             //initial g=0 just like weightlessness
    frameRate(40);                     //limit number of frames
    orientation(LANDSCAPE);            //ban turn screen
}
void draw()
{
    drawing();
}
void drawing()
{
    background(255);
    image(imgBackground,0,0,displayWidth,displayHeight);
    if(oStep){ box2d.step();
    if(oAtt)
    {
        for(Dot d:dots)
        {
            d.attractionOn();
        }
    }
}
    timer++;
    switch(timer)
    {
        case 45: 
                particles.add(new Particle(133.0,136.0,sqrt((5.0)*(5.0)+(-34.0)*(-34.0)),0.8386469));
                break;
        case 47: 
                particles.add(new Particle(116.0,235.0,sqrt((0.0)*(0.0)+(-22.0)*(-22.0)),1.5343313));
                break;
        case 50: 
                particles.add(new Particle(116.0,299.0,sqrt((0.0)*(0.0)+(-13.0)*(-13.0)),1.8741443));
                break;
        case 59: 
                particles.add(new Particle(122.0,366.0,sqrt((-2.0)*(-2.0)+(-24.0)*(-24.0)),0.77149963));
                break;
        case 69: 
                particles.add(new Particle(124.0,429.0,sqrt((-9.0)*(-9.0)+(-38.0)*(-38.0)),0.13689315));
                break;
        case 78: 
                particles.add(new Particle(160.0,505.0,sqrt((-18.0)*(-18.0)+(-17.0)*(-17.0)),0.95016634));
                break;
        case 86: 
                particles.add(new Particle(213.0,546.0,sqrt((-33.0)*(-33.0)+(-10.0)*(-10.0)),0.7834165));
                break;
        case 91: 
                particles.add(new Particle(305.0,560.0,sqrt((-51.0)*(-51.0)+(1.0)*(1.0)),0.8424063));
                break;
        case 98: 
                particles.add(new Particle(463.0,562.0,sqrt((-31.0)*(-31.0)+(10.0)*(10.0)),0.47605693));
                break;
        case 105: 
                particles.add(new Particle(522.0,535.0,sqrt((-35.0)*(-35.0)+(20.0)*(20.0)),1.451634));
                break;
        case 111: 
                particles.add(new Particle(589.0,478.0,sqrt((-21.0)*(-21.0)+(36.0)*(36.0)),0.14390206));
                break;
        case 118: 
                particles.add(new Particle(628.0,405.0,sqrt((-13.0)*(-13.0)+(46.0)*(46.0)),1.7004383));
                break;
        case 126: 
                particles.add(new Particle(664.0,258.0,sqrt((-4.0)*(-4.0)+(70.0)*(70.0)),0.31879842));
                break;
        case 133: 
                particles.add(new Particle(659.0,115.0,sqrt((2.0)*(2.0)+(29.0)*(29.0)),1.4164397));
                break;
        case 199: 
                boxes.add(new Box(232.5,129.5,15.0,45.0,color(1.8339944,163.71152,96.986176)));
                break;
        case 209: 
                boxes.add(new Box(233.0,231.0,2.0,48.0,color(244.33595,29.500309,169.41838)));
                break;
        case 217: 
                boxes.add(new Box(250.5,329.5,19.0,57.0,color(250.89435,182.60403,191.5254)));
                break;
        case 225: 
                boxes.add(new Box(290.5,407.5,43.0,31.0,color(1.6448557,61.440926,82.97595)));
                break;
        case 233: 
                boxes.add(new Box(390.5,437.5,55.0,5.0,color(137.38441,208.73235,231.06291)));
                break;
        case 240: 
                boxes.add(new Box(464.5,415.0,29.0,42.0,color(48.277855,252.96425,114.38356)));
                break;
        case 248: 
                boxes.add(new Box(499.5,302.5,11.0,99.0,color(85.95693,135.16086,107.25839)));
                break;
        case 256: 
                boxes.add(new Box(480.0,163.5,22.0,45.0,color(236.72841,65.72575,140.52588)));
                break;
        case 265: 
                boxes.add(new Box(416.0,99.5,50.0,1.0,color(108.3748,239.76697,181.11742)));
                break;
        case 272: 
                boxes.add(new Box(344.5,126.0,3.0,30.0,color(230.62585,121.365776,174.4258)));
                break;
        case 281: 
                boxes.add(new Box(342.5,203.5,7.0,43.0,color(72.70264,174.99174,213.06711)));
                break;
        case 288: 
                boxes.add(new Box(390.0,281.5,42.0,49.0,color(96.02012,102.781204,159.54543)));
                break;
        case 295: 
                boxes.add(new Box(447.5,372.0,7.0,34.0,color(52.14237,228.64374,99.79809)));
                break;
        case 306: 
                boxes.add(new Box(393.5,375.5,87.0,49.0,color(12.267733,194.33748,170.8244)));
                break;
        case 315: 
                boxes.add(new Box(321.0,294.0,22.0,70.0,color(146.10909,118.95756,173.82895)));
                break;
        case 324: 
                boxes.add(new Box(286.0,159.5,2.0,69.0,color(192.457,31.763605,234.55524)));
                break;
        case 386: 
                Restitution=1;                                   //change restitution
                for(Particle p:particles)
                {
                    p.fd.setRestitution(1);
                    p.body.createFixture(p.fd);                  //change all balls' restitution
                }
                break;
        case 400: 
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
                break;
        case 410: 
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
                break;
        case 531: 
                bombs.add(new Bomb(479.0,349.0,sqrt((38.0)*(38.0)+(-54.0)*(-54.0)),200));
                break;
        case 535: 
                bombs.add(new Bomb(417.0,430.0,sqrt((81.0)*(81.0)+(-30.0)*(-30.0)),200));
                break;
        case 545: 
                bombs.add(new Bomb(289.0,449.0,sqrt((-29.0)*(-29.0)+(162.0)*(162.0)),200));
                break;
        case 559: 
                bombs.add(new Bomb(344.0,201.0,sqrt((-14.0)*(-14.0)+(-214.0)*(-214.0)),200));
                break;
        case 573: 
                bombs.add(new Bomb(538.0,286.0,sqrt((-79.0)*(-79.0)+(-116.0)*(-116.0)),200));
                break;
        case 586: 
                bombs.add(new Bomb(652.0,276.0,sqrt((-8.0)*(-8.0)+(-98.0)*(-98.0)),200));
                break;
        case 623: 
                grains.add(new Grain(615,45,2.7123685,color(199.01784,182.56447,168.20149)));
                grains.add(new Grain(615,45,2.5338657,color(164.206,19.213076,212.57863)));
                grains.add(new Grain(615,45,2.2772036,color(45.867886,189.54384,40.717094)));
                break;
        case 624: 
                grains.add(new Grain(624,44,3.5713172,color(172.36266,43.575073,150.5221)));
                grains.add(new Grain(624,44,1.1155581,color(66.74269,171.54176,225.76183)));
                grains.add(new Grain(624,44,1.1014979,color(12.4815855,120.33203,66.51536)));
                break;
        case 625: 
                grains.add(new Grain(651,39,1.4451938,color(23.15962,171.74756,112.70913)));
                grains.add(new Grain(651,39,1.3031645,color(15.340719,102.43019,86.63058)));
                grains.add(new Grain(651,39,3.6038623,color(60.791252,86.321396,132.9431)));
                break;
        case 626: 
                grains.add(new Grain(665,37,3.4413552,color(47.539204,168.99399,147.52164)));
                grains.add(new Grain(665,37,3.1170177,color(167.9733,68.9942,118.57704)));
                grains.add(new Grain(665,37,1.0804176,color(69.13928,63.63324,147.59395)));
                break;
        case 627: 
                grains.add(new Grain(674,36,1.1987972,color(191.247,227.68948,98.234245)));
                grains.add(new Grain(674,36,1.0965099,color(102.2787,82.24812,114.07899)));
                grains.add(new Grain(674,36,3.156705,color(161.84637,181.97525,246.02672)));
                break;
        case 628: 
                grains.add(new Grain(687,33,2.3071623,color(222.42487,146.36462,20.828506)));
                grains.add(new Grain(687,33,1.5444479,color(29.867992,220.81377,244.21834)));
                grains.add(new Grain(687,33,3.1438997,color(148.2541,130.489,176.85306)));
                break;
        case 629: 
                grains.add(new Grain(701,31,3.5001504,color(122.4066,253.07974,214.87776)));
                grains.add(new Grain(701,31,1.1210674,color(229.66936,9.269709,63.80864)));
                grains.add(new Grain(701,31,3.5186954,color(68.20453,113.66391,11.1150875)));
                break;
        case 630: 
                grains.add(new Grain(705,31,1.8999,color(151.21878,202.39886,156.78232)));
                grains.add(new Grain(705,31,2.9372132,color(119.34666,85.67013,159.25266)));
                grains.add(new Grain(705,31,2.5115254,color(155.14532,12.172267,76.84441)));
                break;
        case 631: 
                grains.add(new Grain(718,29,3.6617677,color(15.234249,44.24732,99.50626)));
                grains.add(new Grain(718,29,3.7859929,color(169.48418,60.458664,235.9189)));
                grains.add(new Grain(718,29,1.1310542,color(180.49231,184.97644,224.44699)));
                break;
        case 632: 
                grains.add(new Grain(726,29,2.2365594,color(92.02985,243.50304,159.5786)));
                grains.add(new Grain(726,29,1.1994544,color(131.60468,59.453648,211.67778)));
                grains.add(new Grain(726,29,1.5693746,color(50.619183,209.50793,246.39302)));
                break;
        case 633: 
                grains.add(new Grain(729,28,2.5270638,color(31.929216,82.77673,74.78931)));
                grains.add(new Grain(729,28,2.6283417,color(74.01886,155.29865,18.448755)));
                grains.add(new Grain(729,28,2.188331,color(31.323027,202.05074,194.76205)));
                break;
        case 634: 
                grains.add(new Grain(732,28,1.9433447,color(185.76775,4.5842714,16.62195)));
                grains.add(new Grain(732,28,1.5537202,color(174.9031,231.78185,82.54925)));
                grains.add(new Grain(732,28,1.1271656,color(140.60474,181.37668,41.110844)));
                break;
        case 635: 
                grains.add(new Grain(740,28,3.0603368,color(155.4829,26.125164,12.614214)));
                grains.add(new Grain(740,28,1.1623237,color(254.61172,143.02269,42.634655)));
                grains.add(new Grain(740,28,3.267722,color(100.95812,159.39247,166.7027)));
                break;
        case 636: 
                grains.add(new Grain(747,28,2.1337173,color(70.91897,148.04207,122.57013)));
                grains.add(new Grain(747,28,3.59405,color(221.36801,80.01024,157.10555)));
                grains.add(new Grain(747,28,3.1963384,color(97.756775,174.5454,31.133173)));
                break;
        case 637: 
                grains.add(new Grain(757,30,2.3457396,color(220.52827,169.24628,219.11221)));
                grains.add(new Grain(757,30,1.5194893,color(149.79283,60.430225,196.51581)));
                grains.add(new Grain(757,30,1.090001,color(234.02257,54.494488,93.268196)));
                break;
        case 638: 
                grains.add(new Grain(769,33,1.6198235,color(32.06815,86.82252,64.66183)));
                grains.add(new Grain(769,33,3.0751305,color(118.94676,172.72351,254.43161)));
                grains.add(new Grain(769,33,1.8851788,color(58.43787,241.343,114.10519)));
                break;
        case 639: 
                grains.add(new Grain(780,36,2.2773728,color(21.128311,87.85349,46.474365)));
                grains.add(new Grain(780,36,3.1995792,color(28.234142,42.73406,23.00547)));
                grains.add(new Grain(780,36,1.7459577,color(97.58813,6.328393,13.793214)));
                break;
        case 640: 
                grains.add(new Grain(789,39,3.4069161,color(185.89902,158.18196,146.19357)));
                grains.add(new Grain(789,39,3.2294283,color(200.77783,52.998173,28.583616)));
                grains.add(new Grain(789,39,3.896732,color(38.58424,59.313843,98.68761)));
                break;
        case 641: 
                grains.add(new Grain(797,41,3.596662,color(16.607845,44.614986,111.086296)));
                grains.add(new Grain(797,41,2.8601675,color(31.182205,182.33528,133.75609)));
                grains.add(new Grain(797,41,2.3150077,color(160.4844,130.78252,8.742176)));
                break;
        case 642: 
                grains.add(new Grain(804,43,2.7475383,color(1.9395071,207.10564,208.18977)));
                grains.add(new Grain(804,43,3.215724,color(229.49458,217.0749,244.38539)));
                grains.add(new Grain(804,43,1.1611531,color(159.70926,134.12343,219.99738)));
                break;
        case 643: 
                grains.add(new Grain(813,44,3.9634457,color(164.5176,172.26346,98.267456)));
                grains.add(new Grain(813,44,1.8378801,color(156.0225,187.41202,244.26315)));
                grains.add(new Grain(813,44,2.0516653,color(28.399479,191.15523,3.83711)));
                break;
        case 644: 
                grains.add(new Grain(817,45,2.5156276,color(216.50215,5.1588464,41.39522)));
                grains.add(new Grain(817,45,1.7702425,color(235.40515,6.4561577,192.80162)));
                grains.add(new Grain(817,45,1.3362894,color(56.703873,13.66659,118.453415)));
                break;
        case 645: 
                grains.add(new Grain(832,49,2.4337325,color(47.95782,232.3245,221.0638)));
                grains.add(new Grain(832,49,1.0148647,color(97.249016,153.72566,203.67453)));
                grains.add(new Grain(832,49,2.2208426,color(249.19049,108.877594,108.66777)));
                break;
        case 646: 
                grains.add(new Grain(838,51,2.3003545,color(122.11346,16.90973,136.70999)));
                grains.add(new Grain(838,51,2.255603,color(94.06744,20.854437,63.893055)));
                grains.add(new Grain(838,51,2.2686896,color(222.15431,117.53432,242.45721)));
                break;
        case 647: 
                grains.add(new Grain(845,54,1.0598578,color(137.78589,69.92136,39.112167)));
                grains.add(new Grain(845,54,3.7213397,color(148.39261,244.09871,19.700924)));
                grains.add(new Grain(845,54,3.224461,color(247.83907,163.73604,188.97125)));
                break;
        case 648: 
                grains.add(new Grain(849,57,2.4154034,color(236.22543,96.95704,82.08464)));
                grains.add(new Grain(849,57,2.0830803,color(175.51115,15.856534,199.8664)));
                grains.add(new Grain(849,57,2.021876,color(17.615551,146.73222,43.20429)));
                break;
        case 649: 
                grains.add(new Grain(855,60,1.3277864,color(153.6834,238.89731,143.57005)));
                grains.add(new Grain(855,60,3.5984452,color(113.39812,45.599285,84.85832)));
                grains.add(new Grain(855,60,3.879633,color(115.65763,253.99402,127.21272)));
                break;
        case 650: 
                grains.add(new Grain(861,64,1.9715544,color(232.1571,31.020258,187.6972)));
                grains.add(new Grain(861,64,3.920199,color(134.2494,22.640993,201.64415)));
                grains.add(new Grain(861,64,1.7496313,color(55.65303,38.812927,201.69519)));
                break;
        case 651: 
                grains.add(new Grain(866,68,3.8015945,color(86.66737,87.312675,195.48653)));
                grains.add(new Grain(866,68,3.735272,color(228.5336,194.57928,135.0138)));
                grains.add(new Grain(866,68,1.5827019,color(188.67937,159.9702,32.949158)));
                break;
        case 652: 
                grains.add(new Grain(872,72,3.2688189,color(232.02579,44.50633,73.94329)));
                grains.add(new Grain(872,72,3.1884475,color(101.26735,122.58887,79.6992)));
                grains.add(new Grain(872,72,3.519175,color(137.49515,113.38376,208.69287)));
                break;
        case 653: 
                grains.add(new Grain(875,76,3.6566715,color(134.3947,131.21991,182.778)));
                grains.add(new Grain(875,76,1.9398375,color(191.16292,89.357086,214.85443)));
                grains.add(new Grain(875,76,1.623693,color(195.64847,219.8219,172.7152)));
                break;
        case 654: 
                grains.add(new Grain(878,79,1.029039,color(245.89584,106.45387,103.38681)));
                grains.add(new Grain(878,79,1.1049309,color(136.37816,102.16222,163.62456)));
                grains.add(new Grain(878,79,1.1725297,color(139.82593,92.28265,127.959305)));
                break;
        case 655: 
                grains.add(new Grain(878,81,1.7509732,color(219.52937,84.498604,45.16681)));
                grains.add(new Grain(878,81,1.7059319,color(129.6197,64.51049,217.45218)));
                grains.add(new Grain(878,81,3.1022577,color(166.66667,48.50338,28.832945)));
                break;
        case 656: 
                grains.add(new Grain(879,83,2.4107485,color(223.49583,230.77461,248.34169)));
                grains.add(new Grain(879,83,1.9270476,color(146.69472,132.98987,85.04041)));
                grains.add(new Grain(879,83,2.4540043,color(0.58962196,92.57747,11.593817)));
                break;
        case 657: 
                grains.add(new Grain(879,87,3.5076652,color(60.520004,64.4407,122.0414)));
                grains.add(new Grain(879,87,1.2961498,color(128.98073,219.4516,121.557495)));
                grains.add(new Grain(879,87,2.7389648,color(54.347878,70.12226,22.617329)));
                break;
        case 658: 
                grains.add(new Grain(881,90,1.3252493,color(244.63641,75.26179,120.18304)));
                grains.add(new Grain(881,90,1.1208017,color(114.48001,218.697,134.97893)));
                grains.add(new Grain(881,90,3.9276319,color(117.67847,23.936892,88.69493)));
                break;
        case 659: 
                grains.add(new Grain(881,92,3.1627774,color(3.3678808,76.71746,95.2035)));
                grains.add(new Grain(881,92,3.376077,color(35.755703,82.19224,215.62119)));
                grains.add(new Grain(881,92,3.3748145,color(195.2852,170.2009,199.92358)));
                break;
        case 660: 
                grains.add(new Grain(881,93,1.3062551,color(71.89679,6.91572,39.821743)));
                grains.add(new Grain(881,93,1.8911386,color(115.31044,133.64279,214.83109)));
                grains.add(new Grain(881,93,1.6605455,color(56.02962,24.846882,244.86963)));
                break;
        case 661: 
                grains.add(new Grain(881,93,3.8680172,color(237.35564,94.33065,176.88092)));
                grains.add(new Grain(881,93,2.8054957,color(85.38364,96.97799,81.81575)));
                grains.add(new Grain(881,93,2.1071281,color(185.74283,212.66548,215.86584)));
                break;
        case 662: 
                grains.add(new Grain(881,94,3.075095,color(134.241,99.74979,226.01736)));
                grains.add(new Grain(881,94,2.8867085,color(225.31285,199.38976,244.29118)));
                grains.add(new Grain(881,94,2.2566705,color(72.9694,184.60172,125.32472)));
                break;
        case 663: 
                grains.add(new Grain(881,95,3.7316499,color(22.2527,48.153904,243.20381)));
                grains.add(new Grain(881,95,1.5196257,color(19.957016,46.767662,231.50714)));
                grains.add(new Grain(881,95,2.821486,color(116.74988,1.7319927,100.82384)));
                break;
        case 664: 
                grains.add(new Grain(881,96,2.989379,color(17.973963,188.38289,49.35163)));
                grains.add(new Grain(881,96,3.9217443,color(229.22026,72.418564,150.49081)));
                grains.add(new Grain(881,96,2.589765,color(98.61009,159.98668,208.39142)));
                break;
        case 665: 
                grains.add(new Grain(880,97,1.1293933,color(224.21577,121.704124,14.567978)));
                grains.add(new Grain(880,97,3.9168077,color(244.78056,83.36695,125.71143)));
                grains.add(new Grain(880,97,3.347161,color(165.19414,61.235992,156.5485)));
                break;
        case 666: 
                grains.add(new Grain(877,97,3.7651691,color(191.8529,167.40004,114.739006)));
                grains.add(new Grain(877,97,1.2442524,color(89.13005,246.32414,134.67737)));
                grains.add(new Grain(877,97,2.505737,color(147.72905,247.08752,174.35558)));
                break;
        case 667: 
                grains.add(new Grain(855,94,1.5225346,color(62.460457,4.8482814,226.9404)));
                grains.add(new Grain(855,94,2.8086972,color(6.2152963,64.38674,150.06381)));
                grains.add(new Grain(855,94,2.5875192,color(64.09142,228.36296,154.27856)));
                break;
        case 668: 
                grains.add(new Grain(815,87,2.2210984,color(246.23058,247.66782,64.30998)));
                grains.add(new Grain(815,87,1.2225051,color(82.14495,133.48148,46.361813)));
                grains.add(new Grain(815,87,2.8413105,color(11.840058,164.71204,156.39641)));
                break;
        case 669: 
                grains.add(new Grain(790,86,3.5820074,color(193.79588,135.24762,202.20067)));
                grains.add(new Grain(790,86,3.7849221,color(4.756448,127.09031,158.72313)));
                grains.add(new Grain(790,86,3.7571325,color(106.938255,150.17554,236.28668)));
                break;
        case 670: 
                grains.add(new Grain(773,82,1.3075317,color(66.82523,246.53,135.3697)));
                grains.add(new Grain(773,82,1.3208253,color(228.52899,224.9539,79.83551)));
                grains.add(new Grain(773,82,2.3395212,color(240.10313,136.48976,111.269714)));
                break;
        case 671: 
                grains.add(new Grain(757,78,1.6349416,color(57.2839,82.46918,181.05563)));
                grains.add(new Grain(757,78,1.7963139,color(51.450077,29.618666,65.44009)));
                grains.add(new Grain(757,78,2.2938693,color(77.947105,104.80642,143.18672)));
                break;
        case 672: 
                grains.add(new Grain(747,75,1.3547552,color(132.08601,44.07563,94.906654)));
                grains.add(new Grain(747,75,2.8909488,color(70.61901,128.23209,129.3382)));
                grains.add(new Grain(747,75,1.4321606,color(210.31207,223.82835,72.11439)));
                break;
        case 673: 
                grains.add(new Grain(744,74,2.3242157,color(76.61248,217.85402,53.91625)));
                grains.add(new Grain(744,74,3.8692188,color(82.564095,220.03891,192.72679)));
                grains.add(new Grain(744,74,2.1070075,color(202.0075,249.68803,1.6532304)));
                break;
        case 674: 
                grains.add(new Grain(737,72,3.301341,color(239.15247,137.47342,27.804659)));
                grains.add(new Grain(737,72,2.6167579,color(241.49712,195.2385,101.946915)));
                grains.add(new Grain(737,72,2.4051933,color(56.44804,136.5489,119.40709)));
                break;
        case 675: 
                grains.add(new Grain(736,72,2.9018197,color(133.2557,78.42135,148.38101)));
                grains.add(new Grain(736,72,2.1280437,color(41.897373,138.14804,16.681166)));
                grains.add(new Grain(736,72,3.5714302,color(60.42001,151.72475,175.92984)));
                break;
        case 676: 
                grains.add(new Grain(734,70,1.6472139,color(187.09387,184.6957,230.49692)));
                grains.add(new Grain(734,70,2.4179602,color(206.35005,12.910035,186.45042)));
                grains.add(new Grain(734,70,3.1653137,color(47.192238,237.19658,103.645065)));
                break;
        case 677: 
                grains.add(new Grain(733,70,2.763362,color(159.13287,100.310165,191.63501)));
                grains.add(new Grain(733,70,3.7240891,color(37.23481,23.9834,250.54285)));
                grains.add(new Grain(733,70,2.0832474,color(60.80704,118.87842,11.634975)));
                break;
        case 678: 
                grains.add(new Grain(725,66,3.0156162,color(57.456474,157.81868,205.29166)));
                grains.add(new Grain(725,66,3.242309,color(118.51907,120.58113,242.07364)));
                grains.add(new Grain(725,66,3.6842167,color(110.35329,3.729956,119.79564)));
                break;
        case 679: 
                grains.add(new Grain(717,63,1.6738174,color(143.27487,136.51222,7.1414585)));
                grains.add(new Grain(717,63,2.8458695,color(2.236104,190.54012,159.48552)));
                grains.add(new Grain(717,63,3.0537004,color(37.120632,154.23503,71.91128)));
                break;
        case 680: 
                grains.add(new Grain(713,61,1.5040464,color(91.14589,19.478773,27.996199)));
                grains.add(new Grain(713,61,3.4562342,color(201.4769,137.32922,82.92433)));
                grains.add(new Grain(713,61,2.211793,color(166.38147,163.52916,153.9183)));
                break;
        case 681: 
                grains.add(new Grain(710,59,3.6336508,color(237.95805,149.93515,92.47965)));
                grains.add(new Grain(710,59,1.7195241,color(87.48318,176.2778,82.48575)));
                grains.add(new Grain(710,59,2.9359865,color(158.33669,162.24812,48.909912)));
                break;
        case 682: 
                grains.add(new Grain(704,57,3.4564114,color(57.327328,38.98957,207.77072)));
                grains.add(new Grain(704,57,3.4802768,color(212.35802,68.41697,97.446396)));
                grains.add(new Grain(704,57,2.520368,color(245.01697,44.431335,121.637054)));
                break;
        case 683: 
                grains.add(new Grain(701,56,3.489712,color(155.87448,41.149055,64.06361)));
                grains.add(new Grain(701,56,3.397563,color(239.50291,100.61023,14.349322)));
                grains.add(new Grain(701,56,1.2536643,color(252.25363,87.513405,62.95089)));
                break;
        case 684: 
                grains.add(new Grain(700,56,3.8970168,color(34.337437,242.08028,248.35228)));
                grains.add(new Grain(700,56,2.908492,color(192.21495,147.96828,221.98416)));
                grains.add(new Grain(700,56,3.7692504,color(52.649048,35.802258,6.319502)));
                break;
        case 685: 
                grains.add(new Grain(698,56,3.2068288,color(106.17205,135.51732,84.765076)));
                grains.add(new Grain(698,56,2.1800961,color(104.332184,197.71602,172.12392)));
                grains.add(new Grain(698,56,2.629564,color(93.795975,84.12021,182.45807)));
                break;
        case 686: 
                grains.add(new Grain(694,55,3.6316817,color(4.569878,105.20369,233.90585)));
                grains.add(new Grain(694,55,3.6000142,color(22.874498,240.04889,138.78752)));
                grains.add(new Grain(694,55,2.0622458,color(224.14984,34.48371,101.90465)));
                break;
        case 687: 
                grains.add(new Grain(689,55,1.1837924,color(118.61848,251.78993,77.158035)));
                grains.add(new Grain(689,55,3.714844,color(97.59634,5.6825647,85.18063)));
                grains.add(new Grain(689,55,3.500671,color(175.36331,183.34631,159.92972)));
                break;
        case 688: 
                grains.add(new Grain(681,55,2.9421496,color(159.92027,46.880108,130.78233)));
                grains.add(new Grain(681,55,3.136241,color(0.12700438,122.38877,156.41916)));
                grains.add(new Grain(681,55,2.4104536,color(201.78886,21.818504,156.31174)));
                break;
        case 689: 
                grains.add(new Grain(674,55,2.1214607,color(131.72101,78.64713,233.20285)));
                grains.add(new Grain(674,55,1.1806166,color(196.13423,229.20172,217.20624)));
                grains.add(new Grain(674,55,3.5471947,color(170.06094,74.21619,22.776024)));
                break;
        case 690: 
                grains.add(new Grain(671,55,2.8771257,color(236.65672,199.59373,248.3912)));
                grains.add(new Grain(671,55,3.5986295,color(102.99618,231.07887,244.5638)));
                grains.add(new Grain(671,55,2.608552,color(115.33405,83.848564,126.26055)));
                break;
        case 691: 
                grains.add(new Grain(668,55,1.7309699,color(37.36627,222.12086,145.69478)));
                grains.add(new Grain(668,55,3.4736097,color(26.921114,224.77344,26.215296)));
                grains.add(new Grain(668,55,1.8630923,color(152.10098,240.22641,187.82909)));
                break;
        case 692: 
                grains.add(new Grain(668,55,1.3766642,color(103.51855,21.339016,33.231285)));
                grains.add(new Grain(668,55,2.8398602,color(249.0076,180.70404,0.6834465)));
                grains.add(new Grain(668,55,1.48493,color(36.59947,202.20648,13.137202)));
                break;
        case 693: 
                grains.add(new Grain(666,56,3.0065746,color(241.43521,170.29434,92.71506)));
                grains.add(new Grain(666,56,1.9867543,color(227.41373,117.64126,5.4626627)));
                grains.add(new Grain(666,56,2.5505593,color(112.27037,196.35785,244.71428)));
                break;
        case 694: 
                grains.add(new Grain(662,57,1.8562801,color(169.43857,46.02652,149.86368)));
                grains.add(new Grain(662,57,1.2951534,color(235.70164,47.53224,132.81314)));
                grains.add(new Grain(662,57,3.0944238,color(38.51224,218.17688,212.24913)));
                break;
        case 695: 
                grains.add(new Grain(661,58,1.8804058,color(36.893116,67.1819,83.64154)));
                grains.add(new Grain(661,58,2.3995109,color(7.473226,99.48425,93.81645)));
                grains.add(new Grain(661,58,2.732542,color(60.12758,128.34068,6.0586686)));
                break;
        case 696: 
                grains.add(new Grain(660,58,3.4230537,color(177.53357,86.60179,206.259)));
                grains.add(new Grain(660,58,3.9107945,color(49.119568,238.57086,176.04852)));
                grains.add(new Grain(660,58,2.6870584,color(98.2385,56.891186,144.42955)));
                break;
        case 697: 
                grains.add(new Grain(659,59,1.8254634,color(23.057497,110.22617,59.001972)));
                grains.add(new Grain(659,59,3.8788934,color(11.707384,145.22041,18.735838)));
                grains.add(new Grain(659,59,1.9450964,color(28.510433,91.0162,61.70723)));
                break;
        case 698: 
                grains.add(new Grain(657,60,3.5981538,color(139.91245,208.9053,213.50392)));
                grains.add(new Grain(657,60,3.953452,color(100.63154,111.522766,59.940144)));
                grains.add(new Grain(657,60,1.7071018,color(191.03244,102.63804,9.473865)));
                break;
        case 699: 
                grains.add(new Grain(652,62,2.3784304,color(242.10477,230.4147,76.58448)));
                grains.add(new Grain(652,62,1.2321606,color(177.41666,171.13922,188.48993)));
                grains.add(new Grain(652,62,3.4954333,color(105.01457,189.5486,4.718161)));
                break;
        case 700: 
                grains.add(new Grain(648,63,3.2785916,color(203.41336,223.00739,46.3131)));
                grains.add(new Grain(648,63,3.3066344,color(49.27071,99.927284,185.07782)));
                grains.add(new Grain(648,63,3.6538813,color(21.25238,9.821318,0.31938046)));
                break;
        case 701: 
                grains.add(new Grain(646,66,2.61542,color(171.39114,75.61494,7.7581196)));
                grains.add(new Grain(646,66,1.8475101,color(197.32765,109.97443,182.65071)));
                grains.add(new Grain(646,66,3.651775,color(109.3355,146.18057,208.91502)));
                break;
        case 702: 
                grains.add(new Grain(643,67,3.6856782,color(69.59898,71.990204,66.15764)));
                grains.add(new Grain(643,67,3.359672,color(42.690453,104.056046,219.6249)));
                grains.add(new Grain(643,67,2.3692098,color(84.42519,142.179,220.21451)));
                break;
        case 703: 
                grains.add(new Grain(640,71,1.3315408,color(227.83449,241.35446,130.90065)));
                grains.add(new Grain(640,71,3.7112527,color(147.9526,226.45302,36.19742)));
                grains.add(new Grain(640,71,2.4676619,color(29.756918,41.19774,246.18698)));
                break;
        case 704: 
                grains.add(new Grain(640,73,2.2185473,color(218.21266,50.916008,198.09453)));
                grains.add(new Grain(640,73,2.7498674,color(85.969124,151.44853,235.44331)));
                grains.add(new Grain(640,73,3.2059245,color(184.33199,50.48803,212.3649)));
                break;
        case 705: 
                grains.add(new Grain(640,76,1.0491896,color(213.4306,233.93243,158.18115)));
                grains.add(new Grain(640,76,2.398355,color(103.72531,159.31215,87.7792)));
                grains.add(new Grain(640,76,3.6361296,color(216.61372,254.77036,146.54732)));
                break;
        case 706: 
                grains.add(new Grain(640,79,1.4582576,color(226.82912,31.022173,125.5597)));
                grains.add(new Grain(640,79,3.0299923,color(128.75269,126.31893,143.73933)));
                grains.add(new Grain(640,79,1.5779314,color(71.83814,156.12413,97.69165)));
                break;
        case 707: 
                grains.add(new Grain(640,83,1.010252,color(143.96089,13.438678,222.70206)));
                grains.add(new Grain(640,83,2.6978743,color(179.03171,87.76371,41.799355)));
                grains.add(new Grain(640,83,1.0181913,color(215.26073,221.37471,0.18656999)));
                break;
        case 708: 
                grains.add(new Grain(640,89,1.0513904,color(205.61913,31.01354,249.47281)));
                grains.add(new Grain(640,89,3.8010783,color(102.64522,179.44434,161.85301)));
                grains.add(new Grain(640,89,2.5943024,color(202.59517,204.52063,11.389722)));
                break;
        case 709: 
                grains.add(new Grain(640,91,2.9939182,color(6.0884895,113.97868,235.16833)));
                grains.add(new Grain(640,91,1.4557161,color(49.876762,211.90392,247.0069)));
                grains.add(new Grain(640,91,1.3953426,color(65.93546,245.56195,188.38776)));
                break;
        case 710: 
                grains.add(new Grain(640,96,1.8416984,color(249.99123,113.68534,63.99235)));
                grains.add(new Grain(640,96,3.9744687,color(77.33527,74.55265,235.91615)));
                grains.add(new Grain(640,96,2.8383665,color(148.80405,48.775536,212.93579)));
                break;
        case 711: 
                grains.add(new Grain(640,99,3.1445894,color(76.334785,55.15536,57.820587)));
                grains.add(new Grain(640,99,3.2942917,color(59.210552,142.61584,116.209755)));
                grains.add(new Grain(640,99,2.557324,color(52.919563,211.93898,249.2098)));
                break;
        case 712: 
                grains.add(new Grain(640,105,2.4142683,color(145.37161,227.00337,126.158066)));
                grains.add(new Grain(640,105,1.6073828,color(70.67906,13.669843,103.609604)));
                grains.add(new Grain(640,105,3.8673916,color(240.94684,39.39437,7.059793)));
                break;
        case 713: 
                grains.add(new Grain(642,112,3.9933822,color(68.88187,232.64291,208.34488)));
                grains.add(new Grain(642,112,3.1020474,color(224.87209,222.09363,192.55905)));
                grains.add(new Grain(642,112,1.0541489,color(5.572872,18.353851,199.28941)));
                break;
        case 714: 
                grains.add(new Grain(642,113,2.1688027,color(52.53951,54.193226,140.4603)));
                grains.add(new Grain(642,113,3.1927516,color(159.85146,72.35724,237.16426)));
                grains.add(new Grain(642,113,1.6793417,color(253.7681,76.424355,109.96774)));
                break;
        case 715: 
                grains.add(new Grain(642,115,1.5119997,color(132.75322,91.50354,222.85341)));
                grains.add(new Grain(642,115,1.5754929,color(11.702673,201.22897,217.59499)));
                grains.add(new Grain(642,115,1.8154373,color(254.14204,209.43724,74.96209)));
                break;
        case 716: 
                grains.add(new Grain(642,120,1.1470319,color(208.74623,32.345688,97.08697)));
                grains.add(new Grain(642,120,3.3768744,color(62.72094,156.27289,64.06914)));
                grains.add(new Grain(642,120,1.2203535,color(226.81728,65.03515,235.7817)));
                break;
        case 717: 
                grains.add(new Grain(642,123,3.3492758,color(212.69121,23.744196,84.81877)));
                grains.add(new Grain(642,123,2.6422448,color(199.62947,34.745094,244.8925)));
                grains.add(new Grain(642,123,2.3703506,color(163.72917,27.842245,84.16021)));
                break;
        case 718: 
                grains.add(new Grain(642,129,1.1039019,color(174.3142,48.533806,89.21415)));
                grains.add(new Grain(642,129,2.8274562,color(175.80804,23.024956,196.67578)));
                grains.add(new Grain(642,129,1.989965,color(238.55016,159.93298,167.7477)));
                break;
        case 719: 
                grains.add(new Grain(642,134,2.3684607,color(236.96927,246.48866,196.0384)));
                grains.add(new Grain(642,134,3.2957644,color(107.42524,179.1368,35.698265)));
                grains.add(new Grain(642,134,3.5879703,color(15.444621,52.746002,85.20862)));
                break;
        case 720: 
                grains.add(new Grain(642,136,1.7330999,color(226.53603,31.454544,230.22932)));
                grains.add(new Grain(642,136,2.3798642,color(162.54364,107.85057,132.0198)));
                grains.add(new Grain(642,136,3.940787,color(9.329898,47.85673,22.254099)));
                break;
        case 721: 
                grains.add(new Grain(641,143,1.2273415,color(69.45541,204.04962,121.306725)));
                grains.add(new Grain(641,143,2.230847,color(182.41173,192.18274,79.410904)));
                grains.add(new Grain(641,143,1.7007165,color(134.56554,19.430014,214.70813)));
                break;
        case 722: 
                grains.add(new Grain(641,143,1.5346154,color(227.47455,205.15858,6.204626)));
                grains.add(new Grain(641,143,1.6509688,color(43.059715,233.25046,149.71884)));
                grains.add(new Grain(641,143,2.1651978,color(37.66782,50.79844,221.09961)));
                break;
        case 723: 
                grains.add(new Grain(638,156,2.0235758,color(207.47556,76.12533,225.4792)));
                grains.add(new Grain(638,156,2.683589,color(84.59202,46.03208,157.1223)));
                grains.add(new Grain(638,156,2.8724349,color(166.4722,0.039989054,94.1724)));
                break;
        case 724: 
                grains.add(new Grain(636,162,3.5454338,color(169.70006,89.51268,202.27277)));
                grains.add(new Grain(636,162,1.0276976,color(214.41473,71.337265,148.74995)));
                grains.add(new Grain(636,162,1.3137939,color(5.698524,30.515387,143.75452)));
                break;
        case 725: 
                grains.add(new Grain(634,167,2.9641206,color(91.41607,180.31754,80.025604)));
                grains.add(new Grain(634,167,2.0504456,color(84.57094,18.637028,30.710226)));
                grains.add(new Grain(634,167,2.7280548,color(162.244,103.941475,3.9656951)));
                break;
        case 726: 
                grains.add(new Grain(634,170,1.044116,color(14.09548,84.650795,88.79927)));
                grains.add(new Grain(634,170,1.3114686,color(252.98381,23.315048,123.260765)));
                grains.add(new Grain(634,170,1.298732,color(119.19606,182.35704,51.56834)));
                break;
        case 727: 
                grains.add(new Grain(632,175,1.610431,color(251.55003,240.17035,120.989204)));
                grains.add(new Grain(632,175,1.1881398,color(8.153465,115.602455,228.15178)));
                grains.add(new Grain(632,175,3.0732405,color(32.06049,206.43417,8.37744)));
                break;
        case 728: 
                grains.add(new Grain(632,179,3.3859096,color(131.60748,68.81458,174.39214)));
                grains.add(new Grain(632,179,3.3299277,color(243.72707,48.19725,218.32504)));
                grains.add(new Grain(632,179,2.5997355,color(154.40567,223.41716,199.99341)));
                break;
        case 729: 
                grains.add(new Grain(631,184,1.5001118,color(122.274185,34.963398,41.493988)));
                grains.add(new Grain(631,184,3.779588,color(176.69669,81.35442,172.81126)));
                grains.add(new Grain(631,184,1.5002337,color(0.9748149,161.966,42.36303)));
                break;
        case 730: 
                grains.add(new Grain(631,188,3.3271804,color(51.228214,40.658047,227.84389)));
                grains.add(new Grain(631,188,3.5139487,color(249.18866,227.59314,113.71627)));
                grains.add(new Grain(631,188,1.4114487,color(68.58907,41.540512,37.916264)));
                break;
        case 731: 
                grains.add(new Grain(631,191,1.8509936,color(28.802044,189.5586,54.57427)));
                grains.add(new Grain(631,191,2.790656,color(226.13469,9.892298,150.44798)));
                grains.add(new Grain(631,191,2.7001088,color(28.202938,152.39687,183.58183)));
                break;
        case 732: 
                grains.add(new Grain(631,198,2.5563698,color(149.55278,198.2974,195.06087)));
                grains.add(new Grain(631,198,2.7806268,color(149.37584,95.144264,207.34317)));
                grains.add(new Grain(631,198,3.9479637,color(158.46222,77.76278,220.11763)));
                break;
        case 733: 
                grains.add(new Grain(633,203,2.6151097,color(101.3728,116.69625,251.13837)));
                grains.add(new Grain(633,203,3.8384457,color(39.09393,126.28238,182.58672)));
                grains.add(new Grain(633,203,1.0819343,color(107.806435,7.302661,12.869484)));
                break;
        case 734: 
                grains.add(new Grain(633,206,3.6633072,color(87.97631,18.124435,4.9006577)));
                grains.add(new Grain(633,206,2.0620127,color(247.11874,252.9782,254.96504)));
                grains.add(new Grain(633,206,3.4537423,color(105.64047,140.34372,64.716515)));
                break;
        case 735: 
                grains.add(new Grain(633,210,2.3678415,color(112.20727,100.26423,113.32354)));
                grains.add(new Grain(633,210,1.2439809,color(163.67216,50.475746,208.69728)));
                grains.add(new Grain(633,210,1.7358603,color(145.53564,101.781746,132.19505)));
                break;
        case 736: 
                grains.add(new Grain(633,213,3.4496293,color(11.96758,226.67047,244.61142)));
                grains.add(new Grain(633,213,1.4746176,color(137.12029,218.36073,14.188454)));
                grains.add(new Grain(633,213,1.8598099,color(240.7993,228.66579,47.195263)));
                break;
        case 737: 
                grains.add(new Grain(633,215,2.3915136,color(130.76865,251.22305,90.34848)));
                grains.add(new Grain(633,215,2.6505392,color(224.26611,224.98935,252.3394)));
                grains.add(new Grain(633,215,3.8699188,color(198.64616,252.72893,221.47289)));
                break;
        case 738: 
                grains.add(new Grain(633,218,1.3101857,color(127.88731,198.60728,221.24504)));
                grains.add(new Grain(633,218,1.436235,color(90.670296,61.575893,183.53334)));
                grains.add(new Grain(633,218,1.5699906,color(198.5072,214.91415,206.24991)));
                break;
        case 739: 
                grains.add(new Grain(633,220,3.8429945,color(48.36952,48.0602,2.2279725)));
                grains.add(new Grain(633,220,2.353541,color(149.29964,222.47626,173.04587)));
                grains.add(new Grain(633,220,1.5993571,color(92.70363,102.07631,134.3242)));
                break;
        case 740: 
                grains.add(new Grain(633,223,2.398725,color(26.504915,123.30317,40.00161)));
                grains.add(new Grain(633,223,1.0044045,color(111.918724,230.93945,156.55199)));
                grains.add(new Grain(633,223,2.5641062,color(167.5933,95.628494,49.26384)));
                break;
        case 741: 
                grains.add(new Grain(633,226,1.0813828,color(3.806271,140.8688,151.37631)));
                grains.add(new Grain(633,226,2.9087949,color(147.82945,183.23,66.238716)));
                grains.add(new Grain(633,226,2.3725896,color(206.75032,60.065807,108.01623)));
                break;
        case 742: 
                grains.add(new Grain(633,232,2.4307938,color(118.711136,41.21373,8.953322)));
                grains.add(new Grain(633,232,1.3348602,color(25.680132,167.76242,241.58424)));
                grains.add(new Grain(633,232,1.8634529,color(172.47319,113.923386,136.66255)));
                break;
        case 743: 
                grains.add(new Grain(633,235,3.0746367,color(32.49785,192.3984,103.19595)));
                grains.add(new Grain(633,235,2.1630511,color(76.7847,81.21747,32.90245)));
                grains.add(new Grain(633,235,3.3793776,color(50.7217,8.214491,169.34346)));
                break;
        case 744: 
                grains.add(new Grain(633,238,1.2726834,color(217.92198,54.781464,76.993935)));
                grains.add(new Grain(633,238,2.4385872,color(135.97476,218.02016,249.73982)));
                grains.add(new Grain(633,238,1.4185293,color(224.07463,56.4113,139.77408)));
                break;
        case 745: 
                grains.add(new Grain(633,241,3.3030186,color(142.55775,35.71007,239.2234)));
                grains.add(new Grain(633,241,3.5842166,color(68.03403,230.31572,59.0728)));
                grains.add(new Grain(633,241,2.0046275,color(76.671646,5.2623835,171.16127)));
                break;
        case 746: 
                grains.add(new Grain(633,244,1.9174081,color(145.32597,236.44221,213.16306)));
                grains.add(new Grain(633,244,1.3526251,color(173.90141,198.45511,82.11078)));
                grains.add(new Grain(633,244,2.6498747,color(194.87851,211.63051,146.09113)));
                break;
        case 747: 
                grains.add(new Grain(633,249,1.7325087,color(17.337254,191.3834,60.28583)));
                grains.add(new Grain(633,249,1.6582232,color(244.56592,230.04099,237.44127)));
                grains.add(new Grain(633,249,3.7652094,color(33.193027,250.0511,83.631676)));
                break;
        case 748: 
                grains.add(new Grain(632,254,1.0570929,color(78.436714,233.79321,95.705086)));
                grains.add(new Grain(632,254,2.4325378,color(42.98319,22.843872,152.03758)));
                grains.add(new Grain(632,254,3.2000384,color(241.12112,89.08046,19.010988)));
                break;
        case 851: 
                dots.add(new Dot(596,254,5));
                break;
        case 894: 
            oAtt=true;
                break;
        case 1012: 
                dots.get(numOfChoose).move(595,255);
                break;
        case 1013: 
                dots.get(numOfChoose).move(595,255);
                break;
        case 1014: 
                dots.get(numOfChoose).move(596,255);
                break;
        case 1015: 
                dots.get(numOfChoose).move(596,255);
                break;
        case 1068: 
                dots.get(numOfChoose).move(596,255);
                break;
        case 1069: 
                dots.get(numOfChoose).move(596,255);
                break;
        case 1070: 
                dots.get(numOfChoose).move(596,255);
                break;
        case 1071: 
                dots.get(numOfChoose).move(589,255);
                break;
        case 1072: 
                dots.get(numOfChoose).move(569,251);
                break;
        case 1073: 
                dots.get(numOfChoose).move(543,245);
                break;
        case 1074: 
                dots.get(numOfChoose).move(517,236);
                break;
        case 1075: 
                dots.get(numOfChoose).move(495,229);
                break;
        case 1076: 
                dots.get(numOfChoose).move(485,226);
                break;
        case 1077: 
                dots.get(numOfChoose).move(478,221);
                break;
        case 1078: 
                dots.get(numOfChoose).move(471,216);
                break;
        case 1079: 
                dots.get(numOfChoose).move(452,206);
                break;
        case 1080: 
                dots.get(numOfChoose).move(443,203);
                break;
        case 1081: 
                dots.get(numOfChoose).move(443,203);
                break;
        case 1082: 
                dots.get(numOfChoose).move(443,203);
                break;
        case 1083: 
                dots.get(numOfChoose).move(443,203);
                break;
        case 1084: 
                dots.get(numOfChoose).move(433,198);
                break;
        case 1085: 
                dots.get(numOfChoose).move(408,190);
                break;
        case 1086: 
                dots.get(numOfChoose).move(395,184);
                break;
        case 1087: 
                dots.get(numOfChoose).move(377,178);
                break;
        case 1088: 
                dots.get(numOfChoose).move(354,172);
                break;
        case 1089: 
                dots.get(numOfChoose).move(336,168);
                break;
        case 1090: 
                dots.get(numOfChoose).move(316,168);
                break;
        case 1091: 
                dots.get(numOfChoose).move(311,168);
                break;
        case 1092: 
                dots.get(numOfChoose).move(302,168);
                break;
        case 1093: 
                dots.get(numOfChoose).move(293,169);
                break;
        case 1094: 
                dots.get(numOfChoose).move(284,172);
                break;
        case 1095: 
                dots.get(numOfChoose).move(282,174);
                break;
        case 1096: 
                dots.get(numOfChoose).move(279,177);
                break;
        case 1097: 
                dots.get(numOfChoose).move(277,181);
                break;
        case 1098: 
                dots.get(numOfChoose).move(273,192);
                break;
        case 1099: 
                dots.get(numOfChoose).move(272,201);
                break;
        case 1100: 
                dots.get(numOfChoose).move(272,209);
                break;
        case 1101: 
                dots.get(numOfChoose).move(272,221);
                break;
        case 1102: 
                dots.get(numOfChoose).move(278,230);
                break;
        case 1103: 
                dots.get(numOfChoose).move(288,241);
                break;
        case 1104: 
                dots.get(numOfChoose).move(297,247);
                break;
        case 1105: 
                dots.get(numOfChoose).move(317,254);
                break;
        case 1106: 
                dots.get(numOfChoose).move(343,260);
                break;
        case 1107: 
                dots.get(numOfChoose).move(362,263);
                break;
        case 1108: 
                dots.get(numOfChoose).move(369,264);
                break;
        case 1109: 
                dots.get(numOfChoose).move(373,264);
                break;
        case 1110: 
                dots.get(numOfChoose).move(380,264);
                break;
        case 1111: 
                dots.get(numOfChoose).move(393,262);
                break;
        case 1112: 
                dots.get(numOfChoose).move(402,260);
                break;
        case 1113: 
                dots.get(numOfChoose).move(413,258);
                break;
        case 1114: 
                dots.get(numOfChoose).move(431,252);
                break;
        case 1115: 
                dots.get(numOfChoose).move(442,247);
                break;
        case 1116: 
                dots.get(numOfChoose).move(456,242);
                break;
        case 1117: 
                dots.get(numOfChoose).move(474,238);
                break;
        case 1118: 
                dots.get(numOfChoose).move(483,236);
                break;
        case 1119: 
                dots.get(numOfChoose).move(501,232);
                break;
        case 1120: 
                dots.get(numOfChoose).move(514,229);
                break;
        case 1121: 
                dots.get(numOfChoose).move(528,225);
                break;
        case 1122: 
                dots.get(numOfChoose).move(535,222);
                break;
        case 1123: 
                dots.get(numOfChoose).move(552,217);
                break;
        case 1124: 
                dots.get(numOfChoose).move(560,216);
                break;
        case 1125: 
                dots.get(numOfChoose).move(565,214);
                break;
        case 1126: 
                dots.get(numOfChoose).move(578,211);
                break;
        case 1127: 
                dots.get(numOfChoose).move(590,209);
                break;
        case 1128: 
                dots.get(numOfChoose).move(601,207);
                break;
        case 1129: 
                dots.get(numOfChoose).move(608,206);
                break;
        case 1130: 
                dots.get(numOfChoose).move(611,205);
                break;
        case 1131: 
                dots.get(numOfChoose).move(616,203);
                break;
        case 1132: 
                dots.get(numOfChoose).move(625,201);
                break;
        case 1133: 
                dots.get(numOfChoose).move(632,199);
                break;
        case 1134: 
                dots.get(numOfChoose).move(635,198);
                break;
        case 1135: 
                dots.get(numOfChoose).move(637,198);
                break;
        case 1136: 
                dots.get(numOfChoose).move(639,196);
                break;
        case 1137: 
                dots.get(numOfChoose).move(643,196);
                break;
        case 1138: 
                dots.get(numOfChoose).move(652,196);
                break;
        case 1139: 
                dots.get(numOfChoose).move(659,196);
                break;
        case 1140: 
                dots.get(numOfChoose).move(660,196);
                break;
        case 1141: 
                dots.get(numOfChoose).move(660,196);
                break;
        case 1142: 
                dots.get(numOfChoose).move(660,196);
                break;
        case 1143: 
                dots.get(numOfChoose).move(660,196);
                break;
        case 1315: 
                    dots.get(0).x+=8.150001;
                    dots.get(0).y+=-0.14051725;
                break;
        case 1316: 
                    dots.get(0).x+=8.14614;
                    dots.get(0).y+=-0.28751084;
                break;
        case 1317: 
                    dots.get(0).x+=8.14429;
                    dots.get(0).y+=-0.335847;
                break;
        case 1318: 
                    dots.get(0).x+=8.141436;
                    dots.get(0).y+=-0.39909;
                break;
        case 1319: 
                    dots.get(0).x+=8.139329;
                    dots.get(0).y+=-0.43996373;
                break;
        case 1320: 
                    dots.get(0).x+=8.140513;
                    dots.get(0).y+=-0.41746226;
                break;
        case 1321: 
                    dots.get(0).x+=8.137145;
                    dots.get(0).y+=-0.47865564;
                break;
        case 1322: 
                    dots.get(0).x+=8.13483;
                    dots.get(0).y+=-0.5164972;
                break;
        case 1323: 
                    dots.get(0).x+=8.126449;
                    dots.get(0).y+=-0.6348788;
                break;
        case 1324: 
                    dots.get(0).x+=8.126449;
                    dots.get(0).y+=-0.6348788;
                break;
        case 1325: 
                    dots.get(0).x+=8.115625;
                    dots.get(0).y+=-0.7608399;
                break;
        case 1326: 
                    dots.get(0).x+=8.102889;
                    dots.get(0).y+=-0.8862535;
                break;
        case 1327: 
                    dots.get(0).x+=8.051978;
                    dots.get(0).y+=-1.268028;
                break;
        case 1328: 
                    dots.get(0).x+=7.938994;
                    dots.get(0).y+=-1.8478693;
                break;
        case 1329: 
                    dots.get(0).x+=7.487634;
                    dots.get(0).y+=-3.221424;
                break;
        case 1330: 
                    dots.get(0).x+=3.1035721;
                    dots.get(0).y+=-7.5372467;
                break;
        case 1331: 
                    dots.get(0).x+=-2.256838;
                    dots.get(0).y+=-7.8325553;
                break;
        case 1332: 
                    dots.get(0).x+=-5.763777;
                    dots.get(0).y+=-5.763777;
                break;
        case 1333: 
                    dots.get(0).x+=-6.989606;
                    dots.get(0).y+=-4.1937637;
                break;
        case 1334: 
                    dots.get(0).x+=-7.583383;
                    dots.get(0).y+=-2.989071;
                break;
        case 1335: 
                    dots.get(0).x+=-7.767499;
                    dots.get(0).y+=-2.471477;
                break;
        case 1336: 
                    dots.get(0).x+=-7.8926325;
                    dots.get(0).y+=-2.0368083;
                break;
        case 1337: 
                    dots.get(0).x+=-8.021382;
                    dots.get(0).y+=-1.449024;
                break;
        case 1338: 
                    dots.get(0).x+=-8.090652;
                    dots.get(0).y+=-0.9917574;
                break;
        case 1339: 
                    dots.get(0).x+=-8.137505;
                    dots.get(0).y+=-0.4725003;
                break;
        case 1340: 
                    dots.get(0).x+=-8.149685;
                    dots.get(0).y+=-0.15773584;
                break;
        case 1341: 
                    dots.get(0).x+=-8.126892;
                    dots.get(0).y+=0.62917876;
                break;
        case 1342: 
                    dots.get(0).x+=-8.055221;
                    dots.get(0).y+=1.24726;
                break;
        case 1343: 
                    dots.get(0).x+=-8.021382;
                    dots.get(0).y+=1.449024;
                break;
        case 1344: 
                    dots.get(0).x+=-7.916768;
                    dots.get(0).y+=1.940885;
                break;
        case 1345: 
                    dots.get(0).x+=-7.854563;
                    dots.get(0).y+=2.179008;
                break;
        case 1346: 
                    dots.get(0).x+=-7.8004847;
                    dots.get(0).y+=2.3653083;
                break;
        case 1347: 
                    dots.get(0).x+=-7.7127833;
                    dots.get(0).y+=2.6372743;
                break;
        case 1348: 
                    dots.get(0).x+=-7.7127833;
                    dots.get(0).y+=2.6372743;
                break;
        case 1349: 
                    dots.get(0).x+=-7.5170007;
                    dots.get(0).y+=3.1522906;
                break;
        case 1350: 
                    dots.get(0).x+=-7.4644723;
                    dots.get(0).y+=3.2747362;
                break;
        case 1351: 
                    dots.get(0).x+=-7.446688;
                    dots.get(0).y+=3.3149774;
                break;
        case 1352: 
                    dots.get(0).x+=-7.410733;
                    dots.get(0).y+=3.394594;
                break;
        case 1353: 
                    dots.get(0).x+=-7.37429;
                    dots.get(0).y+=3.4730527;
                break;
        case 1354: 
                    dots.get(0).x+=-7.30006;
                    dots.get(0).y+=3.6264813;
                break;
        case 1355: 
                    dots.get(0).x+=-7.2623363;
                    dots.get(0).y+=3.7014484;
                break;
        case 1356: 
                    dots.get(0).x+=-7.2242455;
                    dots.get(0).y+=3.7752507;
                break;
        case 1357: 
                    dots.get(0).x+=-7.166488;
                    dots.get(0).y+=3.8837743;
                break;
        case 1358: 
                    dots.get(0).x+=-7.1080675;
                    dots.get(0).y+=3.9896894;
                break;
        case 1359: 
                    dots.get(0).x+=-7.068798;
                    dots.get(0).y+=4.0588584;
                break;
        case 1360: 
                    dots.get(0).x+=-7.029303;
                    dots.get(0).y+=4.126881;
                break;
        case 1361: 
                    dots.get(0).x+=-7.009478;
                    dots.get(0).y+=4.1604643;
                break;
        case 1362: 
                    dots.get(0).x+=-6.96969;
                    dots.get(0).y+=4.22678;
                break;
        case 1363: 
                    dots.get(0).x+=-6.9497333;
                    dots.get(0).y+=4.259514;
                break;
        case 1364: 
                    dots.get(0).x+=-6.929738;
                    dots.get(0).y+=4.291967;
                break;
        case 1365: 
                    dots.get(0).x+=-6.9097075;
                    dots.get(0).y+=4.32414;
                break;
        case 1366: 
                    dots.get(0).x+=-6.8695536;
                    dots.get(0).y+=4.3876505;
                break;
        case 1367: 
                    dots.get(0).x+=-6.8494353;
                    dots.get(0).y+=4.4189906;
                break;
        case 1368: 
                    dots.get(0).x+=-6.8292933;
                    dots.get(0).y+=4.4500556;
                break;
        case 1369: 
                    dots.get(0).x+=-6.80913;
                    dots.get(0).y+=4.4808474;
                break;
        case 1370: 
                    dots.get(0).x+=-6.80913;
                    dots.get(0).y+=4.4808474;
                break;
        case 1371: 
                    dots.get(0).x+=-6.788948;
                    dots.get(0).y+=4.5113654;
                break;
        case 1372: 
                    dots.get(0).x+=-6.788948;
                    dots.get(0).y+=4.5113654;
                break;
        case 1373: 
                    dots.get(0).x+=-6.7687507;
                    dots.get(0).y+=4.5416136;
                break;
        case 1374: 
                    dots.get(0).x+=-6.7687507;
                    dots.get(0).y+=4.5416136;
                break;
        case 1375: 
                    dots.get(0).x+=-6.7687507;
                    dots.get(0).y+=4.5416136;
                break;
        case 1376: 
                    dots.get(0).x+=-6.7687507;
                    dots.get(0).y+=4.5416136;
                break;
        case 1377: 
                    dots.get(0).x+=-6.7687507;
                    dots.get(0).y+=4.5416136;
                break;
        case 1378: 
                    dots.get(0).x+=-6.7687507;
                    dots.get(0).y+=4.5416136;
                break;
        case 1379: 
                    dots.get(0).x+=-6.7687507;
                    dots.get(0).y+=4.5416136;
                break;
        case 1380: 
                    dots.get(0).x+=-6.7687507;
                    dots.get(0).y+=4.5416136;
                break;
        case 1381: 
                    dots.get(0).x+=-6.7687507;
                    dots.get(0).y+=4.5416136;
                break;
        case 1382: 
                    dots.get(0).x+=-6.7687507;
                    dots.get(0).y+=4.5416136;
                break;
        case 1383: 
                    dots.get(0).x+=-6.7687507;
                    dots.get(0).y+=4.5416136;
                break;
        case 1384: 
                    dots.get(0).x+=-6.7687507;
                    dots.get(0).y+=4.5416136;
                break;
        case 1385: 
                    dots.get(0).x+=-6.7687507;
                    dots.get(0).y+=4.5416136;
                break;
        case 1386: 
                    dots.get(0).x+=-6.728318;
                    dots.get(0).y+=4.601301;
                break;
        case 1387: 
                    dots.get(0).x+=-6.499828;
                    dots.get(0).y+=4.9187884;
                break;
        case 1388: 
                    dots.get(0).x+=-6.054184;
                    dots.get(0).y+=5.4579387;
                break;
        case 1389: 
                    dots.get(0).x+=-5.079865;
                    dots.get(0).y+=6.3747325;
                break;
        case 1390: 
                    dots.get(0).x+=-3.1976068;
                    dots.get(0).y+=7.4978366;
                break;
        case 1391: 
                    dots.get(0).x+=-2.4248798;
                    dots.get(0).y+=7.7821727;
                break;
        case 1392: 
                    dots.get(0).x+=-2.269265;
                    dots.get(0).y+=7.828964;
                break;
        case 1393: 
                    dots.get(0).x+=-2.0188453;
                    dots.get(0).y+=7.8972473;
                break;
        case 1394: 
                    dots.get(0).x+=-1.4865624;
                    dots.get(0).y+=8.01451;
                break;
        case 1395: 
                    dots.get(0).x+=-1.0453327;
                    dots.get(0).y+=8.083905;
                break;
        case 1396: 
                    dots.get(0).x+=0.24200843;
                    dots.get(0).y+=8.147617;
                break;
        case 1397: 
                    dots.get(0).x+=3.7576256;
                    dots.get(0).y+=7.233429;
                break;
        case 1398: 
                    dots.get(0).x+=4.951454;
                    dots.get(0).y+=6.474979;
                break;
        case 1399: 
                    dots.get(0).x+=6.520969;
                    dots.get(0).y+=4.8907266;
                break;
        case 1400: 
                    dots.get(0).x+=7.426633;
                    dots.get(0).y+=3.3596673;
                break;
        case 1401: 
                    dots.get(0).x+=7.959073;
                    dots.get(0).y+=1.759374;
                break;
        case 1402: 
                    dots.get(0).x+=8.11379;
                    dots.get(0).y+=0.78017205;
                break;
        case 1403: 
                    dots.get(0).x+=8.150874;
                    dots.get(0).y+=-0.074098855;
                break;
        case 1404: 
                    dots.get(0).x+=8.139746;
                    dots.get(0).y+=-0.43219885;
                break;
        case 1405: 
                    dots.get(0).x+=8.061029;
                    dots.get(0).y+=-1.2091545;
                break;
        case 1406: 
                    dots.get(0).x+=8.000338;
                    dots.get(0).y+=-1.5610414;
                break;
        case 1407: 
                    dots.get(0).x+=7.93704;
                    dots.get(0).y+=-1.8562431;
                break;
        case 1408: 
                    dots.get(0).x+=7.896562;
                    dots.get(0).y+=-2.0215201;
                break;
        case 1409: 
                    dots.get(0).x+=7.8328376;
                    dots.get(0).y+=-2.2558572;
                break;
        case 1410: 
                    dots.get(0).x+=7.769117;
                    dots.get(0).y+=-2.4663866;
                break;
        case 1411: 
                    dots.get(0).x+=7.72686;
                    dots.get(0).y+=-2.595742;
                break;
        case 1412: 
                    dots.get(0).x+=7.6776824;
                    dots.get(0).y+=-2.7377782;
                break;
        case 1413: 
                    dots.get(0).x+=7.6273837;
                    dots.get(0).y+=-2.8749368;
                break;
        case 1414: 
                    dots.get(0).x+=7.544328;
                    dots.get(0).y+=-3.086316;
                break;
        case 1415: 
                    dots.get(0).x+=7.5008035;
                    dots.get(0).y+=-3.1906402;
                break;
        case 1416: 
                    dots.get(0).x+=7.437352;
                    dots.get(0).y+=-3.3358712;
                break;
        case 1417: 
                    dots.get(0).x+=7.415059;
                    dots.get(0).y+=-3.3851357;
                break;
        case 1418: 
                    dots.get(0).x+=7.3932214;
                    dots.get(0).y+=-3.432567;
                break;
        case 1419: 
                    dots.get(0).x+=7.3622994;
                    dots.get(0).y+=-3.4983978;
                break;
        case 1420: 
                    dots.get(0).x+=7.3111434;
                    dots.get(0).y+=-3.6040847;
                break;
        case 1421: 
                    dots.get(0).x+=7.280595;
                    dots.get(0).y+=-3.6654027;
                break;
        case 1422: 
                    dots.get(0).x+=7.260788;
                    dots.get(0).y+=-3.7044837;
                break;
        case 1423: 
                    dots.get(0).x+=7.2407427;
                    dots.get(0).y+=-3.743513;
                break;
        case 1424: 
                    dots.get(0).x+=7.2407427;
                    dots.get(0).y+=-3.743513;
                break;
        case 1425: 
                    dots.get(0).x+=7.2407427;
                    dots.get(0).y+=-3.743513;
                break;
        case 1426: 
                    dots.get(0).x+=7.2407427;
                    dots.get(0).y+=-3.743513;
                break;
        case 1427: 
                    dots.get(0).x+=7.2407427;
                    dots.get(0).y+=-3.743513;
                break;
        case 1428: 
                    dots.get(0).x+=7.2407427;
                    dots.get(0).y+=-3.743513;
                break;
        case 1429: 
                    dots.get(0).x+=7.2407427;
                    dots.get(0).y+=-3.743513;
                break;
        case 1430: 
                    dots.get(0).x+=7.2407427;
                    dots.get(0).y+=-3.743513;
                break;
        case 1431: 
                    dots.get(0).x+=7.2407427;
                    dots.get(0).y+=-3.743513;
                break;
        case 1432: 
                    dots.get(0).x+=7.2407427;
                    dots.get(0).y+=-3.743513;
                break;
        case 1433: 
                    dots.get(0).x+=7.2407427;
                    dots.get(0).y+=-3.743513;
                break;
        case 1434: 
                    dots.get(0).x+=7.2407427;
                    dots.get(0).y+=-3.743513;
                break;
        case 1470: 
                numOfChoose=0;                                  //initialization
                oDot=false;
                break;
        case 1501: 
                particles.get(numOfChoose).move(928,706);
                break;
        case 1502: 
                particles.get(numOfChoose).move(930,701);
                break;
        case 1503: 
                particles.get(numOfChoose).move(931,696);
                break;
        case 1504: 
                particles.get(numOfChoose).move(931,696);
                break;
        case 1516: 
                particles.get(numOfChoose).move(953,687);
                break;
        case 1517: 
                particles.get(numOfChoose).move(949,689);
                break;
        case 1518: 
                particles.get(numOfChoose).move(943,691);
                break;
        case 1519: 
                particles.get(numOfChoose).move(933,692);
                break;
        case 1520: 
                particles.get(numOfChoose).move(911,689);
                break;
        case 1521: 
                particles.get(numOfChoose).move(887,683);
                break;
        case 1522: 
                particles.get(numOfChoose).move(807,665);
                break;
        case 1523: 
                particles.get(numOfChoose).move(790,659);
                break;
        case 1524: 
                particles.get(numOfChoose).move(750,647);
                break;
        case 1525: 
                particles.get(numOfChoose).move(704,633);
                break;
        case 1526: 
                particles.get(numOfChoose).move(661,615);
                break;
        case 1527: 
                particles.get(numOfChoose).move(625,594);
                break;
        case 1528: 
                particles.get(numOfChoose).move(572,557);
                break;
        case 1529: 
                particles.get(numOfChoose).move(519,515);
                break;
        case 1530: 
                particles.get(numOfChoose).move(473,470);
                break;
        case 1531: 
                particles.get(numOfChoose).move(447,435);
                break;
        case 1532: 
                particles.get(numOfChoose).move(433,404);
                break;
        case 1533: 
                particles.get(numOfChoose).move(425,370);
                break;
        case 1534: 
                particles.get(numOfChoose).move(420,344);
                break;
        case 1535: 
                particles.get(numOfChoose).move(419,321);
                break;
        case 1536: 
                particles.get(numOfChoose).move(421,294);
                break;
        case 1537: 
                particles.get(numOfChoose).move(426,266);
                break;
        case 1538: 
                particles.get(numOfChoose).move(432,238);
                break;
        case 1539: 
                particles.get(numOfChoose).move(441,207);
                break;
        case 1540: 
                particles.get(numOfChoose).move(448,191);
                break;
        case 1541: 
                particles.get(numOfChoose).move(493,143);
                break;
        case 1542: 
                particles.get(numOfChoose).move(493,143);
                break;
        case 1543: 
                particles.get(numOfChoose).move(602,103);
                break;
        case 1544: 
                particles.get(numOfChoose).move(645,98);
                break;
        case 1545: 
                particles.get(numOfChoose).move(674,102);
                break;
        case 1546: 
                particles.get(numOfChoose).move(682,115);
                break;
        case 1547: 
                particles.get(numOfChoose).move(689,158);
                break;
        case 1548: 
                particles.get(numOfChoose).move(689,195);
                break;
        case 1549: 
                particles.get(numOfChoose).move(683,235);
                break;
        case 1550: 
                particles.get(numOfChoose).move(677,261);
                break;
        case 1551: 
                particles.get(numOfChoose).move(671,284);
                break;
        case 1552: 
                particles.get(numOfChoose).move(661,310);
                break;
        case 1553: 
                particles.get(numOfChoose).move(641,340);
                break;
        case 1554: 
                particles.get(numOfChoose).move(537,413);
                break;
        case 1555: 
                particles.get(numOfChoose).move(507,416);
                break;
        case 1556: 
                particles.get(numOfChoose).move(484,416);
                break;
        case 1557: 
                particles.get(numOfChoose).move(426,411);
                break;
        case 1558: 
                particles.get(numOfChoose).move(372,405);
                break;
        case 1559: 
                particles.get(numOfChoose).move(333,399);
                break;
        case 1560: 
                particles.get(numOfChoose).move(311,390);
                break;
        case 1561: 
                particles.get(numOfChoose).move(300,384);
                break;
        case 1562: 
                particles.get(numOfChoose).move(293,381);
                break;
        case 1563: 
                particles.get(numOfChoose).move(272,377);
                break;
        case 1564: 
                particles.get(numOfChoose).move(242,366);
                break;
        case 1565: 
                particles.get(numOfChoose).move(222,353);
                break;
        case 1566: 
                particles.get(numOfChoose).move(217,336);
                break;
        case 1567: 
                particles.get(numOfChoose).move(230,314);
                break;
        case 1568: 
                particles.get(numOfChoose).move(246,289);
                break;
        case 1569: 
                particles.get(numOfChoose).move(266,267);
                break;
        case 1570: 
                particles.get(numOfChoose).move(287,246);
                break;
        case 1571: 
                particles.get(numOfChoose).move(315,232);
                break;
        case 1572: 
                particles.get(numOfChoose).move(345,225);
                break;
        case 1573: 
                particles.get(numOfChoose).move(394,220);
                break;
        case 1574: 
                particles.get(numOfChoose).move(460,220);
                break;
        case 1575: 
                particles.get(numOfChoose).move(567,245);
                break;
        case 1576: 
                particles.get(numOfChoose).move(628,269);
                break;
        case 1577: 
                particles.get(numOfChoose).move(659,289);
                break;
        case 1578: 
                particles.get(numOfChoose).move(669,322);
                break;
        case 1579: 
                particles.get(numOfChoose).move(669,332);
                break;
        case 1580: 
                particles.get(numOfChoose).move(661,363);
                break;
        case 1581: 
                particles.get(numOfChoose).move(641,394);
                break;
        case 1582: 
                particles.get(numOfChoose).move(632,408);
                break;
        case 1583: 
                particles.get(numOfChoose).move(606,431);
                break;
        case 1584: 
                particles.get(numOfChoose).move(579,451);
                break;
        case 1585: 
                particles.get(numOfChoose).move(550,464);
                break;
        case 1586: 
                particles.get(numOfChoose).move(516,468);
                break;
        case 1587: 
                particles.get(numOfChoose).move(494,466);
                break;
        case 1588: 
                particles.get(numOfChoose).move(397,443);
                break;
        case 1589: 
                particles.get(numOfChoose).move(338,415);
                break;
        case 1590: 
                particles.get(numOfChoose).move(301,379);
                break;
        case 1591: 
                particles.get(numOfChoose).move(294,355);
                break;
        case 1592: 
                particles.get(numOfChoose).move(295,321);
                break;
        case 1593: 
                particles.get(numOfChoose).move(301,286);
                break;
        case 1594: 
                particles.get(numOfChoose).move(315,251);
                break;
        case 1595: 
                particles.get(numOfChoose).move(363,209);
                break;
        case 1596: 
                particles.get(numOfChoose).move(405,193);
                break;
        case 1597: 
                particles.get(numOfChoose).move(460,191);
                break;
        case 1598: 
                particles.get(numOfChoose).move(515,201);
                break;
        case 1599: 
                particles.get(numOfChoose).move(580,229);
                break;
        case 1600: 
                particles.get(numOfChoose).move(608,249);
                break;
        case 1601: 
                particles.get(numOfChoose).move(628,276);
                break;
        case 1602: 
                particles.get(numOfChoose).move(637,300);
                break;
        case 1603: 
                particles.get(numOfChoose).move(640,325);
                break;
        case 1604: 
                particles.get(numOfChoose).move(634,359);
                break;
        case 1605: 
                particles.get(numOfChoose).move(613,394);
                break;
        case 1606: 
                particles.get(numOfChoose).move(597,419);
                break;
        case 1607: 
                particles.get(numOfChoose).move(580,442);
                break;
        case 1608: 
                particles.get(numOfChoose).move(565,467);
                break;
        case 1609: 
                particles.get(numOfChoose).move(553,483);
                break;
        case 1610: 
                particles.get(numOfChoose).move(543,497);
                break;
        case 1611: 
                particles.get(numOfChoose).move(540,502);
                break;
        case 1612: 
                particles.get(numOfChoose).move(531,515);
                break;
        case 1613: 
                particles.get(numOfChoose).move(521,522);
                break;
        case 1614: 
                particles.get(numOfChoose).move(503,531);
                break;
        case 1615: 
                particles.get(numOfChoose).move(472,537);
                break;
        case 1616: 
                particles.get(numOfChoose).move(447,544);
                break;
        case 1617: 
                particles.get(numOfChoose).move(435,549);
                break;
        case 1618: 
                particles.get(numOfChoose).move(433,550);
                break;
        case 1676: 
                numOfChoose=-1;                                  //initialization
                oDot=false;
                break;
        case 1785: 
                numOfChoose=-1;                                  //initialization
                oDot=false;
                break;
        case 1916: 
                 surfaces.add(new Vec2(483.0,70.0));
                 surfaces.add(new Vec2(477.0,72.0));
                 surfaces.add(new Vec2(453.0,79.0));
                 surfaces.add(new Vec2(418.0,95.0));
                 surfaces.add(new Vec2(390.0,113.0));
                 surfaces.add(new Vec2(370.0,132.0));
                 surfaces.add(new Vec2(355.0,152.0));
                 surfaces.add(new Vec2(340.0,183.0));
                 surfaces.add(new Vec2(331.0,210.0));
                 surfaces.add(new Vec2(331.0,227.0));
                 surfaces.add(new Vec2(335.0,243.0));
                 surfaces.add(new Vec2(341.0,253.0));
                 surfaces.add(new Vec2(346.0,261.0));
                 surfaces.add(new Vec2(356.0,271.0));
                 surfaces.add(new Vec2(373.0,279.0));
                 surfaces.add(new Vec2(393.0,285.0));
                 surfaces.add(new Vec2(433.0,292.0));
                 surfaces.add(new Vec2(483.0,292.0));
                 surfaces.add(new Vec2(530.0,283.0));
                 surfaces.add(new Vec2(561.0,267.0));
                 surfaces.add(new Vec2(588.0,229.0));
                 surfaces.add(new Vec2(595.0,201.0));
                 surfaces.add(new Vec2(596.0,171.0));
                 surfaces.add(new Vec2(576.0,127.0));
                 surfaces.add(new Vec2(557.0,109.0));
                 surfaces.add(new Vec2(529.0,89.0));
                 surfaces.add(new Vec2(517.0,84.0));
                 surfaces.add(new Vec2(456.0,66.0));
                 surfaces.add(new Vec2(437.0,66.0));
                 surfaces.add(new Vec2(407.0,73.0));
                 surfaces.add(new Vec2(395.0,78.0));
                 surfaces.add(new Vec2(375.0,94.0));
                 surfaces.add(new Vec2(370.0,99.0));
                 lines.add(new Surface());
                 for(int i=surfaces.size()-1;i>=0;i--) surfaces.remove(i);
                break;
        case 1990: surfaces.add(new Vec2(787,50));
                break;
        case 2003: 
                 surfaces.add(new Vec2(673,284));
                 lines.add(new Surface());
                 for(int i=surfaces.size()-1;i>=0;i--) surfaces.remove(i);
                break;
        case 2012: surfaces.add(new Vec2(906,102));
                break;
        case 2028: 
                 surfaces.add(new Vec2(728,135));
                 lines.add(new Surface());
                 for(int i=surfaces.size()-1;i>=0;i--) surfaces.remove(i);
                break;
        case 2041: surfaces.add(new Vec2(731,135));
                break;
        case 2077: 
                 surfaces.add(new Vec2(860,330));
                 lines.add(new Surface());
                 for(int i=surfaces.size()-1;i>=0;i--) surfaces.remove(i);
                break;
        case 2185: 
                boxes.add(new Box(885.0,62.0,32.0,20.0,color(190.64313,90.24134,57.569466)));
                break;
        case 2364: 
                paddles.add(new Paddle(331.0,458.0,324.0,66.0));
                break;
        case 2484: 
                    paddles.get(0).move(351.37427,458.0);
                break;
        case 2485: 
                    paddles.get(0).move(371.74524,458.0);
                break;
        case 2486: 
                    paddles.get(0).move(392.1117,458.0);
                break;
        case 2487: 
                    paddles.get(0).move(412.47205,458.0);
                break;
        case 2488: 
                    paddles.get(0).move(432.8324,458.0);
                break;
        case 2489: 
                    paddles.get(0).move(453.19275,458.0);
                break;
        case 2490: 
                    paddles.get(0).move(473.55383,458.0);
                break;
        case 2491: 
                    paddles.get(0).move(493.90692,458.0);
                break;
        case 2492: 
                    paddles.get(0).move(514.2631,458.0);
                break;
        case 2493: 
                    paddles.get(0).move(534.6201,458.0);
                break;
        case 2494: 
                    paddles.get(0).move(554.9771,458.0);
                break;
        case 2495: 
                    paddles.get(0).move(575.3341,458.0);
                break;
        case 2496: 
                    paddles.get(0).move(595.6911,458.0);
                break;
        case 2497: 
                    paddles.get(0).move(616.0481,458.0);
                break;
        case 2498: 
                    paddles.get(0).move(636.4047,458.0);
                break;
        case 2499: 
                    paddles.get(0).move(656.75574,458.0);
                break;
        case 2500: 
                    paddles.get(0).move(677.1181,458.0);
                break;
        case 2502: 
                    paddles.get(0).move(656.7602,458.0);
                break;
        case 2503: 
                    paddles.get(0).move(636.41034,458.0);
                break;
        case 2504: 
                    paddles.get(0).move(616.0704,458.0);
                break;
        case 2505: 
                    paddles.get(0).move(595.7294,458.0);
                break;
        case 2506: 
                    paddles.get(0).move(575.3876,458.0);
                break;
        case 2507: 
                    paddles.get(0).move(555.0437,458.0);
                break;
        case 2508: 
                    paddles.get(0).move(534.69934,458.0);
                break;
        case 2509: 
                    paddles.get(0).move(514.3536,458.0);
                break;
        case 2510: 
                    paddles.get(0).move(494.00607,458.0);
                break;
        case 2511: 
                    paddles.get(0).move(473.65857,458.0);
                break;
        case 2512: 
                    paddles.get(0).move(453.31107,458.0);
                break;
        case 2513: 
                    paddles.get(0).move(432.96356,458.0);
                break;
        case 2514: 
                    paddles.get(0).move(412.61606,458.0);
                break;
        case 2515: 
                    paddles.get(0).move(392.26855,458.0);
                break;
        case 2516: 
                    paddles.get(0).move(371.92105,458.0);
                break;
        case 2517: 
                    paddles.get(0).move(351.57355,458.0);
                break;
        case 2518: 
                    paddles.get(0).move(331.22604,458.0);
                break;
        case 2519: 
                    paddles.get(0).move(310.88028,458.0);
                break;
        case 2520: 
                    paddles.get(0).move(290.54132,458.0);
                break;
        case 2521: 
                    paddles.get(0).move(270.20758,458.0);
                break;
        case 2522: 
                    paddles.get(0).move(249.89114,458.0);
                break;
        case 2523: 
                    paddles.get(0).move(229.62909,458.0);
                break;
        case 2524: 
                    paddles.get(0).move(209.62909,458.0);
                break;
        case 2525: 
                    paddles.get(0).move(201.12909,458.0);
                break;
        case 2526: 
                    paddles.get(0).move(202.12909,458.0);
                break;
        case 2527: 
                    paddles.get(0).move(209.12909,458.0);
                break;
        case 2528: 
                    paddles.get(0).move(222.12909,458.0);
                break;
        case 2529: 
                    paddles.get(0).move(241.62909,458.0);
                break;
        case 2530: 
                    paddles.get(0).move(261.52185,458.0);
                break;
        case 2531: 
                    paddles.get(0).move(281.50415,458.0);
                break;
        case 2532: 
                    paddles.get(0).move(301.513,458.0);
                break;
        case 2533: 
                    paddles.get(0).move(321.59656,458.0);
                break;
        case 2534: 
                    paddles.get(0).move(341.6889,458.0);
                break;
        case 2535: 
                    paddles.get(0).move(361.83582,458.0);
                break;
        case 2536: 
                    paddles.get(0).move(382.0183,458.0);
                break;
        case 2537: 
                    paddles.get(0).move(402.2008,458.0);
                break;
        case 2538: 
                    paddles.get(0).move(422.3833,458.0);
                break;
        case 2539: 
                    paddles.get(0).move(442.5658,458.0);
                break;
        case 2540: 
                    paddles.get(0).move(462.7483,458.0);
                break;
        case 2541: 
                    paddles.get(0).move(482.9308,458.0);
                break;
        case 2542: 
                    paddles.get(0).move(503.11328,458.0);
                break;
        case 2543: 
                    paddles.get(0).move(523.2958,458.0);
                break;
        case 2544: 
                    paddles.get(0).move(543.4783,458.0);
                break;
        case 2545: 
                    paddles.get(0).move(563.66077,458.0);
                break;
        case 2546: 
                    paddles.get(0).move(583.84326,458.0);
                break;
        case 2547: 
                    paddles.get(0).move(603.9843,458.0);
                break;
        case 2548: 
                    paddles.get(0).move(624.2104,458.0);
                break;
        case 2549: 
                    paddles.get(0).move(644.452,458.0);
                break;
        case 2550: 
                    paddles.get(0).move(658.952,458.0);
                break;
        case 2551: 
                    paddles.get(0).move(659.952,458.0);
                break;
        case 2552: 
                    paddles.get(0).move(655.952,458.0);
                break;
        case 2553: 
                    paddles.get(0).move(649.952,458.0);
                break;
        case 2554: 
                    paddles.get(0).move(640.452,458.0);
                break;
        case 2555: 
                    paddles.get(0).move(627.952,458.0);
                break;
        case 2556: 
                    paddles.get(0).move(612.952,458.0);
                break;
        case 2558: 
                    paddles.get(0).move(592.952,458.0);
                break;
        case 2559: 
                    paddles.get(0).move(572.952,458.0);
                break;
        case 2560: 
                    paddles.get(0).move(552.952,458.0);
                break;
        case 2561: 
                    paddles.get(0).move(532.952,458.0);
                break;
        case 2562: 
                    paddles.get(0).move(512.952,458.0);
                break;
        case 2563: 
                    paddles.get(0).move(492.5982,458.0);
                break;
        case 2564: 
                    paddles.get(0).move(472.2444,458.0);
                break;
        case 2565: 
                    paddles.get(0).move(451.89056,458.0);
                break;
        case 2566: 
                    paddles.get(0).move(431.53674,458.0);
                break;
        case 2726: 
                    paddles.get(0).move(431.53674,463.0);
                break;
        case 2727: 
                    paddles.get(0).move(431.53674,468.0);
                break;
        case 2728: 
                    paddles.get(0).move(431.53674,472.5);
                break;
        case 2729: 
                    paddles.get(0).move(431.53674,474.0);
                break;
        case 2730: 
                    paddles.get(0).move(431.53674,470.0);
                break;
        case 2731: 
                    paddles.get(0).move(431.53674,457.5);
                break;
        case 2732: 
                    paddles.get(0).move(431.53674,440.0);
                break;
        case 2733: 
                    paddles.get(0).move(431.53674,419.77182);
                break;
        case 2734: 
                    paddles.get(0).move(431.53674,399.50815);
                break;
        case 2735: 
                    paddles.get(0).move(431.53674,379.23978);
                break;
        case 2736: 
                    paddles.get(0).move(431.53674,358.9714);
                break;
        case 2737: 
                    paddles.get(0).move(431.53674,338.70303);
                break;
        case 2738: 
                    paddles.get(0).move(431.53674,318.43466);
                break;
        case 2739: 
                    paddles.get(0).move(431.53674,298.16632);
                break;
        case 2740: 
                    paddles.get(0).move(431.53674,277.89795);
                break;
        case 2741: 
                    paddles.get(0).move(431.53674,257.63925);
                break;
        case 2742: 
                    paddles.get(0).move(431.53674,246.13925);
                break;
        case 2743: 
                    paddles.get(0).move(431.53674,237.13928);
                break;
        case 2744: 
                    paddles.get(0).move(431.53674,233.13928);
                break;
        case 2746: 
                    paddles.get(0).move(431.53674,234.13928);
                break;
        case 2747: 
                    paddles.get(0).move(431.53674,239.13928);
                break;
        case 2748: 
                    paddles.get(0).move(431.53674,246.63928);
                break;
        case 2749: 
                    paddles.get(0).move(431.53674,266.93362);
                break;
        case 2750: 
                    paddles.get(0).move(431.53674,287.17838);
                break;
        case 2751: 
                    paddles.get(0).move(431.53674,307.45007);
                break;
        case 2752: 
                    paddles.get(0).move(431.53674,327.75037);
                break;
        case 2753: 
                    paddles.get(0).move(431.53674,348.04468);
                break;
        case 2754: 
                    paddles.get(0).move(431.53674,368.3461);
                break;
        case 2755: 
                    paddles.get(0).move(431.53674,388.65204);
                break;
        case 2756: 
                    paddles.get(0).move(431.53674,408.9474);
                break;
        case 2757: 
                    paddles.get(0).move(431.53674,429.23782);
                break;
        case 2758: 
                    paddles.get(0).move(431.53674,449.53122);
                break;
        case 2759: 
                    paddles.get(0).move(431.53674,469.82556);
                break;
        case 2760: 
                    paddles.get(0).move(431.53674,490.1199);
                break;
        case 2761: 
                    paddles.get(0).move(431.53674,510.41425);
                break;
        case 2762: 
                    paddles.get(0).move(431.53674,530.70856);
                break;
        case 2763: 
                    paddles.get(0).move(431.53674,551.0049);
                break;
        case 2764: 
                    paddles.get(0).move(431.53674,571.2969);
                break;
        case 2765: 
                    paddles.get(0).move(431.53674,591.49945);
                break;
        case 2766: 
                    paddles.get(0).move(431.53674,611.39825);
                break;
        case 2767: 
                    paddles.get(0).move(431.53674,630.3459);
                break;
        case 2768: 
                    paddles.get(0).move(431.53674,616.3459);
                break;
        case 2769: 
                    paddles.get(0).move(431.53674,597.65784);
                break;
        case 2770: 
                    paddles.get(0).move(431.53674,577.38617);
                break;
        case 2771: 
                    paddles.get(0).move(431.53674,557.0388);
                break;
        case 2772: 
                    paddles.get(0).move(431.53674,536.6896);
                break;
        case 2773: 
                    paddles.get(0).move(431.53674,516.34033);
                break;
        case 2774: 
                    paddles.get(0).move(431.53674,495.99106);
                break;
        case 2775: 
                    paddles.get(0).move(431.53674,475.64178);
                break;
        case 2776: 
                    paddles.get(0).move(431.53674,455.2925);
                break;
        case 2777: 
                    paddles.get(0).move(431.53674,434.92487);
                break;
        case 2778: 
                    paddles.get(0).move(431.53674,414.7007);
                break;
        case 2779: 
                    paddles.get(0).move(431.53674,395.7645);
                break;
        case 2780: 
                    paddles.get(0).move(431.53674,379.21094);
                break;
        case 2781: 
                    paddles.get(0).move(431.53674,364.22964);
                break;
        case 2782: 
                    paddles.get(0).move(431.53674,349.91345);
                break;
        case 2783: 
                    paddles.get(0).move(431.53674,335.6899);
                break;
        case 2784: 
                    paddles.get(0).move(431.53674,321.46402);
                break;
        case 2785: 
                    paddles.get(0).move(431.53674,306.52475);
                break;
        case 2786: 
                    paddles.get(0).move(431.53674,287.9599);
                break;
        case 2787: 
                    paddles.get(0).move(431.53674,267.7017);
                break;
        case 2788: 
                    paddles.get(0).move(431.53674,247.35883);
                break;
        case 2789: 
                    paddles.get(0).move(431.53674,227.01596);
                break;
        case 2790: 
                    paddles.get(0).move(431.53674,206.67313);
                break;
        case 2791: 
                    paddles.get(0).move(431.53674,186.33023);
                break;
        case 2792: 
                    paddles.get(0).move(431.53674,165.98734);
                break;
        case 2793: 
                    paddles.get(0).move(431.53674,145.64444);
                break;
        case 2794: 
                    paddles.get(0).move(431.53674,125.301544);
                break;
        case 2795: 
                    paddles.get(0).move(431.53674,104.971306);
                break;
        case 2796: 
                    paddles.get(0).move(431.53674,84.64955);
                break;
        case 2797: 
                    paddles.get(0).move(431.53674,64.719086);
                break;
        case 2798: 
                    paddles.get(0).move(431.53674,78.918236);
                break;
        case 2799: 
                    paddles.get(0).move(431.53674,96.068085);
                break;
        case 2800: 
                    paddles.get(0).move(431.53674,114.852036);
                break;
        case 2801: 
                    paddles.get(0).move(431.53674,133.91013);
                break;
        case 2802: 
                    paddles.get(0).move(431.53674,153.16562);
                break;
        case 2803: 
                    paddles.get(0).move(431.53674,172.63487);
                break;
        case 2804: 
                    paddles.get(0).move(431.53674,192.31009);
                break;
        case 2805: 
                    paddles.get(0).move(431.53674,212.08592);
                break;
        case 2806: 
                    paddles.get(0).move(431.53674,231.9642);
                break;
        case 2807: 
                    paddles.get(0).move(431.53674,251.90823);
                break;
        case 2808: 
                    paddles.get(0).move(431.53674,271.85223);
                break;
        case 2809: 
                    paddles.get(0).move(431.53674,291.79623);
                break;
        case 2810: 
                    paddles.get(0).move(431.53674,311.74023);
                break;
        case 2811: 
                    paddles.get(0).move(431.53674,331.68423);
                break;
        case 2812: 
                    paddles.get(0).move(431.53674,351.62823);
                break;
        case 2813: 
                    paddles.get(0).move(431.53674,371.57224);
                break;
        case 2814: 
                    paddles.get(0).move(431.53674,391.51624);
                break;
        case 2815: 
                    paddles.get(0).move(431.53674,411.46024);
                break;
        case 2816: 
                    paddles.get(0).move(431.53674,431.40424);
                break;
        case 2817: 
                    paddles.get(0).move(431.53674,451.34824);
                break;
        case 2818: 
                    paddles.get(0).move(431.53674,471.29224);
                break;
        case 2819: 
                    paddles.get(0).move(431.53674,491.27454);
                break;
        case 2820: 
                    paddles.get(0).move(431.53674,511.2754);
                break;
        case 2837: 
                    paddles.get(0).move(431.53674,517.7754);
                break;
        case 2838: 
                    paddles.get(0).move(431.53674,522.7754);
                break;
        case 2839: 
                    paddles.get(0).move(431.53674,523.7754);
                break;
        case 2840: 
                    paddles.get(0).move(431.53674,521.7754);
                break;
        case 2841: 
                    paddles.get(0).move(431.53674,515.2754);
                break;
        case 2842: 
                    paddles.get(0).move(431.53674,503.7754);
                break;
        case 2843: 
                    paddles.get(0).move(431.53674,489.7754);
                break;
        case 2844: 
                    paddles.get(0).move(431.53674,474.2754);
                break;
        case 2845: 
                    paddles.get(0).move(431.53674,457.7754);
                break;
        case 2846: 
                    paddles.get(0).move(431.53674,440.2754);
                break;
        case 2847: 
                    paddles.get(0).move(431.53674,422.2754);
                break;
        case 2848: 
                    paddles.get(0).move(431.53674,403.95074);
                break;
        case 2849: 
                    paddles.get(0).move(431.53674,385.44833);
                break;
        case 2850: 
                    paddles.get(0).move(431.53674,366.94592);
                break;
        case 2851: 
                    paddles.get(0).move(431.53674,348.44354);
                break;
        case 2852: 
                    paddles.get(0).move(431.53674,329.94113);
                break;
        case 2920: 
                    paddles.get(0).move(436.03674,326.94113);
                break;
        case 2921: 
                    paddles.get(0).move(440.03674,324.9411);
                break;
        case 2922: 
                    paddles.get(0).move(443.53674,327.9411);
                break;
        case 2923: 
                    paddles.get(0).move(446.53674,334.9411);
                break;
        case 2924: 
                    paddles.get(0).move(451.03674,347.9411);
                break;
        case 2925: 
                    paddles.get(0).move(457.53674,363.9411);
                break;
        case 2926: 
                    paddles.get(0).move(470.79858,379.41324);
                break;
        case 2927: 
                    paddles.get(0).move(486.79294,392.04037);
                break;
        case 2928: 
                    paddles.get(0).move(504.8598,401.46655);
                break;
        case 2929: 
                    paddles.get(0).move(523.94037,408.62177);
                break;
        case 2930: 
                    paddles.get(0).move(544.0531,411.89938);
                break;
        case 2931: 
                    paddles.get(0).move(564.3808,413.3309);
                break;
        case 2932: 
                    paddles.get(0).move(584.75116,412.7728);
                break;
        case 2933: 
                    paddles.get(0).move(605.03864,410.8537);
                break;
        case 2934: 
                    paddles.get(0).move(624.7568,405.70984);
                break;
        case 2935: 
                    paddles.get(0).move(643.96466,398.9039);
                break;
        case 2936: 
                    paddles.get(0).move(661.8612,389.15826);
                break;
        case 2937: 
                    paddles.get(0).move(677.4985,376.09152);
                break;
        case 2938: 
                    paddles.get(0).move(689.7653,359.81918);
                break;
        case 2939: 
                    paddles.get(0).move(695.4028,340.23645);
                break;
        case 2940: 
                    paddles.get(0).move(693.5007,319.9474);
                break;
        case 2941: 
                    paddles.get(0).move(685.66296,301.13693);
                break;
        case 2942: 
                    paddles.get(0).move(674.14465,284.32642);
                break;
        case 2943: 
                    paddles.get(0).move(657.5624,272.4819);
                break;
        case 2944: 
                    paddles.get(0).move(638.436,265.4501);
                break;
        case 2945: 
                    paddles.get(0).move(618.3293,268.76437);
                break;
        case 2946: 
                    paddles.get(0).move(600.5923,278.79742);
                break;
        case 2947: 
                    paddles.get(0).move(586.18286,293.20685);
                break;
        case 2948: 
                    paddles.get(0).move(573.15015,308.8725);
                break;
        case 2949: 
                    paddles.get(0).move(561.2235,325.3958);
                break;
        case 2950: 
                    paddles.get(0).move(550.22186,342.5489);
                break;
        case 2951: 
                    paddles.get(0).move(540.52704,360.47302);
                break;
        case 2952: 
                    paddles.get(0).move(531.77014,378.87357);
                break;
        case 2953: 
                    paddles.get(0).move(525.09674,398.12793);
                break;
        case 2954: 
                    paddles.get(0).move(518.42334,417.38226);
                break;
        case 2955: 
                    paddles.get(0).move(514.4476,437.36868);
                break;
        case 2956: 
                    paddles.get(0).move(512.73755,457.67484);
                break;
        case 2957: 
                    paddles.get(0).move(514.90466,477.93732);
                break;
        case 2958: 
                    paddles.get(0).move(520.6605,497.48557);
                break;
        case 2959: 
                    paddles.get(0).move(528.4521,516.3152);
                break;
        case 2960: 
                    paddles.get(0).move(539.10834,533.68494);
                break;
        case 2961: 
                    paddles.get(0).move(553.9881,547.60815);
                break;
        case 2962: 
                    paddles.get(0).move(570.1321,560.0434);
                break;
        case 2963: 
                    paddles.get(0).move(587.596,570.54456);
                break;
        case 2964: 
                    paddles.get(0).move(606.0124,579.2681);
                break;
        case 2965: 
                    paddles.get(0).move(625.4529,585.378);
                break;
        case 2966: 
                    paddles.get(0).move(645.4352,589.37445);
                break;
        case 2967: 
                    paddles.get(0).move(665.7595,590.8526);
                break;
        case 2968: 
                    paddles.get(0).move(686.0748,589.25476);
                break;
        case 2969: 
                    paddles.get(0).move(703.9646,579.4967);
                break;
        case 2970: 
                    paddles.get(0).move(717.0908,563.9093);
                break;
        case 2971: 
                    paddles.get(0).move(727.0608,546.1367);
                break;
        case 2972: 
                    paddles.get(0).move(730.2625,526.0118);
                break;
        case 2973: 
                    paddles.get(0).move(726.3497,506.01294);
                break;
        case 2974: 
                    paddles.get(0).move(718.92395,487.03604);
                break;
        case 2975: 
                    paddles.get(0).move(708.6086,469.4617);
                break;
        case 2976: 
                    paddles.get(0).move(693.005,456.3547);
                break;
        case 2977: 
                    paddles.get(0).move(675.2034,446.43668);
                break;
        case 2978: 
                    paddles.get(0).move(656.66766,437.96973);
                break;
        case 2979: 
                    paddles.get(0).move(637.5352,430.9545);
                break;
        case 2980: 
                    paddles.get(0).move(617.9264,425.40857);
                break;
        case 2981: 
                    paddles.get(0).move(597.9369,421.4484);
                break;
        case 2982: 
                    paddles.get(0).move(577.71906,418.8984);
                break;
        case 2983: 
                    paddles.get(0).move(557.3692,417.82736);
                break;
        case 2984: 
                    paddles.get(0).move(537.00977,418.69742);
                break;
        case 2985: 
                    paddles.get(0).move(516.9136,422.07492);
                break;
        case 2986: 
                    paddles.get(0).move(496.9709,426.26456);
                break;
        case 2987: 
                    paddles.get(0).move(477.46155,432.151);
                break;
        case 2988: 
                    paddles.get(0).move(458.93927,440.64746);
                break;
        case 2989: 
                    paddles.get(0).move(441.61993,451.38547);
                break;
        case 2990: 
                    paddles.get(0).move(425.23242,463.498);
                break;
        case 2991: 
                    paddles.get(0).move(409.83908,476.85123);
                break;
        case 2992: 
                    paddles.get(0).move(396.47748,492.2373);
                break;
        case 2993: 
                    paddles.get(0).move(388.11505,510.82047);
                break;
        case 2994: 
                    paddles.get(0).move(387.10995,531.1737);
                break;
        case 2995: 
                    paddles.get(0).move(391.87512,550.98676);
                break;
        case 2996: 
                    paddles.get(0).move(404.73328,566.79596);
                break;
        case 2997: 
                    paddles.get(0).move(421.71463,578.06085);
                break;
        case 2998: 
                    paddles.get(0).move(439.9111,587.2343);
                break;
        case 2999: 
                    paddles.get(0).move(458.78116,594.9275);
                break;
        case 3000: 
                    paddles.get(0).move(478.26105,600.9106);
                break;
        case 3001: 
                    paddles.get(0).move(498.39603,604.0485);
                break;
        case 3002: 
                    paddles.get(0).move(518.7071,605.6988);
                break;
        case 3004: 
                    paddles.get(0).move(538.9388,603.2612);
                break;
        case 3005: 
                    paddles.get(0).move(558.9113,599.2162);
                break;
        case 3006: 
                    paddles.get(0).move(578.47424,593.5103);
                break;
        case 3007: 
                    paddles.get(0).move(597.5362,586.3058);
                break;
        case 3008: 
                    paddles.get(0).move(615.6601,576.98975);
                break;
        case 3009: 
                    paddles.get(0).move(633.15,566.53186);
                break;
        case 3010: 
                    paddles.get(0).move(650.16284,555.3146);
                break;
        case 3011: 
                    paddles.get(0).move(666.26996,542.83154);
                break;
        case 3012: 
                    paddles.get(0).move(679.5894,527.409);
                break;
        case 3013: 
                    paddles.get(0).move(690.7134,510.335);
                break;
        case 3014: 
                    paddles.get(0).move(698.672,491.57535);
                break;
        case 3015: 
                    paddles.get(0).move(703.1882,471.70407);
                break;
        case 3016: 
                    paddles.get(0).move(705.9831,451.51862);
                break;
        case 3017: 
                    paddles.get(0).move(707.2542,431.18027);
                break;
        case 3018: 
                    paddles.get(0).move(706.2366,410.82767);
                break;
        case 3019: 
                    paddles.get(0).move(702.3088,390.83176);
                break;
        case 3020: 
                    paddles.get(0).move(696.7594,371.2239);
                break;
        case 3021: 
                    paddles.get(0).move(687.9536,352.84668);
                break;
        case 3022: 
                    paddles.get(0).move(674.7906,337.29037);
                break;
        case 3023: 
                    paddles.get(0).move(656.06024,329.26306);
                break;
        case 3024: 
                    paddles.get(0).move(635.777,331.22595);
                break;
        case 3025: 
                    paddles.get(0).move(616.8171,338.695);
                break;
        case 3026: 
                    paddles.get(0).move(599.8988,350.05444);
                break;
        case 3027: 
                    paddles.get(0).move(584.8683,363.8148);
                break;
        case 3028: 
                    paddles.get(0).move(570.66034,378.42294);
                break;
        case 3061: 
            paddles.get(0).move(1203,251);
                break;
        case 3065: 
            paddles.get(0).move(1186,247);
                break;
        case 3066: 
            paddles.get(0).move(1132,236);
                break;
        case 3067: 
            paddles.get(0).move(1018,213);
                break;
        case 3068: 
            paddles.get(0).move(940,199);
                break;
        case 3069: 
            paddles.get(0).move(829,186);
                break;
        case 3070: 
            paddles.get(0).move(717,185);
                break;
        case 3071: 
            paddles.get(0).move(589,200);
                break;
        case 3072: 
            paddles.get(0).move(475,223);
                break;
        case 3073: 
            paddles.get(0).move(392,250);
                break;
        case 3074: 
            paddles.get(0).move(338,282);
                break;
        case 3075: 
            paddles.get(0).move(291,323);
                break;
        case 3076: 
            paddles.get(0).move(257,372);
                break;
        case 3077: 
            paddles.get(0).move(248,405);
                break;
        case 3078: 
            paddles.get(0).move(262,451);
                break;
        case 3079: 
            paddles.get(0).move(316,481);
                break;
        case 3080: 
            paddles.get(0).move(478,497);
                break;
        case 3081: 
            paddles.get(0).move(574,482);
                break;
        case 3082: 
            paddles.get(0).move(670,453);
                break;
        case 3083: 
            paddles.get(0).move(713,419);
                break;
        case 3084: 
            paddles.get(0).move(725,379);
                break;
        case 3085: 
            paddles.get(0).move(704,333);
                break;
        case 3086: 
            paddles.get(0).move(601,276);
                break;
        case 3087: 
            paddles.get(0).move(451,253);
                break;
        case 3088: 
            paddles.get(0).move(342,268);
                break;
        case 3089: 
            paddles.get(0).move(271,308);
                break;
        case 3090: 
            paddles.get(0).move(246,340);
                break;
        case 3091: 
            paddles.get(0).move(210,432);
                break;
        case 3092: 
            paddles.get(0).move(230,523);
                break;
        case 3093: 
            paddles.get(0).move(331,598);
                break;
        case 3094: 
            paddles.get(0).move(502,628);
                break;
        case 3095: 
            paddles.get(0).move(670,614);
                break;
        case 3096: 
            paddles.get(0).move(812,560);
                break;
        case 3097: 
            paddles.get(0).move(893,505);
                break;
        case 3098: 
            paddles.get(0).move(966,426);
                break;
        case 3099: 
            paddles.get(0).move(997,370);
                break;
        case 3100: 
            paddles.get(0).move(992,319);
                break;
        case 3101: 
            paddles.get(0).move(952,279);
                break;
        case 3102: 
            paddles.get(0).move(868,249);
                break;
        case 3103: 
            paddles.get(0).move(770,234);
                break;
        case 3104: 
            paddles.get(0).move(645,227);
                break;
        case 3105: 
            paddles.get(0).move(539,242);
                break;
        case 3106: 
            paddles.get(0).move(431,279);
                break;
        case 3107: 
            paddles.get(0).move(376,312);
                break;
        case 3108: 
            paddles.get(0).move(321,385);
                break;
        case 3109: 
            paddles.get(0).move(312,424);
                break;
        case 3110: 
            paddles.get(0).move(329,462);
                break;
        case 3111: 
            paddles.get(0).move(391,496);
                break;
        case 3112: 
            paddles.get(0).move(637,549);
                break;
        case 3113: 
            paddles.get(0).move(792,545);
                break;
        case 3114: 
            paddles.get(0).move(951,449);
                break;
        case 3115: 
            paddles.get(0).move(916,254);
                break;
        case 3116: 
            paddles.get(0).move(885,232);
                break;
        case 3117: 
            paddles.get(0).move(824,203);
                break;
        case 3118: 
            paddles.get(0).move(779,196);
                break;
        case 3119: 
            paddles.get(0).move(713,197);
                break;
        case 3120: 
            paddles.get(0).move(635,224);
                break;
        case 3121: 
            paddles.get(0).move(548,274);
                break;
        case 3122: 
            paddles.get(0).move(483,320);
                break;
        case 3123: 
            paddles.get(0).move(446,352);
                break;
        case 3124: 
            paddles.get(0).move(419,410);
                break;
        case 3125: 
            paddles.get(0).move(418,446);
                break;
        case 3126: 
            paddles.get(0).move(435,484);
                break;
        case 3127: 
            paddles.get(0).move(454,502);
                break;
        case 3128: 
            paddles.get(0).move(521,527);
                break;
        case 3129: 
            paddles.get(0).move(633,536);
                break;
        case 3130: 
            paddles.get(0).move(695,536);
                break;
        case 3131: 
            paddles.get(0).move(923,489);
                break;
        case 3132: 
            paddles.get(0).move(1056,432);
                break;
        case 3133: 
            paddles.get(0).move(1102,399);
                break;
        case 3134: 
            paddles.get(0).move(1116,362);
                break;
        case 3135: 
            paddles.get(0).move(1102,315);
                break;
        case 3136: 
            paddles.get(0).move(1046,269);
                break;
        case 3137: 
            paddles.get(0).move(946,224);
                break;
        case 3138: 
            paddles.get(0).move(811,189);
                break;
        case 3139: 
            paddles.get(0).move(702,179);
                break;
        case 3140: 
            paddles.get(0).move(621,199);
                break;
        case 3141: 
            paddles.get(0).move(571,230);
                break;
        case 3142: 
            paddles.get(0).move(515,273);
                break;
        case 3143: 
            paddles.get(0).move(490,299);
                break;
        case 3144: 
            paddles.get(0).move(454,377);
                break;
        case 3145: 
            paddles.get(0).move(457,430);
                break;
        case 3146: 
            paddles.get(0).move(471,461);
                break;
        case 3147: 
            paddles.get(0).move(507,500);
                break;
        case 3148: 
            paddles.get(0).move(545,526);
                break;
        case 3149: 
            paddles.get(0).move(583,539);
                break;
        case 3150: 
            paddles.get(0).move(605,545);
                break;
        case 3151: 
            paddles.get(0).move(635,551);
                break;
        case 3152: 
            paddles.get(0).move(664,555);
                break;
        case 3153: 
            paddles.get(0).move(685,559);
                break;
        case 3154: 
            paddles.get(0).move(710,562);
                break;
        case 3155: 
            paddles.get(0).move(740,563);
                break;
        case 3156: 
            paddles.get(0).move(773,563);
                break;
        case 3157: 
            paddles.get(0).move(818,554);
                break;
        case 3158: 
            paddles.get(0).move(879,538);
                break;
        case 3159: 
            paddles.get(0).move(958,504);
                break;
        case 3160: 
            paddles.get(0).move(1049,457);
                break;
        case 3161: 
            paddles.get(0).move(1114,412);
                break;
        case 3162: 
            paddles.get(0).move(1165,374);
                break;
        case 3163: 
            paddles.get(0).move(1183,348);
                break;
        case 3164: 
            paddles.get(0).move(1185,320);
                break;
        case 3165: 
            paddles.get(0).move(1185,299);
                break;
        case 3166: 
            paddles.get(0).move(1187,290);
                break;
        case 3167: 
            paddles.get(0).move(1196,285);
                break;
        case 3168: 
            paddles.get(0).move(1209,280);
                break;
        case 3169: 
            paddles.get(0).move(1218,277);
                break;
        case 3170: 
            paddles.get(0).move(1224,272);
                break;
        case 3171: 
            paddles.get(0).move(1227,268);
                break;
        case 3172: 
            paddles.get(0).move(1227,264);
                break;
        case 3173: 
            paddles.get(0).move(1227,261);
                break;
        case 3175: 
            paddles.get(0).move(1225,256);
                break;
        case 3176: 
            paddles.get(0).move(1222,253);
                break;
        case 3177: 
            paddles.get(0).move(1220,251);
                break;
        case 3178: 
            paddles.get(0).move(1217,249);
                break;
        case 3179: 
            paddles.get(0).move(1211,245);
                break;
        case 3180: 
            paddles.get(0).move(1206,243);
                break;
        case 3181: 
            paddles.get(0).move(1203,242);
                break;
        case 3182: 
            paddles.get(0).move(1199,241);
                break;
        case 3183: 
            paddles.get(0).move(1193,241);
                break;
        case 3184: 
            paddles.get(0).move(1189,241);
                break;
        case 3255: 
                    paddles.get(0).move(1185.5,248.5);
                break;
        case 3256: 
                    paddles.get(0).move(1171.0,254.0);
                break;
        case 3257: 
                    paddles.get(0).move(1150.8197,256.8323);
                break;
        case 3258: 
                    paddles.get(0).move(1130.514,258.54828);
                break;
        case 3259: 
                    paddles.get(0).move(1110.2026,260.19516);
                break;
        case 3260: 
                    paddles.get(0).move(1089.8912,261.84204);
                break;
        case 3261: 
                    paddles.get(0).move(1069.5781,263.46707);
                break;
        case 3262: 
                    paddles.get(0).move(1049.2587,265.01028);
                break;
        case 3263: 
                    paddles.get(0).move(1028.9268,266.38095);
                break;
        case 3264: 
                    paddles.get(0).move(1008.5647,267.18738);
                break;
        case 3265: 
                    paddles.get(0).move(988.1955,267.78647);
                break;
        case 3266: 
                    paddles.get(0).move(967.8263,268.38553);
                break;
        case 3267: 
                    paddles.get(0).move(947.4571,268.98462);
                break;
        case 3268: 
                    paddles.get(0).move(927.0879,269.5837);
                break;
        case 3269: 
                    paddles.get(0).move(906.7187,270.1828);
                break;
        case 3270: 
                    paddles.get(0).move(886.3495,270.7819);
                break;
        case 3271: 
                    paddles.get(0).move(865.9803,271.38098);
                break;
        case 3272: 
                    paddles.get(0).move(845.6111,271.98007);
                break;
        case 3273: 
                    paddles.get(0).move(825.2419,272.57913);
                break;
        case 3274: 
                    paddles.get(0).move(804.8727,273.17822);
                break;
        case 3275: 
                    paddles.get(0).move(784.5035,273.7773);
                break;
        case 3276: 
                    paddles.get(0).move(764.1343,274.3764);
                break;
        case 3277: 
                    paddles.get(0).move(743.8834,276.64944);
                break;
        case 3278: 
                    paddles.get(0).move(725.7927,286.0298);
                break;
        case 3279: 
                    paddles.get(0).move(709.731,298.57114);
                break;
        case 3280: 
                    paddles.get(0).move(695.4287,313.0869);
                break;
        case 3281: 
                    paddles.get(0).move(681.5544,328.01233);
                break;
        case 3282: 
                    paddles.get(0).move(668.0921,343.31036);
                break;
        case 3283: 
                    paddles.get(0).move(654.38434,358.3889);
                break;
        case 3284: 
                    paddles.get(0).move(639.8834,372.7063);
                break;
        case 3285: 
                    paddles.get(0).move(623.6778,385.06107);
                break;
        case 3286: 
                    paddles.get(0).move(607.1374,396.96396);
                break;
        case 3287: 
                    paddles.get(0).move(590.597,408.86685);
                break;
        case 3288: 
                    paddles.get(0).move(573.88104,420.52197);
                break;
        case 3289: 
                    paddles.get(0).move(556.80597,431.6443);
                break;
        case 3290: 
                    paddles.get(0).move(539.1629,441.84164);
                break;
        case 3291: 
                    paddles.get(0).move(521.17316,451.41415);
                break;
        case 3292: 
                    paddles.get(0).move(502.7156,460.05026);
                break;
        case 3293: 
                    paddles.get(0).move(483.84366,467.73883);
                break;
        case 3294: 
                    paddles.get(0).move(464.85126,475.12476);
                break;
        case 3295: 
                    paddles.get(0).move(445.27158,480.77274);
                break;
        case 3420: 
            boxes.get(7).killBody();
            boxes.remove(7);
                break;
        case 3421: 
            boxes.get(11).killBody();
            boxes.remove(11);
                break;
        case 3423: 
            boxes.get(11).killBody();
            boxes.remove(11);
                break;
        case 3427: 
            boxes.get(10).killBody();
            boxes.remove(10);
                break;
        case 3431: 
            boxes.get(8).killBody();
            boxes.remove(8);
                break;
        case 3550: 
            boxes.get(9).killBody();
            boxes.remove(9);
                break;
        case 3626: 
            boxes.get(7).killBody();
            boxes.remove(7);
                break;
        case 3650: 
                boxes.add(new Box(422.0,594.5,102.0,71.0,color(212.41078,184.06357,32.81747)));
            boxes.get(10).killBody();
            boxes.remove(10);
                break;
        case 3664: 
                boxes.add(new Box(373.0,622.0,134.0,34.0,color(207.20078,59.522682,101.78619)));
            boxes.get(10).killBody();
            boxes.remove(10);
                break;
        case 3676: 
                boxes.add(new Box(306.5,620.0,107.0,44.0,color(245.40244,247.9721,34.99854)));
                break;
        case 3737: 
            boxes.get(10).killBody();
            boxes.remove(10);
                break;
        case 3764: 
                boxes.add(new Box(1105.0,102.5,88.0,63.0,color(104.19354,220.38214,168.96425)));
                break;
        case 3773: 
                boxes.add(new Box(1240.0,207.0,20.0,74.0,color(83.33828,146.49634,144.82921)));
                break;
        case 3779: 
                boxes.add(new Box(1257.0,319.0,6.0,44.0,color(199.1935,249.47678,164.73714)));
                break;
        case 3786: 
                boxes.add(new Box(1249.5,432.5,1.0,83.0,color(61.389732,29.79788,76.21289)));
                break;
        case 3796: 
                boxes.add(new Box(1221.0,558.5,44.0,47.0,color(115.83352,84.04115,213.56215)));
                break;
        case 3804: 
                boxes.add(new Box(1174.0,619.0,20.0,42.0,color(49.92452,29.899881,88.59203)));
                break;
        case 3811: 
                boxes.add(new Box(1128.0,667.0,54.0,28.0,color(196.57584,146.88696,242.2279)));
                break;
        case 3879: 
                particles.add(new Particle(1094.0,111.0,sqrt((-18.0)*(-18.0)+(-12.0)*(-12.0)),1.9294038));
                break;
        case 4172: 
            oAtt=false;
                break;
        case 4221: 
            boxes.get(10).killBody();
            boxes.remove(10);
                break;
        case 4272: 
            boxes.get(2).killBody();
            boxes.remove(2);
                break;
        case 4276: 
            boxes.get(7).killBody();
            boxes.remove(7);
                break;
        case 4277: 
            boxes.get(13).killBody();
            boxes.remove(13);
                break;
        case 4296: 
            boxes.get(6).killBody();
            boxes.remove(6);
                break;
        case 4306: 
            boxes.get(0).killBody();
            boxes.remove(0);
                break;
        case 4330: 
            boxes.get(2).killBody();
            boxes.remove(2);
                break;
        case 4343: 
            boxes.get(9).killBody();
            boxes.remove(9);
                break;
        case 4388: 
            boxes.get(1).killBody();
            boxes.remove(1);
                break;
        case 4412: 
            boxes.get(7).killBody();
            boxes.remove(7);
                break;
        case 4460: 
            boxes.get(2).killBody();
            boxes.remove(2);
            boxes.get(3).killBody();
            boxes.remove(3);
                break;
        case 4566: 
            boxes.get(0).killBody();
            boxes.remove(0);
                break;
        case 4652: 
            boxes.get(3).killBody();
            boxes.remove(3);
                break;
        case 4673: 
            boxes.get(2).killBody();
            boxes.remove(2);
                break;
        case 4684: 
            box2d.destroyBody(grains.get(96).body);
            grains.remove(96);
                break;
        case 4686: 
            box2d.destroyBody(grains.get(89).body);
            grains.remove(89);
                break;
        case 4712: 
            if(lines.get(2).split(781,124));
            box2d.destroyBody(lines.get(2).body);
            lines.remove(2);
                break;
        case 4713: 
            if(lines.get(4).split(777,124));
            box2d.destroyBody(lines.get(4).body);
            lines.remove(4);
                break;
        case 4714: 
            if(lines.get(4).split(771,126));
            box2d.destroyBody(lines.get(4).body);
            lines.remove(4);
            if(lines.get(1).split(771,126));
            box2d.destroyBody(lines.get(1).body);
            lines.remove(1);
                break;
        case 4715: 
            if(lines.get(5).split(756,136));
            box2d.destroyBody(lines.get(5).body);
            lines.remove(5);
            if(lines.get(3).split(756,136));
            box2d.destroyBody(lines.get(3).body);
            lines.remove(3);
            if(lines.get(1).split(756,136));
            box2d.destroyBody(lines.get(1).body);
            lines.remove(1);
                break;
        case 4716: 
            if(lines.get(6).split(744,151));
            box2d.destroyBody(lines.get(6).body);
            lines.remove(6);
            if(lines.get(5).split(744,151));
            box2d.destroyBody(lines.get(5).body);
            lines.remove(5);
            if(lines.get(4).split(744,151));
            box2d.destroyBody(lines.get(4).body);
            lines.remove(4);
            if(lines.get(3).split(744,151));
            box2d.destroyBody(lines.get(3).body);
            lines.remove(3);
                break;
        case 4717: 
            if(lines.get(5).split(740,157));
            box2d.destroyBody(lines.get(5).body);
            lines.remove(5);
            if(lines.get(3).split(740,157));
            box2d.destroyBody(lines.get(3).body);
            lines.remove(3);
                break;
        case 4718: 
            if(lines.get(5).split(738,160));
            box2d.destroyBody(lines.get(5).body);
            lines.remove(5);
            if(lines.get(4).split(738,160));
            box2d.destroyBody(lines.get(4).body);
            lines.remove(4);
                break;
        case 4719: 
            if(lines.get(5).split(738,160));
            box2d.destroyBody(lines.get(5).body);
            lines.remove(5);
            if(lines.get(4).split(738,160));
            box2d.destroyBody(lines.get(4).body);
            lines.remove(4);
                break;
        case 4720: 
            if(lines.get(5).split(738,161));
            box2d.destroyBody(lines.get(5).body);
            lines.remove(5);
            if(lines.get(4).split(738,161));
            box2d.destroyBody(lines.get(4).body);
            lines.remove(4);
                break;
        case 4722: 
            if(lines.get(3).split(749,140));
            box2d.destroyBody(lines.get(3).body);
            lines.remove(3);
                break;
        case 4723: 
            if(lines.get(2).split(763,114));
            box2d.destroyBody(lines.get(2).body);
            lines.remove(2);
                break;
        case 4724: 
            if(lines.get(5).split(780,90));
            box2d.destroyBody(lines.get(5).body);
            lines.remove(5);
                break;
        case 4725: 
            if(lines.get(5).split(799,64));
            box2d.destroyBody(lines.get(5).body);
            lines.remove(5);
                break;
        case 4731: 
            if(lines.get(5).split(786,74));
            box2d.destroyBody(lines.get(5).body);
            lines.remove(5);
                break;
        case 4735: 
            if(lines.get(3).split(716,190));
            box2d.destroyBody(lines.get(3).body);
            lines.remove(3);
                break;
        case 4736: 
            if(lines.get(4).split(704,209));
            box2d.destroyBody(lines.get(4).body);
            lines.remove(4);
                break;
        case 4737: 
            if(lines.get(4).split(691,232));
            box2d.destroyBody(lines.get(4).body);
            lines.remove(4);
                break;
        case 4738: 
            if(lines.get(4).split(681,253));
            box2d.destroyBody(lines.get(4).body);
            lines.remove(4);
                break;
        case 4739: 
            if(lines.get(4).split(669,272));
            box2d.destroyBody(lines.get(4).body);
            lines.remove(4);
                break;
        case 4749: 
            box2d.destroyBody(grains.get(103).body);
            grains.remove(103);
                break;
        case 4751: 
            if(lines.get(2).split(750,171));
            box2d.destroyBody(lines.get(2).body);
            lines.remove(2);
                break;
        case 4752: 
            if(lines.get(3).split(756,167));
            box2d.destroyBody(lines.get(3).body);
            lines.remove(3);
                break;
        case 4753: 
            if(lines.get(3).split(762,170));
            box2d.destroyBody(lines.get(3).body);
            lines.remove(3);
                break;
        case 4754: 
            if(lines.get(3).split(774,186));
            box2d.destroyBody(lines.get(3).body);
            lines.remove(3);
                break;
        case 4755: 
            box2d.destroyBody(grains.get(67).body);
            grains.remove(67);
            if(lines.get(3).split(782,203));
            box2d.destroyBody(lines.get(3).body);
            lines.remove(3);
                break;
        case 4756: 
            if(lines.get(3).split(784,217));
            box2d.destroyBody(lines.get(3).body);
            lines.remove(3);
                break;
        case 4757: 
            if(lines.get(3).split(788,235));
            box2d.destroyBody(lines.get(3).body);
            lines.remove(3);
                break;
        case 4758: 
            if(lines.get(3).split(790,241));
            box2d.destroyBody(lines.get(3).body);
            lines.remove(3);
                break;
        case 4759: 
            if(lines.get(3).split(798,265));
            box2d.destroyBody(lines.get(3).body);
            lines.remove(3);
                break;
        case 4760: 
            if(lines.get(3).split(813,282));
            box2d.destroyBody(lines.get(3).body);
            lines.remove(3);
                break;
        case 4761: 
            if(lines.get(3).split(821,289));
            box2d.destroyBody(lines.get(3).body);
            lines.remove(3);
                break;
        case 4762: 
            if(lines.get(3).split(827,298));
            box2d.destroyBody(lines.get(3).body);
            lines.remove(3);
                break;
        case 4763: 
            if(lines.get(3).split(833,306));
            box2d.destroyBody(lines.get(3).body);
            lines.remove(3);
                break;
        case 4764: 
            if(lines.get(3).split(834,308));
            box2d.destroyBody(lines.get(3).body);
            lines.remove(3);
                break;
        case 4765: 
            if(lines.get(3).split(834,312));
            box2d.destroyBody(lines.get(3).body);
            lines.remove(3);
                break;
        case 4766: 
            if(lines.get(3).split(834,326));
            box2d.destroyBody(lines.get(3).body);
            lines.remove(3);
                break;
        case 4768: 
            if(lines.get(3).split(842,339));
            box2d.destroyBody(lines.get(3).body);
            lines.remove(3);
                break;
        case 4769: 
            if(lines.get(3).split(855,339));
            box2d.destroyBody(lines.get(3).body);
            lines.remove(3);
                break;
        case 4779: 
            boxes.get(0).killBody();
            boxes.remove(0);
                break;
        case 4784: 
            box2d.destroyBody(grains.get(84).body);
            grains.remove(84);
                break;
        case 4787: 
            if(lines.get(1).split(794,130));
            box2d.destroyBody(lines.get(1).body);
            lines.remove(1);
                break;
        case 4788: 
            if(lines.get(2).split(821,121));
            box2d.destroyBody(lines.get(2).body);
            lines.remove(2);
                break;
        case 4789: 
            box2d.destroyBody(boxes.get(0).body);
            boxes.remove(0);
            if(lines.get(2).split(844,116));
            box2d.destroyBody(lines.get(2).body);
            lines.remove(2);
                break;
        case 4790: 
            if(lines.get(2).split(862,110));
            box2d.destroyBody(lines.get(2).body);
            lines.remove(2);
                break;
        case 4791: 
            if(lines.get(2).split(878,102));
            box2d.destroyBody(lines.get(2).body);
            lines.remove(2);
                break;
        case 4792: 
            if(lines.get(2).split(891,95));
            box2d.destroyBody(lines.get(2).body);
            lines.remove(2);
                break;
        case 4809: 
            dots.remove(0);
                break;
        case 4819: 
            if(lines.get(0).split(565,280));
            box2d.destroyBody(lines.get(0).body);
            lines.remove(0);
                break;
        case 4820: 
            if(lines.get(2).split(571,253));
            box2d.destroyBody(lines.get(2).body);
            lines.remove(2);
                break;
        case 4821: 
            if(lines.get(2).split(574,232));
            box2d.destroyBody(lines.get(2).body);
            lines.remove(2);
                break;
        case 4822: 
            if(lines.get(2).split(577,220));
            box2d.destroyBody(lines.get(2).body);
            lines.remove(2);
                break;
        case 4823: 
            if(lines.get(2).split(580,212));
            box2d.destroyBody(lines.get(2).body);
            lines.remove(2);
                break;
        case 4824: 
            if(lines.get(2).split(587,198));
            box2d.destroyBody(lines.get(2).body);
            lines.remove(2);
                break;
        case 4825: 
            if(lines.get(2).split(595,187));
            box2d.destroyBody(lines.get(2).body);
            lines.remove(2);
                break;
        case 4826: 
            if(lines.get(2).split(605,172));
            box2d.destroyBody(lines.get(2).body);
            lines.remove(2);
                break;
        case 4827: 
            if(lines.get(2).split(609,157));
            box2d.destroyBody(lines.get(2).body);
            lines.remove(2);
                break;
        case 4831: 
            if(lines.get(2).split(574,100));
            box2d.destroyBody(lines.get(2).body);
            lines.remove(2);
                break;
        case 4832: 
            if(lines.get(3).split(563,97));
            box2d.destroyBody(lines.get(3).body);
            lines.remove(3);
                break;
        case 4833: 
            if(lines.get(3).split(553,96));
            box2d.destroyBody(lines.get(3).body);
            lines.remove(3);
                break;
        case 4834: 
            if(lines.get(3).split(550,95));
            box2d.destroyBody(lines.get(3).body);
            lines.remove(3);
                break;
        case 4835: 
            if(lines.get(3).split(544,92));
            box2d.destroyBody(lines.get(3).body);
            lines.remove(3);
                break;
        case 4836: 
            if(lines.get(3).split(526,87));
            box2d.destroyBody(lines.get(3).body);
            lines.remove(3);
                break;
        case 4837: 
            if(lines.get(3).split(509,83));
            box2d.destroyBody(lines.get(3).body);
            lines.remove(3);
                break;
        case 4838: 
            if(lines.get(3).split(504,81));
            box2d.destroyBody(lines.get(3).body);
            lines.remove(3);
                break;
        case 4839: 
            if(lines.get(3).split(500,80));
            box2d.destroyBody(lines.get(3).body);
            lines.remove(3);
            if(lines.get(1).split(500,80));
            box2d.destroyBody(lines.get(1).body);
            lines.remove(1);
                break;
        case 4840: 
            if(lines.get(3).split(492,78));
            box2d.destroyBody(lines.get(3).body);
            lines.remove(3);
            if(lines.get(2).split(492,78));
            box2d.destroyBody(lines.get(2).body);
            lines.remove(2);
                break;
        case 4841: 
            if(lines.get(3).split(483,78));
            box2d.destroyBody(lines.get(3).body);
            lines.remove(3);
            if(lines.get(2).split(483,78));
            box2d.destroyBody(lines.get(2).body);
            lines.remove(2);
                break;
        case 4842: 
            if(lines.get(3).split(472,76));
            box2d.destroyBody(lines.get(3).body);
            lines.remove(3);
            if(lines.get(2).split(472,76));
            box2d.destroyBody(lines.get(2).body);
            lines.remove(2);
                break;
        case 4843: 
            if(lines.get(3).split(457,73));
            box2d.destroyBody(lines.get(3).body);
            lines.remove(3);
            if(lines.get(2).split(457,73));
            box2d.destroyBody(lines.get(2).body);
            lines.remove(2);
                break;
        case 4844: 
            if(lines.get(3).split(441,72));
            box2d.destroyBody(lines.get(3).body);
            lines.remove(3);
            if(lines.get(2).split(441,72));
            box2d.destroyBody(lines.get(2).body);
            lines.remove(2);
                break;
        case 4845: 
            if(lines.get(3).split(437,72));
            box2d.destroyBody(lines.get(3).body);
            lines.remove(3);
            if(lines.get(2).split(437,72));
            box2d.destroyBody(lines.get(2).body);
            lines.remove(2);
                break;
        case 4846: 
            if(lines.get(3).split(435,72));
            box2d.destroyBody(lines.get(3).body);
            lines.remove(3);
            if(lines.get(2).split(435,72));
            box2d.destroyBody(lines.get(2).body);
            lines.remove(2);
                break;
        case 4847: 
            if(lines.get(3).split(430,76));
            box2d.destroyBody(lines.get(3).body);
            lines.remove(3);
            if(lines.get(2).split(430,76));
            box2d.destroyBody(lines.get(2).body);
            lines.remove(2);
                break;
        case 4848: 
            if(lines.get(3).split(419,83));
            box2d.destroyBody(lines.get(3).body);
            lines.remove(3);
            if(lines.get(2).split(419,83));
            box2d.destroyBody(lines.get(2).body);
            lines.remove(2);
                break;
        case 4849: 
            if(lines.get(3).split(412,92));
            box2d.destroyBody(lines.get(3).body);
            lines.remove(3);
            if(lines.get(2).split(412,92));
            box2d.destroyBody(lines.get(2).body);
            lines.remove(2);
                break;
        case 4850: 
            if(lines.get(3).split(406,98));
            box2d.destroyBody(lines.get(3).body);
            lines.remove(3);
                break;
        case 4851: 
            if(lines.get(3).split(401,103));
            box2d.destroyBody(lines.get(3).body);
            lines.remove(3);
                break;
        case 4852: 
            if(lines.get(3).split(397,107));
            box2d.destroyBody(lines.get(3).body);
            lines.remove(3);
                break;
        case 4853: 
            if(lines.get(3).split(393,107));
            box2d.destroyBody(lines.get(3).body);
            lines.remove(3);
                break;
        case 4854: 
            if(lines.get(3).split(386,109));
            box2d.destroyBody(lines.get(3).body);
            lines.remove(3);
            if(lines.get(2).split(386,109));
            box2d.destroyBody(lines.get(2).body);
            lines.remove(2);
                break;
        case 4855: 
            box2d.destroyBody(grains.get(7).body);
            grains.remove(7);
            if(lines.get(2).split(377,110));
            box2d.destroyBody(lines.get(2).body);
            lines.remove(2);
                break;
        case 4856: 
            if(lines.get(3).split(363,112));
            box2d.destroyBody(lines.get(3).body);
            lines.remove(3);
                break;
        case 4857: 
            if(lines.get(3).split(357,118));
            box2d.destroyBody(lines.get(3).body);
            lines.remove(3);
                break;
        case 4858: 
            if(lines.get(3).split(357,125));
            box2d.destroyBody(lines.get(3).body);
            lines.remove(3);
                break;
        case 4859: 
            if(lines.get(3).split(357,132));
            box2d.destroyBody(lines.get(3).body);
            lines.remove(3);
                break;
        case 4860: 
            if(lines.get(3).split(357,139));
            box2d.destroyBody(lines.get(3).body);
            lines.remove(3);
                break;
        case 4861: 
            if(lines.get(3).split(356,148));
            box2d.destroyBody(lines.get(3).body);
            lines.remove(3);
                break;
        case 4862: 
            if(lines.get(3).split(354,156));
            box2d.destroyBody(lines.get(3).body);
            lines.remove(3);
                break;
        case 4863: 
            if(lines.get(3).split(351,165));
            box2d.destroyBody(lines.get(3).body);
            lines.remove(3);
                break;
        case 4864: 
            if(lines.get(3).split(348,177));
            box2d.destroyBody(lines.get(3).body);
            lines.remove(3);
                break;
        case 4865: 
            if(lines.get(3).split(346,190));
            box2d.destroyBody(lines.get(3).body);
            lines.remove(3);
                break;
        case 4866: 
            if(lines.get(3).split(343,200));
            box2d.destroyBody(lines.get(3).body);
            lines.remove(3);
                break;
        case 4867: 
            if(lines.get(3).split(340,216));
            box2d.destroyBody(lines.get(3).body);
            lines.remove(3);
                break;
        case 4868: 
            if(lines.get(3).split(338,226));
            box2d.destroyBody(lines.get(3).body);
            lines.remove(3);
                break;
        case 4869: 
            if(lines.get(3).split(335,238));
            box2d.destroyBody(lines.get(3).body);
            lines.remove(3);
                break;
        case 4870: 
            if(lines.get(3).split(334,248));
            box2d.destroyBody(lines.get(3).body);
            lines.remove(3);
                break;
        case 4871: 
            if(lines.get(3).split(334,256));
            box2d.destroyBody(lines.get(3).body);
            lines.remove(3);
                break;
        case 4872: 
            if(lines.get(3).split(334,263));
            box2d.destroyBody(lines.get(3).body);
            lines.remove(3);
                break;
        case 4873: 
            if(lines.get(3).split(336,269));
            box2d.destroyBody(lines.get(3).body);
            lines.remove(3);
                break;
        case 4874: 
            if(lines.get(3).split(339,276));
            box2d.destroyBody(lines.get(3).body);
            lines.remove(3);
                break;
        case 4875: 
            box2d.destroyBody(grains.get(70).body);
            grains.remove(70);
            if(lines.get(3).split(344,282));
            box2d.destroyBody(lines.get(3).body);
            lines.remove(3);
                break;
        case 4876: 
            if(lines.get(3).split(350,287));
            box2d.destroyBody(lines.get(3).body);
            lines.remove(3);
                break;
        case 4877: 
            if(lines.get(3).split(356,289));
            box2d.destroyBody(lines.get(3).body);
            lines.remove(3);
                break;
        case 4878: 
            if(lines.get(3).split(367,289));
            box2d.destroyBody(lines.get(3).body);
            lines.remove(3);
                break;
        case 4879: 
            if(lines.get(3).split(380,288));
            box2d.destroyBody(lines.get(3).body);
            lines.remove(3);
                break;
        case 4880: 
            if(lines.get(3).split(392,287));
            box2d.destroyBody(lines.get(3).body);
            lines.remove(3);
                break;
        case 4881: 
            if(lines.get(3).split(410,287));
            box2d.destroyBody(lines.get(3).body);
            lines.remove(3);
                break;
        case 4882: 
            if(lines.get(3).split(427,285));
            box2d.destroyBody(lines.get(3).body);
            lines.remove(3);
                break;
        case 4883: 
            if(lines.get(3).split(436,285));
            box2d.destroyBody(lines.get(3).body);
            lines.remove(3);
                break;
        case 4884: 
            if(lines.get(3).split(446,285));
            box2d.destroyBody(lines.get(3).body);
            lines.remove(3);
                break;
        case 4885: 
            if(lines.get(3).split(460,288));
            box2d.destroyBody(lines.get(3).body);
            lines.remove(3);
                break;
        case 4886: 
            if(lines.get(3).split(485,292));
            box2d.destroyBody(lines.get(3).body);
            lines.remove(3);
                break;
        case 4887: 
            if(lines.get(3).split(496,294));
            box2d.destroyBody(lines.get(3).body);
            lines.remove(3);
                break;
        case 4888: 
            if(lines.get(3).split(508,294));
            box2d.destroyBody(lines.get(3).body);
            lines.remove(3);
                break;
        case 4889: 
            if(lines.get(3).split(514,293));
            box2d.destroyBody(lines.get(3).body);
            lines.remove(3);
                break;
        case 4890: 
            if(lines.get(3).split(522,289));
            box2d.destroyBody(lines.get(3).body);
            lines.remove(3);
                break;
        case 4891: 
            if(lines.get(3).split(531,284));
            box2d.destroyBody(lines.get(3).body);
            lines.remove(3);
                break;
        case 4903: 
            if(lines.get(1).split(585,165));
            box2d.destroyBody(lines.get(1).body);
            lines.remove(1);
                break;
        case 4904: 
            if(lines.get(2).split(585,156));
            box2d.destroyBody(lines.get(2).body);
            lines.remove(2);
                break;
        case 4905: 
            if(lines.get(2).split(585,151));
            box2d.destroyBody(lines.get(2).body);
            lines.remove(2);
                break;
        case 4906: 
            if(lines.get(2).split(581,143));
            box2d.destroyBody(lines.get(2).body);
            lines.remove(2);
                break;
        case 4907: 
            if(lines.get(2).split(577,136));
            box2d.destroyBody(lines.get(2).body);
            lines.remove(2);
                break;
        case 4919: 
            if(lines.get(1).split(415,79));
            box2d.destroyBody(lines.get(1).body);
            lines.remove(1);
                break;
        case 4920: 
            if(lines.get(1).split(411,79));
            box2d.destroyBody(lines.get(1).body);
            lines.remove(1);
                break;
        case 4921: 
            if(lines.get(1).split(400,79));
            box2d.destroyBody(lines.get(1).body);
            lines.remove(1);
                break;
        case 4922: 
            if(lines.get(1).split(393,79));
            box2d.destroyBody(lines.get(1).body);
            lines.remove(1);
                break;
        
        case 4982: 
            paddles.get(0).killBody();
            paddles.remove(0);
            numOfChoose=-1;
                break;
        case 4995: 
            box2d.destroyBody(grains.get(58).body);
            grains.remove(58);
                break;
        case 4998: 
            box2d.destroyBody(grains.get(32).body);
            grains.remove(32);
                break;
        case 4999: 
            box2d.destroyBody(grains.get(54).body);
            grains.remove(54);
                break;
        case 5004: 
            box2d.destroyBody(particles.get(12).body);
            particles.remove(12);
                break;
        case 5006: 
            box2d.destroyBody(grains.get(27).body);
            grains.remove(27);
                break;
        case 5010: 
            box2d.destroyBody(particles.get(3).body);
            particles.remove(3);
                break;
        case 5012: 
            box2d.destroyBody(grains.get(34).body);
            grains.remove(34);
                break;
        case 5021: 
            box2d.destroyBody(particles.get(12).body);
            particles.remove(12);
                break;
        case 5025: 
            box2d.destroyBody(grains.get(50).body);
            grains.remove(50);
                break;
        case 5032: 
            box2d.destroyBody(grains.get(75).body);
            grains.remove(75);
                break;
        case 5040: 
            box2d.destroyBody(particles.get(5).body);
            particles.remove(5);
                break;
        case 5045: 
            box2d.destroyBody(grains.get(69).body);
            grains.remove(69);
                break;
        case 5048: 
            box2d.destroyBody(particles.get(1).body);
            particles.remove(1);
                break;
        case 5051: 
            box2d.destroyBody(particles.get(2).body);
            particles.remove(2);
                break;
        case 5058: 
            box2d.destroyBody(particles.get(5).body);
            particles.remove(5);
                break;
        case 5066: 
            box2d.destroyBody(particles.get(4).body);
            particles.remove(4);
                break;
        case 5081: 
            box2d.destroyBody(grains.get(17).body);
            grains.remove(17);
                break;
        case 5084: 
            box2d.destroyBody(particles.get(2).body);
            particles.remove(2);
                break;
        case 5090: 
            box2d.destroyBody(grains.get(9).body);
            grains.remove(9);
                break;
        case 5092: 
            box2d.destroyBody(particles.get(0).body);
            particles.remove(0);
                break;
        case 5098: 
            box2d.destroyBody(particles.get(4).body);
            particles.remove(4);
                break;
        case 5100: 
            box2d.destroyBody(grains.get(57).body);
            grains.remove(57);
            box2d.destroyBody(grains.get(50).body);
            grains.remove(50);
            box2d.destroyBody(grains.get(2).body);
            grains.remove(2);
                break;
        case 5102: 
            box2d.destroyBody(grains.get(53).body);
            grains.remove(53);
                break;
        case 5103: 
            box2d.destroyBody(grains.get(34).body);
            grains.remove(34);
                break;
        case 5107: 
            box2d.destroyBody(particles.get(3).body);
            particles.remove(3);
                break;
        case 5114: 
            box2d.destroyBody(particles.get(2).body);
            particles.remove(2);
                break;
        case 5123: 
            box2d.destroyBody(grains.get(37).body);
            grains.remove(37);
                break;
        case 5125: 
            box2d.destroyBody(grains.get(45).body);
            grains.remove(45);
                break;
        case 5127: 
            box2d.destroyBody(grains.get(43).body);
            grains.remove(43);
                break;
        case 5132: 
            box2d.destroyBody(grains.get(38).body);
            grains.remove(38);
                break;
        case 5148: 
            box2d.destroyBody(grains.get(11).body);
            grains.remove(11);
                break;
        case 5149: 
            box2d.destroyBody(particles.get(0).body);
            particles.remove(0);
            box2d.destroyBody(grains.get(14).body);
            grains.remove(14);
                break;
        case 5150: 
            box2d.destroyBody(grains.get(41).body);
            grains.remove(41);
                break;
        case 5163: 
            box2d.destroyBody(particles.get(0).body);
            particles.remove(0);
                break;
        case 5176: 
            box2d.destroyBody(grains.get(41).body);
            grains.remove(41);
                break;
        case 5189: 
            box2d.destroyBody(grains.get(18).body);
            grains.remove(18);
                break;
        case 5198: 
            box2d.destroyBody(grains.get(41).body);
            grains.remove(41);
                break;
        case 5332: 
            numOfChoose=-1;
            for (int i = paddles.size()-1; i >= 0; i--)
            {
                Paddle p = paddles.get(i);
                box2d.destroyBody(p.body);
                paddles.remove(i);
            }
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
                break;

    }
    Display();
}