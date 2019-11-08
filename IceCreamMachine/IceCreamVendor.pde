enum states {      
    s_START, 
    s_TWENTY, 
    s_FORTY,
    s_ACCEPT
}

class IceCreamVendor {  
  int coin, total;
  states state;
  State[] graphic_states;

  IceCreamVendor(State[] g_states) {
    coin = 0;
    total = 0;
    state = states.s_START;
    graphic_states = g_states;
  } 

  void purchase(int coin) {          
    if (coin==20 || coin==40) {
      advanceState(coin);
    }    
    if(state == states.s_ACCEPT){
      println("Received:" + total);      
    }
  }
  
  void reset(){
    coin = 0;
    total = 0;
    graphic_states[intState()].deactivate();
    state = states.s_START;
    graphic_states[intState()].activate();
  }

  void advanceState(int value) {
    if (value==20) {
      graphic_states[intState()].deactivate();
      if (state==states.s_START) {
        state = states.s_TWENTY;
      } else if (state==states.s_TWENTY) {
        state = states.s_FORTY;
      } else {
        state = states.s_ACCEPT;
      }
      total+=value;
    } else {
      graphic_states[intState()].deactivate();
      if (state==states.s_START) {
        state = states.s_FORTY;
      } else {
        state = states.s_ACCEPT;
      }
      total+=value;
    }
    graphic_states[intState()].activate();         
  }
  
  int intState(){
    int output;
    if(state==states.s_START){
      output = 0;
    }else if(state==states.s_TWENTY){
      output = 1;
    }else if(state==states.s_FORTY){
      output = 2;
    }else{
      output = 3;
    }
    
    return output;
  }
}
