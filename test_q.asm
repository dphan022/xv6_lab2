
_test_q:     file format elf32-i386


Disassembly of section .text:

00001000 <main>:
#include "types.h"
#include "user.h"
#include "queue.h"

int main(){
    1000:	55                   	push   %ebp
    1001:	89 e5                	mov    %esp,%ebp
    1003:	83 e4 f0             	and    $0xfffffff0,%esp
    1006:	83 ec 20             	sub    $0x20,%esp
    struct queue *q = malloc(sizeof(struct queue));
    1009:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
    1010:	e8 6c 07 00 00       	call   1781 <malloc>
    1015:	89 44 24 18          	mov    %eax,0x18(%esp)
    int i;
    init_q(q);
    1019:	8b 44 24 18          	mov    0x18(%esp),%eax
    101d:	89 04 24             	mov    %eax,(%esp)
    1020:	e8 9b 09 00 00       	call   19c0 <init_q>
    for(i=0;i<10;i++){
    1025:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
    102c:	00 
    102d:	eb 19                	jmp    1048 <main+0x48>
        add_q(q,i);
    102f:	8b 44 24 1c          	mov    0x1c(%esp),%eax
    1033:	89 44 24 04          	mov    %eax,0x4(%esp)
    1037:	8b 44 24 18          	mov    0x18(%esp),%eax
    103b:	89 04 24             	mov    %eax,(%esp)
    103e:	e8 9f 09 00 00       	call   19e2 <add_q>

int main(){
    struct queue *q = malloc(sizeof(struct queue));
    int i;
    init_q(q);
    for(i=0;i<10;i++){
    1043:	83 44 24 1c 01       	addl   $0x1,0x1c(%esp)
    1048:	83 7c 24 1c 09       	cmpl   $0x9,0x1c(%esp)
    104d:	7e e0                	jle    102f <main+0x2f>
        add_q(q,i);
    }
    for(;!empty_q(q);){
    104f:	eb 24                	jmp    1075 <main+0x75>
        printf(1,"pop %d\n",pop_q(q));
    1051:	8b 44 24 18          	mov    0x18(%esp),%eax
    1055:	89 04 24             	mov    %eax,(%esp)
    1058:	e8 ff 09 00 00       	call   1a5c <pop_q>
    105d:	89 44 24 08          	mov    %eax,0x8(%esp)
    1061:	c7 44 24 04 8d 1c 00 	movl   $0x1c8d,0x4(%esp)
    1068:	00 
    1069:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1070:	e8 1f 04 00 00       	call   1494 <printf>
    int i;
    init_q(q);
    for(i=0;i<10;i++){
        add_q(q,i);
    }
    for(;!empty_q(q);){
    1075:	8b 44 24 18          	mov    0x18(%esp),%eax
    1079:	89 04 24             	mov    %eax,(%esp)
    107c:	e8 c1 09 00 00       	call   1a42 <empty_q>
    1081:	85 c0                	test   %eax,%eax
    1083:	74 cc                	je     1051 <main+0x51>
        printf(1,"pop %d\n",pop_q(q));
    }
    exit();
    1085:	e8 6a 02 00 00       	call   12f4 <exit>
    108a:	66 90                	xchg   %ax,%ax

0000108c <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
    108c:	55                   	push   %ebp
    108d:	89 e5                	mov    %esp,%ebp
    108f:	57                   	push   %edi
    1090:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
    1091:	8b 4d 08             	mov    0x8(%ebp),%ecx
    1094:	8b 55 10             	mov    0x10(%ebp),%edx
    1097:	8b 45 0c             	mov    0xc(%ebp),%eax
    109a:	89 cb                	mov    %ecx,%ebx
    109c:	89 df                	mov    %ebx,%edi
    109e:	89 d1                	mov    %edx,%ecx
    10a0:	fc                   	cld    
    10a1:	f3 aa                	rep stos %al,%es:(%edi)
    10a3:	89 ca                	mov    %ecx,%edx
    10a5:	89 fb                	mov    %edi,%ebx
    10a7:	89 5d 08             	mov    %ebx,0x8(%ebp)
    10aa:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
    10ad:	5b                   	pop    %ebx
    10ae:	5f                   	pop    %edi
    10af:	5d                   	pop    %ebp
    10b0:	c3                   	ret    

000010b1 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
    10b1:	55                   	push   %ebp
    10b2:	89 e5                	mov    %esp,%ebp
    10b4:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
    10b7:	8b 45 08             	mov    0x8(%ebp),%eax
    10ba:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
    10bd:	90                   	nop
    10be:	8b 45 08             	mov    0x8(%ebp),%eax
    10c1:	8d 50 01             	lea    0x1(%eax),%edx
    10c4:	89 55 08             	mov    %edx,0x8(%ebp)
    10c7:	8b 55 0c             	mov    0xc(%ebp),%edx
    10ca:	8d 4a 01             	lea    0x1(%edx),%ecx
    10cd:	89 4d 0c             	mov    %ecx,0xc(%ebp)
    10d0:	0f b6 12             	movzbl (%edx),%edx
    10d3:	88 10                	mov    %dl,(%eax)
    10d5:	0f b6 00             	movzbl (%eax),%eax
    10d8:	84 c0                	test   %al,%al
    10da:	75 e2                	jne    10be <strcpy+0xd>
    ;
  return os;
    10dc:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    10df:	c9                   	leave  
    10e0:	c3                   	ret    

000010e1 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    10e1:	55                   	push   %ebp
    10e2:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
    10e4:	eb 08                	jmp    10ee <strcmp+0xd>
    p++, q++;
    10e6:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    10ea:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    10ee:	8b 45 08             	mov    0x8(%ebp),%eax
    10f1:	0f b6 00             	movzbl (%eax),%eax
    10f4:	84 c0                	test   %al,%al
    10f6:	74 10                	je     1108 <strcmp+0x27>
    10f8:	8b 45 08             	mov    0x8(%ebp),%eax
    10fb:	0f b6 10             	movzbl (%eax),%edx
    10fe:	8b 45 0c             	mov    0xc(%ebp),%eax
    1101:	0f b6 00             	movzbl (%eax),%eax
    1104:	38 c2                	cmp    %al,%dl
    1106:	74 de                	je     10e6 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
    1108:	8b 45 08             	mov    0x8(%ebp),%eax
    110b:	0f b6 00             	movzbl (%eax),%eax
    110e:	0f b6 d0             	movzbl %al,%edx
    1111:	8b 45 0c             	mov    0xc(%ebp),%eax
    1114:	0f b6 00             	movzbl (%eax),%eax
    1117:	0f b6 c0             	movzbl %al,%eax
    111a:	29 c2                	sub    %eax,%edx
    111c:	89 d0                	mov    %edx,%eax
}
    111e:	5d                   	pop    %ebp
    111f:	c3                   	ret    

00001120 <strlen>:

uint
strlen(char *s)
{
    1120:	55                   	push   %ebp
    1121:	89 e5                	mov    %esp,%ebp
    1123:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
    1126:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    112d:	eb 04                	jmp    1133 <strlen+0x13>
    112f:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    1133:	8b 55 fc             	mov    -0x4(%ebp),%edx
    1136:	8b 45 08             	mov    0x8(%ebp),%eax
    1139:	01 d0                	add    %edx,%eax
    113b:	0f b6 00             	movzbl (%eax),%eax
    113e:	84 c0                	test   %al,%al
    1140:	75 ed                	jne    112f <strlen+0xf>
    ;
  return n;
    1142:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    1145:	c9                   	leave  
    1146:	c3                   	ret    

00001147 <memset>:

void*
memset(void *dst, int c, uint n)
{
    1147:	55                   	push   %ebp
    1148:	89 e5                	mov    %esp,%ebp
    114a:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
    114d:	8b 45 10             	mov    0x10(%ebp),%eax
    1150:	89 44 24 08          	mov    %eax,0x8(%esp)
    1154:	8b 45 0c             	mov    0xc(%ebp),%eax
    1157:	89 44 24 04          	mov    %eax,0x4(%esp)
    115b:	8b 45 08             	mov    0x8(%ebp),%eax
    115e:	89 04 24             	mov    %eax,(%esp)
    1161:	e8 26 ff ff ff       	call   108c <stosb>
  return dst;
    1166:	8b 45 08             	mov    0x8(%ebp),%eax
}
    1169:	c9                   	leave  
    116a:	c3                   	ret    

0000116b <strchr>:

char*
strchr(const char *s, char c)
{
    116b:	55                   	push   %ebp
    116c:	89 e5                	mov    %esp,%ebp
    116e:	83 ec 04             	sub    $0x4,%esp
    1171:	8b 45 0c             	mov    0xc(%ebp),%eax
    1174:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
    1177:	eb 14                	jmp    118d <strchr+0x22>
    if(*s == c)
    1179:	8b 45 08             	mov    0x8(%ebp),%eax
    117c:	0f b6 00             	movzbl (%eax),%eax
    117f:	3a 45 fc             	cmp    -0x4(%ebp),%al
    1182:	75 05                	jne    1189 <strchr+0x1e>
      return (char*)s;
    1184:	8b 45 08             	mov    0x8(%ebp),%eax
    1187:	eb 13                	jmp    119c <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
    1189:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    118d:	8b 45 08             	mov    0x8(%ebp),%eax
    1190:	0f b6 00             	movzbl (%eax),%eax
    1193:	84 c0                	test   %al,%al
    1195:	75 e2                	jne    1179 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
    1197:	b8 00 00 00 00       	mov    $0x0,%eax
}
    119c:	c9                   	leave  
    119d:	c3                   	ret    

0000119e <gets>:

char*
gets(char *buf, int max)
{
    119e:	55                   	push   %ebp
    119f:	89 e5                	mov    %esp,%ebp
    11a1:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    11a4:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    11ab:	eb 4c                	jmp    11f9 <gets+0x5b>
    cc = read(0, &c, 1);
    11ad:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    11b4:	00 
    11b5:	8d 45 ef             	lea    -0x11(%ebp),%eax
    11b8:	89 44 24 04          	mov    %eax,0x4(%esp)
    11bc:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    11c3:	e8 44 01 00 00       	call   130c <read>
    11c8:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
    11cb:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    11cf:	7f 02                	jg     11d3 <gets+0x35>
      break;
    11d1:	eb 31                	jmp    1204 <gets+0x66>
    buf[i++] = c;
    11d3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    11d6:	8d 50 01             	lea    0x1(%eax),%edx
    11d9:	89 55 f4             	mov    %edx,-0xc(%ebp)
    11dc:	89 c2                	mov    %eax,%edx
    11de:	8b 45 08             	mov    0x8(%ebp),%eax
    11e1:	01 c2                	add    %eax,%edx
    11e3:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    11e7:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
    11e9:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    11ed:	3c 0a                	cmp    $0xa,%al
    11ef:	74 13                	je     1204 <gets+0x66>
    11f1:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    11f5:	3c 0d                	cmp    $0xd,%al
    11f7:	74 0b                	je     1204 <gets+0x66>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    11f9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    11fc:	83 c0 01             	add    $0x1,%eax
    11ff:	3b 45 0c             	cmp    0xc(%ebp),%eax
    1202:	7c a9                	jl     11ad <gets+0xf>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    1204:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1207:	8b 45 08             	mov    0x8(%ebp),%eax
    120a:	01 d0                	add    %edx,%eax
    120c:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
    120f:	8b 45 08             	mov    0x8(%ebp),%eax
}
    1212:	c9                   	leave  
    1213:	c3                   	ret    

00001214 <stat>:

int
stat(char *n, struct stat *st)
{
    1214:	55                   	push   %ebp
    1215:	89 e5                	mov    %esp,%ebp
    1217:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    121a:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1221:	00 
    1222:	8b 45 08             	mov    0x8(%ebp),%eax
    1225:	89 04 24             	mov    %eax,(%esp)
    1228:	e8 07 01 00 00       	call   1334 <open>
    122d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
    1230:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1234:	79 07                	jns    123d <stat+0x29>
    return -1;
    1236:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    123b:	eb 23                	jmp    1260 <stat+0x4c>
  r = fstat(fd, st);
    123d:	8b 45 0c             	mov    0xc(%ebp),%eax
    1240:	89 44 24 04          	mov    %eax,0x4(%esp)
    1244:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1247:	89 04 24             	mov    %eax,(%esp)
    124a:	e8 fd 00 00 00       	call   134c <fstat>
    124f:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
    1252:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1255:	89 04 24             	mov    %eax,(%esp)
    1258:	e8 bf 00 00 00       	call   131c <close>
  return r;
    125d:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
    1260:	c9                   	leave  
    1261:	c3                   	ret    

00001262 <atoi>:

int
atoi(const char *s)
{
    1262:	55                   	push   %ebp
    1263:	89 e5                	mov    %esp,%ebp
    1265:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
    1268:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
    126f:	eb 25                	jmp    1296 <atoi+0x34>
    n = n*10 + *s++ - '0';
    1271:	8b 55 fc             	mov    -0x4(%ebp),%edx
    1274:	89 d0                	mov    %edx,%eax
    1276:	c1 e0 02             	shl    $0x2,%eax
    1279:	01 d0                	add    %edx,%eax
    127b:	01 c0                	add    %eax,%eax
    127d:	89 c1                	mov    %eax,%ecx
    127f:	8b 45 08             	mov    0x8(%ebp),%eax
    1282:	8d 50 01             	lea    0x1(%eax),%edx
    1285:	89 55 08             	mov    %edx,0x8(%ebp)
    1288:	0f b6 00             	movzbl (%eax),%eax
    128b:	0f be c0             	movsbl %al,%eax
    128e:	01 c8                	add    %ecx,%eax
    1290:	83 e8 30             	sub    $0x30,%eax
    1293:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    1296:	8b 45 08             	mov    0x8(%ebp),%eax
    1299:	0f b6 00             	movzbl (%eax),%eax
    129c:	3c 2f                	cmp    $0x2f,%al
    129e:	7e 0a                	jle    12aa <atoi+0x48>
    12a0:	8b 45 08             	mov    0x8(%ebp),%eax
    12a3:	0f b6 00             	movzbl (%eax),%eax
    12a6:	3c 39                	cmp    $0x39,%al
    12a8:	7e c7                	jle    1271 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
    12aa:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    12ad:	c9                   	leave  
    12ae:	c3                   	ret    

000012af <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    12af:	55                   	push   %ebp
    12b0:	89 e5                	mov    %esp,%ebp
    12b2:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
    12b5:	8b 45 08             	mov    0x8(%ebp),%eax
    12b8:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
    12bb:	8b 45 0c             	mov    0xc(%ebp),%eax
    12be:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
    12c1:	eb 17                	jmp    12da <memmove+0x2b>
    *dst++ = *src++;
    12c3:	8b 45 fc             	mov    -0x4(%ebp),%eax
    12c6:	8d 50 01             	lea    0x1(%eax),%edx
    12c9:	89 55 fc             	mov    %edx,-0x4(%ebp)
    12cc:	8b 55 f8             	mov    -0x8(%ebp),%edx
    12cf:	8d 4a 01             	lea    0x1(%edx),%ecx
    12d2:	89 4d f8             	mov    %ecx,-0x8(%ebp)
    12d5:	0f b6 12             	movzbl (%edx),%edx
    12d8:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    12da:	8b 45 10             	mov    0x10(%ebp),%eax
    12dd:	8d 50 ff             	lea    -0x1(%eax),%edx
    12e0:	89 55 10             	mov    %edx,0x10(%ebp)
    12e3:	85 c0                	test   %eax,%eax
    12e5:	7f dc                	jg     12c3 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
    12e7:	8b 45 08             	mov    0x8(%ebp),%eax
}
    12ea:	c9                   	leave  
    12eb:	c3                   	ret    

000012ec <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    12ec:	b8 01 00 00 00       	mov    $0x1,%eax
    12f1:	cd 40                	int    $0x40
    12f3:	c3                   	ret    

000012f4 <exit>:
SYSCALL(exit)
    12f4:	b8 02 00 00 00       	mov    $0x2,%eax
    12f9:	cd 40                	int    $0x40
    12fb:	c3                   	ret    

000012fc <wait>:
SYSCALL(wait)
    12fc:	b8 03 00 00 00       	mov    $0x3,%eax
    1301:	cd 40                	int    $0x40
    1303:	c3                   	ret    

00001304 <pipe>:
SYSCALL(pipe)
    1304:	b8 04 00 00 00       	mov    $0x4,%eax
    1309:	cd 40                	int    $0x40
    130b:	c3                   	ret    

0000130c <read>:
SYSCALL(read)
    130c:	b8 05 00 00 00       	mov    $0x5,%eax
    1311:	cd 40                	int    $0x40
    1313:	c3                   	ret    

00001314 <write>:
SYSCALL(write)
    1314:	b8 10 00 00 00       	mov    $0x10,%eax
    1319:	cd 40                	int    $0x40
    131b:	c3                   	ret    

0000131c <close>:
SYSCALL(close)
    131c:	b8 15 00 00 00       	mov    $0x15,%eax
    1321:	cd 40                	int    $0x40
    1323:	c3                   	ret    

00001324 <kill>:
SYSCALL(kill)
    1324:	b8 06 00 00 00       	mov    $0x6,%eax
    1329:	cd 40                	int    $0x40
    132b:	c3                   	ret    

0000132c <exec>:
SYSCALL(exec)
    132c:	b8 07 00 00 00       	mov    $0x7,%eax
    1331:	cd 40                	int    $0x40
    1333:	c3                   	ret    

00001334 <open>:
SYSCALL(open)
    1334:	b8 0f 00 00 00       	mov    $0xf,%eax
    1339:	cd 40                	int    $0x40
    133b:	c3                   	ret    

0000133c <mknod>:
SYSCALL(mknod)
    133c:	b8 11 00 00 00       	mov    $0x11,%eax
    1341:	cd 40                	int    $0x40
    1343:	c3                   	ret    

00001344 <unlink>:
SYSCALL(unlink)
    1344:	b8 12 00 00 00       	mov    $0x12,%eax
    1349:	cd 40                	int    $0x40
    134b:	c3                   	ret    

0000134c <fstat>:
SYSCALL(fstat)
    134c:	b8 08 00 00 00       	mov    $0x8,%eax
    1351:	cd 40                	int    $0x40
    1353:	c3                   	ret    

00001354 <link>:
SYSCALL(link)
    1354:	b8 13 00 00 00       	mov    $0x13,%eax
    1359:	cd 40                	int    $0x40
    135b:	c3                   	ret    

0000135c <mkdir>:
SYSCALL(mkdir)
    135c:	b8 14 00 00 00       	mov    $0x14,%eax
    1361:	cd 40                	int    $0x40
    1363:	c3                   	ret    

00001364 <chdir>:
SYSCALL(chdir)
    1364:	b8 09 00 00 00       	mov    $0x9,%eax
    1369:	cd 40                	int    $0x40
    136b:	c3                   	ret    

0000136c <dup>:
SYSCALL(dup)
    136c:	b8 0a 00 00 00       	mov    $0xa,%eax
    1371:	cd 40                	int    $0x40
    1373:	c3                   	ret    

00001374 <getpid>:
SYSCALL(getpid)
    1374:	b8 0b 00 00 00       	mov    $0xb,%eax
    1379:	cd 40                	int    $0x40
    137b:	c3                   	ret    

0000137c <sbrk>:
SYSCALL(sbrk)
    137c:	b8 0c 00 00 00       	mov    $0xc,%eax
    1381:	cd 40                	int    $0x40
    1383:	c3                   	ret    

00001384 <sleep>:
SYSCALL(sleep)
    1384:	b8 0d 00 00 00       	mov    $0xd,%eax
    1389:	cd 40                	int    $0x40
    138b:	c3                   	ret    

0000138c <uptime>:
SYSCALL(uptime)
    138c:	b8 0e 00 00 00       	mov    $0xe,%eax
    1391:	cd 40                	int    $0x40
    1393:	c3                   	ret    

00001394 <clone>:
SYSCALL(clone)
    1394:	b8 16 00 00 00       	mov    $0x16,%eax
    1399:	cd 40                	int    $0x40
    139b:	c3                   	ret    

0000139c <texit>:
SYSCALL(texit)
    139c:	b8 17 00 00 00       	mov    $0x17,%eax
    13a1:	cd 40                	int    $0x40
    13a3:	c3                   	ret    

000013a4 <tsleep>:
SYSCALL(tsleep)
    13a4:	b8 18 00 00 00       	mov    $0x18,%eax
    13a9:	cd 40                	int    $0x40
    13ab:	c3                   	ret    

000013ac <twakeup>:
SYSCALL(twakeup)
    13ac:	b8 19 00 00 00       	mov    $0x19,%eax
    13b1:	cd 40                	int    $0x40
    13b3:	c3                   	ret    

000013b4 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
    13b4:	55                   	push   %ebp
    13b5:	89 e5                	mov    %esp,%ebp
    13b7:	83 ec 18             	sub    $0x18,%esp
    13ba:	8b 45 0c             	mov    0xc(%ebp),%eax
    13bd:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
    13c0:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    13c7:	00 
    13c8:	8d 45 f4             	lea    -0xc(%ebp),%eax
    13cb:	89 44 24 04          	mov    %eax,0x4(%esp)
    13cf:	8b 45 08             	mov    0x8(%ebp),%eax
    13d2:	89 04 24             	mov    %eax,(%esp)
    13d5:	e8 3a ff ff ff       	call   1314 <write>
}
    13da:	c9                   	leave  
    13db:	c3                   	ret    

000013dc <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
    13dc:	55                   	push   %ebp
    13dd:	89 e5                	mov    %esp,%ebp
    13df:	56                   	push   %esi
    13e0:	53                   	push   %ebx
    13e1:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    13e4:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
    13eb:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
    13ef:	74 17                	je     1408 <printint+0x2c>
    13f1:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    13f5:	79 11                	jns    1408 <printint+0x2c>
    neg = 1;
    13f7:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
    13fe:	8b 45 0c             	mov    0xc(%ebp),%eax
    1401:	f7 d8                	neg    %eax
    1403:	89 45 ec             	mov    %eax,-0x14(%ebp)
    1406:	eb 06                	jmp    140e <printint+0x32>
  } else {
    x = xx;
    1408:	8b 45 0c             	mov    0xc(%ebp),%eax
    140b:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
    140e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
    1415:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    1418:	8d 41 01             	lea    0x1(%ecx),%eax
    141b:	89 45 f4             	mov    %eax,-0xc(%ebp)
    141e:	8b 5d 10             	mov    0x10(%ebp),%ebx
    1421:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1424:	ba 00 00 00 00       	mov    $0x0,%edx
    1429:	f7 f3                	div    %ebx
    142b:	89 d0                	mov    %edx,%eax
    142d:	0f b6 80 ec 20 00 00 	movzbl 0x20ec(%eax),%eax
    1434:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
    1438:	8b 75 10             	mov    0x10(%ebp),%esi
    143b:	8b 45 ec             	mov    -0x14(%ebp),%eax
    143e:	ba 00 00 00 00       	mov    $0x0,%edx
    1443:	f7 f6                	div    %esi
    1445:	89 45 ec             	mov    %eax,-0x14(%ebp)
    1448:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    144c:	75 c7                	jne    1415 <printint+0x39>
  if(neg)
    144e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1452:	74 10                	je     1464 <printint+0x88>
    buf[i++] = '-';
    1454:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1457:	8d 50 01             	lea    0x1(%eax),%edx
    145a:	89 55 f4             	mov    %edx,-0xc(%ebp)
    145d:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
    1462:	eb 1f                	jmp    1483 <printint+0xa7>
    1464:	eb 1d                	jmp    1483 <printint+0xa7>
    putc(fd, buf[i]);
    1466:	8d 55 dc             	lea    -0x24(%ebp),%edx
    1469:	8b 45 f4             	mov    -0xc(%ebp),%eax
    146c:	01 d0                	add    %edx,%eax
    146e:	0f b6 00             	movzbl (%eax),%eax
    1471:	0f be c0             	movsbl %al,%eax
    1474:	89 44 24 04          	mov    %eax,0x4(%esp)
    1478:	8b 45 08             	mov    0x8(%ebp),%eax
    147b:	89 04 24             	mov    %eax,(%esp)
    147e:	e8 31 ff ff ff       	call   13b4 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    1483:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    1487:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    148b:	79 d9                	jns    1466 <printint+0x8a>
    putc(fd, buf[i]);
}
    148d:	83 c4 30             	add    $0x30,%esp
    1490:	5b                   	pop    %ebx
    1491:	5e                   	pop    %esi
    1492:	5d                   	pop    %ebp
    1493:	c3                   	ret    

00001494 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    1494:	55                   	push   %ebp
    1495:	89 e5                	mov    %esp,%ebp
    1497:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
    149a:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
    14a1:	8d 45 0c             	lea    0xc(%ebp),%eax
    14a4:	83 c0 04             	add    $0x4,%eax
    14a7:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
    14aa:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    14b1:	e9 7c 01 00 00       	jmp    1632 <printf+0x19e>
    c = fmt[i] & 0xff;
    14b6:	8b 55 0c             	mov    0xc(%ebp),%edx
    14b9:	8b 45 f0             	mov    -0x10(%ebp),%eax
    14bc:	01 d0                	add    %edx,%eax
    14be:	0f b6 00             	movzbl (%eax),%eax
    14c1:	0f be c0             	movsbl %al,%eax
    14c4:	25 ff 00 00 00       	and    $0xff,%eax
    14c9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
    14cc:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    14d0:	75 2c                	jne    14fe <printf+0x6a>
      if(c == '%'){
    14d2:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    14d6:	75 0c                	jne    14e4 <printf+0x50>
        state = '%';
    14d8:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
    14df:	e9 4a 01 00 00       	jmp    162e <printf+0x19a>
      } else {
        putc(fd, c);
    14e4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    14e7:	0f be c0             	movsbl %al,%eax
    14ea:	89 44 24 04          	mov    %eax,0x4(%esp)
    14ee:	8b 45 08             	mov    0x8(%ebp),%eax
    14f1:	89 04 24             	mov    %eax,(%esp)
    14f4:	e8 bb fe ff ff       	call   13b4 <putc>
    14f9:	e9 30 01 00 00       	jmp    162e <printf+0x19a>
      }
    } else if(state == '%'){
    14fe:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
    1502:	0f 85 26 01 00 00    	jne    162e <printf+0x19a>
      if(c == 'd'){
    1508:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
    150c:	75 2d                	jne    153b <printf+0xa7>
        printint(fd, *ap, 10, 1);
    150e:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1511:	8b 00                	mov    (%eax),%eax
    1513:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    151a:	00 
    151b:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
    1522:	00 
    1523:	89 44 24 04          	mov    %eax,0x4(%esp)
    1527:	8b 45 08             	mov    0x8(%ebp),%eax
    152a:	89 04 24             	mov    %eax,(%esp)
    152d:	e8 aa fe ff ff       	call   13dc <printint>
        ap++;
    1532:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    1536:	e9 ec 00 00 00       	jmp    1627 <printf+0x193>
      } else if(c == 'x' || c == 'p'){
    153b:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
    153f:	74 06                	je     1547 <printf+0xb3>
    1541:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
    1545:	75 2d                	jne    1574 <printf+0xe0>
        printint(fd, *ap, 16, 0);
    1547:	8b 45 e8             	mov    -0x18(%ebp),%eax
    154a:	8b 00                	mov    (%eax),%eax
    154c:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    1553:	00 
    1554:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
    155b:	00 
    155c:	89 44 24 04          	mov    %eax,0x4(%esp)
    1560:	8b 45 08             	mov    0x8(%ebp),%eax
    1563:	89 04 24             	mov    %eax,(%esp)
    1566:	e8 71 fe ff ff       	call   13dc <printint>
        ap++;
    156b:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    156f:	e9 b3 00 00 00       	jmp    1627 <printf+0x193>
      } else if(c == 's'){
    1574:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
    1578:	75 45                	jne    15bf <printf+0x12b>
        s = (char*)*ap;
    157a:	8b 45 e8             	mov    -0x18(%ebp),%eax
    157d:	8b 00                	mov    (%eax),%eax
    157f:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
    1582:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
    1586:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    158a:	75 09                	jne    1595 <printf+0x101>
          s = "(null)";
    158c:	c7 45 f4 95 1c 00 00 	movl   $0x1c95,-0xc(%ebp)
        while(*s != 0){
    1593:	eb 1e                	jmp    15b3 <printf+0x11f>
    1595:	eb 1c                	jmp    15b3 <printf+0x11f>
          putc(fd, *s);
    1597:	8b 45 f4             	mov    -0xc(%ebp),%eax
    159a:	0f b6 00             	movzbl (%eax),%eax
    159d:	0f be c0             	movsbl %al,%eax
    15a0:	89 44 24 04          	mov    %eax,0x4(%esp)
    15a4:	8b 45 08             	mov    0x8(%ebp),%eax
    15a7:	89 04 24             	mov    %eax,(%esp)
    15aa:	e8 05 fe ff ff       	call   13b4 <putc>
          s++;
    15af:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    15b3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    15b6:	0f b6 00             	movzbl (%eax),%eax
    15b9:	84 c0                	test   %al,%al
    15bb:	75 da                	jne    1597 <printf+0x103>
    15bd:	eb 68                	jmp    1627 <printf+0x193>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    15bf:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
    15c3:	75 1d                	jne    15e2 <printf+0x14e>
        putc(fd, *ap);
    15c5:	8b 45 e8             	mov    -0x18(%ebp),%eax
    15c8:	8b 00                	mov    (%eax),%eax
    15ca:	0f be c0             	movsbl %al,%eax
    15cd:	89 44 24 04          	mov    %eax,0x4(%esp)
    15d1:	8b 45 08             	mov    0x8(%ebp),%eax
    15d4:	89 04 24             	mov    %eax,(%esp)
    15d7:	e8 d8 fd ff ff       	call   13b4 <putc>
        ap++;
    15dc:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    15e0:	eb 45                	jmp    1627 <printf+0x193>
      } else if(c == '%'){
    15e2:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    15e6:	75 17                	jne    15ff <printf+0x16b>
        putc(fd, c);
    15e8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    15eb:	0f be c0             	movsbl %al,%eax
    15ee:	89 44 24 04          	mov    %eax,0x4(%esp)
    15f2:	8b 45 08             	mov    0x8(%ebp),%eax
    15f5:	89 04 24             	mov    %eax,(%esp)
    15f8:	e8 b7 fd ff ff       	call   13b4 <putc>
    15fd:	eb 28                	jmp    1627 <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
    15ff:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
    1606:	00 
    1607:	8b 45 08             	mov    0x8(%ebp),%eax
    160a:	89 04 24             	mov    %eax,(%esp)
    160d:	e8 a2 fd ff ff       	call   13b4 <putc>
        putc(fd, c);
    1612:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1615:	0f be c0             	movsbl %al,%eax
    1618:	89 44 24 04          	mov    %eax,0x4(%esp)
    161c:	8b 45 08             	mov    0x8(%ebp),%eax
    161f:	89 04 24             	mov    %eax,(%esp)
    1622:	e8 8d fd ff ff       	call   13b4 <putc>
      }
      state = 0;
    1627:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    162e:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    1632:	8b 55 0c             	mov    0xc(%ebp),%edx
    1635:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1638:	01 d0                	add    %edx,%eax
    163a:	0f b6 00             	movzbl (%eax),%eax
    163d:	84 c0                	test   %al,%al
    163f:	0f 85 71 fe ff ff    	jne    14b6 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    1645:	c9                   	leave  
    1646:	c3                   	ret    
    1647:	90                   	nop

00001648 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    1648:	55                   	push   %ebp
    1649:	89 e5                	mov    %esp,%ebp
    164b:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
    164e:	8b 45 08             	mov    0x8(%ebp),%eax
    1651:	83 e8 08             	sub    $0x8,%eax
    1654:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1657:	a1 0c 21 00 00       	mov    0x210c,%eax
    165c:	89 45 fc             	mov    %eax,-0x4(%ebp)
    165f:	eb 24                	jmp    1685 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1661:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1664:	8b 00                	mov    (%eax),%eax
    1666:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    1669:	77 12                	ja     167d <free+0x35>
    166b:	8b 45 f8             	mov    -0x8(%ebp),%eax
    166e:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    1671:	77 24                	ja     1697 <free+0x4f>
    1673:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1676:	8b 00                	mov    (%eax),%eax
    1678:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    167b:	77 1a                	ja     1697 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    167d:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1680:	8b 00                	mov    (%eax),%eax
    1682:	89 45 fc             	mov    %eax,-0x4(%ebp)
    1685:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1688:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    168b:	76 d4                	jbe    1661 <free+0x19>
    168d:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1690:	8b 00                	mov    (%eax),%eax
    1692:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    1695:	76 ca                	jbe    1661 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    1697:	8b 45 f8             	mov    -0x8(%ebp),%eax
    169a:	8b 40 04             	mov    0x4(%eax),%eax
    169d:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    16a4:	8b 45 f8             	mov    -0x8(%ebp),%eax
    16a7:	01 c2                	add    %eax,%edx
    16a9:	8b 45 fc             	mov    -0x4(%ebp),%eax
    16ac:	8b 00                	mov    (%eax),%eax
    16ae:	39 c2                	cmp    %eax,%edx
    16b0:	75 24                	jne    16d6 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
    16b2:	8b 45 f8             	mov    -0x8(%ebp),%eax
    16b5:	8b 50 04             	mov    0x4(%eax),%edx
    16b8:	8b 45 fc             	mov    -0x4(%ebp),%eax
    16bb:	8b 00                	mov    (%eax),%eax
    16bd:	8b 40 04             	mov    0x4(%eax),%eax
    16c0:	01 c2                	add    %eax,%edx
    16c2:	8b 45 f8             	mov    -0x8(%ebp),%eax
    16c5:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
    16c8:	8b 45 fc             	mov    -0x4(%ebp),%eax
    16cb:	8b 00                	mov    (%eax),%eax
    16cd:	8b 10                	mov    (%eax),%edx
    16cf:	8b 45 f8             	mov    -0x8(%ebp),%eax
    16d2:	89 10                	mov    %edx,(%eax)
    16d4:	eb 0a                	jmp    16e0 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
    16d6:	8b 45 fc             	mov    -0x4(%ebp),%eax
    16d9:	8b 10                	mov    (%eax),%edx
    16db:	8b 45 f8             	mov    -0x8(%ebp),%eax
    16de:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
    16e0:	8b 45 fc             	mov    -0x4(%ebp),%eax
    16e3:	8b 40 04             	mov    0x4(%eax),%eax
    16e6:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    16ed:	8b 45 fc             	mov    -0x4(%ebp),%eax
    16f0:	01 d0                	add    %edx,%eax
    16f2:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    16f5:	75 20                	jne    1717 <free+0xcf>
    p->s.size += bp->s.size;
    16f7:	8b 45 fc             	mov    -0x4(%ebp),%eax
    16fa:	8b 50 04             	mov    0x4(%eax),%edx
    16fd:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1700:	8b 40 04             	mov    0x4(%eax),%eax
    1703:	01 c2                	add    %eax,%edx
    1705:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1708:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    170b:	8b 45 f8             	mov    -0x8(%ebp),%eax
    170e:	8b 10                	mov    (%eax),%edx
    1710:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1713:	89 10                	mov    %edx,(%eax)
    1715:	eb 08                	jmp    171f <free+0xd7>
  } else
    p->s.ptr = bp;
    1717:	8b 45 fc             	mov    -0x4(%ebp),%eax
    171a:	8b 55 f8             	mov    -0x8(%ebp),%edx
    171d:	89 10                	mov    %edx,(%eax)
  freep = p;
    171f:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1722:	a3 0c 21 00 00       	mov    %eax,0x210c
}
    1727:	c9                   	leave  
    1728:	c3                   	ret    

00001729 <morecore>:

static Header*
morecore(uint nu)
{
    1729:	55                   	push   %ebp
    172a:	89 e5                	mov    %esp,%ebp
    172c:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
    172f:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
    1736:	77 07                	ja     173f <morecore+0x16>
    nu = 4096;
    1738:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
    173f:	8b 45 08             	mov    0x8(%ebp),%eax
    1742:	c1 e0 03             	shl    $0x3,%eax
    1745:	89 04 24             	mov    %eax,(%esp)
    1748:	e8 2f fc ff ff       	call   137c <sbrk>
    174d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
    1750:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
    1754:	75 07                	jne    175d <morecore+0x34>
    return 0;
    1756:	b8 00 00 00 00       	mov    $0x0,%eax
    175b:	eb 22                	jmp    177f <morecore+0x56>
  hp = (Header*)p;
    175d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1760:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
    1763:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1766:	8b 55 08             	mov    0x8(%ebp),%edx
    1769:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
    176c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    176f:	83 c0 08             	add    $0x8,%eax
    1772:	89 04 24             	mov    %eax,(%esp)
    1775:	e8 ce fe ff ff       	call   1648 <free>
  return freep;
    177a:	a1 0c 21 00 00       	mov    0x210c,%eax
}
    177f:	c9                   	leave  
    1780:	c3                   	ret    

00001781 <malloc>:

void*
malloc(uint nbytes)
{
    1781:	55                   	push   %ebp
    1782:	89 e5                	mov    %esp,%ebp
    1784:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1787:	8b 45 08             	mov    0x8(%ebp),%eax
    178a:	83 c0 07             	add    $0x7,%eax
    178d:	c1 e8 03             	shr    $0x3,%eax
    1790:	83 c0 01             	add    $0x1,%eax
    1793:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
    1796:	a1 0c 21 00 00       	mov    0x210c,%eax
    179b:	89 45 f0             	mov    %eax,-0x10(%ebp)
    179e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    17a2:	75 23                	jne    17c7 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
    17a4:	c7 45 f0 04 21 00 00 	movl   $0x2104,-0x10(%ebp)
    17ab:	8b 45 f0             	mov    -0x10(%ebp),%eax
    17ae:	a3 0c 21 00 00       	mov    %eax,0x210c
    17b3:	a1 0c 21 00 00       	mov    0x210c,%eax
    17b8:	a3 04 21 00 00       	mov    %eax,0x2104
    base.s.size = 0;
    17bd:	c7 05 08 21 00 00 00 	movl   $0x0,0x2108
    17c4:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    17c7:	8b 45 f0             	mov    -0x10(%ebp),%eax
    17ca:	8b 00                	mov    (%eax),%eax
    17cc:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
    17cf:	8b 45 f4             	mov    -0xc(%ebp),%eax
    17d2:	8b 40 04             	mov    0x4(%eax),%eax
    17d5:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    17d8:	72 4d                	jb     1827 <malloc+0xa6>
      if(p->s.size == nunits)
    17da:	8b 45 f4             	mov    -0xc(%ebp),%eax
    17dd:	8b 40 04             	mov    0x4(%eax),%eax
    17e0:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    17e3:	75 0c                	jne    17f1 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
    17e5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    17e8:	8b 10                	mov    (%eax),%edx
    17ea:	8b 45 f0             	mov    -0x10(%ebp),%eax
    17ed:	89 10                	mov    %edx,(%eax)
    17ef:	eb 26                	jmp    1817 <malloc+0x96>
      else {
        p->s.size -= nunits;
    17f1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    17f4:	8b 40 04             	mov    0x4(%eax),%eax
    17f7:	2b 45 ec             	sub    -0x14(%ebp),%eax
    17fa:	89 c2                	mov    %eax,%edx
    17fc:	8b 45 f4             	mov    -0xc(%ebp),%eax
    17ff:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
    1802:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1805:	8b 40 04             	mov    0x4(%eax),%eax
    1808:	c1 e0 03             	shl    $0x3,%eax
    180b:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
    180e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1811:	8b 55 ec             	mov    -0x14(%ebp),%edx
    1814:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
    1817:	8b 45 f0             	mov    -0x10(%ebp),%eax
    181a:	a3 0c 21 00 00       	mov    %eax,0x210c
      return (void*)(p + 1);
    181f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1822:	83 c0 08             	add    $0x8,%eax
    1825:	eb 38                	jmp    185f <malloc+0xde>
    }
    if(p == freep)
    1827:	a1 0c 21 00 00       	mov    0x210c,%eax
    182c:	39 45 f4             	cmp    %eax,-0xc(%ebp)
    182f:	75 1b                	jne    184c <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
    1831:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1834:	89 04 24             	mov    %eax,(%esp)
    1837:	e8 ed fe ff ff       	call   1729 <morecore>
    183c:	89 45 f4             	mov    %eax,-0xc(%ebp)
    183f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1843:	75 07                	jne    184c <malloc+0xcb>
        return 0;
    1845:	b8 00 00 00 00       	mov    $0x0,%eax
    184a:	eb 13                	jmp    185f <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    184c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    184f:	89 45 f0             	mov    %eax,-0x10(%ebp)
    1852:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1855:	8b 00                	mov    (%eax),%eax
    1857:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
    185a:	e9 70 ff ff ff       	jmp    17cf <malloc+0x4e>
}
    185f:	c9                   	leave  
    1860:	c3                   	ret    
    1861:	66 90                	xchg   %ax,%ax
    1863:	90                   	nop

00001864 <xchg>:
  asm volatile("sti");
}

static inline uint
xchg(volatile uint *addr, uint newval)
{
    1864:	55                   	push   %ebp
    1865:	89 e5                	mov    %esp,%ebp
    1867:	83 ec 10             	sub    $0x10,%esp
  uint result;
  
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
    186a:	8b 55 08             	mov    0x8(%ebp),%edx
    186d:	8b 45 0c             	mov    0xc(%ebp),%eax
    1870:	8b 4d 08             	mov    0x8(%ebp),%ecx
    1873:	f0 87 02             	lock xchg %eax,(%edx)
    1876:	89 45 fc             	mov    %eax,-0x4(%ebp)
               "+m" (*addr), "=a" (result) :
               "1" (newval) :
               "cc");
  return result;
    1879:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    187c:	c9                   	leave  
    187d:	c3                   	ret    

0000187e <lock_init>:
#include "x86.h"
#include "proc.h"

unsigned long rands = 1;

void lock_init(lock_t *lock){
    187e:	55                   	push   %ebp
    187f:	89 e5                	mov    %esp,%ebp
    lock->locked = 0;
    1881:	8b 45 08             	mov    0x8(%ebp),%eax
    1884:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
    188a:	5d                   	pop    %ebp
    188b:	c3                   	ret    

0000188c <lock_acquire>:
void lock_acquire(lock_t *lock){
    188c:	55                   	push   %ebp
    188d:	89 e5                	mov    %esp,%ebp
    188f:	83 ec 08             	sub    $0x8,%esp
    while(xchg(&lock->locked,1) != 0);
    1892:	90                   	nop
    1893:	8b 45 08             	mov    0x8(%ebp),%eax
    1896:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
    189d:	00 
    189e:	89 04 24             	mov    %eax,(%esp)
    18a1:	e8 be ff ff ff       	call   1864 <xchg>
    18a6:	85 c0                	test   %eax,%eax
    18a8:	75 e9                	jne    1893 <lock_acquire+0x7>
}
    18aa:	c9                   	leave  
    18ab:	c3                   	ret    

000018ac <lock_release>:
void lock_release(lock_t *lock){
    18ac:	55                   	push   %ebp
    18ad:	89 e5                	mov    %esp,%ebp
    18af:	83 ec 08             	sub    $0x8,%esp
    xchg(&lock->locked,0);
    18b2:	8b 45 08             	mov    0x8(%ebp),%eax
    18b5:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    18bc:	00 
    18bd:	89 04 24             	mov    %eax,(%esp)
    18c0:	e8 9f ff ff ff       	call   1864 <xchg>
}
    18c5:	c9                   	leave  
    18c6:	c3                   	ret    

000018c7 <thread_create>:


void *thread_create(void(*start_routine)(void*), void *arg){
    18c7:	55                   	push   %ebp
    18c8:	89 e5                	mov    %esp,%ebp
    18ca:	83 ec 28             	sub    $0x28,%esp
    int tid;
    void * stack = malloc(2 * 4096);
    18cd:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
    18d4:	e8 a8 fe ff ff       	call   1781 <malloc>
    18d9:	89 45 f4             	mov    %eax,-0xc(%ebp)
    void *garbage_stack = stack; 
    18dc:	8b 45 f4             	mov    -0xc(%ebp),%eax
    18df:	89 45 f0             	mov    %eax,-0x10(%ebp)
   // printf(1,"start routine addr : %d\n",(uint)start_routine);


    if((uint)stack % 4096){
    18e2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    18e5:	25 ff 0f 00 00       	and    $0xfff,%eax
    18ea:	85 c0                	test   %eax,%eax
    18ec:	74 14                	je     1902 <thread_create+0x3b>
        stack = stack + (4096 - (uint)stack % 4096);
    18ee:	8b 45 f4             	mov    -0xc(%ebp),%eax
    18f1:	25 ff 0f 00 00       	and    $0xfff,%eax
    18f6:	89 c2                	mov    %eax,%edx
    18f8:	b8 00 10 00 00       	mov    $0x1000,%eax
    18fd:	29 d0                	sub    %edx,%eax
    18ff:	01 45 f4             	add    %eax,-0xc(%ebp)
    }
    if (stack == 0){
    1902:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1906:	75 1b                	jne    1923 <thread_create+0x5c>

        printf(1,"malloc fail \n");
    1908:	c7 44 24 04 9c 1c 00 	movl   $0x1c9c,0x4(%esp)
    190f:	00 
    1910:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1917:	e8 78 fb ff ff       	call   1494 <printf>
        return 0;
    191c:	b8 00 00 00 00       	mov    $0x0,%eax
    1921:	eb 6f                	jmp    1992 <thread_create+0xcb>
    }

    tid = clone((uint)stack,PSIZE,(uint)start_routine,(int)arg);
    1923:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    1926:	8b 55 08             	mov    0x8(%ebp),%edx
    1929:	8b 45 f4             	mov    -0xc(%ebp),%eax
    192c:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
    1930:	89 54 24 08          	mov    %edx,0x8(%esp)
    1934:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
    193b:	00 
    193c:	89 04 24             	mov    %eax,(%esp)
    193f:	e8 50 fa ff ff       	call   1394 <clone>
    1944:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(tid < 0){
    1947:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    194b:	79 1b                	jns    1968 <thread_create+0xa1>
        printf(1,"clone fails\n");
    194d:	c7 44 24 04 aa 1c 00 	movl   $0x1caa,0x4(%esp)
    1954:	00 
    1955:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    195c:	e8 33 fb ff ff       	call   1494 <printf>
        return 0;
    1961:	b8 00 00 00 00       	mov    $0x0,%eax
    1966:	eb 2a                	jmp    1992 <thread_create+0xcb>
    }
    if(tid > 0){
    1968:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    196c:	7e 05                	jle    1973 <thread_create+0xac>
        //store threads on thread table
        return garbage_stack;
    196e:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1971:	eb 1f                	jmp    1992 <thread_create+0xcb>
    }
    if(tid == 0){
    1973:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1977:	75 14                	jne    198d <thread_create+0xc6>
        printf(1,"tid = 0 return \n");
    1979:	c7 44 24 04 b7 1c 00 	movl   $0x1cb7,0x4(%esp)
    1980:	00 
    1981:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1988:	e8 07 fb ff ff       	call   1494 <printf>
    }
//    wait();
//    free(garbage_stack);

    return 0;
    198d:	b8 00 00 00 00       	mov    $0x0,%eax
}
    1992:	c9                   	leave  
    1993:	c3                   	ret    

00001994 <random>:

// generate 0 -> max random number exclude max.
int random(int max){
    1994:	55                   	push   %ebp
    1995:	89 e5                	mov    %esp,%ebp
    rands = rands * 1664525 + 1013904233;
    1997:	a1 00 21 00 00       	mov    0x2100,%eax
    199c:	69 c0 0d 66 19 00    	imul   $0x19660d,%eax,%eax
    19a2:	05 69 f3 6e 3c       	add    $0x3c6ef369,%eax
    19a7:	a3 00 21 00 00       	mov    %eax,0x2100
    return (int)(rands % max);
    19ac:	a1 00 21 00 00       	mov    0x2100,%eax
    19b1:	8b 4d 08             	mov    0x8(%ebp),%ecx
    19b4:	ba 00 00 00 00       	mov    $0x0,%edx
    19b9:	f7 f1                	div    %ecx
    19bb:	89 d0                	mov    %edx,%eax
}
    19bd:	5d                   	pop    %ebp
    19be:	c3                   	ret    
    19bf:	90                   	nop

000019c0 <init_q>:
#include "queue.h"
#include "types.h"
#include "user.h"

void init_q(struct queue *q){
    19c0:	55                   	push   %ebp
    19c1:	89 e5                	mov    %esp,%ebp
    q->size = 0;
    19c3:	8b 45 08             	mov    0x8(%ebp),%eax
    19c6:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    q->head = 0;
    19cc:	8b 45 08             	mov    0x8(%ebp),%eax
    19cf:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    q->tail = 0;
    19d6:	8b 45 08             	mov    0x8(%ebp),%eax
    19d9:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
}
    19e0:	5d                   	pop    %ebp
    19e1:	c3                   	ret    

000019e2 <add_q>:

void add_q(struct queue *q, int v){
    19e2:	55                   	push   %ebp
    19e3:	89 e5                	mov    %esp,%ebp
    19e5:	83 ec 28             	sub    $0x28,%esp
    struct node * n = malloc(sizeof(struct node));
    19e8:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
    19ef:	e8 8d fd ff ff       	call   1781 <malloc>
    19f4:	89 45 f4             	mov    %eax,-0xc(%ebp)
    n->next = 0;
    19f7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    19fa:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    n->value = v;
    1a01:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1a04:	8b 55 0c             	mov    0xc(%ebp),%edx
    1a07:	89 10                	mov    %edx,(%eax)
    if(q->head == 0){
    1a09:	8b 45 08             	mov    0x8(%ebp),%eax
    1a0c:	8b 40 04             	mov    0x4(%eax),%eax
    1a0f:	85 c0                	test   %eax,%eax
    1a11:	75 0b                	jne    1a1e <add_q+0x3c>
        q->head = n;
    1a13:	8b 45 08             	mov    0x8(%ebp),%eax
    1a16:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1a19:	89 50 04             	mov    %edx,0x4(%eax)
    1a1c:	eb 0c                	jmp    1a2a <add_q+0x48>
    }else{
        q->tail->next = n;
    1a1e:	8b 45 08             	mov    0x8(%ebp),%eax
    1a21:	8b 40 08             	mov    0x8(%eax),%eax
    1a24:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1a27:	89 50 04             	mov    %edx,0x4(%eax)
    }
    q->tail = n;
    1a2a:	8b 45 08             	mov    0x8(%ebp),%eax
    1a2d:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1a30:	89 50 08             	mov    %edx,0x8(%eax)
    q->size++;
    1a33:	8b 45 08             	mov    0x8(%ebp),%eax
    1a36:	8b 00                	mov    (%eax),%eax
    1a38:	8d 50 01             	lea    0x1(%eax),%edx
    1a3b:	8b 45 08             	mov    0x8(%ebp),%eax
    1a3e:	89 10                	mov    %edx,(%eax)
}
    1a40:	c9                   	leave  
    1a41:	c3                   	ret    

00001a42 <empty_q>:

int empty_q(struct queue *q){
    1a42:	55                   	push   %ebp
    1a43:	89 e5                	mov    %esp,%ebp
    if(q->size == 0)
    1a45:	8b 45 08             	mov    0x8(%ebp),%eax
    1a48:	8b 00                	mov    (%eax),%eax
    1a4a:	85 c0                	test   %eax,%eax
    1a4c:	75 07                	jne    1a55 <empty_q+0x13>
        return 1;
    1a4e:	b8 01 00 00 00       	mov    $0x1,%eax
    1a53:	eb 05                	jmp    1a5a <empty_q+0x18>
    else
        return 0;
    1a55:	b8 00 00 00 00       	mov    $0x0,%eax
} 
    1a5a:	5d                   	pop    %ebp
    1a5b:	c3                   	ret    

00001a5c <pop_q>:
int pop_q(struct queue *q){
    1a5c:	55                   	push   %ebp
    1a5d:	89 e5                	mov    %esp,%ebp
    1a5f:	83 ec 28             	sub    $0x28,%esp
    int val;
    struct node *destroy;
    if(!empty_q(q)){
    1a62:	8b 45 08             	mov    0x8(%ebp),%eax
    1a65:	89 04 24             	mov    %eax,(%esp)
    1a68:	e8 d5 ff ff ff       	call   1a42 <empty_q>
    1a6d:	85 c0                	test   %eax,%eax
    1a6f:	75 5d                	jne    1ace <pop_q+0x72>
       val = q->head->value; 
    1a71:	8b 45 08             	mov    0x8(%ebp),%eax
    1a74:	8b 40 04             	mov    0x4(%eax),%eax
    1a77:	8b 00                	mov    (%eax),%eax
    1a79:	89 45 f4             	mov    %eax,-0xc(%ebp)
       destroy = q->head;
    1a7c:	8b 45 08             	mov    0x8(%ebp),%eax
    1a7f:	8b 40 04             	mov    0x4(%eax),%eax
    1a82:	89 45 f0             	mov    %eax,-0x10(%ebp)
       q->head = q->head->next;
    1a85:	8b 45 08             	mov    0x8(%ebp),%eax
    1a88:	8b 40 04             	mov    0x4(%eax),%eax
    1a8b:	8b 50 04             	mov    0x4(%eax),%edx
    1a8e:	8b 45 08             	mov    0x8(%ebp),%eax
    1a91:	89 50 04             	mov    %edx,0x4(%eax)
       free(destroy);
    1a94:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1a97:	89 04 24             	mov    %eax,(%esp)
    1a9a:	e8 a9 fb ff ff       	call   1648 <free>
       q->size--;
    1a9f:	8b 45 08             	mov    0x8(%ebp),%eax
    1aa2:	8b 00                	mov    (%eax),%eax
    1aa4:	8d 50 ff             	lea    -0x1(%eax),%edx
    1aa7:	8b 45 08             	mov    0x8(%ebp),%eax
    1aaa:	89 10                	mov    %edx,(%eax)
       if(q->size == 0){
    1aac:	8b 45 08             	mov    0x8(%ebp),%eax
    1aaf:	8b 00                	mov    (%eax),%eax
    1ab1:	85 c0                	test   %eax,%eax
    1ab3:	75 14                	jne    1ac9 <pop_q+0x6d>
            q->head = 0;
    1ab5:	8b 45 08             	mov    0x8(%ebp),%eax
    1ab8:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
            q->tail = 0;
    1abf:	8b 45 08             	mov    0x8(%ebp),%eax
    1ac2:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
       }
       return val;
    1ac9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1acc:	eb 05                	jmp    1ad3 <pop_q+0x77>
    }
    return -1;
    1ace:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
    1ad3:	c9                   	leave  
    1ad4:	c3                   	ret    

00001ad5 <dominant>:

void dominant(struct queue* q, int i){
    1ad5:	55                   	push   %ebp
    1ad6:	89 e5                	mov    %esp,%ebp
    1ad8:	83 ec 28             	sub    $0x28,%esp
    struct node * n = malloc(sizeof(struct node));
    1adb:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
    1ae2:	e8 9a fc ff ff       	call   1781 <malloc>
    1ae7:	89 45 f4             	mov    %eax,-0xc(%ebp)
    n->value = i;
    1aea:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1aed:	8b 55 0c             	mov    0xc(%ebp),%edx
    1af0:	89 10                	mov    %edx,(%eax)

    if(q->head == 0){
    1af2:	8b 45 08             	mov    0x8(%ebp),%eax
    1af5:	8b 40 04             	mov    0x4(%eax),%eax
    1af8:	85 c0                	test   %eax,%eax
    1afa:	75 14                	jne    1b10 <dominant+0x3b>
        q->head = n;
    1afc:	8b 45 08             	mov    0x8(%ebp),%eax
    1aff:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1b02:	89 50 04             	mov    %edx,0x4(%eax)
        q->tail = n;
    1b05:	8b 45 08             	mov    0x8(%ebp),%eax
    1b08:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1b0b:	89 50 08             	mov    %edx,0x8(%eax)
    1b0e:	eb 15                	jmp    1b25 <dominant+0x50>
    }
    else{
        n->next = q->head;
    1b10:	8b 45 08             	mov    0x8(%ebp),%eax
    1b13:	8b 50 04             	mov    0x4(%eax),%edx
    1b16:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1b19:	89 50 04             	mov    %edx,0x4(%eax)
        q->head = n;
    1b1c:	8b 45 08             	mov    0x8(%ebp),%eax
    1b1f:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1b22:	89 50 04             	mov    %edx,0x4(%eax)
    }
    q->size++;
    1b25:	8b 45 08             	mov    0x8(%ebp),%eax
    1b28:	8b 00                	mov    (%eax),%eax
    1b2a:	8d 50 01             	lea    0x1(%eax),%edx
    1b2d:	8b 45 08             	mov    0x8(%ebp),%eax
    1b30:	89 10                	mov    %edx,(%eax)
}
    1b32:	c9                   	leave  
    1b33:	c3                   	ret    

00001b34 <sem_init>:
#include "semaphore.h"
#include "user.h"

// Initializes the semaphore
void sem_init(struct Semaphore* s, int value){
    1b34:	55                   	push   %ebp
    1b35:	89 e5                	mov    %esp,%ebp
    1b37:	83 ec 18             	sub    $0x18,%esp
    s->val = value;
    1b3a:	8b 45 08             	mov    0x8(%ebp),%eax
    1b3d:	8b 55 0c             	mov    0xc(%ebp),%edx
    1b40:	89 10                	mov    %edx,(%eax)
    lock_init(&s->lock);
    1b42:	8b 45 08             	mov    0x8(%ebp),%eax
    1b45:	83 c0 04             	add    $0x4,%eax
    1b48:	89 04 24             	mov    %eax,(%esp)
    1b4b:	e8 2e fd ff ff       	call   187e <lock_init>
    init_q(&s->q);
    1b50:	8b 45 08             	mov    0x8(%ebp),%eax
    1b53:	83 c0 08             	add    $0x8,%eax
    1b56:	89 04 24             	mov    %eax,(%esp)
    1b59:	e8 62 fe ff ff       	call   19c0 <init_q>
}
    1b5e:	c9                   	leave  
    1b5f:	c3                   	ret    

00001b60 <sem_acquire>:

// Decrements the semaphore
void sem_acquire(struct Semaphore* s){
    1b60:	55                   	push   %ebp
    1b61:	89 e5                	mov    %esp,%ebp
    1b63:	83 ec 28             	sub    $0x28,%esp
    lock_acquire(&s->lock);
    1b66:	8b 45 08             	mov    0x8(%ebp),%eax
    1b69:	83 c0 04             	add    $0x4,%eax
    1b6c:	89 04 24             	mov    %eax,(%esp)
    1b6f:	e8 18 fd ff ff       	call   188c <lock_acquire>

    if(s->val == 0){
    1b74:	8b 45 08             	mov    0x8(%ebp),%eax
    1b77:	8b 00                	mov    (%eax),%eax
    1b79:	85 c0                	test   %eax,%eax
    1b7b:	75 32                	jne    1baf <sem_acquire+0x4f>
        int pid;
        pid = getpid();
    1b7d:	e8 f2 f7 ff ff       	call   1374 <getpid>
    1b82:	89 45 f4             	mov    %eax,-0xc(%ebp)
        add_q(&s->q, pid);
    1b85:	8b 45 08             	mov    0x8(%ebp),%eax
    1b88:	8d 50 08             	lea    0x8(%eax),%edx
    1b8b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1b8e:	89 44 24 04          	mov    %eax,0x4(%esp)
    1b92:	89 14 24             	mov    %edx,(%esp)
    1b95:	e8 48 fe ff ff       	call   19e2 <add_q>
        lock_release(&s->lock);
    1b9a:	8b 45 08             	mov    0x8(%ebp),%eax
    1b9d:	83 c0 04             	add    $0x4,%eax
    1ba0:	89 04 24             	mov    %eax,(%esp)
    1ba3:	e8 04 fd ff ff       	call   18ac <lock_release>
        tsleep();
    1ba8:	e8 f7 f7 ff ff       	call   13a4 <tsleep>
    1bad:	eb 1b                	jmp    1bca <sem_acquire+0x6a>
    }
    else{
        s->val--;
    1baf:	8b 45 08             	mov    0x8(%ebp),%eax
    1bb2:	8b 00                	mov    (%eax),%eax
    1bb4:	8d 50 ff             	lea    -0x1(%eax),%edx
    1bb7:	8b 45 08             	mov    0x8(%ebp),%eax
    1bba:	89 10                	mov    %edx,(%eax)
        lock_release(&s->lock);
    1bbc:	8b 45 08             	mov    0x8(%ebp),%eax
    1bbf:	83 c0 04             	add    $0x4,%eax
    1bc2:	89 04 24             	mov    %eax,(%esp)
    1bc5:	e8 e2 fc ff ff       	call   18ac <lock_release>
    }
}
    1bca:	c9                   	leave  
    1bcb:	c3                   	ret    

00001bcc <sem_signal>:

// Increments the semaphore
void sem_signal(struct Semaphore* s){
    1bcc:	55                   	push   %ebp
    1bcd:	89 e5                	mov    %esp,%ebp
    1bcf:	83 ec 18             	sub    $0x18,%esp
    lock_acquire(&s->lock);
    1bd2:	8b 45 08             	mov    0x8(%ebp),%eax
    1bd5:	83 c0 04             	add    $0x4,%eax
    1bd8:	89 04 24             	mov    %eax,(%esp)
    1bdb:	e8 ac fc ff ff       	call   188c <lock_acquire>

    if(!empty_q(&s->q)){
    1be0:	8b 45 08             	mov    0x8(%ebp),%eax
    1be3:	83 c0 08             	add    $0x8,%eax
    1be6:	89 04 24             	mov    %eax,(%esp)
    1be9:	e8 54 fe ff ff       	call   1a42 <empty_q>
    1bee:	85 c0                	test   %eax,%eax
    1bf0:	75 18                	jne    1c0a <sem_signal+0x3e>
        twakeup(pop_q(&s->q));
    1bf2:	8b 45 08             	mov    0x8(%ebp),%eax
    1bf5:	83 c0 08             	add    $0x8,%eax
    1bf8:	89 04 24             	mov    %eax,(%esp)
    1bfb:	e8 5c fe ff ff       	call   1a5c <pop_q>
    1c00:	89 04 24             	mov    %eax,(%esp)
    1c03:	e8 a4 f7 ff ff       	call   13ac <twakeup>
    1c08:	eb 0d                	jmp    1c17 <sem_signal+0x4b>
    }
    else{
        s->val++;
    1c0a:	8b 45 08             	mov    0x8(%ebp),%eax
    1c0d:	8b 00                	mov    (%eax),%eax
    1c0f:	8d 50 01             	lea    0x1(%eax),%edx
    1c12:	8b 45 08             	mov    0x8(%ebp),%eax
    1c15:	89 10                	mov    %edx,(%eax)
    }

    lock_release(&s->lock);
    1c17:	8b 45 08             	mov    0x8(%ebp),%eax
    1c1a:	83 c0 04             	add    $0x4,%eax
    1c1d:	89 04 24             	mov    %eax,(%esp)
    1c20:	e8 87 fc ff ff       	call   18ac <lock_release>
}
    1c25:	c9                   	leave  
    1c26:	c3                   	ret    

00001c27 <sem_dom_acquire>:

void sem_dom_acquire(struct Semaphore* s){
    1c27:	55                   	push   %ebp
    1c28:	89 e5                	mov    %esp,%ebp
    1c2a:	83 ec 18             	sub    $0x18,%esp
    lock_acquire(&s->lock);
    1c2d:	8b 45 08             	mov    0x8(%ebp),%eax
    1c30:	83 c0 04             	add    $0x4,%eax
    1c33:	89 04 24             	mov    %eax,(%esp)
    1c36:	e8 51 fc ff ff       	call   188c <lock_acquire>

    if(s->val > 0){
    1c3b:	8b 45 08             	mov    0x8(%ebp),%eax
    1c3e:	8b 00                	mov    (%eax),%eax
    1c40:	85 c0                	test   %eax,%eax
    1c42:	7e 1d                	jle    1c61 <sem_dom_acquire+0x3a>
        s->val--;
    1c44:	8b 45 08             	mov    0x8(%ebp),%eax
    1c47:	8b 00                	mov    (%eax),%eax
    1c49:	8d 50 ff             	lea    -0x1(%eax),%edx
    1c4c:	8b 45 08             	mov    0x8(%ebp),%eax
    1c4f:	89 10                	mov    %edx,(%eax)
        lock_release(&s->lock);
    1c51:	8b 45 08             	mov    0x8(%ebp),%eax
    1c54:	83 c0 04             	add    $0x4,%eax
    1c57:	89 04 24             	mov    %eax,(%esp)
    1c5a:	e8 4d fc ff ff       	call   18ac <lock_release>
        return;
    1c5f:	eb 2a                	jmp    1c8b <sem_dom_acquire+0x64>
    }

    dominant(&s->q,getpid());
    1c61:	e8 0e f7 ff ff       	call   1374 <getpid>
    1c66:	8b 55 08             	mov    0x8(%ebp),%edx
    1c69:	83 c2 08             	add    $0x8,%edx
    1c6c:	89 44 24 04          	mov    %eax,0x4(%esp)
    1c70:	89 14 24             	mov    %edx,(%esp)
    1c73:	e8 5d fe ff ff       	call   1ad5 <dominant>
    lock_release(&s->lock);
    1c78:	8b 45 08             	mov    0x8(%ebp),%eax
    1c7b:	83 c0 04             	add    $0x4,%eax
    1c7e:	89 04 24             	mov    %eax,(%esp)
    1c81:	e8 26 fc ff ff       	call   18ac <lock_release>
    tsleep();
    1c86:	e8 19 f7 ff ff       	call   13a4 <tsleep>
}
    1c8b:	c9                   	leave  
    1c8c:	c3                   	ret    
