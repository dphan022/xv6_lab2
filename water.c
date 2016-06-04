#include "semaphore.h"
#include "user.h"
#include "types.h"

#define NUM_H 12
#define NUM_O 6

Semaphore H, O, mutex;

void hRdy(void* arg);
void oRdy(void* arg);

int main(){
    int i;
    int arg = 0;
    int water = 0;


    printf(1, "water before : %d\n", water);

    sem_init(&H, 0);
    sem_init(&mutex, 1);
    sem_init(&O, 0);

    void* tid;
    for(i = 0; i < NUM_H; i++){
        tid = thread_create(hRdy, (void*)&arg);
        if(tid <= 0){
            printf(1,"Water thread no work");
            exit();
        }
    }

    for(i = 0; i < NUM_O; i++){
        tid = thread_create(oRdy, (void*)&water);
        if(tid <= 0){
            printf(1,"Oxygen thread no work");
            exit();
        }
    }

    while(wait() >= 0)

    printf(1, "water generated : %d\n", water);

    exit();
}

void hRdy(void* arg){
    sem_signal(&H);
    sem_acquire(&O);
    texit();
}

void oRdy(void* arg){
   
    int * w = (int*)arg;

    sem_acquire(&H);
    sem_acquire(&H);
    sem_signal(&O);
    sem_signal(&O);

    sem_acquire(&mutex);
    
    *w = *w + 1;

    sem_signal(&mutex);
    texit();
}
