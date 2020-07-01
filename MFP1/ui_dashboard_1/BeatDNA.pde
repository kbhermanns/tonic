class BeatDNA {
  int numBeats = 16;
  int numInstruments = 3;
  Boolean[][] beat;
  
  BeatDNA() {
    beat = new Boolean[numInstruments][numBeats];
    for (int i = 0; i < numBeats; i++) {
      for (int j = 0; j < numInstruments; j++) {
        beat[i][j] = false;
      }
    }
  }
  
  BeatDNA(int numB, int numIns) {
    numBeats = numB;
    numInstruments = numIns;
    
    beat = new Boolean[numInstruments][numBeats];
    for (int i = 0; i < numBeats; i++) {
      for (int j = 0; j < numInstruments; j++) {
        beat[i][j] = false;
      }
    }
  }
  
  BeatDNA(Boolean[][] existingBeat) {
    if (existingBeat != null) {
      numBeats = existingBeat[0].length;
      numInstruments = existingBeat.length;
      
      beat = new Boolean[numInstruments][numBeats];
      for (int i = 0; i < numBeats; i++) {
        for (int j = 0; j < numInstruments; j++) {
          beat[i][j] = false;
        }
      }
    }    
  }

  //TODO
  //Beat crossover(Beat partner) {
      //perform crossover, likely want to go instrument by instrument  
  //}

  //TODO
  // mutate based on probability
  void mutate(float m) {

  }

}
