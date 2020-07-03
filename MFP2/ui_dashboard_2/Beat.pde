class Beat implements Comparable {
  final int size = 40;
  BeatDNA dna;
  float fitness;
  
  Beat(BeatDNA _dna) {
    dna = _dna;
    fitness = 0.0;
  }

  float getFitness() {
    return fitness;
  }

  void calcFitness(Beat baseStyle, Beat createdBeat, Beat likedBeat, Beat otherBeat) {
    // Just so we never have a max fitness of 0.
    fitness = 1.0 / (dna.beatLength * dna.numInstruments);
    for (int i = 0; i < dna.numInstruments; i++) {
      for (int j = 0; j < dna.beatLength; j++) {
        // If the createdBeat exists then disregard the style.
        if (createdBeat != null) {
          fitness *= dna.beat[i][j] != createdBeat.dna.beat[i][j] ? 1.0 : 2.0;
        } else {
          fitness *= dna.beat[i][j] != baseStyle.dna.beat[i][j] ? 1.0 : 2.0;
        }
        // Give beats similar to the liked beat extra weight.
        if (likedBeat != null)
          fitness *= dna.beat[i][j] != likedBeat.dna.beat[i][j] ? 1.0 : 4.0;
        // And beats similar to the other beat the opposite.
        if (otherBeat != null)
          fitness *= dna.beat[i][j] != otherBeat.dna.beat[i][j] ? 2.0 : 0.5;
      }
    }
  }

  BeatDNA getDNA() {
    return dna;
  }

  void display(PVector position) {
    pushMatrix();
    translate(position.x, position.y);
    rectMode(CENTER);
    for (int i = 0; i < dna.numInstruments; i++) {
      for (int j = 0; j < dna.beatLength; j++) {
        if (dna.beat[i][j] == false) fill(50);
        else if (dna.beat[i][j] == true) fill(160, 0, 0);
        else continue;
        rect(-size/2, -size/2, size, size);
        translate(size + 10, 0);
      }
      translate(-dna.beatLength * (size + 10), size + 10);
    }
    popMatrix();
  }

  int compareTo(Object o) {
    Beat b = (Beat) o;
    if (fitness > b.getFitness()) return 1;
    return fitness < b.getFitness() ? -1 : 0;
  }
  
  void print() {
  }
}
