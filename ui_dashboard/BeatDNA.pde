class BeatDNA {
  int beatLength = 16;
  int numInstruments = 3;

  int[][] beat;
  
  BeatDNA() {
    beat = new int[numInstruments][beatLength];
    for (int i = 0; i < numInstruments; i++) {
      for (int j = 0; j < beatLength; j++) {
        beat[i][j] = 0;
      }
    }
  }
  
  BeatDNA(int _beatLength, int _numInstruments) {
    beatLength = _beatLength;
    numInstruments = _numInstruments;
    
    beat = new int[numInstruments][beatLength];
    for (int i = 0; i < numInstruments; i++) {
      for (int j = 0; j < beatLength; j++) {
        beat[i][j] = 0;
      }
    }
  }
  
  BeatDNA(int[][] existingBeat) {
    if (existingBeat != null) {
      beatLength = existingBeat[0].length;
      numInstruments = existingBeat.length;
      
      beat = new int[numInstruments][beatLength];
      for (int i = 0; i < numInstruments; i++) {
        for (int j = 0; j < beatLength; j++) {
          beat[i][j] = existingBeat[i][j];
        }
      }
    }    
  }

  //Perform crossover between two parent beats to generate a new beat
  BeatDNA crossover(BeatDNA partner) {
    // perform crossover, likely want to go instrument by instrument
    int[][] newDNA = new int[numInstruments][beatLength];
    for (int i = 0; i < numInstruments; i++) {
      int crossover = int(random(beatLength));
      for (int j = 0; j < beatLength; j++) {
        if (j > crossover)
          newDNA[i][j] = beat[i][j];
        else
          newDNA[i][j] = partner.beat[i][j];
      }
    } 
    BeatDNA newBeat = new BeatDNA(newDNA);
    return newBeat;
  }

  //TODO
  // mutate based on probability
  void mutate(float m) {
    for (int i = 0; i < numInstruments; i++) {
      for (int j = 0; j < beatLength; j++) {
        if (random(1) < m)
          beat[i][j] = int(random(0,2));
      }
    } 
  }
}
