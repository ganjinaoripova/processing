const int yButton = 9;
const int rButton = 10;
const int gButton = 11;

const int yellow = 3;
const int red = 5;
const int green = 6;

int greenState = 0; //check if the button is pressed
int yellowState = 0; //check if the button is pressed
int redState = 0; //check if the button is pressed

void setup() {
  // put your setup code here, to run once:
  pinMode(9, INPUT);
  pinMode(10, INPUT);
  pinMode(11, INPUT);
  pinMode(3, OUTPUT);
  pinMode(5, OUTPUT);
  pinMode(6, OUTPUT);
  Serial.begin(9600);
  while (!Serial) { 
    ;
  }

}

void loop() {
  yellowState = digitalRead(yButton);
  if (yellowState == HIGH) {
    digitalWrite(3, HIGH);
    Serial.print('s'); //'slow' if the button is pressed

  }

  else {
    digitalWrite(3, LOW);
    Serial.print('n'); // 'n' is sent to processing if the button is not pressed
  }

  greenState = digitalRead(gButton);
  if (greenState == HIGH ) {
    digitalWrite(green, HIGH);
    Serial.print('g'); //'go' if the button is pressed

  }

  else {
    digitalWrite(green, LOW);
    Serial.print('n'); // 'n' is sent to processing if the button is not pressed
  }

  redState = digitalRead(rButton);
  if (redState == HIGH) {
    digitalWrite(red, HIGH);
    Serial.print('r'); //'stop' if the button is pressed
  }

  else {
    digitalWrite(red, LOW);
    Serial.print('n'); // 'n' is sent to processing if the button is not pressed
  }
}
