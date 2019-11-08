enum type {
  KEYWORD, 
  VALID, 
  INVALID
};

String pattern = "([a-zA-Z]|_)([0-9A-Za-z]|_)*";
String keywords = "(abstract|continue|for|package|this|assert|default|if|private|throw|boolean|double|implements"
  +"|protected|throws|break|else|import|public|try|byte|enum|instanceof|return|void|case"
  +"|extends|int|short|while|catch|final|interface|static|char|finally|long|super|class|float|new|switch)";

color ifJavaId = color(0, 255, 0);
color ifnJavaId = color(255, 0, 0);
color ifKeyword = color(255, 0, 255);


type lastMatch;
float text;
ArrayList<String> keyword, valid, invalid;
StringBuilder buff;
String prompt = ">";

void setup() {  
  size(500, 500);
  //fullScreen();
  //textAlign(LEFT);

  text = ((width+height)/2)/20;
  textSize(text);
  buff = new StringBuilder();
  keyword = new ArrayList<String>();
  valid = new ArrayList<String>();
  invalid = new ArrayList<String>();
}

void draw() {
  background(255);

  fill(0);
  text(prompt, 0, 0+text);

  if (buff.toString().matches(keywords)) {
    lastMatch = type.KEYWORD; 
    fill(ifKeyword);
  } else if (buff.toString().matches(pattern)) {
    lastMatch = type.VALID;
    fill(ifJavaId);
  } else {
    lastMatch = type.INVALID;
    fill(ifnJavaId);
  }

  printToCanvas();
  //printStats();
}

void keyTyped(){
  getInput(key);
}

void printStats(){
  pushStyle();
  textAlign(CENTER);
  fill(ifKeyword);
  text("Keywords:" + keyword.size(), textWidth(" Keywords:")/2, height-textDescent());
  fill(ifJavaId);
  text("Valid:" + valid.size(), width/3+textWidth("Keywords:")/2, height-textDescent());
  fill(ifnJavaId);
  text("Invalid:" + invalid.size(), 2*width/3+textWidth("Keywords:")/2, height-textDescent());
  popStyle();
}

void printToCanvas() {
  int charsPerLine = int(width/(text/2));
  int numOfLines = buff.length()/charsPerLine;
  int i = 0;
  int start=0, end=0;

  while (i<=numOfLines) {
    start = i*charsPerLine;
    end = i*charsPerLine+charsPerLine;
    if (end>buff.length()) {
      end = buff.length();
    }
    text(buff.subSequence(start, end).toString(), textWidth(prompt), text*i+text);     
    i++;
  }
  if (frameCount%50 < 50/2) {
    pushStyle();
    fill(0);
    text("|", textWidth(prompt) + textWidth(buff.subSequence(start, end).toString()), text*i);
    popStyle();
  }
}

void getInput(char key_val) {
  if (key_val==BACKSPACE) {      //backspace
    if (buff.length()!=0)
      buff.deleteCharAt(buff.length()-1);
  } else if (key_val==ENTER) {
    if (lastMatch == type.KEYWORD) {
      keyword.add(buff.toString());
    } else if (lastMatch == type.VALID) { 
      valid.add(buff.toString());
    } else if (lastMatch == type.INVALID) { 
      invalid.add(buff.toString());
    } else {
    }
    buff.delete(0, buff.length());
  } 
  else if (key_val==TAB) {
    buff.append("  ");
  } 
  else if (int(key_val)==65535) {
  } 
  else if (int(key_val)==24) {
    buff.delete(0, buff.length());
  }
  else if (int(key_val)==1) {
    println("KEYWORDS:", keyword.toString());
    println("VALID:", valid.toString());
    println("INVALID:", invalid.toString());
  }
  else {
    buff.append(key_val);
  }
}
