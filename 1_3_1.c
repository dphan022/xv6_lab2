#include "semaphore.h"
#include "user.h"

#define NUM 20

Semaphore H, O, mutex;

void hRdy(void* arg);
void oRdy(void* arg);

int main(){
    int i;
    int numWater = 0;

    printf(1, "water before : %d\n", numWater);

    sem_init(&H, 2);
    sem_init(&mutex, 0);
    sem_init(&O, 1);

    for(i = 0; i < 12; i++){
        if(i % 3){
            thread_create(hRdy, 0);
        }
        else{
            thread_create(oRdy, &numWater);
        }
    }

    while(wait() >= 0);

    printf(1, "water after : %d\n", numWater);

    return 0;

/*
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

    while(wait() > 0);
    printf(1, "water : %d\n", numWater);

    exit();
    */
}

void hRdy(void* arg){
    sem_acquire(&H);
    sem_signal(&mutex);
    texit();
}

void oRdy(void* arg){
   
    int * w = (int*)arg;

    sem_acquire(&O);
    sem_acquire(&mutex);
    sem_acquire(&mutex);
    
    (*w)++;

    sem_signal(&O);
    sem_signal(&H);
    sem_signal(&H);

    //sem_signal(&H);
    //sem_signal(&H);
    //sem_acquire(&O);
    //sem_acquire(&O);
    //sem_acquire(&mutex);
    //numWater++;
    //sem_signal(&mutex);
    texit();
}
