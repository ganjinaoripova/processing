
int red = 50;
int blue = 50;
int green = 50;
int opacity= 100;
String word = " ";


class Artwork {
  int bw; //brick width
  int bh; //brick height
  int c; //columns
  int r; //rows
  int co; //column offset
  int ro; //row offset
  float ri; // rotation increment
  boolean rectstate; 

  Artwork(int bw, int bh, int c, int r, int co, int ro, float ri) {
    this.bw = bw;
    this.bh = bh;
    this.c = c;
    this.r = r;
    this.co= co;
    this.ro=ro;
    this.ri=ri;
    this.rectstate= false;
  }
}
Artwork rect= new Artwork(155, 30, 50, 150, 95, 52, 0.05);



void setup() {
  size(1200, 1768);
  float size = 40;

  PFont f = createFont("Courier", size);
  textFont(f, size);

  background(255);
  smooth();
  //noFill();
  stroke(0, 0, 0, 70);
  //noStroke();
  //noLoop();
}

void draw() {


  translate(20, -5); //moves the shapes down and to the right//
  for (int i=0; i< rect.c; i++) {
    red +=  1;
    blue += 15 ;
    green += 8;

    fill(int(random(0, 150)), int(random(0, 150)), int(random(0, 150)), opacity);

    //fill(0,0,0);
    pushMatrix();
    translate(i * rect.co, 0);
    float r = random(-QUARTER_PI, QUARTER_PI); //rotation of the shapes
    int dir = 1;
    for (int j=0; j<rect.r; j++) {

      pushMatrix();
      translate(0, rect.ro * j);
      rotate(r);
      text(word, -rect.bw/2, -rect.bh/2 );
      // rect(-rect.bw/2, -rect.bh/2, rect.bw, rect.bh); //makes the rectangle
      popMatrix();
      r += dir * rect.ri;
      if (r > QUARTER_PI || r < -QUARTER_PI) dir *= -1; //rotates the shape every time it's made//
    }
    popMatrix();
  }
}


void keyPressed() {

  word = word + key;
  //text(word, -rect.bw/2, -rect.bh/2 );
  println(word);  //type in a word

  int keyIndex = -1;
  if (key >= 'A' && key <= 'Z') {
    keyIndex = key - 'A';
  } else if (key >= 'a' && key <= 'z') {
    keyIndex = key - 'a';
  }
  if (keyIndex == -1) {
    // If it's not a letter key, clear the screen
    background(255);
    word = " ";
  }

  if (key == CODED) {
    if (keyCode == UP) { //pressing the up arrow changes red
      print("begin- ");
    }
        red = int(random(0, 170));
    }
    //fill(red, blue, green,100);

    else if (keyCode == DOWN) { //pressing the down arrow changes blue
      blue= int(random(0, 160));
    } else if (keyCode == RIGHT) { //pressing the right arrow changes opacity
      opacity+=15;
    }
  }

