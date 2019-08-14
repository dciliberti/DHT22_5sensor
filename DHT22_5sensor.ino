/*
    DHT22_5sensor.ino - Arduino code for the readings of temperature and humidity sensors.
    Copyright (C) 2018  Danilo Ciliberti dancili@gmail.com

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <https://www.gnu.org/licenses/>
*/

// Libraries
#include <DHT.h>


// Initialize DHT sensor for normal 16mhz Arduino
DHT dht1(2, DHT22);
DHT dht2(4, DHT22);
DHT dht3(7, DHT22);
DHT dht4(8, DHT22);
DHT dht5(12, DHT22);

int const stopPin = 6;
int stopFlag = 0;


// Variables
float hum;  //Stores humidity value
float temp; //Stores temperature value

void setup()
{
  pinMode(stopPin, INPUT);
  Serial.begin(9600);
  dht1.begin();
  dht2.begin();
  dht3.begin();
  dht4.begin();
  dht5.begin();
}

void loop()
{
    delay(2000);

    // Read humidity from the 5 sensors and display it on a single line
    hum = dht1.readHumidity();
    Serial.print(hum);
    Serial.print(":");
    hum = dht2.readHumidity();
    Serial.print(hum);
    Serial.print(":");
    hum = dht3.readHumidity();
    Serial.print(hum);
    Serial.print(":");
    hum = dht4.readHumidity();
    Serial.print(hum);
    Serial.print(":");
    hum = dht5.readHumidity();
    Serial.print(hum);
    Serial.print(":");

    // Read temperature from the 5 sensors and display it on a single line
    temp = dht1.readTemperature();
    Serial.print(temp);
    Serial.print(":");
    temp = dht2.readTemperature();
    Serial.print(temp);
    Serial.print(":");
    temp = dht3.readTemperature();
    Serial.print(temp);
    Serial.print(":");
    temp = dht4.readTemperature();
    Serial.print(temp);
    Serial.print(":");
    temp = dht5.readTemperature();

    // Check stop condition
    stopFlag = digitalRead(stopPin);
      if (stopFlag == LOW){
        Serial.println(temp);
      }
      else{
        Serial.print(temp);
        Serial.println(":999");
      }
    
}
