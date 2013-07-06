void setup()
{
  size(1280, 720,P2D);
}

void draw()
{
  for(int x = 0; x <= width; x ++)
  {
    for(int y = 0; y <= height; y ++)
    {     
     float v = 0;
     if(y != height/2) v = x % (y - height/2);
     
     int vp = floor(v);
     stroke(vp%255, (vp*2)%255, (vp*4)%255);
     point(x,y); 
    } 
  }
  // Uncomment below lines to save a picture 
  // save("out.png"); 
  // exit();
}
