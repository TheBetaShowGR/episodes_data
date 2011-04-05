int sensorValue;  //Μεταβλητη που θα κρατει τις τιμες που διαβαζει απο το μικροφωνο
int sensorPin = A0;    // Η θυρα analog 0
int ledPin = 8,ledPin2=9; //θυρες 8 και 9 τα led
boolean l=false,l2=false,k=false; //μεταβλητες που μας βοηθανε για το αναμα και σβησιμο των LEDs 
unsigned long time; //Μεταβλητη που θα κρατα τους χρονους (σε ms) αναμεσα στα claps 

void setup()
{
  pinMode(ledPin, OUTPUT); //Δηλνουμε τα Pin των LEDs να συμπεριφρονται σαν εξοδοι
  pinMode(ledPin2, OUTPUT);
  digitalWrite(ledPin,LOW); //Τα αρχικοποιομε να εναι σβηστα
  digitalWrite(ledPin2,LOW);    
}

void loop() 
{
 
  sensorValue = analogRead(sensorPin);     //Διαβζουμε τη θρα που χουμε βαλει το mic
  
  if(sensorValue>=650){   //Αν η ενταση ειναι αρκετα μεγαλη τοτε να το θεωρει παλαμακι και να συνεχιζει παρακατω  
     
    time=millis();    //κραταει το χρνο απο το πρωτο παλαμακι
    delay(20); //περιμενει 20 ms
    while(millis()-time<=350){ //για τα επομενα 350 ms περιμενει παλαμακι 
      sensorValue = analogRead(sensorPin);      
      if(sensorValue>=650)          //αν διαβασει και αλλο παλαμακι η κ γινεται αληθης.
          k=true;   
    }
    if(k){  //αν κ ειναι αληθης αναβει η σβηνει το δευτερο led 
     if(l2==false){
      l2=true;
      digitalWrite(ledPin2,HIGH);
    }else{
      l2=false;
      digitalWrite(ledPin2,LOW);
    }
      k=false;
    }else{       //αν κ ειναι ψευδης αναβει η σβηνει το πρωτο led 
     if(l==false){
      l=true;
      digitalWrite(ledPin,HIGH);

    }else{
      l=false;
      digitalWrite(ledPin,LOW);

    }
    } 
    
  }
}
