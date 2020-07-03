// class to describe the population of beats
// note: structure used from the Nature of Code examples

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
    BeatPopulation (float m, int num) {
        mutationRate = m;
        population = new Beat[num];
        matingPool = new ArrayList<Beat>();
        generations = 0;

        BeatDNA emptyBeat = new BeatDNA();
        fittestBeat = new Beat(emptyBeat);
        secondFittestBeat = new Beat(emptyBeat);
        
        //TODO: Set these to match quiz results when in and set starting beat
        styleTarget = new Beat(emptyBeat);
        startingBeat = new Beat(emptyBeat);
        
        generateRandomPopulation();
    }
    
    // completely random population
    void generateRandomPopulation() {
      for (int i = 0; i< population.length; i++) {
          Boolean[][] baseBeat = new Boolean[3][16];
          for (int j=0; j<3; j++) {
            for (int k=0; k<16; k++) {
              int x = (int)(random(0,2));
              baseBeat[j][k] = boolean(x);
              System.out.print(x+" ");
            }
            System.out.println();          
          }
          println();
          BeatDNA beatDNA = new BeatDNA(baseBeat);
          population[i] = new Beat(beatDNA);
        }
    }
    
    // population where we have a target style
    // try adding the style as 1 and the remainder of the population is random
    void generateStylePopulation() {
      population[0] = styleTarget;
      for (int i = 1; i< population.length; i++) {
          Boolean[][] baseBeat = new Boolean[3][16];
          for (int j=0; j<3; j++) {
            for (int k=0; k<16; k++) {
              int x = (int)(random(0,2));
              baseBeat[j][k] = boolean(x);
              System.out.print(x+" ");
            }
            System.out.println();          
          }
          println();
          BeatDNA beatDNA = new BeatDNA(baseBeat);
          population[i] = new Beat(beatDNA); //TODO setup initial population
        }
    }
    
    void generateStartingBeatPopulation() {
      population[0] = startingBeat;
      for (int i = 1; i< population.length; i++) {
          Boolean[][] baseBeat = new Boolean[3][16];
          for (int j=0; j<3; j++) {
            for (int k=0; k<16; k++) {
              int x = (int)(random(0,2));
              baseBeat[j][k] = boolean(x);
              System.out.print(x+" ");
            }
            System.out.println();          
          }
          println();
          BeatDNA beatDNA = new BeatDNA(baseBeat);
          population[i] = new Beat(beatDNA);
        }
    }

    // generate the mating pool
    void selection() {
        matingPool.clear();

        //calculate the fitness of the population, based on the fitness of the beat it should be added
        // to the matingpool more times

    }

    // create the new generation
    void reproduction() {
        //refill pop with children from mating pool
        for (int i=0; i < population.length; i++) {
            // randomly pick 2 parents
            int m = int(random(matingPool.size()));
            int d = int(random(matingPool.size()));
            Beat mom = matingPool.get(m);
            Beat dad = matingPool.get(d);

            // now perform crossover and mutation
            BeatDNA child = (mom.getBeatDNA()).crossover(dad.getBeatDNA());
            child.mutate(mutationRate);

            population[i] = new Beat(child);
        }
        generations++;
    }


    // get the top beat for displaying to the user
    Beat fittestBeat() {
        return fittestBeat;
    }

    Beat secondFittestBeat() {
        return secondFittestBeat;
    }
    
    // calculate the fitness of the entire population
    void calculateFitness() {
    }
    
    void calculateBeatFitness() {
    }

}
