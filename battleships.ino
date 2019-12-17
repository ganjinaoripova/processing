char val; // Data received from the serial port
int hit = 8; // green LED
int miss = 9; //yellow LED
void setup() {
  pinMode(hit, OUTPUT);
  pinMode(miss, OUTPUT);// Set pin as OUTPUT
  Serial.begin(9600); // Start serial communication at 9600 bps
}

void loop() {
  if (Serial.available())
  { // If data is available to read,
    val = Serial.read(); // read it and store it in val
  }
  if (val == '1')
  { // If 1 was received (if it's a hit)
    digitalWrite(hit, HIGH); // turn the LED on
    delay (1000);
    digitalWrite(hit, LOW); // turn the LED off
    delay (1000); //makes the LED blink
  } else {
    digitalWrite(hit, LOW); // otherwise turn it off
  }
  delay(10); // Wait 10 milliseconds for next reading

  if (val == '0')
  { // If 0 was received (if it's a miss)
    digitalWrite(miss, HIGH); // turn the LED on
    delay (1000);
    digitalWrite(miss, LOW); // turn the LED on
    delay (1000); //makes the LED blink
  } else {
    digitalWrite(miss, LOW); // otherwise turn it off
  }


}
