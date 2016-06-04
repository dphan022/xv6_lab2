
_frisbee:     file format elf32-i386


Disassembly of section .text:

00001000 <main>:
void pass_next(void *arg);
int lookup();



int main(int argc, char *argv[]){
    1000:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    1004:	83 e4 f0             	and    $0xfffffff0,%esp
    1007:	ff 71 fc             	pushl  -0x4(%ecx)
    100a:	55                   	push   %ebp
    100b:	89 e5                	mov    %esp,%ebp
    100d:	56                   	push   %esi
    100e:	53                   	push   %ebx
    100f:	51                   	push   %ecx
    1010:	83 ec 3c             	sub    $0x3c,%esp
    1013:	89 cb                	mov    %ecx,%ebx

    int i;
    struct thread *t;
//    void * sp;

    if(argc != 3){
    1015:	83 3b 03             	cmpl   $0x3,(%ebx)
    1018:	74 19                	je     1033 <main+0x33>
        printf(1,"argc is not match !\n");
    101a:	c7 44 24 04 08 20 00 	movl   $0x2008,0x4(%esp)
    1021:	00 
    1022:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1029:	e8 de 07 00 00       	call   180c <printf>
        exit();
    102e:	e8 39 06 00 00       	call   166c <exit>
    }
    numthreads = atoi(argv[1]);
    1033:	8b 43 04             	mov    0x4(%ebx),%eax
    1036:	83 c0 04             	add    $0x4,%eax
    1039:	8b 00                	mov    (%eax),%eax
    103b:	89 04 24             	mov    %eax,(%esp)
    103e:	e8 97 05 00 00       	call   15da <atoi>
    1043:	a3 c0 25 00 00       	mov    %eax,0x25c0
    numpass = atoi(argv[2]);
    1048:	8b 43 04             	mov    0x4(%ebx),%eax
    104b:	83 c0 08             	add    $0x8,%eax
    104e:	8b 00                	mov    (%eax),%eax
    1050:	89 04 24             	mov    %eax,(%esp)
    1053:	e8 82 05 00 00       	call   15da <atoi>
    1058:	a3 c4 25 00 00       	mov    %eax,0x25c4

    void * slist[numthreads];
    105d:	a1 c0 25 00 00       	mov    0x25c0,%eax
    1062:	8d 50 ff             	lea    -0x1(%eax),%edx
    1065:	89 55 dc             	mov    %edx,-0x24(%ebp)
    1068:	c1 e0 02             	shl    $0x2,%eax
    106b:	8d 50 03             	lea    0x3(%eax),%edx
    106e:	b8 10 00 00 00       	mov    $0x10,%eax
    1073:	83 e8 01             	sub    $0x1,%eax
    1076:	01 d0                	add    %edx,%eax
    1078:	be 10 00 00 00       	mov    $0x10,%esi
    107d:	ba 00 00 00 00       	mov    $0x0,%edx
    1082:	f7 f6                	div    %esi
    1084:	6b c0 10             	imul   $0x10,%eax,%eax
    1087:	29 c4                	sub    %eax,%esp
    1089:	8d 44 24 0c          	lea    0xc(%esp),%eax
    108d:	83 c0 03             	add    $0x3,%eax
    1090:	c1 e8 02             	shr    $0x2,%eax
    1093:	c1 e0 02             	shl    $0x2,%eax
    1096:	89 45 d8             	mov    %eax,-0x28(%ebp)

    //init ttable;
    lock_init(&ttable.lock);
    1099:	c7 04 24 e0 25 00 00 	movl   $0x25e0,(%esp)
    10a0:	e8 51 0b 00 00       	call   1bf6 <lock_init>
    ttable.total = 0;
    10a5:	c7 05 e4 27 00 00 00 	movl   $0x0,0x27e4
    10ac:	00 00 00 
    for(t=ttable.thread;t < &ttable.thread[64];t++){
    10af:	c7 45 e0 e4 25 00 00 	movl   $0x25e4,-0x20(%ebp)
    10b6:	eb 0d                	jmp    10c5 <main+0xc5>
        t->tid = 0;
    10b8:	8b 45 e0             	mov    -0x20(%ebp),%eax
    10bb:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    void * slist[numthreads];

    //init ttable;
    lock_init(&ttable.lock);
    ttable.total = 0;
    for(t=ttable.thread;t < &ttable.thread[64];t++){
    10c1:	83 45 e0 08          	addl   $0x8,-0x20(%ebp)
    10c5:	81 7d e0 e4 27 00 00 	cmpl   $0x27e4,-0x20(%ebp)
    10cc:	72 ea                	jb     10b8 <main+0xb8>
        t->tid = 0;
    }
    //init stack list
    for(i = 0; i < 64;i++){
    10ce:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    10d5:	eb 11                	jmp    10e8 <main+0xe8>
        slist[i]=0;
    10d7:	8b 45 d8             	mov    -0x28(%ebp),%eax
    10da:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    10dd:	c7 04 90 00 00 00 00 	movl   $0x0,(%eax,%edx,4)
    ttable.total = 0;
    for(t=ttable.thread;t < &ttable.thread[64];t++){
        t->tid = 0;
    }
    //init stack list
    for(i = 0; i < 64;i++){
    10e4:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    10e8:	83 7d e4 3f          	cmpl   $0x3f,-0x1c(%ebp)
    10ec:	7e e9                	jle    10d7 <main+0xd7>
        slist[i]=0;
    }
    //init frisbee
    lock_init(&frisbee.lock);
    10ee:	c7 04 24 e8 27 00 00 	movl   $0x27e8,(%esp)
    10f5:	e8 fc 0a 00 00       	call   1bf6 <lock_init>
    frisbee.pass = 0;
    10fa:	c7 05 ec 27 00 00 00 	movl   $0x0,0x27ec
    1101:	00 00 00 
    frisbee.holding_thread = 0;
    1104:	c7 05 f0 27 00 00 00 	movl   $0x0,0x27f0
    110b:	00 00 00 

    printf(1,"\nnum of threads %d \n",numthreads);
    110e:	a1 c0 25 00 00       	mov    0x25c0,%eax
    1113:	89 44 24 08          	mov    %eax,0x8(%esp)
    1117:	c7 44 24 04 1d 20 00 	movl   $0x201d,0x4(%esp)
    111e:	00 
    111f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1126:	e8 e1 06 00 00       	call   180c <printf>
    printf(1,"num of passes %d \n\n",numpass);
    112b:	a1 c4 25 00 00       	mov    0x25c4,%eax
    1130:	89 44 24 08          	mov    %eax,0x8(%esp)
    1134:	c7 44 24 04 32 20 00 	movl   $0x2032,0x4(%esp)
    113b:	00 
    113c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1143:	e8 c4 06 00 00       	call   180c <printf>


    for(i=0; i<numthreads;i++){
    1148:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    114f:	eb 43                	jmp    1194 <main+0x194>
        void *stack = thread_create(pass_next,(void *)0);      
    1151:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1158:	00 
    1159:	c7 04 24 3d 12 00 00 	movl   $0x123d,(%esp)
    1160:	e8 da 0a 00 00       	call   1c3f <thread_create>
    1165:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        if(stack == 0)
    1168:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
    116c:	75 16                	jne    1184 <main+0x184>
            printf(1,"thread_create fail\n");
    116e:	c7 44 24 04 46 20 00 	movl   $0x2046,0x4(%esp)
    1175:	00 
    1176:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    117d:	e8 8a 06 00 00       	call   180c <printf>
    1182:	eb 0c                	jmp    1190 <main+0x190>
        else{
            slist[i] = stack;
    1184:	8b 45 d8             	mov    -0x28(%ebp),%eax
    1187:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    118a:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
    118d:	89 0c 90             	mov    %ecx,(%eax,%edx,4)

    printf(1,"\nnum of threads %d \n",numthreads);
    printf(1,"num of passes %d \n\n",numpass);


    for(i=0; i<numthreads;i++){
    1190:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    1194:	a1 c0 25 00 00       	mov    0x25c0,%eax
    1199:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
    119c:	7c b3                	jl     1151 <main+0x151>
        else{
            slist[i] = stack;
        }
    }
//    sleep(5);
    for(i=0;i<numthreads;i++){
    119e:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    11a5:	eb 10                	jmp    11b7 <main+0x1b7>
        if(wait() == -1)
    11a7:	e8 c8 04 00 00       	call   1674 <wait>
    11ac:	83 f8 ff             	cmp    $0xffffffff,%eax
    11af:	75 02                	jne    11b3 <main+0x1b3>
            break;
    11b1:	eb 0e                	jmp    11c1 <main+0x1c1>
        else{
            slist[i] = stack;
        }
    }
//    sleep(5);
    for(i=0;i<numthreads;i++){
    11b3:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    11b7:	a1 c0 25 00 00       	mov    0x25c0,%eax
    11bc:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
    11bf:	7c e6                	jl     11a7 <main+0x1a7>
        if(wait() == -1)
            break;
    }
   // add printf for tid look up.  
    for(t=ttable.thread;t < &ttable.thread[64];t++){
    11c1:	c7 45 e0 e4 25 00 00 	movl   $0x25e4,-0x20(%ebp)
    11c8:	eb 2a                	jmp    11f4 <main+0x1f4>
        if(t->tid != 0)
    11ca:	8b 45 e0             	mov    -0x20(%ebp),%eax
    11cd:	8b 00                	mov    (%eax),%eax
    11cf:	85 c0                	test   %eax,%eax
    11d1:	74 1d                	je     11f0 <main+0x1f0>
            printf(1,"thread %d was killed! stack was freed.\n",t->tid);
    11d3:	8b 45 e0             	mov    -0x20(%ebp),%eax
    11d6:	8b 00                	mov    (%eax),%eax
    11d8:	89 44 24 08          	mov    %eax,0x8(%esp)
    11dc:	c7 44 24 04 5c 20 00 	movl   $0x205c,0x4(%esp)
    11e3:	00 
    11e4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    11eb:	e8 1c 06 00 00       	call   180c <printf>
    for(i=0;i<numthreads;i++){
        if(wait() == -1)
            break;
    }
   // add printf for tid look up.  
    for(t=ttable.thread;t < &ttable.thread[64];t++){
    11f0:	83 45 e0 08          	addl   $0x8,-0x20(%ebp)
    11f4:	81 7d e0 e4 27 00 00 	cmpl   $0x27e4,-0x20(%ebp)
    11fb:	72 cd                	jb     11ca <main+0x1ca>
        if(t->tid != 0)
            printf(1,"thread %d was killed! stack was freed.\n",t->tid);
    }

    //free stacks
    for(i=0;i<numthreads;i++){
    11fd:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    1204:	eb 28                	jmp    122e <main+0x22e>
        if(slist[i] != 0){
    1206:	8b 45 d8             	mov    -0x28(%ebp),%eax
    1209:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    120c:	8b 04 90             	mov    (%eax,%edx,4),%eax
    120f:	85 c0                	test   %eax,%eax
    1211:	74 17                	je     122a <main+0x22a>
            void * f = slist[i];
    1213:	8b 45 d8             	mov    -0x28(%ebp),%eax
    1216:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    1219:	8b 04 90             	mov    (%eax,%edx,4),%eax
    121c:	89 45 d0             	mov    %eax,-0x30(%ebp)
            free(f);
    121f:	8b 45 d0             	mov    -0x30(%ebp),%eax
    1222:	89 04 24             	mov    %eax,(%esp)
    1225:	e8 96 07 00 00       	call   19c0 <free>
        if(t->tid != 0)
            printf(1,"thread %d was killed! stack was freed.\n",t->tid);
    }

    //free stacks
    for(i=0;i<numthreads;i++){
    122a:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    122e:	a1 c0 25 00 00       	mov    0x25c0,%eax
    1233:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
    1236:	7c ce                	jl     1206 <main+0x206>
        if(slist[i] != 0){
            void * f = slist[i];
            free(f);
        }
    }
    exit();
    1238:	e8 2f 04 00 00       	call   166c <exit>

0000123d <pass_next>:
}

void pass_next(void *arg){
    123d:	55                   	push   %ebp
    123e:	89 e5                	mov    %esp,%ebp
    1240:	83 ec 28             	sub    $0x28,%esp
    struct thread *t;
    int tid;

    tid = getpid();
    1243:	e8 a4 04 00 00       	call   16ec <getpid>
    1248:	89 45 f0             	mov    %eax,-0x10(%ebp)

    lock_acquire(&ttable.lock);
    124b:	c7 04 24 e0 25 00 00 	movl   $0x25e0,(%esp)
    1252:	e8 ad 09 00 00       	call   1c04 <lock_acquire>
    for(t=ttable.thread;t < &ttable.thread[64];t++){
    1257:	c7 45 f4 e4 25 00 00 	movl   $0x25e4,-0xc(%ebp)
    125e:	eb 17                	jmp    1277 <pass_next+0x3a>
        if(t->tid == 0){
    1260:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1263:	8b 00                	mov    (%eax),%eax
    1265:	85 c0                	test   %eax,%eax
    1267:	75 0a                	jne    1273 <pass_next+0x36>
            t->tid = tid;
    1269:	8b 45 f4             	mov    -0xc(%ebp),%eax
    126c:	8b 55 f0             	mov    -0x10(%ebp),%edx
    126f:	89 10                	mov    %edx,(%eax)
            break;
    1271:	eb 0d                	jmp    1280 <pass_next+0x43>
    int tid;

    tid = getpid();

    lock_acquire(&ttable.lock);
    for(t=ttable.thread;t < &ttable.thread[64];t++){
    1273:	83 45 f4 08          	addl   $0x8,-0xc(%ebp)
    1277:	81 7d f4 e4 27 00 00 	cmpl   $0x27e4,-0xc(%ebp)
    127e:	72 e0                	jb     1260 <pass_next+0x23>
        if(t->tid == 0){
            t->tid = tid;
            break;
        } 
    }
    ttable.total++;
    1280:	a1 e4 27 00 00       	mov    0x27e4,%eax
    1285:	83 c0 01             	add    $0x1,%eax
    1288:	a3 e4 27 00 00       	mov    %eax,0x27e4
    lock_release(&ttable.lock);
    128d:	c7 04 24 e0 25 00 00 	movl   $0x25e0,(%esp)
    1294:	e8 8b 09 00 00       	call   1c24 <lock_release>

   for(;;){
        lock_acquire(&ttable.lock);
    1299:	c7 04 24 e0 25 00 00 	movl   $0x25e0,(%esp)
    12a0:	e8 5f 09 00 00       	call   1c04 <lock_acquire>
        if(ttable.total == numthreads){
    12a5:	8b 15 e4 27 00 00    	mov    0x27e4,%edx
    12ab:	a1 c0 25 00 00       	mov    0x25c0,%eax
    12b0:	39 c2                	cmp    %eax,%edx
    12b2:	75 39                	jne    12ed <pass_next+0xb0>
            printf(1," tid %d ready to go\n",t->tid);
    12b4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    12b7:	8b 00                	mov    (%eax),%eax
    12b9:	89 44 24 08          	mov    %eax,0x8(%esp)
    12bd:	c7 44 24 04 84 20 00 	movl   $0x2084,0x4(%esp)
    12c4:	00 
    12c5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    12cc:	e8 3b 05 00 00       	call   180c <printf>
            barrier++;
    12d1:	a1 c8 25 00 00       	mov    0x25c8,%eax
    12d6:	83 c0 01             	add    $0x1,%eax
    12d9:	a3 c8 25 00 00       	mov    %eax,0x25c8
            goto start;
    12de:	90                   	nop
        lock_release(&ttable.lock);
    }
    
//barriar above
start:
     lock_release(&ttable.lock);
    12df:	c7 04 24 e0 25 00 00 	movl   $0x25e0,(%esp)
    12e6:	e8 39 09 00 00       	call   1c24 <lock_release>
     while(barrier != numthreads);
    12eb:	eb 0e                	jmp    12fb <pass_next+0xbe>
        if(ttable.total == numthreads){
            printf(1," tid %d ready to go\n",t->tid);
            barrier++;
            goto start;
        }
        lock_release(&ttable.lock);
    12ed:	c7 04 24 e0 25 00 00 	movl   $0x25e0,(%esp)
    12f4:	e8 2b 09 00 00       	call   1c24 <lock_release>
    }
    12f9:	eb 9e                	jmp    1299 <pass_next+0x5c>
    
//barriar above
start:
     lock_release(&ttable.lock);
     while(barrier != numthreads);
    12fb:	8b 15 c8 25 00 00    	mov    0x25c8,%edx
    1301:	a1 c0 25 00 00       	mov    0x25c0,%eax
    1306:	39 c2                	cmp    %eax,%edx
    1308:	75 f1                	jne    12fb <pass_next+0xbe>
    //throw frisbee
    do{
        lock_acquire(&frisbee.lock);
    130a:	c7 04 24 e8 27 00 00 	movl   $0x27e8,(%esp)
    1311:	e8 ee 08 00 00       	call   1c04 <lock_acquire>
        if(frisbee.pass > numpass){
    1316:	8b 15 ec 27 00 00    	mov    0x27ec,%edx
    131c:	a1 c4 25 00 00       	mov    0x25c4,%eax
    1321:	39 c2                	cmp    %eax,%edx
    1323:	7e 39                	jle    135e <pass_next+0x121>
            lock_release(&frisbee.lock);
    1325:	c7 04 24 e8 27 00 00 	movl   $0x27e8,(%esp)
    132c:	e8 f3 08 00 00       	call   1c24 <lock_release>
            goto leaving;
    1331:	90                   	nop
        frisbee.holding_thread = tid;
        lock_release(&frisbee.lock);
    }while(1);

leaving: 
    lock_release(&frisbee.lock);
    1332:	c7 04 24 e8 27 00 00 	movl   $0x27e8,(%esp)
    1339:	e8 e6 08 00 00       	call   1c24 <lock_release>
    printf(1,"thread %d out of game\n",tid);
    133e:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1341:	89 44 24 08          	mov    %eax,0x8(%esp)
    1345:	c7 44 24 04 d0 20 00 	movl   $0x20d0,0x4(%esp)
    134c:	00 
    134d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1354:	e8 b3 04 00 00       	call   180c <printf>
    texit();
    1359:	e8 b6 03 00 00       	call   1714 <texit>
        lock_acquire(&frisbee.lock);
        if(frisbee.pass > numpass){
            lock_release(&frisbee.lock);
            goto leaving;
        }
        if(frisbee.holding_thread == tid){
    135e:	a1 f0 27 00 00       	mov    0x27f0,%eax
    1363:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    1366:	75 1b                	jne    1383 <pass_next+0x146>
            lock_release(&frisbee.lock);
    1368:	c7 04 24 e8 27 00 00 	movl   $0x27e8,(%esp)
    136f:	e8 b0 08 00 00       	call   1c24 <lock_release>
            sleep(5);
    1374:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
    137b:	e8 7c 03 00 00       	call   16fc <sleep>
            continue;
    1380:	90                   	nop
        printf(1,"pass: %d, thread %d catch the frisbee. throwing...\n",
                frisbee.pass, tid);
        frisbee.pass++;
        frisbee.holding_thread = tid;
        lock_release(&frisbee.lock);
    }while(1);
    1381:	eb 87                	jmp    130a <pass_next+0xcd>
        if(frisbee.holding_thread == tid){
            lock_release(&frisbee.lock);
            sleep(5);
            continue;
        }
        printf(1,"pass: %d, thread %d catch the frisbee. throwing...\n",
    1383:	a1 ec 27 00 00       	mov    0x27ec,%eax
    1388:	8b 55 f0             	mov    -0x10(%ebp),%edx
    138b:	89 54 24 0c          	mov    %edx,0xc(%esp)
    138f:	89 44 24 08          	mov    %eax,0x8(%esp)
    1393:	c7 44 24 04 9c 20 00 	movl   $0x209c,0x4(%esp)
    139a:	00 
    139b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    13a2:	e8 65 04 00 00       	call   180c <printf>
                frisbee.pass, tid);
        frisbee.pass++;
    13a7:	a1 ec 27 00 00       	mov    0x27ec,%eax
    13ac:	83 c0 01             	add    $0x1,%eax
    13af:	a3 ec 27 00 00       	mov    %eax,0x27ec
        frisbee.holding_thread = tid;
    13b4:	8b 45 f0             	mov    -0x10(%ebp),%eax
    13b7:	a3 f0 27 00 00       	mov    %eax,0x27f0
        lock_release(&frisbee.lock);
    13bc:	c7 04 24 e8 27 00 00 	movl   $0x27e8,(%esp)
    13c3:	e8 5c 08 00 00       	call   1c24 <lock_release>
    }while(1);
    13c8:	e9 3d ff ff ff       	jmp    130a <pass_next+0xcd>

000013cd <lookup>:
    lock_release(&frisbee.lock);
    printf(1,"thread %d out of game\n",tid);
    texit();
}

int lookup(int num_threads){
    13cd:	55                   	push   %ebp
    13ce:	89 e5                	mov    %esp,%ebp
    13d0:	83 ec 10             	sub    $0x10,%esp
    int i;
    struct thread *t;
    i = 0;
    13d3:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    for(t=ttable.thread;t<&ttable.thread[64];t++){
    13da:	c7 45 f8 e4 25 00 00 	movl   $0x25e4,-0x8(%ebp)
    13e1:	eb 11                	jmp    13f4 <lookup+0x27>
        if(t->tid != 0){
    13e3:	8b 45 f8             	mov    -0x8(%ebp),%eax
    13e6:	8b 00                	mov    (%eax),%eax
    13e8:	85 c0                	test   %eax,%eax
    13ea:	74 04                	je     13f0 <lookup+0x23>
            i++;
    13ec:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)

int lookup(int num_threads){
    int i;
    struct thread *t;
    i = 0;
    for(t=ttable.thread;t<&ttable.thread[64];t++){
    13f0:	83 45 f8 08          	addl   $0x8,-0x8(%ebp)
    13f4:	81 7d f8 e4 27 00 00 	cmpl   $0x27e4,-0x8(%ebp)
    13fb:	72 e6                	jb     13e3 <lookup+0x16>
        if(t->tid != 0){
            i++;
        }
    }
    return i;
    13fd:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    1400:	c9                   	leave  
    1401:	c3                   	ret    
    1402:	66 90                	xchg   %ax,%ax

00001404 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
    1404:	55                   	push   %ebp
    1405:	89 e5                	mov    %esp,%ebp
    1407:	57                   	push   %edi
    1408:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
    1409:	8b 4d 08             	mov    0x8(%ebp),%ecx
    140c:	8b 55 10             	mov    0x10(%ebp),%edx
    140f:	8b 45 0c             	mov    0xc(%ebp),%eax
    1412:	89 cb                	mov    %ecx,%ebx
    1414:	89 df                	mov    %ebx,%edi
    1416:	89 d1                	mov    %edx,%ecx
    1418:	fc                   	cld    
    1419:	f3 aa                	rep stos %al,%es:(%edi)
    141b:	89 ca                	mov    %ecx,%edx
    141d:	89 fb                	mov    %edi,%ebx
    141f:	89 5d 08             	mov    %ebx,0x8(%ebp)
    1422:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
    1425:	5b                   	pop    %ebx
    1426:	5f                   	pop    %edi
    1427:	5d                   	pop    %ebp
    1428:	c3                   	ret    

00001429 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
    1429:	55                   	push   %ebp
    142a:	89 e5                	mov    %esp,%ebp
    142c:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
    142f:	8b 45 08             	mov    0x8(%ebp),%eax
    1432:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
    1435:	90                   	nop
    1436:	8b 45 08             	mov    0x8(%ebp),%eax
    1439:	8d 50 01             	lea    0x1(%eax),%edx
    143c:	89 55 08             	mov    %edx,0x8(%ebp)
    143f:	8b 55 0c             	mov    0xc(%ebp),%edx
    1442:	8d 4a 01             	lea    0x1(%edx),%ecx
    1445:	89 4d 0c             	mov    %ecx,0xc(%ebp)
    1448:	0f b6 12             	movzbl (%edx),%edx
    144b:	88 10                	mov    %dl,(%eax)
    144d:	0f b6 00             	movzbl (%eax),%eax
    1450:	84 c0                	test   %al,%al
    1452:	75 e2                	jne    1436 <strcpy+0xd>
    ;
  return os;
    1454:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    1457:	c9                   	leave  
    1458:	c3                   	ret    

00001459 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    1459:	55                   	push   %ebp
    145a:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
    145c:	eb 08                	jmp    1466 <strcmp+0xd>
    p++, q++;
    145e:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    1462:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    1466:	8b 45 08             	mov    0x8(%ebp),%eax
    1469:	0f b6 00             	movzbl (%eax),%eax
    146c:	84 c0                	test   %al,%al
    146e:	74 10                	je     1480 <strcmp+0x27>
    1470:	8b 45 08             	mov    0x8(%ebp),%eax
    1473:	0f b6 10             	movzbl (%eax),%edx
    1476:	8b 45 0c             	mov    0xc(%ebp),%eax
    1479:	0f b6 00             	movzbl (%eax),%eax
    147c:	38 c2                	cmp    %al,%dl
    147e:	74 de                	je     145e <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
    1480:	8b 45 08             	mov    0x8(%ebp),%eax
    1483:	0f b6 00             	movzbl (%eax),%eax
    1486:	0f b6 d0             	movzbl %al,%edx
    1489:	8b 45 0c             	mov    0xc(%ebp),%eax
    148c:	0f b6 00             	movzbl (%eax),%eax
    148f:	0f b6 c0             	movzbl %al,%eax
    1492:	29 c2                	sub    %eax,%edx
    1494:	89 d0                	mov    %edx,%eax
}
    1496:	5d                   	pop    %ebp
    1497:	c3                   	ret    

00001498 <strlen>:

uint
strlen(char *s)
{
    1498:	55                   	push   %ebp
    1499:	89 e5                	mov    %esp,%ebp
    149b:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
    149e:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    14a5:	eb 04                	jmp    14ab <strlen+0x13>
    14a7:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    14ab:	8b 55 fc             	mov    -0x4(%ebp),%edx
    14ae:	8b 45 08             	mov    0x8(%ebp),%eax
    14b1:	01 d0                	add    %edx,%eax
    14b3:	0f b6 00             	movzbl (%eax),%eax
    14b6:	84 c0                	test   %al,%al
    14b8:	75 ed                	jne    14a7 <strlen+0xf>
    ;
  return n;
    14ba:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    14bd:	c9                   	leave  
    14be:	c3                   	ret    

000014bf <memset>:

void*
memset(void *dst, int c, uint n)
{
    14bf:	55                   	push   %ebp
    14c0:	89 e5                	mov    %esp,%ebp
    14c2:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
    14c5:	8b 45 10             	mov    0x10(%ebp),%eax
    14c8:	89 44 24 08          	mov    %eax,0x8(%esp)
    14cc:	8b 45 0c             	mov    0xc(%ebp),%eax
    14cf:	89 44 24 04          	mov    %eax,0x4(%esp)
    14d3:	8b 45 08             	mov    0x8(%ebp),%eax
    14d6:	89 04 24             	mov    %eax,(%esp)
    14d9:	e8 26 ff ff ff       	call   1404 <stosb>
  return dst;
    14de:	8b 45 08             	mov    0x8(%ebp),%eax
}
    14e1:	c9                   	leave  
    14e2:	c3                   	ret    

000014e3 <strchr>:

char*
strchr(const char *s, char c)
{
    14e3:	55                   	push   %ebp
    14e4:	89 e5                	mov    %esp,%ebp
    14e6:	83 ec 04             	sub    $0x4,%esp
    14e9:	8b 45 0c             	mov    0xc(%ebp),%eax
    14ec:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
    14ef:	eb 14                	jmp    1505 <strchr+0x22>
    if(*s == c)
    14f1:	8b 45 08             	mov    0x8(%ebp),%eax
    14f4:	0f b6 00             	movzbl (%eax),%eax
    14f7:	3a 45 fc             	cmp    -0x4(%ebp),%al
    14fa:	75 05                	jne    1501 <strchr+0x1e>
      return (char*)s;
    14fc:	8b 45 08             	mov    0x8(%ebp),%eax
    14ff:	eb 13                	jmp    1514 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
    1501:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    1505:	8b 45 08             	mov    0x8(%ebp),%eax
    1508:	0f b6 00             	movzbl (%eax),%eax
    150b:	84 c0                	test   %al,%al
    150d:	75 e2                	jne    14f1 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
    150f:	b8 00 00 00 00       	mov    $0x0,%eax
}
    1514:	c9                   	leave  
    1515:	c3                   	ret    

00001516 <gets>:

char*
gets(char *buf, int max)
{
    1516:	55                   	push   %ebp
    1517:	89 e5                	mov    %esp,%ebp
    1519:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    151c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    1523:	eb 4c                	jmp    1571 <gets+0x5b>
    cc = read(0, &c, 1);
    1525:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    152c:	00 
    152d:	8d 45 ef             	lea    -0x11(%ebp),%eax
    1530:	89 44 24 04          	mov    %eax,0x4(%esp)
    1534:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    153b:	e8 44 01 00 00       	call   1684 <read>
    1540:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
    1543:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1547:	7f 02                	jg     154b <gets+0x35>
      break;
    1549:	eb 31                	jmp    157c <gets+0x66>
    buf[i++] = c;
    154b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    154e:	8d 50 01             	lea    0x1(%eax),%edx
    1551:	89 55 f4             	mov    %edx,-0xc(%ebp)
    1554:	89 c2                	mov    %eax,%edx
    1556:	8b 45 08             	mov    0x8(%ebp),%eax
    1559:	01 c2                	add    %eax,%edx
    155b:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    155f:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
    1561:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    1565:	3c 0a                	cmp    $0xa,%al
    1567:	74 13                	je     157c <gets+0x66>
    1569:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    156d:	3c 0d                	cmp    $0xd,%al
    156f:	74 0b                	je     157c <gets+0x66>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1571:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1574:	83 c0 01             	add    $0x1,%eax
    1577:	3b 45 0c             	cmp    0xc(%ebp),%eax
    157a:	7c a9                	jl     1525 <gets+0xf>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    157c:	8b 55 f4             	mov    -0xc(%ebp),%edx
    157f:	8b 45 08             	mov    0x8(%ebp),%eax
    1582:	01 d0                	add    %edx,%eax
    1584:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
    1587:	8b 45 08             	mov    0x8(%ebp),%eax
}
    158a:	c9                   	leave  
    158b:	c3                   	ret    

0000158c <stat>:

int
stat(char *n, struct stat *st)
{
    158c:	55                   	push   %ebp
    158d:	89 e5                	mov    %esp,%ebp
    158f:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    1592:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1599:	00 
    159a:	8b 45 08             	mov    0x8(%ebp),%eax
    159d:	89 04 24             	mov    %eax,(%esp)
    15a0:	e8 07 01 00 00       	call   16ac <open>
    15a5:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
    15a8:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    15ac:	79 07                	jns    15b5 <stat+0x29>
    return -1;
    15ae:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    15b3:	eb 23                	jmp    15d8 <stat+0x4c>
  r = fstat(fd, st);
    15b5:	8b 45 0c             	mov    0xc(%ebp),%eax
    15b8:	89 44 24 04          	mov    %eax,0x4(%esp)
    15bc:	8b 45 f4             	mov    -0xc(%ebp),%eax
    15bf:	89 04 24             	mov    %eax,(%esp)
    15c2:	e8 fd 00 00 00       	call   16c4 <fstat>
    15c7:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
    15ca:	8b 45 f4             	mov    -0xc(%ebp),%eax
    15cd:	89 04 24             	mov    %eax,(%esp)
    15d0:	e8 bf 00 00 00       	call   1694 <close>
  return r;
    15d5:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
    15d8:	c9                   	leave  
    15d9:	c3                   	ret    

000015da <atoi>:

int
atoi(const char *s)
{
    15da:	55                   	push   %ebp
    15db:	89 e5                	mov    %esp,%ebp
    15dd:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
    15e0:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
    15e7:	eb 25                	jmp    160e <atoi+0x34>
    n = n*10 + *s++ - '0';
    15e9:	8b 55 fc             	mov    -0x4(%ebp),%edx
    15ec:	89 d0                	mov    %edx,%eax
    15ee:	c1 e0 02             	shl    $0x2,%eax
    15f1:	01 d0                	add    %edx,%eax
    15f3:	01 c0                	add    %eax,%eax
    15f5:	89 c1                	mov    %eax,%ecx
    15f7:	8b 45 08             	mov    0x8(%ebp),%eax
    15fa:	8d 50 01             	lea    0x1(%eax),%edx
    15fd:	89 55 08             	mov    %edx,0x8(%ebp)
    1600:	0f b6 00             	movzbl (%eax),%eax
    1603:	0f be c0             	movsbl %al,%eax
    1606:	01 c8                	add    %ecx,%eax
    1608:	83 e8 30             	sub    $0x30,%eax
    160b:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    160e:	8b 45 08             	mov    0x8(%ebp),%eax
    1611:	0f b6 00             	movzbl (%eax),%eax
    1614:	3c 2f                	cmp    $0x2f,%al
    1616:	7e 0a                	jle    1622 <atoi+0x48>
    1618:	8b 45 08             	mov    0x8(%ebp),%eax
    161b:	0f b6 00             	movzbl (%eax),%eax
    161e:	3c 39                	cmp    $0x39,%al
    1620:	7e c7                	jle    15e9 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
    1622:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    1625:	c9                   	leave  
    1626:	c3                   	ret    

00001627 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    1627:	55                   	push   %ebp
    1628:	89 e5                	mov    %esp,%ebp
    162a:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
    162d:	8b 45 08             	mov    0x8(%ebp),%eax
    1630:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
    1633:	8b 45 0c             	mov    0xc(%ebp),%eax
    1636:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
    1639:	eb 17                	jmp    1652 <memmove+0x2b>
    *dst++ = *src++;
    163b:	8b 45 fc             	mov    -0x4(%ebp),%eax
    163e:	8d 50 01             	lea    0x1(%eax),%edx
    1641:	89 55 fc             	mov    %edx,-0x4(%ebp)
    1644:	8b 55 f8             	mov    -0x8(%ebp),%edx
    1647:	8d 4a 01             	lea    0x1(%edx),%ecx
    164a:	89 4d f8             	mov    %ecx,-0x8(%ebp)
    164d:	0f b6 12             	movzbl (%edx),%edx
    1650:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    1652:	8b 45 10             	mov    0x10(%ebp),%eax
    1655:	8d 50 ff             	lea    -0x1(%eax),%edx
    1658:	89 55 10             	mov    %edx,0x10(%ebp)
    165b:	85 c0                	test   %eax,%eax
    165d:	7f dc                	jg     163b <memmove+0x14>
    *dst++ = *src++;
  return vdst;
    165f:	8b 45 08             	mov    0x8(%ebp),%eax
}
    1662:	c9                   	leave  
    1663:	c3                   	ret    

00001664 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    1664:	b8 01 00 00 00       	mov    $0x1,%eax
    1669:	cd 40                	int    $0x40
    166b:	c3                   	ret    

0000166c <exit>:
SYSCALL(exit)
    166c:	b8 02 00 00 00       	mov    $0x2,%eax
    1671:	cd 40                	int    $0x40
    1673:	c3                   	ret    

00001674 <wait>:
SYSCALL(wait)
    1674:	b8 03 00 00 00       	mov    $0x3,%eax
    1679:	cd 40                	int    $0x40
    167b:	c3                   	ret    

0000167c <pipe>:
SYSCALL(pipe)
    167c:	b8 04 00 00 00       	mov    $0x4,%eax
    1681:	cd 40                	int    $0x40
    1683:	c3                   	ret    

00001684 <read>:
SYSCALL(read)
    1684:	b8 05 00 00 00       	mov    $0x5,%eax
    1689:	cd 40                	int    $0x40
    168b:	c3                   	ret    

0000168c <write>:
SYSCALL(write)
    168c:	b8 10 00 00 00       	mov    $0x10,%eax
    1691:	cd 40                	int    $0x40
    1693:	c3                   	ret    

00001694 <close>:
SYSCALL(close)
    1694:	b8 15 00 00 00       	mov    $0x15,%eax
    1699:	cd 40                	int    $0x40
    169b:	c3                   	ret    

0000169c <kill>:
SYSCALL(kill)
    169c:	b8 06 00 00 00       	mov    $0x6,%eax
    16a1:	cd 40                	int    $0x40
    16a3:	c3                   	ret    

000016a4 <exec>:
SYSCALL(exec)
    16a4:	b8 07 00 00 00       	mov    $0x7,%eax
    16a9:	cd 40                	int    $0x40
    16ab:	c3                   	ret    

000016ac <open>:
SYSCALL(open)
    16ac:	b8 0f 00 00 00       	mov    $0xf,%eax
    16b1:	cd 40                	int    $0x40
    16b3:	c3                   	ret    

000016b4 <mknod>:
SYSCALL(mknod)
    16b4:	b8 11 00 00 00       	mov    $0x11,%eax
    16b9:	cd 40                	int    $0x40
    16bb:	c3                   	ret    

000016bc <unlink>:
SYSCALL(unlink)
    16bc:	b8 12 00 00 00       	mov    $0x12,%eax
    16c1:	cd 40                	int    $0x40
    16c3:	c3                   	ret    

000016c4 <fstat>:
SYSCALL(fstat)
    16c4:	b8 08 00 00 00       	mov    $0x8,%eax
    16c9:	cd 40                	int    $0x40
    16cb:	c3                   	ret    

000016cc <link>:
SYSCALL(link)
    16cc:	b8 13 00 00 00       	mov    $0x13,%eax
    16d1:	cd 40                	int    $0x40
    16d3:	c3                   	ret    

000016d4 <mkdir>:
SYSCALL(mkdir)
    16d4:	b8 14 00 00 00       	mov    $0x14,%eax
    16d9:	cd 40                	int    $0x40
    16db:	c3                   	ret    

000016dc <chdir>:
SYSCALL(chdir)
    16dc:	b8 09 00 00 00       	mov    $0x9,%eax
    16e1:	cd 40                	int    $0x40
    16e3:	c3                   	ret    

000016e4 <dup>:
SYSCALL(dup)
    16e4:	b8 0a 00 00 00       	mov    $0xa,%eax
    16e9:	cd 40                	int    $0x40
    16eb:	c3                   	ret    

000016ec <getpid>:
SYSCALL(getpid)
    16ec:	b8 0b 00 00 00       	mov    $0xb,%eax
    16f1:	cd 40                	int    $0x40
    16f3:	c3                   	ret    

000016f4 <sbrk>:
SYSCALL(sbrk)
    16f4:	b8 0c 00 00 00       	mov    $0xc,%eax
    16f9:	cd 40                	int    $0x40
    16fb:	c3                   	ret    

000016fc <sleep>:
SYSCALL(sleep)
    16fc:	b8 0d 00 00 00       	mov    $0xd,%eax
    1701:	cd 40                	int    $0x40
    1703:	c3                   	ret    

00001704 <uptime>:
SYSCALL(uptime)
    1704:	b8 0e 00 00 00       	mov    $0xe,%eax
    1709:	cd 40                	int    $0x40
    170b:	c3                   	ret    

0000170c <clone>:
SYSCALL(clone)
    170c:	b8 16 00 00 00       	mov    $0x16,%eax
    1711:	cd 40                	int    $0x40
    1713:	c3                   	ret    

00001714 <texit>:
SYSCALL(texit)
    1714:	b8 17 00 00 00       	mov    $0x17,%eax
    1719:	cd 40                	int    $0x40
    171b:	c3                   	ret    

0000171c <tsleep>:
SYSCALL(tsleep)
    171c:	b8 18 00 00 00       	mov    $0x18,%eax
    1721:	cd 40                	int    $0x40
    1723:	c3                   	ret    

00001724 <twakeup>:
SYSCALL(twakeup)
    1724:	b8 19 00 00 00       	mov    $0x19,%eax
    1729:	cd 40                	int    $0x40
    172b:	c3                   	ret    

0000172c <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
    172c:	55                   	push   %ebp
    172d:	89 e5                	mov    %esp,%ebp
    172f:	83 ec 18             	sub    $0x18,%esp
    1732:	8b 45 0c             	mov    0xc(%ebp),%eax
    1735:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
    1738:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    173f:	00 
    1740:	8d 45 f4             	lea    -0xc(%ebp),%eax
    1743:	89 44 24 04          	mov    %eax,0x4(%esp)
    1747:	8b 45 08             	mov    0x8(%ebp),%eax
    174a:	89 04 24             	mov    %eax,(%esp)
    174d:	e8 3a ff ff ff       	call   168c <write>
}
    1752:	c9                   	leave  
    1753:	c3                   	ret    

00001754 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
    1754:	55                   	push   %ebp
    1755:	89 e5                	mov    %esp,%ebp
    1757:	56                   	push   %esi
    1758:	53                   	push   %ebx
    1759:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    175c:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
    1763:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
    1767:	74 17                	je     1780 <printint+0x2c>
    1769:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    176d:	79 11                	jns    1780 <printint+0x2c>
    neg = 1;
    176f:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
    1776:	8b 45 0c             	mov    0xc(%ebp),%eax
    1779:	f7 d8                	neg    %eax
    177b:	89 45 ec             	mov    %eax,-0x14(%ebp)
    177e:	eb 06                	jmp    1786 <printint+0x32>
  } else {
    x = xx;
    1780:	8b 45 0c             	mov    0xc(%ebp),%eax
    1783:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
    1786:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
    178d:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    1790:	8d 41 01             	lea    0x1(%ecx),%eax
    1793:	89 45 f4             	mov    %eax,-0xc(%ebp)
    1796:	8b 5d 10             	mov    0x10(%ebp),%ebx
    1799:	8b 45 ec             	mov    -0x14(%ebp),%eax
    179c:	ba 00 00 00 00       	mov    $0x0,%edx
    17a1:	f7 f3                	div    %ebx
    17a3:	89 d0                	mov    %edx,%eax
    17a5:	0f b6 80 8c 25 00 00 	movzbl 0x258c(%eax),%eax
    17ac:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
    17b0:	8b 75 10             	mov    0x10(%ebp),%esi
    17b3:	8b 45 ec             	mov    -0x14(%ebp),%eax
    17b6:	ba 00 00 00 00       	mov    $0x0,%edx
    17bb:	f7 f6                	div    %esi
    17bd:	89 45 ec             	mov    %eax,-0x14(%ebp)
    17c0:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    17c4:	75 c7                	jne    178d <printint+0x39>
  if(neg)
    17c6:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    17ca:	74 10                	je     17dc <printint+0x88>
    buf[i++] = '-';
    17cc:	8b 45 f4             	mov    -0xc(%ebp),%eax
    17cf:	8d 50 01             	lea    0x1(%eax),%edx
    17d2:	89 55 f4             	mov    %edx,-0xc(%ebp)
    17d5:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
    17da:	eb 1f                	jmp    17fb <printint+0xa7>
    17dc:	eb 1d                	jmp    17fb <printint+0xa7>
    putc(fd, buf[i]);
    17de:	8d 55 dc             	lea    -0x24(%ebp),%edx
    17e1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    17e4:	01 d0                	add    %edx,%eax
    17e6:	0f b6 00             	movzbl (%eax),%eax
    17e9:	0f be c0             	movsbl %al,%eax
    17ec:	89 44 24 04          	mov    %eax,0x4(%esp)
    17f0:	8b 45 08             	mov    0x8(%ebp),%eax
    17f3:	89 04 24             	mov    %eax,(%esp)
    17f6:	e8 31 ff ff ff       	call   172c <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    17fb:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    17ff:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1803:	79 d9                	jns    17de <printint+0x8a>
    putc(fd, buf[i]);
}
    1805:	83 c4 30             	add    $0x30,%esp
    1808:	5b                   	pop    %ebx
    1809:	5e                   	pop    %esi
    180a:	5d                   	pop    %ebp
    180b:	c3                   	ret    

0000180c <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    180c:	55                   	push   %ebp
    180d:	89 e5                	mov    %esp,%ebp
    180f:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
    1812:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
    1819:	8d 45 0c             	lea    0xc(%ebp),%eax
    181c:	83 c0 04             	add    $0x4,%eax
    181f:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
    1822:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    1829:	e9 7c 01 00 00       	jmp    19aa <printf+0x19e>
    c = fmt[i] & 0xff;
    182e:	8b 55 0c             	mov    0xc(%ebp),%edx
    1831:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1834:	01 d0                	add    %edx,%eax
    1836:	0f b6 00             	movzbl (%eax),%eax
    1839:	0f be c0             	movsbl %al,%eax
    183c:	25 ff 00 00 00       	and    $0xff,%eax
    1841:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
    1844:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1848:	75 2c                	jne    1876 <printf+0x6a>
      if(c == '%'){
    184a:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    184e:	75 0c                	jne    185c <printf+0x50>
        state = '%';
    1850:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
    1857:	e9 4a 01 00 00       	jmp    19a6 <printf+0x19a>
      } else {
        putc(fd, c);
    185c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    185f:	0f be c0             	movsbl %al,%eax
    1862:	89 44 24 04          	mov    %eax,0x4(%esp)
    1866:	8b 45 08             	mov    0x8(%ebp),%eax
    1869:	89 04 24             	mov    %eax,(%esp)
    186c:	e8 bb fe ff ff       	call   172c <putc>
    1871:	e9 30 01 00 00       	jmp    19a6 <printf+0x19a>
      }
    } else if(state == '%'){
    1876:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
    187a:	0f 85 26 01 00 00    	jne    19a6 <printf+0x19a>
      if(c == 'd'){
    1880:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
    1884:	75 2d                	jne    18b3 <printf+0xa7>
        printint(fd, *ap, 10, 1);
    1886:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1889:	8b 00                	mov    (%eax),%eax
    188b:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    1892:	00 
    1893:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
    189a:	00 
    189b:	89 44 24 04          	mov    %eax,0x4(%esp)
    189f:	8b 45 08             	mov    0x8(%ebp),%eax
    18a2:	89 04 24             	mov    %eax,(%esp)
    18a5:	e8 aa fe ff ff       	call   1754 <printint>
        ap++;
    18aa:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    18ae:	e9 ec 00 00 00       	jmp    199f <printf+0x193>
      } else if(c == 'x' || c == 'p'){
    18b3:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
    18b7:	74 06                	je     18bf <printf+0xb3>
    18b9:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
    18bd:	75 2d                	jne    18ec <printf+0xe0>
        printint(fd, *ap, 16, 0);
    18bf:	8b 45 e8             	mov    -0x18(%ebp),%eax
    18c2:	8b 00                	mov    (%eax),%eax
    18c4:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    18cb:	00 
    18cc:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
    18d3:	00 
    18d4:	89 44 24 04          	mov    %eax,0x4(%esp)
    18d8:	8b 45 08             	mov    0x8(%ebp),%eax
    18db:	89 04 24             	mov    %eax,(%esp)
    18de:	e8 71 fe ff ff       	call   1754 <printint>
        ap++;
    18e3:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    18e7:	e9 b3 00 00 00       	jmp    199f <printf+0x193>
      } else if(c == 's'){
    18ec:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
    18f0:	75 45                	jne    1937 <printf+0x12b>
        s = (char*)*ap;
    18f2:	8b 45 e8             	mov    -0x18(%ebp),%eax
    18f5:	8b 00                	mov    (%eax),%eax
    18f7:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
    18fa:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
    18fe:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1902:	75 09                	jne    190d <printf+0x101>
          s = "(null)";
    1904:	c7 45 f4 e7 20 00 00 	movl   $0x20e7,-0xc(%ebp)
        while(*s != 0){
    190b:	eb 1e                	jmp    192b <printf+0x11f>
    190d:	eb 1c                	jmp    192b <printf+0x11f>
          putc(fd, *s);
    190f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1912:	0f b6 00             	movzbl (%eax),%eax
    1915:	0f be c0             	movsbl %al,%eax
    1918:	89 44 24 04          	mov    %eax,0x4(%esp)
    191c:	8b 45 08             	mov    0x8(%ebp),%eax
    191f:	89 04 24             	mov    %eax,(%esp)
    1922:	e8 05 fe ff ff       	call   172c <putc>
          s++;
    1927:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    192b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    192e:	0f b6 00             	movzbl (%eax),%eax
    1931:	84 c0                	test   %al,%al
    1933:	75 da                	jne    190f <printf+0x103>
    1935:	eb 68                	jmp    199f <printf+0x193>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    1937:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
    193b:	75 1d                	jne    195a <printf+0x14e>
        putc(fd, *ap);
    193d:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1940:	8b 00                	mov    (%eax),%eax
    1942:	0f be c0             	movsbl %al,%eax
    1945:	89 44 24 04          	mov    %eax,0x4(%esp)
    1949:	8b 45 08             	mov    0x8(%ebp),%eax
    194c:	89 04 24             	mov    %eax,(%esp)
    194f:	e8 d8 fd ff ff       	call   172c <putc>
        ap++;
    1954:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    1958:	eb 45                	jmp    199f <printf+0x193>
      } else if(c == '%'){
    195a:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    195e:	75 17                	jne    1977 <printf+0x16b>
        putc(fd, c);
    1960:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1963:	0f be c0             	movsbl %al,%eax
    1966:	89 44 24 04          	mov    %eax,0x4(%esp)
    196a:	8b 45 08             	mov    0x8(%ebp),%eax
    196d:	89 04 24             	mov    %eax,(%esp)
    1970:	e8 b7 fd ff ff       	call   172c <putc>
    1975:	eb 28                	jmp    199f <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
    1977:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
    197e:	00 
    197f:	8b 45 08             	mov    0x8(%ebp),%eax
    1982:	89 04 24             	mov    %eax,(%esp)
    1985:	e8 a2 fd ff ff       	call   172c <putc>
        putc(fd, c);
    198a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    198d:	0f be c0             	movsbl %al,%eax
    1990:	89 44 24 04          	mov    %eax,0x4(%esp)
    1994:	8b 45 08             	mov    0x8(%ebp),%eax
    1997:	89 04 24             	mov    %eax,(%esp)
    199a:	e8 8d fd ff ff       	call   172c <putc>
      }
      state = 0;
    199f:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    19a6:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    19aa:	8b 55 0c             	mov    0xc(%ebp),%edx
    19ad:	8b 45 f0             	mov    -0x10(%ebp),%eax
    19b0:	01 d0                	add    %edx,%eax
    19b2:	0f b6 00             	movzbl (%eax),%eax
    19b5:	84 c0                	test   %al,%al
    19b7:	0f 85 71 fe ff ff    	jne    182e <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    19bd:	c9                   	leave  
    19be:	c3                   	ret    
    19bf:	90                   	nop

000019c0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    19c0:	55                   	push   %ebp
    19c1:	89 e5                	mov    %esp,%ebp
    19c3:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
    19c6:	8b 45 08             	mov    0x8(%ebp),%eax
    19c9:	83 e8 08             	sub    $0x8,%eax
    19cc:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    19cf:	a1 d4 25 00 00       	mov    0x25d4,%eax
    19d4:	89 45 fc             	mov    %eax,-0x4(%ebp)
    19d7:	eb 24                	jmp    19fd <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    19d9:	8b 45 fc             	mov    -0x4(%ebp),%eax
    19dc:	8b 00                	mov    (%eax),%eax
    19de:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    19e1:	77 12                	ja     19f5 <free+0x35>
    19e3:	8b 45 f8             	mov    -0x8(%ebp),%eax
    19e6:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    19e9:	77 24                	ja     1a0f <free+0x4f>
    19eb:	8b 45 fc             	mov    -0x4(%ebp),%eax
    19ee:	8b 00                	mov    (%eax),%eax
    19f0:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    19f3:	77 1a                	ja     1a0f <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    19f5:	8b 45 fc             	mov    -0x4(%ebp),%eax
    19f8:	8b 00                	mov    (%eax),%eax
    19fa:	89 45 fc             	mov    %eax,-0x4(%ebp)
    19fd:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1a00:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    1a03:	76 d4                	jbe    19d9 <free+0x19>
    1a05:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1a08:	8b 00                	mov    (%eax),%eax
    1a0a:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    1a0d:	76 ca                	jbe    19d9 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    1a0f:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1a12:	8b 40 04             	mov    0x4(%eax),%eax
    1a15:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    1a1c:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1a1f:	01 c2                	add    %eax,%edx
    1a21:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1a24:	8b 00                	mov    (%eax),%eax
    1a26:	39 c2                	cmp    %eax,%edx
    1a28:	75 24                	jne    1a4e <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
    1a2a:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1a2d:	8b 50 04             	mov    0x4(%eax),%edx
    1a30:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1a33:	8b 00                	mov    (%eax),%eax
    1a35:	8b 40 04             	mov    0x4(%eax),%eax
    1a38:	01 c2                	add    %eax,%edx
    1a3a:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1a3d:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
    1a40:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1a43:	8b 00                	mov    (%eax),%eax
    1a45:	8b 10                	mov    (%eax),%edx
    1a47:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1a4a:	89 10                	mov    %edx,(%eax)
    1a4c:	eb 0a                	jmp    1a58 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
    1a4e:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1a51:	8b 10                	mov    (%eax),%edx
    1a53:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1a56:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
    1a58:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1a5b:	8b 40 04             	mov    0x4(%eax),%eax
    1a5e:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    1a65:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1a68:	01 d0                	add    %edx,%eax
    1a6a:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    1a6d:	75 20                	jne    1a8f <free+0xcf>
    p->s.size += bp->s.size;
    1a6f:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1a72:	8b 50 04             	mov    0x4(%eax),%edx
    1a75:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1a78:	8b 40 04             	mov    0x4(%eax),%eax
    1a7b:	01 c2                	add    %eax,%edx
    1a7d:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1a80:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    1a83:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1a86:	8b 10                	mov    (%eax),%edx
    1a88:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1a8b:	89 10                	mov    %edx,(%eax)
    1a8d:	eb 08                	jmp    1a97 <free+0xd7>
  } else
    p->s.ptr = bp;
    1a8f:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1a92:	8b 55 f8             	mov    -0x8(%ebp),%edx
    1a95:	89 10                	mov    %edx,(%eax)
  freep = p;
    1a97:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1a9a:	a3 d4 25 00 00       	mov    %eax,0x25d4
}
    1a9f:	c9                   	leave  
    1aa0:	c3                   	ret    

00001aa1 <morecore>:

static Header*
morecore(uint nu)
{
    1aa1:	55                   	push   %ebp
    1aa2:	89 e5                	mov    %esp,%ebp
    1aa4:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
    1aa7:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
    1aae:	77 07                	ja     1ab7 <morecore+0x16>
    nu = 4096;
    1ab0:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
    1ab7:	8b 45 08             	mov    0x8(%ebp),%eax
    1aba:	c1 e0 03             	shl    $0x3,%eax
    1abd:	89 04 24             	mov    %eax,(%esp)
    1ac0:	e8 2f fc ff ff       	call   16f4 <sbrk>
    1ac5:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
    1ac8:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
    1acc:	75 07                	jne    1ad5 <morecore+0x34>
    return 0;
    1ace:	b8 00 00 00 00       	mov    $0x0,%eax
    1ad3:	eb 22                	jmp    1af7 <morecore+0x56>
  hp = (Header*)p;
    1ad5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1ad8:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
    1adb:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1ade:	8b 55 08             	mov    0x8(%ebp),%edx
    1ae1:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
    1ae4:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1ae7:	83 c0 08             	add    $0x8,%eax
    1aea:	89 04 24             	mov    %eax,(%esp)
    1aed:	e8 ce fe ff ff       	call   19c0 <free>
  return freep;
    1af2:	a1 d4 25 00 00       	mov    0x25d4,%eax
}
    1af7:	c9                   	leave  
    1af8:	c3                   	ret    

00001af9 <malloc>:

void*
malloc(uint nbytes)
{
    1af9:	55                   	push   %ebp
    1afa:	89 e5                	mov    %esp,%ebp
    1afc:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1aff:	8b 45 08             	mov    0x8(%ebp),%eax
    1b02:	83 c0 07             	add    $0x7,%eax
    1b05:	c1 e8 03             	shr    $0x3,%eax
    1b08:	83 c0 01             	add    $0x1,%eax
    1b0b:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
    1b0e:	a1 d4 25 00 00       	mov    0x25d4,%eax
    1b13:	89 45 f0             	mov    %eax,-0x10(%ebp)
    1b16:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1b1a:	75 23                	jne    1b3f <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
    1b1c:	c7 45 f0 cc 25 00 00 	movl   $0x25cc,-0x10(%ebp)
    1b23:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1b26:	a3 d4 25 00 00       	mov    %eax,0x25d4
    1b2b:	a1 d4 25 00 00       	mov    0x25d4,%eax
    1b30:	a3 cc 25 00 00       	mov    %eax,0x25cc
    base.s.size = 0;
    1b35:	c7 05 d0 25 00 00 00 	movl   $0x0,0x25d0
    1b3c:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1b3f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1b42:	8b 00                	mov    (%eax),%eax
    1b44:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
    1b47:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1b4a:	8b 40 04             	mov    0x4(%eax),%eax
    1b4d:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    1b50:	72 4d                	jb     1b9f <malloc+0xa6>
      if(p->s.size == nunits)
    1b52:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1b55:	8b 40 04             	mov    0x4(%eax),%eax
    1b58:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    1b5b:	75 0c                	jne    1b69 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
    1b5d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1b60:	8b 10                	mov    (%eax),%edx
    1b62:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1b65:	89 10                	mov    %edx,(%eax)
    1b67:	eb 26                	jmp    1b8f <malloc+0x96>
      else {
        p->s.size -= nunits;
    1b69:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1b6c:	8b 40 04             	mov    0x4(%eax),%eax
    1b6f:	2b 45 ec             	sub    -0x14(%ebp),%eax
    1b72:	89 c2                	mov    %eax,%edx
    1b74:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1b77:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
    1b7a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1b7d:	8b 40 04             	mov    0x4(%eax),%eax
    1b80:	c1 e0 03             	shl    $0x3,%eax
    1b83:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
    1b86:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1b89:	8b 55 ec             	mov    -0x14(%ebp),%edx
    1b8c:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
    1b8f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1b92:	a3 d4 25 00 00       	mov    %eax,0x25d4
      return (void*)(p + 1);
    1b97:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1b9a:	83 c0 08             	add    $0x8,%eax
    1b9d:	eb 38                	jmp    1bd7 <malloc+0xde>
    }
    if(p == freep)
    1b9f:	a1 d4 25 00 00       	mov    0x25d4,%eax
    1ba4:	39 45 f4             	cmp    %eax,-0xc(%ebp)
    1ba7:	75 1b                	jne    1bc4 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
    1ba9:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1bac:	89 04 24             	mov    %eax,(%esp)
    1baf:	e8 ed fe ff ff       	call   1aa1 <morecore>
    1bb4:	89 45 f4             	mov    %eax,-0xc(%ebp)
    1bb7:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1bbb:	75 07                	jne    1bc4 <malloc+0xcb>
        return 0;
    1bbd:	b8 00 00 00 00       	mov    $0x0,%eax
    1bc2:	eb 13                	jmp    1bd7 <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1bc4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1bc7:	89 45 f0             	mov    %eax,-0x10(%ebp)
    1bca:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1bcd:	8b 00                	mov    (%eax),%eax
    1bcf:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
    1bd2:	e9 70 ff ff ff       	jmp    1b47 <malloc+0x4e>
}
    1bd7:	c9                   	leave  
    1bd8:	c3                   	ret    
    1bd9:	66 90                	xchg   %ax,%ax
    1bdb:	90                   	nop

00001bdc <xchg>:
  asm volatile("sti");
}

static inline uint
xchg(volatile uint *addr, uint newval)
{
    1bdc:	55                   	push   %ebp
    1bdd:	89 e5                	mov    %esp,%ebp
    1bdf:	83 ec 10             	sub    $0x10,%esp
  uint result;
  
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
    1be2:	8b 55 08             	mov    0x8(%ebp),%edx
    1be5:	8b 45 0c             	mov    0xc(%ebp),%eax
    1be8:	8b 4d 08             	mov    0x8(%ebp),%ecx
    1beb:	f0 87 02             	lock xchg %eax,(%edx)
    1bee:	89 45 fc             	mov    %eax,-0x4(%ebp)
               "+m" (*addr), "=a" (result) :
               "1" (newval) :
               "cc");
  return result;
    1bf1:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    1bf4:	c9                   	leave  
    1bf5:	c3                   	ret    

00001bf6 <lock_init>:
#include "x86.h"
#include "proc.h"

unsigned long rands = 1;

void lock_init(lock_t *lock){
    1bf6:	55                   	push   %ebp
    1bf7:	89 e5                	mov    %esp,%ebp
    lock->locked = 0;
    1bf9:	8b 45 08             	mov    0x8(%ebp),%eax
    1bfc:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
    1c02:	5d                   	pop    %ebp
    1c03:	c3                   	ret    

00001c04 <lock_acquire>:
void lock_acquire(lock_t *lock){
    1c04:	55                   	push   %ebp
    1c05:	89 e5                	mov    %esp,%ebp
    1c07:	83 ec 08             	sub    $0x8,%esp
    while(xchg(&lock->locked,1) != 0);
    1c0a:	90                   	nop
    1c0b:	8b 45 08             	mov    0x8(%ebp),%eax
    1c0e:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
    1c15:	00 
    1c16:	89 04 24             	mov    %eax,(%esp)
    1c19:	e8 be ff ff ff       	call   1bdc <xchg>
    1c1e:	85 c0                	test   %eax,%eax
    1c20:	75 e9                	jne    1c0b <lock_acquire+0x7>
}
    1c22:	c9                   	leave  
    1c23:	c3                   	ret    

00001c24 <lock_release>:
void lock_release(lock_t *lock){
    1c24:	55                   	push   %ebp
    1c25:	89 e5                	mov    %esp,%ebp
    1c27:	83 ec 08             	sub    $0x8,%esp
    xchg(&lock->locked,0);
    1c2a:	8b 45 08             	mov    0x8(%ebp),%eax
    1c2d:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1c34:	00 
    1c35:	89 04 24             	mov    %eax,(%esp)
    1c38:	e8 9f ff ff ff       	call   1bdc <xchg>
}
    1c3d:	c9                   	leave  
    1c3e:	c3                   	ret    

00001c3f <thread_create>:


void *thread_create(void(*start_routine)(void*), void *arg){
    1c3f:	55                   	push   %ebp
    1c40:	89 e5                	mov    %esp,%ebp
    1c42:	83 ec 28             	sub    $0x28,%esp
    int tid;
    void * stack = malloc(2 * 4096);
    1c45:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
    1c4c:	e8 a8 fe ff ff       	call   1af9 <malloc>
    1c51:	89 45 f4             	mov    %eax,-0xc(%ebp)
    void *garbage_stack = stack; 
    1c54:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1c57:	89 45 f0             	mov    %eax,-0x10(%ebp)
   // printf(1,"start routine addr : %d\n",(uint)start_routine);


    if((uint)stack % 4096){
    1c5a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1c5d:	25 ff 0f 00 00       	and    $0xfff,%eax
    1c62:	85 c0                	test   %eax,%eax
    1c64:	74 14                	je     1c7a <thread_create+0x3b>
        stack = stack + (4096 - (uint)stack % 4096);
    1c66:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1c69:	25 ff 0f 00 00       	and    $0xfff,%eax
    1c6e:	89 c2                	mov    %eax,%edx
    1c70:	b8 00 10 00 00       	mov    $0x1000,%eax
    1c75:	29 d0                	sub    %edx,%eax
    1c77:	01 45 f4             	add    %eax,-0xc(%ebp)
    }
    if (stack == 0){
    1c7a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1c7e:	75 1b                	jne    1c9b <thread_create+0x5c>

        printf(1,"malloc fail \n");
    1c80:	c7 44 24 04 ee 20 00 	movl   $0x20ee,0x4(%esp)
    1c87:	00 
    1c88:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1c8f:	e8 78 fb ff ff       	call   180c <printf>
        return 0;
    1c94:	b8 00 00 00 00       	mov    $0x0,%eax
    1c99:	eb 6f                	jmp    1d0a <thread_create+0xcb>
    }

    tid = clone((uint)stack,PSIZE,(uint)start_routine,(int)arg);
    1c9b:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    1c9e:	8b 55 08             	mov    0x8(%ebp),%edx
    1ca1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1ca4:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
    1ca8:	89 54 24 08          	mov    %edx,0x8(%esp)
    1cac:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
    1cb3:	00 
    1cb4:	89 04 24             	mov    %eax,(%esp)
    1cb7:	e8 50 fa ff ff       	call   170c <clone>
    1cbc:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(tid < 0){
    1cbf:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1cc3:	79 1b                	jns    1ce0 <thread_create+0xa1>
        printf(1,"clone fails\n");
    1cc5:	c7 44 24 04 fc 20 00 	movl   $0x20fc,0x4(%esp)
    1ccc:	00 
    1ccd:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1cd4:	e8 33 fb ff ff       	call   180c <printf>
        return 0;
    1cd9:	b8 00 00 00 00       	mov    $0x0,%eax
    1cde:	eb 2a                	jmp    1d0a <thread_create+0xcb>
    }
    if(tid > 0){
    1ce0:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1ce4:	7e 05                	jle    1ceb <thread_create+0xac>
        //store threads on thread table
        return garbage_stack;
    1ce6:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1ce9:	eb 1f                	jmp    1d0a <thread_create+0xcb>
    }
    if(tid == 0){
    1ceb:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1cef:	75 14                	jne    1d05 <thread_create+0xc6>
        printf(1,"tid = 0 return \n");
    1cf1:	c7 44 24 04 09 21 00 	movl   $0x2109,0x4(%esp)
    1cf8:	00 
    1cf9:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1d00:	e8 07 fb ff ff       	call   180c <printf>
    }
//    wait();
//    free(garbage_stack);

    return 0;
    1d05:	b8 00 00 00 00       	mov    $0x0,%eax
}
    1d0a:	c9                   	leave  
    1d0b:	c3                   	ret    

00001d0c <random>:

// generate 0 -> max random number exclude max.
int random(int max){
    1d0c:	55                   	push   %ebp
    1d0d:	89 e5                	mov    %esp,%ebp
    rands = rands * 1664525 + 1013904233;
    1d0f:	a1 a0 25 00 00       	mov    0x25a0,%eax
    1d14:	69 c0 0d 66 19 00    	imul   $0x19660d,%eax,%eax
    1d1a:	05 69 f3 6e 3c       	add    $0x3c6ef369,%eax
    1d1f:	a3 a0 25 00 00       	mov    %eax,0x25a0
    return (int)(rands % max);
    1d24:	a1 a0 25 00 00       	mov    0x25a0,%eax
    1d29:	8b 4d 08             	mov    0x8(%ebp),%ecx
    1d2c:	ba 00 00 00 00       	mov    $0x0,%edx
    1d31:	f7 f1                	div    %ecx
    1d33:	89 d0                	mov    %edx,%eax
}
    1d35:	5d                   	pop    %ebp
    1d36:	c3                   	ret    
    1d37:	90                   	nop

00001d38 <init_q>:
#include "queue.h"
#include "types.h"
#include "user.h"

void init_q(struct queue *q){
    1d38:	55                   	push   %ebp
    1d39:	89 e5                	mov    %esp,%ebp
    q->size = 0;
    1d3b:	8b 45 08             	mov    0x8(%ebp),%eax
    1d3e:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    q->head = 0;
    1d44:	8b 45 08             	mov    0x8(%ebp),%eax
    1d47:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    q->tail = 0;
    1d4e:	8b 45 08             	mov    0x8(%ebp),%eax
    1d51:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
}
    1d58:	5d                   	pop    %ebp
    1d59:	c3                   	ret    

00001d5a <add_q>:

void add_q(struct queue *q, int v){
    1d5a:	55                   	push   %ebp
    1d5b:	89 e5                	mov    %esp,%ebp
    1d5d:	83 ec 28             	sub    $0x28,%esp
    struct node * n = malloc(sizeof(struct node));
    1d60:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
    1d67:	e8 8d fd ff ff       	call   1af9 <malloc>
    1d6c:	89 45 f4             	mov    %eax,-0xc(%ebp)
    n->next = 0;
    1d6f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1d72:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    n->value = v;
    1d79:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1d7c:	8b 55 0c             	mov    0xc(%ebp),%edx
    1d7f:	89 10                	mov    %edx,(%eax)
    if(q->head == 0){
    1d81:	8b 45 08             	mov    0x8(%ebp),%eax
    1d84:	8b 40 04             	mov    0x4(%eax),%eax
    1d87:	85 c0                	test   %eax,%eax
    1d89:	75 0b                	jne    1d96 <add_q+0x3c>
        q->head = n;
    1d8b:	8b 45 08             	mov    0x8(%ebp),%eax
    1d8e:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1d91:	89 50 04             	mov    %edx,0x4(%eax)
    1d94:	eb 0c                	jmp    1da2 <add_q+0x48>
    }else{
        q->tail->next = n;
    1d96:	8b 45 08             	mov    0x8(%ebp),%eax
    1d99:	8b 40 08             	mov    0x8(%eax),%eax
    1d9c:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1d9f:	89 50 04             	mov    %edx,0x4(%eax)
    }
    q->tail = n;
    1da2:	8b 45 08             	mov    0x8(%ebp),%eax
    1da5:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1da8:	89 50 08             	mov    %edx,0x8(%eax)
    q->size++;
    1dab:	8b 45 08             	mov    0x8(%ebp),%eax
    1dae:	8b 00                	mov    (%eax),%eax
    1db0:	8d 50 01             	lea    0x1(%eax),%edx
    1db3:	8b 45 08             	mov    0x8(%ebp),%eax
    1db6:	89 10                	mov    %edx,(%eax)
}
    1db8:	c9                   	leave  
    1db9:	c3                   	ret    

00001dba <empty_q>:

int empty_q(struct queue *q){
    1dba:	55                   	push   %ebp
    1dbb:	89 e5                	mov    %esp,%ebp
    if(q->size == 0)
    1dbd:	8b 45 08             	mov    0x8(%ebp),%eax
    1dc0:	8b 00                	mov    (%eax),%eax
    1dc2:	85 c0                	test   %eax,%eax
    1dc4:	75 07                	jne    1dcd <empty_q+0x13>
        return 1;
    1dc6:	b8 01 00 00 00       	mov    $0x1,%eax
    1dcb:	eb 05                	jmp    1dd2 <empty_q+0x18>
    else
        return 0;
    1dcd:	b8 00 00 00 00       	mov    $0x0,%eax
} 
    1dd2:	5d                   	pop    %ebp
    1dd3:	c3                   	ret    

00001dd4 <pop_q>:
int pop_q(struct queue *q){
    1dd4:	55                   	push   %ebp
    1dd5:	89 e5                	mov    %esp,%ebp
    1dd7:	83 ec 28             	sub    $0x28,%esp
    int val;
    struct node *destroy;
    if(!empty_q(q)){
    1dda:	8b 45 08             	mov    0x8(%ebp),%eax
    1ddd:	89 04 24             	mov    %eax,(%esp)
    1de0:	e8 d5 ff ff ff       	call   1dba <empty_q>
    1de5:	85 c0                	test   %eax,%eax
    1de7:	75 5d                	jne    1e46 <pop_q+0x72>
       val = q->head->value; 
    1de9:	8b 45 08             	mov    0x8(%ebp),%eax
    1dec:	8b 40 04             	mov    0x4(%eax),%eax
    1def:	8b 00                	mov    (%eax),%eax
    1df1:	89 45 f4             	mov    %eax,-0xc(%ebp)
       destroy = q->head;
    1df4:	8b 45 08             	mov    0x8(%ebp),%eax
    1df7:	8b 40 04             	mov    0x4(%eax),%eax
    1dfa:	89 45 f0             	mov    %eax,-0x10(%ebp)
       q->head = q->head->next;
    1dfd:	8b 45 08             	mov    0x8(%ebp),%eax
    1e00:	8b 40 04             	mov    0x4(%eax),%eax
    1e03:	8b 50 04             	mov    0x4(%eax),%edx
    1e06:	8b 45 08             	mov    0x8(%ebp),%eax
    1e09:	89 50 04             	mov    %edx,0x4(%eax)
       free(destroy);
    1e0c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1e0f:	89 04 24             	mov    %eax,(%esp)
    1e12:	e8 a9 fb ff ff       	call   19c0 <free>
       q->size--;
    1e17:	8b 45 08             	mov    0x8(%ebp),%eax
    1e1a:	8b 00                	mov    (%eax),%eax
    1e1c:	8d 50 ff             	lea    -0x1(%eax),%edx
    1e1f:	8b 45 08             	mov    0x8(%ebp),%eax
    1e22:	89 10                	mov    %edx,(%eax)
       if(q->size == 0){
    1e24:	8b 45 08             	mov    0x8(%ebp),%eax
    1e27:	8b 00                	mov    (%eax),%eax
    1e29:	85 c0                	test   %eax,%eax
    1e2b:	75 14                	jne    1e41 <pop_q+0x6d>
            q->head = 0;
    1e2d:	8b 45 08             	mov    0x8(%ebp),%eax
    1e30:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
            q->tail = 0;
    1e37:	8b 45 08             	mov    0x8(%ebp),%eax
    1e3a:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
       }
       return val;
    1e41:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1e44:	eb 05                	jmp    1e4b <pop_q+0x77>
    }
    return -1;
    1e46:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
    1e4b:	c9                   	leave  
    1e4c:	c3                   	ret    

00001e4d <dominant>:

void dominant(struct queue* q, int i){
    1e4d:	55                   	push   %ebp
    1e4e:	89 e5                	mov    %esp,%ebp
    1e50:	83 ec 28             	sub    $0x28,%esp
    struct node * n = malloc(sizeof(struct node));
    1e53:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
    1e5a:	e8 9a fc ff ff       	call   1af9 <malloc>
    1e5f:	89 45 f4             	mov    %eax,-0xc(%ebp)
    n->value = i;
    1e62:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1e65:	8b 55 0c             	mov    0xc(%ebp),%edx
    1e68:	89 10                	mov    %edx,(%eax)

    if(q->head == 0){
    1e6a:	8b 45 08             	mov    0x8(%ebp),%eax
    1e6d:	8b 40 04             	mov    0x4(%eax),%eax
    1e70:	85 c0                	test   %eax,%eax
    1e72:	75 14                	jne    1e88 <dominant+0x3b>
        q->head = n;
    1e74:	8b 45 08             	mov    0x8(%ebp),%eax
    1e77:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1e7a:	89 50 04             	mov    %edx,0x4(%eax)
        q->tail = n;
    1e7d:	8b 45 08             	mov    0x8(%ebp),%eax
    1e80:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1e83:	89 50 08             	mov    %edx,0x8(%eax)
    1e86:	eb 15                	jmp    1e9d <dominant+0x50>
    }
    else{
        n->next = q->head;
    1e88:	8b 45 08             	mov    0x8(%ebp),%eax
    1e8b:	8b 50 04             	mov    0x4(%eax),%edx
    1e8e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1e91:	89 50 04             	mov    %edx,0x4(%eax)
        q->head = n;
    1e94:	8b 45 08             	mov    0x8(%ebp),%eax
    1e97:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1e9a:	89 50 04             	mov    %edx,0x4(%eax)
    }
    q->size++;
    1e9d:	8b 45 08             	mov    0x8(%ebp),%eax
    1ea0:	8b 00                	mov    (%eax),%eax
    1ea2:	8d 50 01             	lea    0x1(%eax),%edx
    1ea5:	8b 45 08             	mov    0x8(%ebp),%eax
    1ea8:	89 10                	mov    %edx,(%eax)
}
    1eaa:	c9                   	leave  
    1eab:	c3                   	ret    

00001eac <sem_init>:
#include "semaphore.h"
#include "user.h"

// Initializes the semaphore
void sem_init(struct Semaphore* s, int value){
    1eac:	55                   	push   %ebp
    1ead:	89 e5                	mov    %esp,%ebp
    1eaf:	83 ec 18             	sub    $0x18,%esp
    s->val = value;
    1eb2:	8b 45 08             	mov    0x8(%ebp),%eax
    1eb5:	8b 55 0c             	mov    0xc(%ebp),%edx
    1eb8:	89 10                	mov    %edx,(%eax)
    lock_init(&s->lock);
    1eba:	8b 45 08             	mov    0x8(%ebp),%eax
    1ebd:	83 c0 04             	add    $0x4,%eax
    1ec0:	89 04 24             	mov    %eax,(%esp)
    1ec3:	e8 2e fd ff ff       	call   1bf6 <lock_init>
    init_q(&s->q);
    1ec8:	8b 45 08             	mov    0x8(%ebp),%eax
    1ecb:	83 c0 08             	add    $0x8,%eax
    1ece:	89 04 24             	mov    %eax,(%esp)
    1ed1:	e8 62 fe ff ff       	call   1d38 <init_q>
}
    1ed6:	c9                   	leave  
    1ed7:	c3                   	ret    

00001ed8 <sem_acquire>:

// Decrements the semaphore
void sem_acquire(struct Semaphore* s){
    1ed8:	55                   	push   %ebp
    1ed9:	89 e5                	mov    %esp,%ebp
    1edb:	83 ec 28             	sub    $0x28,%esp
    lock_acquire(&s->lock);
    1ede:	8b 45 08             	mov    0x8(%ebp),%eax
    1ee1:	83 c0 04             	add    $0x4,%eax
    1ee4:	89 04 24             	mov    %eax,(%esp)
    1ee7:	e8 18 fd ff ff       	call   1c04 <lock_acquire>

    if(s->val == 0){
    1eec:	8b 45 08             	mov    0x8(%ebp),%eax
    1eef:	8b 00                	mov    (%eax),%eax
    1ef1:	85 c0                	test   %eax,%eax
    1ef3:	75 32                	jne    1f27 <sem_acquire+0x4f>
        int pid;
        pid = getpid();
    1ef5:	e8 f2 f7 ff ff       	call   16ec <getpid>
    1efa:	89 45 f4             	mov    %eax,-0xc(%ebp)
        add_q(&s->q, pid);
    1efd:	8b 45 08             	mov    0x8(%ebp),%eax
    1f00:	8d 50 08             	lea    0x8(%eax),%edx
    1f03:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1f06:	89 44 24 04          	mov    %eax,0x4(%esp)
    1f0a:	89 14 24             	mov    %edx,(%esp)
    1f0d:	e8 48 fe ff ff       	call   1d5a <add_q>
        lock_release(&s->lock);
    1f12:	8b 45 08             	mov    0x8(%ebp),%eax
    1f15:	83 c0 04             	add    $0x4,%eax
    1f18:	89 04 24             	mov    %eax,(%esp)
    1f1b:	e8 04 fd ff ff       	call   1c24 <lock_release>
        tsleep();
    1f20:	e8 f7 f7 ff ff       	call   171c <tsleep>
    1f25:	eb 1b                	jmp    1f42 <sem_acquire+0x6a>
    }
    else{
        s->val--;
    1f27:	8b 45 08             	mov    0x8(%ebp),%eax
    1f2a:	8b 00                	mov    (%eax),%eax
    1f2c:	8d 50 ff             	lea    -0x1(%eax),%edx
    1f2f:	8b 45 08             	mov    0x8(%ebp),%eax
    1f32:	89 10                	mov    %edx,(%eax)
        lock_release(&s->lock);
    1f34:	8b 45 08             	mov    0x8(%ebp),%eax
    1f37:	83 c0 04             	add    $0x4,%eax
    1f3a:	89 04 24             	mov    %eax,(%esp)
    1f3d:	e8 e2 fc ff ff       	call   1c24 <lock_release>
    }
}
    1f42:	c9                   	leave  
    1f43:	c3                   	ret    

00001f44 <sem_signal>:

// Increments the semaphore
void sem_signal(struct Semaphore* s){
    1f44:	55                   	push   %ebp
    1f45:	89 e5                	mov    %esp,%ebp
    1f47:	83 ec 18             	sub    $0x18,%esp
    lock_acquire(&s->lock);
    1f4a:	8b 45 08             	mov    0x8(%ebp),%eax
    1f4d:	83 c0 04             	add    $0x4,%eax
    1f50:	89 04 24             	mov    %eax,(%esp)
    1f53:	e8 ac fc ff ff       	call   1c04 <lock_acquire>

    if(!empty_q(&s->q)){
    1f58:	8b 45 08             	mov    0x8(%ebp),%eax
    1f5b:	83 c0 08             	add    $0x8,%eax
    1f5e:	89 04 24             	mov    %eax,(%esp)
    1f61:	e8 54 fe ff ff       	call   1dba <empty_q>
    1f66:	85 c0                	test   %eax,%eax
    1f68:	75 18                	jne    1f82 <sem_signal+0x3e>
        twakeup(pop_q(&s->q));
    1f6a:	8b 45 08             	mov    0x8(%ebp),%eax
    1f6d:	83 c0 08             	add    $0x8,%eax
    1f70:	89 04 24             	mov    %eax,(%esp)
    1f73:	e8 5c fe ff ff       	call   1dd4 <pop_q>
    1f78:	89 04 24             	mov    %eax,(%esp)
    1f7b:	e8 a4 f7 ff ff       	call   1724 <twakeup>
    1f80:	eb 0d                	jmp    1f8f <sem_signal+0x4b>
    }
    else{
        s->val++;
    1f82:	8b 45 08             	mov    0x8(%ebp),%eax
    1f85:	8b 00                	mov    (%eax),%eax
    1f87:	8d 50 01             	lea    0x1(%eax),%edx
    1f8a:	8b 45 08             	mov    0x8(%ebp),%eax
    1f8d:	89 10                	mov    %edx,(%eax)
    }

    lock_release(&s->lock);
    1f8f:	8b 45 08             	mov    0x8(%ebp),%eax
    1f92:	83 c0 04             	add    $0x4,%eax
    1f95:	89 04 24             	mov    %eax,(%esp)
    1f98:	e8 87 fc ff ff       	call   1c24 <lock_release>
}
    1f9d:	c9                   	leave  
    1f9e:	c3                   	ret    

00001f9f <sem_dom_acquire>:

void sem_dom_acquire(struct Semaphore* s){
    1f9f:	55                   	push   %ebp
    1fa0:	89 e5                	mov    %esp,%ebp
    1fa2:	83 ec 18             	sub    $0x18,%esp
    lock_acquire(&s->lock);
    1fa5:	8b 45 08             	mov    0x8(%ebp),%eax
    1fa8:	83 c0 04             	add    $0x4,%eax
    1fab:	89 04 24             	mov    %eax,(%esp)
    1fae:	e8 51 fc ff ff       	call   1c04 <lock_acquire>

    if(s->val > 0){
    1fb3:	8b 45 08             	mov    0x8(%ebp),%eax
    1fb6:	8b 00                	mov    (%eax),%eax
    1fb8:	85 c0                	test   %eax,%eax
    1fba:	7e 1d                	jle    1fd9 <sem_dom_acquire+0x3a>
        s->val--;
    1fbc:	8b 45 08             	mov    0x8(%ebp),%eax
    1fbf:	8b 00                	mov    (%eax),%eax
    1fc1:	8d 50 ff             	lea    -0x1(%eax),%edx
    1fc4:	8b 45 08             	mov    0x8(%ebp),%eax
    1fc7:	89 10                	mov    %edx,(%eax)
        lock_release(&s->lock);
    1fc9:	8b 45 08             	mov    0x8(%ebp),%eax
    1fcc:	83 c0 04             	add    $0x4,%eax
    1fcf:	89 04 24             	mov    %eax,(%esp)
    1fd2:	e8 4d fc ff ff       	call   1c24 <lock_release>
        return;
    1fd7:	eb 2a                	jmp    2003 <sem_dom_acquire+0x64>
    }

    dominant(&s->q,getpid());
    1fd9:	e8 0e f7 ff ff       	call   16ec <getpid>
    1fde:	8b 55 08             	mov    0x8(%ebp),%edx
    1fe1:	83 c2 08             	add    $0x8,%edx
    1fe4:	89 44 24 04          	mov    %eax,0x4(%esp)
    1fe8:	89 14 24             	mov    %edx,(%esp)
    1feb:	e8 5d fe ff ff       	call   1e4d <dominant>
    lock_release(&s->lock);
    1ff0:	8b 45 08             	mov    0x8(%ebp),%eax
    1ff3:	83 c0 04             	add    $0x4,%eax
    1ff6:	89 04 24             	mov    %eax,(%esp)
    1ff9:	e8 26 fc ff ff       	call   1c24 <lock_release>
    tsleep();
    1ffe:	e8 19 f7 ff ff       	call   171c <tsleep>
}
    2003:	c9                   	leave  
    2004:	c3                   	ret    
