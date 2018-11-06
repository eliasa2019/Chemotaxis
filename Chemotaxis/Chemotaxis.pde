//declare bacteria variables here   
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
  int x, y;
  int[] colour = new int[3];

  Bacteria() {
    this.x = 0;
    this.y = 0;
    for (int i = 0; i < 2; i++) colour[i] = (int)(Math.random()*128)+128;
  }
  Bacteria(int x, int y) {
    this.x = x;
    this.y = y;
    for (int i = 0; i < 2; i++) colour[i] = (int)(Math.random()*128)+128;
  }
  Bacteria(int x, int y, int r, int g, int b) {
    
  }
}
