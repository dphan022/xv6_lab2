#include "types.h"
#include "user.h"

void thread_test(void* arg);

int main(void) {
    int i;
    void* tid;

    for(i = 0; i < 10; i++){
        tid = thread_create(thread_test, (void*)&i);
        if(tid == 0){
            printf(1, "thread_create # %d failed \n", tid);
        }
    }

    while(wait() > 0);
    printf(1,"All threads yielded properly.\n");
    exit();
    return 0;
}


void thread_test(void* arg){
    printf(1, "yielding thread \n");

    thread_yield();

    printf(1, "exiting thread \n");

    texit();
}
