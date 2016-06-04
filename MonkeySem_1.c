#include "types.h"
#include "user.h"
#include "semaphore.h"
#define TEST_NUM 30

void MonkeyRdy(void *arg);
void DominantRdy(void *arg);

void monkeyClimb() { printf(1, "\nMonkey climbing!\n"); }
void domClimb() { printf(1, "\nDominant Monkey climbing!\n"); }

Semaphore monkey, a_monkey, Dominant_monkey, tree, mutex1, mutex2;

int num_climb, munkeys, dominants;

int main()  {

    num_climb = munkeys = dominants = 0;

    sem_init(&a_monkey, 1);
    sem_init(&monkey, 1);
    sem_init(&Dominant_monkey, 1);
    sem_init(&tree, 3);
    sem_init(&mutex1, 1);
    sem_init(&mutex2, 1);


    int *tid;
    printf(1, "Testing %d randomly generated monkeys / dominant monkeys\n", TEST_NUM);
    int i;
    for (i = 1; i < TEST_NUM+1; i++) {
        if ((random(99999*i)/101)%10) {
            tid = thread_create(MonkeyRdy, (void*)0);
            if(tid == 0){
                printf(1,  "thread_create failed...\n");
                exit();                            
            }
        }
        else {
            tid = thread_create(DominantRdy, (void*)0);
            if(tid == 0) {
                printf(1,  "thread_create failed...\n");
                exit();
            }
        }
    }

    while(wait()>0);
    printf(1, "%d monkeys climbed tree!\n", num_climb);
    exit();
}

void MonkeyRdy(void *arg){   
    sem_acquire(&a_monkey);
    sem_acquire(&monkey);
    sem_acquire(&mutex1);
    munkeys++;
    if (munkeys == 1) {
        sem_acquire(&Dominant_monkey);
    }
    sem_signal(&mutex1);
    sem_signal(&monkey);
    sem_signal(&a_monkey);
    sem_acquire(&tree);
    monkeyClimb();
    sem_signal(&tree);
    sem_acquire(&mutex1);
    munkeys--;
    num_climb++;
    if (munkeys == 0) {
        sem_signal(&Dominant_monkey);
    }
    sem_signal(&mutex1);
    
    texit();    
}

void DominantRdy(void *arg){   
    sem_acquire(&mutex2);
    dominants++;
    if (dominants == 1) {
        sem_acquire(&monkey);
    }
    sem_signal(&mutex2);
    sem_acquire(&Dominant_monkey);
    sem_acquire(&tree);
    domClimb();
    sem_signal(&tree);
    sem_signal(&Dominant_monkey);
    sem_acquire(&mutex2);
    num_climb++;
    dominants--;
    if (dominants == 0) {
        printf(1, "Dominant done...\n");
        sem_signal(&monkey);
    }
    sem_signal(&mutex2);

    texit();
    
}
