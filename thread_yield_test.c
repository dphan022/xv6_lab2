#include "param.h"
#include "types.h"
#include "stat.h"
#include "user.h"
#include "fs.h"
#include "fcntl.h"
#include "syscall.h"
#include "traps.h"
#include "memlayout.h"
#include "semaphore.h"

void thread_test(void* arg);

int main(void) {
    void* t1 = thread_create(thread_test, (void*) 0 );
    if(t1 == 0){
        printf(1, "t1 : thread_create failed \n");
        exit();
    }

    void* t2 = thread_create(thread_test, (void*) 0 );
    if(t2 == 0){
        printf(1, "t2 : thread_create failed \n");
        exit();
    }

    void* t3 = thread_create(thread_test, (void*) 0 );
    if(t3 == 0){
        printf(1, "t3 : thread_create failed \n");
        exit();
    }

    void* t4 = thread_create(thread_test, (void*) 0 );
    if(t4 == 0){
        printf(1, "t4 : thread_create failed \n");
        exit();
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
