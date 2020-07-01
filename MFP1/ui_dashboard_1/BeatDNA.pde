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

  //Perform crossover between two parent beats to generate a new beat
  BeatDNA crossover(BeatDNA partner) {
      // perform crossover, likely want to go instrument by instrument
      Boolean[][] newBeatDNA = new Boolean[numInstruments][numBeats];
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
            beat[i][j] = boolean(int(random(0,1.1)));
        }
      } 
  }
}
