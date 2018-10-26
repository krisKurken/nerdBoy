
class Score{
  
  int score;
  int blink = 0;
  int showLevel = 2;
  
  Score(int value){
    score = value;  
  }
  
  void reset(){
    score = 0;
  }
  
  int getScore(){
    return score;
  }
  
  int getLevel(){
    if(score % 1000 == 0 && score > 1000 && score <= 10000){
      return score/1000;
    }
    return -1;
  }
  
  void paintCurrent(int level){
    textAlign(LEFT, CENTER);
    textSize(32);
    fill(47,79,79);
    text(String.format("Score: %d",score), 10, 30); 
    score++;
    if(level == showLevel && blink <= 100){
      textAlign(CENTER, CENTER);
      textSize(50);
      fill(254, 0, 0);
      text(String.format("Level %d",level), width/2, height/2);
      showLevel = blink == 100 ? showLevel + 1: showLevel;
      blink = blink == 100 ? 0 : blink + 1;
    }
  }
  
  void paintEnd(){
    if(blink > 30){
      textAlign(CENTER, CENTER);
      textSize(50);
      fill(254, 0, 0);
      text(String.format("YOU SCORED: %d",score), width/2, height/2);
    }
    blink = blink > 60 ? 0 : blink + 1;
  }
}
