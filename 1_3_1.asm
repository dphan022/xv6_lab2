
_1_3_1:     file format elf32-i386


Disassembly of section .text:

00001000 <main>:
Semaphore H, O, mutex;

void hRdy(void* arg);
void oRdy(void* arg);

int main(){
    1000:	55                   	push   %ebp
    1001:	89 e5                	mov    %esp,%ebp
    1003:	83 e4 f0             	and    $0xfffffff0,%esp
    1006:	83 ec 20             	sub    $0x20,%esp
    int i;
    int numWater = 0;
    1009:	c7 44 24 18 00 00 00 	movl   $0x0,0x18(%esp)
    1010:	00 

    printf(1, "water before : %d\n", numWater);
    1011:	8b 44 24 18          	mov    0x18(%esp),%eax
    1015:	89 44 24 08          	mov    %eax,0x8(%esp)
    1019:	c7 44 24 04 85 1d 00 	movl   $0x1d85,0x4(%esp)
    1020:	00 
    1021:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1028:	e8 5f 05 00 00       	call   158c <printf>

    sem_init(&H, 2);
    102d:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    1034:	00 
    1035:	c7 04 24 8c 22 00 00 	movl   $0x228c,(%esp)
    103c:	e8 eb 0b 00 00       	call   1c2c <sem_init>
    sem_init(&mutex, 0);
    1041:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1048:	00 
    1049:	c7 04 24 64 22 00 00 	movl   $0x2264,(%esp)
    1050:	e8 d7 0b 00 00       	call   1c2c <sem_init>
    sem_init(&O, 1);
    1055:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
    105c:	00 
    105d:	c7 04 24 78 22 00 00 	movl   $0x2278,(%esp)
    1064:	e8 c3 0b 00 00       	call   1c2c <sem_init>

    for(i = 0; i < 12; i++){
    1069:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
    1070:	00 
    1071:	eb 51                	jmp    10c4 <main+0xc4>
        if(i % 3){
    1073:	8b 4c 24 1c          	mov    0x1c(%esp),%ecx
    1077:	ba 56 55 55 55       	mov    $0x55555556,%edx
    107c:	89 c8                	mov    %ecx,%eax
    107e:	f7 ea                	imul   %edx
    1080:	89 c8                	mov    %ecx,%eax
    1082:	c1 f8 1f             	sar    $0x1f,%eax
    1085:	29 c2                	sub    %eax,%edx
    1087:	89 d0                	mov    %edx,%eax
    1089:	01 c0                	add    %eax,%eax
    108b:	01 d0                	add    %edx,%eax
    108d:	29 c1                	sub    %eax,%ecx
    108f:	89 ca                	mov    %ecx,%edx
    1091:	85 d2                	test   %edx,%edx
    1093:	74 16                	je     10ab <main+0xab>
            thread_create(hRdy, 0);
    1095:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    109c:	00 
    109d:	c7 04 24 f8 10 00 00 	movl   $0x10f8,(%esp)
    10a4:	e8 16 09 00 00       	call   19bf <thread_create>
    10a9:	eb 14                	jmp    10bf <main+0xbf>
        }
        else{
            thread_create(oRdy, &numWater);
    10ab:	8d 44 24 18          	lea    0x18(%esp),%eax
    10af:	89 44 24 04          	mov    %eax,0x4(%esp)
    10b3:	c7 04 24 1b 11 00 00 	movl   $0x111b,(%esp)
    10ba:	e8 00 09 00 00       	call   19bf <thread_create>

    sem_init(&H, 2);
    sem_init(&mutex, 0);
    sem_init(&O, 1);

    for(i = 0; i < 12; i++){
    10bf:	83 44 24 1c 01       	addl   $0x1,0x1c(%esp)
    10c4:	83 7c 24 1c 0b       	cmpl   $0xb,0x1c(%esp)
    10c9:	7e a8                	jle    1073 <main+0x73>
        else{
            thread_create(oRdy, &numWater);
        }
    }

    while(wait() >= 0);
    10cb:	90                   	nop
    10cc:	e8 23 03 00 00       	call   13f4 <wait>
    10d1:	85 c0                	test   %eax,%eax
    10d3:	79 f7                	jns    10cc <main+0xcc>

    printf(1, "water after : %d\n", numWater);
    10d5:	8b 44 24 18          	mov    0x18(%esp),%eax
    10d9:	89 44 24 08          	mov    %eax,0x8(%esp)
    10dd:	c7 44 24 04 98 1d 00 	movl   $0x1d98,0x4(%esp)
    10e4:	00 
    10e5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    10ec:	e8 9b 04 00 00       	call   158c <printf>

    return 0;
    10f1:	b8 00 00 00 00       	mov    $0x0,%eax
    while(wait() > 0);
    printf(1, "water : %d\n", numWater);

    exit();
    */
}
    10f6:	c9                   	leave  
    10f7:	c3                   	ret    

000010f8 <hRdy>:

void hRdy(void* arg){
    10f8:	55                   	push   %ebp
    10f9:	89 e5                	mov    %esp,%ebp
    10fb:	83 ec 18             	sub    $0x18,%esp
    sem_acquire(&H);
    10fe:	c7 04 24 8c 22 00 00 	movl   $0x228c,(%esp)
    1105:	e8 4e 0b 00 00       	call   1c58 <sem_acquire>
    sem_signal(&mutex);
    110a:	c7 04 24 64 22 00 00 	movl   $0x2264,(%esp)
    1111:	e8 ae 0b 00 00       	call   1cc4 <sem_signal>
    texit();
    1116:	e8 79 03 00 00       	call   1494 <texit>

0000111b <oRdy>:
}

void oRdy(void* arg){
    111b:	55                   	push   %ebp
    111c:	89 e5                	mov    %esp,%ebp
    111e:	83 ec 28             	sub    $0x28,%esp
   
    int * w = (int*)arg;
    1121:	8b 45 08             	mov    0x8(%ebp),%eax
    1124:	89 45 f4             	mov    %eax,-0xc(%ebp)

    sem_acquire(&O);
    1127:	c7 04 24 78 22 00 00 	movl   $0x2278,(%esp)
    112e:	e8 25 0b 00 00       	call   1c58 <sem_acquire>
    sem_acquire(&mutex);
    1133:	c7 04 24 64 22 00 00 	movl   $0x2264,(%esp)
    113a:	e8 19 0b 00 00       	call   1c58 <sem_acquire>
    sem_acquire(&mutex);
    113f:	c7 04 24 64 22 00 00 	movl   $0x2264,(%esp)
    1146:	e8 0d 0b 00 00       	call   1c58 <sem_acquire>
    
    (*w)++;
    114b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    114e:	8b 00                	mov    (%eax),%eax
    1150:	8d 50 01             	lea    0x1(%eax),%edx
    1153:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1156:	89 10                	mov    %edx,(%eax)

    sem_signal(&O);
    1158:	c7 04 24 78 22 00 00 	movl   $0x2278,(%esp)
    115f:	e8 60 0b 00 00       	call   1cc4 <sem_signal>
    sem_signal(&H);
    1164:	c7 04 24 8c 22 00 00 	movl   $0x228c,(%esp)
    116b:	e8 54 0b 00 00       	call   1cc4 <sem_signal>
    sem_signal(&H);
    1170:	c7 04 24 8c 22 00 00 	movl   $0x228c,(%esp)
    1177:	e8 48 0b 00 00       	call   1cc4 <sem_signal>
    //sem_acquire(&O);
    //sem_acquire(&O);
    //sem_acquire(&mutex);
    //numWater++;
    //sem_signal(&mutex);
    texit();
    117c:	e8 13 03 00 00       	call   1494 <texit>
    1181:	66 90                	xchg   %ax,%ax
    1183:	90                   	nop

00001184 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
    1184:	55                   	push   %ebp
    1185:	89 e5                	mov    %esp,%ebp
    1187:	57                   	push   %edi
    1188:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
    1189:	8b 4d 08             	mov    0x8(%ebp),%ecx
    118c:	8b 55 10             	mov    0x10(%ebp),%edx
    118f:	8b 45 0c             	mov    0xc(%ebp),%eax
    1192:	89 cb                	mov    %ecx,%ebx
    1194:	89 df                	mov    %ebx,%edi
    1196:	89 d1                	mov    %edx,%ecx
    1198:	fc                   	cld    
    1199:	f3 aa                	rep stos %al,%es:(%edi)
    119b:	89 ca                	mov    %ecx,%edx
    119d:	89 fb                	mov    %edi,%ebx
    119f:	89 5d 08             	mov    %ebx,0x8(%ebp)
    11a2:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
    11a5:	5b                   	pop    %ebx
    11a6:	5f                   	pop    %edi
    11a7:	5d                   	pop    %ebp
    11a8:	c3                   	ret    

000011a9 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
    11a9:	55                   	push   %ebp
    11aa:	89 e5                	mov    %esp,%ebp
    11ac:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
    11af:	8b 45 08             	mov    0x8(%ebp),%eax
    11b2:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
    11b5:	90                   	nop
    11b6:	8b 45 08             	mov    0x8(%ebp),%eax
    11b9:	8d 50 01             	lea    0x1(%eax),%edx
    11bc:	89 55 08             	mov    %edx,0x8(%ebp)
    11bf:	8b 55 0c             	mov    0xc(%ebp),%edx
    11c2:	8d 4a 01             	lea    0x1(%edx),%ecx
    11c5:	89 4d 0c             	mov    %ecx,0xc(%ebp)
    11c8:	0f b6 12             	movzbl (%edx),%edx
    11cb:	88 10                	mov    %dl,(%eax)
    11cd:	0f b6 00             	movzbl (%eax),%eax
    11d0:	84 c0                	test   %al,%al
    11d2:	75 e2                	jne    11b6 <strcpy+0xd>
    ;
  return os;
    11d4:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    11d7:	c9                   	leave  
    11d8:	c3                   	ret    

000011d9 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    11d9:	55                   	push   %ebp
    11da:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
    11dc:	eb 08                	jmp    11e6 <strcmp+0xd>
    p++, q++;
    11de:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    11e2:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    11e6:	8b 45 08             	mov    0x8(%ebp),%eax
    11e9:	0f b6 00             	movzbl (%eax),%eax
    11ec:	84 c0                	test   %al,%al
    11ee:	74 10                	je     1200 <strcmp+0x27>
    11f0:	8b 45 08             	mov    0x8(%ebp),%eax
    11f3:	0f b6 10             	movzbl (%eax),%edx
    11f6:	8b 45 0c             	mov    0xc(%ebp),%eax
    11f9:	0f b6 00             	movzbl (%eax),%eax
    11fc:	38 c2                	cmp    %al,%dl
    11fe:	74 de                	je     11de <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
    1200:	8b 45 08             	mov    0x8(%ebp),%eax
    1203:	0f b6 00             	movzbl (%eax),%eax
    1206:	0f b6 d0             	movzbl %al,%edx
    1209:	8b 45 0c             	mov    0xc(%ebp),%eax
    120c:	0f b6 00             	movzbl (%eax),%eax
    120f:	0f b6 c0             	movzbl %al,%eax
    1212:	29 c2                	sub    %eax,%edx
    1214:	89 d0                	mov    %edx,%eax
}
    1216:	5d                   	pop    %ebp
    1217:	c3                   	ret    

00001218 <strlen>:

uint
strlen(char *s)
{
    1218:	55                   	push   %ebp
    1219:	89 e5                	mov    %esp,%ebp
    121b:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
    121e:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    1225:	eb 04                	jmp    122b <strlen+0x13>
    1227:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    122b:	8b 55 fc             	mov    -0x4(%ebp),%edx
    122e:	8b 45 08             	mov    0x8(%ebp),%eax
    1231:	01 d0                	add    %edx,%eax
    1233:	0f b6 00             	movzbl (%eax),%eax
    1236:	84 c0                	test   %al,%al
    1238:	75 ed                	jne    1227 <strlen+0xf>
    ;
  return n;
    123a:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    123d:	c9                   	leave  
    123e:	c3                   	ret    

0000123f <memset>:

void*
memset(void *dst, int c, uint n)
{
    123f:	55                   	push   %ebp
    1240:	89 e5                	mov    %esp,%ebp
    1242:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
    1245:	8b 45 10             	mov    0x10(%ebp),%eax
    1248:	89 44 24 08          	mov    %eax,0x8(%esp)
    124c:	8b 45 0c             	mov    0xc(%ebp),%eax
    124f:	89 44 24 04          	mov    %eax,0x4(%esp)
    1253:	8b 45 08             	mov    0x8(%ebp),%eax
    1256:	89 04 24             	mov    %eax,(%esp)
    1259:	e8 26 ff ff ff       	call   1184 <stosb>
  return dst;
    125e:	8b 45 08             	mov    0x8(%ebp),%eax
}
    1261:	c9                   	leave  
    1262:	c3                   	ret    

00001263 <strchr>:

char*
strchr(const char *s, char c)
{
    1263:	55                   	push   %ebp
    1264:	89 e5                	mov    %esp,%ebp
    1266:	83 ec 04             	sub    $0x4,%esp
    1269:	8b 45 0c             	mov    0xc(%ebp),%eax
    126c:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
    126f:	eb 14                	jmp    1285 <strchr+0x22>
    if(*s == c)
    1271:	8b 45 08             	mov    0x8(%ebp),%eax
    1274:	0f b6 00             	movzbl (%eax),%eax
    1277:	3a 45 fc             	cmp    -0x4(%ebp),%al
    127a:	75 05                	jne    1281 <strchr+0x1e>
      return (char*)s;
    127c:	8b 45 08             	mov    0x8(%ebp),%eax
    127f:	eb 13                	jmp    1294 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
    1281:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    1285:	8b 45 08             	mov    0x8(%ebp),%eax
    1288:	0f b6 00             	movzbl (%eax),%eax
    128b:	84 c0                	test   %al,%al
    128d:	75 e2                	jne    1271 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
    128f:	b8 00 00 00 00       	mov    $0x0,%eax
}
    1294:	c9                   	leave  
    1295:	c3                   	ret    

00001296 <gets>:

char*
gets(char *buf, int max)
{
    1296:	55                   	push   %ebp
    1297:	89 e5                	mov    %esp,%ebp
    1299:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    129c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    12a3:	eb 4c                	jmp    12f1 <gets+0x5b>
    cc = read(0, &c, 1);
    12a5:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    12ac:	00 
    12ad:	8d 45 ef             	lea    -0x11(%ebp),%eax
    12b0:	89 44 24 04          	mov    %eax,0x4(%esp)
    12b4:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    12bb:	e8 44 01 00 00       	call   1404 <read>
    12c0:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
    12c3:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    12c7:	7f 02                	jg     12cb <gets+0x35>
      break;
    12c9:	eb 31                	jmp    12fc <gets+0x66>
    buf[i++] = c;
    12cb:	8b 45 f4             	mov    -0xc(%ebp),%eax
    12ce:	8d 50 01             	lea    0x1(%eax),%edx
    12d1:	89 55 f4             	mov    %edx,-0xc(%ebp)
    12d4:	89 c2                	mov    %eax,%edx
    12d6:	8b 45 08             	mov    0x8(%ebp),%eax
    12d9:	01 c2                	add    %eax,%edx
    12db:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    12df:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
    12e1:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    12e5:	3c 0a                	cmp    $0xa,%al
    12e7:	74 13                	je     12fc <gets+0x66>
    12e9:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    12ed:	3c 0d                	cmp    $0xd,%al
    12ef:	74 0b                	je     12fc <gets+0x66>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    12f1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    12f4:	83 c0 01             	add    $0x1,%eax
    12f7:	3b 45 0c             	cmp    0xc(%ebp),%eax
    12fa:	7c a9                	jl     12a5 <gets+0xf>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    12fc:	8b 55 f4             	mov    -0xc(%ebp),%edx
    12ff:	8b 45 08             	mov    0x8(%ebp),%eax
    1302:	01 d0                	add    %edx,%eax
    1304:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
    1307:	8b 45 08             	mov    0x8(%ebp),%eax
}
    130a:	c9                   	leave  
    130b:	c3                   	ret    

0000130c <stat>:

int
stat(char *n, struct stat *st)
{
    130c:	55                   	push   %ebp
    130d:	89 e5                	mov    %esp,%ebp
    130f:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    1312:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1319:	00 
    131a:	8b 45 08             	mov    0x8(%ebp),%eax
    131d:	89 04 24             	mov    %eax,(%esp)
    1320:	e8 07 01 00 00       	call   142c <open>
    1325:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
    1328:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    132c:	79 07                	jns    1335 <stat+0x29>
    return -1;
    132e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    1333:	eb 23                	jmp    1358 <stat+0x4c>
  r = fstat(fd, st);
    1335:	8b 45 0c             	mov    0xc(%ebp),%eax
    1338:	89 44 24 04          	mov    %eax,0x4(%esp)
    133c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    133f:	89 04 24             	mov    %eax,(%esp)
    1342:	e8 fd 00 00 00       	call   1444 <fstat>
    1347:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
    134a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    134d:	89 04 24             	mov    %eax,(%esp)
    1350:	e8 bf 00 00 00       	call   1414 <close>
  return r;
    1355:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
    1358:	c9                   	leave  
    1359:	c3                   	ret    

0000135a <atoi>:

int
atoi(const char *s)
{
    135a:	55                   	push   %ebp
    135b:	89 e5                	mov    %esp,%ebp
    135d:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
    1360:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
    1367:	eb 25                	jmp    138e <atoi+0x34>
    n = n*10 + *s++ - '0';
    1369:	8b 55 fc             	mov    -0x4(%ebp),%edx
    136c:	89 d0                	mov    %edx,%eax
    136e:	c1 e0 02             	shl    $0x2,%eax
    1371:	01 d0                	add    %edx,%eax
    1373:	01 c0                	add    %eax,%eax
    1375:	89 c1                	mov    %eax,%ecx
    1377:	8b 45 08             	mov    0x8(%ebp),%eax
    137a:	8d 50 01             	lea    0x1(%eax),%edx
    137d:	89 55 08             	mov    %edx,0x8(%ebp)
    1380:	0f b6 00             	movzbl (%eax),%eax
    1383:	0f be c0             	movsbl %al,%eax
    1386:	01 c8                	add    %ecx,%eax
    1388:	83 e8 30             	sub    $0x30,%eax
    138b:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    138e:	8b 45 08             	mov    0x8(%ebp),%eax
    1391:	0f b6 00             	movzbl (%eax),%eax
    1394:	3c 2f                	cmp    $0x2f,%al
    1396:	7e 0a                	jle    13a2 <atoi+0x48>
    1398:	8b 45 08             	mov    0x8(%ebp),%eax
    139b:	0f b6 00             	movzbl (%eax),%eax
    139e:	3c 39                	cmp    $0x39,%al
    13a0:	7e c7                	jle    1369 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
    13a2:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    13a5:	c9                   	leave  
    13a6:	c3                   	ret    

000013a7 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    13a7:	55                   	push   %ebp
    13a8:	89 e5                	mov    %esp,%ebp
    13aa:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
    13ad:	8b 45 08             	mov    0x8(%ebp),%eax
    13b0:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
    13b3:	8b 45 0c             	mov    0xc(%ebp),%eax
    13b6:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
    13b9:	eb 17                	jmp    13d2 <memmove+0x2b>
    *dst++ = *src++;
    13bb:	8b 45 fc             	mov    -0x4(%ebp),%eax
    13be:	8d 50 01             	lea    0x1(%eax),%edx
    13c1:	89 55 fc             	mov    %edx,-0x4(%ebp)
    13c4:	8b 55 f8             	mov    -0x8(%ebp),%edx
    13c7:	8d 4a 01             	lea    0x1(%edx),%ecx
    13ca:	89 4d f8             	mov    %ecx,-0x8(%ebp)
    13cd:	0f b6 12             	movzbl (%edx),%edx
    13d0:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    13d2:	8b 45 10             	mov    0x10(%ebp),%eax
    13d5:	8d 50 ff             	lea    -0x1(%eax),%edx
    13d8:	89 55 10             	mov    %edx,0x10(%ebp)
    13db:	85 c0                	test   %eax,%eax
    13dd:	7f dc                	jg     13bb <memmove+0x14>
    *dst++ = *src++;
  return vdst;
    13df:	8b 45 08             	mov    0x8(%ebp),%eax
}
    13e2:	c9                   	leave  
    13e3:	c3                   	ret    

000013e4 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    13e4:	b8 01 00 00 00       	mov    $0x1,%eax
    13e9:	cd 40                	int    $0x40
    13eb:	c3                   	ret    

000013ec <exit>:
SYSCALL(exit)
    13ec:	b8 02 00 00 00       	mov    $0x2,%eax
    13f1:	cd 40                	int    $0x40
    13f3:	c3                   	ret    

000013f4 <wait>:
SYSCALL(wait)
    13f4:	b8 03 00 00 00       	mov    $0x3,%eax
    13f9:	cd 40                	int    $0x40
    13fb:	c3                   	ret    

000013fc <pipe>:
SYSCALL(pipe)
    13fc:	b8 04 00 00 00       	mov    $0x4,%eax
    1401:	cd 40                	int    $0x40
    1403:	c3                   	ret    

00001404 <read>:
SYSCALL(read)
    1404:	b8 05 00 00 00       	mov    $0x5,%eax
    1409:	cd 40                	int    $0x40
    140b:	c3                   	ret    

0000140c <write>:
SYSCALL(write)
    140c:	b8 10 00 00 00       	mov    $0x10,%eax
    1411:	cd 40                	int    $0x40
    1413:	c3                   	ret    

00001414 <close>:
SYSCALL(close)
    1414:	b8 15 00 00 00       	mov    $0x15,%eax
    1419:	cd 40                	int    $0x40
    141b:	c3                   	ret    

0000141c <kill>:
SYSCALL(kill)
    141c:	b8 06 00 00 00       	mov    $0x6,%eax
    1421:	cd 40                	int    $0x40
    1423:	c3                   	ret    

00001424 <exec>:
SYSCALL(exec)
    1424:	b8 07 00 00 00       	mov    $0x7,%eax
    1429:	cd 40                	int    $0x40
    142b:	c3                   	ret    

0000142c <open>:
SYSCALL(open)
    142c:	b8 0f 00 00 00       	mov    $0xf,%eax
    1431:	cd 40                	int    $0x40
    1433:	c3                   	ret    

00001434 <mknod>:
SYSCALL(mknod)
    1434:	b8 11 00 00 00       	mov    $0x11,%eax
    1439:	cd 40                	int    $0x40
    143b:	c3                   	ret    

0000143c <unlink>:
SYSCALL(unlink)
    143c:	b8 12 00 00 00       	mov    $0x12,%eax
    1441:	cd 40                	int    $0x40
    1443:	c3                   	ret    

00001444 <fstat>:
SYSCALL(fstat)
    1444:	b8 08 00 00 00       	mov    $0x8,%eax
    1449:	cd 40                	int    $0x40
    144b:	c3                   	ret    

0000144c <link>:
SYSCALL(link)
    144c:	b8 13 00 00 00       	mov    $0x13,%eax
    1451:	cd 40                	int    $0x40
    1453:	c3                   	ret    

00001454 <mkdir>:
SYSCALL(mkdir)
    1454:	b8 14 00 00 00       	mov    $0x14,%eax
    1459:	cd 40                	int    $0x40
    145b:	c3                   	ret    

0000145c <chdir>:
SYSCALL(chdir)
    145c:	b8 09 00 00 00       	mov    $0x9,%eax
    1461:	cd 40                	int    $0x40
    1463:	c3                   	ret    

00001464 <dup>:
SYSCALL(dup)
    1464:	b8 0a 00 00 00       	mov    $0xa,%eax
    1469:	cd 40                	int    $0x40
    146b:	c3                   	ret    

0000146c <getpid>:
SYSCALL(getpid)
    146c:	b8 0b 00 00 00       	mov    $0xb,%eax
    1471:	cd 40                	int    $0x40
    1473:	c3                   	ret    

00001474 <sbrk>:
SYSCALL(sbrk)
    1474:	b8 0c 00 00 00       	mov    $0xc,%eax
    1479:	cd 40                	int    $0x40
    147b:	c3                   	ret    

0000147c <sleep>:
SYSCALL(sleep)
    147c:	b8 0d 00 00 00       	mov    $0xd,%eax
    1481:	cd 40                	int    $0x40
    1483:	c3                   	ret    

00001484 <uptime>:
SYSCALL(uptime)
    1484:	b8 0e 00 00 00       	mov    $0xe,%eax
    1489:	cd 40                	int    $0x40
    148b:	c3                   	ret    

0000148c <clone>:
SYSCALL(clone)
    148c:	b8 16 00 00 00       	mov    $0x16,%eax
    1491:	cd 40                	int    $0x40
    1493:	c3                   	ret    

00001494 <texit>:
SYSCALL(texit)
    1494:	b8 17 00 00 00       	mov    $0x17,%eax
    1499:	cd 40                	int    $0x40
    149b:	c3                   	ret    

0000149c <tsleep>:
SYSCALL(tsleep)
    149c:	b8 18 00 00 00       	mov    $0x18,%eax
    14a1:	cd 40                	int    $0x40
    14a3:	c3                   	ret    

000014a4 <twakeup>:
SYSCALL(twakeup)
    14a4:	b8 19 00 00 00       	mov    $0x19,%eax
    14a9:	cd 40                	int    $0x40
    14ab:	c3                   	ret    

000014ac <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
    14ac:	55                   	push   %ebp
    14ad:	89 e5                	mov    %esp,%ebp
    14af:	83 ec 18             	sub    $0x18,%esp
    14b2:	8b 45 0c             	mov    0xc(%ebp),%eax
    14b5:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
    14b8:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    14bf:	00 
    14c0:	8d 45 f4             	lea    -0xc(%ebp),%eax
    14c3:	89 44 24 04          	mov    %eax,0x4(%esp)
    14c7:	8b 45 08             	mov    0x8(%ebp),%eax
    14ca:	89 04 24             	mov    %eax,(%esp)
    14cd:	e8 3a ff ff ff       	call   140c <write>
}
    14d2:	c9                   	leave  
    14d3:	c3                   	ret    

000014d4 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
    14d4:	55                   	push   %ebp
    14d5:	89 e5                	mov    %esp,%ebp
    14d7:	56                   	push   %esi
    14d8:	53                   	push   %ebx
    14d9:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    14dc:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
    14e3:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
    14e7:	74 17                	je     1500 <printint+0x2c>
    14e9:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    14ed:	79 11                	jns    1500 <printint+0x2c>
    neg = 1;
    14ef:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
    14f6:	8b 45 0c             	mov    0xc(%ebp),%eax
    14f9:	f7 d8                	neg    %eax
    14fb:	89 45 ec             	mov    %eax,-0x14(%ebp)
    14fe:	eb 06                	jmp    1506 <printint+0x32>
  } else {
    x = xx;
    1500:	8b 45 0c             	mov    0xc(%ebp),%eax
    1503:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
    1506:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
    150d:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    1510:	8d 41 01             	lea    0x1(%ecx),%eax
    1513:	89 45 f4             	mov    %eax,-0xc(%ebp)
    1516:	8b 5d 10             	mov    0x10(%ebp),%ebx
    1519:	8b 45 ec             	mov    -0x14(%ebp),%eax
    151c:	ba 00 00 00 00       	mov    $0x0,%edx
    1521:	f7 f3                	div    %ebx
    1523:	89 d0                	mov    %edx,%eax
    1525:	0f b6 80 40 22 00 00 	movzbl 0x2240(%eax),%eax
    152c:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
    1530:	8b 75 10             	mov    0x10(%ebp),%esi
    1533:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1536:	ba 00 00 00 00       	mov    $0x0,%edx
    153b:	f7 f6                	div    %esi
    153d:	89 45 ec             	mov    %eax,-0x14(%ebp)
    1540:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1544:	75 c7                	jne    150d <printint+0x39>
  if(neg)
    1546:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    154a:	74 10                	je     155c <printint+0x88>
    buf[i++] = '-';
    154c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    154f:	8d 50 01             	lea    0x1(%eax),%edx
    1552:	89 55 f4             	mov    %edx,-0xc(%ebp)
    1555:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
    155a:	eb 1f                	jmp    157b <printint+0xa7>
    155c:	eb 1d                	jmp    157b <printint+0xa7>
    putc(fd, buf[i]);
    155e:	8d 55 dc             	lea    -0x24(%ebp),%edx
    1561:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1564:	01 d0                	add    %edx,%eax
    1566:	0f b6 00             	movzbl (%eax),%eax
    1569:	0f be c0             	movsbl %al,%eax
    156c:	89 44 24 04          	mov    %eax,0x4(%esp)
    1570:	8b 45 08             	mov    0x8(%ebp),%eax
    1573:	89 04 24             	mov    %eax,(%esp)
    1576:	e8 31 ff ff ff       	call   14ac <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    157b:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    157f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1583:	79 d9                	jns    155e <printint+0x8a>
    putc(fd, buf[i]);
}
    1585:	83 c4 30             	add    $0x30,%esp
    1588:	5b                   	pop    %ebx
    1589:	5e                   	pop    %esi
    158a:	5d                   	pop    %ebp
    158b:	c3                   	ret    

0000158c <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    158c:	55                   	push   %ebp
    158d:	89 e5                	mov    %esp,%ebp
    158f:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
    1592:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
    1599:	8d 45 0c             	lea    0xc(%ebp),%eax
    159c:	83 c0 04             	add    $0x4,%eax
    159f:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
    15a2:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    15a9:	e9 7c 01 00 00       	jmp    172a <printf+0x19e>
    c = fmt[i] & 0xff;
    15ae:	8b 55 0c             	mov    0xc(%ebp),%edx
    15b1:	8b 45 f0             	mov    -0x10(%ebp),%eax
    15b4:	01 d0                	add    %edx,%eax
    15b6:	0f b6 00             	movzbl (%eax),%eax
    15b9:	0f be c0             	movsbl %al,%eax
    15bc:	25 ff 00 00 00       	and    $0xff,%eax
    15c1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
    15c4:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    15c8:	75 2c                	jne    15f6 <printf+0x6a>
      if(c == '%'){
    15ca:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    15ce:	75 0c                	jne    15dc <printf+0x50>
        state = '%';
    15d0:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
    15d7:	e9 4a 01 00 00       	jmp    1726 <printf+0x19a>
      } else {
        putc(fd, c);
    15dc:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    15df:	0f be c0             	movsbl %al,%eax
    15e2:	89 44 24 04          	mov    %eax,0x4(%esp)
    15e6:	8b 45 08             	mov    0x8(%ebp),%eax
    15e9:	89 04 24             	mov    %eax,(%esp)
    15ec:	e8 bb fe ff ff       	call   14ac <putc>
    15f1:	e9 30 01 00 00       	jmp    1726 <printf+0x19a>
      }
    } else if(state == '%'){
    15f6:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
    15fa:	0f 85 26 01 00 00    	jne    1726 <printf+0x19a>
      if(c == 'd'){
    1600:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
    1604:	75 2d                	jne    1633 <printf+0xa7>
        printint(fd, *ap, 10, 1);
    1606:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1609:	8b 00                	mov    (%eax),%eax
    160b:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    1612:	00 
    1613:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
    161a:	00 
    161b:	89 44 24 04          	mov    %eax,0x4(%esp)
    161f:	8b 45 08             	mov    0x8(%ebp),%eax
    1622:	89 04 24             	mov    %eax,(%esp)
    1625:	e8 aa fe ff ff       	call   14d4 <printint>
        ap++;
    162a:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    162e:	e9 ec 00 00 00       	jmp    171f <printf+0x193>
      } else if(c == 'x' || c == 'p'){
    1633:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
    1637:	74 06                	je     163f <printf+0xb3>
    1639:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
    163d:	75 2d                	jne    166c <printf+0xe0>
        printint(fd, *ap, 16, 0);
    163f:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1642:	8b 00                	mov    (%eax),%eax
    1644:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    164b:	00 
    164c:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
    1653:	00 
    1654:	89 44 24 04          	mov    %eax,0x4(%esp)
    1658:	8b 45 08             	mov    0x8(%ebp),%eax
    165b:	89 04 24             	mov    %eax,(%esp)
    165e:	e8 71 fe ff ff       	call   14d4 <printint>
        ap++;
    1663:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    1667:	e9 b3 00 00 00       	jmp    171f <printf+0x193>
      } else if(c == 's'){
    166c:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
    1670:	75 45                	jne    16b7 <printf+0x12b>
        s = (char*)*ap;
    1672:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1675:	8b 00                	mov    (%eax),%eax
    1677:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
    167a:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
    167e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1682:	75 09                	jne    168d <printf+0x101>
          s = "(null)";
    1684:	c7 45 f4 aa 1d 00 00 	movl   $0x1daa,-0xc(%ebp)
        while(*s != 0){
    168b:	eb 1e                	jmp    16ab <printf+0x11f>
    168d:	eb 1c                	jmp    16ab <printf+0x11f>
          putc(fd, *s);
    168f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1692:	0f b6 00             	movzbl (%eax),%eax
    1695:	0f be c0             	movsbl %al,%eax
    1698:	89 44 24 04          	mov    %eax,0x4(%esp)
    169c:	8b 45 08             	mov    0x8(%ebp),%eax
    169f:	89 04 24             	mov    %eax,(%esp)
    16a2:	e8 05 fe ff ff       	call   14ac <putc>
          s++;
    16a7:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    16ab:	8b 45 f4             	mov    -0xc(%ebp),%eax
    16ae:	0f b6 00             	movzbl (%eax),%eax
    16b1:	84 c0                	test   %al,%al
    16b3:	75 da                	jne    168f <printf+0x103>
    16b5:	eb 68                	jmp    171f <printf+0x193>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    16b7:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
    16bb:	75 1d                	jne    16da <printf+0x14e>
        putc(fd, *ap);
    16bd:	8b 45 e8             	mov    -0x18(%ebp),%eax
    16c0:	8b 00                	mov    (%eax),%eax
    16c2:	0f be c0             	movsbl %al,%eax
    16c5:	89 44 24 04          	mov    %eax,0x4(%esp)
    16c9:	8b 45 08             	mov    0x8(%ebp),%eax
    16cc:	89 04 24             	mov    %eax,(%esp)
    16cf:	e8 d8 fd ff ff       	call   14ac <putc>
        ap++;
    16d4:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    16d8:	eb 45                	jmp    171f <printf+0x193>
      } else if(c == '%'){
    16da:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    16de:	75 17                	jne    16f7 <printf+0x16b>
        putc(fd, c);
    16e0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    16e3:	0f be c0             	movsbl %al,%eax
    16e6:	89 44 24 04          	mov    %eax,0x4(%esp)
    16ea:	8b 45 08             	mov    0x8(%ebp),%eax
    16ed:	89 04 24             	mov    %eax,(%esp)
    16f0:	e8 b7 fd ff ff       	call   14ac <putc>
    16f5:	eb 28                	jmp    171f <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
    16f7:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
    16fe:	00 
    16ff:	8b 45 08             	mov    0x8(%ebp),%eax
    1702:	89 04 24             	mov    %eax,(%esp)
    1705:	e8 a2 fd ff ff       	call   14ac <putc>
        putc(fd, c);
    170a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    170d:	0f be c0             	movsbl %al,%eax
    1710:	89 44 24 04          	mov    %eax,0x4(%esp)
    1714:	8b 45 08             	mov    0x8(%ebp),%eax
    1717:	89 04 24             	mov    %eax,(%esp)
    171a:	e8 8d fd ff ff       	call   14ac <putc>
      }
      state = 0;
    171f:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1726:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    172a:	8b 55 0c             	mov    0xc(%ebp),%edx
    172d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1730:	01 d0                	add    %edx,%eax
    1732:	0f b6 00             	movzbl (%eax),%eax
    1735:	84 c0                	test   %al,%al
    1737:	0f 85 71 fe ff ff    	jne    15ae <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    173d:	c9                   	leave  
    173e:	c3                   	ret    
    173f:	90                   	nop

00001740 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    1740:	55                   	push   %ebp
    1741:	89 e5                	mov    %esp,%ebp
    1743:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
    1746:	8b 45 08             	mov    0x8(%ebp),%eax
    1749:	83 e8 08             	sub    $0x8,%eax
    174c:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    174f:	a1 60 22 00 00       	mov    0x2260,%eax
    1754:	89 45 fc             	mov    %eax,-0x4(%ebp)
    1757:	eb 24                	jmp    177d <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1759:	8b 45 fc             	mov    -0x4(%ebp),%eax
    175c:	8b 00                	mov    (%eax),%eax
    175e:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    1761:	77 12                	ja     1775 <free+0x35>
    1763:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1766:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    1769:	77 24                	ja     178f <free+0x4f>
    176b:	8b 45 fc             	mov    -0x4(%ebp),%eax
    176e:	8b 00                	mov    (%eax),%eax
    1770:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    1773:	77 1a                	ja     178f <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1775:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1778:	8b 00                	mov    (%eax),%eax
    177a:	89 45 fc             	mov    %eax,-0x4(%ebp)
    177d:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1780:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    1783:	76 d4                	jbe    1759 <free+0x19>
    1785:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1788:	8b 00                	mov    (%eax),%eax
    178a:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    178d:	76 ca                	jbe    1759 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    178f:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1792:	8b 40 04             	mov    0x4(%eax),%eax
    1795:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    179c:	8b 45 f8             	mov    -0x8(%ebp),%eax
    179f:	01 c2                	add    %eax,%edx
    17a1:	8b 45 fc             	mov    -0x4(%ebp),%eax
    17a4:	8b 00                	mov    (%eax),%eax
    17a6:	39 c2                	cmp    %eax,%edx
    17a8:	75 24                	jne    17ce <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
    17aa:	8b 45 f8             	mov    -0x8(%ebp),%eax
    17ad:	8b 50 04             	mov    0x4(%eax),%edx
    17b0:	8b 45 fc             	mov    -0x4(%ebp),%eax
    17b3:	8b 00                	mov    (%eax),%eax
    17b5:	8b 40 04             	mov    0x4(%eax),%eax
    17b8:	01 c2                	add    %eax,%edx
    17ba:	8b 45 f8             	mov    -0x8(%ebp),%eax
    17bd:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
    17c0:	8b 45 fc             	mov    -0x4(%ebp),%eax
    17c3:	8b 00                	mov    (%eax),%eax
    17c5:	8b 10                	mov    (%eax),%edx
    17c7:	8b 45 f8             	mov    -0x8(%ebp),%eax
    17ca:	89 10                	mov    %edx,(%eax)
    17cc:	eb 0a                	jmp    17d8 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
    17ce:	8b 45 fc             	mov    -0x4(%ebp),%eax
    17d1:	8b 10                	mov    (%eax),%edx
    17d3:	8b 45 f8             	mov    -0x8(%ebp),%eax
    17d6:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
    17d8:	8b 45 fc             	mov    -0x4(%ebp),%eax
    17db:	8b 40 04             	mov    0x4(%eax),%eax
    17de:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    17e5:	8b 45 fc             	mov    -0x4(%ebp),%eax
    17e8:	01 d0                	add    %edx,%eax
    17ea:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    17ed:	75 20                	jne    180f <free+0xcf>
    p->s.size += bp->s.size;
    17ef:	8b 45 fc             	mov    -0x4(%ebp),%eax
    17f2:	8b 50 04             	mov    0x4(%eax),%edx
    17f5:	8b 45 f8             	mov    -0x8(%ebp),%eax
    17f8:	8b 40 04             	mov    0x4(%eax),%eax
    17fb:	01 c2                	add    %eax,%edx
    17fd:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1800:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    1803:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1806:	8b 10                	mov    (%eax),%edx
    1808:	8b 45 fc             	mov    -0x4(%ebp),%eax
    180b:	89 10                	mov    %edx,(%eax)
    180d:	eb 08                	jmp    1817 <free+0xd7>
  } else
    p->s.ptr = bp;
    180f:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1812:	8b 55 f8             	mov    -0x8(%ebp),%edx
    1815:	89 10                	mov    %edx,(%eax)
  freep = p;
    1817:	8b 45 fc             	mov    -0x4(%ebp),%eax
    181a:	a3 60 22 00 00       	mov    %eax,0x2260
}
    181f:	c9                   	leave  
    1820:	c3                   	ret    

00001821 <morecore>:

static Header*
morecore(uint nu)
{
    1821:	55                   	push   %ebp
    1822:	89 e5                	mov    %esp,%ebp
    1824:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
    1827:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
    182e:	77 07                	ja     1837 <morecore+0x16>
    nu = 4096;
    1830:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
    1837:	8b 45 08             	mov    0x8(%ebp),%eax
    183a:	c1 e0 03             	shl    $0x3,%eax
    183d:	89 04 24             	mov    %eax,(%esp)
    1840:	e8 2f fc ff ff       	call   1474 <sbrk>
    1845:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
    1848:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
    184c:	75 07                	jne    1855 <morecore+0x34>
    return 0;
    184e:	b8 00 00 00 00       	mov    $0x0,%eax
    1853:	eb 22                	jmp    1877 <morecore+0x56>
  hp = (Header*)p;
    1855:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1858:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
    185b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    185e:	8b 55 08             	mov    0x8(%ebp),%edx
    1861:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
    1864:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1867:	83 c0 08             	add    $0x8,%eax
    186a:	89 04 24             	mov    %eax,(%esp)
    186d:	e8 ce fe ff ff       	call   1740 <free>
  return freep;
    1872:	a1 60 22 00 00       	mov    0x2260,%eax
}
    1877:	c9                   	leave  
    1878:	c3                   	ret    

00001879 <malloc>:

void*
malloc(uint nbytes)
{
    1879:	55                   	push   %ebp
    187a:	89 e5                	mov    %esp,%ebp
    187c:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    187f:	8b 45 08             	mov    0x8(%ebp),%eax
    1882:	83 c0 07             	add    $0x7,%eax
    1885:	c1 e8 03             	shr    $0x3,%eax
    1888:	83 c0 01             	add    $0x1,%eax
    188b:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
    188e:	a1 60 22 00 00       	mov    0x2260,%eax
    1893:	89 45 f0             	mov    %eax,-0x10(%ebp)
    1896:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    189a:	75 23                	jne    18bf <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
    189c:	c7 45 f0 58 22 00 00 	movl   $0x2258,-0x10(%ebp)
    18a3:	8b 45 f0             	mov    -0x10(%ebp),%eax
    18a6:	a3 60 22 00 00       	mov    %eax,0x2260
    18ab:	a1 60 22 00 00       	mov    0x2260,%eax
    18b0:	a3 58 22 00 00       	mov    %eax,0x2258
    base.s.size = 0;
    18b5:	c7 05 5c 22 00 00 00 	movl   $0x0,0x225c
    18bc:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    18bf:	8b 45 f0             	mov    -0x10(%ebp),%eax
    18c2:	8b 00                	mov    (%eax),%eax
    18c4:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
    18c7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    18ca:	8b 40 04             	mov    0x4(%eax),%eax
    18cd:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    18d0:	72 4d                	jb     191f <malloc+0xa6>
      if(p->s.size == nunits)
    18d2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    18d5:	8b 40 04             	mov    0x4(%eax),%eax
    18d8:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    18db:	75 0c                	jne    18e9 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
    18dd:	8b 45 f4             	mov    -0xc(%ebp),%eax
    18e0:	8b 10                	mov    (%eax),%edx
    18e2:	8b 45 f0             	mov    -0x10(%ebp),%eax
    18e5:	89 10                	mov    %edx,(%eax)
    18e7:	eb 26                	jmp    190f <malloc+0x96>
      else {
        p->s.size -= nunits;
    18e9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    18ec:	8b 40 04             	mov    0x4(%eax),%eax
    18ef:	2b 45 ec             	sub    -0x14(%ebp),%eax
    18f2:	89 c2                	mov    %eax,%edx
    18f4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    18f7:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
    18fa:	8b 45 f4             	mov    -0xc(%ebp),%eax
    18fd:	8b 40 04             	mov    0x4(%eax),%eax
    1900:	c1 e0 03             	shl    $0x3,%eax
    1903:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
    1906:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1909:	8b 55 ec             	mov    -0x14(%ebp),%edx
    190c:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
    190f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1912:	a3 60 22 00 00       	mov    %eax,0x2260
      return (void*)(p + 1);
    1917:	8b 45 f4             	mov    -0xc(%ebp),%eax
    191a:	83 c0 08             	add    $0x8,%eax
    191d:	eb 38                	jmp    1957 <malloc+0xde>
    }
    if(p == freep)
    191f:	a1 60 22 00 00       	mov    0x2260,%eax
    1924:	39 45 f4             	cmp    %eax,-0xc(%ebp)
    1927:	75 1b                	jne    1944 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
    1929:	8b 45 ec             	mov    -0x14(%ebp),%eax
    192c:	89 04 24             	mov    %eax,(%esp)
    192f:	e8 ed fe ff ff       	call   1821 <morecore>
    1934:	89 45 f4             	mov    %eax,-0xc(%ebp)
    1937:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    193b:	75 07                	jne    1944 <malloc+0xcb>
        return 0;
    193d:	b8 00 00 00 00       	mov    $0x0,%eax
    1942:	eb 13                	jmp    1957 <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1944:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1947:	89 45 f0             	mov    %eax,-0x10(%ebp)
    194a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    194d:	8b 00                	mov    (%eax),%eax
    194f:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
    1952:	e9 70 ff ff ff       	jmp    18c7 <malloc+0x4e>
}
    1957:	c9                   	leave  
    1958:	c3                   	ret    
    1959:	66 90                	xchg   %ax,%ax
    195b:	90                   	nop

0000195c <xchg>:
  asm volatile("sti");
}

static inline uint
xchg(volatile uint *addr, uint newval)
{
    195c:	55                   	push   %ebp
    195d:	89 e5                	mov    %esp,%ebp
    195f:	83 ec 10             	sub    $0x10,%esp
  uint result;
  
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
    1962:	8b 55 08             	mov    0x8(%ebp),%edx
    1965:	8b 45 0c             	mov    0xc(%ebp),%eax
    1968:	8b 4d 08             	mov    0x8(%ebp),%ecx
    196b:	f0 87 02             	lock xchg %eax,(%edx)
    196e:	89 45 fc             	mov    %eax,-0x4(%ebp)
               "+m" (*addr), "=a" (result) :
               "1" (newval) :
               "cc");
  return result;
    1971:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    1974:	c9                   	leave  
    1975:	c3                   	ret    

00001976 <lock_init>:
#include "x86.h"
#include "proc.h"

unsigned long rands = 1;

void lock_init(lock_t *lock){
    1976:	55                   	push   %ebp
    1977:	89 e5                	mov    %esp,%ebp
    lock->locked = 0;
    1979:	8b 45 08             	mov    0x8(%ebp),%eax
    197c:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
    1982:	5d                   	pop    %ebp
    1983:	c3                   	ret    

00001984 <lock_acquire>:
void lock_acquire(lock_t *lock){
    1984:	55                   	push   %ebp
    1985:	89 e5                	mov    %esp,%ebp
    1987:	83 ec 08             	sub    $0x8,%esp
    while(xchg(&lock->locked,1) != 0);
    198a:	90                   	nop
    198b:	8b 45 08             	mov    0x8(%ebp),%eax
    198e:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
    1995:	00 
    1996:	89 04 24             	mov    %eax,(%esp)
    1999:	e8 be ff ff ff       	call   195c <xchg>
    199e:	85 c0                	test   %eax,%eax
    19a0:	75 e9                	jne    198b <lock_acquire+0x7>
}
    19a2:	c9                   	leave  
    19a3:	c3                   	ret    

000019a4 <lock_release>:
void lock_release(lock_t *lock){
    19a4:	55                   	push   %ebp
    19a5:	89 e5                	mov    %esp,%ebp
    19a7:	83 ec 08             	sub    $0x8,%esp
    xchg(&lock->locked,0);
    19aa:	8b 45 08             	mov    0x8(%ebp),%eax
    19ad:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    19b4:	00 
    19b5:	89 04 24             	mov    %eax,(%esp)
    19b8:	e8 9f ff ff ff       	call   195c <xchg>
}
    19bd:	c9                   	leave  
    19be:	c3                   	ret    

000019bf <thread_create>:


void *thread_create(void(*start_routine)(void*), void *arg){
    19bf:	55                   	push   %ebp
    19c0:	89 e5                	mov    %esp,%ebp
    19c2:	83 ec 28             	sub    $0x28,%esp
    int tid;
    void * stack = malloc(2 * 4096);
    19c5:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
    19cc:	e8 a8 fe ff ff       	call   1879 <malloc>
    19d1:	89 45 f4             	mov    %eax,-0xc(%ebp)
    void *garbage_stack = stack; 
    19d4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    19d7:	89 45 f0             	mov    %eax,-0x10(%ebp)
   // printf(1,"start routine addr : %d\n",(uint)start_routine);


    if((uint)stack % 4096){
    19da:	8b 45 f4             	mov    -0xc(%ebp),%eax
    19dd:	25 ff 0f 00 00       	and    $0xfff,%eax
    19e2:	85 c0                	test   %eax,%eax
    19e4:	74 14                	je     19fa <thread_create+0x3b>
        stack = stack + (4096 - (uint)stack % 4096);
    19e6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    19e9:	25 ff 0f 00 00       	and    $0xfff,%eax
    19ee:	89 c2                	mov    %eax,%edx
    19f0:	b8 00 10 00 00       	mov    $0x1000,%eax
    19f5:	29 d0                	sub    %edx,%eax
    19f7:	01 45 f4             	add    %eax,-0xc(%ebp)
    }
    if (stack == 0){
    19fa:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    19fe:	75 1b                	jne    1a1b <thread_create+0x5c>

        printf(1,"malloc fail \n");
    1a00:	c7 44 24 04 b1 1d 00 	movl   $0x1db1,0x4(%esp)
    1a07:	00 
    1a08:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1a0f:	e8 78 fb ff ff       	call   158c <printf>
        return 0;
    1a14:	b8 00 00 00 00       	mov    $0x0,%eax
    1a19:	eb 6f                	jmp    1a8a <thread_create+0xcb>
    }

    tid = clone((uint)stack,PSIZE,(uint)start_routine,(int)arg);
    1a1b:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    1a1e:	8b 55 08             	mov    0x8(%ebp),%edx
    1a21:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1a24:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
    1a28:	89 54 24 08          	mov    %edx,0x8(%esp)
    1a2c:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
    1a33:	00 
    1a34:	89 04 24             	mov    %eax,(%esp)
    1a37:	e8 50 fa ff ff       	call   148c <clone>
    1a3c:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(tid < 0){
    1a3f:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1a43:	79 1b                	jns    1a60 <thread_create+0xa1>
        printf(1,"clone fails\n");
    1a45:	c7 44 24 04 bf 1d 00 	movl   $0x1dbf,0x4(%esp)
    1a4c:	00 
    1a4d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1a54:	e8 33 fb ff ff       	call   158c <printf>
        return 0;
    1a59:	b8 00 00 00 00       	mov    $0x0,%eax
    1a5e:	eb 2a                	jmp    1a8a <thread_create+0xcb>
    }
    if(tid > 0){
    1a60:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1a64:	7e 05                	jle    1a6b <thread_create+0xac>
        //store threads on thread table
        return garbage_stack;
    1a66:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1a69:	eb 1f                	jmp    1a8a <thread_create+0xcb>
    }
    if(tid == 0){
    1a6b:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1a6f:	75 14                	jne    1a85 <thread_create+0xc6>
        printf(1,"tid = 0 return \n");
    1a71:	c7 44 24 04 cc 1d 00 	movl   $0x1dcc,0x4(%esp)
    1a78:	00 
    1a79:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1a80:	e8 07 fb ff ff       	call   158c <printf>
    }
//    wait();
//    free(garbage_stack);

    return 0;
    1a85:	b8 00 00 00 00       	mov    $0x0,%eax
}
    1a8a:	c9                   	leave  
    1a8b:	c3                   	ret    

00001a8c <random>:

// generate 0 -> max random number exclude max.
int random(int max){
    1a8c:	55                   	push   %ebp
    1a8d:	89 e5                	mov    %esp,%ebp
    rands = rands * 1664525 + 1013904233;
    1a8f:	a1 54 22 00 00       	mov    0x2254,%eax
    1a94:	69 c0 0d 66 19 00    	imul   $0x19660d,%eax,%eax
    1a9a:	05 69 f3 6e 3c       	add    $0x3c6ef369,%eax
    1a9f:	a3 54 22 00 00       	mov    %eax,0x2254
    return (int)(rands % max);
    1aa4:	a1 54 22 00 00       	mov    0x2254,%eax
    1aa9:	8b 4d 08             	mov    0x8(%ebp),%ecx
    1aac:	ba 00 00 00 00       	mov    $0x0,%edx
    1ab1:	f7 f1                	div    %ecx
    1ab3:	89 d0                	mov    %edx,%eax
}
    1ab5:	5d                   	pop    %ebp
    1ab6:	c3                   	ret    
    1ab7:	90                   	nop

00001ab8 <init_q>:
#include "queue.h"
#include "types.h"
#include "user.h"

void init_q(struct queue *q){
    1ab8:	55                   	push   %ebp
    1ab9:	89 e5                	mov    %esp,%ebp
    q->size = 0;
    1abb:	8b 45 08             	mov    0x8(%ebp),%eax
    1abe:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    q->head = 0;
    1ac4:	8b 45 08             	mov    0x8(%ebp),%eax
    1ac7:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    q->tail = 0;
    1ace:	8b 45 08             	mov    0x8(%ebp),%eax
    1ad1:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
}
    1ad8:	5d                   	pop    %ebp
    1ad9:	c3                   	ret    

00001ada <add_q>:

void add_q(struct queue *q, int v){
    1ada:	55                   	push   %ebp
    1adb:	89 e5                	mov    %esp,%ebp
    1add:	83 ec 28             	sub    $0x28,%esp
    struct node * n = malloc(sizeof(struct node));
    1ae0:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
    1ae7:	e8 8d fd ff ff       	call   1879 <malloc>
    1aec:	89 45 f4             	mov    %eax,-0xc(%ebp)
    n->next = 0;
    1aef:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1af2:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    n->value = v;
    1af9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1afc:	8b 55 0c             	mov    0xc(%ebp),%edx
    1aff:	89 10                	mov    %edx,(%eax)
    if(q->head == 0){
    1b01:	8b 45 08             	mov    0x8(%ebp),%eax
    1b04:	8b 40 04             	mov    0x4(%eax),%eax
    1b07:	85 c0                	test   %eax,%eax
    1b09:	75 0b                	jne    1b16 <add_q+0x3c>
        q->head = n;
    1b0b:	8b 45 08             	mov    0x8(%ebp),%eax
    1b0e:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1b11:	89 50 04             	mov    %edx,0x4(%eax)
    1b14:	eb 0c                	jmp    1b22 <add_q+0x48>
    }else{
        q->tail->next = n;
    1b16:	8b 45 08             	mov    0x8(%ebp),%eax
    1b19:	8b 40 08             	mov    0x8(%eax),%eax
    1b1c:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1b1f:	89 50 04             	mov    %edx,0x4(%eax)
    }
    q->tail = n;
    1b22:	8b 45 08             	mov    0x8(%ebp),%eax
    1b25:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1b28:	89 50 08             	mov    %edx,0x8(%eax)
    q->size++;
    1b2b:	8b 45 08             	mov    0x8(%ebp),%eax
    1b2e:	8b 00                	mov    (%eax),%eax
    1b30:	8d 50 01             	lea    0x1(%eax),%edx
    1b33:	8b 45 08             	mov    0x8(%ebp),%eax
    1b36:	89 10                	mov    %edx,(%eax)
}
    1b38:	c9                   	leave  
    1b39:	c3                   	ret    

00001b3a <empty_q>:

int empty_q(struct queue *q){
    1b3a:	55                   	push   %ebp
    1b3b:	89 e5                	mov    %esp,%ebp
    if(q->size == 0)
    1b3d:	8b 45 08             	mov    0x8(%ebp),%eax
    1b40:	8b 00                	mov    (%eax),%eax
    1b42:	85 c0                	test   %eax,%eax
    1b44:	75 07                	jne    1b4d <empty_q+0x13>
        return 1;
    1b46:	b8 01 00 00 00       	mov    $0x1,%eax
    1b4b:	eb 05                	jmp    1b52 <empty_q+0x18>
    else
        return 0;
    1b4d:	b8 00 00 00 00       	mov    $0x0,%eax
} 
    1b52:	5d                   	pop    %ebp
    1b53:	c3                   	ret    

00001b54 <pop_q>:
int pop_q(struct queue *q){
    1b54:	55                   	push   %ebp
    1b55:	89 e5                	mov    %esp,%ebp
    1b57:	83 ec 28             	sub    $0x28,%esp
    int val;
    struct node *destroy;
    if(!empty_q(q)){
    1b5a:	8b 45 08             	mov    0x8(%ebp),%eax
    1b5d:	89 04 24             	mov    %eax,(%esp)
    1b60:	e8 d5 ff ff ff       	call   1b3a <empty_q>
    1b65:	85 c0                	test   %eax,%eax
    1b67:	75 5d                	jne    1bc6 <pop_q+0x72>
       val = q->head->value; 
    1b69:	8b 45 08             	mov    0x8(%ebp),%eax
    1b6c:	8b 40 04             	mov    0x4(%eax),%eax
    1b6f:	8b 00                	mov    (%eax),%eax
    1b71:	89 45 f4             	mov    %eax,-0xc(%ebp)
       destroy = q->head;
    1b74:	8b 45 08             	mov    0x8(%ebp),%eax
    1b77:	8b 40 04             	mov    0x4(%eax),%eax
    1b7a:	89 45 f0             	mov    %eax,-0x10(%ebp)
       q->head = q->head->next;
    1b7d:	8b 45 08             	mov    0x8(%ebp),%eax
    1b80:	8b 40 04             	mov    0x4(%eax),%eax
    1b83:	8b 50 04             	mov    0x4(%eax),%edx
    1b86:	8b 45 08             	mov    0x8(%ebp),%eax
    1b89:	89 50 04             	mov    %edx,0x4(%eax)
       free(destroy);
    1b8c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1b8f:	89 04 24             	mov    %eax,(%esp)
    1b92:	e8 a9 fb ff ff       	call   1740 <free>
       q->size--;
    1b97:	8b 45 08             	mov    0x8(%ebp),%eax
    1b9a:	8b 00                	mov    (%eax),%eax
    1b9c:	8d 50 ff             	lea    -0x1(%eax),%edx
    1b9f:	8b 45 08             	mov    0x8(%ebp),%eax
    1ba2:	89 10                	mov    %edx,(%eax)
       if(q->size == 0){
    1ba4:	8b 45 08             	mov    0x8(%ebp),%eax
    1ba7:	8b 00                	mov    (%eax),%eax
    1ba9:	85 c0                	test   %eax,%eax
    1bab:	75 14                	jne    1bc1 <pop_q+0x6d>
            q->head = 0;
    1bad:	8b 45 08             	mov    0x8(%ebp),%eax
    1bb0:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
            q->tail = 0;
    1bb7:	8b 45 08             	mov    0x8(%ebp),%eax
    1bba:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
       }
       return val;
    1bc1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1bc4:	eb 05                	jmp    1bcb <pop_q+0x77>
    }
    return -1;
    1bc6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
    1bcb:	c9                   	leave  
    1bcc:	c3                   	ret    

00001bcd <dominant>:

void dominant(struct queue* q, int i){
    1bcd:	55                   	push   %ebp
    1bce:	89 e5                	mov    %esp,%ebp
    1bd0:	83 ec 28             	sub    $0x28,%esp
    struct node * n = malloc(sizeof(struct node));
    1bd3:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
    1bda:	e8 9a fc ff ff       	call   1879 <malloc>
    1bdf:	89 45 f4             	mov    %eax,-0xc(%ebp)
    n->value = i;
    1be2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1be5:	8b 55 0c             	mov    0xc(%ebp),%edx
    1be8:	89 10                	mov    %edx,(%eax)

    if(q->head == 0){
    1bea:	8b 45 08             	mov    0x8(%ebp),%eax
    1bed:	8b 40 04             	mov    0x4(%eax),%eax
    1bf0:	85 c0                	test   %eax,%eax
    1bf2:	75 14                	jne    1c08 <dominant+0x3b>
        q->head = n;
    1bf4:	8b 45 08             	mov    0x8(%ebp),%eax
    1bf7:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1bfa:	89 50 04             	mov    %edx,0x4(%eax)
        q->tail = n;
    1bfd:	8b 45 08             	mov    0x8(%ebp),%eax
    1c00:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1c03:	89 50 08             	mov    %edx,0x8(%eax)
    1c06:	eb 15                	jmp    1c1d <dominant+0x50>
    }
    else{
        n->next = q->head;
    1c08:	8b 45 08             	mov    0x8(%ebp),%eax
    1c0b:	8b 50 04             	mov    0x4(%eax),%edx
    1c0e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1c11:	89 50 04             	mov    %edx,0x4(%eax)
        q->head = n;
    1c14:	8b 45 08             	mov    0x8(%ebp),%eax
    1c17:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1c1a:	89 50 04             	mov    %edx,0x4(%eax)
    }
    q->size++;
    1c1d:	8b 45 08             	mov    0x8(%ebp),%eax
    1c20:	8b 00                	mov    (%eax),%eax
    1c22:	8d 50 01             	lea    0x1(%eax),%edx
    1c25:	8b 45 08             	mov    0x8(%ebp),%eax
    1c28:	89 10                	mov    %edx,(%eax)
}
    1c2a:	c9                   	leave  
    1c2b:	c3                   	ret    

00001c2c <sem_init>:
#include "semaphore.h"
#include "user.h"

// Initializes the semaphore
void sem_init(struct Semaphore* s, int value){
    1c2c:	55                   	push   %ebp
    1c2d:	89 e5                	mov    %esp,%ebp
    1c2f:	83 ec 18             	sub    $0x18,%esp
    s->val = value;
    1c32:	8b 45 08             	mov    0x8(%ebp),%eax
    1c35:	8b 55 0c             	mov    0xc(%ebp),%edx
    1c38:	89 10                	mov    %edx,(%eax)
    lock_init(&s->lock);
    1c3a:	8b 45 08             	mov    0x8(%ebp),%eax
    1c3d:	83 c0 04             	add    $0x4,%eax
    1c40:	89 04 24             	mov    %eax,(%esp)
    1c43:	e8 2e fd ff ff       	call   1976 <lock_init>
    init_q(&s->q);
    1c48:	8b 45 08             	mov    0x8(%ebp),%eax
    1c4b:	83 c0 08             	add    $0x8,%eax
    1c4e:	89 04 24             	mov    %eax,(%esp)
    1c51:	e8 62 fe ff ff       	call   1ab8 <init_q>
}
    1c56:	c9                   	leave  
    1c57:	c3                   	ret    

00001c58 <sem_acquire>:

// Decrements the semaphore
void sem_acquire(struct Semaphore* s){
    1c58:	55                   	push   %ebp
    1c59:	89 e5                	mov    %esp,%ebp
    1c5b:	83 ec 28             	sub    $0x28,%esp
    lock_acquire(&s->lock);
    1c5e:	8b 45 08             	mov    0x8(%ebp),%eax
    1c61:	83 c0 04             	add    $0x4,%eax
    1c64:	89 04 24             	mov    %eax,(%esp)
    1c67:	e8 18 fd ff ff       	call   1984 <lock_acquire>

    if(s->val == 0){
    1c6c:	8b 45 08             	mov    0x8(%ebp),%eax
    1c6f:	8b 00                	mov    (%eax),%eax
    1c71:	85 c0                	test   %eax,%eax
    1c73:	75 32                	jne    1ca7 <sem_acquire+0x4f>
        int pid;
        pid = getpid();
    1c75:	e8 f2 f7 ff ff       	call   146c <getpid>
    1c7a:	89 45 f4             	mov    %eax,-0xc(%ebp)
        add_q(&s->q, pid);
    1c7d:	8b 45 08             	mov    0x8(%ebp),%eax
    1c80:	8d 50 08             	lea    0x8(%eax),%edx
    1c83:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1c86:	89 44 24 04          	mov    %eax,0x4(%esp)
    1c8a:	89 14 24             	mov    %edx,(%esp)
    1c8d:	e8 48 fe ff ff       	call   1ada <add_q>
        lock_release(&s->lock);
    1c92:	8b 45 08             	mov    0x8(%ebp),%eax
    1c95:	83 c0 04             	add    $0x4,%eax
    1c98:	89 04 24             	mov    %eax,(%esp)
    1c9b:	e8 04 fd ff ff       	call   19a4 <lock_release>
        tsleep();
    1ca0:	e8 f7 f7 ff ff       	call   149c <tsleep>
    1ca5:	eb 1b                	jmp    1cc2 <sem_acquire+0x6a>
    }
    else{
        s->val--;
    1ca7:	8b 45 08             	mov    0x8(%ebp),%eax
    1caa:	8b 00                	mov    (%eax),%eax
    1cac:	8d 50 ff             	lea    -0x1(%eax),%edx
    1caf:	8b 45 08             	mov    0x8(%ebp),%eax
    1cb2:	89 10                	mov    %edx,(%eax)
        lock_release(&s->lock);
    1cb4:	8b 45 08             	mov    0x8(%ebp),%eax
    1cb7:	83 c0 04             	add    $0x4,%eax
    1cba:	89 04 24             	mov    %eax,(%esp)
    1cbd:	e8 e2 fc ff ff       	call   19a4 <lock_release>
    }
}
    1cc2:	c9                   	leave  
    1cc3:	c3                   	ret    

00001cc4 <sem_signal>:

// Increments the semaphore
void sem_signal(struct Semaphore* s){
    1cc4:	55                   	push   %ebp
    1cc5:	89 e5                	mov    %esp,%ebp
    1cc7:	83 ec 18             	sub    $0x18,%esp
    lock_acquire(&s->lock);
    1cca:	8b 45 08             	mov    0x8(%ebp),%eax
    1ccd:	83 c0 04             	add    $0x4,%eax
    1cd0:	89 04 24             	mov    %eax,(%esp)
    1cd3:	e8 ac fc ff ff       	call   1984 <lock_acquire>

    if(!empty_q(&s->q)){
    1cd8:	8b 45 08             	mov    0x8(%ebp),%eax
    1cdb:	83 c0 08             	add    $0x8,%eax
    1cde:	89 04 24             	mov    %eax,(%esp)
    1ce1:	e8 54 fe ff ff       	call   1b3a <empty_q>
    1ce6:	85 c0                	test   %eax,%eax
    1ce8:	75 18                	jne    1d02 <sem_signal+0x3e>
        twakeup(pop_q(&s->q));
    1cea:	8b 45 08             	mov    0x8(%ebp),%eax
    1ced:	83 c0 08             	add    $0x8,%eax
    1cf0:	89 04 24             	mov    %eax,(%esp)
    1cf3:	e8 5c fe ff ff       	call   1b54 <pop_q>
    1cf8:	89 04 24             	mov    %eax,(%esp)
    1cfb:	e8 a4 f7 ff ff       	call   14a4 <twakeup>
    1d00:	eb 0d                	jmp    1d0f <sem_signal+0x4b>
    }
    else{
        s->val++;
    1d02:	8b 45 08             	mov    0x8(%ebp),%eax
    1d05:	8b 00                	mov    (%eax),%eax
    1d07:	8d 50 01             	lea    0x1(%eax),%edx
    1d0a:	8b 45 08             	mov    0x8(%ebp),%eax
    1d0d:	89 10                	mov    %edx,(%eax)
    }

    lock_release(&s->lock);
    1d0f:	8b 45 08             	mov    0x8(%ebp),%eax
    1d12:	83 c0 04             	add    $0x4,%eax
    1d15:	89 04 24             	mov    %eax,(%esp)
    1d18:	e8 87 fc ff ff       	call   19a4 <lock_release>
}
    1d1d:	c9                   	leave  
    1d1e:	c3                   	ret    

00001d1f <sem_dom_acquire>:

void sem_dom_acquire(struct Semaphore* s){
    1d1f:	55                   	push   %ebp
    1d20:	89 e5                	mov    %esp,%ebp
    1d22:	83 ec 18             	sub    $0x18,%esp
    lock_acquire(&s->lock);
    1d25:	8b 45 08             	mov    0x8(%ebp),%eax
    1d28:	83 c0 04             	add    $0x4,%eax
    1d2b:	89 04 24             	mov    %eax,(%esp)
    1d2e:	e8 51 fc ff ff       	call   1984 <lock_acquire>

    if(s->val > 0){
    1d33:	8b 45 08             	mov    0x8(%ebp),%eax
    1d36:	8b 00                	mov    (%eax),%eax
    1d38:	85 c0                	test   %eax,%eax
    1d3a:	7e 1d                	jle    1d59 <sem_dom_acquire+0x3a>
        s->val--;
    1d3c:	8b 45 08             	mov    0x8(%ebp),%eax
    1d3f:	8b 00                	mov    (%eax),%eax
    1d41:	8d 50 ff             	lea    -0x1(%eax),%edx
    1d44:	8b 45 08             	mov    0x8(%ebp),%eax
    1d47:	89 10                	mov    %edx,(%eax)
        lock_release(&s->lock);
    1d49:	8b 45 08             	mov    0x8(%ebp),%eax
    1d4c:	83 c0 04             	add    $0x4,%eax
    1d4f:	89 04 24             	mov    %eax,(%esp)
    1d52:	e8 4d fc ff ff       	call   19a4 <lock_release>
        return;
    1d57:	eb 2a                	jmp    1d83 <sem_dom_acquire+0x64>
    }

    dominant(&s->q,getpid());
    1d59:	e8 0e f7 ff ff       	call   146c <getpid>
    1d5e:	8b 55 08             	mov    0x8(%ebp),%edx
    1d61:	83 c2 08             	add    $0x8,%edx
    1d64:	89 44 24 04          	mov    %eax,0x4(%esp)
    1d68:	89 14 24             	mov    %edx,(%esp)
    1d6b:	e8 5d fe ff ff       	call   1bcd <dominant>
    lock_release(&s->lock);
    1d70:	8b 45 08             	mov    0x8(%ebp),%eax
    1d73:	83 c0 04             	add    $0x4,%eax
    1d76:	89 04 24             	mov    %eax,(%esp)
    1d79:	e8 26 fc ff ff       	call   19a4 <lock_release>
    tsleep();
    1d7e:	e8 19 f7 ff ff       	call   149c <tsleep>
}
    1d83:	c9                   	leave  
    1d84:	c3                   	ret    
