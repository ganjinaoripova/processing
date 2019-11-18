import processing.serial.*;
Serial myPort;
float xSpeed = 6; //speed of the 'car'
int cL = 50; //car Length
int x; //x position of car
int y; //y position of car
char inByte;
void setup(){
  size(1500,500);
  String portName = Serial.list()[0];
  myPort = new Serial(this, portName, 9600);
  smooth();
  x = 0;
  y = height/2;
}

void draw(){
  background(0);
  inByte = myPort.readChar(); 
  print(inByte); //testing  
  print("\n");
  myPort.clear();
  end();
  update();
  display();
}


void display(){
  noStroke();
 fill(43, 194, 240);
  rect(x,y,cL,cL); //create "car"
}

void update(){
  if (inByte=='g'){ //green: makes the car go if it's stopped or slowed down
    if (xSpeed == 0 || xSpeed == 2){
        xSpeed = 6;
    
    } 
   
  }
  
   if (inByte=='s'){ //slows the car down if it's going at 5 
    if (xSpeed == 6){
        xSpeed = 2;
    }
    fill(22, 199, 6);
  }
  
   if (inByte=='r'){ //stop if it's going at 5 or 2
    if (xSpeed == 6 || xSpeed == 2){      
        xSpeed = 0;
    }
    fill(220, 199, 0);
  }
  
  else if (inByte =='n'){ //this series of if conditions is to ensure that the ball will fall when it's at the top after I set the yspeed to 0 in collision
    if (xSpeed ==0 || xSpeed == 2){
      if (x<=cL/2){
        xSpeed = 6;
      }
    }
    x += xSpeed;
  }
  
}

void end(){
  
  
  if ((x<cL/2)||(x>width-cL/2)){ // if the car reaches the end of the canvass, it'll go back to the beginning
     xSpeed = 0;
  }
}
