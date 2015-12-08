class HUD{
 Engine e;
 PImage tank, fuelLevelImage;
 int fuelHeight,startCashDisplay;
 boolean showingFuelMessage = false, showingCashDisplay = false;
 
 HUD(Engine theEngine){
   e = theEngine;
   tank = loadImage("Fuel-icon.png");
   fuelLevelImage = loadImage("fuel-level-full.png");
   fuelLevelImage.resize((int)e.s(1000),0);
   startCashDisplay = millis();

 }
  
  
  
  void printToScreen(){
   fill(255,0,0);
   fuelHeight = e.player.fuel*10-10;
   fuelHeight = constrain(fuelHeight,0,100);
   rect(e.x(115),e.y(197-fuelHeight),e.actualSize(65),e.actualSize(fuelHeight));
   image(tank,e.actualPosition(100,100)[0],e.actualPosition(100,100)[1],e.actualSize(100),e.actualSize(100));
   if(showingFuelMessage) showFuelLevelFull();
   if(millis() < startCashDisplay + 1000){
     if(showingCashDisplay){
       textSize(32);
       fill(0,255,0);
       text("$" + str(e.cashVal-e.prevCashVal),e.x(300),e.y(300));
     }
   } else {
     showingCashDisplay = false;
   }
  }
  
  void showFuelLevelFull(){
    if(e.currentFrame % 10 <= 3){
      image(fuelLevelImage,e.x(0),e.y(500));
    }
  }
  
  void showCashVal(){
   
   startCashDisplay = millis();
   showingCashDisplay = true;
  }
  
}