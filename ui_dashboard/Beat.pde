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
    // println("Liked beat" + likedBeat != null);
    fitness = 1.0 / (dna.beatLength * dna.numInstruments);
    // Use squared difference for each element to calculate fitness.
    for (int i = 0; i < dna.numInstruments; i++) {
      for (int j = 0; j < dna.beatLength; j++) {
        // If the createdBeat exists then disregard the style.
        if (createdBeat != null) {
          fitness *= 5 - pow(dna.beat[i][j] - createdBeat.dna.beat[i][j], 2);
        } else if (baseStyle != null) {
          fitness *= 5 - pow(dna.beat[i][j] - baseStyle.dna.beat[i][j], 2);
        }

        // Reward beats with accents aligning with the desired syncopation.
        if (isDownBeat(dna.beat[i], j) && !glob_syncopation && dna.beat[i][j] == 2)
          fitness *= 2;
        else if (isOffBeat(dna.beat[i], j) && glob_syncopation && dna.beat[i][j] == 2)
          fitness *= 2;

        // Give beats similar to the liked beat extra weight.
        if (likedBeat != null)
          fitness *= 5 - pow(dna.beat[i][j] - likedBeat.dna.beat[i][j], 2);
        // And beats similar to the other beat the opposite.
        if (otherBeat != null)
          fitness *= 1 / (5 - pow(dna.beat[i][j] - otherBeat.dna.beat[i][j], 2));
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
        if (dna.beat[i][j] == 0) fill(50);
        else if (dna.beat[i][j] >= 1) fill(160, 0, 0);
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

boolean isDownBeat(int[] beat, int j) {
  if (glob_time_sig == "2:4") return j % 2 == 0;
  if (glob_time_sig == "3:4") return j % 3 == 0;
  if (glob_time_sig == "4:4") return j % 4 == 0;
  return false;
}

boolean isOffBeat(int[] beat, int j) {
  if (glob_time_sig == "2:4") return j % 2 == 1;
  if (glob_time_sig == "3:4") return j % 3 == 1;
  if (glob_time_sig == "4:4") return j % 4 == 1;
  return false;
}
