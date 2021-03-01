import java.util.Calendar;
import java.text.DateFormat;
import java.time.format.DateTimeFormatter;
import java.lang.Thread;
import java.text.SimpleDateFormat;


DateFormat df = new SimpleDateFormat("HH:mm:ss");

import processing.sound.*;
SoundFile file;

private int target = 0;


private int seconds = 0;
private Panel panels[];


private String input = "";

private String screen = "BASE";

private boolean free = true;



class Button {
  int x, y, h, w;
  String text;
  
  Button(int x, int y, int w, int h) {
    this.x = x;
    this.y = y;
    this.h = h;
    this.w = w;
  }
  
  Button(int x, int y, int w, int h, String text) {
    this.x = x;
    this.y = y;
    this.h = h;
    this.w = w;
    this.text = text;
  }
  
}

class Panel {
  int x, y, h, w, num;
  String text;
  Button buttons[];
  
  Panel(int x, int y, int w, int h, int num) {
    this.x = x;
    this.y = y;
    this.h = h;
    this.w = w;
    this.num = num;
    this.buttons = new Button[num];
    
  }
  
  void drawButtons() {
      fill(224, 226, 219);
    rect(x, y, w, h);
    for (int i = 0; i < num; i++)
     {
  fill(224, 226, 219);
        rect(buttons[i].x, buttons[i].y, buttons[i].w, buttons[i].h);
        fill(0);
        textSize(20);
        textAlign(CENTER, CENTER);
        text(buttons[i].text, buttons[i].x + buttons[i].w/2, buttons[i].y + buttons[i].h/2);
     }
  }

}

public void setup(){
  size(375, 700);
  frameRate(30);
      textSize(72);
  textAlign(CENTER, CENTER);
  background(210, 212, 200);
  println("me? gongaga");
  file = new SoundFile(this, "ding.mp3");
  
  panels = new Panel[5];
  
  // the side bevel or whatever
  
  fill(210, 200, 200);
  rect(5, 5, 365, 690);
  
  // this is the time panel
  fill(175, 62, 77);
  rect(18, 30, 340, 75);
  createTop();
  createBottom();
}

public void draw(){
  // we know there's 30 seconds to count
  // we can take the current time and add the seconds to it bit by bit
  if (target != millis())
  {
    int display = target - millis();
    if (display % 1000 > 0)
    {
      // println(display%1000);
      fill(175, 62, 77);
      rect(18, 30, 340, 75);
      fill(255);
      textSize(72);
      // println(display/1000);
      String displayString = String.format("%02d:%02d", display/1000/60, display/1000%60);
      println(displayString);
      if (displayString.equals("00:00"))
      {
       fill(175, 62, 77);
       rect(18, 30, 340, 75);
       fill(255);
       text("Done!", 190 , 60);
       //free= true;
       target = 0;
       file.play();
       print(target);
       print(free);
      } else {
        text(displayString, 190 , 60);
        // println(display/1000);
        
      }
    }
    }

  if (target == 0 && free){
          fill(175, 62, 77);
      rect(18, 30, 340, 75);
      fill(255);
      textSize(72);

          text(df.format(System.currentTimeMillis()), 190 , 60);

  }
}

public void createTop(){
  // creating panel 
  panels[0] = new Panel (40, 120, 300, 200, 3);
  fill(224, 226, 219);
  rect(panels[0].x, panels[0].y, panels[0].w, panels[0].h);
  
  // first button
  panels[0].buttons[0] = new Button(50, 140, 280, 40, "Auto Defrost");
  panels[0].buttons[1] = new Button(50, 200, 280, 40, "Reheat");
  panels[0].buttons[2] = new Button(50, 260, 280, 40, "Handy Helper");
  panels[0].drawButtons();
  
  // stuff that appears upon clicking first button
  panels[2] = new Panel (40, 120, 300, 200, 4);
  panels[2].buttons[0] = new Button(55, 135, 270, 35, "Beef");
  panels[2].buttons[1] = new Button(55, 175, 270, 35, "Chicken");
  panels[2].buttons[2] = new Button(55, 215, 270, 35, "Fish");
  panels[2].buttons[3] = new Button(55, 255, 270, 35, "Pork");
  
  // appears upon clicking the second button
  panels[3] = new Panel (40, 120, 300, 200, 2);
  panels[3].buttons[0] = new Button(55, 135, 270, 35, "Room Temperature");
  panels[3].buttons[1] = new Button(55, 175, 270, 35, "Refrigerated");
  
  // stuff that appears upon clicking first button
  panels[4] = new Panel (40, 120, 300, 200, 3);
  panels[4].buttons[0] = new Button(55, 135, 270, 35, "Melt Chocolate");
  panels[4].buttons[1] = new Button(55, 175, 270, 35, "Melt Butter");
  panels[4].buttons[2] = new Button(55, 215, 270, 35, "Soften Cream Cheese");



}

public void createBottom()
{
  // Making the bottom panel
  panels[1] = new Panel (40, 330, 300, 360, 14);
  fill(224, 226, 219);
  rect(panels[1].x, panels[1].y, panels[1].w, panels[1].h);

  // Number clicking

  panels[1].buttons[0] = new Button(60, 340, 60, 60);
  panels[1].buttons[1] = new Button(160, 340, 60, 60);
  panels[1].buttons[2] = new Button(260, 340, 60, 60);
  panels[1].buttons[3] = new Button(60, 410, 60, 60);
  panels[1].buttons[4] = new Button(160, 410, 60, 60);
  panels[1].buttons[5] = new Button(260, 410, 60, 60);
  panels[1].buttons[6] = new Button(60, 480, 60, 60);
  panels[1].buttons[7] = new Button(160, 480, 60, 60);
  panels[1].buttons[8] = new Button(260, 480, 60, 60);
  panels[1].buttons[9] = new Button(60, 550,60, 60);
  panels[1].buttons[10] = new Button(160, 550, 60, 60);
  panels[1].buttons[11] = new Button(260, 550, 60, 60);
  panels[1].buttons[12] = new Button(60, 620, 60, 60);
  panels[1].buttons[13] = new Button(160, 620, 160, 60);
    
  for (int i = 0; i < panels[1].buttons.length; i++)
  {
    println("going");
    fill(175, 62, 77);
    rect(panels[1].buttons[i].x, panels[1].buttons[i].y, panels[1].buttons[i].w, panels[1].buttons[i].h);
    fill(255);
    textSize(30);
    textAlign(CENTER, CENTER);
    if(i < 9)
    {
      text(i+1, panels[1].buttons[i].x + (panels[1].buttons[i].w/2), panels[1].buttons[i].y + (panels[1].buttons[i].h/2));
    }
    if(i == 9)
    {
       textSize(15);
      text("Power\nLevel", panels[1].buttons[i].x + (panels[1].buttons[i].w/2), panels[1].buttons[i].y + (panels[1].buttons[i].h/2));
    }
    if(i == 10)
    {
      text(0, panels[1].buttons[i].x + (panels[1].buttons[i].w/2), panels[1].buttons[i].y + (panels[1].buttons[i].h/2));
    }
    if(i == 11)
    {
       textSize(15);
      text(" + 30s", panels[1].buttons[i].x + (panels[1].buttons[i].w/2), panels[1].buttons[i].y + (panels[1].buttons[i].h/2));
    }
    if(i == 12)
    {
          textSize(15);
      text("Pause/\nCancel", panels[1].buttons[i].x + (panels[1].buttons[i].w/2), panels[1].buttons[i].y + (panels[1].buttons[i].h/2));
    }
    if(i == 13)
    {
          textSize(30);
      text("Start", panels[1].buttons[i].x + (panels[1].buttons[i].w/2), panels[1].buttons[i].y + (panels[1].buttons[i].h/2));
    }
  }
}
public void mousePressed() {
print(screen);
  
  if (mouseX >= panels[0].x && mouseX <= panels[0].x + panels[0].w &&
      mouseY >= panels[0].y && mouseY <= panels[0].y + panels[0].h && screen == "BASE") {
        
      for (int i = 0; i < panels[0].num + 1; i++)
     {
       if(mouseX >= panels[0].buttons[i].x && mouseX <= panels[0].buttons[i].x + panels[0].buttons[i].w &&
      mouseY >= panels[0].buttons[i].y && mouseY <= panels[0].buttons[i].y + panels[0].buttons[i].h)
      {
        println(panels[0].buttons[i].text);
        topPanelChoice(panels[0].buttons[i].text);
        break;
      }
     }

    print("clicked in top panel button");
  }
  else if (mouseX >= panels[2].x && mouseX <= panels[2].x + panels[2].w &&
           mouseY >= panels[2].y && mouseY <= panels[2].y + panels[2].h && screen == "DEFROST") {
     // check chicken stuff or whatever
     for (int i = 0; i < panels[2].num + 1; i++)
     {
       if(mouseX >= panels[2].buttons[i].x && mouseX <= panels[2].buttons[i].x + panels[2].buttons[i].w &&
      mouseY >= panels[2].buttons[i].y && mouseY <= panels[2].buttons[i].y + panels[2].buttons[i].h)
      {
        println(panels[2].buttons[i].text);
        defrostChoice(panels[2].buttons[i].text);
        break;
      }
     }
  }
  
  else if (mouseX >= panels[3].x && mouseX <= panels[3].x + panels[3].w &&
           mouseY >= panels[3].y && mouseY <= panels[3].y + panels[3].h && screen == "REHEAT") {
     // check chicken stuff or whatever
     for (int i = 0; i < panels[3].num + 1; i++)
     {
       if(mouseX >= panels[3].buttons[i].x && mouseX <= panels[3].buttons[i].x + panels[3].buttons[i].w &&
      mouseY >= panels[3].buttons[i].y && mouseY <= panels[3].buttons[i].y + panels[3].buttons[i].h)
      {
        println(panels[3].buttons[i].text);
        reheatChoice(panels[3].buttons[i].text);
        break;
      }
     }
  }
  
  else if (mouseX >= panels[4].x && mouseX <= panels[4].x + panels[4].w &&
           mouseY >= panels[4].y && mouseY <= panels[4].y + panels[4].h && screen == "HELPER") {
     // check chicken stuff or whatever
     for (int i = 0; i < panels[4].num + 1; i++)
     {
       if(mouseX >= panels[4].buttons[i].x && mouseX <= panels[4].buttons[i].x + panels[4].buttons[i].w &&
      mouseY >= panels[4].buttons[i].y && mouseY <= panels[4].buttons[i].y + panels[4].buttons[i].h)
      {
        println(panels[4].buttons[i].text);
        helperChoice(panels[4].buttons[i].text);
        break;
      }
     }
  }
  else if (mouseX >= panels[1].x && mouseX <= panels[1].x + panels[1].w &&
      mouseY >= panels[1].y && mouseY <= panels[1].y + panels[1].h){
    println("clicked in bottom panel");
    free = false;
    
    // number operations
    // check that the number can only be minutes to hours
    
    if(input.length() < 4) {
    
  if (mouseX >= panels[1].buttons[0].x && mouseX <= panels[1].buttons[0].x + panels[1].buttons[0].w &&
      mouseY >= panels[1].buttons[0].y && mouseY <= panels[1].buttons[0].y + panels[1].buttons[0].h) 
  {
    input += 1;

          
  }
  if (mouseX >= panels[1].buttons[1].x && mouseX <= panels[1].buttons[1].x + panels[1].buttons[1].w &&
      mouseY >= panels[1].buttons[1].y && mouseY <= panels[1].buttons[1].y + panels[1].buttons[1].h) 
  {
    input += 2;
          
  }
  if (mouseX >= panels[1].buttons[2].x && mouseX <= panels[1].buttons[2].x + panels[1].buttons[2].w &&
      mouseY >= panels[1].buttons[2].y && mouseY <= panels[1].buttons[2].y + panels[1].buttons[2].h) 
  {
    input += 3;
          
  }
  if (mouseX >= panels[1].buttons[3].x && mouseX <= panels[1].buttons[3].x + panels[1].buttons[3].w &&
      mouseY >= panels[1].buttons[3].y && mouseY <= panels[1].buttons[3].y + panels[1].buttons[3].h) 
  {
    input += 4;
          
  }
  if (mouseX >= panels[1].buttons[4].x && mouseX <= panels[1].buttons[4].x + panels[1].buttons[4].w &&
      mouseY >= panels[1].buttons[4].y && mouseY <= panels[1].buttons[4].y + panels[1].buttons[4].h) 
  {
    input += 5;
          
  }
  if (mouseX >= panels[1].buttons[5].x && mouseX <= panels[1].buttons[5].x + panels[1].buttons[5].w &&
      mouseY >= panels[1].buttons[5].y && mouseY <= panels[1].buttons[5].y + panels[1].buttons[5].h) 
  {
    input += 6;
          
  }
  if (mouseX >= panels[1].buttons[6].x && mouseX <= panels[1].buttons[6].x + panels[1].buttons[6].w &&
      mouseY >= panels[1].buttons[6].y && mouseY <= panels[1].buttons[6].y + panels[1].buttons[6].h) 
  {
    input += 7;
          
  }
  if (mouseX >= panels[1].buttons[7].x && mouseX <= panels[1].buttons[7].x + panels[1].buttons[7].w &&
      mouseY >= panels[1].buttons[7].y && mouseY <= panels[1].buttons[7].y + panels[1].buttons[7].h) 
  {
    input += 8;
          
  }
  if (mouseX >= panels[1].buttons[8].x && mouseX <= panels[1].buttons[8].x + panels[1].buttons[8].w &&
      mouseY >= panels[1].buttons[8].y && mouseY <= panels[1].buttons[8].y + panels[1].buttons[8].h) 
  {
    input += 9;
          
  }
  if (mouseX >= panels[1].buttons[10].x && mouseX <= panels[1].buttons[10].x + panels[1].buttons[10].w &&
      mouseY >= panels[1].buttons[10].y && mouseY <= panels[1].buttons[10].y + panels[1].buttons[10].h) 
  {
    input += 0;
          
  }
  
      updateInput();

    }
  
    // cancel button
  
  if (mouseX >= panels[1].buttons[12].x && mouseX <= panels[1].buttons[12].x + panels[1].buttons[12].w &&
      mouseY >= panels[1].buttons[12].y && mouseY <= panels[1].buttons[12].y + panels[1].buttons[12].h) 
  {
    createTop();
    print("CLEARING");
    screen = "BASE";
    target = 0;

    input = "";
    
        free = true;
          
  }
  // start button
  
 if (mouseX >= panels[1].buttons[13].x && mouseX <= panels[1].buttons[13].x + panels[1].buttons[13].w &&
      mouseY >= panels[1].buttons[13].y && mouseY <= panels[1].buttons[13].y + panels[1].buttons[13].h && target == 0) 
  {
    print("start button");
    println(input);
    textSize(72);
    if (input.length() > 2) {
      int min_to_sec = int(input.substring(0, input.length() - 2)) * 60;
      int sec = int(input.substring(input.length() -2 ));
      // print(min_to_sec + sec);
      target = millis() + ((min_to_sec + sec) * 1000) + 1000;
      // print(target);
    }
    else {
      target = millis() + (int(input) * 1000) + 1000;
    }
    input = "abcd";
    // text(target, 200 , 65);
          
  }
          
          
    
    }
}

void clickedAutoDefrost() {
  screen = "DEFROST";
  panels[2].drawButtons();
  
}

void clickedReheat() {
  screen = "REHEAT";
  println("clickedreheat");
  panels[3].drawButtons();
  
}


void clickedHelper() {
  screen = "HELPER";
  panels[4].drawButtons();
  
}


void topPanelChoice(String choice) {

  switch(choice) {
    case "Auto Defrost":
    clickedAutoDefrost();
      break;
    case "Reheat":
      clickedReheat();
      break;
    case "Handy Helper":
    clickedHelper();
      break;

    default:
      break;
     
      
  }
}
void defrostChoice(String choice)
{
  print(choice);
  int duration = 0;
  switch(choice) {
    case "Chicken":
      duration = 31;
      break;
    case "Beef":
      duration = 46;
      break;
    case "Fish":
      duration = 41;
      break;
    case "Pork":
      duration = 54;
      break;
    default:
      break;
     
      
  }input = "abcd";
  free = false;
    target = millis() + 1000 + (duration*1000);
}

void helperChoice(String choice)
{
  print(choice);
  int duration = 0;
  switch(choice) {
    case "Melt Chocolate":
      duration = 31;
      break;
    case "Melt Butter":
      duration = 46;
      break;
    case "Soften Cream Cheese":
      duration = 41;
      break;
    default:
      break;
     
      
  }
  input = "abcd";
    free = false;
    target = millis() + 1000 + (duration*1000);
}

void reheatChoice(String choice)
{
    int duration = 0;
  switch(choice) {
    case "Room Temperature":
    duration = 3;
    break;
    case "Refrigerated":
    duration = 40;
    break;
    default:
    break;
  }
  input = "abcd";
    free = false;
      target = millis() + 1000 + (duration*1000);
}

void updateInput() {
      textSize(72);
  fill(175, 62, 77);
  rect(18, 30, 340, 75);
  String displayString = "";
  if (input.length () <= 2)
  {
    println('a');
    int i = int(input);
    displayString = String.format("00:%02d", i);

  }
  else 
  {
      println('a');
      int min_to_sec = int(input.substring(0, input.length() - 2));
      int sec = int(input.substring(input.length() -2 ));
      displayString = String.format("%02d:%02d", min_to_sec, sec);
  
  }
      if(displayString.equals("00:00")) 
  {
    // text(df.format(System.currentTimeMillis()), 190 , 60);
  }
  else {
  fill(255);
  text(displayString, 190 , 60);
  }

}
