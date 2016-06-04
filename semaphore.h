#include "types.h"
#include "queue.h"

struct Semaphore {
    int val;
    lock_t lock;
    struct queue q;
};

void sem_init(struct Semaphore*, int);
void sem_acquire(struct Semaphore*);
void sem_signal(struct Semaphore*);
void sem_dom_acquire(struct Semaphore*);
