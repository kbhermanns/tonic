// class to describe the population of beats
// note: structure used from the Nature of Code examples
import java.util.*;

class BeatPopulation {
  float mutationRate;
  Beat[] population;
  ArrayList<Beat> matingPool;
  int generations;

  Beat styleTarget;
  Beat originalBeat;

  int numInstruments;
  int beatLength;

  // create initial beat population
  BeatPopulation(float m, int size, int numIns, int beatLen) {
    mutationRate = m;
    population = new Beat[size];
    matingPool = new ArrayList<Beat>();
    generations = 0;

    numInstruments = numIns;
    beatLength = beatLen;
    
    generateRandomPopulation();
  }
  
  // completely random population
  void generateRandomPopulation() {
    for (int i = 0; i < population.length; i++) {
      boolean[][] baseBeat = new boolean[numInstruments][beatLength];
      for (int j = 0; j < numInstruments; j++) {
        for (int k = 0; k < beatLength; k++) {
          boolean x = boolean(int(random(0,2)));
          baseBeat[j][k] = x;
        }
      }
      BeatDNA beatDNA = new BeatDNA(baseBeat);
      population[i] = new Beat(beatDNA);
    }
  }
  
  // population where we have a target style
  // try adding the style as 1 and the remainder of the population is random
  void generateStylePopulation() {
    population[0] = styleTarget;
    for (int i = 1; i < population.length; i++) {
      boolean[][] baseBeat = new boolean[numInstruments][beatLength];
      for (int j = 0; j < numInstruments; j++) {
        for (int k = 0; k < beatLength; k++) {
          boolean x = boolean(int(random(0,2)));
          baseBeat[j][k] = x;
        }
      }
      BeatDNA beatDNA = new BeatDNA(baseBeat);
      population[i] = new Beat(beatDNA); //TODO setup initial population
    }
  }
  
  void generateStartingBeatPopulation() {
    population[0] = originalBeat;
    for (int i = 1; i < population.length; i++) {
      boolean[][] baseBeat = new boolean[numInstruments][beatLength];
      for (int j = 0; j < numInstruments; j++) {
        for (int k = 0; k < beatLength; k++) {
          boolean x = boolean(int(random(0,2)));
          baseBeat[j][k] = x;
        }
      }
      BeatDNA beatDNA = new BeatDNA(baseBeat);
      population[i] = new Beat(beatDNA);
    }
  }

  void run(boolean[][] liked, boolean[][] other, boolean[][] original, boolean[][] styleBeats, int numGens) {
    print("RUN CALLED");
    Beat likedBeat = liked != null ? new Beat(new BeatDNA(liked)) : null;
    Beat otherBeat = other != null ? new Beat(new BeatDNA(other)) : null;

    originalBeat = new Beat(new BeatDNA(original));
    styleTarget = new Beat(new BeatDNA(styleBeats));

    int i = 0;
    int leniency = 50;
    while (i < numGens) {
      calcFitness(likedBeat, otherBeat);
      selection();
      reproduction();
      // If we don't have any fit beats and are about to return, try again.
      if (i == (numGens - 1) && getMaxFitness() <= 0.00001 && leniency > 0) {
        i--;
        leniency--;
      }
      i++;
    }
  }

  void live () {
    Arrays.sort(population);
    for (int i = 0; i < population.length; i++) {
      population[i].display(new PVector(50, 80 + (60 * numInstruments * i)));
    }
  }

  // generate the mating pool
  void selection() {
    matingPool.clear();
    float maxFitness = getMaxFitness();

    // Calculate fitness for each member of the population (scaled to value between 0 and 1)
    // Based on fitness, each member will get added to the mating pool a certain number of times
    // A higher fitness = more entries to mating pool = more likely to be picked as a parent
    // A lower fitness = fewer entries to mating pool = less likely to be picked as a parent
    for (int i = 0; i < population.length; i++) {
      float fitnessNormal = map(population[i].getFitness(), 0, maxFitness, 0, 1);
      int n = (int) (fitnessNormal * 100);  // Arbitrary multiplier
      for (int j = 0; j < n; j++) {
        matingPool.add(population[i]);
      }
    }
  }

  // create the new generation
  void reproduction() {
    //refill pop with children from mating pool
    for (int i = 0; i < population.length; i++) {
      // randomly pick 2 parents
      int m = int(random(matingPool.size()));
      int d = int(random(matingPool.size()));
      Beat mom = matingPool.get(m);
      Beat dad = matingPool.get(d);

      // now perform crossover and mutation
      BeatDNA child = (mom.getDNA()).crossover(dad.getDNA());
      child.mutate(mutationRate);

      population[i] = new Beat(child);
    }
    generations++;
  }
  
  // calculate the fitness of the entire population
  void calcFitness(Beat likedBeat, Beat otherBeat) {
    for (int i = 0; i < population.length; i++) {
      population[i].calcFitness(styleTarget, originalBeat, likedBeat, otherBeat);
    }
  }

  float averageFitness() {
    float totFitness = 0.0;
    for (int i = 0; i < population.length; i++) {
      totFitness += population[i].getFitness();
    }
    // println("Average: " + (totFitness / population.length));
    return totFitness / population.length;
  }

  // Find highest fitness for the population
  float getMaxFitness() {
    float record = 0.0;
    for (int i = 0; i < population.length; i++) {
      float fit = population[i].getFitness();
      if(fit > record) {
        record = fit;
      }
    }
    //println("Max: " + record);
    return record;
  }

  boolean[][] getBestBeat() {
    Arrays.sort(population);
    print("BEST BEAT: " + generations + " - ");
    population[0].print();
    println();
    return population[0].dna.beat;
  }

  boolean[][] getSecondBestBeat() {
    Arrays.sort(population);
    print("2nd BEAT: " + generations + " - ");
    population[1].print();
    println();
    return population[1].dna.beat;
  }
}
