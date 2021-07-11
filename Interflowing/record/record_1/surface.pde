class Surface
{
    ArrayList<Vec2> surface;                                          //statement arraylists
    Body body;                                                        //box2D body
    Surface()
    {
        surface = new ArrayList<Vec2>();                              //apply memory for arraylists
        ChainShape chain = new ChainShape();
        for(Vec2 v:surfaces)
        {
            surface.add(v);                                           //copy positions
        }
        Vec2[] vertices = new Vec2[surfaces.size()];                  //apply memory for vertices[]
        for(int i = 0; i < vertices.length; i++) 
        {
            vertices[i]=box2d.coordPixelsToWorld(surface.get(i));     //get position from surface
        }
        chain.createChain(vertices,vertices.length);                  //set shape by vertices[]
        BodyDef bd = new BodyDef();
        bd.position.set(0.0f,0.0f);
        body = box2d.createBody(bd);
        body.createFixture(chain,1);
    }
    void display()                                                    //display by surface
    {
        strokeWeight(3);
        for(int i=1;i<surface.size();i++)
        {
            line(surface.get(i-1).x,surface.get(i-1).y,surface.get(i).x,surface.get(i).y);
        }
    }
    boolean split(float x0,float y0)
    {
        boolean del=false;
        surfaces=new ArrayList<Vec2>();
        float x1=surface.get(0).x,y1=surface.get(0).y,r_2=width*height*0.0004;
        float k,b,A,B,C,x3,y3,x4,y4,x2=0,y2=0;
        for(int i=1;i<surface.size();i++,x1=x2,y1=y2)
        {
            x2=surface.get(i).x;
            y2=surface.get(i).y;
            if(x2-x1==0)
            {
                if(r_2-(x1-x0)*(x1-x0)<0)
                {
                    surfaces.add(new Vec2(x1,y1));
                    continue;
                }
                else
                {
                    x3=x4=x1;
                    y3=y0-sqrt(r_2-(x1-x0)*(x1-x0));
                    y4=y0+sqrt(r_2-(x1-x0)*(x1-x0));
                }
            }
            else
            {
                k=(y2-y1)/(x2-x1);
                b=y1-x1*k;
                A=1+k*k;
                B=-2*x0+2*k*(b-y0);
                C=(b-y0)*(b-y0)+x0*x0-r_2;
                if(B*B-4*A*C<0)
                {
                    surfaces.add(new Vec2(x1,y1));
                    continue;
                }
                x3=(-B+sqrt(B*B-4*A*C))/(2*A);
                x4=(-B-sqrt(B*B-4*A*C))/(2*A);
                y3=x3*k+b;
                y4=x4*k+b;
            }
            fill(#123456);
            ellipse(x3,y3,20,20);
            ellipse(x4,y4,20,20);
       
       
            if((x1-x0)*(x1-x0)+(y1-y0)*(y1-y0)<r_2)
            {
                if(!del)
                {
                    del=true;
                }
                if((x2-x0)*(x2-x0)+(y2-y0)*(y2-y0)<r_2)
                {
                    continue;
                }
                if(((x3<=x2&&x3>=x1)||(x3>=x2&&x3<=x1))&&((y3<y2&&y3>=y1)||(y3>=y2&&y3<=y1)))
                {
                    surfaces.add(new Vec2(x3,y3));
                }
                else
                {
                    surfaces.add(new Vec2(x4,y4));
                }
                continue;
            }
            if((x2-x0)*(x2-x0)+(y2-y0)*(y2-y0)<r_2)
            {
                if(!del)
                {
                    del=true;
                }
                surfaces.add(new Vec2(x1,y1));
                if(((x3<=x2&&x3>=x1)||(x3>=x2&&x3<=x1))&&((y3<=y2&&y3>=y1)||(y3>=y2&&y3<=y1)))
                {
                    surfaces.add(new Vec2(x3,y3));
                }
                else
                {
                    surfaces.add(new Vec2(x4,y4));
                }
                for(int t=surfaces.size()-2;t>=0;t--)
                {
                    if((surfaces.get(t).x-surfaces.get(t+1).x)<0.5&&(surfaces.get(t).x-surfaces.get(t+1).x)>-0.5&&(surfaces.get(t).y-surfaces.get(t+1).y)<0.5&&(surfaces.get(t).y-surfaces.get(t+1).y)>-0.5)
                    {
                        surfaces.remove(t);
                    }
                }
                if(surfaces.size()>1)
                {
                    lines.add(new Surface());
                }
                surfaces=new ArrayList<Vec2>();
                continue;
            }
            if(((x3<=x1&&x3<=x2)||(x3>=x1&&x3>=x2))&&((y3<=y1&&y3<=y2)||(y3>=y1&&y3>=y2)))
            {
                surfaces.add(new Vec2(x1,y1));
                continue;
            }
            if(!del)
            {
                del=true;
            }
            
            surfaces.add(new Vec2(x1,y1));
            if(((x1<=x3&&x3<=x4)||(x1>=x3&&x3>=x4))&&((y1<=y3&&y3<=y4)||(y1>=y3&&y3>=y4)))
            {
                surfaces.add(new Vec2(x3,y3));
                for(int t=surfaces.size()-2;t>=0;t--)
                {
                    if((surfaces.get(t).x-surfaces.get(t+1).x)<0.5&&(surfaces.get(t).x-surfaces.get(t+1).x)>-0.5&&(surfaces.get(t).y-surfaces.get(t+1).y)<0.5&&(surfaces.get(t).y-surfaces.get(t+1).y)>-0.5)
                    {
                        surfaces.remove(t);
                    }
                }
                if(surfaces.size()>1)
                {
                    lines.add(new Surface());
                }
                surfaces=new ArrayList<Vec2>();
                surfaces.add(new Vec2(x4,y4));
            }
            else
            {
                surfaces.add(new Vec2(x4,y4));
                for(int t=surfaces.size()-2;t>=0;t--)
                {
                    if((surfaces.get(t).x-surfaces.get(t+1).x)<0.5&&(surfaces.get(t).x-surfaces.get(t+1).x)>-0.5&&(surfaces.get(t).y-surfaces.get(t+1).y)<0.5&&(surfaces.get(t).y-surfaces.get(t+1).y)>-0.5)
                    {
                        surfaces.remove(t);
                    }
                }
                if(surfaces.size()>1)
                {
                    lines.add(new Surface());
                }
                surfaces=new ArrayList<Vec2>();
                surfaces.add(new Vec2(x3,y3));
            }
        }
        if(del)
        {
            if((x2-x0)*(x2-x0)+(y2-y0)*(y2-y0)>r_2)
            {
                surfaces.add(new Vec2(x2,y2));
            }
            for(int t=surfaces.size()-2;t>=0;t--)
            {
                if((surfaces.get(t).x-surfaces.get(t+1).x)<0.5&&(surfaces.get(t).x-surfaces.get(t+1).x)>-0.5&&(surfaces.get(t).y-surfaces.get(t+1).y)<0.5&&(surfaces.get(t).y-surfaces.get(t+1).y)>-0.5)
                {
                    surfaces.remove(t);
                }
            }
            if(surfaces.size()>1)
            {
                lines.add(new Surface());
            }
        }
        surfaces=new ArrayList<Vec2>();   
        return del;
    }
}