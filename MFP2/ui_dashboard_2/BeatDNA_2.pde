class BeatDNA {
  int numBeats = 16;
  int numInstruments = 3;
  boolean[][] beat;
  
  BeatDNA() {
    beat = new boolean[numInstruments][numBeats];
    for (int i = 0; i < numInstruments; i++) {
      for (int j = 0; j < numBeats; j++) {
        beat[i][j] = false;
      }
    }
  }
  
  BeatDNA(int numB, int numIns) {
    numBeats = numB;
    numInstruments = numIns;
    
    beat = new boolean[numInstruments][numBeats];
    for (int i = 0; i < numInstruments; i++) {
      for (int j = 0; j < numBeats; j++) {
        beat[i][j] = false;
      }
    }
  }
  
  BeatDNA(boolean[][] existingBeat) {
    if (existingBeat != null) {
      numBeats = existingBeat[0].length;
      numInstruments = existingBeat.length;
      
      beat = new boolean[numInstruments][numBeats];
      for (int i = 0; i < numInstruments; i++) {
        for (int j = 0; j < numBeats; j++) {
          beat[i][j] = false;
        }
      }
    }    
  }

  //Perform crossover between two parent beats to generate a new beat
  BeatDNA crossover(BeatDNA partner) {
      // perform crossover, likely want to go instrument by instrument
      boolean[][] newBeatDNA = new boolean[numInstruments][numBeats];
      for (int i=0; i<numInstruments; i++) {
        int crossover = int(random(numBeats));
        for (int j=0; j<numBeats; j++) {
          if (j > crossover)
            newBeatDNA[i][j] = beat[i][j];
          else
            newBeatDNA[i][j] = partner.beat[i][j];
        }
      } 
      BeatDNA newBeat = new BeatDNA(newBeatDNA);
      return newBeat;     
  }

  //TODO
  // mutate based on probability
  void mutate(float m) {
    for (int i=0; i<numInstruments; i++) {
        for (int j=0; j<numBeats; j++) {
          if (random(1) < m)
            beat[i][j] = boolean(int(random(0,2)));
        }
      } 
  }
}
