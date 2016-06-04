
_MonkeySem:     file format elf32-i386


Disassembly of section .text:

00001000 <main>:
	lock_t lock;
} mutex;

int count = 0;

int main(){
    1000:	55                   	push   %ebp
    1001:	89 e5                	mov    %esp,%ebp
    1003:	83 e4 f0             	and    $0xfffffff0,%esp
    1006:	83 ec 30             	sub    $0x30,%esp
	sem_init(&Monkey_Go_Up, 3);
    1009:	c7 44 24 04 03 00 00 	movl   $0x3,0x4(%esp)
    1010:	00 
    1011:	c7 04 24 e4 23 00 00 	movl   $0x23e4,(%esp)
    1018:	e8 df 0c 00 00       	call   1cfc <sem_init>
	lock_init(&mutex.lock);
    101d:	c7 04 24 f8 23 00 00 	movl   $0x23f8,(%esp)
    1024:	e8 1d 0a 00 00       	call   1a46 <lock_init>

	printf(1, "Monkey Test: 1 dominant monkey and 4 monkeys...\n");
    1029:	c7 44 24 04 58 1e 00 	movl   $0x1e58,0x4(%esp)
    1030:	00 
    1031:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1038:	e8 1f 06 00 00       	call   165c <printf>
	void * thread1 = thread_create(MonkeyRdy, (void *) 0);
    103d:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1044:	00 
    1045:	c7 04 24 81 11 00 00 	movl   $0x1181,(%esp)
    104c:	e8 3e 0a 00 00       	call   1a8f <thread_create>
    1051:	89 44 24 2c          	mov    %eax,0x2c(%esp)
	if(thread1 == 0){
    1055:	83 7c 24 2c 00       	cmpl   $0x0,0x2c(%esp)
    105a:	75 19                	jne    1075 <main+0x75>
		printf(1,  "thread_create failed...\n");
    105c:	c7 44 24 04 89 1e 00 	movl   $0x1e89,0x4(%esp)
    1063:	00 
    1064:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    106b:	e8 ec 05 00 00       	call   165c <printf>
		exit();
    1070:	e8 47 04 00 00       	call   14bc <exit>
	}

	void * thread2 = thread_create(MonkeyRdy, (void *) 0);
    1075:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    107c:	00 
    107d:	c7 04 24 81 11 00 00 	movl   $0x1181,(%esp)
    1084:	e8 06 0a 00 00       	call   1a8f <thread_create>
    1089:	89 44 24 28          	mov    %eax,0x28(%esp)
	if(thread2 == 0){
    108d:	83 7c 24 28 00       	cmpl   $0x0,0x28(%esp)
    1092:	75 19                	jne    10ad <main+0xad>
		printf(1,  "thread_create failed...\n");
    1094:	c7 44 24 04 89 1e 00 	movl   $0x1e89,0x4(%esp)
    109b:	00 
    109c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    10a3:	e8 b4 05 00 00       	call   165c <printf>
		exit();
    10a8:	e8 0f 04 00 00       	call   14bc <exit>
	}

	void * thread3 = thread_create(MonkeyRdy, (void *) 0);
    10ad:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    10b4:	00 
    10b5:	c7 04 24 81 11 00 00 	movl   $0x1181,(%esp)
    10bc:	e8 ce 09 00 00       	call   1a8f <thread_create>
    10c1:	89 44 24 24          	mov    %eax,0x24(%esp)
	if(thread3 == 0){
    10c5:	83 7c 24 24 00       	cmpl   $0x0,0x24(%esp)
    10ca:	75 19                	jne    10e5 <main+0xe5>
		printf(1,  "thread_create failed...\n");
    10cc:	c7 44 24 04 89 1e 00 	movl   $0x1e89,0x4(%esp)
    10d3:	00 
    10d4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    10db:	e8 7c 05 00 00       	call   165c <printf>
		exit();
    10e0:	e8 d7 03 00 00       	call   14bc <exit>
	}

	void * thread4 = thread_create(Dom_Monkey_Rdy, (void *) 0);
    10e5:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    10ec:	00 
    10ed:	c7 04 24 dd 11 00 00 	movl   $0x11dd,(%esp)
    10f4:	e8 96 09 00 00       	call   1a8f <thread_create>
    10f9:	89 44 24 20          	mov    %eax,0x20(%esp)
	if(thread4 == 0){
    10fd:	83 7c 24 20 00       	cmpl   $0x0,0x20(%esp)
    1102:	75 19                	jne    111d <main+0x11d>
		printf(1,  "thread_create failed...\n");
    1104:	c7 44 24 04 89 1e 00 	movl   $0x1e89,0x4(%esp)
    110b:	00 
    110c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1113:	e8 44 05 00 00       	call   165c <printf>
		exit();
    1118:	e8 9f 03 00 00       	call   14bc <exit>
	}

	void * thread5 = thread_create(MonkeyRdy, (void *) 0);
    111d:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1124:	00 
    1125:	c7 04 24 81 11 00 00 	movl   $0x1181,(%esp)
    112c:	e8 5e 09 00 00       	call   1a8f <thread_create>
    1131:	89 44 24 1c          	mov    %eax,0x1c(%esp)
	if(thread5 == 0){
    1135:	83 7c 24 1c 00       	cmpl   $0x0,0x1c(%esp)
    113a:	75 19                	jne    1155 <main+0x155>
		printf(1,  "thread_create failed...\n");
    113c:	c7 44 24 04 89 1e 00 	movl   $0x1e89,0x4(%esp)
    1143:	00 
    1144:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    114b:	e8 0c 05 00 00       	call   165c <printf>
		exit();
    1150:	e8 67 03 00 00       	call   14bc <exit>
	}

	while(wait() > 0);
    1155:	90                   	nop
    1156:	e8 69 03 00 00       	call   14c4 <wait>
    115b:	85 c0                	test   %eax,%eax
    115d:	7f f7                	jg     1156 <main+0x156>
	printf(1, "Monkey climbed tree = %d\n", count);
    115f:	a1 d4 23 00 00       	mov    0x23d4,%eax
    1164:	89 44 24 08          	mov    %eax,0x8(%esp)
    1168:	c7 44 24 04 a2 1e 00 	movl   $0x1ea2,0x4(%esp)
    116f:	00 
    1170:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1177:	e8 e0 04 00 00       	call   165c <printf>

	exit();
    117c:	e8 3b 03 00 00       	call   14bc <exit>

00001181 <MonkeyRdy>:
	return 0;

}

void MonkeyRdy(void * arg_ptr){
    1181:	55                   	push   %ebp
    1182:	89 e5                	mov    %esp,%ebp
    1184:	83 ec 18             	sub    $0x18,%esp

	sem_acquire(&Monkey_Go_Up);
    1187:	c7 04 24 e4 23 00 00 	movl   $0x23e4,(%esp)
    118e:	e8 95 0b 00 00       	call   1d28 <sem_acquire>
	lock_acquire(&mutex.lock);
    1193:	c7 04 24 f8 23 00 00 	movl   $0x23f8,(%esp)
    119a:	e8 b5 08 00 00       	call   1a54 <lock_acquire>
	printf(1, "Monkey climbs up tree and grabbed a coconut.\n");
    119f:	c7 44 24 04 bc 1e 00 	movl   $0x1ebc,0x4(%esp)
    11a6:	00 
    11a7:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    11ae:	e8 a9 04 00 00       	call   165c <printf>
	count++;
    11b3:	a1 d4 23 00 00       	mov    0x23d4,%eax
    11b8:	83 c0 01             	add    $0x1,%eax
    11bb:	a3 d4 23 00 00       	mov    %eax,0x23d4
	lock_release(&mutex.lock);
    11c0:	c7 04 24 f8 23 00 00 	movl   $0x23f8,(%esp)
    11c7:	e8 a8 08 00 00       	call   1a74 <lock_release>
	sem_signal(&Monkey_Go_Up);
    11cc:	c7 04 24 e4 23 00 00 	movl   $0x23e4,(%esp)
    11d3:	e8 bc 0b 00 00       	call   1d94 <sem_signal>
	texit();
    11d8:	e8 87 03 00 00       	call   1564 <texit>

000011dd <Dom_Monkey_Rdy>:

}

void Dom_Monkey_Rdy(void * arg_ptr){
    11dd:	55                   	push   %ebp
    11de:	89 e5                	mov    %esp,%ebp
    11e0:	83 ec 18             	sub    $0x18,%esp

	lock_acquire(&mutex.lock);
    11e3:	c7 04 24 f8 23 00 00 	movl   $0x23f8,(%esp)
    11ea:	e8 65 08 00 00       	call   1a54 <lock_acquire>
	printf(1, "Dominant monkey have climbed the tree and grabbed a coconut.\n");
    11ef:	c7 44 24 04 ec 1e 00 	movl   $0x1eec,0x4(%esp)
    11f6:	00 
    11f7:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    11fe:	e8 59 04 00 00       	call   165c <printf>
	lock_release(&mutex.lock);
    1203:	c7 04 24 f8 23 00 00 	movl   $0x23f8,(%esp)
    120a:	e8 65 08 00 00       	call   1a74 <lock_release>
	sem_dom_acquire(&Monkey_Go_Up);
    120f:	c7 04 24 e4 23 00 00 	movl   $0x23e4,(%esp)
    1216:	e8 d4 0b 00 00       	call   1def <sem_dom_acquire>
	lock_acquire(&mutex.lock);
    121b:	c7 04 24 f8 23 00 00 	movl   $0x23f8,(%esp)
    1222:	e8 2d 08 00 00       	call   1a54 <lock_acquire>
	count++;
    1227:	a1 d4 23 00 00       	mov    0x23d4,%eax
    122c:	83 c0 01             	add    $0x1,%eax
    122f:	a3 d4 23 00 00       	mov    %eax,0x23d4
	lock_release(&mutex.lock);
    1234:	c7 04 24 f8 23 00 00 	movl   $0x23f8,(%esp)
    123b:	e8 34 08 00 00       	call   1a74 <lock_release>
	sem_signal(&Monkey_Go_Up);
    1240:	c7 04 24 e4 23 00 00 	movl   $0x23e4,(%esp)
    1247:	e8 48 0b 00 00       	call   1d94 <sem_signal>
	texit();
    124c:	e8 13 03 00 00       	call   1564 <texit>
    1251:	66 90                	xchg   %ax,%ax
    1253:	90                   	nop

00001254 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
    1254:	55                   	push   %ebp
    1255:	89 e5                	mov    %esp,%ebp
    1257:	57                   	push   %edi
    1258:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
    1259:	8b 4d 08             	mov    0x8(%ebp),%ecx
    125c:	8b 55 10             	mov    0x10(%ebp),%edx
    125f:	8b 45 0c             	mov    0xc(%ebp),%eax
    1262:	89 cb                	mov    %ecx,%ebx
    1264:	89 df                	mov    %ebx,%edi
    1266:	89 d1                	mov    %edx,%ecx
    1268:	fc                   	cld    
    1269:	f3 aa                	rep stos %al,%es:(%edi)
    126b:	89 ca                	mov    %ecx,%edx
    126d:	89 fb                	mov    %edi,%ebx
    126f:	89 5d 08             	mov    %ebx,0x8(%ebp)
    1272:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
    1275:	5b                   	pop    %ebx
    1276:	5f                   	pop    %edi
    1277:	5d                   	pop    %ebp
    1278:	c3                   	ret    

00001279 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
    1279:	55                   	push   %ebp
    127a:	89 e5                	mov    %esp,%ebp
    127c:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
    127f:	8b 45 08             	mov    0x8(%ebp),%eax
    1282:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
    1285:	90                   	nop
    1286:	8b 45 08             	mov    0x8(%ebp),%eax
    1289:	8d 50 01             	lea    0x1(%eax),%edx
    128c:	89 55 08             	mov    %edx,0x8(%ebp)
    128f:	8b 55 0c             	mov    0xc(%ebp),%edx
    1292:	8d 4a 01             	lea    0x1(%edx),%ecx
    1295:	89 4d 0c             	mov    %ecx,0xc(%ebp)
    1298:	0f b6 12             	movzbl (%edx),%edx
    129b:	88 10                	mov    %dl,(%eax)
    129d:	0f b6 00             	movzbl (%eax),%eax
    12a0:	84 c0                	test   %al,%al
    12a2:	75 e2                	jne    1286 <strcpy+0xd>
    ;
  return os;
    12a4:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    12a7:	c9                   	leave  
    12a8:	c3                   	ret    

000012a9 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    12a9:	55                   	push   %ebp
    12aa:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
    12ac:	eb 08                	jmp    12b6 <strcmp+0xd>
    p++, q++;
    12ae:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    12b2:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    12b6:	8b 45 08             	mov    0x8(%ebp),%eax
    12b9:	0f b6 00             	movzbl (%eax),%eax
    12bc:	84 c0                	test   %al,%al
    12be:	74 10                	je     12d0 <strcmp+0x27>
    12c0:	8b 45 08             	mov    0x8(%ebp),%eax
    12c3:	0f b6 10             	movzbl (%eax),%edx
    12c6:	8b 45 0c             	mov    0xc(%ebp),%eax
    12c9:	0f b6 00             	movzbl (%eax),%eax
    12cc:	38 c2                	cmp    %al,%dl
    12ce:	74 de                	je     12ae <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
    12d0:	8b 45 08             	mov    0x8(%ebp),%eax
    12d3:	0f b6 00             	movzbl (%eax),%eax
    12d6:	0f b6 d0             	movzbl %al,%edx
    12d9:	8b 45 0c             	mov    0xc(%ebp),%eax
    12dc:	0f b6 00             	movzbl (%eax),%eax
    12df:	0f b6 c0             	movzbl %al,%eax
    12e2:	29 c2                	sub    %eax,%edx
    12e4:	89 d0                	mov    %edx,%eax
}
    12e6:	5d                   	pop    %ebp
    12e7:	c3                   	ret    

000012e8 <strlen>:

uint
strlen(char *s)
{
    12e8:	55                   	push   %ebp
    12e9:	89 e5                	mov    %esp,%ebp
    12eb:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
    12ee:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    12f5:	eb 04                	jmp    12fb <strlen+0x13>
    12f7:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    12fb:	8b 55 fc             	mov    -0x4(%ebp),%edx
    12fe:	8b 45 08             	mov    0x8(%ebp),%eax
    1301:	01 d0                	add    %edx,%eax
    1303:	0f b6 00             	movzbl (%eax),%eax
    1306:	84 c0                	test   %al,%al
    1308:	75 ed                	jne    12f7 <strlen+0xf>
    ;
  return n;
    130a:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    130d:	c9                   	leave  
    130e:	c3                   	ret    

0000130f <memset>:

void*
memset(void *dst, int c, uint n)
{
    130f:	55                   	push   %ebp
    1310:	89 e5                	mov    %esp,%ebp
    1312:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
    1315:	8b 45 10             	mov    0x10(%ebp),%eax
    1318:	89 44 24 08          	mov    %eax,0x8(%esp)
    131c:	8b 45 0c             	mov    0xc(%ebp),%eax
    131f:	89 44 24 04          	mov    %eax,0x4(%esp)
    1323:	8b 45 08             	mov    0x8(%ebp),%eax
    1326:	89 04 24             	mov    %eax,(%esp)
    1329:	e8 26 ff ff ff       	call   1254 <stosb>
  return dst;
    132e:	8b 45 08             	mov    0x8(%ebp),%eax
}
    1331:	c9                   	leave  
    1332:	c3                   	ret    

00001333 <strchr>:

char*
strchr(const char *s, char c)
{
    1333:	55                   	push   %ebp
    1334:	89 e5                	mov    %esp,%ebp
    1336:	83 ec 04             	sub    $0x4,%esp
    1339:	8b 45 0c             	mov    0xc(%ebp),%eax
    133c:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
    133f:	eb 14                	jmp    1355 <strchr+0x22>
    if(*s == c)
    1341:	8b 45 08             	mov    0x8(%ebp),%eax
    1344:	0f b6 00             	movzbl (%eax),%eax
    1347:	3a 45 fc             	cmp    -0x4(%ebp),%al
    134a:	75 05                	jne    1351 <strchr+0x1e>
      return (char*)s;
    134c:	8b 45 08             	mov    0x8(%ebp),%eax
    134f:	eb 13                	jmp    1364 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
    1351:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    1355:	8b 45 08             	mov    0x8(%ebp),%eax
    1358:	0f b6 00             	movzbl (%eax),%eax
    135b:	84 c0                	test   %al,%al
    135d:	75 e2                	jne    1341 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
    135f:	b8 00 00 00 00       	mov    $0x0,%eax
}
    1364:	c9                   	leave  
    1365:	c3                   	ret    

00001366 <gets>:

char*
gets(char *buf, int max)
{
    1366:	55                   	push   %ebp
    1367:	89 e5                	mov    %esp,%ebp
    1369:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    136c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    1373:	eb 4c                	jmp    13c1 <gets+0x5b>
    cc = read(0, &c, 1);
    1375:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    137c:	00 
    137d:	8d 45 ef             	lea    -0x11(%ebp),%eax
    1380:	89 44 24 04          	mov    %eax,0x4(%esp)
    1384:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    138b:	e8 44 01 00 00       	call   14d4 <read>
    1390:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
    1393:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1397:	7f 02                	jg     139b <gets+0x35>
      break;
    1399:	eb 31                	jmp    13cc <gets+0x66>
    buf[i++] = c;
    139b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    139e:	8d 50 01             	lea    0x1(%eax),%edx
    13a1:	89 55 f4             	mov    %edx,-0xc(%ebp)
    13a4:	89 c2                	mov    %eax,%edx
    13a6:	8b 45 08             	mov    0x8(%ebp),%eax
    13a9:	01 c2                	add    %eax,%edx
    13ab:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    13af:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
    13b1:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    13b5:	3c 0a                	cmp    $0xa,%al
    13b7:	74 13                	je     13cc <gets+0x66>
    13b9:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    13bd:	3c 0d                	cmp    $0xd,%al
    13bf:	74 0b                	je     13cc <gets+0x66>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    13c1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    13c4:	83 c0 01             	add    $0x1,%eax
    13c7:	3b 45 0c             	cmp    0xc(%ebp),%eax
    13ca:	7c a9                	jl     1375 <gets+0xf>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    13cc:	8b 55 f4             	mov    -0xc(%ebp),%edx
    13cf:	8b 45 08             	mov    0x8(%ebp),%eax
    13d2:	01 d0                	add    %edx,%eax
    13d4:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
    13d7:	8b 45 08             	mov    0x8(%ebp),%eax
}
    13da:	c9                   	leave  
    13db:	c3                   	ret    

000013dc <stat>:

int
stat(char *n, struct stat *st)
{
    13dc:	55                   	push   %ebp
    13dd:	89 e5                	mov    %esp,%ebp
    13df:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    13e2:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    13e9:	00 
    13ea:	8b 45 08             	mov    0x8(%ebp),%eax
    13ed:	89 04 24             	mov    %eax,(%esp)
    13f0:	e8 07 01 00 00       	call   14fc <open>
    13f5:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
    13f8:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    13fc:	79 07                	jns    1405 <stat+0x29>
    return -1;
    13fe:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    1403:	eb 23                	jmp    1428 <stat+0x4c>
  r = fstat(fd, st);
    1405:	8b 45 0c             	mov    0xc(%ebp),%eax
    1408:	89 44 24 04          	mov    %eax,0x4(%esp)
    140c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    140f:	89 04 24             	mov    %eax,(%esp)
    1412:	e8 fd 00 00 00       	call   1514 <fstat>
    1417:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
    141a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    141d:	89 04 24             	mov    %eax,(%esp)
    1420:	e8 bf 00 00 00       	call   14e4 <close>
  return r;
    1425:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
    1428:	c9                   	leave  
    1429:	c3                   	ret    

0000142a <atoi>:

int
atoi(const char *s)
{
    142a:	55                   	push   %ebp
    142b:	89 e5                	mov    %esp,%ebp
    142d:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
    1430:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
    1437:	eb 25                	jmp    145e <atoi+0x34>
    n = n*10 + *s++ - '0';
    1439:	8b 55 fc             	mov    -0x4(%ebp),%edx
    143c:	89 d0                	mov    %edx,%eax
    143e:	c1 e0 02             	shl    $0x2,%eax
    1441:	01 d0                	add    %edx,%eax
    1443:	01 c0                	add    %eax,%eax
    1445:	89 c1                	mov    %eax,%ecx
    1447:	8b 45 08             	mov    0x8(%ebp),%eax
    144a:	8d 50 01             	lea    0x1(%eax),%edx
    144d:	89 55 08             	mov    %edx,0x8(%ebp)
    1450:	0f b6 00             	movzbl (%eax),%eax
    1453:	0f be c0             	movsbl %al,%eax
    1456:	01 c8                	add    %ecx,%eax
    1458:	83 e8 30             	sub    $0x30,%eax
    145b:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    145e:	8b 45 08             	mov    0x8(%ebp),%eax
    1461:	0f b6 00             	movzbl (%eax),%eax
    1464:	3c 2f                	cmp    $0x2f,%al
    1466:	7e 0a                	jle    1472 <atoi+0x48>
    1468:	8b 45 08             	mov    0x8(%ebp),%eax
    146b:	0f b6 00             	movzbl (%eax),%eax
    146e:	3c 39                	cmp    $0x39,%al
    1470:	7e c7                	jle    1439 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
    1472:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    1475:	c9                   	leave  
    1476:	c3                   	ret    

00001477 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    1477:	55                   	push   %ebp
    1478:	89 e5                	mov    %esp,%ebp
    147a:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
    147d:	8b 45 08             	mov    0x8(%ebp),%eax
    1480:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
    1483:	8b 45 0c             	mov    0xc(%ebp),%eax
    1486:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
    1489:	eb 17                	jmp    14a2 <memmove+0x2b>
    *dst++ = *src++;
    148b:	8b 45 fc             	mov    -0x4(%ebp),%eax
    148e:	8d 50 01             	lea    0x1(%eax),%edx
    1491:	89 55 fc             	mov    %edx,-0x4(%ebp)
    1494:	8b 55 f8             	mov    -0x8(%ebp),%edx
    1497:	8d 4a 01             	lea    0x1(%edx),%ecx
    149a:	89 4d f8             	mov    %ecx,-0x8(%ebp)
    149d:	0f b6 12             	movzbl (%edx),%edx
    14a0:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    14a2:	8b 45 10             	mov    0x10(%ebp),%eax
    14a5:	8d 50 ff             	lea    -0x1(%eax),%edx
    14a8:	89 55 10             	mov    %edx,0x10(%ebp)
    14ab:	85 c0                	test   %eax,%eax
    14ad:	7f dc                	jg     148b <memmove+0x14>
    *dst++ = *src++;
  return vdst;
    14af:	8b 45 08             	mov    0x8(%ebp),%eax
}
    14b2:	c9                   	leave  
    14b3:	c3                   	ret    

000014b4 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    14b4:	b8 01 00 00 00       	mov    $0x1,%eax
    14b9:	cd 40                	int    $0x40
    14bb:	c3                   	ret    

000014bc <exit>:
SYSCALL(exit)
    14bc:	b8 02 00 00 00       	mov    $0x2,%eax
    14c1:	cd 40                	int    $0x40
    14c3:	c3                   	ret    

000014c4 <wait>:
SYSCALL(wait)
    14c4:	b8 03 00 00 00       	mov    $0x3,%eax
    14c9:	cd 40                	int    $0x40
    14cb:	c3                   	ret    

000014cc <pipe>:
SYSCALL(pipe)
    14cc:	b8 04 00 00 00       	mov    $0x4,%eax
    14d1:	cd 40                	int    $0x40
    14d3:	c3                   	ret    

000014d4 <read>:
SYSCALL(read)
    14d4:	b8 05 00 00 00       	mov    $0x5,%eax
    14d9:	cd 40                	int    $0x40
    14db:	c3                   	ret    

000014dc <write>:
SYSCALL(write)
    14dc:	b8 10 00 00 00       	mov    $0x10,%eax
    14e1:	cd 40                	int    $0x40
    14e3:	c3                   	ret    

000014e4 <close>:
SYSCALL(close)
    14e4:	b8 15 00 00 00       	mov    $0x15,%eax
    14e9:	cd 40                	int    $0x40
    14eb:	c3                   	ret    

000014ec <kill>:
SYSCALL(kill)
    14ec:	b8 06 00 00 00       	mov    $0x6,%eax
    14f1:	cd 40                	int    $0x40
    14f3:	c3                   	ret    

000014f4 <exec>:
SYSCALL(exec)
    14f4:	b8 07 00 00 00       	mov    $0x7,%eax
    14f9:	cd 40                	int    $0x40
    14fb:	c3                   	ret    

000014fc <open>:
SYSCALL(open)
    14fc:	b8 0f 00 00 00       	mov    $0xf,%eax
    1501:	cd 40                	int    $0x40
    1503:	c3                   	ret    

00001504 <mknod>:
SYSCALL(mknod)
    1504:	b8 11 00 00 00       	mov    $0x11,%eax
    1509:	cd 40                	int    $0x40
    150b:	c3                   	ret    

0000150c <unlink>:
SYSCALL(unlink)
    150c:	b8 12 00 00 00       	mov    $0x12,%eax
    1511:	cd 40                	int    $0x40
    1513:	c3                   	ret    

00001514 <fstat>:
SYSCALL(fstat)
    1514:	b8 08 00 00 00       	mov    $0x8,%eax
    1519:	cd 40                	int    $0x40
    151b:	c3                   	ret    

0000151c <link>:
SYSCALL(link)
    151c:	b8 13 00 00 00       	mov    $0x13,%eax
    1521:	cd 40                	int    $0x40
    1523:	c3                   	ret    

00001524 <mkdir>:
SYSCALL(mkdir)
    1524:	b8 14 00 00 00       	mov    $0x14,%eax
    1529:	cd 40                	int    $0x40
    152b:	c3                   	ret    

0000152c <chdir>:
SYSCALL(chdir)
    152c:	b8 09 00 00 00       	mov    $0x9,%eax
    1531:	cd 40                	int    $0x40
    1533:	c3                   	ret    

00001534 <dup>:
SYSCALL(dup)
    1534:	b8 0a 00 00 00       	mov    $0xa,%eax
    1539:	cd 40                	int    $0x40
    153b:	c3                   	ret    

0000153c <getpid>:
SYSCALL(getpid)
    153c:	b8 0b 00 00 00       	mov    $0xb,%eax
    1541:	cd 40                	int    $0x40
    1543:	c3                   	ret    

00001544 <sbrk>:
SYSCALL(sbrk)
    1544:	b8 0c 00 00 00       	mov    $0xc,%eax
    1549:	cd 40                	int    $0x40
    154b:	c3                   	ret    

0000154c <sleep>:
SYSCALL(sleep)
    154c:	b8 0d 00 00 00       	mov    $0xd,%eax
    1551:	cd 40                	int    $0x40
    1553:	c3                   	ret    

00001554 <uptime>:
SYSCALL(uptime)
    1554:	b8 0e 00 00 00       	mov    $0xe,%eax
    1559:	cd 40                	int    $0x40
    155b:	c3                   	ret    

0000155c <clone>:
SYSCALL(clone)
    155c:	b8 16 00 00 00       	mov    $0x16,%eax
    1561:	cd 40                	int    $0x40
    1563:	c3                   	ret    

00001564 <texit>:
SYSCALL(texit)
    1564:	b8 17 00 00 00       	mov    $0x17,%eax
    1569:	cd 40                	int    $0x40
    156b:	c3                   	ret    

0000156c <tsleep>:
SYSCALL(tsleep)
    156c:	b8 18 00 00 00       	mov    $0x18,%eax
    1571:	cd 40                	int    $0x40
    1573:	c3                   	ret    

00001574 <twakeup>:
SYSCALL(twakeup)
    1574:	b8 19 00 00 00       	mov    $0x19,%eax
    1579:	cd 40                	int    $0x40
    157b:	c3                   	ret    

0000157c <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
    157c:	55                   	push   %ebp
    157d:	89 e5                	mov    %esp,%ebp
    157f:	83 ec 18             	sub    $0x18,%esp
    1582:	8b 45 0c             	mov    0xc(%ebp),%eax
    1585:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
    1588:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    158f:	00 
    1590:	8d 45 f4             	lea    -0xc(%ebp),%eax
    1593:	89 44 24 04          	mov    %eax,0x4(%esp)
    1597:	8b 45 08             	mov    0x8(%ebp),%eax
    159a:	89 04 24             	mov    %eax,(%esp)
    159d:	e8 3a ff ff ff       	call   14dc <write>
}
    15a2:	c9                   	leave  
    15a3:	c3                   	ret    

000015a4 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
    15a4:	55                   	push   %ebp
    15a5:	89 e5                	mov    %esp,%ebp
    15a7:	56                   	push   %esi
    15a8:	53                   	push   %ebx
    15a9:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    15ac:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
    15b3:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
    15b7:	74 17                	je     15d0 <printint+0x2c>
    15b9:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    15bd:	79 11                	jns    15d0 <printint+0x2c>
    neg = 1;
    15bf:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
    15c6:	8b 45 0c             	mov    0xc(%ebp),%eax
    15c9:	f7 d8                	neg    %eax
    15cb:	89 45 ec             	mov    %eax,-0x14(%ebp)
    15ce:	eb 06                	jmp    15d6 <printint+0x32>
  } else {
    x = xx;
    15d0:	8b 45 0c             	mov    0xc(%ebp),%eax
    15d3:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
    15d6:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
    15dd:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    15e0:	8d 41 01             	lea    0x1(%ecx),%eax
    15e3:	89 45 f4             	mov    %eax,-0xc(%ebp)
    15e6:	8b 5d 10             	mov    0x10(%ebp),%ebx
    15e9:	8b 45 ec             	mov    -0x14(%ebp),%eax
    15ec:	ba 00 00 00 00       	mov    $0x0,%edx
    15f1:	f7 f3                	div    %ebx
    15f3:	89 d0                	mov    %edx,%eax
    15f5:	0f b6 80 bc 23 00 00 	movzbl 0x23bc(%eax),%eax
    15fc:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
    1600:	8b 75 10             	mov    0x10(%ebp),%esi
    1603:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1606:	ba 00 00 00 00       	mov    $0x0,%edx
    160b:	f7 f6                	div    %esi
    160d:	89 45 ec             	mov    %eax,-0x14(%ebp)
    1610:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1614:	75 c7                	jne    15dd <printint+0x39>
  if(neg)
    1616:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    161a:	74 10                	je     162c <printint+0x88>
    buf[i++] = '-';
    161c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    161f:	8d 50 01             	lea    0x1(%eax),%edx
    1622:	89 55 f4             	mov    %edx,-0xc(%ebp)
    1625:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
    162a:	eb 1f                	jmp    164b <printint+0xa7>
    162c:	eb 1d                	jmp    164b <printint+0xa7>
    putc(fd, buf[i]);
    162e:	8d 55 dc             	lea    -0x24(%ebp),%edx
    1631:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1634:	01 d0                	add    %edx,%eax
    1636:	0f b6 00             	movzbl (%eax),%eax
    1639:	0f be c0             	movsbl %al,%eax
    163c:	89 44 24 04          	mov    %eax,0x4(%esp)
    1640:	8b 45 08             	mov    0x8(%ebp),%eax
    1643:	89 04 24             	mov    %eax,(%esp)
    1646:	e8 31 ff ff ff       	call   157c <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    164b:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    164f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1653:	79 d9                	jns    162e <printint+0x8a>
    putc(fd, buf[i]);
}
    1655:	83 c4 30             	add    $0x30,%esp
    1658:	5b                   	pop    %ebx
    1659:	5e                   	pop    %esi
    165a:	5d                   	pop    %ebp
    165b:	c3                   	ret    

0000165c <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    165c:	55                   	push   %ebp
    165d:	89 e5                	mov    %esp,%ebp
    165f:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
    1662:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
    1669:	8d 45 0c             	lea    0xc(%ebp),%eax
    166c:	83 c0 04             	add    $0x4,%eax
    166f:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
    1672:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    1679:	e9 7c 01 00 00       	jmp    17fa <printf+0x19e>
    c = fmt[i] & 0xff;
    167e:	8b 55 0c             	mov    0xc(%ebp),%edx
    1681:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1684:	01 d0                	add    %edx,%eax
    1686:	0f b6 00             	movzbl (%eax),%eax
    1689:	0f be c0             	movsbl %al,%eax
    168c:	25 ff 00 00 00       	and    $0xff,%eax
    1691:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
    1694:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1698:	75 2c                	jne    16c6 <printf+0x6a>
      if(c == '%'){
    169a:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    169e:	75 0c                	jne    16ac <printf+0x50>
        state = '%';
    16a0:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
    16a7:	e9 4a 01 00 00       	jmp    17f6 <printf+0x19a>
      } else {
        putc(fd, c);
    16ac:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    16af:	0f be c0             	movsbl %al,%eax
    16b2:	89 44 24 04          	mov    %eax,0x4(%esp)
    16b6:	8b 45 08             	mov    0x8(%ebp),%eax
    16b9:	89 04 24             	mov    %eax,(%esp)
    16bc:	e8 bb fe ff ff       	call   157c <putc>
    16c1:	e9 30 01 00 00       	jmp    17f6 <printf+0x19a>
      }
    } else if(state == '%'){
    16c6:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
    16ca:	0f 85 26 01 00 00    	jne    17f6 <printf+0x19a>
      if(c == 'd'){
    16d0:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
    16d4:	75 2d                	jne    1703 <printf+0xa7>
        printint(fd, *ap, 10, 1);
    16d6:	8b 45 e8             	mov    -0x18(%ebp),%eax
    16d9:	8b 00                	mov    (%eax),%eax
    16db:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    16e2:	00 
    16e3:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
    16ea:	00 
    16eb:	89 44 24 04          	mov    %eax,0x4(%esp)
    16ef:	8b 45 08             	mov    0x8(%ebp),%eax
    16f2:	89 04 24             	mov    %eax,(%esp)
    16f5:	e8 aa fe ff ff       	call   15a4 <printint>
        ap++;
    16fa:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    16fe:	e9 ec 00 00 00       	jmp    17ef <printf+0x193>
      } else if(c == 'x' || c == 'p'){
    1703:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
    1707:	74 06                	je     170f <printf+0xb3>
    1709:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
    170d:	75 2d                	jne    173c <printf+0xe0>
        printint(fd, *ap, 16, 0);
    170f:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1712:	8b 00                	mov    (%eax),%eax
    1714:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    171b:	00 
    171c:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
    1723:	00 
    1724:	89 44 24 04          	mov    %eax,0x4(%esp)
    1728:	8b 45 08             	mov    0x8(%ebp),%eax
    172b:	89 04 24             	mov    %eax,(%esp)
    172e:	e8 71 fe ff ff       	call   15a4 <printint>
        ap++;
    1733:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    1737:	e9 b3 00 00 00       	jmp    17ef <printf+0x193>
      } else if(c == 's'){
    173c:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
    1740:	75 45                	jne    1787 <printf+0x12b>
        s = (char*)*ap;
    1742:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1745:	8b 00                	mov    (%eax),%eax
    1747:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
    174a:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
    174e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1752:	75 09                	jne    175d <printf+0x101>
          s = "(null)";
    1754:	c7 45 f4 2a 1f 00 00 	movl   $0x1f2a,-0xc(%ebp)
        while(*s != 0){
    175b:	eb 1e                	jmp    177b <printf+0x11f>
    175d:	eb 1c                	jmp    177b <printf+0x11f>
          putc(fd, *s);
    175f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1762:	0f b6 00             	movzbl (%eax),%eax
    1765:	0f be c0             	movsbl %al,%eax
    1768:	89 44 24 04          	mov    %eax,0x4(%esp)
    176c:	8b 45 08             	mov    0x8(%ebp),%eax
    176f:	89 04 24             	mov    %eax,(%esp)
    1772:	e8 05 fe ff ff       	call   157c <putc>
          s++;
    1777:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    177b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    177e:	0f b6 00             	movzbl (%eax),%eax
    1781:	84 c0                	test   %al,%al
    1783:	75 da                	jne    175f <printf+0x103>
    1785:	eb 68                	jmp    17ef <printf+0x193>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    1787:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
    178b:	75 1d                	jne    17aa <printf+0x14e>
        putc(fd, *ap);
    178d:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1790:	8b 00                	mov    (%eax),%eax
    1792:	0f be c0             	movsbl %al,%eax
    1795:	89 44 24 04          	mov    %eax,0x4(%esp)
    1799:	8b 45 08             	mov    0x8(%ebp),%eax
    179c:	89 04 24             	mov    %eax,(%esp)
    179f:	e8 d8 fd ff ff       	call   157c <putc>
        ap++;
    17a4:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    17a8:	eb 45                	jmp    17ef <printf+0x193>
      } else if(c == '%'){
    17aa:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    17ae:	75 17                	jne    17c7 <printf+0x16b>
        putc(fd, c);
    17b0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    17b3:	0f be c0             	movsbl %al,%eax
    17b6:	89 44 24 04          	mov    %eax,0x4(%esp)
    17ba:	8b 45 08             	mov    0x8(%ebp),%eax
    17bd:	89 04 24             	mov    %eax,(%esp)
    17c0:	e8 b7 fd ff ff       	call   157c <putc>
    17c5:	eb 28                	jmp    17ef <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
    17c7:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
    17ce:	00 
    17cf:	8b 45 08             	mov    0x8(%ebp),%eax
    17d2:	89 04 24             	mov    %eax,(%esp)
    17d5:	e8 a2 fd ff ff       	call   157c <putc>
        putc(fd, c);
    17da:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    17dd:	0f be c0             	movsbl %al,%eax
    17e0:	89 44 24 04          	mov    %eax,0x4(%esp)
    17e4:	8b 45 08             	mov    0x8(%ebp),%eax
    17e7:	89 04 24             	mov    %eax,(%esp)
    17ea:	e8 8d fd ff ff       	call   157c <putc>
      }
      state = 0;
    17ef:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    17f6:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    17fa:	8b 55 0c             	mov    0xc(%ebp),%edx
    17fd:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1800:	01 d0                	add    %edx,%eax
    1802:	0f b6 00             	movzbl (%eax),%eax
    1805:	84 c0                	test   %al,%al
    1807:	0f 85 71 fe ff ff    	jne    167e <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    180d:	c9                   	leave  
    180e:	c3                   	ret    
    180f:	90                   	nop

00001810 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    1810:	55                   	push   %ebp
    1811:	89 e5                	mov    %esp,%ebp
    1813:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
    1816:	8b 45 08             	mov    0x8(%ebp),%eax
    1819:	83 e8 08             	sub    $0x8,%eax
    181c:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    181f:	a1 e0 23 00 00       	mov    0x23e0,%eax
    1824:	89 45 fc             	mov    %eax,-0x4(%ebp)
    1827:	eb 24                	jmp    184d <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1829:	8b 45 fc             	mov    -0x4(%ebp),%eax
    182c:	8b 00                	mov    (%eax),%eax
    182e:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    1831:	77 12                	ja     1845 <free+0x35>
    1833:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1836:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    1839:	77 24                	ja     185f <free+0x4f>
    183b:	8b 45 fc             	mov    -0x4(%ebp),%eax
    183e:	8b 00                	mov    (%eax),%eax
    1840:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    1843:	77 1a                	ja     185f <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1845:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1848:	8b 00                	mov    (%eax),%eax
    184a:	89 45 fc             	mov    %eax,-0x4(%ebp)
    184d:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1850:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    1853:	76 d4                	jbe    1829 <free+0x19>
    1855:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1858:	8b 00                	mov    (%eax),%eax
    185a:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    185d:	76 ca                	jbe    1829 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    185f:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1862:	8b 40 04             	mov    0x4(%eax),%eax
    1865:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    186c:	8b 45 f8             	mov    -0x8(%ebp),%eax
    186f:	01 c2                	add    %eax,%edx
    1871:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1874:	8b 00                	mov    (%eax),%eax
    1876:	39 c2                	cmp    %eax,%edx
    1878:	75 24                	jne    189e <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
    187a:	8b 45 f8             	mov    -0x8(%ebp),%eax
    187d:	8b 50 04             	mov    0x4(%eax),%edx
    1880:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1883:	8b 00                	mov    (%eax),%eax
    1885:	8b 40 04             	mov    0x4(%eax),%eax
    1888:	01 c2                	add    %eax,%edx
    188a:	8b 45 f8             	mov    -0x8(%ebp),%eax
    188d:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
    1890:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1893:	8b 00                	mov    (%eax),%eax
    1895:	8b 10                	mov    (%eax),%edx
    1897:	8b 45 f8             	mov    -0x8(%ebp),%eax
    189a:	89 10                	mov    %edx,(%eax)
    189c:	eb 0a                	jmp    18a8 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
    189e:	8b 45 fc             	mov    -0x4(%ebp),%eax
    18a1:	8b 10                	mov    (%eax),%edx
    18a3:	8b 45 f8             	mov    -0x8(%ebp),%eax
    18a6:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
    18a8:	8b 45 fc             	mov    -0x4(%ebp),%eax
    18ab:	8b 40 04             	mov    0x4(%eax),%eax
    18ae:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    18b5:	8b 45 fc             	mov    -0x4(%ebp),%eax
    18b8:	01 d0                	add    %edx,%eax
    18ba:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    18bd:	75 20                	jne    18df <free+0xcf>
    p->s.size += bp->s.size;
    18bf:	8b 45 fc             	mov    -0x4(%ebp),%eax
    18c2:	8b 50 04             	mov    0x4(%eax),%edx
    18c5:	8b 45 f8             	mov    -0x8(%ebp),%eax
    18c8:	8b 40 04             	mov    0x4(%eax),%eax
    18cb:	01 c2                	add    %eax,%edx
    18cd:	8b 45 fc             	mov    -0x4(%ebp),%eax
    18d0:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    18d3:	8b 45 f8             	mov    -0x8(%ebp),%eax
    18d6:	8b 10                	mov    (%eax),%edx
    18d8:	8b 45 fc             	mov    -0x4(%ebp),%eax
    18db:	89 10                	mov    %edx,(%eax)
    18dd:	eb 08                	jmp    18e7 <free+0xd7>
  } else
    p->s.ptr = bp;
    18df:	8b 45 fc             	mov    -0x4(%ebp),%eax
    18e2:	8b 55 f8             	mov    -0x8(%ebp),%edx
    18e5:	89 10                	mov    %edx,(%eax)
  freep = p;
    18e7:	8b 45 fc             	mov    -0x4(%ebp),%eax
    18ea:	a3 e0 23 00 00       	mov    %eax,0x23e0
}
    18ef:	c9                   	leave  
    18f0:	c3                   	ret    

000018f1 <morecore>:

static Header*
morecore(uint nu)
{
    18f1:	55                   	push   %ebp
    18f2:	89 e5                	mov    %esp,%ebp
    18f4:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
    18f7:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
    18fe:	77 07                	ja     1907 <morecore+0x16>
    nu = 4096;
    1900:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
    1907:	8b 45 08             	mov    0x8(%ebp),%eax
    190a:	c1 e0 03             	shl    $0x3,%eax
    190d:	89 04 24             	mov    %eax,(%esp)
    1910:	e8 2f fc ff ff       	call   1544 <sbrk>
    1915:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
    1918:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
    191c:	75 07                	jne    1925 <morecore+0x34>
    return 0;
    191e:	b8 00 00 00 00       	mov    $0x0,%eax
    1923:	eb 22                	jmp    1947 <morecore+0x56>
  hp = (Header*)p;
    1925:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1928:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
    192b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    192e:	8b 55 08             	mov    0x8(%ebp),%edx
    1931:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
    1934:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1937:	83 c0 08             	add    $0x8,%eax
    193a:	89 04 24             	mov    %eax,(%esp)
    193d:	e8 ce fe ff ff       	call   1810 <free>
  return freep;
    1942:	a1 e0 23 00 00       	mov    0x23e0,%eax
}
    1947:	c9                   	leave  
    1948:	c3                   	ret    

00001949 <malloc>:

void*
malloc(uint nbytes)
{
    1949:	55                   	push   %ebp
    194a:	89 e5                	mov    %esp,%ebp
    194c:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    194f:	8b 45 08             	mov    0x8(%ebp),%eax
    1952:	83 c0 07             	add    $0x7,%eax
    1955:	c1 e8 03             	shr    $0x3,%eax
    1958:	83 c0 01             	add    $0x1,%eax
    195b:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
    195e:	a1 e0 23 00 00       	mov    0x23e0,%eax
    1963:	89 45 f0             	mov    %eax,-0x10(%ebp)
    1966:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    196a:	75 23                	jne    198f <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
    196c:	c7 45 f0 d8 23 00 00 	movl   $0x23d8,-0x10(%ebp)
    1973:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1976:	a3 e0 23 00 00       	mov    %eax,0x23e0
    197b:	a1 e0 23 00 00       	mov    0x23e0,%eax
    1980:	a3 d8 23 00 00       	mov    %eax,0x23d8
    base.s.size = 0;
    1985:	c7 05 dc 23 00 00 00 	movl   $0x0,0x23dc
    198c:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    198f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1992:	8b 00                	mov    (%eax),%eax
    1994:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
    1997:	8b 45 f4             	mov    -0xc(%ebp),%eax
    199a:	8b 40 04             	mov    0x4(%eax),%eax
    199d:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    19a0:	72 4d                	jb     19ef <malloc+0xa6>
      if(p->s.size == nunits)
    19a2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    19a5:	8b 40 04             	mov    0x4(%eax),%eax
    19a8:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    19ab:	75 0c                	jne    19b9 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
    19ad:	8b 45 f4             	mov    -0xc(%ebp),%eax
    19b0:	8b 10                	mov    (%eax),%edx
    19b2:	8b 45 f0             	mov    -0x10(%ebp),%eax
    19b5:	89 10                	mov    %edx,(%eax)
    19b7:	eb 26                	jmp    19df <malloc+0x96>
      else {
        p->s.size -= nunits;
    19b9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    19bc:	8b 40 04             	mov    0x4(%eax),%eax
    19bf:	2b 45 ec             	sub    -0x14(%ebp),%eax
    19c2:	89 c2                	mov    %eax,%edx
    19c4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    19c7:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
    19ca:	8b 45 f4             	mov    -0xc(%ebp),%eax
    19cd:	8b 40 04             	mov    0x4(%eax),%eax
    19d0:	c1 e0 03             	shl    $0x3,%eax
    19d3:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
    19d6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    19d9:	8b 55 ec             	mov    -0x14(%ebp),%edx
    19dc:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
    19df:	8b 45 f0             	mov    -0x10(%ebp),%eax
    19e2:	a3 e0 23 00 00       	mov    %eax,0x23e0
      return (void*)(p + 1);
    19e7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    19ea:	83 c0 08             	add    $0x8,%eax
    19ed:	eb 38                	jmp    1a27 <malloc+0xde>
    }
    if(p == freep)
    19ef:	a1 e0 23 00 00       	mov    0x23e0,%eax
    19f4:	39 45 f4             	cmp    %eax,-0xc(%ebp)
    19f7:	75 1b                	jne    1a14 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
    19f9:	8b 45 ec             	mov    -0x14(%ebp),%eax
    19fc:	89 04 24             	mov    %eax,(%esp)
    19ff:	e8 ed fe ff ff       	call   18f1 <morecore>
    1a04:	89 45 f4             	mov    %eax,-0xc(%ebp)
    1a07:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1a0b:	75 07                	jne    1a14 <malloc+0xcb>
        return 0;
    1a0d:	b8 00 00 00 00       	mov    $0x0,%eax
    1a12:	eb 13                	jmp    1a27 <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1a14:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1a17:	89 45 f0             	mov    %eax,-0x10(%ebp)
    1a1a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1a1d:	8b 00                	mov    (%eax),%eax
    1a1f:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
    1a22:	e9 70 ff ff ff       	jmp    1997 <malloc+0x4e>
}
    1a27:	c9                   	leave  
    1a28:	c3                   	ret    
    1a29:	66 90                	xchg   %ax,%ax
    1a2b:	90                   	nop

00001a2c <xchg>:
  asm volatile("sti");
}

static inline uint
xchg(volatile uint *addr, uint newval)
{
    1a2c:	55                   	push   %ebp
    1a2d:	89 e5                	mov    %esp,%ebp
    1a2f:	83 ec 10             	sub    $0x10,%esp
  uint result;
  
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
    1a32:	8b 55 08             	mov    0x8(%ebp),%edx
    1a35:	8b 45 0c             	mov    0xc(%ebp),%eax
    1a38:	8b 4d 08             	mov    0x8(%ebp),%ecx
    1a3b:	f0 87 02             	lock xchg %eax,(%edx)
    1a3e:	89 45 fc             	mov    %eax,-0x4(%ebp)
               "+m" (*addr), "=a" (result) :
               "1" (newval) :
               "cc");
  return result;
    1a41:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    1a44:	c9                   	leave  
    1a45:	c3                   	ret    

00001a46 <lock_init>:
#include "x86.h"
#include "proc.h"

unsigned long rands = 1;

void lock_init(lock_t *lock){
    1a46:	55                   	push   %ebp
    1a47:	89 e5                	mov    %esp,%ebp
    lock->locked = 0;
    1a49:	8b 45 08             	mov    0x8(%ebp),%eax
    1a4c:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
    1a52:	5d                   	pop    %ebp
    1a53:	c3                   	ret    

00001a54 <lock_acquire>:
void lock_acquire(lock_t *lock){
    1a54:	55                   	push   %ebp
    1a55:	89 e5                	mov    %esp,%ebp
    1a57:	83 ec 08             	sub    $0x8,%esp
    while(xchg(&lock->locked,1) != 0);
    1a5a:	90                   	nop
    1a5b:	8b 45 08             	mov    0x8(%ebp),%eax
    1a5e:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
    1a65:	00 
    1a66:	89 04 24             	mov    %eax,(%esp)
    1a69:	e8 be ff ff ff       	call   1a2c <xchg>
    1a6e:	85 c0                	test   %eax,%eax
    1a70:	75 e9                	jne    1a5b <lock_acquire+0x7>
}
    1a72:	c9                   	leave  
    1a73:	c3                   	ret    

00001a74 <lock_release>:
void lock_release(lock_t *lock){
    1a74:	55                   	push   %ebp
    1a75:	89 e5                	mov    %esp,%ebp
    1a77:	83 ec 08             	sub    $0x8,%esp
    xchg(&lock->locked,0);
    1a7a:	8b 45 08             	mov    0x8(%ebp),%eax
    1a7d:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1a84:	00 
    1a85:	89 04 24             	mov    %eax,(%esp)
    1a88:	e8 9f ff ff ff       	call   1a2c <xchg>
}
    1a8d:	c9                   	leave  
    1a8e:	c3                   	ret    

00001a8f <thread_create>:


void *thread_create(void(*start_routine)(void*), void *arg){
    1a8f:	55                   	push   %ebp
    1a90:	89 e5                	mov    %esp,%ebp
    1a92:	83 ec 28             	sub    $0x28,%esp
    int tid;
    void * stack = malloc(2 * 4096);
    1a95:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
    1a9c:	e8 a8 fe ff ff       	call   1949 <malloc>
    1aa1:	89 45 f4             	mov    %eax,-0xc(%ebp)
    void *garbage_stack = stack; 
    1aa4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1aa7:	89 45 f0             	mov    %eax,-0x10(%ebp)
   // printf(1,"start routine addr : %d\n",(uint)start_routine);


    if((uint)stack % 4096){
    1aaa:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1aad:	25 ff 0f 00 00       	and    $0xfff,%eax
    1ab2:	85 c0                	test   %eax,%eax
    1ab4:	74 14                	je     1aca <thread_create+0x3b>
        stack = stack + (4096 - (uint)stack % 4096);
    1ab6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1ab9:	25 ff 0f 00 00       	and    $0xfff,%eax
    1abe:	89 c2                	mov    %eax,%edx
    1ac0:	b8 00 10 00 00       	mov    $0x1000,%eax
    1ac5:	29 d0                	sub    %edx,%eax
    1ac7:	01 45 f4             	add    %eax,-0xc(%ebp)
    }
    if (stack == 0){
    1aca:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1ace:	75 1b                	jne    1aeb <thread_create+0x5c>

        printf(1,"malloc fail \n");
    1ad0:	c7 44 24 04 31 1f 00 	movl   $0x1f31,0x4(%esp)
    1ad7:	00 
    1ad8:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1adf:	e8 78 fb ff ff       	call   165c <printf>
        return 0;
    1ae4:	b8 00 00 00 00       	mov    $0x0,%eax
    1ae9:	eb 6f                	jmp    1b5a <thread_create+0xcb>
    }

    tid = clone((uint)stack,PSIZE,(uint)start_routine,(int)arg);
    1aeb:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    1aee:	8b 55 08             	mov    0x8(%ebp),%edx
    1af1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1af4:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
    1af8:	89 54 24 08          	mov    %edx,0x8(%esp)
    1afc:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
    1b03:	00 
    1b04:	89 04 24             	mov    %eax,(%esp)
    1b07:	e8 50 fa ff ff       	call   155c <clone>
    1b0c:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(tid < 0){
    1b0f:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1b13:	79 1b                	jns    1b30 <thread_create+0xa1>
        printf(1,"clone fails\n");
    1b15:	c7 44 24 04 3f 1f 00 	movl   $0x1f3f,0x4(%esp)
    1b1c:	00 
    1b1d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1b24:	e8 33 fb ff ff       	call   165c <printf>
        return 0;
    1b29:	b8 00 00 00 00       	mov    $0x0,%eax
    1b2e:	eb 2a                	jmp    1b5a <thread_create+0xcb>
    }
    if(tid > 0){
    1b30:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1b34:	7e 05                	jle    1b3b <thread_create+0xac>
        //store threads on thread table
        return garbage_stack;
    1b36:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1b39:	eb 1f                	jmp    1b5a <thread_create+0xcb>
    }
    if(tid == 0){
    1b3b:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1b3f:	75 14                	jne    1b55 <thread_create+0xc6>
        printf(1,"tid = 0 return \n");
    1b41:	c7 44 24 04 4c 1f 00 	movl   $0x1f4c,0x4(%esp)
    1b48:	00 
    1b49:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1b50:	e8 07 fb ff ff       	call   165c <printf>
    }
//    wait();
//    free(garbage_stack);

    return 0;
    1b55:	b8 00 00 00 00       	mov    $0x0,%eax
}
    1b5a:	c9                   	leave  
    1b5b:	c3                   	ret    

00001b5c <random>:

// generate 0 -> max random number exclude max.
int random(int max){
    1b5c:	55                   	push   %ebp
    1b5d:	89 e5                	mov    %esp,%ebp
    rands = rands * 1664525 + 1013904233;
    1b5f:	a1 d0 23 00 00       	mov    0x23d0,%eax
    1b64:	69 c0 0d 66 19 00    	imul   $0x19660d,%eax,%eax
    1b6a:	05 69 f3 6e 3c       	add    $0x3c6ef369,%eax
    1b6f:	a3 d0 23 00 00       	mov    %eax,0x23d0
    return (int)(rands % max);
    1b74:	a1 d0 23 00 00       	mov    0x23d0,%eax
    1b79:	8b 4d 08             	mov    0x8(%ebp),%ecx
    1b7c:	ba 00 00 00 00       	mov    $0x0,%edx
    1b81:	f7 f1                	div    %ecx
    1b83:	89 d0                	mov    %edx,%eax
}
    1b85:	5d                   	pop    %ebp
    1b86:	c3                   	ret    
    1b87:	90                   	nop

00001b88 <init_q>:
#include "queue.h"
#include "types.h"
#include "user.h"

void init_q(struct queue *q){
    1b88:	55                   	push   %ebp
    1b89:	89 e5                	mov    %esp,%ebp
    q->size = 0;
    1b8b:	8b 45 08             	mov    0x8(%ebp),%eax
    1b8e:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    q->head = 0;
    1b94:	8b 45 08             	mov    0x8(%ebp),%eax
    1b97:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    q->tail = 0;
    1b9e:	8b 45 08             	mov    0x8(%ebp),%eax
    1ba1:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
}
    1ba8:	5d                   	pop    %ebp
    1ba9:	c3                   	ret    

00001baa <add_q>:

void add_q(struct queue *q, int v){
    1baa:	55                   	push   %ebp
    1bab:	89 e5                	mov    %esp,%ebp
    1bad:	83 ec 28             	sub    $0x28,%esp
    struct node * n = malloc(sizeof(struct node));
    1bb0:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
    1bb7:	e8 8d fd ff ff       	call   1949 <malloc>
    1bbc:	89 45 f4             	mov    %eax,-0xc(%ebp)
    n->next = 0;
    1bbf:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1bc2:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    n->value = v;
    1bc9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1bcc:	8b 55 0c             	mov    0xc(%ebp),%edx
    1bcf:	89 10                	mov    %edx,(%eax)
    if(q->head == 0){
    1bd1:	8b 45 08             	mov    0x8(%ebp),%eax
    1bd4:	8b 40 04             	mov    0x4(%eax),%eax
    1bd7:	85 c0                	test   %eax,%eax
    1bd9:	75 0b                	jne    1be6 <add_q+0x3c>
        q->head = n;
    1bdb:	8b 45 08             	mov    0x8(%ebp),%eax
    1bde:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1be1:	89 50 04             	mov    %edx,0x4(%eax)
    1be4:	eb 0c                	jmp    1bf2 <add_q+0x48>
    }else{
        q->tail->next = n;
    1be6:	8b 45 08             	mov    0x8(%ebp),%eax
    1be9:	8b 40 08             	mov    0x8(%eax),%eax
    1bec:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1bef:	89 50 04             	mov    %edx,0x4(%eax)
    }
    q->tail = n;
    1bf2:	8b 45 08             	mov    0x8(%ebp),%eax
    1bf5:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1bf8:	89 50 08             	mov    %edx,0x8(%eax)
    q->size++;
    1bfb:	8b 45 08             	mov    0x8(%ebp),%eax
    1bfe:	8b 00                	mov    (%eax),%eax
    1c00:	8d 50 01             	lea    0x1(%eax),%edx
    1c03:	8b 45 08             	mov    0x8(%ebp),%eax
    1c06:	89 10                	mov    %edx,(%eax)
}
    1c08:	c9                   	leave  
    1c09:	c3                   	ret    

00001c0a <empty_q>:

int empty_q(struct queue *q){
    1c0a:	55                   	push   %ebp
    1c0b:	89 e5                	mov    %esp,%ebp
    if(q->size == 0)
    1c0d:	8b 45 08             	mov    0x8(%ebp),%eax
    1c10:	8b 00                	mov    (%eax),%eax
    1c12:	85 c0                	test   %eax,%eax
    1c14:	75 07                	jne    1c1d <empty_q+0x13>
        return 1;
    1c16:	b8 01 00 00 00       	mov    $0x1,%eax
    1c1b:	eb 05                	jmp    1c22 <empty_q+0x18>
    else
        return 0;
    1c1d:	b8 00 00 00 00       	mov    $0x0,%eax
} 
    1c22:	5d                   	pop    %ebp
    1c23:	c3                   	ret    

00001c24 <pop_q>:
int pop_q(struct queue *q){
    1c24:	55                   	push   %ebp
    1c25:	89 e5                	mov    %esp,%ebp
    1c27:	83 ec 28             	sub    $0x28,%esp
    int val;
    struct node *destroy;
    if(!empty_q(q)){
    1c2a:	8b 45 08             	mov    0x8(%ebp),%eax
    1c2d:	89 04 24             	mov    %eax,(%esp)
    1c30:	e8 d5 ff ff ff       	call   1c0a <empty_q>
    1c35:	85 c0                	test   %eax,%eax
    1c37:	75 5d                	jne    1c96 <pop_q+0x72>
       val = q->head->value; 
    1c39:	8b 45 08             	mov    0x8(%ebp),%eax
    1c3c:	8b 40 04             	mov    0x4(%eax),%eax
    1c3f:	8b 00                	mov    (%eax),%eax
    1c41:	89 45 f4             	mov    %eax,-0xc(%ebp)
       destroy = q->head;
    1c44:	8b 45 08             	mov    0x8(%ebp),%eax
    1c47:	8b 40 04             	mov    0x4(%eax),%eax
    1c4a:	89 45 f0             	mov    %eax,-0x10(%ebp)
       q->head = q->head->next;
    1c4d:	8b 45 08             	mov    0x8(%ebp),%eax
    1c50:	8b 40 04             	mov    0x4(%eax),%eax
    1c53:	8b 50 04             	mov    0x4(%eax),%edx
    1c56:	8b 45 08             	mov    0x8(%ebp),%eax
    1c59:	89 50 04             	mov    %edx,0x4(%eax)
       free(destroy);
    1c5c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1c5f:	89 04 24             	mov    %eax,(%esp)
    1c62:	e8 a9 fb ff ff       	call   1810 <free>
       q->size--;
    1c67:	8b 45 08             	mov    0x8(%ebp),%eax
    1c6a:	8b 00                	mov    (%eax),%eax
    1c6c:	8d 50 ff             	lea    -0x1(%eax),%edx
    1c6f:	8b 45 08             	mov    0x8(%ebp),%eax
    1c72:	89 10                	mov    %edx,(%eax)
       if(q->size == 0){
    1c74:	8b 45 08             	mov    0x8(%ebp),%eax
    1c77:	8b 00                	mov    (%eax),%eax
    1c79:	85 c0                	test   %eax,%eax
    1c7b:	75 14                	jne    1c91 <pop_q+0x6d>
            q->head = 0;
    1c7d:	8b 45 08             	mov    0x8(%ebp),%eax
    1c80:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
            q->tail = 0;
    1c87:	8b 45 08             	mov    0x8(%ebp),%eax
    1c8a:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
       }
       return val;
    1c91:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1c94:	eb 05                	jmp    1c9b <pop_q+0x77>
    }
    return -1;
    1c96:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
    1c9b:	c9                   	leave  
    1c9c:	c3                   	ret    

00001c9d <dominant>:

void dominant(struct queue* q, int i){
    1c9d:	55                   	push   %ebp
    1c9e:	89 e5                	mov    %esp,%ebp
    1ca0:	83 ec 28             	sub    $0x28,%esp
    struct node * n = malloc(sizeof(struct node));
    1ca3:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
    1caa:	e8 9a fc ff ff       	call   1949 <malloc>
    1caf:	89 45 f4             	mov    %eax,-0xc(%ebp)
    n->value = i;
    1cb2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1cb5:	8b 55 0c             	mov    0xc(%ebp),%edx
    1cb8:	89 10                	mov    %edx,(%eax)

    if(q->head == 0){
    1cba:	8b 45 08             	mov    0x8(%ebp),%eax
    1cbd:	8b 40 04             	mov    0x4(%eax),%eax
    1cc0:	85 c0                	test   %eax,%eax
    1cc2:	75 14                	jne    1cd8 <dominant+0x3b>
        q->head = n;
    1cc4:	8b 45 08             	mov    0x8(%ebp),%eax
    1cc7:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1cca:	89 50 04             	mov    %edx,0x4(%eax)
        q->tail = n;
    1ccd:	8b 45 08             	mov    0x8(%ebp),%eax
    1cd0:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1cd3:	89 50 08             	mov    %edx,0x8(%eax)
    1cd6:	eb 15                	jmp    1ced <dominant+0x50>
    }
    else{
        n->next = q->head;
    1cd8:	8b 45 08             	mov    0x8(%ebp),%eax
    1cdb:	8b 50 04             	mov    0x4(%eax),%edx
    1cde:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1ce1:	89 50 04             	mov    %edx,0x4(%eax)
        q->head = n;
    1ce4:	8b 45 08             	mov    0x8(%ebp),%eax
    1ce7:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1cea:	89 50 04             	mov    %edx,0x4(%eax)
    }
    q->size++;
    1ced:	8b 45 08             	mov    0x8(%ebp),%eax
    1cf0:	8b 00                	mov    (%eax),%eax
    1cf2:	8d 50 01             	lea    0x1(%eax),%edx
    1cf5:	8b 45 08             	mov    0x8(%ebp),%eax
    1cf8:	89 10                	mov    %edx,(%eax)
}
    1cfa:	c9                   	leave  
    1cfb:	c3                   	ret    

00001cfc <sem_init>:
#include "semaphore.h"
#include "user.h"

// Initializes the semaphore
void sem_init(struct Semaphore* s, int value){
    1cfc:	55                   	push   %ebp
    1cfd:	89 e5                	mov    %esp,%ebp
    1cff:	83 ec 18             	sub    $0x18,%esp
    s->val = value;
    1d02:	8b 45 08             	mov    0x8(%ebp),%eax
    1d05:	8b 55 0c             	mov    0xc(%ebp),%edx
    1d08:	89 10                	mov    %edx,(%eax)
    lock_init(&s->lock);
    1d0a:	8b 45 08             	mov    0x8(%ebp),%eax
    1d0d:	83 c0 04             	add    $0x4,%eax
    1d10:	89 04 24             	mov    %eax,(%esp)
    1d13:	e8 2e fd ff ff       	call   1a46 <lock_init>
    init_q(&s->q);
    1d18:	8b 45 08             	mov    0x8(%ebp),%eax
    1d1b:	83 c0 08             	add    $0x8,%eax
    1d1e:	89 04 24             	mov    %eax,(%esp)
    1d21:	e8 62 fe ff ff       	call   1b88 <init_q>
}
    1d26:	c9                   	leave  
    1d27:	c3                   	ret    

00001d28 <sem_acquire>:

// Decrements the semaphore
void sem_acquire(struct Semaphore* s){
    1d28:	55                   	push   %ebp
    1d29:	89 e5                	mov    %esp,%ebp
    1d2b:	83 ec 28             	sub    $0x28,%esp
    lock_acquire(&s->lock);
    1d2e:	8b 45 08             	mov    0x8(%ebp),%eax
    1d31:	83 c0 04             	add    $0x4,%eax
    1d34:	89 04 24             	mov    %eax,(%esp)
    1d37:	e8 18 fd ff ff       	call   1a54 <lock_acquire>

    if(s->val == 0){
    1d3c:	8b 45 08             	mov    0x8(%ebp),%eax
    1d3f:	8b 00                	mov    (%eax),%eax
    1d41:	85 c0                	test   %eax,%eax
    1d43:	75 32                	jne    1d77 <sem_acquire+0x4f>
        int pid;
        pid = getpid();
    1d45:	e8 f2 f7 ff ff       	call   153c <getpid>
    1d4a:	89 45 f4             	mov    %eax,-0xc(%ebp)
        add_q(&s->q, pid);
    1d4d:	8b 45 08             	mov    0x8(%ebp),%eax
    1d50:	8d 50 08             	lea    0x8(%eax),%edx
    1d53:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1d56:	89 44 24 04          	mov    %eax,0x4(%esp)
    1d5a:	89 14 24             	mov    %edx,(%esp)
    1d5d:	e8 48 fe ff ff       	call   1baa <add_q>
        lock_release(&s->lock);
    1d62:	8b 45 08             	mov    0x8(%ebp),%eax
    1d65:	83 c0 04             	add    $0x4,%eax
    1d68:	89 04 24             	mov    %eax,(%esp)
    1d6b:	e8 04 fd ff ff       	call   1a74 <lock_release>
        tsleep();
    1d70:	e8 f7 f7 ff ff       	call   156c <tsleep>
    1d75:	eb 1b                	jmp    1d92 <sem_acquire+0x6a>
    }
    else{
        s->val--;
    1d77:	8b 45 08             	mov    0x8(%ebp),%eax
    1d7a:	8b 00                	mov    (%eax),%eax
    1d7c:	8d 50 ff             	lea    -0x1(%eax),%edx
    1d7f:	8b 45 08             	mov    0x8(%ebp),%eax
    1d82:	89 10                	mov    %edx,(%eax)
        lock_release(&s->lock);
    1d84:	8b 45 08             	mov    0x8(%ebp),%eax
    1d87:	83 c0 04             	add    $0x4,%eax
    1d8a:	89 04 24             	mov    %eax,(%esp)
    1d8d:	e8 e2 fc ff ff       	call   1a74 <lock_release>
    }
}
    1d92:	c9                   	leave  
    1d93:	c3                   	ret    

00001d94 <sem_signal>:

// Increments the semaphore
void sem_signal(struct Semaphore* s){
    1d94:	55                   	push   %ebp
    1d95:	89 e5                	mov    %esp,%ebp
    1d97:	83 ec 18             	sub    $0x18,%esp
    lock_acquire(&s->lock);
    1d9a:	8b 45 08             	mov    0x8(%ebp),%eax
    1d9d:	83 c0 04             	add    $0x4,%eax
    1da0:	89 04 24             	mov    %eax,(%esp)
    1da3:	e8 ac fc ff ff       	call   1a54 <lock_acquire>

    if(!empty_q(&s->q)){
    1da8:	8b 45 08             	mov    0x8(%ebp),%eax
    1dab:	83 c0 08             	add    $0x8,%eax
    1dae:	89 04 24             	mov    %eax,(%esp)
    1db1:	e8 54 fe ff ff       	call   1c0a <empty_q>
    1db6:	85 c0                	test   %eax,%eax
    1db8:	75 18                	jne    1dd2 <sem_signal+0x3e>
        twakeup(pop_q(&s->q));
    1dba:	8b 45 08             	mov    0x8(%ebp),%eax
    1dbd:	83 c0 08             	add    $0x8,%eax
    1dc0:	89 04 24             	mov    %eax,(%esp)
    1dc3:	e8 5c fe ff ff       	call   1c24 <pop_q>
    1dc8:	89 04 24             	mov    %eax,(%esp)
    1dcb:	e8 a4 f7 ff ff       	call   1574 <twakeup>
    1dd0:	eb 0d                	jmp    1ddf <sem_signal+0x4b>
    }
    else{
        s->val++;
    1dd2:	8b 45 08             	mov    0x8(%ebp),%eax
    1dd5:	8b 00                	mov    (%eax),%eax
    1dd7:	8d 50 01             	lea    0x1(%eax),%edx
    1dda:	8b 45 08             	mov    0x8(%ebp),%eax
    1ddd:	89 10                	mov    %edx,(%eax)
    }

    lock_release(&s->lock);
    1ddf:	8b 45 08             	mov    0x8(%ebp),%eax
    1de2:	83 c0 04             	add    $0x4,%eax
    1de5:	89 04 24             	mov    %eax,(%esp)
    1de8:	e8 87 fc ff ff       	call   1a74 <lock_release>
}
    1ded:	c9                   	leave  
    1dee:	c3                   	ret    

00001def <sem_dom_acquire>:

void sem_dom_acquire(struct Semaphore* s){
    1def:	55                   	push   %ebp
    1df0:	89 e5                	mov    %esp,%ebp
    1df2:	83 ec 18             	sub    $0x18,%esp
    lock_acquire(&s->lock);
    1df5:	8b 45 08             	mov    0x8(%ebp),%eax
    1df8:	83 c0 04             	add    $0x4,%eax
    1dfb:	89 04 24             	mov    %eax,(%esp)
    1dfe:	e8 51 fc ff ff       	call   1a54 <lock_acquire>

    if(s->val > 0){
    1e03:	8b 45 08             	mov    0x8(%ebp),%eax
    1e06:	8b 00                	mov    (%eax),%eax
    1e08:	85 c0                	test   %eax,%eax
    1e0a:	7e 1d                	jle    1e29 <sem_dom_acquire+0x3a>
        s->val--;
    1e0c:	8b 45 08             	mov    0x8(%ebp),%eax
    1e0f:	8b 00                	mov    (%eax),%eax
    1e11:	8d 50 ff             	lea    -0x1(%eax),%edx
    1e14:	8b 45 08             	mov    0x8(%ebp),%eax
    1e17:	89 10                	mov    %edx,(%eax)
        lock_release(&s->lock);
    1e19:	8b 45 08             	mov    0x8(%ebp),%eax
    1e1c:	83 c0 04             	add    $0x4,%eax
    1e1f:	89 04 24             	mov    %eax,(%esp)
    1e22:	e8 4d fc ff ff       	call   1a74 <lock_release>
        return;
    1e27:	eb 2a                	jmp    1e53 <sem_dom_acquire+0x64>
    }

    dominant(&s->q,getpid());
    1e29:	e8 0e f7 ff ff       	call   153c <getpid>
    1e2e:	8b 55 08             	mov    0x8(%ebp),%edx
    1e31:	83 c2 08             	add    $0x8,%edx
    1e34:	89 44 24 04          	mov    %eax,0x4(%esp)
    1e38:	89 14 24             	mov    %edx,(%esp)
    1e3b:	e8 5d fe ff ff       	call   1c9d <dominant>
    lock_release(&s->lock);
    1e40:	8b 45 08             	mov    0x8(%ebp),%eax
    1e43:	83 c0 04             	add    $0x4,%eax
    1e46:	89 04 24             	mov    %eax,(%esp)
    1e49:	e8 26 fc ff ff       	call   1a74 <lock_release>
    tsleep();
    1e4e:	e8 19 f7 ff ff       	call   156c <tsleep>
}
    1e53:	c9                   	leave  
    1e54:	c3                   	ret    
