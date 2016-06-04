
_MissNCan:     file format elf32-i386


Disassembly of section .text:

00001000 <RowBoat>:
#define TEST_NUM 21

int num_Cannibals, Num_Missionary;
Semaphore mutex, cannibal, missionary, row;

void RowBoat() {
    1000:	55                   	push   %ebp
    1001:	89 e5                	mov    %esp,%ebp
    1003:	83 ec 18             	sub    $0x18,%esp
    printf(1, "Rowing!\n");
    1006:	c7 44 24 04 b4 21 00 	movl   $0x21b4,0x4(%esp)
    100d:	00 
    100e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1015:	e8 9e 09 00 00       	call   19b8 <printf>
}
    101a:	c9                   	leave  
    101b:	c3                   	ret    

0000101c <main>:

void MissionaryArrives(void *arg); 
void CannibalArrives(void *arg); 


int main() {
    101c:	55                   	push   %ebp
    101d:	89 e5                	mov    %esp,%ebp
    101f:	83 e4 f0             	and    $0xfffffff0,%esp
    1022:	83 ec 20             	sub    $0x20,%esp

    num_Cannibals = Num_Missionary = num_threads = 0;
    1025:	c7 05 10 27 00 00 00 	movl   $0x0,0x2710
    102c:	00 00 00 
    102f:	a1 10 27 00 00       	mov    0x2710,%eax
    1034:	a3 2c 27 00 00       	mov    %eax,0x272c
    1039:	a1 2c 27 00 00       	mov    0x272c,%eax
    103e:	a3 28 27 00 00       	mov    %eax,0x2728

    num_threads = 0;
    1043:	c7 05 10 27 00 00 00 	movl   $0x0,0x2710
    104a:	00 00 00 
    sem_init(&mutex, 1);
    104d:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
    1054:	00 
    1055:	c7 04 24 30 27 00 00 	movl   $0x2730,(%esp)
    105c:	e8 f7 0f 00 00       	call   2058 <sem_init>
    sem_init(&cannibal, 0);
    1061:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1068:	00 
    1069:	c7 04 24 14 27 00 00 	movl   $0x2714,(%esp)
    1070:	e8 e3 0f 00 00       	call   2058 <sem_init>
    sem_init(&missionary, 0);
    1075:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    107c:	00 
    107d:	c7 04 24 44 27 00 00 	movl   $0x2744,(%esp)
    1084:	e8 cf 0f 00 00       	call   2058 <sem_init>
    sem_init(&row, 0);
    1089:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1090:	00 
    1091:	c7 04 24 58 27 00 00 	movl   $0x2758,(%esp)
    1098:	e8 bb 0f 00 00       	call   2058 <sem_init>

    int i;
    int *tid;

    printf(1, "Testing with %d randomly generated canibals and missionaries\n", TEST_NUM);
    109d:	c7 44 24 08 15 00 00 	movl   $0x15,0x8(%esp)
    10a4:	00 
    10a5:	c7 44 24 04 c0 21 00 	movl   $0x21c0,0x4(%esp)
    10ac:	00 
    10ad:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    10b4:	e8 ff 08 00 00       	call   19b8 <printf>
    for (i = 0; i < TEST_NUM; i++) {
    10b9:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
    10c0:	00 
    10c1:	e9 e6 00 00 00       	jmp    11ac <main+0x190>
        if ((random(99999)/101) % 2) {
    10c6:	c7 04 24 9f 86 01 00 	movl   $0x1869f,(%esp)
    10cd:	e8 e6 0d 00 00       	call   1eb8 <random>
    10d2:	89 c1                	mov    %eax,%ecx
    10d4:	ba cb f0 8d 28       	mov    $0x288df0cb,%edx
    10d9:	89 c8                	mov    %ecx,%eax
    10db:	f7 ea                	imul   %edx
    10dd:	c1 fa 04             	sar    $0x4,%edx
    10e0:	89 c8                	mov    %ecx,%eax
    10e2:	c1 f8 1f             	sar    $0x1f,%eax
    10e5:	29 c2                	sub    %eax,%edx
    10e7:	89 d0                	mov    %edx,%eax
    10e9:	83 e0 01             	and    $0x1,%eax
    10ec:	85 c0                	test   %eax,%eax
    10ee:	74 5f                	je     114f <main+0x133>
            tid = thread_create(CannibalArrives, (void*)0);
    10f0:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    10f7:	00 
    10f8:	c7 04 24 48 12 00 00 	movl   $0x1248,(%esp)
    10ff:	e8 e7 0c 00 00       	call   1deb <thread_create>
    1104:	89 44 24 18          	mov    %eax,0x18(%esp)
            if (tid == 0) {
    1108:	83 7c 24 18 00       	cmpl   $0x0,0x18(%esp)
    110d:	75 19                	jne    1128 <main+0x10c>
                printf(1, "failed to create thread!\n");
    110f:	c7 44 24 04 fe 21 00 	movl   $0x21fe,0x4(%esp)
    1116:	00 
    1117:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    111e:	e8 95 08 00 00       	call   19b8 <printf>
                exit();
    1123:	e8 f0 06 00 00       	call   1818 <exit>
            }
            sem_acquire(&mutex);
    1128:	c7 04 24 30 27 00 00 	movl   $0x2730,(%esp)
    112f:	e8 50 0f 00 00       	call   2084 <sem_acquire>
            num_threads++;
    1134:	a1 10 27 00 00       	mov    0x2710,%eax
    1139:	83 c0 01             	add    $0x1,%eax
    113c:	a3 10 27 00 00       	mov    %eax,0x2710
            sem_signal(&mutex);
    1141:	c7 04 24 30 27 00 00 	movl   $0x2730,(%esp)
    1148:	e8 a3 0f 00 00       	call   20f0 <sem_signal>
    114d:	eb 58                	jmp    11a7 <main+0x18b>
        }
        else {
            tid = thread_create(MissionaryArrives, (void*)0);
    114f:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1156:	00 
    1157:	c7 04 24 f0 13 00 00 	movl   $0x13f0,(%esp)
    115e:	e8 88 0c 00 00       	call   1deb <thread_create>
    1163:	89 44 24 18          	mov    %eax,0x18(%esp)
            if (tid == 0) {
    1167:	83 7c 24 18 00       	cmpl   $0x0,0x18(%esp)
    116c:	75 14                	jne    1182 <main+0x166>
                printf(1, "failed to create thread!\n");
    116e:	c7 44 24 04 fe 21 00 	movl   $0x21fe,0x4(%esp)
    1175:	00 
    1176:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    117d:	e8 36 08 00 00       	call   19b8 <printf>
            }
            sem_acquire(&mutex);
    1182:	c7 04 24 30 27 00 00 	movl   $0x2730,(%esp)
    1189:	e8 f6 0e 00 00       	call   2084 <sem_acquire>
            num_threads++;
    118e:	a1 10 27 00 00       	mov    0x2710,%eax
    1193:	83 c0 01             	add    $0x1,%eax
    1196:	a3 10 27 00 00       	mov    %eax,0x2710
            sem_signal(&mutex);
    119b:	c7 04 24 30 27 00 00 	movl   $0x2730,(%esp)
    11a2:	e8 49 0f 00 00       	call   20f0 <sem_signal>

    int i;
    int *tid;

    printf(1, "Testing with %d randomly generated canibals and missionaries\n", TEST_NUM);
    for (i = 0; i < TEST_NUM; i++) {
    11a7:	83 44 24 1c 01       	addl   $0x1,0x1c(%esp)
    11ac:	83 7c 24 1c 14       	cmpl   $0x14,0x1c(%esp)
    11b1:	0f 8e 0f ff ff ff    	jle    10c6 <main+0xaa>
            sem_acquire(&mutex);
            num_threads++;
            sem_signal(&mutex);
        }
    }
    for (i = 0; i < 3; i++){
    11b7:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
    11be:	00 
    11bf:	eb 5d                	jmp    121e <main+0x202>
        tid = thread_create(MissionaryArrives, (void*)0);
    11c1:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    11c8:	00 
    11c9:	c7 04 24 f0 13 00 00 	movl   $0x13f0,(%esp)
    11d0:	e8 16 0c 00 00       	call   1deb <thread_create>
    11d5:	89 44 24 18          	mov    %eax,0x18(%esp)
        if (tid == 0) {
    11d9:	83 7c 24 18 00       	cmpl   $0x0,0x18(%esp)
    11de:	75 14                	jne    11f4 <main+0x1d8>
            printf(1, "failed to create thread!\n");
    11e0:	c7 44 24 04 fe 21 00 	movl   $0x21fe,0x4(%esp)
    11e7:	00 
    11e8:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    11ef:	e8 c4 07 00 00       	call   19b8 <printf>
        }
        sem_acquire(&mutex);
    11f4:	c7 04 24 30 27 00 00 	movl   $0x2730,(%esp)
    11fb:	e8 84 0e 00 00       	call   2084 <sem_acquire>
        num_threads++;
    1200:	a1 10 27 00 00       	mov    0x2710,%eax
    1205:	83 c0 01             	add    $0x1,%eax
    1208:	a3 10 27 00 00       	mov    %eax,0x2710
        sem_signal(&mutex);
    120d:	c7 04 24 30 27 00 00 	movl   $0x2730,(%esp)
    1214:	e8 d7 0e 00 00       	call   20f0 <sem_signal>
            sem_acquire(&mutex);
            num_threads++;
            sem_signal(&mutex);
        }
    }
    for (i = 0; i < 3; i++){
    1219:	83 44 24 1c 01       	addl   $0x1,0x1c(%esp)
    121e:	83 7c 24 1c 02       	cmpl   $0x2,0x1c(%esp)
    1223:	7e 9c                	jle    11c1 <main+0x1a5>
        sem_acquire(&mutex);
        num_threads++;
        sem_signal(&mutex);
    }

    printf(1, "exiting!\n");
    1225:	c7 44 24 04 18 22 00 	movl   $0x2218,0x4(%esp)
    122c:	00 
    122d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1234:	e8 7f 07 00 00       	call   19b8 <printf>
    while(wait()>0);
    1239:	90                   	nop
    123a:	e8 e1 05 00 00       	call   1820 <wait>
    123f:	85 c0                	test   %eax,%eax
    1241:	7f f7                	jg     123a <main+0x21e>
    exit();
    1243:	e8 d0 05 00 00       	call   1818 <exit>

00001248 <CannibalArrives>:
}
void CannibalArrives(void *arg) {
    1248:	55                   	push   %ebp
    1249:	89 e5                	mov    %esp,%ebp
    124b:	83 ec 18             	sub    $0x18,%esp
    sem_acquire(&mutex);
    124e:	c7 04 24 30 27 00 00 	movl   $0x2730,(%esp)
    1255:	e8 2a 0e 00 00       	call   2084 <sem_acquire>
    if (num_Cannibals >= 2) {
    125a:	a1 28 27 00 00       	mov    0x2728,%eax
    125f:	83 f8 01             	cmp    $0x1,%eax
    1262:	7e 36                	jle    129a <CannibalArrives+0x52>
        num_Cannibals -= 2;
    1264:	a1 28 27 00 00       	mov    0x2728,%eax
    1269:	83 e8 02             	sub    $0x2,%eax
    126c:	a3 28 27 00 00       	mov    %eax,0x2728
        sem_signal(&mutex);
    1271:	c7 04 24 30 27 00 00 	movl   $0x2730,(%esp)
    1278:	e8 73 0e 00 00       	call   20f0 <sem_signal>
        sem_signal(&cannibal);
    127d:	c7 04 24 14 27 00 00 	movl   $0x2714,(%esp)
    1284:	e8 67 0e 00 00       	call   20f0 <sem_signal>
        sem_signal(&cannibal);
    1289:	c7 04 24 14 27 00 00 	movl   $0x2714,(%esp)
    1290:	e8 5b 0e 00 00       	call   20f0 <sem_signal>
    1295:	e9 d5 00 00 00       	jmp    136f <CannibalArrives+0x127>
    }
    else if (Num_Missionary >= 2) {
    129a:	a1 2c 27 00 00       	mov    0x272c,%eax
    129f:	83 f8 01             	cmp    $0x1,%eax
    12a2:	7e 36                	jle    12da <CannibalArrives+0x92>
        Num_Missionary -= 2;
    12a4:	a1 2c 27 00 00       	mov    0x272c,%eax
    12a9:	83 e8 02             	sub    $0x2,%eax
    12ac:	a3 2c 27 00 00       	mov    %eax,0x272c
        sem_signal(&mutex);
    12b1:	c7 04 24 30 27 00 00 	movl   $0x2730,(%esp)
    12b8:	e8 33 0e 00 00       	call   20f0 <sem_signal>
        sem_signal(&missionary);
    12bd:	c7 04 24 44 27 00 00 	movl   $0x2744,(%esp)
    12c4:	e8 27 0e 00 00       	call   20f0 <sem_signal>
        sem_signal(&missionary);
    12c9:	c7 04 24 44 27 00 00 	movl   $0x2744,(%esp)
    12d0:	e8 1b 0e 00 00       	call   20f0 <sem_signal>
    12d5:	e9 95 00 00 00       	jmp    136f <CannibalArrives+0x127>
    }
    else {
        num_Cannibals++;
    12da:	a1 28 27 00 00       	mov    0x2728,%eax
    12df:	83 c0 01             	add    $0x1,%eax
    12e2:	a3 28 27 00 00       	mov    %eax,0x2728
        sem_signal(&mutex);
    12e7:	c7 04 24 30 27 00 00 	movl   $0x2730,(%esp)
    12ee:	e8 fd 0d 00 00       	call   20f0 <sem_signal>
        sem_acquire(&cannibal);
    12f3:	c7 04 24 14 27 00 00 	movl   $0x2714,(%esp)
    12fa:	e8 85 0d 00 00       	call   2084 <sem_acquire>
        sem_acquire(&row);
    12ff:	c7 04 24 58 27 00 00 	movl   $0x2758,(%esp)
    1306:	e8 79 0d 00 00       	call   2084 <sem_acquire>
        sem_acquire(&mutex);
    130b:	c7 04 24 30 27 00 00 	movl   $0x2730,(%esp)
    1312:	e8 6d 0d 00 00       	call   2084 <sem_acquire>
        printf(1, "before: %d", num_threads);
    1317:	a1 10 27 00 00       	mov    0x2710,%eax
    131c:	89 44 24 08          	mov    %eax,0x8(%esp)
    1320:	c7 44 24 04 22 22 00 	movl   $0x2222,0x4(%esp)
    1327:	00 
    1328:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    132f:	e8 84 06 00 00       	call   19b8 <printf>
        num_threads--;
    1334:	a1 10 27 00 00       	mov    0x2710,%eax
    1339:	83 e8 01             	sub    $0x1,%eax
    133c:	a3 10 27 00 00       	mov    %eax,0x2710
        printf(1, "  after: %d\n", num_threads);
    1341:	a1 10 27 00 00       	mov    0x2710,%eax
    1346:	89 44 24 08          	mov    %eax,0x8(%esp)
    134a:	c7 44 24 04 2d 22 00 	movl   $0x222d,0x4(%esp)
    1351:	00 
    1352:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1359:	e8 5a 06 00 00       	call   19b8 <printf>
        sem_signal(&mutex);
    135e:	c7 04 24 30 27 00 00 	movl   $0x2730,(%esp)
    1365:	e8 86 0d 00 00       	call   20f0 <sem_signal>
        texit();
    136a:	e8 51 05 00 00       	call   18c0 <texit>
    }
    RowBoat();
    136f:	e8 8c fc ff ff       	call   1000 <RowBoat>
    sem_signal(&row);
    1374:	c7 04 24 58 27 00 00 	movl   $0x2758,(%esp)
    137b:	e8 70 0d 00 00       	call   20f0 <sem_signal>
    sem_signal(&row);
    1380:	c7 04 24 58 27 00 00 	movl   $0x2758,(%esp)
    1387:	e8 64 0d 00 00       	call   20f0 <sem_signal>
    sem_acquire(&mutex);
    138c:	c7 04 24 30 27 00 00 	movl   $0x2730,(%esp)
    1393:	e8 ec 0c 00 00       	call   2084 <sem_acquire>
    printf(1, "before: %d", num_threads);
    1398:	a1 10 27 00 00       	mov    0x2710,%eax
    139d:	89 44 24 08          	mov    %eax,0x8(%esp)
    13a1:	c7 44 24 04 22 22 00 	movl   $0x2222,0x4(%esp)
    13a8:	00 
    13a9:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    13b0:	e8 03 06 00 00       	call   19b8 <printf>
    num_threads--;
    13b5:	a1 10 27 00 00       	mov    0x2710,%eax
    13ba:	83 e8 01             	sub    $0x1,%eax
    13bd:	a3 10 27 00 00       	mov    %eax,0x2710
    printf(1, "  after: %d\n", num_threads);
    13c2:	a1 10 27 00 00       	mov    0x2710,%eax
    13c7:	89 44 24 08          	mov    %eax,0x8(%esp)
    13cb:	c7 44 24 04 2d 22 00 	movl   $0x222d,0x4(%esp)
    13d2:	00 
    13d3:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    13da:	e8 d9 05 00 00       	call   19b8 <printf>
    sem_signal(&mutex);
    13df:	c7 04 24 30 27 00 00 	movl   $0x2730,(%esp)
    13e6:	e8 05 0d 00 00       	call   20f0 <sem_signal>
    texit();
    13eb:	e8 d0 04 00 00       	call   18c0 <texit>

000013f0 <MissionaryArrives>:
}


void MissionaryArrives(void *arg) {
    13f0:	55                   	push   %ebp
    13f1:	89 e5                	mov    %esp,%ebp
    13f3:	83 ec 18             	sub    $0x18,%esp
    sem_acquire(&mutex);
    13f6:	c7 04 24 30 27 00 00 	movl   $0x2730,(%esp)
    13fd:	e8 82 0c 00 00       	call   2084 <sem_acquire>
    if (Num_Missionary >= 2) {
    1402:	a1 2c 27 00 00       	mov    0x272c,%eax
    1407:	83 f8 01             	cmp    $0x1,%eax
    140a:	7e 36                	jle    1442 <MissionaryArrives+0x52>
        Num_Missionary -= 2;
    140c:	a1 2c 27 00 00       	mov    0x272c,%eax
    1411:	83 e8 02             	sub    $0x2,%eax
    1414:	a3 2c 27 00 00       	mov    %eax,0x272c
        sem_signal(&mutex);
    1419:	c7 04 24 30 27 00 00 	movl   $0x2730,(%esp)
    1420:	e8 cb 0c 00 00       	call   20f0 <sem_signal>
        sem_signal(&missionary);
    1425:	c7 04 24 44 27 00 00 	movl   $0x2744,(%esp)
    142c:	e8 bf 0c 00 00       	call   20f0 <sem_signal>
        sem_signal(&missionary);
    1431:	c7 04 24 44 27 00 00 	movl   $0x2744,(%esp)
    1438:	e8 b3 0c 00 00       	call   20f0 <sem_signal>
    143d:	e9 ea 00 00 00       	jmp    152c <MissionaryArrives+0x13c>
    }
    else if (Num_Missionary >= 1 && num_Cannibals >= 1) {
    1442:	a1 2c 27 00 00       	mov    0x272c,%eax
    1447:	85 c0                	test   %eax,%eax
    1449:	7e 4c                	jle    1497 <MissionaryArrives+0xa7>
    144b:	a1 28 27 00 00       	mov    0x2728,%eax
    1450:	85 c0                	test   %eax,%eax
    1452:	7e 43                	jle    1497 <MissionaryArrives+0xa7>
        Num_Missionary--;;
    1454:	a1 2c 27 00 00       	mov    0x272c,%eax
    1459:	83 e8 01             	sub    $0x1,%eax
    145c:	a3 2c 27 00 00       	mov    %eax,0x272c
        num_Cannibals--;
    1461:	a1 28 27 00 00       	mov    0x2728,%eax
    1466:	83 e8 01             	sub    $0x1,%eax
    1469:	a3 28 27 00 00       	mov    %eax,0x2728
        sem_signal(&mutex);
    146e:	c7 04 24 30 27 00 00 	movl   $0x2730,(%esp)
    1475:	e8 76 0c 00 00       	call   20f0 <sem_signal>
        sem_signal(&missionary);
    147a:	c7 04 24 44 27 00 00 	movl   $0x2744,(%esp)
    1481:	e8 6a 0c 00 00       	call   20f0 <sem_signal>
        sem_signal(&cannibal);
    1486:	c7 04 24 14 27 00 00 	movl   $0x2714,(%esp)
    148d:	e8 5e 0c 00 00       	call   20f0 <sem_signal>
    1492:	e9 95 00 00 00       	jmp    152c <MissionaryArrives+0x13c>
    }
    else {
        Num_Missionary++;
    1497:	a1 2c 27 00 00       	mov    0x272c,%eax
    149c:	83 c0 01             	add    $0x1,%eax
    149f:	a3 2c 27 00 00       	mov    %eax,0x272c
        sem_signal(&mutex);
    14a4:	c7 04 24 30 27 00 00 	movl   $0x2730,(%esp)
    14ab:	e8 40 0c 00 00       	call   20f0 <sem_signal>
        sem_acquire(&missionary);
    14b0:	c7 04 24 44 27 00 00 	movl   $0x2744,(%esp)
    14b7:	e8 c8 0b 00 00       	call   2084 <sem_acquire>
        sem_acquire(&row);
    14bc:	c7 04 24 58 27 00 00 	movl   $0x2758,(%esp)
    14c3:	e8 bc 0b 00 00       	call   2084 <sem_acquire>
        sem_acquire(&mutex);
    14c8:	c7 04 24 30 27 00 00 	movl   $0x2730,(%esp)
    14cf:	e8 b0 0b 00 00       	call   2084 <sem_acquire>
        printf(1, "before: %d", num_threads);
    14d4:	a1 10 27 00 00       	mov    0x2710,%eax
    14d9:	89 44 24 08          	mov    %eax,0x8(%esp)
    14dd:	c7 44 24 04 22 22 00 	movl   $0x2222,0x4(%esp)
    14e4:	00 
    14e5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    14ec:	e8 c7 04 00 00       	call   19b8 <printf>
        num_threads--;
    14f1:	a1 10 27 00 00       	mov    0x2710,%eax
    14f6:	83 e8 01             	sub    $0x1,%eax
    14f9:	a3 10 27 00 00       	mov    %eax,0x2710
        printf(1, "  after: %d\n", num_threads);
    14fe:	a1 10 27 00 00       	mov    0x2710,%eax
    1503:	89 44 24 08          	mov    %eax,0x8(%esp)
    1507:	c7 44 24 04 2d 22 00 	movl   $0x222d,0x4(%esp)
    150e:	00 
    150f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1516:	e8 9d 04 00 00       	call   19b8 <printf>
        sem_signal(&mutex);
    151b:	c7 04 24 30 27 00 00 	movl   $0x2730,(%esp)
    1522:	e8 c9 0b 00 00       	call   20f0 <sem_signal>
        texit();
    1527:	e8 94 03 00 00       	call   18c0 <texit>
    }
    RowBoat();
    152c:	e8 cf fa ff ff       	call   1000 <RowBoat>
    sem_signal(&row);
    1531:	c7 04 24 58 27 00 00 	movl   $0x2758,(%esp)
    1538:	e8 b3 0b 00 00       	call   20f0 <sem_signal>
    sem_signal(&row);
    153d:	c7 04 24 58 27 00 00 	movl   $0x2758,(%esp)
    1544:	e8 a7 0b 00 00       	call   20f0 <sem_signal>
    sem_acquire(&mutex);
    1549:	c7 04 24 30 27 00 00 	movl   $0x2730,(%esp)
    1550:	e8 2f 0b 00 00       	call   2084 <sem_acquire>
    printf(1, "before: %d", num_threads);
    1555:	a1 10 27 00 00       	mov    0x2710,%eax
    155a:	89 44 24 08          	mov    %eax,0x8(%esp)
    155e:	c7 44 24 04 22 22 00 	movl   $0x2222,0x4(%esp)
    1565:	00 
    1566:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    156d:	e8 46 04 00 00       	call   19b8 <printf>
    num_threads--;
    1572:	a1 10 27 00 00       	mov    0x2710,%eax
    1577:	83 e8 01             	sub    $0x1,%eax
    157a:	a3 10 27 00 00       	mov    %eax,0x2710
    printf(1, "  after: %d\n", num_threads);
    157f:	a1 10 27 00 00       	mov    0x2710,%eax
    1584:	89 44 24 08          	mov    %eax,0x8(%esp)
    1588:	c7 44 24 04 2d 22 00 	movl   $0x222d,0x4(%esp)
    158f:	00 
    1590:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1597:	e8 1c 04 00 00       	call   19b8 <printf>
    sem_signal(&mutex);
    159c:	c7 04 24 30 27 00 00 	movl   $0x2730,(%esp)
    15a3:	e8 48 0b 00 00       	call   20f0 <sem_signal>
    texit();
    15a8:	e8 13 03 00 00       	call   18c0 <texit>
    15ad:	66 90                	xchg   %ax,%ax
    15af:	90                   	nop

000015b0 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
    15b0:	55                   	push   %ebp
    15b1:	89 e5                	mov    %esp,%ebp
    15b3:	57                   	push   %edi
    15b4:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
    15b5:	8b 4d 08             	mov    0x8(%ebp),%ecx
    15b8:	8b 55 10             	mov    0x10(%ebp),%edx
    15bb:	8b 45 0c             	mov    0xc(%ebp),%eax
    15be:	89 cb                	mov    %ecx,%ebx
    15c0:	89 df                	mov    %ebx,%edi
    15c2:	89 d1                	mov    %edx,%ecx
    15c4:	fc                   	cld    
    15c5:	f3 aa                	rep stos %al,%es:(%edi)
    15c7:	89 ca                	mov    %ecx,%edx
    15c9:	89 fb                	mov    %edi,%ebx
    15cb:	89 5d 08             	mov    %ebx,0x8(%ebp)
    15ce:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
    15d1:	5b                   	pop    %ebx
    15d2:	5f                   	pop    %edi
    15d3:	5d                   	pop    %ebp
    15d4:	c3                   	ret    

000015d5 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
    15d5:	55                   	push   %ebp
    15d6:	89 e5                	mov    %esp,%ebp
    15d8:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
    15db:	8b 45 08             	mov    0x8(%ebp),%eax
    15de:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
    15e1:	90                   	nop
    15e2:	8b 45 08             	mov    0x8(%ebp),%eax
    15e5:	8d 50 01             	lea    0x1(%eax),%edx
    15e8:	89 55 08             	mov    %edx,0x8(%ebp)
    15eb:	8b 55 0c             	mov    0xc(%ebp),%edx
    15ee:	8d 4a 01             	lea    0x1(%edx),%ecx
    15f1:	89 4d 0c             	mov    %ecx,0xc(%ebp)
    15f4:	0f b6 12             	movzbl (%edx),%edx
    15f7:	88 10                	mov    %dl,(%eax)
    15f9:	0f b6 00             	movzbl (%eax),%eax
    15fc:	84 c0                	test   %al,%al
    15fe:	75 e2                	jne    15e2 <strcpy+0xd>
    ;
  return os;
    1600:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    1603:	c9                   	leave  
    1604:	c3                   	ret    

00001605 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    1605:	55                   	push   %ebp
    1606:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
    1608:	eb 08                	jmp    1612 <strcmp+0xd>
    p++, q++;
    160a:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    160e:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    1612:	8b 45 08             	mov    0x8(%ebp),%eax
    1615:	0f b6 00             	movzbl (%eax),%eax
    1618:	84 c0                	test   %al,%al
    161a:	74 10                	je     162c <strcmp+0x27>
    161c:	8b 45 08             	mov    0x8(%ebp),%eax
    161f:	0f b6 10             	movzbl (%eax),%edx
    1622:	8b 45 0c             	mov    0xc(%ebp),%eax
    1625:	0f b6 00             	movzbl (%eax),%eax
    1628:	38 c2                	cmp    %al,%dl
    162a:	74 de                	je     160a <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
    162c:	8b 45 08             	mov    0x8(%ebp),%eax
    162f:	0f b6 00             	movzbl (%eax),%eax
    1632:	0f b6 d0             	movzbl %al,%edx
    1635:	8b 45 0c             	mov    0xc(%ebp),%eax
    1638:	0f b6 00             	movzbl (%eax),%eax
    163b:	0f b6 c0             	movzbl %al,%eax
    163e:	29 c2                	sub    %eax,%edx
    1640:	89 d0                	mov    %edx,%eax
}
    1642:	5d                   	pop    %ebp
    1643:	c3                   	ret    

00001644 <strlen>:

uint
strlen(char *s)
{
    1644:	55                   	push   %ebp
    1645:	89 e5                	mov    %esp,%ebp
    1647:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
    164a:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    1651:	eb 04                	jmp    1657 <strlen+0x13>
    1653:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    1657:	8b 55 fc             	mov    -0x4(%ebp),%edx
    165a:	8b 45 08             	mov    0x8(%ebp),%eax
    165d:	01 d0                	add    %edx,%eax
    165f:	0f b6 00             	movzbl (%eax),%eax
    1662:	84 c0                	test   %al,%al
    1664:	75 ed                	jne    1653 <strlen+0xf>
    ;
  return n;
    1666:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    1669:	c9                   	leave  
    166a:	c3                   	ret    

0000166b <memset>:

void*
memset(void *dst, int c, uint n)
{
    166b:	55                   	push   %ebp
    166c:	89 e5                	mov    %esp,%ebp
    166e:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
    1671:	8b 45 10             	mov    0x10(%ebp),%eax
    1674:	89 44 24 08          	mov    %eax,0x8(%esp)
    1678:	8b 45 0c             	mov    0xc(%ebp),%eax
    167b:	89 44 24 04          	mov    %eax,0x4(%esp)
    167f:	8b 45 08             	mov    0x8(%ebp),%eax
    1682:	89 04 24             	mov    %eax,(%esp)
    1685:	e8 26 ff ff ff       	call   15b0 <stosb>
  return dst;
    168a:	8b 45 08             	mov    0x8(%ebp),%eax
}
    168d:	c9                   	leave  
    168e:	c3                   	ret    

0000168f <strchr>:

char*
strchr(const char *s, char c)
{
    168f:	55                   	push   %ebp
    1690:	89 e5                	mov    %esp,%ebp
    1692:	83 ec 04             	sub    $0x4,%esp
    1695:	8b 45 0c             	mov    0xc(%ebp),%eax
    1698:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
    169b:	eb 14                	jmp    16b1 <strchr+0x22>
    if(*s == c)
    169d:	8b 45 08             	mov    0x8(%ebp),%eax
    16a0:	0f b6 00             	movzbl (%eax),%eax
    16a3:	3a 45 fc             	cmp    -0x4(%ebp),%al
    16a6:	75 05                	jne    16ad <strchr+0x1e>
      return (char*)s;
    16a8:	8b 45 08             	mov    0x8(%ebp),%eax
    16ab:	eb 13                	jmp    16c0 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
    16ad:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    16b1:	8b 45 08             	mov    0x8(%ebp),%eax
    16b4:	0f b6 00             	movzbl (%eax),%eax
    16b7:	84 c0                	test   %al,%al
    16b9:	75 e2                	jne    169d <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
    16bb:	b8 00 00 00 00       	mov    $0x0,%eax
}
    16c0:	c9                   	leave  
    16c1:	c3                   	ret    

000016c2 <gets>:

char*
gets(char *buf, int max)
{
    16c2:	55                   	push   %ebp
    16c3:	89 e5                	mov    %esp,%ebp
    16c5:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    16c8:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    16cf:	eb 4c                	jmp    171d <gets+0x5b>
    cc = read(0, &c, 1);
    16d1:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    16d8:	00 
    16d9:	8d 45 ef             	lea    -0x11(%ebp),%eax
    16dc:	89 44 24 04          	mov    %eax,0x4(%esp)
    16e0:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    16e7:	e8 44 01 00 00       	call   1830 <read>
    16ec:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
    16ef:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    16f3:	7f 02                	jg     16f7 <gets+0x35>
      break;
    16f5:	eb 31                	jmp    1728 <gets+0x66>
    buf[i++] = c;
    16f7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    16fa:	8d 50 01             	lea    0x1(%eax),%edx
    16fd:	89 55 f4             	mov    %edx,-0xc(%ebp)
    1700:	89 c2                	mov    %eax,%edx
    1702:	8b 45 08             	mov    0x8(%ebp),%eax
    1705:	01 c2                	add    %eax,%edx
    1707:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    170b:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
    170d:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    1711:	3c 0a                	cmp    $0xa,%al
    1713:	74 13                	je     1728 <gets+0x66>
    1715:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    1719:	3c 0d                	cmp    $0xd,%al
    171b:	74 0b                	je     1728 <gets+0x66>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    171d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1720:	83 c0 01             	add    $0x1,%eax
    1723:	3b 45 0c             	cmp    0xc(%ebp),%eax
    1726:	7c a9                	jl     16d1 <gets+0xf>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    1728:	8b 55 f4             	mov    -0xc(%ebp),%edx
    172b:	8b 45 08             	mov    0x8(%ebp),%eax
    172e:	01 d0                	add    %edx,%eax
    1730:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
    1733:	8b 45 08             	mov    0x8(%ebp),%eax
}
    1736:	c9                   	leave  
    1737:	c3                   	ret    

00001738 <stat>:

int
stat(char *n, struct stat *st)
{
    1738:	55                   	push   %ebp
    1739:	89 e5                	mov    %esp,%ebp
    173b:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    173e:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1745:	00 
    1746:	8b 45 08             	mov    0x8(%ebp),%eax
    1749:	89 04 24             	mov    %eax,(%esp)
    174c:	e8 07 01 00 00       	call   1858 <open>
    1751:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
    1754:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1758:	79 07                	jns    1761 <stat+0x29>
    return -1;
    175a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    175f:	eb 23                	jmp    1784 <stat+0x4c>
  r = fstat(fd, st);
    1761:	8b 45 0c             	mov    0xc(%ebp),%eax
    1764:	89 44 24 04          	mov    %eax,0x4(%esp)
    1768:	8b 45 f4             	mov    -0xc(%ebp),%eax
    176b:	89 04 24             	mov    %eax,(%esp)
    176e:	e8 fd 00 00 00       	call   1870 <fstat>
    1773:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
    1776:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1779:	89 04 24             	mov    %eax,(%esp)
    177c:	e8 bf 00 00 00       	call   1840 <close>
  return r;
    1781:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
    1784:	c9                   	leave  
    1785:	c3                   	ret    

00001786 <atoi>:

int
atoi(const char *s)
{
    1786:	55                   	push   %ebp
    1787:	89 e5                	mov    %esp,%ebp
    1789:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
    178c:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
    1793:	eb 25                	jmp    17ba <atoi+0x34>
    n = n*10 + *s++ - '0';
    1795:	8b 55 fc             	mov    -0x4(%ebp),%edx
    1798:	89 d0                	mov    %edx,%eax
    179a:	c1 e0 02             	shl    $0x2,%eax
    179d:	01 d0                	add    %edx,%eax
    179f:	01 c0                	add    %eax,%eax
    17a1:	89 c1                	mov    %eax,%ecx
    17a3:	8b 45 08             	mov    0x8(%ebp),%eax
    17a6:	8d 50 01             	lea    0x1(%eax),%edx
    17a9:	89 55 08             	mov    %edx,0x8(%ebp)
    17ac:	0f b6 00             	movzbl (%eax),%eax
    17af:	0f be c0             	movsbl %al,%eax
    17b2:	01 c8                	add    %ecx,%eax
    17b4:	83 e8 30             	sub    $0x30,%eax
    17b7:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    17ba:	8b 45 08             	mov    0x8(%ebp),%eax
    17bd:	0f b6 00             	movzbl (%eax),%eax
    17c0:	3c 2f                	cmp    $0x2f,%al
    17c2:	7e 0a                	jle    17ce <atoi+0x48>
    17c4:	8b 45 08             	mov    0x8(%ebp),%eax
    17c7:	0f b6 00             	movzbl (%eax),%eax
    17ca:	3c 39                	cmp    $0x39,%al
    17cc:	7e c7                	jle    1795 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
    17ce:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    17d1:	c9                   	leave  
    17d2:	c3                   	ret    

000017d3 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    17d3:	55                   	push   %ebp
    17d4:	89 e5                	mov    %esp,%ebp
    17d6:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
    17d9:	8b 45 08             	mov    0x8(%ebp),%eax
    17dc:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
    17df:	8b 45 0c             	mov    0xc(%ebp),%eax
    17e2:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
    17e5:	eb 17                	jmp    17fe <memmove+0x2b>
    *dst++ = *src++;
    17e7:	8b 45 fc             	mov    -0x4(%ebp),%eax
    17ea:	8d 50 01             	lea    0x1(%eax),%edx
    17ed:	89 55 fc             	mov    %edx,-0x4(%ebp)
    17f0:	8b 55 f8             	mov    -0x8(%ebp),%edx
    17f3:	8d 4a 01             	lea    0x1(%edx),%ecx
    17f6:	89 4d f8             	mov    %ecx,-0x8(%ebp)
    17f9:	0f b6 12             	movzbl (%edx),%edx
    17fc:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    17fe:	8b 45 10             	mov    0x10(%ebp),%eax
    1801:	8d 50 ff             	lea    -0x1(%eax),%edx
    1804:	89 55 10             	mov    %edx,0x10(%ebp)
    1807:	85 c0                	test   %eax,%eax
    1809:	7f dc                	jg     17e7 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
    180b:	8b 45 08             	mov    0x8(%ebp),%eax
}
    180e:	c9                   	leave  
    180f:	c3                   	ret    

00001810 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    1810:	b8 01 00 00 00       	mov    $0x1,%eax
    1815:	cd 40                	int    $0x40
    1817:	c3                   	ret    

00001818 <exit>:
SYSCALL(exit)
    1818:	b8 02 00 00 00       	mov    $0x2,%eax
    181d:	cd 40                	int    $0x40
    181f:	c3                   	ret    

00001820 <wait>:
SYSCALL(wait)
    1820:	b8 03 00 00 00       	mov    $0x3,%eax
    1825:	cd 40                	int    $0x40
    1827:	c3                   	ret    

00001828 <pipe>:
SYSCALL(pipe)
    1828:	b8 04 00 00 00       	mov    $0x4,%eax
    182d:	cd 40                	int    $0x40
    182f:	c3                   	ret    

00001830 <read>:
SYSCALL(read)
    1830:	b8 05 00 00 00       	mov    $0x5,%eax
    1835:	cd 40                	int    $0x40
    1837:	c3                   	ret    

00001838 <write>:
SYSCALL(write)
    1838:	b8 10 00 00 00       	mov    $0x10,%eax
    183d:	cd 40                	int    $0x40
    183f:	c3                   	ret    

00001840 <close>:
SYSCALL(close)
    1840:	b8 15 00 00 00       	mov    $0x15,%eax
    1845:	cd 40                	int    $0x40
    1847:	c3                   	ret    

00001848 <kill>:
SYSCALL(kill)
    1848:	b8 06 00 00 00       	mov    $0x6,%eax
    184d:	cd 40                	int    $0x40
    184f:	c3                   	ret    

00001850 <exec>:
SYSCALL(exec)
    1850:	b8 07 00 00 00       	mov    $0x7,%eax
    1855:	cd 40                	int    $0x40
    1857:	c3                   	ret    

00001858 <open>:
SYSCALL(open)
    1858:	b8 0f 00 00 00       	mov    $0xf,%eax
    185d:	cd 40                	int    $0x40
    185f:	c3                   	ret    

00001860 <mknod>:
SYSCALL(mknod)
    1860:	b8 11 00 00 00       	mov    $0x11,%eax
    1865:	cd 40                	int    $0x40
    1867:	c3                   	ret    

00001868 <unlink>:
SYSCALL(unlink)
    1868:	b8 12 00 00 00       	mov    $0x12,%eax
    186d:	cd 40                	int    $0x40
    186f:	c3                   	ret    

00001870 <fstat>:
SYSCALL(fstat)
    1870:	b8 08 00 00 00       	mov    $0x8,%eax
    1875:	cd 40                	int    $0x40
    1877:	c3                   	ret    

00001878 <link>:
SYSCALL(link)
    1878:	b8 13 00 00 00       	mov    $0x13,%eax
    187d:	cd 40                	int    $0x40
    187f:	c3                   	ret    

00001880 <mkdir>:
SYSCALL(mkdir)
    1880:	b8 14 00 00 00       	mov    $0x14,%eax
    1885:	cd 40                	int    $0x40
    1887:	c3                   	ret    

00001888 <chdir>:
SYSCALL(chdir)
    1888:	b8 09 00 00 00       	mov    $0x9,%eax
    188d:	cd 40                	int    $0x40
    188f:	c3                   	ret    

00001890 <dup>:
SYSCALL(dup)
    1890:	b8 0a 00 00 00       	mov    $0xa,%eax
    1895:	cd 40                	int    $0x40
    1897:	c3                   	ret    

00001898 <getpid>:
SYSCALL(getpid)
    1898:	b8 0b 00 00 00       	mov    $0xb,%eax
    189d:	cd 40                	int    $0x40
    189f:	c3                   	ret    

000018a0 <sbrk>:
SYSCALL(sbrk)
    18a0:	b8 0c 00 00 00       	mov    $0xc,%eax
    18a5:	cd 40                	int    $0x40
    18a7:	c3                   	ret    

000018a8 <sleep>:
SYSCALL(sleep)
    18a8:	b8 0d 00 00 00       	mov    $0xd,%eax
    18ad:	cd 40                	int    $0x40
    18af:	c3                   	ret    

000018b0 <uptime>:
SYSCALL(uptime)
    18b0:	b8 0e 00 00 00       	mov    $0xe,%eax
    18b5:	cd 40                	int    $0x40
    18b7:	c3                   	ret    

000018b8 <clone>:
SYSCALL(clone)
    18b8:	b8 16 00 00 00       	mov    $0x16,%eax
    18bd:	cd 40                	int    $0x40
    18bf:	c3                   	ret    

000018c0 <texit>:
SYSCALL(texit)
    18c0:	b8 17 00 00 00       	mov    $0x17,%eax
    18c5:	cd 40                	int    $0x40
    18c7:	c3                   	ret    

000018c8 <tsleep>:
SYSCALL(tsleep)
    18c8:	b8 18 00 00 00       	mov    $0x18,%eax
    18cd:	cd 40                	int    $0x40
    18cf:	c3                   	ret    

000018d0 <twakeup>:
SYSCALL(twakeup)
    18d0:	b8 19 00 00 00       	mov    $0x19,%eax
    18d5:	cd 40                	int    $0x40
    18d7:	c3                   	ret    

000018d8 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
    18d8:	55                   	push   %ebp
    18d9:	89 e5                	mov    %esp,%ebp
    18db:	83 ec 18             	sub    $0x18,%esp
    18de:	8b 45 0c             	mov    0xc(%ebp),%eax
    18e1:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
    18e4:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    18eb:	00 
    18ec:	8d 45 f4             	lea    -0xc(%ebp),%eax
    18ef:	89 44 24 04          	mov    %eax,0x4(%esp)
    18f3:	8b 45 08             	mov    0x8(%ebp),%eax
    18f6:	89 04 24             	mov    %eax,(%esp)
    18f9:	e8 3a ff ff ff       	call   1838 <write>
}
    18fe:	c9                   	leave  
    18ff:	c3                   	ret    

00001900 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
    1900:	55                   	push   %ebp
    1901:	89 e5                	mov    %esp,%ebp
    1903:	56                   	push   %esi
    1904:	53                   	push   %ebx
    1905:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    1908:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
    190f:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
    1913:	74 17                	je     192c <printint+0x2c>
    1915:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    1919:	79 11                	jns    192c <printint+0x2c>
    neg = 1;
    191b:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
    1922:	8b 45 0c             	mov    0xc(%ebp),%eax
    1925:	f7 d8                	neg    %eax
    1927:	89 45 ec             	mov    %eax,-0x14(%ebp)
    192a:	eb 06                	jmp    1932 <printint+0x32>
  } else {
    x = xx;
    192c:	8b 45 0c             	mov    0xc(%ebp),%eax
    192f:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
    1932:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
    1939:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    193c:	8d 41 01             	lea    0x1(%ecx),%eax
    193f:	89 45 f4             	mov    %eax,-0xc(%ebp)
    1942:	8b 5d 10             	mov    0x10(%ebp),%ebx
    1945:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1948:	ba 00 00 00 00       	mov    $0x0,%edx
    194d:	f7 f3                	div    %ebx
    194f:	89 d0                	mov    %edx,%eax
    1951:	0f b6 80 ec 26 00 00 	movzbl 0x26ec(%eax),%eax
    1958:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
    195c:	8b 75 10             	mov    0x10(%ebp),%esi
    195f:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1962:	ba 00 00 00 00       	mov    $0x0,%edx
    1967:	f7 f6                	div    %esi
    1969:	89 45 ec             	mov    %eax,-0x14(%ebp)
    196c:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1970:	75 c7                	jne    1939 <printint+0x39>
  if(neg)
    1972:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1976:	74 10                	je     1988 <printint+0x88>
    buf[i++] = '-';
    1978:	8b 45 f4             	mov    -0xc(%ebp),%eax
    197b:	8d 50 01             	lea    0x1(%eax),%edx
    197e:	89 55 f4             	mov    %edx,-0xc(%ebp)
    1981:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
    1986:	eb 1f                	jmp    19a7 <printint+0xa7>
    1988:	eb 1d                	jmp    19a7 <printint+0xa7>
    putc(fd, buf[i]);
    198a:	8d 55 dc             	lea    -0x24(%ebp),%edx
    198d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1990:	01 d0                	add    %edx,%eax
    1992:	0f b6 00             	movzbl (%eax),%eax
    1995:	0f be c0             	movsbl %al,%eax
    1998:	89 44 24 04          	mov    %eax,0x4(%esp)
    199c:	8b 45 08             	mov    0x8(%ebp),%eax
    199f:	89 04 24             	mov    %eax,(%esp)
    19a2:	e8 31 ff ff ff       	call   18d8 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    19a7:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    19ab:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    19af:	79 d9                	jns    198a <printint+0x8a>
    putc(fd, buf[i]);
}
    19b1:	83 c4 30             	add    $0x30,%esp
    19b4:	5b                   	pop    %ebx
    19b5:	5e                   	pop    %esi
    19b6:	5d                   	pop    %ebp
    19b7:	c3                   	ret    

000019b8 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    19b8:	55                   	push   %ebp
    19b9:	89 e5                	mov    %esp,%ebp
    19bb:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
    19be:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
    19c5:	8d 45 0c             	lea    0xc(%ebp),%eax
    19c8:	83 c0 04             	add    $0x4,%eax
    19cb:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
    19ce:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    19d5:	e9 7c 01 00 00       	jmp    1b56 <printf+0x19e>
    c = fmt[i] & 0xff;
    19da:	8b 55 0c             	mov    0xc(%ebp),%edx
    19dd:	8b 45 f0             	mov    -0x10(%ebp),%eax
    19e0:	01 d0                	add    %edx,%eax
    19e2:	0f b6 00             	movzbl (%eax),%eax
    19e5:	0f be c0             	movsbl %al,%eax
    19e8:	25 ff 00 00 00       	and    $0xff,%eax
    19ed:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
    19f0:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    19f4:	75 2c                	jne    1a22 <printf+0x6a>
      if(c == '%'){
    19f6:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    19fa:	75 0c                	jne    1a08 <printf+0x50>
        state = '%';
    19fc:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
    1a03:	e9 4a 01 00 00       	jmp    1b52 <printf+0x19a>
      } else {
        putc(fd, c);
    1a08:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1a0b:	0f be c0             	movsbl %al,%eax
    1a0e:	89 44 24 04          	mov    %eax,0x4(%esp)
    1a12:	8b 45 08             	mov    0x8(%ebp),%eax
    1a15:	89 04 24             	mov    %eax,(%esp)
    1a18:	e8 bb fe ff ff       	call   18d8 <putc>
    1a1d:	e9 30 01 00 00       	jmp    1b52 <printf+0x19a>
      }
    } else if(state == '%'){
    1a22:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
    1a26:	0f 85 26 01 00 00    	jne    1b52 <printf+0x19a>
      if(c == 'd'){
    1a2c:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
    1a30:	75 2d                	jne    1a5f <printf+0xa7>
        printint(fd, *ap, 10, 1);
    1a32:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1a35:	8b 00                	mov    (%eax),%eax
    1a37:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    1a3e:	00 
    1a3f:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
    1a46:	00 
    1a47:	89 44 24 04          	mov    %eax,0x4(%esp)
    1a4b:	8b 45 08             	mov    0x8(%ebp),%eax
    1a4e:	89 04 24             	mov    %eax,(%esp)
    1a51:	e8 aa fe ff ff       	call   1900 <printint>
        ap++;
    1a56:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    1a5a:	e9 ec 00 00 00       	jmp    1b4b <printf+0x193>
      } else if(c == 'x' || c == 'p'){
    1a5f:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
    1a63:	74 06                	je     1a6b <printf+0xb3>
    1a65:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
    1a69:	75 2d                	jne    1a98 <printf+0xe0>
        printint(fd, *ap, 16, 0);
    1a6b:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1a6e:	8b 00                	mov    (%eax),%eax
    1a70:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    1a77:	00 
    1a78:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
    1a7f:	00 
    1a80:	89 44 24 04          	mov    %eax,0x4(%esp)
    1a84:	8b 45 08             	mov    0x8(%ebp),%eax
    1a87:	89 04 24             	mov    %eax,(%esp)
    1a8a:	e8 71 fe ff ff       	call   1900 <printint>
        ap++;
    1a8f:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    1a93:	e9 b3 00 00 00       	jmp    1b4b <printf+0x193>
      } else if(c == 's'){
    1a98:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
    1a9c:	75 45                	jne    1ae3 <printf+0x12b>
        s = (char*)*ap;
    1a9e:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1aa1:	8b 00                	mov    (%eax),%eax
    1aa3:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
    1aa6:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
    1aaa:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1aae:	75 09                	jne    1ab9 <printf+0x101>
          s = "(null)";
    1ab0:	c7 45 f4 3a 22 00 00 	movl   $0x223a,-0xc(%ebp)
        while(*s != 0){
    1ab7:	eb 1e                	jmp    1ad7 <printf+0x11f>
    1ab9:	eb 1c                	jmp    1ad7 <printf+0x11f>
          putc(fd, *s);
    1abb:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1abe:	0f b6 00             	movzbl (%eax),%eax
    1ac1:	0f be c0             	movsbl %al,%eax
    1ac4:	89 44 24 04          	mov    %eax,0x4(%esp)
    1ac8:	8b 45 08             	mov    0x8(%ebp),%eax
    1acb:	89 04 24             	mov    %eax,(%esp)
    1ace:	e8 05 fe ff ff       	call   18d8 <putc>
          s++;
    1ad3:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    1ad7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1ada:	0f b6 00             	movzbl (%eax),%eax
    1add:	84 c0                	test   %al,%al
    1adf:	75 da                	jne    1abb <printf+0x103>
    1ae1:	eb 68                	jmp    1b4b <printf+0x193>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    1ae3:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
    1ae7:	75 1d                	jne    1b06 <printf+0x14e>
        putc(fd, *ap);
    1ae9:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1aec:	8b 00                	mov    (%eax),%eax
    1aee:	0f be c0             	movsbl %al,%eax
    1af1:	89 44 24 04          	mov    %eax,0x4(%esp)
    1af5:	8b 45 08             	mov    0x8(%ebp),%eax
    1af8:	89 04 24             	mov    %eax,(%esp)
    1afb:	e8 d8 fd ff ff       	call   18d8 <putc>
        ap++;
    1b00:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    1b04:	eb 45                	jmp    1b4b <printf+0x193>
      } else if(c == '%'){
    1b06:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    1b0a:	75 17                	jne    1b23 <printf+0x16b>
        putc(fd, c);
    1b0c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1b0f:	0f be c0             	movsbl %al,%eax
    1b12:	89 44 24 04          	mov    %eax,0x4(%esp)
    1b16:	8b 45 08             	mov    0x8(%ebp),%eax
    1b19:	89 04 24             	mov    %eax,(%esp)
    1b1c:	e8 b7 fd ff ff       	call   18d8 <putc>
    1b21:	eb 28                	jmp    1b4b <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
    1b23:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
    1b2a:	00 
    1b2b:	8b 45 08             	mov    0x8(%ebp),%eax
    1b2e:	89 04 24             	mov    %eax,(%esp)
    1b31:	e8 a2 fd ff ff       	call   18d8 <putc>
        putc(fd, c);
    1b36:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1b39:	0f be c0             	movsbl %al,%eax
    1b3c:	89 44 24 04          	mov    %eax,0x4(%esp)
    1b40:	8b 45 08             	mov    0x8(%ebp),%eax
    1b43:	89 04 24             	mov    %eax,(%esp)
    1b46:	e8 8d fd ff ff       	call   18d8 <putc>
      }
      state = 0;
    1b4b:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1b52:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    1b56:	8b 55 0c             	mov    0xc(%ebp),%edx
    1b59:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1b5c:	01 d0                	add    %edx,%eax
    1b5e:	0f b6 00             	movzbl (%eax),%eax
    1b61:	84 c0                	test   %al,%al
    1b63:	0f 85 71 fe ff ff    	jne    19da <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    1b69:	c9                   	leave  
    1b6a:	c3                   	ret    
    1b6b:	90                   	nop

00001b6c <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    1b6c:	55                   	push   %ebp
    1b6d:	89 e5                	mov    %esp,%ebp
    1b6f:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
    1b72:	8b 45 08             	mov    0x8(%ebp),%eax
    1b75:	83 e8 08             	sub    $0x8,%eax
    1b78:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1b7b:	a1 0c 27 00 00       	mov    0x270c,%eax
    1b80:	89 45 fc             	mov    %eax,-0x4(%ebp)
    1b83:	eb 24                	jmp    1ba9 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1b85:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1b88:	8b 00                	mov    (%eax),%eax
    1b8a:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    1b8d:	77 12                	ja     1ba1 <free+0x35>
    1b8f:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1b92:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    1b95:	77 24                	ja     1bbb <free+0x4f>
    1b97:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1b9a:	8b 00                	mov    (%eax),%eax
    1b9c:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    1b9f:	77 1a                	ja     1bbb <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1ba1:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1ba4:	8b 00                	mov    (%eax),%eax
    1ba6:	89 45 fc             	mov    %eax,-0x4(%ebp)
    1ba9:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1bac:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    1baf:	76 d4                	jbe    1b85 <free+0x19>
    1bb1:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1bb4:	8b 00                	mov    (%eax),%eax
    1bb6:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    1bb9:	76 ca                	jbe    1b85 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    1bbb:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1bbe:	8b 40 04             	mov    0x4(%eax),%eax
    1bc1:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    1bc8:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1bcb:	01 c2                	add    %eax,%edx
    1bcd:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1bd0:	8b 00                	mov    (%eax),%eax
    1bd2:	39 c2                	cmp    %eax,%edx
    1bd4:	75 24                	jne    1bfa <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
    1bd6:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1bd9:	8b 50 04             	mov    0x4(%eax),%edx
    1bdc:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1bdf:	8b 00                	mov    (%eax),%eax
    1be1:	8b 40 04             	mov    0x4(%eax),%eax
    1be4:	01 c2                	add    %eax,%edx
    1be6:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1be9:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
    1bec:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1bef:	8b 00                	mov    (%eax),%eax
    1bf1:	8b 10                	mov    (%eax),%edx
    1bf3:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1bf6:	89 10                	mov    %edx,(%eax)
    1bf8:	eb 0a                	jmp    1c04 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
    1bfa:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1bfd:	8b 10                	mov    (%eax),%edx
    1bff:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1c02:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
    1c04:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1c07:	8b 40 04             	mov    0x4(%eax),%eax
    1c0a:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    1c11:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1c14:	01 d0                	add    %edx,%eax
    1c16:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    1c19:	75 20                	jne    1c3b <free+0xcf>
    p->s.size += bp->s.size;
    1c1b:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1c1e:	8b 50 04             	mov    0x4(%eax),%edx
    1c21:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1c24:	8b 40 04             	mov    0x4(%eax),%eax
    1c27:	01 c2                	add    %eax,%edx
    1c29:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1c2c:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    1c2f:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1c32:	8b 10                	mov    (%eax),%edx
    1c34:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1c37:	89 10                	mov    %edx,(%eax)
    1c39:	eb 08                	jmp    1c43 <free+0xd7>
  } else
    p->s.ptr = bp;
    1c3b:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1c3e:	8b 55 f8             	mov    -0x8(%ebp),%edx
    1c41:	89 10                	mov    %edx,(%eax)
  freep = p;
    1c43:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1c46:	a3 0c 27 00 00       	mov    %eax,0x270c
}
    1c4b:	c9                   	leave  
    1c4c:	c3                   	ret    

00001c4d <morecore>:

static Header*
morecore(uint nu)
{
    1c4d:	55                   	push   %ebp
    1c4e:	89 e5                	mov    %esp,%ebp
    1c50:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
    1c53:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
    1c5a:	77 07                	ja     1c63 <morecore+0x16>
    nu = 4096;
    1c5c:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
    1c63:	8b 45 08             	mov    0x8(%ebp),%eax
    1c66:	c1 e0 03             	shl    $0x3,%eax
    1c69:	89 04 24             	mov    %eax,(%esp)
    1c6c:	e8 2f fc ff ff       	call   18a0 <sbrk>
    1c71:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
    1c74:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
    1c78:	75 07                	jne    1c81 <morecore+0x34>
    return 0;
    1c7a:	b8 00 00 00 00       	mov    $0x0,%eax
    1c7f:	eb 22                	jmp    1ca3 <morecore+0x56>
  hp = (Header*)p;
    1c81:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1c84:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
    1c87:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1c8a:	8b 55 08             	mov    0x8(%ebp),%edx
    1c8d:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
    1c90:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1c93:	83 c0 08             	add    $0x8,%eax
    1c96:	89 04 24             	mov    %eax,(%esp)
    1c99:	e8 ce fe ff ff       	call   1b6c <free>
  return freep;
    1c9e:	a1 0c 27 00 00       	mov    0x270c,%eax
}
    1ca3:	c9                   	leave  
    1ca4:	c3                   	ret    

00001ca5 <malloc>:

void*
malloc(uint nbytes)
{
    1ca5:	55                   	push   %ebp
    1ca6:	89 e5                	mov    %esp,%ebp
    1ca8:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1cab:	8b 45 08             	mov    0x8(%ebp),%eax
    1cae:	83 c0 07             	add    $0x7,%eax
    1cb1:	c1 e8 03             	shr    $0x3,%eax
    1cb4:	83 c0 01             	add    $0x1,%eax
    1cb7:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
    1cba:	a1 0c 27 00 00       	mov    0x270c,%eax
    1cbf:	89 45 f0             	mov    %eax,-0x10(%ebp)
    1cc2:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1cc6:	75 23                	jne    1ceb <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
    1cc8:	c7 45 f0 04 27 00 00 	movl   $0x2704,-0x10(%ebp)
    1ccf:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1cd2:	a3 0c 27 00 00       	mov    %eax,0x270c
    1cd7:	a1 0c 27 00 00       	mov    0x270c,%eax
    1cdc:	a3 04 27 00 00       	mov    %eax,0x2704
    base.s.size = 0;
    1ce1:	c7 05 08 27 00 00 00 	movl   $0x0,0x2708
    1ce8:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1ceb:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1cee:	8b 00                	mov    (%eax),%eax
    1cf0:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
    1cf3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1cf6:	8b 40 04             	mov    0x4(%eax),%eax
    1cf9:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    1cfc:	72 4d                	jb     1d4b <malloc+0xa6>
      if(p->s.size == nunits)
    1cfe:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1d01:	8b 40 04             	mov    0x4(%eax),%eax
    1d04:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    1d07:	75 0c                	jne    1d15 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
    1d09:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1d0c:	8b 10                	mov    (%eax),%edx
    1d0e:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1d11:	89 10                	mov    %edx,(%eax)
    1d13:	eb 26                	jmp    1d3b <malloc+0x96>
      else {
        p->s.size -= nunits;
    1d15:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1d18:	8b 40 04             	mov    0x4(%eax),%eax
    1d1b:	2b 45 ec             	sub    -0x14(%ebp),%eax
    1d1e:	89 c2                	mov    %eax,%edx
    1d20:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1d23:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
    1d26:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1d29:	8b 40 04             	mov    0x4(%eax),%eax
    1d2c:	c1 e0 03             	shl    $0x3,%eax
    1d2f:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
    1d32:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1d35:	8b 55 ec             	mov    -0x14(%ebp),%edx
    1d38:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
    1d3b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1d3e:	a3 0c 27 00 00       	mov    %eax,0x270c
      return (void*)(p + 1);
    1d43:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1d46:	83 c0 08             	add    $0x8,%eax
    1d49:	eb 38                	jmp    1d83 <malloc+0xde>
    }
    if(p == freep)
    1d4b:	a1 0c 27 00 00       	mov    0x270c,%eax
    1d50:	39 45 f4             	cmp    %eax,-0xc(%ebp)
    1d53:	75 1b                	jne    1d70 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
    1d55:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1d58:	89 04 24             	mov    %eax,(%esp)
    1d5b:	e8 ed fe ff ff       	call   1c4d <morecore>
    1d60:	89 45 f4             	mov    %eax,-0xc(%ebp)
    1d63:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1d67:	75 07                	jne    1d70 <malloc+0xcb>
        return 0;
    1d69:	b8 00 00 00 00       	mov    $0x0,%eax
    1d6e:	eb 13                	jmp    1d83 <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1d70:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1d73:	89 45 f0             	mov    %eax,-0x10(%ebp)
    1d76:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1d79:	8b 00                	mov    (%eax),%eax
    1d7b:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
    1d7e:	e9 70 ff ff ff       	jmp    1cf3 <malloc+0x4e>
}
    1d83:	c9                   	leave  
    1d84:	c3                   	ret    
    1d85:	66 90                	xchg   %ax,%ax
    1d87:	90                   	nop

00001d88 <xchg>:
  asm volatile("sti");
}

static inline uint
xchg(volatile uint *addr, uint newval)
{
    1d88:	55                   	push   %ebp
    1d89:	89 e5                	mov    %esp,%ebp
    1d8b:	83 ec 10             	sub    $0x10,%esp
  uint result;
  
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
    1d8e:	8b 55 08             	mov    0x8(%ebp),%edx
    1d91:	8b 45 0c             	mov    0xc(%ebp),%eax
    1d94:	8b 4d 08             	mov    0x8(%ebp),%ecx
    1d97:	f0 87 02             	lock xchg %eax,(%edx)
    1d9a:	89 45 fc             	mov    %eax,-0x4(%ebp)
               "+m" (*addr), "=a" (result) :
               "1" (newval) :
               "cc");
  return result;
    1d9d:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    1da0:	c9                   	leave  
    1da1:	c3                   	ret    

00001da2 <lock_init>:
#include "x86.h"
#include "proc.h"

unsigned long rands = 1;

void lock_init(lock_t *lock){
    1da2:	55                   	push   %ebp
    1da3:	89 e5                	mov    %esp,%ebp
    lock->locked = 0;
    1da5:	8b 45 08             	mov    0x8(%ebp),%eax
    1da8:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
    1dae:	5d                   	pop    %ebp
    1daf:	c3                   	ret    

00001db0 <lock_acquire>:
void lock_acquire(lock_t *lock){
    1db0:	55                   	push   %ebp
    1db1:	89 e5                	mov    %esp,%ebp
    1db3:	83 ec 08             	sub    $0x8,%esp
    while(xchg(&lock->locked,1) != 0);
    1db6:	90                   	nop
    1db7:	8b 45 08             	mov    0x8(%ebp),%eax
    1dba:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
    1dc1:	00 
    1dc2:	89 04 24             	mov    %eax,(%esp)
    1dc5:	e8 be ff ff ff       	call   1d88 <xchg>
    1dca:	85 c0                	test   %eax,%eax
    1dcc:	75 e9                	jne    1db7 <lock_acquire+0x7>
}
    1dce:	c9                   	leave  
    1dcf:	c3                   	ret    

00001dd0 <lock_release>:
void lock_release(lock_t *lock){
    1dd0:	55                   	push   %ebp
    1dd1:	89 e5                	mov    %esp,%ebp
    1dd3:	83 ec 08             	sub    $0x8,%esp
    xchg(&lock->locked,0);
    1dd6:	8b 45 08             	mov    0x8(%ebp),%eax
    1dd9:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1de0:	00 
    1de1:	89 04 24             	mov    %eax,(%esp)
    1de4:	e8 9f ff ff ff       	call   1d88 <xchg>
}
    1de9:	c9                   	leave  
    1dea:	c3                   	ret    

00001deb <thread_create>:


void *thread_create(void(*start_routine)(void*), void *arg){
    1deb:	55                   	push   %ebp
    1dec:	89 e5                	mov    %esp,%ebp
    1dee:	83 ec 28             	sub    $0x28,%esp
    int tid;
    void * stack = malloc(2 * 4096);
    1df1:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
    1df8:	e8 a8 fe ff ff       	call   1ca5 <malloc>
    1dfd:	89 45 f4             	mov    %eax,-0xc(%ebp)
    void *garbage_stack = stack; 
    1e00:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1e03:	89 45 f0             	mov    %eax,-0x10(%ebp)
   // printf(1,"start routine addr : %d\n",(uint)start_routine);


    if((uint)stack % 4096){
    1e06:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1e09:	25 ff 0f 00 00       	and    $0xfff,%eax
    1e0e:	85 c0                	test   %eax,%eax
    1e10:	74 14                	je     1e26 <thread_create+0x3b>
        stack = stack + (4096 - (uint)stack % 4096);
    1e12:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1e15:	25 ff 0f 00 00       	and    $0xfff,%eax
    1e1a:	89 c2                	mov    %eax,%edx
    1e1c:	b8 00 10 00 00       	mov    $0x1000,%eax
    1e21:	29 d0                	sub    %edx,%eax
    1e23:	01 45 f4             	add    %eax,-0xc(%ebp)
    }
    if (stack == 0){
    1e26:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1e2a:	75 1b                	jne    1e47 <thread_create+0x5c>

        printf(1,"malloc fail \n");
    1e2c:	c7 44 24 04 41 22 00 	movl   $0x2241,0x4(%esp)
    1e33:	00 
    1e34:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1e3b:	e8 78 fb ff ff       	call   19b8 <printf>
        return 0;
    1e40:	b8 00 00 00 00       	mov    $0x0,%eax
    1e45:	eb 6f                	jmp    1eb6 <thread_create+0xcb>
    }

    tid = clone((uint)stack,PSIZE,(uint)start_routine,(int)arg);
    1e47:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    1e4a:	8b 55 08             	mov    0x8(%ebp),%edx
    1e4d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1e50:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
    1e54:	89 54 24 08          	mov    %edx,0x8(%esp)
    1e58:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
    1e5f:	00 
    1e60:	89 04 24             	mov    %eax,(%esp)
    1e63:	e8 50 fa ff ff       	call   18b8 <clone>
    1e68:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(tid < 0){
    1e6b:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1e6f:	79 1b                	jns    1e8c <thread_create+0xa1>
        printf(1,"clone fails\n");
    1e71:	c7 44 24 04 4f 22 00 	movl   $0x224f,0x4(%esp)
    1e78:	00 
    1e79:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1e80:	e8 33 fb ff ff       	call   19b8 <printf>
        return 0;
    1e85:	b8 00 00 00 00       	mov    $0x0,%eax
    1e8a:	eb 2a                	jmp    1eb6 <thread_create+0xcb>
    }
    if(tid > 0){
    1e8c:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1e90:	7e 05                	jle    1e97 <thread_create+0xac>
        //store threads on thread table
        return garbage_stack;
    1e92:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1e95:	eb 1f                	jmp    1eb6 <thread_create+0xcb>
    }
    if(tid == 0){
    1e97:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1e9b:	75 14                	jne    1eb1 <thread_create+0xc6>
        printf(1,"tid = 0 return \n");
    1e9d:	c7 44 24 04 5c 22 00 	movl   $0x225c,0x4(%esp)
    1ea4:	00 
    1ea5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1eac:	e8 07 fb ff ff       	call   19b8 <printf>
    }
//    wait();
//    free(garbage_stack);

    return 0;
    1eb1:	b8 00 00 00 00       	mov    $0x0,%eax
}
    1eb6:	c9                   	leave  
    1eb7:	c3                   	ret    

00001eb8 <random>:

// generate 0 -> max random number exclude max.
int random(int max){
    1eb8:	55                   	push   %ebp
    1eb9:	89 e5                	mov    %esp,%ebp
    rands = rands * 1664525 + 1013904233;
    1ebb:	a1 00 27 00 00       	mov    0x2700,%eax
    1ec0:	69 c0 0d 66 19 00    	imul   $0x19660d,%eax,%eax
    1ec6:	05 69 f3 6e 3c       	add    $0x3c6ef369,%eax
    1ecb:	a3 00 27 00 00       	mov    %eax,0x2700
    return (int)(rands % max);
    1ed0:	a1 00 27 00 00       	mov    0x2700,%eax
    1ed5:	8b 4d 08             	mov    0x8(%ebp),%ecx
    1ed8:	ba 00 00 00 00       	mov    $0x0,%edx
    1edd:	f7 f1                	div    %ecx
    1edf:	89 d0                	mov    %edx,%eax
}
    1ee1:	5d                   	pop    %ebp
    1ee2:	c3                   	ret    
    1ee3:	90                   	nop

00001ee4 <init_q>:
#include "queue.h"
#include "types.h"
#include "user.h"

void init_q(struct queue *q){
    1ee4:	55                   	push   %ebp
    1ee5:	89 e5                	mov    %esp,%ebp
    q->size = 0;
    1ee7:	8b 45 08             	mov    0x8(%ebp),%eax
    1eea:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    q->head = 0;
    1ef0:	8b 45 08             	mov    0x8(%ebp),%eax
    1ef3:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    q->tail = 0;
    1efa:	8b 45 08             	mov    0x8(%ebp),%eax
    1efd:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
}
    1f04:	5d                   	pop    %ebp
    1f05:	c3                   	ret    

00001f06 <add_q>:

void add_q(struct queue *q, int v){
    1f06:	55                   	push   %ebp
    1f07:	89 e5                	mov    %esp,%ebp
    1f09:	83 ec 28             	sub    $0x28,%esp
    struct node * n = malloc(sizeof(struct node));
    1f0c:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
    1f13:	e8 8d fd ff ff       	call   1ca5 <malloc>
    1f18:	89 45 f4             	mov    %eax,-0xc(%ebp)
    n->next = 0;
    1f1b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1f1e:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    n->value = v;
    1f25:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1f28:	8b 55 0c             	mov    0xc(%ebp),%edx
    1f2b:	89 10                	mov    %edx,(%eax)
    if(q->head == 0){
    1f2d:	8b 45 08             	mov    0x8(%ebp),%eax
    1f30:	8b 40 04             	mov    0x4(%eax),%eax
    1f33:	85 c0                	test   %eax,%eax
    1f35:	75 0b                	jne    1f42 <add_q+0x3c>
        q->head = n;
    1f37:	8b 45 08             	mov    0x8(%ebp),%eax
    1f3a:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1f3d:	89 50 04             	mov    %edx,0x4(%eax)
    1f40:	eb 0c                	jmp    1f4e <add_q+0x48>
    }else{
        q->tail->next = n;
    1f42:	8b 45 08             	mov    0x8(%ebp),%eax
    1f45:	8b 40 08             	mov    0x8(%eax),%eax
    1f48:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1f4b:	89 50 04             	mov    %edx,0x4(%eax)
    }
    q->tail = n;
    1f4e:	8b 45 08             	mov    0x8(%ebp),%eax
    1f51:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1f54:	89 50 08             	mov    %edx,0x8(%eax)
    q->size++;
    1f57:	8b 45 08             	mov    0x8(%ebp),%eax
    1f5a:	8b 00                	mov    (%eax),%eax
    1f5c:	8d 50 01             	lea    0x1(%eax),%edx
    1f5f:	8b 45 08             	mov    0x8(%ebp),%eax
    1f62:	89 10                	mov    %edx,(%eax)
}
    1f64:	c9                   	leave  
    1f65:	c3                   	ret    

00001f66 <empty_q>:

int empty_q(struct queue *q){
    1f66:	55                   	push   %ebp
    1f67:	89 e5                	mov    %esp,%ebp
    if(q->size == 0)
    1f69:	8b 45 08             	mov    0x8(%ebp),%eax
    1f6c:	8b 00                	mov    (%eax),%eax
    1f6e:	85 c0                	test   %eax,%eax
    1f70:	75 07                	jne    1f79 <empty_q+0x13>
        return 1;
    1f72:	b8 01 00 00 00       	mov    $0x1,%eax
    1f77:	eb 05                	jmp    1f7e <empty_q+0x18>
    else
        return 0;
    1f79:	b8 00 00 00 00       	mov    $0x0,%eax
} 
    1f7e:	5d                   	pop    %ebp
    1f7f:	c3                   	ret    

00001f80 <pop_q>:
int pop_q(struct queue *q){
    1f80:	55                   	push   %ebp
    1f81:	89 e5                	mov    %esp,%ebp
    1f83:	83 ec 28             	sub    $0x28,%esp
    int val;
    struct node *destroy;
    if(!empty_q(q)){
    1f86:	8b 45 08             	mov    0x8(%ebp),%eax
    1f89:	89 04 24             	mov    %eax,(%esp)
    1f8c:	e8 d5 ff ff ff       	call   1f66 <empty_q>
    1f91:	85 c0                	test   %eax,%eax
    1f93:	75 5d                	jne    1ff2 <pop_q+0x72>
       val = q->head->value; 
    1f95:	8b 45 08             	mov    0x8(%ebp),%eax
    1f98:	8b 40 04             	mov    0x4(%eax),%eax
    1f9b:	8b 00                	mov    (%eax),%eax
    1f9d:	89 45 f4             	mov    %eax,-0xc(%ebp)
       destroy = q->head;
    1fa0:	8b 45 08             	mov    0x8(%ebp),%eax
    1fa3:	8b 40 04             	mov    0x4(%eax),%eax
    1fa6:	89 45 f0             	mov    %eax,-0x10(%ebp)
       q->head = q->head->next;
    1fa9:	8b 45 08             	mov    0x8(%ebp),%eax
    1fac:	8b 40 04             	mov    0x4(%eax),%eax
    1faf:	8b 50 04             	mov    0x4(%eax),%edx
    1fb2:	8b 45 08             	mov    0x8(%ebp),%eax
    1fb5:	89 50 04             	mov    %edx,0x4(%eax)
       free(destroy);
    1fb8:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1fbb:	89 04 24             	mov    %eax,(%esp)
    1fbe:	e8 a9 fb ff ff       	call   1b6c <free>
       q->size--;
    1fc3:	8b 45 08             	mov    0x8(%ebp),%eax
    1fc6:	8b 00                	mov    (%eax),%eax
    1fc8:	8d 50 ff             	lea    -0x1(%eax),%edx
    1fcb:	8b 45 08             	mov    0x8(%ebp),%eax
    1fce:	89 10                	mov    %edx,(%eax)
       if(q->size == 0){
    1fd0:	8b 45 08             	mov    0x8(%ebp),%eax
    1fd3:	8b 00                	mov    (%eax),%eax
    1fd5:	85 c0                	test   %eax,%eax
    1fd7:	75 14                	jne    1fed <pop_q+0x6d>
            q->head = 0;
    1fd9:	8b 45 08             	mov    0x8(%ebp),%eax
    1fdc:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
            q->tail = 0;
    1fe3:	8b 45 08             	mov    0x8(%ebp),%eax
    1fe6:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
       }
       return val;
    1fed:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1ff0:	eb 05                	jmp    1ff7 <pop_q+0x77>
    }
    return -1;
    1ff2:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
    1ff7:	c9                   	leave  
    1ff8:	c3                   	ret    

00001ff9 <dominant>:

void dominant(struct queue* q, int i){
    1ff9:	55                   	push   %ebp
    1ffa:	89 e5                	mov    %esp,%ebp
    1ffc:	83 ec 28             	sub    $0x28,%esp
    struct node * n = malloc(sizeof(struct node));
    1fff:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
    2006:	e8 9a fc ff ff       	call   1ca5 <malloc>
    200b:	89 45 f4             	mov    %eax,-0xc(%ebp)
    n->value = i;
    200e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2011:	8b 55 0c             	mov    0xc(%ebp),%edx
    2014:	89 10                	mov    %edx,(%eax)

    if(q->head == 0){
    2016:	8b 45 08             	mov    0x8(%ebp),%eax
    2019:	8b 40 04             	mov    0x4(%eax),%eax
    201c:	85 c0                	test   %eax,%eax
    201e:	75 14                	jne    2034 <dominant+0x3b>
        q->head = n;
    2020:	8b 45 08             	mov    0x8(%ebp),%eax
    2023:	8b 55 f4             	mov    -0xc(%ebp),%edx
    2026:	89 50 04             	mov    %edx,0x4(%eax)
        q->tail = n;
    2029:	8b 45 08             	mov    0x8(%ebp),%eax
    202c:	8b 55 f4             	mov    -0xc(%ebp),%edx
    202f:	89 50 08             	mov    %edx,0x8(%eax)
    2032:	eb 15                	jmp    2049 <dominant+0x50>
    }
    else{
        n->next = q->head;
    2034:	8b 45 08             	mov    0x8(%ebp),%eax
    2037:	8b 50 04             	mov    0x4(%eax),%edx
    203a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    203d:	89 50 04             	mov    %edx,0x4(%eax)
        q->head = n;
    2040:	8b 45 08             	mov    0x8(%ebp),%eax
    2043:	8b 55 f4             	mov    -0xc(%ebp),%edx
    2046:	89 50 04             	mov    %edx,0x4(%eax)
    }
    q->size++;
    2049:	8b 45 08             	mov    0x8(%ebp),%eax
    204c:	8b 00                	mov    (%eax),%eax
    204e:	8d 50 01             	lea    0x1(%eax),%edx
    2051:	8b 45 08             	mov    0x8(%ebp),%eax
    2054:	89 10                	mov    %edx,(%eax)
}
    2056:	c9                   	leave  
    2057:	c3                   	ret    

00002058 <sem_init>:
#include "semaphore.h"
#include "user.h"

// Initializes the semaphore
void sem_init(struct Semaphore* s, int value){
    2058:	55                   	push   %ebp
    2059:	89 e5                	mov    %esp,%ebp
    205b:	83 ec 18             	sub    $0x18,%esp
    s->val = value;
    205e:	8b 45 08             	mov    0x8(%ebp),%eax
    2061:	8b 55 0c             	mov    0xc(%ebp),%edx
    2064:	89 10                	mov    %edx,(%eax)
    lock_init(&s->lock);
    2066:	8b 45 08             	mov    0x8(%ebp),%eax
    2069:	83 c0 04             	add    $0x4,%eax
    206c:	89 04 24             	mov    %eax,(%esp)
    206f:	e8 2e fd ff ff       	call   1da2 <lock_init>
    init_q(&s->q);
    2074:	8b 45 08             	mov    0x8(%ebp),%eax
    2077:	83 c0 08             	add    $0x8,%eax
    207a:	89 04 24             	mov    %eax,(%esp)
    207d:	e8 62 fe ff ff       	call   1ee4 <init_q>
}
    2082:	c9                   	leave  
    2083:	c3                   	ret    

00002084 <sem_acquire>:

// Decrements the semaphore
void sem_acquire(struct Semaphore* s){
    2084:	55                   	push   %ebp
    2085:	89 e5                	mov    %esp,%ebp
    2087:	83 ec 28             	sub    $0x28,%esp
    lock_acquire(&s->lock);
    208a:	8b 45 08             	mov    0x8(%ebp),%eax
    208d:	83 c0 04             	add    $0x4,%eax
    2090:	89 04 24             	mov    %eax,(%esp)
    2093:	e8 18 fd ff ff       	call   1db0 <lock_acquire>

    if(s->val == 0){
    2098:	8b 45 08             	mov    0x8(%ebp),%eax
    209b:	8b 00                	mov    (%eax),%eax
    209d:	85 c0                	test   %eax,%eax
    209f:	75 32                	jne    20d3 <sem_acquire+0x4f>
        int pid;
        pid = getpid();
    20a1:	e8 f2 f7 ff ff       	call   1898 <getpid>
    20a6:	89 45 f4             	mov    %eax,-0xc(%ebp)
        add_q(&s->q, pid);
    20a9:	8b 45 08             	mov    0x8(%ebp),%eax
    20ac:	8d 50 08             	lea    0x8(%eax),%edx
    20af:	8b 45 f4             	mov    -0xc(%ebp),%eax
    20b2:	89 44 24 04          	mov    %eax,0x4(%esp)
    20b6:	89 14 24             	mov    %edx,(%esp)
    20b9:	e8 48 fe ff ff       	call   1f06 <add_q>
        lock_release(&s->lock);
    20be:	8b 45 08             	mov    0x8(%ebp),%eax
    20c1:	83 c0 04             	add    $0x4,%eax
    20c4:	89 04 24             	mov    %eax,(%esp)
    20c7:	e8 04 fd ff ff       	call   1dd0 <lock_release>
        tsleep();
    20cc:	e8 f7 f7 ff ff       	call   18c8 <tsleep>
    20d1:	eb 1b                	jmp    20ee <sem_acquire+0x6a>
    }
    else{
        s->val--;
    20d3:	8b 45 08             	mov    0x8(%ebp),%eax
    20d6:	8b 00                	mov    (%eax),%eax
    20d8:	8d 50 ff             	lea    -0x1(%eax),%edx
    20db:	8b 45 08             	mov    0x8(%ebp),%eax
    20de:	89 10                	mov    %edx,(%eax)
        lock_release(&s->lock);
    20e0:	8b 45 08             	mov    0x8(%ebp),%eax
    20e3:	83 c0 04             	add    $0x4,%eax
    20e6:	89 04 24             	mov    %eax,(%esp)
    20e9:	e8 e2 fc ff ff       	call   1dd0 <lock_release>
    }
}
    20ee:	c9                   	leave  
    20ef:	c3                   	ret    

000020f0 <sem_signal>:

// Increments the semaphore
void sem_signal(struct Semaphore* s){
    20f0:	55                   	push   %ebp
    20f1:	89 e5                	mov    %esp,%ebp
    20f3:	83 ec 18             	sub    $0x18,%esp
    lock_acquire(&s->lock);
    20f6:	8b 45 08             	mov    0x8(%ebp),%eax
    20f9:	83 c0 04             	add    $0x4,%eax
    20fc:	89 04 24             	mov    %eax,(%esp)
    20ff:	e8 ac fc ff ff       	call   1db0 <lock_acquire>

    if(!empty_q(&s->q)){
    2104:	8b 45 08             	mov    0x8(%ebp),%eax
    2107:	83 c0 08             	add    $0x8,%eax
    210a:	89 04 24             	mov    %eax,(%esp)
    210d:	e8 54 fe ff ff       	call   1f66 <empty_q>
    2112:	85 c0                	test   %eax,%eax
    2114:	75 18                	jne    212e <sem_signal+0x3e>
        twakeup(pop_q(&s->q));
    2116:	8b 45 08             	mov    0x8(%ebp),%eax
    2119:	83 c0 08             	add    $0x8,%eax
    211c:	89 04 24             	mov    %eax,(%esp)
    211f:	e8 5c fe ff ff       	call   1f80 <pop_q>
    2124:	89 04 24             	mov    %eax,(%esp)
    2127:	e8 a4 f7 ff ff       	call   18d0 <twakeup>
    212c:	eb 0d                	jmp    213b <sem_signal+0x4b>
    }
    else{
        s->val++;
    212e:	8b 45 08             	mov    0x8(%ebp),%eax
    2131:	8b 00                	mov    (%eax),%eax
    2133:	8d 50 01             	lea    0x1(%eax),%edx
    2136:	8b 45 08             	mov    0x8(%ebp),%eax
    2139:	89 10                	mov    %edx,(%eax)
    }

    lock_release(&s->lock);
    213b:	8b 45 08             	mov    0x8(%ebp),%eax
    213e:	83 c0 04             	add    $0x4,%eax
    2141:	89 04 24             	mov    %eax,(%esp)
    2144:	e8 87 fc ff ff       	call   1dd0 <lock_release>
}
    2149:	c9                   	leave  
    214a:	c3                   	ret    

0000214b <sem_dom_acquire>:

void sem_dom_acquire(struct Semaphore* s){
    214b:	55                   	push   %ebp
    214c:	89 e5                	mov    %esp,%ebp
    214e:	83 ec 18             	sub    $0x18,%esp
    lock_acquire(&s->lock);
    2151:	8b 45 08             	mov    0x8(%ebp),%eax
    2154:	83 c0 04             	add    $0x4,%eax
    2157:	89 04 24             	mov    %eax,(%esp)
    215a:	e8 51 fc ff ff       	call   1db0 <lock_acquire>

    if(s->val > 0){
    215f:	8b 45 08             	mov    0x8(%ebp),%eax
    2162:	8b 00                	mov    (%eax),%eax
    2164:	85 c0                	test   %eax,%eax
    2166:	7e 1d                	jle    2185 <sem_dom_acquire+0x3a>
        s->val--;
    2168:	8b 45 08             	mov    0x8(%ebp),%eax
    216b:	8b 00                	mov    (%eax),%eax
    216d:	8d 50 ff             	lea    -0x1(%eax),%edx
    2170:	8b 45 08             	mov    0x8(%ebp),%eax
    2173:	89 10                	mov    %edx,(%eax)
        lock_release(&s->lock);
    2175:	8b 45 08             	mov    0x8(%ebp),%eax
    2178:	83 c0 04             	add    $0x4,%eax
    217b:	89 04 24             	mov    %eax,(%esp)
    217e:	e8 4d fc ff ff       	call   1dd0 <lock_release>
        return;
    2183:	eb 2a                	jmp    21af <sem_dom_acquire+0x64>
    }

    dominant(&s->q,getpid());
    2185:	e8 0e f7 ff ff       	call   1898 <getpid>
    218a:	8b 55 08             	mov    0x8(%ebp),%edx
    218d:	83 c2 08             	add    $0x8,%edx
    2190:	89 44 24 04          	mov    %eax,0x4(%esp)
    2194:	89 14 24             	mov    %edx,(%esp)
    2197:	e8 5d fe ff ff       	call   1ff9 <dominant>
    lock_release(&s->lock);
    219c:	8b 45 08             	mov    0x8(%ebp),%eax
    219f:	83 c0 04             	add    $0x4,%eax
    21a2:	89 04 24             	mov    %eax,(%esp)
    21a5:	e8 26 fc ff ff       	call   1dd0 <lock_release>
    tsleep();
    21aa:	e8 19 f7 ff ff       	call   18c8 <tsleep>
}
    21af:	c9                   	leave  
    21b0:	c3                   	ret    
