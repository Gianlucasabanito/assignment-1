PVector location, target;
boolean running = false;
PImage anakin,background1,background2,Darth_Vader,expression;


void setup() { 
  size(1000, 500, P2D);
  
  location = new PVector(width/2, height/2);
  target = new PVector(random(width), random(height));  
  
   imageMode(CENTER);
   background1=loadImage("background1.jpg");
   anakin = loadImage("anakin.png");
   Darth_Vader = loadImage("Darth_Vader.png");
   anakin.resize(anakin.width/3,anakin.height/3);
   Darth_Vader.resize(Darth_Vader.width/9,Darth_Vader.height/9);

}

void draw() {
  image(background1,width/2,height/2);
  
  PVector mouseLoc = new PVector(mouseX, mouseY);
  running = location.dist(mouseLoc) < 100;
  location = location.lerp(target, 0.1);

  if (running) {
    tint(255, 105, 105);
    expression=Darth_Vader;
    if (location.dist(target) < 5) {
      target = new PVector(random(width), random(height));

    }
  }
  else{
    tint(#766F6F);
    expression=anakin;
  }
  
  if(keyPressed){
    target.lerp(mouseLoc,0.9);
    tint(#FC4F4F);
    expression=Darth_Vader;
    background2=loadImage("Background2.jpg");
    image(background2,width/2,height/2);

}
  
  image(expression,location.x, location.y);
  
}
