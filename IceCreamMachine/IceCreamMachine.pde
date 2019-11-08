int coin;
StringBuilder buff;
String test;
IceCreamVendor vendor;
State state[];
String[] labels = {"00", "20", "40", "60"};

void setup() {
  size(500, 500);
  textAlign(LEFT);
  textSize(30);
  buff = new StringBuilder();
  state = new State[4];
  for (int i=0; i<state.length; i++) {
    state[i] = new State(width/10, new PVector(30+(i*(width-20)/state.length), height/2), labels[i]);
  }
  state[0].activate();
  state[state.length-1].setAccept();
  state[state.length-1].hasNext = false;
  for (int i=0; i<state.length-1; i++) {
    state[i].setLineTerminal(state[i+1].center);
  }
  vendor = new IceCreamVendor(state);
}

void draw() {
  background(255);

  pushStyle();
  fill(0);
  if (buff.length()==0) {
    text("?", 0, height);
  } else {
    text(buff.toString(), 0, height);
  }
    text("="+vendor.total, width-textWidth(vendor.total+"="), height);
  popStyle();
  for (State i : state) {    
    if (i.hasNext)
      i.displayLine();
    i.displayState();
  }
}

void keyPressed() {
  getInput(keyCode);
}

void getInput(int key_code) {
  if (key_code==10) {              //enter
    if (vendor.intState()==state.length-1) {
      println(vendor.intState());
      vendor.reset();
    }
    coin = int(buff.toString());
    vendor.purchase(coin);
    buff.replace(0, buff.length(), "");
  } else if (key_code==8) {      //backspace
    if (buff.length()!=0)
      buff.deleteCharAt(buff.length()-1);
  } else {
    if (buff.length()<2 && ((key_code>=48 && key_code<=57) || (key_code>=96 && key_code<=105)))
      buff.append(key_code%48);
  }
}
