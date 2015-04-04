
int sensorPin = A0;
int sensorPin2 = A1;
int sensorValue = 0;
int sensorValue2 = 0;

void setup()
{
  pinMode(sensorPin, INPUT);
  pinMode(sensorPin2, INPUT);
  Serial.begin(9600);
}

void loop()
{
  sensorValue = analogRead(sensorPin);
  sensorValue = map(sensorValue,0, 1023, 0, 100);
  sensorValue2 = analogRead(sensorPin2);
  sensorValue2 = map(sensorValue2,0, 1023, 0, 100);
  Serial.print(sensorValue);
  Serial.print(",");
  Serial.print(sensorValue2);
  Serial.println(",");

  
}
