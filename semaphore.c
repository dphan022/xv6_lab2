#include "semaphore.h"
#include "user.h"

// Initializes the semaphore
void sem_init(struct Semaphore* s, int value){
    s->val = value;
    lock_init(&s->lock);
    init_q(&s->q);
}

// Decrements the semaphore
void sem_acquire(struct Semaphore* s){
    lock_acquire(&s->lock);

    if(s->val == 0){
        int pid;
        pid = getpid();
        add_q(&s->q, pid);
        lock_release(&s->lock);
        tsleep();
    }
    else{
        s->val--;
        lock_release(&s->lock);
    }
}

// Increments the semaphore
void sem_signal(struct Semaphore* s){
    lock_acquire(&s->lock);

    if(!empty_q(&s->q)){
        twakeup(pop_q(&s->q));
    }
    else{
        s->val++;
    }

    lock_release(&s->lock);
}

void sem_dom_acquire(struct Semaphore* s){
    lock_acquire(&s->lock);

    if(s->val > 0){
        s->val--;
        lock_release(&s->lock);
        return;
    }

    dominant(&s->q,getpid());
    lock_release(&s->lock);
    tsleep();
}
