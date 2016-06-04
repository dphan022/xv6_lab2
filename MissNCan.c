#include "types.h"
#include "user.h"
#include "semaphore.h"

#define TEST_NUM 21

int num_Cannibals, Num_Missionary;
Semaphore mutex, cannibal, missionary, row;

void RowBoat() {
    printf(1, "Rowing!\n");
}

int num_threads;

void MissionaryArrives(void *arg); 
void CannibalArrives(void *arg); 


int main() {

    num_Cannibals = Num_Missionary = num_threads = 0;

    num_threads = 0;
    sem_init(&mutex, 1);
    sem_init(&cannibal, 0);
    sem_init(&missionary, 0);
    sem_init(&row, 0);

    int i;
    int *tid;

    printf(1, "Testing with %d randomly generated canibals and missionaries\n", TEST_NUM);
    for (i = 0; i < TEST_NUM; i++) {
        if ((random(99999)/101) % 2) {
            tid = thread_create(CannibalArrives, (void*)0);
            if (tid == 0) {
                printf(1, "failed to create thread!\n");
                exit();
            }
            sem_acquire(&mutex);
            num_threads++;
            sem_signal(&mutex);
        }
        else {
            tid = thread_create(MissionaryArrives, (void*)0);
            if (tid == 0) {
                printf(1, "failed to create thread!\n");
            }
            sem_acquire(&mutex);
            num_threads++;
            sem_signal(&mutex);
        }
    }
    for (i = 0; i < 3; i++){
        tid = thread_create(MissionaryArrives, (void*)0);
        if (tid == 0) {
            printf(1, "failed to create thread!\n");
        }
        sem_acquire(&mutex);
        num_threads++;
        sem_signal(&mutex);
    }

    printf(1, "exiting!\n");
    while(wait()>0);
    exit();
}
void CannibalArrives(void *arg) {
    sem_acquire(&mutex);
    if (num_Cannibals >= 2) {
        num_Cannibals -= 2;
        sem_signal(&mutex);
        sem_signal(&cannibal);
        sem_signal(&cannibal);
    }
    else if (Num_Missionary >= 2) {
        Num_Missionary -= 2;
        sem_signal(&mutex);
        sem_signal(&missionary);
        sem_signal(&missionary);
    }
    else {
        num_Cannibals++;
        sem_signal(&mutex);
        sem_acquire(&cannibal);
        sem_acquire(&row);
        sem_acquire(&mutex);
        printf(1, "before: %d", num_threads);
        num_threads--;
        printf(1, "  after: %d\n", num_threads);
        sem_signal(&mutex);
        texit();
    }
    RowBoat();
    sem_signal(&row);
    sem_signal(&row);
    sem_acquire(&mutex);
    printf(1, "before: %d", num_threads);
    num_threads--;
    printf(1, "  after: %d\n", num_threads);
    sem_signal(&mutex);
    texit();
}


void MissionaryArrives(void *arg) {
    sem_acquire(&mutex);
    if (Num_Missionary >= 2) {
        Num_Missionary -= 2;
        sem_signal(&mutex);
        sem_signal(&missionary);
        sem_signal(&missionary);
    }
    else if (Num_Missionary >= 1 && num_Cannibals >= 1) {
        Num_Missionary--;;
        num_Cannibals--;
        sem_signal(&mutex);
        sem_signal(&missionary);
        sem_signal(&cannibal);
    }
    else {
        Num_Missionary++;
        sem_signal(&mutex);
        sem_acquire(&missionary);
        sem_acquire(&row);
        sem_acquire(&mutex);
        printf(1, "before: %d", num_threads);
        num_threads--;
        printf(1, "  after: %d\n", num_threads);
        sem_signal(&mutex);
        texit();
    }
    RowBoat();
    sem_signal(&row);
    sem_signal(&row);
    sem_acquire(&mutex);
    printf(1, "before: %d", num_threads);
    num_threads--;
    printf(1, "  after: %d\n", num_threads);
    sem_signal(&mutex);
    texit();
}
