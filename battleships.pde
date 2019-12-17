//two windows are created, one connected to the webcam, one makes the board.
//they can be used independently. so each window can occupy one monitor, facing away from one another
//one player selects five (for the sake of not making the game too long) squares on the grid
// the other places a red token on a transparent sheet above the webcam.
// the colour red is tracked and matched to the selected squares on the grid.
// if they match, it's a hit and a green led goes on. if not, it's a miss, and a yellow led goes on



import processing.serial.*;

Serial myPort;  // Create object from Serial class




color[] colors = new color[2]; //array of two colours
int[][] indexes = {
  { 0, 0, 0, 0}, 
  { 0, 0, 0, 0}, 
  { 0, 0, 0, 0}, 
  { 0, 0, 0, 0} 
}; //makes the board- each square is originally grey, which is 0 in the colour index

int closestX;
int closestY;


class PWindow extends PApplet {
  PWindow() {
    super();
    PApplet.runSketch(new String[] {this.getClass().getSimpleName()}, this);
  } //to make another window



  void settings() {
    size(800, 800);
  }



  void setup() {
    colorMode(HSB);
    stroke(255);
    colors[0] = color(#aba9a4); //grey
    colors[1] = color(#e60505); //red- if selected
    //change the 0 to a 1 or 2 etc. to match your port
  }

  void draw() {
    for ( int row = 0; row < 4; row++ ) {
      for ( int square = 0; square < 4; square++ ) {
        fill( colors[ indexes[row][square] ] ); //fills the squares with grey   
        rect( 200 * square, 200 * row, 200, 200 );
      } //makes the grid
    }
  }

  void mousePressed() {
    // Find where the mouse was clicked.
    int x = mouseX / 200;
    int y = mouseY / 200;
    //println(mouseX / 200, mouseY / 200);
    // If that is a valid position,
    if ( x >= 0 && x < 5 && y >= 0 && y < 5 ) {
      // goes to the next colour- red.
      indexes[y][x]++;
      // if pressed again, goes back to grey (in case the player changes their mind)
      indexes[y][x]%=colors.length;
      //println( indexes[y][x]);
    }
  }
}



PWindow win; //second window

public void settings() {
  //size(800, 800);
  size(1600, 800);
}

void setup() { 
  win = new PWindow();
  String portName = Serial.list()[0]; 
  myPort = new Serial(this, portName, 9600);


  String[] cameras = Capture.list();
  //printArray(cameras);
  video = new Capture(this, cameras[93]);
  video.start();
  // Start off tracking for red
  trackColor = color(255, 0, 0);

  //}
}

import processing.video.*;

// Variable for capture device
Capture video;

// A variable for the color we are searching for.
color trackColor; 


void captureEvent(Capture video) {
  // Read image from the camera
  video.read();
}

void draw() {
  video.loadPixels();
  image(video, 0, 0);

  // Before we begin searching, the "world record" for closest color is set to a high number that is easy for the first pixel to beat.
  float worldRecord = 500; 


  // Begin loop to walk through every pixel
  for (int x = 0; x < video.width; x++ ) {
    for (int y = 0; y < video.height; y++ ) {
      int loc = x + y * video.width;
      // What is current color
      color currentColor = video.pixels[loc];
      float r1 = red(currentColor);
      float g1 = green(currentColor);
      float b1 = blue(currentColor);
      float r2 = red(trackColor);
      float g2 = green(trackColor);
      float b2 = blue(trackColor);

      // Using euclidean distance to compare colors
      float d = dist(r1, g1, b1, r2, g2, b2); // We are using the dist( ) function to compare the current color with the color we are tracking.

      // If current color is more similar to tracked color than
      // closest color, save current location and current difference
      if (d < worldRecord) {
        worldRecord = d;
        closestX = x;
        closestY = y;
      }
    }
  }

  // We only consider the color found if its color distance is less than 10. 
  // This threshold of 10 is arbitrary and you can adjust this number depending on how accurate you require the tracking to be.
  if (worldRecord < 10) {
  }
  fill(trackColor);
  strokeWeight(4.0);
  stroke(0);
  ellipse(closestX, closestY, 16, 16);
  //draws an ellipse at the reddest pixel it detects

  for ( int row = 0; row < 4; row++ ) {
    for ( int square = 0; square < 8; square++ ) {
      //fill( colors[ indexes[row][square] ] ); //fills the squares with grey   
      rect( 200 * square, 200 * row, 200, 200 );
      noFill();
    } //makes the grid
  }
}



void mousePressed() {
  //you can click anywhere on the board once you've moved your token to a certain grid to select it.
  if (indexes[closestY/200][closestX/200] == 1) {
    println("hit"); 
    myPort.write('1');  //if the token on the grid matches a red square on your opponent's board, processing sends a 1 to arduino which lights up a green led
    //}
    //}
  } else 
  {                          
    myPort.write('0');
    println("miss");//if it doesn't match, processing sends a 0, which lights up a yellow led
  }
}
