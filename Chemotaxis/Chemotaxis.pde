Bacteria[] bacteria = new Bacteria[20];

void setup()   
{     
  //initialize bacteria variables here
}   
void draw()   
{    
  //move and show the bacteria
}  
class Bacteria    
{     
  int x, y, size;
  int[] colour = new int[3];

  Bacteria() {
    this.x = 0;
    this.y = 0;
    for (int i : colour) colour[i] = (int)(Math.random()*128)+128;
  }
  Bacteria(int x, int y) {
    this.x = x;
    this.y = y;
    for (int i : colour) colour[i] = (int)(Math.random()*128)+128;
  }
  
  void move() {
    this.x += Math.random()>.5 ? -size : size;
    this.y += Math.random()>.5 ? -size : size;
  }
  void show() {
    ellipse(x,y,size,size);
  }
}
