int value;
int previousVal = 0;
int btn = 2;

void setup() {
  Serial.begin(9600);
}

void loop() {
  value = int(analogRead(A0));
  int diff = previousVal - value;
  Serial.println(diff);
  previousVal = value;
  delay(40);
}
