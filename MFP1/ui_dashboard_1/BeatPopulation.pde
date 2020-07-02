// class to describe the population of beats
// note: structure used from the Nature of Code examples

class BeatPopulation {
    float mutationRate;
    Beat[] population;
    ArrayList<Beat> matingPool;
    int generations;

    // create initial beat population
    BeatPopulation (float m, int num) {
        mutationRate = m;
        population = new Beat[num];
        matingPool = new ArrayList<Beat>();
        generations = 0;

        for (int i = 0; i< population.length; i++) {
            //population[i] = new Beat(); //TODO to match beat contstuctor

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
            // we will likely need to do this for each row (instrument) so that
            // we aren't crossing over beats from different instruments

            // population[i] = the mutated beat;
        }
        generations++;
    }
}
