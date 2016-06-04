#include "semaphore.h"
#include "user.h"

#define NUM 12

Semaphore H, O, mutex;
int numWater;

void hRdy(void* arg);
void oRdy(void* arg);

int main(int argc, char* argv[]){
    int i;
    numWater = 0;

    sem_init(&H, 0);
    sem_init(&O, 0);
    sem_init(&mutex, 1);

    void* tid;

    for(i = 0; i < NUM; i++){
        if(i % 3){
            tid = thread_create(hRdy, 0);
            if(tid == 0){
                printf(1, "thread_create failed \n");
            }
            else{
                tid = thread_create(oRdy, 0);
                if(tid == 0){
                    printf(1, "thread_create failed \n");
                }
            }
        }
    }

    for(i = 0; i < 3; i++){
        tid = thread_create(oRdy, 0);
        if(tid == 0){
            printf(1, "thread_create failed \n");
        }
    }

    while(wait() >=  0)
    printf(1, "water : %d\n", numWater);

    exit();
}

void hRdy(void* arg){
    sem_acquire(&H);
    sem_signal(&O);
    texit();
}

void oRdy(void* arg){
    sem_signal(&H);
    sem_signal(&H);
    sem_acquire(&O);
    sem_acquire(&O);
    sem_acquire(&mutex);
    numWater++;
    sem_signal(&mutex);
    texit();
}
