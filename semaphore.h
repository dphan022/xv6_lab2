#include "queue.h"
#include "types.h"

struct Semaphore {
    int val;
    lock_t lock;
    struct queue q;
};

void sem_init(struct Semaphore*, int);
void sem_acquire(struct Semaphore*);
void sem_sginal(struct Semaphore*);
