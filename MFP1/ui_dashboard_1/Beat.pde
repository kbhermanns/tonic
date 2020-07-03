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
  
  void setFitness(int fit) {
    fitness = fit;
  }

  BeatDNA getBeatDNA() {
    return beatDNA;
  }
  
}
