import controlP5.*;
import beads.*;
import org.jaudiolibs.beads.*;

//Global Variables
SamplePlayer sp, alert, ambient;
ControlP5 p5;
Button frequency, b1, b2, b3, b4, b5, b6, w1, w2, w3;
Slider sl;
WavePlayer wp, wp1, wp2, wp3;

//Get Ambient Sounds
void getAmbientSound(String filepath) {
  ambient.pause(true);
  ambient = getSamplePlayer(filepath);
  ambient.setLoopType(SamplePlayer.LoopType.LOOP_FORWARDS);
  ac.out.addInput(ambient);
  ambient.start();
}

//Get Alert Sounds
void getAlertSound(String filepath) {
  sp.pause(true);
  sp = getSamplePlayer(filepath);
  ac.out.addInput(sp);
  sp.start();
}

void setup() {
  size(640, 480);
  noStroke();
  
  //Instantiate Global Variables
  ac = new AudioContext();
  p5 = new ControlP5(this);
  
  //Create Buttons
  b1 = p5.addButton("Alert_1")
         .setSize(60, 35)
         .setPosition(25,75)
         ;
         
  b2 = p5.addButton("Alert_2")
         .setSize(60, 35)
         .setPosition(90,75)
         ;
         
  b3 = p5.addButton("Alert_3")
         .setSize(60, 35)
         .setPosition(155,75)
         ;
  
  b4 = p5.addButton("Ambient_1")
         .setSize(60, 35)
         .setPosition(25,30)
         ;
         
  b5 = p5.addButton("Ambient_2")
         .setSize(60, 35)
         .setPosition(90,30)
         ;
         
  b6 = p5.addButton("Ambient_3")
         .setSize(60, 35)
         .setPosition(155,30)
         ;
         
  w1 = p5.addButton("Frequency_1")
        .setSize(60,35)
        .setPosition(25, 120)
        ;
        
  w2 = p5.addButton("Frequency_2")
        .setSize(60,35)
        .setPosition(90, 120)
        ;

  w3 = p5.addButton("Frequency_3")
        .setSize(60,35)
        .setPosition(155, 120)
        ;
         
  frequency = p5.addButton("Play Frequency")
                .setPosition(75, 195)
                .setSize(90, 35)
                ;
  
  //Slider Setup
  sl = p5.addSlider("Frequency")
         .setSize(180, 15)
         .setPosition(25, 170)
         ;
         
  //Ambient and Alert Setup
  ambient = getSamplePlayer("piano2.wav");
  ambient.pause(true);
  sp = getSamplePlayer("piano2.wav");
  sp.pause(true);
  
  wp1 = new WavePlayer(ac, 440.0, Buffer.SINE);
  wp1.pause(true);
  ac.out.addInput(wp1);
  
  wp2 = new WavePlayer(ac, 660.0, Buffer.SINE);
  wp2.pause(true);
  ac.out.addInput(wp2);
  
  wp3 = new WavePlayer(ac, 880.0, Buffer.SINE);
  wp3.pause(true);
  ac.out.addInput(wp3);
         
  ac.start();
}

void draw() {
 background(0); 
 loadAmbientEngine();
 loadAlertEngine();
 loadFrequencies();
}

void loadAmbientEngine() {
  if (b4.isPressed() == true) {
     getAmbientSound("low_ambient.wav");
  } else if (b5.isPressed() == true) {
     getAmbientSound("mid_ambient.wav");
  } else if (b6.isPressed() == true) {
     getAmbientSound("high_ambient.wav"); 
  }
  
}
  

void loadAlertEngine() {
  if (b1.isPressed() == true) {
     getAlertSound("piano2.wav");
  } else if (b2.isPressed() == true) {
     getAlertSound("piano3.wav");
  } else if (b3.isPressed() == true) {
     getAlertSound("piano5.wav"); 
  }
}

void loadFrequencies() {
  if (w1.isPressed() == true) {
     wp1.pause(!wp1.isPaused());
  } else if (w2.isPressed() == true) {
     wp2.pause(!wp2.isPaused());
  } else if (w3.isPressed() == true) {
     wp3.pause(!wp3.isPaused());
  }
}

void loadSlider() {
  float currentFreq = sl.getValue();
  wp = new WavePlayer(ac, currentFreq, Buffer.SINE);
  ac.out.addInput(wp);
}
