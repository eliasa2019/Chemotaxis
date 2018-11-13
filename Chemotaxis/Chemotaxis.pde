int width = 800;
int colonySize = 100;
Bacteria[] bacteria = new Bacteria[colonySize];
int bacterium = 0;
float size = 20;
boolean randomWalk = true;
float glide = 0.01;

void settings() {
  size(width, width);
}

void setup()   
{  
  background(100);
  frameRate(30);
  noStroke();
  for (int i = 0; i < colonySize; i++) bacteria[i] = new Bacteria(width / 2, width / 2, size);
}   
void draw()   
{
  for (int i = 0; i < colonySize; i++) {
    bacteria[i].show();
    bacteria[i].move();
  }
}
void mouseClicked() {
  randomWalk = !randomWalk;
}
class Bacteria   
{     
  float x, y, size;
  int[] colour = new int[3];

  Bacteria() {
    this.x = 0;
    this.y = 0;
    this.size = 10;
    for (int i = 0; i < this.colour.length; i++) this.colour[i] = (int)(Math.random()*128)+128;
  }
  Bacteria(int x, int y) {
    this.x = x;
    this.y = y;
    this.size = 10;
    for (int i = 0; i < this.colour.length; i++) this.colour[i] = (int)(Math.random()*128)+128;
  }
  Bacteria(int x, int y, float size) {
    this.x = x;
    this.y = y;
    this.size = size;
    for (int i = 0; i < this.colour.length; i++) this.colour[i] = (int)(Math.random()*128)+128;
  }

  void move() {
    if (randomWalk) {
      if (Math.random()>=.5) {
        this.x += Math.random()>=.5 ? size : -size;
      } else {
        this.y += Math.random()>=.5 ? size : -size;
      }
    } else {
      this.x += (mouseX - x)*glide;
      this.y += (mouseY - y)*glide;
    }
  }
  void show() {
    fill(this.colour[0], this.colour[1], this.colour[2]);
    ellipse(this.x, this.y, size, size);
  }
}
