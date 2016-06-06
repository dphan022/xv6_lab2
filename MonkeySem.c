#include "types.h"
#include "user.h"
#include "semaphore.h"
#define NUM_MONKEYS 40

void MonkeyArrives(void* arg);
void DominantArrives(void* arg);

void regClimb() { printf(1, "\nRegular Monkey climbing.\n"); }
void domClimb() { printf(1, "\nDominant monkey climbing.\n"); }

Semaphore tree, mutex, mutex2, monkey, one_monkey, dom_monkey;

int cnt_climbed, monkeys, dom_monkeys;

int main()  {

    cnt_climbed = monkeys = dom_monkeys = 0;

    sem_init(&one_monkey, 1);
    sem_init(&monkey, 1);
    sem_init(&dom_monkey, 1);
    sem_init(&tree, 3);
    sem_init(&mutex, 1);
    sem_init(&mutex2, 1);

    void* tid;
    int i;
    for (i = 1; i < NUM_MONKEYS+1; i++) {
        if ((random(99999*i)/101)%10) {
            tid = thread_create(MonkeyArrives, (void*)0);
            if(tid == 0){
                printf(1,  "thread_create failed\n");
                exit();                            
            }
        }
        else {
            tid = thread_create(DominantArrives, (void*)0);
            if(tid == 0) {
                printf(1,  "thread_create failed\n");
                exit();
            }
        }
    }

    while(wait() >= 0);

    printf(1, "%d monkeys climbed tree\n", cnt_climbed);
    exit();
}

void MonkeyArrives(void *arg){   
    sem_acquire(&one_monkey);
    sem_acquire(&monkey);
    sem_acquire(&mutex);
    monkeys++;
    if (monkeys == 1) {
        sem_acquire(&dom_monkey);
    }
    sem_signal(&mutex);
    sem_signal(&monkey);
    sem_signal(&one_monkey);
    sem_acquire(&tree);
    regClimb();
    sem_signal(&tree);
    sem_acquire(&mutex);
    monkeys--;
    cnt_climbed++;
    if (monkeys == 0) {
        sem_signal(&dom_monkey);
    }
    sem_signal(&mutex);
    
    texit();
}

void DominantArrives(void *arg){   
    sem_acquire(&mutex2);
    dom_monkeys++;
    if (dom_monkeys == 1) {
        sem_acquire(&monkey);
    }
    sem_signal(&mutex2);
    sem_acquire(&dom_monkey);
    sem_acquire(&tree);
    domClimb();
    sem_signal(&tree);
    sem_signal(&dom_monkey);
    sem_acquire(&mutex2);
    cnt_climbed++;
    dom_monkeys--;
    if (dom_monkeys == 0) {
        printf(1, "Dominant monkey is done.\n");
        sem_signal(&monkey);
    }
    sem_signal(&mutex2);

    texit();
}
