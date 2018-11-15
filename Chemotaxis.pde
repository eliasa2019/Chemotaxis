/* CHEMOTAXIS by Elias A.
 * A project for Mr. Rhinelander's APCSA course at Armbrae Academy, Halifax, Canada
 * Due Thursday 15 November 2018
 */

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
  for (int i = 0; i < colonySize; i++) bacteria[i] = new Bacteria(width / 2, width / 2, size);    // Making a "colonySize" amount of Bacteria instances, starting at the center of the screen
}   
void draw()   
{
  for (int i = 0; i < colonySize; i++) {    // Repeatedly show and move each instance of bacteria 30 times per second
    bacteria[i].show();
    bacteria[i].move();
  }
}
void mouseClicked() {   // Switch between "gridded" movement to being attracted to the mouse
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
    for (int i = 0; i < this.colour.length; i++) this.colour[i] = (int)(Math.random()*128)+128;   // Loading each element of array colour[] with a random integer on the interval [128,255]
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
    if (randomWalk) {   // If doing gridded walk...
      if (Math.random()>=.5) {    //  50% chance that the bacterium will move left or right
        this.x += Math.random()>=.5 ? size : -size;   // 25% chance that the bacterium will move left, 25% chance to move right
      } else {    // 50% chance that the bacterium will move up or down
        this.y += Math.random()>=.5 ? size : -size;   // 25% chance that the bacterium will move up, 25% chance to move down
      }
    } else {    // If doing attracted-to-mouse walk...
      this.x += (mouseX - x)*glide;   // Add the difference between the mouse's x and the bacterium's x to the bacterium's x
      this.y += (mouseY - y)*glide;
    }
  }
  void show() {
    fill(this.colour[0], this.colour[1], this.colour[2]);
    ellipse(this.x, this.y, size, size);
  }
}
