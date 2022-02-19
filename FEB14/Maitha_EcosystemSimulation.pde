/* 
 This is my first homework assignment for Robota Psyche
 Assignment: The Ecosystem Project
 Title: Oxygen Deprivation Tank
 
 This program simulates an ecosystem where organisms are attracted to the oxygen tank in the middle.
 The colour of the oxygen tank reflects oxygen levels in the ecosystem. Green = Abundant Oxygen, 
 Yellow = Low Oxygen, Red = No Oxygen. The speed of the organisms is affected by the oxygen levels
 as well as their concentration around the tank. To manipulate oxygen levels, move your mouse around
 the tank. 
 
 This program was written by Maitha AlGhfeli
 14 Feb 2022
 */

//INITIALISING MY CLASSES
Organism[] o = new Organism[100]; //ORGANISMS ARE PART OF AN ARRAY, HAVE AS MANY AS YOU PREFER
Tank t; 


//------------------------------------------
void setup() {
  
  size(600, 700);
  
  //AN OXYGEN TANK IS INITIALISED
  t = new Tank();  

  for (int i = 0; i < o.length; i++) {
    //EACH ORGANISM IS INITIALISED WITH A RANDOM MASS AND LOCATION
    o[i] = new Organism(random(0.1, 2), random(width), random(height)); 
  }
}


//------------------------------------------
void draw() {
  background(0); 
  //CALL OXYGEN TANK FUNCTIONS
  t.tankLight();
  t.display();
  
  //FOR EACH ORGANISM
  for (int i = 0; i < o.length; i++) {
    PVector aForce = t.attract(o[i]); //FORCE OF ATTRACTION FROM THE TANK
    o[i].applyForce(aForce);
    for (int j = 0; j < o.length; j++) { //FORCE OF ATTRACTION OF THE OTHER ORGANISMS
      if (i != j) { //DON'T ATTRACT SELF
        PVector force = o[j].attract(o[i]);
        o[i].applyForce(force);
      }
    }
    
    //CALL ORGANISM FUNCTIONS
    o[i].update();
    o[i].display();
    o[i].checkEdges();    
  }
}


//------------------------------------------
class Tank{
  
  //SETTING MY VARIABLES
  int radius = 60; //TANK SIZE
  int colour = 0; //INITIALISING TANK COLOUR TO FACILITATE RED-YELLOW-GREEN INDICATORS
  PVector location;
  float mass;
  float G;
  
  //CALLING PVECTOR
  Tank() {
    location = new PVector(width/2, height/2);
    mass = 60; //ORGANISM-TANK ATTRACTION > ORGANISM-ORGANISM ATTRACTION
    G = 0.4;
  }
  
  //ORGANISM-VEHICLE ATTRACTION
  PVector attract(Organism o) {
    PVector force = PVector.sub(location, o.location);
    float distance = force.mag();
    distance = constrain(distance, 5.0, 25.0); //CONTROLLED SPIN
    force.normalize();
    float strength = (G * mass * o.mass) / (distance * distance);
    force.mult(strength);
    return force;
  }
  
  //GREEN-YELLOW-RED TANK INDICATORS
  void tankLight(){
    if(dist(mouseX, mouseY, width/2, height/2) < radius){ //MOUSE IS INSIDE THE TANK - RED
      colour = 0;
    } else if(dist(mouseX, mouseY, width/2, height/2) < radius*3){ //MOUSE IS AROUND THE TANK - YELLOW
      colour = 2;
    } else { //MOUSE IS FAR FROM THE TANK - GREEN
      colour = 1;
    }
  }
  
  //DISPLAY TANK - TANK ACTS LIKE A TRAFFIC LIGHT
  void display(){
    if(colour == 0){ //WHEN MOUSE IS IN THE TANK, SHOW RED
      noStroke();
      fill(255, 0, 0);
      ellipse(width/2, height/2, radius*2, radius*2);
    } else if(colour == 1){ //WHEN MOUSE IS FAR FROM THE TANK, SHOW GREEN
      noStroke();
      fill(0, 255, 0);
      ellipse(width/2, height/2, radius*2, radius*2);
    } else { //WHEN MOUSE IS CLOSE TO THE TANK, SHOW YELLOW
      noStroke();
      fill(255, 234, 0);
      ellipse(width/2, height/2, radius*2, radius*2);
    }
  }  
}


//------------------------------------------
class Organism {
  //SETTING MY VARIABLES
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;
  float G = 0.4;
  
  //CALLING PVECTOR
  Organism(float _mass_, float _x_, float _y_) {
    mass = _mass_;
    location = new PVector(_x_, _y_);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
  }

  //NEWTON'S SECOND LAW
  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass); //GET FORCE, DIVIDE MASS, ADD TO ACCELERATION
    acceleration.add(f);
  }

  //ORGANISMS ATTRACT EACH OTHER
  PVector attract(Organism o) {
    PVector force = PVector.sub(location, o.location);
    float distance = force.mag();
    distance = constrain(distance, 5.0, 100.0);
    force.normalize();
    float strength = (G * mass * o.mass) / (distance * distance);
    force.mult(strength);
    return force;
  }

  //MOVE ORGANISMS
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
    //SPEED OF ORGANISMS DEPENDING ON TANK INDICATORS
    if (t.colour == 0){
      velocity.mult(0); //WHEN TANK IS RED, MOVEMENT IS VIRTUALLY NONEXISTENT 
    } else if (t.colour == 1){
      velocity.mult(1); //WHEN TANK IS GREEN, MOVEMENT IS FAST 
    } else { 
      velocity.mult(0.9); //WHEN TANK IS YELLOW, MOVEMENT IS SLOWED
    }
  }
  
  //DISPLAY ORGANISM
  void display() {
    stroke(0);
    fill(255);
    //ORGANISM POINTS IN DIRECTION OF TRAVEL
    pushMatrix();
    translate(location.x, location.y);
    rotate(velocity.heading());
    triangle(0, 5, 0, -5, 20, 0);
    popMatrix();
  }

  //CHECK IF ORGANISMS HIT THE EDGES OF THE ECOSYSTEM
  void checkEdges() {
    if (location.x > width) {
      location.x = width;
      velocity.x *= -1; //BOUNCE OFF THE RIGHT OF THE ECOSYSTEM
    } else if (location.x < 0) {
      location.x = 0;
      velocity.x *= -1; //BOUNCE OFF THE LEFT OF THE ECOSYSTEM
    }
    if (location.y > height) {
      location.y = height;
      velocity.y *= -1; //BOUNCE OFF THE TOP OF THE ECOSYSTEM
    } else if (location.y < 0) {
      location.y = 0;
      velocity.y *= -1; //BOUNCE OFF THE BOTTOM OF ECOSYSTEM
    }
  }
}


//------------------------------------------------------------END!
