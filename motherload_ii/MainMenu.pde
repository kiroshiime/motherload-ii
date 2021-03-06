class MainMenu {
  
  //Class variables
  Engine e;
  PImage drillerImg, backgroundImg, mainMenuTitleImg;
  float animationTime = 0;
  float mainMenuOpacity = 0;
  float mainMenuTitleY = -200;
  float mainMenuDrillerOpacity = 0;
  float mainMenuStartButtonY = 1200;
  boolean hiding = false;
  StartButton startButton;
  JSONObject highScoreJson;
  int highScore = 0;
  String highScoreName = "";
  SoundPlayer sp;
  
  //Constructor
  MainMenu(Engine e){
    this.e = e;
    drillerImg = loadImage("main-menu-driller.png");
    drillerImg.resize((int)this.e.s(500),0);
    backgroundImg = loadImage("main-menu-background.png");
    backgroundImg.resize((int)this.e.s(1000),0);
    mainMenuTitleImg = loadImage("main-menu-title.png");
    mainMenuTitleImg.resize((int)this.e.s(1000),0);
    mainMenuTitleImg.resize((int)e.actualSize(1000),0);
    startButton = new StartButton(this.e,250,700,500,160);
    sp =  new SoundPlayer(dataPath("") + "/background.wav");
    try{
      sp.playSound();
    } catch (Exception ex){
      print(ex); 
    }
  }
  
  //Hide the main menu
  void hide(float ms){
    mainMenuTitleY -= 0.5 * ms;
    mainMenuDrillerOpacity -= 0.5 * ms;
    mainMenuOpacity -= 0.5 * ms;
    mainMenuStartButtonY += 0.5 * ms;
    if(animationTime > 1000){
      this.e.mainMenu = null;
    }
  }
  
  //Start button clicked event
  void startButtonClicked(){
    animationTime = 0;
    hiding = true;
  }
  
  //Just like draw function, but with ms value to make sure the game speed stays the same
  void tick(float ms){
    animationTime+=ms;
    tint(255,255,255,mainMenuOpacity);
    image(backgroundImg,e.actualPosition(0,0)[0],e.actualPosition(0,0)[1],e.actualSize(1000),e.actualSize(1000));
    tint(255,255,255,255);
    image(mainMenuTitleImg,e.actualPosition(0,mainMenuTitleY)[0],e.actualPosition(0,mainMenuTitleY)[1]);
    tint(255,255,255,mainMenuDrillerOpacity);
    image(drillerImg,e.actualPosition(250,0)[0],e.actualPosition(0,300)[1]);
    tint(255,255,255,255);
    textAlign(CENTER);
    fill(255);
    textSize(e.s(50));
    text("HIGHSCORE - " + e.highScoreName + "  " + str(e.highScore),e.x(500),e.y(600));
    
    startButton.setY(mainMenuStartButtonY);
    startButton.tick(ms);
    
    if(!hiding){
      if(mainMenuTitleY <= 200  && animationTime > 500){
        mainMenuTitleY += 0.5 * ms;
      }
      
      if(mainMenuDrillerOpacity <= 255  && animationTime > 500){
        mainMenuDrillerOpacity += 0.5 * ms;
      }
      
      if(mainMenuOpacity <= 255){
        mainMenuOpacity += 0.5 * ms;
      }
      
      if(mainMenuStartButtonY >= 700 && animationTime > 1000){
        mainMenuStartButtonY -= 0.5 * ms;
      }
    } else {
      hide(ms); 
    }
    
    if(startButton.mouseDown){
       startButtonClicked();
    }
  }
  
}