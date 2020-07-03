// class to describe the population of beats
// note: structure used from the Nature of Code examples
import java.util.*;

class BeatPopulation {
  float mutationRate;
  Beat[] population;
  ArrayList<Beat> matingPool;
  int generations;

  Beat fittestBeat;
  Beat secondFittestBeat;
  Beat styleTarget;
  Beat startingBeat;

  // create initial beat population
  BeatPopulation(float m, int num) {
      mutationRate = m;
      population = new Beat[num];
      matingPool = new ArrayList<Beat>();
      generations = 0;

      fittestBeat = new Beat(new BeatDNA());
      secondFittestBeat = new Beat(new BeatDNA());
      
      //TODO: Set these to match quiz results when in and set starting beat
      Boolean[][] emptyBeat = new Boolean[numInstruments][beatLength];
      styleTarget = new Beat(new BeatDNA(emptyBeat));
      startingBeat = new Beat(new BeatDNA(emptyBeat));
      
      generateRandomPopulation();
  }
  
  // completely random population
  void generateRandomPopulation() {
    for (int i = 0; i < population.length; i++) {
      Boolean[][] baseBeat = new Boolean[numInstruments][beatLength];
      for (int j = 0; j < numInstruments; j++) {
        for (int k = 0; k < beatLength; k++) {
          Boolean x = boolean(int(random(0,2)));
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
      Boolean[][] baseBeat = new Boolean[numInstruments][beatLength];
      for (int j = 0; j < numInstruments; j++) {
        for (int k = 0; k < beatLength; k++) {
          Boolean x = boolean(int(random(0,2)));
          baseBeat[j][k] = x;
        }
      }
      BeatDNA beatDNA = new BeatDNA(baseBeat);
      population[i] = new Beat(beatDNA); //TODO setup initial population
    }
  }
  
  void generateStartingBeatPopulation() {
    population[0] = startingBeat;
    for (int i = 1; i < population.length; i++) {
      Boolean[][] baseBeat = new Boolean[numInstruments][beatLength];
      for (int j = 0; j < numInstruments; j++) {
        for (int k = 0; k < beatLength; k++) {
          Boolean x = boolean(int(random(0,2)));
          baseBeat[j][k] = x;
        }
      }
      BeatDNA beatDNA = new BeatDNA(baseBeat);
      population[i] = new Beat(beatDNA);
    }
  }

  void live () {
    // For every creature
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


  // get the top beat for displaying to the user
  Beat getFittestBeat() {
      return fittestBeat;
  }

  Beat getSecondFittestBeat() {
      return secondFittestBeat;
  }
  
  // calculate the fitness of the entire population
  void calcFitness(Beat likedBeat) {
    int[][] baseStyle = {
      {1, 0, 1, 0, 1, 1, 0, 0, 1, 0, 0, 1, 1, 0, 1, 1},
      {0, 0, 1, 0, 1, 1, 0, 0, 1, 0, 0, 1, 1, 0, 1, 1},
      {1, 0, 1, 0, 1, 1, 0, 0, 1, 0, 0, 1, 1, 0, 1, 1}
    };
    int[][] liked = {
      {0, 0, 0, 1, 0, 1, 1, 0, 0, 0, 1, 1, 1, 1, 0, 0},
      {0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 1, 0, 1, 0},
      {1, 0, 1, 0, 1, 1, 0, 0, 1, 0, 0, 1, 1, 0, 1, 1}
    };
    Beat styleTarget = new Beat(new BeatDNA(intToBool(baseStyle)));
    Beat startingBeat = null;
    Beat sbeatLiked = new Beat(new BeatDNA(intToBool(liked)));
    for (int i = 0; i < population.length; i++) {
      population[i].calcFitness(styleTarget, startingBeat, sbeatLiked);
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

  Boolean[][] intToBool(int[][] arr) {
    Boolean[][] ret = new Boolean[arr.length][arr[0].length];
    for (int i = 0; i < ret.length; i++) {
      for (int j = 0; j < ret[0].length; j++) {
        ret[i][j] = boolean(arr[i][j]);
      }
    }
    return ret;
  }
}
