class Beat {
  BeatDNA beatDNA;
  int fitness;
  
  Beat(BeatDNA dna) {
    beatDNA = dna;
    fitness = 0;
  }

  int getFitness() {
    return fitness;
  }

  BeatDNA getBeatDNA() {
    return beatDNA;
  }
  
}
