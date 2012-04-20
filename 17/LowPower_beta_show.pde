
//Links to check
//LowPower Library tutorial
//http://www.rocketscream.com/blog/2011/07/04/lightweight-low-power-arduino-library/
//arduino playground example
//http://arduino.cc/playground/Learning/ArduinoSleepCode
//poli kalo tutorial
//http://donalmorrissey.blogspot.com/2010/04/putting-arduino-diecimila-to-sleep-part.html

#include "LowPower.h"

void setup()
{
    Serial.begin(9600);
    Serial.println("started");
}

void loop() 
{
  
   Serial.println("================");
   for(int i=0;i<=20;i++){
   Serial.println("Kanw oles tis doulies mou");    
   delay(1000); 
   }
   sleep();    
}

void sleep(){
  Serial.println("peftw gia ypno"); 
  Serial.println(millis()); 
   LowPower.powerDown(SLEEP_8S, ADC_OFF, BOD_OFF);  //sleep gia 8sec kai meta ksipnaei mono tou 
   Serial.println("Ksipnisa");  //afou ksipnisei sinexizei apo dw
   Serial.println(millis()); 
}

