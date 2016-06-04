
_test_random:     file format elf32-i386


Disassembly of section .text:

00001000 <main>:
#include "types.h"
#include "user.h"


int main(){
    1000:	55                   	push   %ebp
    1001:	89 e5                	mov    %esp,%ebp
    1003:	83 e4 f0             	and    $0xfffffff0,%esp
    1006:	83 ec 10             	sub    $0x10,%esp
    printf(1,"random number %d\n",random(100));
    1009:	c7 04 24 64 00 00 00 	movl   $0x64,(%esp)
    1010:	e8 b7 09 00 00       	call   19cc <random>
    1015:	89 44 24 08          	mov    %eax,0x8(%esp)
    1019:	c7 44 24 04 c5 1c 00 	movl   $0x1cc5,0x4(%esp)
    1020:	00 
    1021:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1028:	e8 9f 04 00 00       	call   14cc <printf>
    printf(1,"random number %d\n",random(100));
    102d:	c7 04 24 64 00 00 00 	movl   $0x64,(%esp)
    1034:	e8 93 09 00 00       	call   19cc <random>
    1039:	89 44 24 08          	mov    %eax,0x8(%esp)
    103d:	c7 44 24 04 c5 1c 00 	movl   $0x1cc5,0x4(%esp)
    1044:	00 
    1045:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    104c:	e8 7b 04 00 00       	call   14cc <printf>
    printf(1,"random number %d\n",random(100));
    1051:	c7 04 24 64 00 00 00 	movl   $0x64,(%esp)
    1058:	e8 6f 09 00 00       	call   19cc <random>
    105d:	89 44 24 08          	mov    %eax,0x8(%esp)
    1061:	c7 44 24 04 c5 1c 00 	movl   $0x1cc5,0x4(%esp)
    1068:	00 
    1069:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1070:	e8 57 04 00 00       	call   14cc <printf>
    printf(1,"random number %d\n",random(100));
    1075:	c7 04 24 64 00 00 00 	movl   $0x64,(%esp)
    107c:	e8 4b 09 00 00       	call   19cc <random>
    1081:	89 44 24 08          	mov    %eax,0x8(%esp)
    1085:	c7 44 24 04 c5 1c 00 	movl   $0x1cc5,0x4(%esp)
    108c:	00 
    108d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1094:	e8 33 04 00 00       	call   14cc <printf>
    printf(1,"random number %d\n",random(100));
    1099:	c7 04 24 64 00 00 00 	movl   $0x64,(%esp)
    10a0:	e8 27 09 00 00       	call   19cc <random>
    10a5:	89 44 24 08          	mov    %eax,0x8(%esp)
    10a9:	c7 44 24 04 c5 1c 00 	movl   $0x1cc5,0x4(%esp)
    10b0:	00 
    10b1:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    10b8:	e8 0f 04 00 00       	call   14cc <printf>

    exit();
    10bd:	e8 6a 02 00 00       	call   132c <exit>
    10c2:	66 90                	xchg   %ax,%ax

000010c4 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
    10c4:	55                   	push   %ebp
    10c5:	89 e5                	mov    %esp,%ebp
    10c7:	57                   	push   %edi
    10c8:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
    10c9:	8b 4d 08             	mov    0x8(%ebp),%ecx
    10cc:	8b 55 10             	mov    0x10(%ebp),%edx
    10cf:	8b 45 0c             	mov    0xc(%ebp),%eax
    10d2:	89 cb                	mov    %ecx,%ebx
    10d4:	89 df                	mov    %ebx,%edi
    10d6:	89 d1                	mov    %edx,%ecx
    10d8:	fc                   	cld    
    10d9:	f3 aa                	rep stos %al,%es:(%edi)
    10db:	89 ca                	mov    %ecx,%edx
    10dd:	89 fb                	mov    %edi,%ebx
    10df:	89 5d 08             	mov    %ebx,0x8(%ebp)
    10e2:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
    10e5:	5b                   	pop    %ebx
    10e6:	5f                   	pop    %edi
    10e7:	5d                   	pop    %ebp
    10e8:	c3                   	ret    

000010e9 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
    10e9:	55                   	push   %ebp
    10ea:	89 e5                	mov    %esp,%ebp
    10ec:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
    10ef:	8b 45 08             	mov    0x8(%ebp),%eax
    10f2:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
    10f5:	90                   	nop
    10f6:	8b 45 08             	mov    0x8(%ebp),%eax
    10f9:	8d 50 01             	lea    0x1(%eax),%edx
    10fc:	89 55 08             	mov    %edx,0x8(%ebp)
    10ff:	8b 55 0c             	mov    0xc(%ebp),%edx
    1102:	8d 4a 01             	lea    0x1(%edx),%ecx
    1105:	89 4d 0c             	mov    %ecx,0xc(%ebp)
    1108:	0f b6 12             	movzbl (%edx),%edx
    110b:	88 10                	mov    %dl,(%eax)
    110d:	0f b6 00             	movzbl (%eax),%eax
    1110:	84 c0                	test   %al,%al
    1112:	75 e2                	jne    10f6 <strcpy+0xd>
    ;
  return os;
    1114:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    1117:	c9                   	leave  
    1118:	c3                   	ret    

00001119 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    1119:	55                   	push   %ebp
    111a:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
    111c:	eb 08                	jmp    1126 <strcmp+0xd>
    p++, q++;
    111e:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    1122:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    1126:	8b 45 08             	mov    0x8(%ebp),%eax
    1129:	0f b6 00             	movzbl (%eax),%eax
    112c:	84 c0                	test   %al,%al
    112e:	74 10                	je     1140 <strcmp+0x27>
    1130:	8b 45 08             	mov    0x8(%ebp),%eax
    1133:	0f b6 10             	movzbl (%eax),%edx
    1136:	8b 45 0c             	mov    0xc(%ebp),%eax
    1139:	0f b6 00             	movzbl (%eax),%eax
    113c:	38 c2                	cmp    %al,%dl
    113e:	74 de                	je     111e <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
    1140:	8b 45 08             	mov    0x8(%ebp),%eax
    1143:	0f b6 00             	movzbl (%eax),%eax
    1146:	0f b6 d0             	movzbl %al,%edx
    1149:	8b 45 0c             	mov    0xc(%ebp),%eax
    114c:	0f b6 00             	movzbl (%eax),%eax
    114f:	0f b6 c0             	movzbl %al,%eax
    1152:	29 c2                	sub    %eax,%edx
    1154:	89 d0                	mov    %edx,%eax
}
    1156:	5d                   	pop    %ebp
    1157:	c3                   	ret    

00001158 <strlen>:

uint
strlen(char *s)
{
    1158:	55                   	push   %ebp
    1159:	89 e5                	mov    %esp,%ebp
    115b:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
    115e:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    1165:	eb 04                	jmp    116b <strlen+0x13>
    1167:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    116b:	8b 55 fc             	mov    -0x4(%ebp),%edx
    116e:	8b 45 08             	mov    0x8(%ebp),%eax
    1171:	01 d0                	add    %edx,%eax
    1173:	0f b6 00             	movzbl (%eax),%eax
    1176:	84 c0                	test   %al,%al
    1178:	75 ed                	jne    1167 <strlen+0xf>
    ;
  return n;
    117a:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    117d:	c9                   	leave  
    117e:	c3                   	ret    

0000117f <memset>:

void*
memset(void *dst, int c, uint n)
{
    117f:	55                   	push   %ebp
    1180:	89 e5                	mov    %esp,%ebp
    1182:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
    1185:	8b 45 10             	mov    0x10(%ebp),%eax
    1188:	89 44 24 08          	mov    %eax,0x8(%esp)
    118c:	8b 45 0c             	mov    0xc(%ebp),%eax
    118f:	89 44 24 04          	mov    %eax,0x4(%esp)
    1193:	8b 45 08             	mov    0x8(%ebp),%eax
    1196:	89 04 24             	mov    %eax,(%esp)
    1199:	e8 26 ff ff ff       	call   10c4 <stosb>
  return dst;
    119e:	8b 45 08             	mov    0x8(%ebp),%eax
}
    11a1:	c9                   	leave  
    11a2:	c3                   	ret    

000011a3 <strchr>:

char*
strchr(const char *s, char c)
{
    11a3:	55                   	push   %ebp
    11a4:	89 e5                	mov    %esp,%ebp
    11a6:	83 ec 04             	sub    $0x4,%esp
    11a9:	8b 45 0c             	mov    0xc(%ebp),%eax
    11ac:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
    11af:	eb 14                	jmp    11c5 <strchr+0x22>
    if(*s == c)
    11b1:	8b 45 08             	mov    0x8(%ebp),%eax
    11b4:	0f b6 00             	movzbl (%eax),%eax
    11b7:	3a 45 fc             	cmp    -0x4(%ebp),%al
    11ba:	75 05                	jne    11c1 <strchr+0x1e>
      return (char*)s;
    11bc:	8b 45 08             	mov    0x8(%ebp),%eax
    11bf:	eb 13                	jmp    11d4 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
    11c1:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    11c5:	8b 45 08             	mov    0x8(%ebp),%eax
    11c8:	0f b6 00             	movzbl (%eax),%eax
    11cb:	84 c0                	test   %al,%al
    11cd:	75 e2                	jne    11b1 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
    11cf:	b8 00 00 00 00       	mov    $0x0,%eax
}
    11d4:	c9                   	leave  
    11d5:	c3                   	ret    

000011d6 <gets>:

char*
gets(char *buf, int max)
{
    11d6:	55                   	push   %ebp
    11d7:	89 e5                	mov    %esp,%ebp
    11d9:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    11dc:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    11e3:	eb 4c                	jmp    1231 <gets+0x5b>
    cc = read(0, &c, 1);
    11e5:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    11ec:	00 
    11ed:	8d 45 ef             	lea    -0x11(%ebp),%eax
    11f0:	89 44 24 04          	mov    %eax,0x4(%esp)
    11f4:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    11fb:	e8 44 01 00 00       	call   1344 <read>
    1200:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
    1203:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1207:	7f 02                	jg     120b <gets+0x35>
      break;
    1209:	eb 31                	jmp    123c <gets+0x66>
    buf[i++] = c;
    120b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    120e:	8d 50 01             	lea    0x1(%eax),%edx
    1211:	89 55 f4             	mov    %edx,-0xc(%ebp)
    1214:	89 c2                	mov    %eax,%edx
    1216:	8b 45 08             	mov    0x8(%ebp),%eax
    1219:	01 c2                	add    %eax,%edx
    121b:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    121f:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
    1221:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    1225:	3c 0a                	cmp    $0xa,%al
    1227:	74 13                	je     123c <gets+0x66>
    1229:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    122d:	3c 0d                	cmp    $0xd,%al
    122f:	74 0b                	je     123c <gets+0x66>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1231:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1234:	83 c0 01             	add    $0x1,%eax
    1237:	3b 45 0c             	cmp    0xc(%ebp),%eax
    123a:	7c a9                	jl     11e5 <gets+0xf>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    123c:	8b 55 f4             	mov    -0xc(%ebp),%edx
    123f:	8b 45 08             	mov    0x8(%ebp),%eax
    1242:	01 d0                	add    %edx,%eax
    1244:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
    1247:	8b 45 08             	mov    0x8(%ebp),%eax
}
    124a:	c9                   	leave  
    124b:	c3                   	ret    

0000124c <stat>:

int
stat(char *n, struct stat *st)
{
    124c:	55                   	push   %ebp
    124d:	89 e5                	mov    %esp,%ebp
    124f:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    1252:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1259:	00 
    125a:	8b 45 08             	mov    0x8(%ebp),%eax
    125d:	89 04 24             	mov    %eax,(%esp)
    1260:	e8 07 01 00 00       	call   136c <open>
    1265:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
    1268:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    126c:	79 07                	jns    1275 <stat+0x29>
    return -1;
    126e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    1273:	eb 23                	jmp    1298 <stat+0x4c>
  r = fstat(fd, st);
    1275:	8b 45 0c             	mov    0xc(%ebp),%eax
    1278:	89 44 24 04          	mov    %eax,0x4(%esp)
    127c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    127f:	89 04 24             	mov    %eax,(%esp)
    1282:	e8 fd 00 00 00       	call   1384 <fstat>
    1287:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
    128a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    128d:	89 04 24             	mov    %eax,(%esp)
    1290:	e8 bf 00 00 00       	call   1354 <close>
  return r;
    1295:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
    1298:	c9                   	leave  
    1299:	c3                   	ret    

0000129a <atoi>:

int
atoi(const char *s)
{
    129a:	55                   	push   %ebp
    129b:	89 e5                	mov    %esp,%ebp
    129d:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
    12a0:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
    12a7:	eb 25                	jmp    12ce <atoi+0x34>
    n = n*10 + *s++ - '0';
    12a9:	8b 55 fc             	mov    -0x4(%ebp),%edx
    12ac:	89 d0                	mov    %edx,%eax
    12ae:	c1 e0 02             	shl    $0x2,%eax
    12b1:	01 d0                	add    %edx,%eax
    12b3:	01 c0                	add    %eax,%eax
    12b5:	89 c1                	mov    %eax,%ecx
    12b7:	8b 45 08             	mov    0x8(%ebp),%eax
    12ba:	8d 50 01             	lea    0x1(%eax),%edx
    12bd:	89 55 08             	mov    %edx,0x8(%ebp)
    12c0:	0f b6 00             	movzbl (%eax),%eax
    12c3:	0f be c0             	movsbl %al,%eax
    12c6:	01 c8                	add    %ecx,%eax
    12c8:	83 e8 30             	sub    $0x30,%eax
    12cb:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    12ce:	8b 45 08             	mov    0x8(%ebp),%eax
    12d1:	0f b6 00             	movzbl (%eax),%eax
    12d4:	3c 2f                	cmp    $0x2f,%al
    12d6:	7e 0a                	jle    12e2 <atoi+0x48>
    12d8:	8b 45 08             	mov    0x8(%ebp),%eax
    12db:	0f b6 00             	movzbl (%eax),%eax
    12de:	3c 39                	cmp    $0x39,%al
    12e0:	7e c7                	jle    12a9 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
    12e2:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    12e5:	c9                   	leave  
    12e6:	c3                   	ret    

000012e7 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    12e7:	55                   	push   %ebp
    12e8:	89 e5                	mov    %esp,%ebp
    12ea:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
    12ed:	8b 45 08             	mov    0x8(%ebp),%eax
    12f0:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
    12f3:	8b 45 0c             	mov    0xc(%ebp),%eax
    12f6:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
    12f9:	eb 17                	jmp    1312 <memmove+0x2b>
    *dst++ = *src++;
    12fb:	8b 45 fc             	mov    -0x4(%ebp),%eax
    12fe:	8d 50 01             	lea    0x1(%eax),%edx
    1301:	89 55 fc             	mov    %edx,-0x4(%ebp)
    1304:	8b 55 f8             	mov    -0x8(%ebp),%edx
    1307:	8d 4a 01             	lea    0x1(%edx),%ecx
    130a:	89 4d f8             	mov    %ecx,-0x8(%ebp)
    130d:	0f b6 12             	movzbl (%edx),%edx
    1310:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    1312:	8b 45 10             	mov    0x10(%ebp),%eax
    1315:	8d 50 ff             	lea    -0x1(%eax),%edx
    1318:	89 55 10             	mov    %edx,0x10(%ebp)
    131b:	85 c0                	test   %eax,%eax
    131d:	7f dc                	jg     12fb <memmove+0x14>
    *dst++ = *src++;
  return vdst;
    131f:	8b 45 08             	mov    0x8(%ebp),%eax
}
    1322:	c9                   	leave  
    1323:	c3                   	ret    

00001324 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    1324:	b8 01 00 00 00       	mov    $0x1,%eax
    1329:	cd 40                	int    $0x40
    132b:	c3                   	ret    

0000132c <exit>:
SYSCALL(exit)
    132c:	b8 02 00 00 00       	mov    $0x2,%eax
    1331:	cd 40                	int    $0x40
    1333:	c3                   	ret    

00001334 <wait>:
SYSCALL(wait)
    1334:	b8 03 00 00 00       	mov    $0x3,%eax
    1339:	cd 40                	int    $0x40
    133b:	c3                   	ret    

0000133c <pipe>:
SYSCALL(pipe)
    133c:	b8 04 00 00 00       	mov    $0x4,%eax
    1341:	cd 40                	int    $0x40
    1343:	c3                   	ret    

00001344 <read>:
SYSCALL(read)
    1344:	b8 05 00 00 00       	mov    $0x5,%eax
    1349:	cd 40                	int    $0x40
    134b:	c3                   	ret    

0000134c <write>:
SYSCALL(write)
    134c:	b8 10 00 00 00       	mov    $0x10,%eax
    1351:	cd 40                	int    $0x40
    1353:	c3                   	ret    

00001354 <close>:
SYSCALL(close)
    1354:	b8 15 00 00 00       	mov    $0x15,%eax
    1359:	cd 40                	int    $0x40
    135b:	c3                   	ret    

0000135c <kill>:
SYSCALL(kill)
    135c:	b8 06 00 00 00       	mov    $0x6,%eax
    1361:	cd 40                	int    $0x40
    1363:	c3                   	ret    

00001364 <exec>:
SYSCALL(exec)
    1364:	b8 07 00 00 00       	mov    $0x7,%eax
    1369:	cd 40                	int    $0x40
    136b:	c3                   	ret    

0000136c <open>:
SYSCALL(open)
    136c:	b8 0f 00 00 00       	mov    $0xf,%eax
    1371:	cd 40                	int    $0x40
    1373:	c3                   	ret    

00001374 <mknod>:
SYSCALL(mknod)
    1374:	b8 11 00 00 00       	mov    $0x11,%eax
    1379:	cd 40                	int    $0x40
    137b:	c3                   	ret    

0000137c <unlink>:
SYSCALL(unlink)
    137c:	b8 12 00 00 00       	mov    $0x12,%eax
    1381:	cd 40                	int    $0x40
    1383:	c3                   	ret    

00001384 <fstat>:
SYSCALL(fstat)
    1384:	b8 08 00 00 00       	mov    $0x8,%eax
    1389:	cd 40                	int    $0x40
    138b:	c3                   	ret    

0000138c <link>:
SYSCALL(link)
    138c:	b8 13 00 00 00       	mov    $0x13,%eax
    1391:	cd 40                	int    $0x40
    1393:	c3                   	ret    

00001394 <mkdir>:
SYSCALL(mkdir)
    1394:	b8 14 00 00 00       	mov    $0x14,%eax
    1399:	cd 40                	int    $0x40
    139b:	c3                   	ret    

0000139c <chdir>:
SYSCALL(chdir)
    139c:	b8 09 00 00 00       	mov    $0x9,%eax
    13a1:	cd 40                	int    $0x40
    13a3:	c3                   	ret    

000013a4 <dup>:
SYSCALL(dup)
    13a4:	b8 0a 00 00 00       	mov    $0xa,%eax
    13a9:	cd 40                	int    $0x40
    13ab:	c3                   	ret    

000013ac <getpid>:
SYSCALL(getpid)
    13ac:	b8 0b 00 00 00       	mov    $0xb,%eax
    13b1:	cd 40                	int    $0x40
    13b3:	c3                   	ret    

000013b4 <sbrk>:
SYSCALL(sbrk)
    13b4:	b8 0c 00 00 00       	mov    $0xc,%eax
    13b9:	cd 40                	int    $0x40
    13bb:	c3                   	ret    

000013bc <sleep>:
SYSCALL(sleep)
    13bc:	b8 0d 00 00 00       	mov    $0xd,%eax
    13c1:	cd 40                	int    $0x40
    13c3:	c3                   	ret    

000013c4 <uptime>:
SYSCALL(uptime)
    13c4:	b8 0e 00 00 00       	mov    $0xe,%eax
    13c9:	cd 40                	int    $0x40
    13cb:	c3                   	ret    

000013cc <clone>:
SYSCALL(clone)
    13cc:	b8 16 00 00 00       	mov    $0x16,%eax
    13d1:	cd 40                	int    $0x40
    13d3:	c3                   	ret    

000013d4 <texit>:
SYSCALL(texit)
    13d4:	b8 17 00 00 00       	mov    $0x17,%eax
    13d9:	cd 40                	int    $0x40
    13db:	c3                   	ret    

000013dc <tsleep>:
SYSCALL(tsleep)
    13dc:	b8 18 00 00 00       	mov    $0x18,%eax
    13e1:	cd 40                	int    $0x40
    13e3:	c3                   	ret    

000013e4 <twakeup>:
SYSCALL(twakeup)
    13e4:	b8 19 00 00 00       	mov    $0x19,%eax
    13e9:	cd 40                	int    $0x40
    13eb:	c3                   	ret    

000013ec <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
    13ec:	55                   	push   %ebp
    13ed:	89 e5                	mov    %esp,%ebp
    13ef:	83 ec 18             	sub    $0x18,%esp
    13f2:	8b 45 0c             	mov    0xc(%ebp),%eax
    13f5:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
    13f8:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    13ff:	00 
    1400:	8d 45 f4             	lea    -0xc(%ebp),%eax
    1403:	89 44 24 04          	mov    %eax,0x4(%esp)
    1407:	8b 45 08             	mov    0x8(%ebp),%eax
    140a:	89 04 24             	mov    %eax,(%esp)
    140d:	e8 3a ff ff ff       	call   134c <write>
}
    1412:	c9                   	leave  
    1413:	c3                   	ret    

00001414 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
    1414:	55                   	push   %ebp
    1415:	89 e5                	mov    %esp,%ebp
    1417:	56                   	push   %esi
    1418:	53                   	push   %ebx
    1419:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    141c:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
    1423:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
    1427:	74 17                	je     1440 <printint+0x2c>
    1429:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    142d:	79 11                	jns    1440 <printint+0x2c>
    neg = 1;
    142f:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
    1436:	8b 45 0c             	mov    0xc(%ebp),%eax
    1439:	f7 d8                	neg    %eax
    143b:	89 45 ec             	mov    %eax,-0x14(%ebp)
    143e:	eb 06                	jmp    1446 <printint+0x32>
  } else {
    x = xx;
    1440:	8b 45 0c             	mov    0xc(%ebp),%eax
    1443:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
    1446:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
    144d:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    1450:	8d 41 01             	lea    0x1(%ecx),%eax
    1453:	89 45 f4             	mov    %eax,-0xc(%ebp)
    1456:	8b 5d 10             	mov    0x10(%ebp),%ebx
    1459:	8b 45 ec             	mov    -0x14(%ebp),%eax
    145c:	ba 00 00 00 00       	mov    $0x0,%edx
    1461:	f7 f3                	div    %ebx
    1463:	89 d0                	mov    %edx,%eax
    1465:	0f b6 80 30 21 00 00 	movzbl 0x2130(%eax),%eax
    146c:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
    1470:	8b 75 10             	mov    0x10(%ebp),%esi
    1473:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1476:	ba 00 00 00 00       	mov    $0x0,%edx
    147b:	f7 f6                	div    %esi
    147d:	89 45 ec             	mov    %eax,-0x14(%ebp)
    1480:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1484:	75 c7                	jne    144d <printint+0x39>
  if(neg)
    1486:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    148a:	74 10                	je     149c <printint+0x88>
    buf[i++] = '-';
    148c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    148f:	8d 50 01             	lea    0x1(%eax),%edx
    1492:	89 55 f4             	mov    %edx,-0xc(%ebp)
    1495:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
    149a:	eb 1f                	jmp    14bb <printint+0xa7>
    149c:	eb 1d                	jmp    14bb <printint+0xa7>
    putc(fd, buf[i]);
    149e:	8d 55 dc             	lea    -0x24(%ebp),%edx
    14a1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    14a4:	01 d0                	add    %edx,%eax
    14a6:	0f b6 00             	movzbl (%eax),%eax
    14a9:	0f be c0             	movsbl %al,%eax
    14ac:	89 44 24 04          	mov    %eax,0x4(%esp)
    14b0:	8b 45 08             	mov    0x8(%ebp),%eax
    14b3:	89 04 24             	mov    %eax,(%esp)
    14b6:	e8 31 ff ff ff       	call   13ec <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    14bb:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    14bf:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    14c3:	79 d9                	jns    149e <printint+0x8a>
    putc(fd, buf[i]);
}
    14c5:	83 c4 30             	add    $0x30,%esp
    14c8:	5b                   	pop    %ebx
    14c9:	5e                   	pop    %esi
    14ca:	5d                   	pop    %ebp
    14cb:	c3                   	ret    

000014cc <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    14cc:	55                   	push   %ebp
    14cd:	89 e5                	mov    %esp,%ebp
    14cf:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
    14d2:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
    14d9:	8d 45 0c             	lea    0xc(%ebp),%eax
    14dc:	83 c0 04             	add    $0x4,%eax
    14df:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
    14e2:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    14e9:	e9 7c 01 00 00       	jmp    166a <printf+0x19e>
    c = fmt[i] & 0xff;
    14ee:	8b 55 0c             	mov    0xc(%ebp),%edx
    14f1:	8b 45 f0             	mov    -0x10(%ebp),%eax
    14f4:	01 d0                	add    %edx,%eax
    14f6:	0f b6 00             	movzbl (%eax),%eax
    14f9:	0f be c0             	movsbl %al,%eax
    14fc:	25 ff 00 00 00       	and    $0xff,%eax
    1501:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
    1504:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1508:	75 2c                	jne    1536 <printf+0x6a>
      if(c == '%'){
    150a:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    150e:	75 0c                	jne    151c <printf+0x50>
        state = '%';
    1510:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
    1517:	e9 4a 01 00 00       	jmp    1666 <printf+0x19a>
      } else {
        putc(fd, c);
    151c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    151f:	0f be c0             	movsbl %al,%eax
    1522:	89 44 24 04          	mov    %eax,0x4(%esp)
    1526:	8b 45 08             	mov    0x8(%ebp),%eax
    1529:	89 04 24             	mov    %eax,(%esp)
    152c:	e8 bb fe ff ff       	call   13ec <putc>
    1531:	e9 30 01 00 00       	jmp    1666 <printf+0x19a>
      }
    } else if(state == '%'){
    1536:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
    153a:	0f 85 26 01 00 00    	jne    1666 <printf+0x19a>
      if(c == 'd'){
    1540:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
    1544:	75 2d                	jne    1573 <printf+0xa7>
        printint(fd, *ap, 10, 1);
    1546:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1549:	8b 00                	mov    (%eax),%eax
    154b:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    1552:	00 
    1553:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
    155a:	00 
    155b:	89 44 24 04          	mov    %eax,0x4(%esp)
    155f:	8b 45 08             	mov    0x8(%ebp),%eax
    1562:	89 04 24             	mov    %eax,(%esp)
    1565:	e8 aa fe ff ff       	call   1414 <printint>
        ap++;
    156a:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    156e:	e9 ec 00 00 00       	jmp    165f <printf+0x193>
      } else if(c == 'x' || c == 'p'){
    1573:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
    1577:	74 06                	je     157f <printf+0xb3>
    1579:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
    157d:	75 2d                	jne    15ac <printf+0xe0>
        printint(fd, *ap, 16, 0);
    157f:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1582:	8b 00                	mov    (%eax),%eax
    1584:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    158b:	00 
    158c:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
    1593:	00 
    1594:	89 44 24 04          	mov    %eax,0x4(%esp)
    1598:	8b 45 08             	mov    0x8(%ebp),%eax
    159b:	89 04 24             	mov    %eax,(%esp)
    159e:	e8 71 fe ff ff       	call   1414 <printint>
        ap++;
    15a3:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    15a7:	e9 b3 00 00 00       	jmp    165f <printf+0x193>
      } else if(c == 's'){
    15ac:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
    15b0:	75 45                	jne    15f7 <printf+0x12b>
        s = (char*)*ap;
    15b2:	8b 45 e8             	mov    -0x18(%ebp),%eax
    15b5:	8b 00                	mov    (%eax),%eax
    15b7:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
    15ba:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
    15be:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    15c2:	75 09                	jne    15cd <printf+0x101>
          s = "(null)";
    15c4:	c7 45 f4 d7 1c 00 00 	movl   $0x1cd7,-0xc(%ebp)
        while(*s != 0){
    15cb:	eb 1e                	jmp    15eb <printf+0x11f>
    15cd:	eb 1c                	jmp    15eb <printf+0x11f>
          putc(fd, *s);
    15cf:	8b 45 f4             	mov    -0xc(%ebp),%eax
    15d2:	0f b6 00             	movzbl (%eax),%eax
    15d5:	0f be c0             	movsbl %al,%eax
    15d8:	89 44 24 04          	mov    %eax,0x4(%esp)
    15dc:	8b 45 08             	mov    0x8(%ebp),%eax
    15df:	89 04 24             	mov    %eax,(%esp)
    15e2:	e8 05 fe ff ff       	call   13ec <putc>
          s++;
    15e7:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    15eb:	8b 45 f4             	mov    -0xc(%ebp),%eax
    15ee:	0f b6 00             	movzbl (%eax),%eax
    15f1:	84 c0                	test   %al,%al
    15f3:	75 da                	jne    15cf <printf+0x103>
    15f5:	eb 68                	jmp    165f <printf+0x193>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    15f7:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
    15fb:	75 1d                	jne    161a <printf+0x14e>
        putc(fd, *ap);
    15fd:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1600:	8b 00                	mov    (%eax),%eax
    1602:	0f be c0             	movsbl %al,%eax
    1605:	89 44 24 04          	mov    %eax,0x4(%esp)
    1609:	8b 45 08             	mov    0x8(%ebp),%eax
    160c:	89 04 24             	mov    %eax,(%esp)
    160f:	e8 d8 fd ff ff       	call   13ec <putc>
        ap++;
    1614:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    1618:	eb 45                	jmp    165f <printf+0x193>
      } else if(c == '%'){
    161a:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    161e:	75 17                	jne    1637 <printf+0x16b>
        putc(fd, c);
    1620:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1623:	0f be c0             	movsbl %al,%eax
    1626:	89 44 24 04          	mov    %eax,0x4(%esp)
    162a:	8b 45 08             	mov    0x8(%ebp),%eax
    162d:	89 04 24             	mov    %eax,(%esp)
    1630:	e8 b7 fd ff ff       	call   13ec <putc>
    1635:	eb 28                	jmp    165f <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
    1637:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
    163e:	00 
    163f:	8b 45 08             	mov    0x8(%ebp),%eax
    1642:	89 04 24             	mov    %eax,(%esp)
    1645:	e8 a2 fd ff ff       	call   13ec <putc>
        putc(fd, c);
    164a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    164d:	0f be c0             	movsbl %al,%eax
    1650:	89 44 24 04          	mov    %eax,0x4(%esp)
    1654:	8b 45 08             	mov    0x8(%ebp),%eax
    1657:	89 04 24             	mov    %eax,(%esp)
    165a:	e8 8d fd ff ff       	call   13ec <putc>
      }
      state = 0;
    165f:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1666:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    166a:	8b 55 0c             	mov    0xc(%ebp),%edx
    166d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1670:	01 d0                	add    %edx,%eax
    1672:	0f b6 00             	movzbl (%eax),%eax
    1675:	84 c0                	test   %al,%al
    1677:	0f 85 71 fe ff ff    	jne    14ee <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    167d:	c9                   	leave  
    167e:	c3                   	ret    
    167f:	90                   	nop

00001680 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    1680:	55                   	push   %ebp
    1681:	89 e5                	mov    %esp,%ebp
    1683:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
    1686:	8b 45 08             	mov    0x8(%ebp),%eax
    1689:	83 e8 08             	sub    $0x8,%eax
    168c:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    168f:	a1 50 21 00 00       	mov    0x2150,%eax
    1694:	89 45 fc             	mov    %eax,-0x4(%ebp)
    1697:	eb 24                	jmp    16bd <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1699:	8b 45 fc             	mov    -0x4(%ebp),%eax
    169c:	8b 00                	mov    (%eax),%eax
    169e:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    16a1:	77 12                	ja     16b5 <free+0x35>
    16a3:	8b 45 f8             	mov    -0x8(%ebp),%eax
    16a6:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    16a9:	77 24                	ja     16cf <free+0x4f>
    16ab:	8b 45 fc             	mov    -0x4(%ebp),%eax
    16ae:	8b 00                	mov    (%eax),%eax
    16b0:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    16b3:	77 1a                	ja     16cf <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    16b5:	8b 45 fc             	mov    -0x4(%ebp),%eax
    16b8:	8b 00                	mov    (%eax),%eax
    16ba:	89 45 fc             	mov    %eax,-0x4(%ebp)
    16bd:	8b 45 f8             	mov    -0x8(%ebp),%eax
    16c0:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    16c3:	76 d4                	jbe    1699 <free+0x19>
    16c5:	8b 45 fc             	mov    -0x4(%ebp),%eax
    16c8:	8b 00                	mov    (%eax),%eax
    16ca:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    16cd:	76 ca                	jbe    1699 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    16cf:	8b 45 f8             	mov    -0x8(%ebp),%eax
    16d2:	8b 40 04             	mov    0x4(%eax),%eax
    16d5:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    16dc:	8b 45 f8             	mov    -0x8(%ebp),%eax
    16df:	01 c2                	add    %eax,%edx
    16e1:	8b 45 fc             	mov    -0x4(%ebp),%eax
    16e4:	8b 00                	mov    (%eax),%eax
    16e6:	39 c2                	cmp    %eax,%edx
    16e8:	75 24                	jne    170e <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
    16ea:	8b 45 f8             	mov    -0x8(%ebp),%eax
    16ed:	8b 50 04             	mov    0x4(%eax),%edx
    16f0:	8b 45 fc             	mov    -0x4(%ebp),%eax
    16f3:	8b 00                	mov    (%eax),%eax
    16f5:	8b 40 04             	mov    0x4(%eax),%eax
    16f8:	01 c2                	add    %eax,%edx
    16fa:	8b 45 f8             	mov    -0x8(%ebp),%eax
    16fd:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
    1700:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1703:	8b 00                	mov    (%eax),%eax
    1705:	8b 10                	mov    (%eax),%edx
    1707:	8b 45 f8             	mov    -0x8(%ebp),%eax
    170a:	89 10                	mov    %edx,(%eax)
    170c:	eb 0a                	jmp    1718 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
    170e:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1711:	8b 10                	mov    (%eax),%edx
    1713:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1716:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
    1718:	8b 45 fc             	mov    -0x4(%ebp),%eax
    171b:	8b 40 04             	mov    0x4(%eax),%eax
    171e:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    1725:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1728:	01 d0                	add    %edx,%eax
    172a:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    172d:	75 20                	jne    174f <free+0xcf>
    p->s.size += bp->s.size;
    172f:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1732:	8b 50 04             	mov    0x4(%eax),%edx
    1735:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1738:	8b 40 04             	mov    0x4(%eax),%eax
    173b:	01 c2                	add    %eax,%edx
    173d:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1740:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    1743:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1746:	8b 10                	mov    (%eax),%edx
    1748:	8b 45 fc             	mov    -0x4(%ebp),%eax
    174b:	89 10                	mov    %edx,(%eax)
    174d:	eb 08                	jmp    1757 <free+0xd7>
  } else
    p->s.ptr = bp;
    174f:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1752:	8b 55 f8             	mov    -0x8(%ebp),%edx
    1755:	89 10                	mov    %edx,(%eax)
  freep = p;
    1757:	8b 45 fc             	mov    -0x4(%ebp),%eax
    175a:	a3 50 21 00 00       	mov    %eax,0x2150
}
    175f:	c9                   	leave  
    1760:	c3                   	ret    

00001761 <morecore>:

static Header*
morecore(uint nu)
{
    1761:	55                   	push   %ebp
    1762:	89 e5                	mov    %esp,%ebp
    1764:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
    1767:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
    176e:	77 07                	ja     1777 <morecore+0x16>
    nu = 4096;
    1770:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
    1777:	8b 45 08             	mov    0x8(%ebp),%eax
    177a:	c1 e0 03             	shl    $0x3,%eax
    177d:	89 04 24             	mov    %eax,(%esp)
    1780:	e8 2f fc ff ff       	call   13b4 <sbrk>
    1785:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
    1788:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
    178c:	75 07                	jne    1795 <morecore+0x34>
    return 0;
    178e:	b8 00 00 00 00       	mov    $0x0,%eax
    1793:	eb 22                	jmp    17b7 <morecore+0x56>
  hp = (Header*)p;
    1795:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1798:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
    179b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    179e:	8b 55 08             	mov    0x8(%ebp),%edx
    17a1:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
    17a4:	8b 45 f0             	mov    -0x10(%ebp),%eax
    17a7:	83 c0 08             	add    $0x8,%eax
    17aa:	89 04 24             	mov    %eax,(%esp)
    17ad:	e8 ce fe ff ff       	call   1680 <free>
  return freep;
    17b2:	a1 50 21 00 00       	mov    0x2150,%eax
}
    17b7:	c9                   	leave  
    17b8:	c3                   	ret    

000017b9 <malloc>:

void*
malloc(uint nbytes)
{
    17b9:	55                   	push   %ebp
    17ba:	89 e5                	mov    %esp,%ebp
    17bc:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    17bf:	8b 45 08             	mov    0x8(%ebp),%eax
    17c2:	83 c0 07             	add    $0x7,%eax
    17c5:	c1 e8 03             	shr    $0x3,%eax
    17c8:	83 c0 01             	add    $0x1,%eax
    17cb:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
    17ce:	a1 50 21 00 00       	mov    0x2150,%eax
    17d3:	89 45 f0             	mov    %eax,-0x10(%ebp)
    17d6:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    17da:	75 23                	jne    17ff <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
    17dc:	c7 45 f0 48 21 00 00 	movl   $0x2148,-0x10(%ebp)
    17e3:	8b 45 f0             	mov    -0x10(%ebp),%eax
    17e6:	a3 50 21 00 00       	mov    %eax,0x2150
    17eb:	a1 50 21 00 00       	mov    0x2150,%eax
    17f0:	a3 48 21 00 00       	mov    %eax,0x2148
    base.s.size = 0;
    17f5:	c7 05 4c 21 00 00 00 	movl   $0x0,0x214c
    17fc:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    17ff:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1802:	8b 00                	mov    (%eax),%eax
    1804:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
    1807:	8b 45 f4             	mov    -0xc(%ebp),%eax
    180a:	8b 40 04             	mov    0x4(%eax),%eax
    180d:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    1810:	72 4d                	jb     185f <malloc+0xa6>
      if(p->s.size == nunits)
    1812:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1815:	8b 40 04             	mov    0x4(%eax),%eax
    1818:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    181b:	75 0c                	jne    1829 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
    181d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1820:	8b 10                	mov    (%eax),%edx
    1822:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1825:	89 10                	mov    %edx,(%eax)
    1827:	eb 26                	jmp    184f <malloc+0x96>
      else {
        p->s.size -= nunits;
    1829:	8b 45 f4             	mov    -0xc(%ebp),%eax
    182c:	8b 40 04             	mov    0x4(%eax),%eax
    182f:	2b 45 ec             	sub    -0x14(%ebp),%eax
    1832:	89 c2                	mov    %eax,%edx
    1834:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1837:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
    183a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    183d:	8b 40 04             	mov    0x4(%eax),%eax
    1840:	c1 e0 03             	shl    $0x3,%eax
    1843:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
    1846:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1849:	8b 55 ec             	mov    -0x14(%ebp),%edx
    184c:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
    184f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1852:	a3 50 21 00 00       	mov    %eax,0x2150
      return (void*)(p + 1);
    1857:	8b 45 f4             	mov    -0xc(%ebp),%eax
    185a:	83 c0 08             	add    $0x8,%eax
    185d:	eb 38                	jmp    1897 <malloc+0xde>
    }
    if(p == freep)
    185f:	a1 50 21 00 00       	mov    0x2150,%eax
    1864:	39 45 f4             	cmp    %eax,-0xc(%ebp)
    1867:	75 1b                	jne    1884 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
    1869:	8b 45 ec             	mov    -0x14(%ebp),%eax
    186c:	89 04 24             	mov    %eax,(%esp)
    186f:	e8 ed fe ff ff       	call   1761 <morecore>
    1874:	89 45 f4             	mov    %eax,-0xc(%ebp)
    1877:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    187b:	75 07                	jne    1884 <malloc+0xcb>
        return 0;
    187d:	b8 00 00 00 00       	mov    $0x0,%eax
    1882:	eb 13                	jmp    1897 <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1884:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1887:	89 45 f0             	mov    %eax,-0x10(%ebp)
    188a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    188d:	8b 00                	mov    (%eax),%eax
    188f:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
    1892:	e9 70 ff ff ff       	jmp    1807 <malloc+0x4e>
}
    1897:	c9                   	leave  
    1898:	c3                   	ret    
    1899:	66 90                	xchg   %ax,%ax
    189b:	90                   	nop

0000189c <xchg>:
  asm volatile("sti");
}

static inline uint
xchg(volatile uint *addr, uint newval)
{
    189c:	55                   	push   %ebp
    189d:	89 e5                	mov    %esp,%ebp
    189f:	83 ec 10             	sub    $0x10,%esp
  uint result;
  
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
    18a2:	8b 55 08             	mov    0x8(%ebp),%edx
    18a5:	8b 45 0c             	mov    0xc(%ebp),%eax
    18a8:	8b 4d 08             	mov    0x8(%ebp),%ecx
    18ab:	f0 87 02             	lock xchg %eax,(%edx)
    18ae:	89 45 fc             	mov    %eax,-0x4(%ebp)
               "+m" (*addr), "=a" (result) :
               "1" (newval) :
               "cc");
  return result;
    18b1:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    18b4:	c9                   	leave  
    18b5:	c3                   	ret    

000018b6 <lock_init>:
#include "x86.h"
#include "proc.h"

unsigned long rands = 1;

void lock_init(lock_t *lock){
    18b6:	55                   	push   %ebp
    18b7:	89 e5                	mov    %esp,%ebp
    lock->locked = 0;
    18b9:	8b 45 08             	mov    0x8(%ebp),%eax
    18bc:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
    18c2:	5d                   	pop    %ebp
    18c3:	c3                   	ret    

000018c4 <lock_acquire>:
void lock_acquire(lock_t *lock){
    18c4:	55                   	push   %ebp
    18c5:	89 e5                	mov    %esp,%ebp
    18c7:	83 ec 08             	sub    $0x8,%esp
    while(xchg(&lock->locked,1) != 0);
    18ca:	90                   	nop
    18cb:	8b 45 08             	mov    0x8(%ebp),%eax
    18ce:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
    18d5:	00 
    18d6:	89 04 24             	mov    %eax,(%esp)
    18d9:	e8 be ff ff ff       	call   189c <xchg>
    18de:	85 c0                	test   %eax,%eax
    18e0:	75 e9                	jne    18cb <lock_acquire+0x7>
}
    18e2:	c9                   	leave  
    18e3:	c3                   	ret    

000018e4 <lock_release>:
void lock_release(lock_t *lock){
    18e4:	55                   	push   %ebp
    18e5:	89 e5                	mov    %esp,%ebp
    18e7:	83 ec 08             	sub    $0x8,%esp
    xchg(&lock->locked,0);
    18ea:	8b 45 08             	mov    0x8(%ebp),%eax
    18ed:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    18f4:	00 
    18f5:	89 04 24             	mov    %eax,(%esp)
    18f8:	e8 9f ff ff ff       	call   189c <xchg>
}
    18fd:	c9                   	leave  
    18fe:	c3                   	ret    

000018ff <thread_create>:


void *thread_create(void(*start_routine)(void*), void *arg){
    18ff:	55                   	push   %ebp
    1900:	89 e5                	mov    %esp,%ebp
    1902:	83 ec 28             	sub    $0x28,%esp
    int tid;
    void * stack = malloc(2 * 4096);
    1905:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
    190c:	e8 a8 fe ff ff       	call   17b9 <malloc>
    1911:	89 45 f4             	mov    %eax,-0xc(%ebp)
    void *garbage_stack = stack; 
    1914:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1917:	89 45 f0             	mov    %eax,-0x10(%ebp)
   // printf(1,"start routine addr : %d\n",(uint)start_routine);


    if((uint)stack % 4096){
    191a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    191d:	25 ff 0f 00 00       	and    $0xfff,%eax
    1922:	85 c0                	test   %eax,%eax
    1924:	74 14                	je     193a <thread_create+0x3b>
        stack = stack + (4096 - (uint)stack % 4096);
    1926:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1929:	25 ff 0f 00 00       	and    $0xfff,%eax
    192e:	89 c2                	mov    %eax,%edx
    1930:	b8 00 10 00 00       	mov    $0x1000,%eax
    1935:	29 d0                	sub    %edx,%eax
    1937:	01 45 f4             	add    %eax,-0xc(%ebp)
    }
    if (stack == 0){
    193a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    193e:	75 1b                	jne    195b <thread_create+0x5c>

        printf(1,"malloc fail \n");
    1940:	c7 44 24 04 de 1c 00 	movl   $0x1cde,0x4(%esp)
    1947:	00 
    1948:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    194f:	e8 78 fb ff ff       	call   14cc <printf>
        return 0;
    1954:	b8 00 00 00 00       	mov    $0x0,%eax
    1959:	eb 6f                	jmp    19ca <thread_create+0xcb>
    }

    tid = clone((uint)stack,PSIZE,(uint)start_routine,(int)arg);
    195b:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    195e:	8b 55 08             	mov    0x8(%ebp),%edx
    1961:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1964:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
    1968:	89 54 24 08          	mov    %edx,0x8(%esp)
    196c:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
    1973:	00 
    1974:	89 04 24             	mov    %eax,(%esp)
    1977:	e8 50 fa ff ff       	call   13cc <clone>
    197c:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(tid < 0){
    197f:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1983:	79 1b                	jns    19a0 <thread_create+0xa1>
        printf(1,"clone fails\n");
    1985:	c7 44 24 04 ec 1c 00 	movl   $0x1cec,0x4(%esp)
    198c:	00 
    198d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1994:	e8 33 fb ff ff       	call   14cc <printf>
        return 0;
    1999:	b8 00 00 00 00       	mov    $0x0,%eax
    199e:	eb 2a                	jmp    19ca <thread_create+0xcb>
    }
    if(tid > 0){
    19a0:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    19a4:	7e 05                	jle    19ab <thread_create+0xac>
        //store threads on thread table
        return garbage_stack;
    19a6:	8b 45 f0             	mov    -0x10(%ebp),%eax
    19a9:	eb 1f                	jmp    19ca <thread_create+0xcb>
    }
    if(tid == 0){
    19ab:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    19af:	75 14                	jne    19c5 <thread_create+0xc6>
        printf(1,"tid = 0 return \n");
    19b1:	c7 44 24 04 f9 1c 00 	movl   $0x1cf9,0x4(%esp)
    19b8:	00 
    19b9:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    19c0:	e8 07 fb ff ff       	call   14cc <printf>
    }
//    wait();
//    free(garbage_stack);

    return 0;
    19c5:	b8 00 00 00 00       	mov    $0x0,%eax
}
    19ca:	c9                   	leave  
    19cb:	c3                   	ret    

000019cc <random>:

// generate 0 -> max random number exclude max.
int random(int max){
    19cc:	55                   	push   %ebp
    19cd:	89 e5                	mov    %esp,%ebp
    rands = rands * 1664525 + 1013904233;
    19cf:	a1 44 21 00 00       	mov    0x2144,%eax
    19d4:	69 c0 0d 66 19 00    	imul   $0x19660d,%eax,%eax
    19da:	05 69 f3 6e 3c       	add    $0x3c6ef369,%eax
    19df:	a3 44 21 00 00       	mov    %eax,0x2144
    return (int)(rands % max);
    19e4:	a1 44 21 00 00       	mov    0x2144,%eax
    19e9:	8b 4d 08             	mov    0x8(%ebp),%ecx
    19ec:	ba 00 00 00 00       	mov    $0x0,%edx
    19f1:	f7 f1                	div    %ecx
    19f3:	89 d0                	mov    %edx,%eax
}
    19f5:	5d                   	pop    %ebp
    19f6:	c3                   	ret    
    19f7:	90                   	nop

000019f8 <init_q>:
#include "queue.h"
#include "types.h"
#include "user.h"

void init_q(struct queue *q){
    19f8:	55                   	push   %ebp
    19f9:	89 e5                	mov    %esp,%ebp
    q->size = 0;
    19fb:	8b 45 08             	mov    0x8(%ebp),%eax
    19fe:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    q->head = 0;
    1a04:	8b 45 08             	mov    0x8(%ebp),%eax
    1a07:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    q->tail = 0;
    1a0e:	8b 45 08             	mov    0x8(%ebp),%eax
    1a11:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
}
    1a18:	5d                   	pop    %ebp
    1a19:	c3                   	ret    

00001a1a <add_q>:

void add_q(struct queue *q, int v){
    1a1a:	55                   	push   %ebp
    1a1b:	89 e5                	mov    %esp,%ebp
    1a1d:	83 ec 28             	sub    $0x28,%esp
    struct node * n = malloc(sizeof(struct node));
    1a20:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
    1a27:	e8 8d fd ff ff       	call   17b9 <malloc>
    1a2c:	89 45 f4             	mov    %eax,-0xc(%ebp)
    n->next = 0;
    1a2f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1a32:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    n->value = v;
    1a39:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1a3c:	8b 55 0c             	mov    0xc(%ebp),%edx
    1a3f:	89 10                	mov    %edx,(%eax)
    if(q->head == 0){
    1a41:	8b 45 08             	mov    0x8(%ebp),%eax
    1a44:	8b 40 04             	mov    0x4(%eax),%eax
    1a47:	85 c0                	test   %eax,%eax
    1a49:	75 0b                	jne    1a56 <add_q+0x3c>
        q->head = n;
    1a4b:	8b 45 08             	mov    0x8(%ebp),%eax
    1a4e:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1a51:	89 50 04             	mov    %edx,0x4(%eax)
    1a54:	eb 0c                	jmp    1a62 <add_q+0x48>
    }else{
        q->tail->next = n;
    1a56:	8b 45 08             	mov    0x8(%ebp),%eax
    1a59:	8b 40 08             	mov    0x8(%eax),%eax
    1a5c:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1a5f:	89 50 04             	mov    %edx,0x4(%eax)
    }
    q->tail = n;
    1a62:	8b 45 08             	mov    0x8(%ebp),%eax
    1a65:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1a68:	89 50 08             	mov    %edx,0x8(%eax)
    q->size++;
    1a6b:	8b 45 08             	mov    0x8(%ebp),%eax
    1a6e:	8b 00                	mov    (%eax),%eax
    1a70:	8d 50 01             	lea    0x1(%eax),%edx
    1a73:	8b 45 08             	mov    0x8(%ebp),%eax
    1a76:	89 10                	mov    %edx,(%eax)
}
    1a78:	c9                   	leave  
    1a79:	c3                   	ret    

00001a7a <empty_q>:

int empty_q(struct queue *q){
    1a7a:	55                   	push   %ebp
    1a7b:	89 e5                	mov    %esp,%ebp
    if(q->size == 0)
    1a7d:	8b 45 08             	mov    0x8(%ebp),%eax
    1a80:	8b 00                	mov    (%eax),%eax
    1a82:	85 c0                	test   %eax,%eax
    1a84:	75 07                	jne    1a8d <empty_q+0x13>
        return 1;
    1a86:	b8 01 00 00 00       	mov    $0x1,%eax
    1a8b:	eb 05                	jmp    1a92 <empty_q+0x18>
    else
        return 0;
    1a8d:	b8 00 00 00 00       	mov    $0x0,%eax
} 
    1a92:	5d                   	pop    %ebp
    1a93:	c3                   	ret    

00001a94 <pop_q>:
int pop_q(struct queue *q){
    1a94:	55                   	push   %ebp
    1a95:	89 e5                	mov    %esp,%ebp
    1a97:	83 ec 28             	sub    $0x28,%esp
    int val;
    struct node *destroy;
    if(!empty_q(q)){
    1a9a:	8b 45 08             	mov    0x8(%ebp),%eax
    1a9d:	89 04 24             	mov    %eax,(%esp)
    1aa0:	e8 d5 ff ff ff       	call   1a7a <empty_q>
    1aa5:	85 c0                	test   %eax,%eax
    1aa7:	75 5d                	jne    1b06 <pop_q+0x72>
       val = q->head->value; 
    1aa9:	8b 45 08             	mov    0x8(%ebp),%eax
    1aac:	8b 40 04             	mov    0x4(%eax),%eax
    1aaf:	8b 00                	mov    (%eax),%eax
    1ab1:	89 45 f4             	mov    %eax,-0xc(%ebp)
       destroy = q->head;
    1ab4:	8b 45 08             	mov    0x8(%ebp),%eax
    1ab7:	8b 40 04             	mov    0x4(%eax),%eax
    1aba:	89 45 f0             	mov    %eax,-0x10(%ebp)
       q->head = q->head->next;
    1abd:	8b 45 08             	mov    0x8(%ebp),%eax
    1ac0:	8b 40 04             	mov    0x4(%eax),%eax
    1ac3:	8b 50 04             	mov    0x4(%eax),%edx
    1ac6:	8b 45 08             	mov    0x8(%ebp),%eax
    1ac9:	89 50 04             	mov    %edx,0x4(%eax)
       free(destroy);
    1acc:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1acf:	89 04 24             	mov    %eax,(%esp)
    1ad2:	e8 a9 fb ff ff       	call   1680 <free>
       q->size--;
    1ad7:	8b 45 08             	mov    0x8(%ebp),%eax
    1ada:	8b 00                	mov    (%eax),%eax
    1adc:	8d 50 ff             	lea    -0x1(%eax),%edx
    1adf:	8b 45 08             	mov    0x8(%ebp),%eax
    1ae2:	89 10                	mov    %edx,(%eax)
       if(q->size == 0){
    1ae4:	8b 45 08             	mov    0x8(%ebp),%eax
    1ae7:	8b 00                	mov    (%eax),%eax
    1ae9:	85 c0                	test   %eax,%eax
    1aeb:	75 14                	jne    1b01 <pop_q+0x6d>
            q->head = 0;
    1aed:	8b 45 08             	mov    0x8(%ebp),%eax
    1af0:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
            q->tail = 0;
    1af7:	8b 45 08             	mov    0x8(%ebp),%eax
    1afa:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
       }
       return val;
    1b01:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1b04:	eb 05                	jmp    1b0b <pop_q+0x77>
    }
    return -1;
    1b06:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
    1b0b:	c9                   	leave  
    1b0c:	c3                   	ret    

00001b0d <dominant>:

void dominant(struct queue* q, int i){
    1b0d:	55                   	push   %ebp
    1b0e:	89 e5                	mov    %esp,%ebp
    1b10:	83 ec 28             	sub    $0x28,%esp
    struct node * n = malloc(sizeof(struct node));
    1b13:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
    1b1a:	e8 9a fc ff ff       	call   17b9 <malloc>
    1b1f:	89 45 f4             	mov    %eax,-0xc(%ebp)
    n->value = i;
    1b22:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1b25:	8b 55 0c             	mov    0xc(%ebp),%edx
    1b28:	89 10                	mov    %edx,(%eax)

    if(q->head == 0){
    1b2a:	8b 45 08             	mov    0x8(%ebp),%eax
    1b2d:	8b 40 04             	mov    0x4(%eax),%eax
    1b30:	85 c0                	test   %eax,%eax
    1b32:	75 14                	jne    1b48 <dominant+0x3b>
        q->head = n;
    1b34:	8b 45 08             	mov    0x8(%ebp),%eax
    1b37:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1b3a:	89 50 04             	mov    %edx,0x4(%eax)
        q->tail = n;
    1b3d:	8b 45 08             	mov    0x8(%ebp),%eax
    1b40:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1b43:	89 50 08             	mov    %edx,0x8(%eax)
    1b46:	eb 15                	jmp    1b5d <dominant+0x50>
    }
    else{
        n->next = q->head;
    1b48:	8b 45 08             	mov    0x8(%ebp),%eax
    1b4b:	8b 50 04             	mov    0x4(%eax),%edx
    1b4e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1b51:	89 50 04             	mov    %edx,0x4(%eax)
        q->head = n;
    1b54:	8b 45 08             	mov    0x8(%ebp),%eax
    1b57:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1b5a:	89 50 04             	mov    %edx,0x4(%eax)
    }
    q->size++;
    1b5d:	8b 45 08             	mov    0x8(%ebp),%eax
    1b60:	8b 00                	mov    (%eax),%eax
    1b62:	8d 50 01             	lea    0x1(%eax),%edx
    1b65:	8b 45 08             	mov    0x8(%ebp),%eax
    1b68:	89 10                	mov    %edx,(%eax)
}
    1b6a:	c9                   	leave  
    1b6b:	c3                   	ret    

00001b6c <sem_init>:
#include "semaphore.h"
#include "user.h"

// Initializes the semaphore
void sem_init(struct Semaphore* s, int value){
    1b6c:	55                   	push   %ebp
    1b6d:	89 e5                	mov    %esp,%ebp
    1b6f:	83 ec 18             	sub    $0x18,%esp
    s->val = value;
    1b72:	8b 45 08             	mov    0x8(%ebp),%eax
    1b75:	8b 55 0c             	mov    0xc(%ebp),%edx
    1b78:	89 10                	mov    %edx,(%eax)
    lock_init(&s->lock);
    1b7a:	8b 45 08             	mov    0x8(%ebp),%eax
    1b7d:	83 c0 04             	add    $0x4,%eax
    1b80:	89 04 24             	mov    %eax,(%esp)
    1b83:	e8 2e fd ff ff       	call   18b6 <lock_init>
    init_q(&s->q);
    1b88:	8b 45 08             	mov    0x8(%ebp),%eax
    1b8b:	83 c0 08             	add    $0x8,%eax
    1b8e:	89 04 24             	mov    %eax,(%esp)
    1b91:	e8 62 fe ff ff       	call   19f8 <init_q>
}
    1b96:	c9                   	leave  
    1b97:	c3                   	ret    

00001b98 <sem_acquire>:

// Decrements the semaphore
void sem_acquire(struct Semaphore* s){
    1b98:	55                   	push   %ebp
    1b99:	89 e5                	mov    %esp,%ebp
    1b9b:	83 ec 28             	sub    $0x28,%esp
    lock_acquire(&s->lock);
    1b9e:	8b 45 08             	mov    0x8(%ebp),%eax
    1ba1:	83 c0 04             	add    $0x4,%eax
    1ba4:	89 04 24             	mov    %eax,(%esp)
    1ba7:	e8 18 fd ff ff       	call   18c4 <lock_acquire>

    if(s->val == 0){
    1bac:	8b 45 08             	mov    0x8(%ebp),%eax
    1baf:	8b 00                	mov    (%eax),%eax
    1bb1:	85 c0                	test   %eax,%eax
    1bb3:	75 32                	jne    1be7 <sem_acquire+0x4f>
        int pid;
        pid = getpid();
    1bb5:	e8 f2 f7 ff ff       	call   13ac <getpid>
    1bba:	89 45 f4             	mov    %eax,-0xc(%ebp)
        add_q(&s->q, pid);
    1bbd:	8b 45 08             	mov    0x8(%ebp),%eax
    1bc0:	8d 50 08             	lea    0x8(%eax),%edx
    1bc3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1bc6:	89 44 24 04          	mov    %eax,0x4(%esp)
    1bca:	89 14 24             	mov    %edx,(%esp)
    1bcd:	e8 48 fe ff ff       	call   1a1a <add_q>
        lock_release(&s->lock);
    1bd2:	8b 45 08             	mov    0x8(%ebp),%eax
    1bd5:	83 c0 04             	add    $0x4,%eax
    1bd8:	89 04 24             	mov    %eax,(%esp)
    1bdb:	e8 04 fd ff ff       	call   18e4 <lock_release>
        tsleep();
    1be0:	e8 f7 f7 ff ff       	call   13dc <tsleep>
    1be5:	eb 1b                	jmp    1c02 <sem_acquire+0x6a>
    }
    else{
        s->val--;
    1be7:	8b 45 08             	mov    0x8(%ebp),%eax
    1bea:	8b 00                	mov    (%eax),%eax
    1bec:	8d 50 ff             	lea    -0x1(%eax),%edx
    1bef:	8b 45 08             	mov    0x8(%ebp),%eax
    1bf2:	89 10                	mov    %edx,(%eax)
        lock_release(&s->lock);
    1bf4:	8b 45 08             	mov    0x8(%ebp),%eax
    1bf7:	83 c0 04             	add    $0x4,%eax
    1bfa:	89 04 24             	mov    %eax,(%esp)
    1bfd:	e8 e2 fc ff ff       	call   18e4 <lock_release>
    }
}
    1c02:	c9                   	leave  
    1c03:	c3                   	ret    

00001c04 <sem_signal>:

// Increments the semaphore
void sem_signal(struct Semaphore* s){
    1c04:	55                   	push   %ebp
    1c05:	89 e5                	mov    %esp,%ebp
    1c07:	83 ec 18             	sub    $0x18,%esp
    lock_acquire(&s->lock);
    1c0a:	8b 45 08             	mov    0x8(%ebp),%eax
    1c0d:	83 c0 04             	add    $0x4,%eax
    1c10:	89 04 24             	mov    %eax,(%esp)
    1c13:	e8 ac fc ff ff       	call   18c4 <lock_acquire>

    if(!empty_q(&s->q)){
    1c18:	8b 45 08             	mov    0x8(%ebp),%eax
    1c1b:	83 c0 08             	add    $0x8,%eax
    1c1e:	89 04 24             	mov    %eax,(%esp)
    1c21:	e8 54 fe ff ff       	call   1a7a <empty_q>
    1c26:	85 c0                	test   %eax,%eax
    1c28:	75 18                	jne    1c42 <sem_signal+0x3e>
        twakeup(pop_q(&s->q));
    1c2a:	8b 45 08             	mov    0x8(%ebp),%eax
    1c2d:	83 c0 08             	add    $0x8,%eax
    1c30:	89 04 24             	mov    %eax,(%esp)
    1c33:	e8 5c fe ff ff       	call   1a94 <pop_q>
    1c38:	89 04 24             	mov    %eax,(%esp)
    1c3b:	e8 a4 f7 ff ff       	call   13e4 <twakeup>
    1c40:	eb 0d                	jmp    1c4f <sem_signal+0x4b>
    }
    else{
        s->val++;
    1c42:	8b 45 08             	mov    0x8(%ebp),%eax
    1c45:	8b 00                	mov    (%eax),%eax
    1c47:	8d 50 01             	lea    0x1(%eax),%edx
    1c4a:	8b 45 08             	mov    0x8(%ebp),%eax
    1c4d:	89 10                	mov    %edx,(%eax)
    }

    lock_release(&s->lock);
    1c4f:	8b 45 08             	mov    0x8(%ebp),%eax
    1c52:	83 c0 04             	add    $0x4,%eax
    1c55:	89 04 24             	mov    %eax,(%esp)
    1c58:	e8 87 fc ff ff       	call   18e4 <lock_release>
}
    1c5d:	c9                   	leave  
    1c5e:	c3                   	ret    

00001c5f <sem_dom_acquire>:

void sem_dom_acquire(struct Semaphore* s){
    1c5f:	55                   	push   %ebp
    1c60:	89 e5                	mov    %esp,%ebp
    1c62:	83 ec 18             	sub    $0x18,%esp
    lock_acquire(&s->lock);
    1c65:	8b 45 08             	mov    0x8(%ebp),%eax
    1c68:	83 c0 04             	add    $0x4,%eax
    1c6b:	89 04 24             	mov    %eax,(%esp)
    1c6e:	e8 51 fc ff ff       	call   18c4 <lock_acquire>

    if(s->val > 0){
    1c73:	8b 45 08             	mov    0x8(%ebp),%eax
    1c76:	8b 00                	mov    (%eax),%eax
    1c78:	85 c0                	test   %eax,%eax
    1c7a:	7e 1d                	jle    1c99 <sem_dom_acquire+0x3a>
        s->val--;
    1c7c:	8b 45 08             	mov    0x8(%ebp),%eax
    1c7f:	8b 00                	mov    (%eax),%eax
    1c81:	8d 50 ff             	lea    -0x1(%eax),%edx
    1c84:	8b 45 08             	mov    0x8(%ebp),%eax
    1c87:	89 10                	mov    %edx,(%eax)
        lock_release(&s->lock);
    1c89:	8b 45 08             	mov    0x8(%ebp),%eax
    1c8c:	83 c0 04             	add    $0x4,%eax
    1c8f:	89 04 24             	mov    %eax,(%esp)
    1c92:	e8 4d fc ff ff       	call   18e4 <lock_release>
        return;
    1c97:	eb 2a                	jmp    1cc3 <sem_dom_acquire+0x64>
    }

    dominant(&s->q,getpid());
    1c99:	e8 0e f7 ff ff       	call   13ac <getpid>
    1c9e:	8b 55 08             	mov    0x8(%ebp),%edx
    1ca1:	83 c2 08             	add    $0x8,%edx
    1ca4:	89 44 24 04          	mov    %eax,0x4(%esp)
    1ca8:	89 14 24             	mov    %edx,(%esp)
    1cab:	e8 5d fe ff ff       	call   1b0d <dominant>
    lock_release(&s->lock);
    1cb0:	8b 45 08             	mov    0x8(%ebp),%eax
    1cb3:	83 c0 04             	add    $0x4,%eax
    1cb6:	89 04 24             	mov    %eax,(%esp)
    1cb9:	e8 26 fc ff ff       	call   18e4 <lock_release>
    tsleep();
    1cbe:	e8 19 f7 ff ff       	call   13dc <tsleep>
}
    1cc3:	c9                   	leave  
    1cc4:	c3                   	ret    
