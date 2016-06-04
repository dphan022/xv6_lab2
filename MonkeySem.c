#include "semaphore.h"
#include "user.h"
//Note
void MonkeyRdy(void * arg_ptr);
void Dom_Monkey_Rdy(void * arg_ptr);

struct Semaphore Monkey_Go_Up;

struct mutex{
	lock_t lock;
} mutex;

int count = 0;

int main(){
	sem_init(&Monkey_Go_Up, 3);
	lock_init(&mutex.lock);

	printf(1, "Monkey Test: 1 dominant monkey and 4 monkeys...\n");
	void * thread1 = thread_create(MonkeyRdy, (void *) 0);
	if(thread1 == 0){
		printf(1,  "thread_create failed...\n");
		exit();
	}

	void * thread2 = thread_create(MonkeyRdy, (void *) 0);
	if(thread2 == 0){
		printf(1,  "thread_create failed...\n");
		exit();
	}

	void * thread3 = thread_create(MonkeyRdy, (void *) 0);
	if(thread3 == 0){
		printf(1,  "thread_create failed...\n");
		exit();
	}

	void * thread4 = thread_create(Dom_Monkey_Rdy, (void *) 0);
	if(thread4 == 0){
		printf(1,  "thread_create failed...\n");
		exit();
	}

	void * thread5 = thread_create(MonkeyRdy, (void *) 0);
	if(thread5 == 0){
		printf(1,  "thread_create failed...\n");
		exit();
	}

	while(wait() > 0);
	printf(1, "Monkey climbed tree = %d\n", count);

	exit();
	return 0;

}

void MonkeyRdy(void * arg_ptr){

	sem_acquire(&Monkey_Go_Up);
	lock_acquire(&mutex.lock);
	printf(1, "Monkey climbs up tree and grabbed a coconut.\n");
	count++;
	lock_release(&mutex.lock);
	sem_signal(&Monkey_Go_Up);
	texit();

}

void Dom_Monkey_Rdy(void * arg_ptr){

	lock_acquire(&mutex.lock);
	printf(1, "Dominant monkey have climbed the tree and grabbed a coconut.\n");
	lock_release(&mutex.lock);
	sem_dom_acquire(&Monkey_Go_Up);
	lock_acquire(&mutex.lock);
	count++;
	lock_release(&mutex.lock);
	sem_signal(&Monkey_Go_Up);
	texit();
}
