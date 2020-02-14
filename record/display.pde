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
    for(Bomb b:bombs)
    {
        b.display();
    }                                               //display bombs
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
    for(Paddle p:paddles)
    {
        p.display(); 
    }
    for(Box b:boxes)
    {
        b.display(); 
    }                                               //display boxes
    for(Bridge b:bridges)
    {
        b.display();
    }                                               //display bridges;                                               //display rockers
    if(oWall)
    {
        wall.display();
    }                                               //display the wall
    
}