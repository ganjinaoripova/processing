int brickWidth = 155;
int brickHeight = 30;
int cols = 50;
int rows = 150;
int columnOffset = 65;
int rowOffset = 12;

float rotationIncrement = 0.05;

void setup() {
  size(1200, 1768);
  
  background(255);
  smooth();
  noFill();
  stroke(0,0,0, 70);
  //noStroke();
  noLoop();
}

void draw() {

  int red = int(random(0,170));
int blue = int(random(0,150));
int green= int(random(0,160));
  //fill(48, 121, 161);
  translate(20, -5);
  for (int i=0; i<cols; i++) {
    red += 10 ;
     blue += 15 ;
     green += 5;
     
    fill(red, green, blue, 100);

    pushMatrix();
    translate(i * columnOffset, 0);
    float r = random(-QUARTER_PI, QUARTER_PI);
    int dir = 1;
    for (int j=0; j<rows; j++) {
     
      pushMatrix();
      translate(0, rowOffset * j);
      rotate(r);
      rect(-brickWidth/2, -brickHeight/2, brickWidth, brickHeight);
      popMatrix();
      r += dir * rotationIncrement;
      if (r > QUARTER_PI || r < -QUARTER_PI) dir *= -1;
    }
    popMatrix();
  }
}
