
_echo:     file format elf32-i386


Disassembly of section .text:

00001000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char *argv[])
{
    1000:	55                   	push   %ebp
    1001:	89 e5                	mov    %esp,%ebp
    1003:	83 e4 f0             	and    $0xfffffff0,%esp
    1006:	83 ec 20             	sub    $0x20,%esp
  int i;

  for(i = 1; i < argc; i++)
    1009:	c7 44 24 1c 01 00 00 	movl   $0x1,0x1c(%esp)
    1010:	00 
    1011:	eb 4b                	jmp    105e <main+0x5e>
    printf(1, "%s%s", argv[i], i+1 < argc ? " " : "\n");
    1013:	8b 44 24 1c          	mov    0x1c(%esp),%eax
    1017:	83 c0 01             	add    $0x1,%eax
    101a:	3b 45 08             	cmp    0x8(%ebp),%eax
    101d:	7d 07                	jge    1026 <main+0x26>
    101f:	b8 6d 1c 00 00       	mov    $0x1c6d,%eax
    1024:	eb 05                	jmp    102b <main+0x2b>
    1026:	b8 6f 1c 00 00       	mov    $0x1c6f,%eax
    102b:	8b 54 24 1c          	mov    0x1c(%esp),%edx
    102f:	8d 0c 95 00 00 00 00 	lea    0x0(,%edx,4),%ecx
    1036:	8b 55 0c             	mov    0xc(%ebp),%edx
    1039:	01 ca                	add    %ecx,%edx
    103b:	8b 12                	mov    (%edx),%edx
    103d:	89 44 24 0c          	mov    %eax,0xc(%esp)
    1041:	89 54 24 08          	mov    %edx,0x8(%esp)
    1045:	c7 44 24 04 71 1c 00 	movl   $0x1c71,0x4(%esp)
    104c:	00 
    104d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1054:	e8 1b 04 00 00       	call   1474 <printf>
int
main(int argc, char *argv[])
{
  int i;

  for(i = 1; i < argc; i++)
    1059:	83 44 24 1c 01       	addl   $0x1,0x1c(%esp)
    105e:	8b 44 24 1c          	mov    0x1c(%esp),%eax
    1062:	3b 45 08             	cmp    0x8(%ebp),%eax
    1065:	7c ac                	jl     1013 <main+0x13>
    printf(1, "%s%s", argv[i], i+1 < argc ? " " : "\n");
  exit();
    1067:	e8 68 02 00 00       	call   12d4 <exit>

0000106c <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
    106c:	55                   	push   %ebp
    106d:	89 e5                	mov    %esp,%ebp
    106f:	57                   	push   %edi
    1070:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
    1071:	8b 4d 08             	mov    0x8(%ebp),%ecx
    1074:	8b 55 10             	mov    0x10(%ebp),%edx
    1077:	8b 45 0c             	mov    0xc(%ebp),%eax
    107a:	89 cb                	mov    %ecx,%ebx
    107c:	89 df                	mov    %ebx,%edi
    107e:	89 d1                	mov    %edx,%ecx
    1080:	fc                   	cld    
    1081:	f3 aa                	rep stos %al,%es:(%edi)
    1083:	89 ca                	mov    %ecx,%edx
    1085:	89 fb                	mov    %edi,%ebx
    1087:	89 5d 08             	mov    %ebx,0x8(%ebp)
    108a:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
    108d:	5b                   	pop    %ebx
    108e:	5f                   	pop    %edi
    108f:	5d                   	pop    %ebp
    1090:	c3                   	ret    

00001091 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
    1091:	55                   	push   %ebp
    1092:	89 e5                	mov    %esp,%ebp
    1094:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
    1097:	8b 45 08             	mov    0x8(%ebp),%eax
    109a:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
    109d:	90                   	nop
    109e:	8b 45 08             	mov    0x8(%ebp),%eax
    10a1:	8d 50 01             	lea    0x1(%eax),%edx
    10a4:	89 55 08             	mov    %edx,0x8(%ebp)
    10a7:	8b 55 0c             	mov    0xc(%ebp),%edx
    10aa:	8d 4a 01             	lea    0x1(%edx),%ecx
    10ad:	89 4d 0c             	mov    %ecx,0xc(%ebp)
    10b0:	0f b6 12             	movzbl (%edx),%edx
    10b3:	88 10                	mov    %dl,(%eax)
    10b5:	0f b6 00             	movzbl (%eax),%eax
    10b8:	84 c0                	test   %al,%al
    10ba:	75 e2                	jne    109e <strcpy+0xd>
    ;
  return os;
    10bc:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    10bf:	c9                   	leave  
    10c0:	c3                   	ret    

000010c1 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    10c1:	55                   	push   %ebp
    10c2:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
    10c4:	eb 08                	jmp    10ce <strcmp+0xd>
    p++, q++;
    10c6:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    10ca:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    10ce:	8b 45 08             	mov    0x8(%ebp),%eax
    10d1:	0f b6 00             	movzbl (%eax),%eax
    10d4:	84 c0                	test   %al,%al
    10d6:	74 10                	je     10e8 <strcmp+0x27>
    10d8:	8b 45 08             	mov    0x8(%ebp),%eax
    10db:	0f b6 10             	movzbl (%eax),%edx
    10de:	8b 45 0c             	mov    0xc(%ebp),%eax
    10e1:	0f b6 00             	movzbl (%eax),%eax
    10e4:	38 c2                	cmp    %al,%dl
    10e6:	74 de                	je     10c6 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
    10e8:	8b 45 08             	mov    0x8(%ebp),%eax
    10eb:	0f b6 00             	movzbl (%eax),%eax
    10ee:	0f b6 d0             	movzbl %al,%edx
    10f1:	8b 45 0c             	mov    0xc(%ebp),%eax
    10f4:	0f b6 00             	movzbl (%eax),%eax
    10f7:	0f b6 c0             	movzbl %al,%eax
    10fa:	29 c2                	sub    %eax,%edx
    10fc:	89 d0                	mov    %edx,%eax
}
    10fe:	5d                   	pop    %ebp
    10ff:	c3                   	ret    

00001100 <strlen>:

uint
strlen(char *s)
{
    1100:	55                   	push   %ebp
    1101:	89 e5                	mov    %esp,%ebp
    1103:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
    1106:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    110d:	eb 04                	jmp    1113 <strlen+0x13>
    110f:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    1113:	8b 55 fc             	mov    -0x4(%ebp),%edx
    1116:	8b 45 08             	mov    0x8(%ebp),%eax
    1119:	01 d0                	add    %edx,%eax
    111b:	0f b6 00             	movzbl (%eax),%eax
    111e:	84 c0                	test   %al,%al
    1120:	75 ed                	jne    110f <strlen+0xf>
    ;
  return n;
    1122:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    1125:	c9                   	leave  
    1126:	c3                   	ret    

00001127 <memset>:

void*
memset(void *dst, int c, uint n)
{
    1127:	55                   	push   %ebp
    1128:	89 e5                	mov    %esp,%ebp
    112a:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
    112d:	8b 45 10             	mov    0x10(%ebp),%eax
    1130:	89 44 24 08          	mov    %eax,0x8(%esp)
    1134:	8b 45 0c             	mov    0xc(%ebp),%eax
    1137:	89 44 24 04          	mov    %eax,0x4(%esp)
    113b:	8b 45 08             	mov    0x8(%ebp),%eax
    113e:	89 04 24             	mov    %eax,(%esp)
    1141:	e8 26 ff ff ff       	call   106c <stosb>
  return dst;
    1146:	8b 45 08             	mov    0x8(%ebp),%eax
}
    1149:	c9                   	leave  
    114a:	c3                   	ret    

0000114b <strchr>:

char*
strchr(const char *s, char c)
{
    114b:	55                   	push   %ebp
    114c:	89 e5                	mov    %esp,%ebp
    114e:	83 ec 04             	sub    $0x4,%esp
    1151:	8b 45 0c             	mov    0xc(%ebp),%eax
    1154:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
    1157:	eb 14                	jmp    116d <strchr+0x22>
    if(*s == c)
    1159:	8b 45 08             	mov    0x8(%ebp),%eax
    115c:	0f b6 00             	movzbl (%eax),%eax
    115f:	3a 45 fc             	cmp    -0x4(%ebp),%al
    1162:	75 05                	jne    1169 <strchr+0x1e>
      return (char*)s;
    1164:	8b 45 08             	mov    0x8(%ebp),%eax
    1167:	eb 13                	jmp    117c <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
    1169:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    116d:	8b 45 08             	mov    0x8(%ebp),%eax
    1170:	0f b6 00             	movzbl (%eax),%eax
    1173:	84 c0                	test   %al,%al
    1175:	75 e2                	jne    1159 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
    1177:	b8 00 00 00 00       	mov    $0x0,%eax
}
    117c:	c9                   	leave  
    117d:	c3                   	ret    

0000117e <gets>:

char*
gets(char *buf, int max)
{
    117e:	55                   	push   %ebp
    117f:	89 e5                	mov    %esp,%ebp
    1181:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1184:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    118b:	eb 4c                	jmp    11d9 <gets+0x5b>
    cc = read(0, &c, 1);
    118d:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    1194:	00 
    1195:	8d 45 ef             	lea    -0x11(%ebp),%eax
    1198:	89 44 24 04          	mov    %eax,0x4(%esp)
    119c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    11a3:	e8 44 01 00 00       	call   12ec <read>
    11a8:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
    11ab:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    11af:	7f 02                	jg     11b3 <gets+0x35>
      break;
    11b1:	eb 31                	jmp    11e4 <gets+0x66>
    buf[i++] = c;
    11b3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    11b6:	8d 50 01             	lea    0x1(%eax),%edx
    11b9:	89 55 f4             	mov    %edx,-0xc(%ebp)
    11bc:	89 c2                	mov    %eax,%edx
    11be:	8b 45 08             	mov    0x8(%ebp),%eax
    11c1:	01 c2                	add    %eax,%edx
    11c3:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    11c7:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
    11c9:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    11cd:	3c 0a                	cmp    $0xa,%al
    11cf:	74 13                	je     11e4 <gets+0x66>
    11d1:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    11d5:	3c 0d                	cmp    $0xd,%al
    11d7:	74 0b                	je     11e4 <gets+0x66>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    11d9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    11dc:	83 c0 01             	add    $0x1,%eax
    11df:	3b 45 0c             	cmp    0xc(%ebp),%eax
    11e2:	7c a9                	jl     118d <gets+0xf>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    11e4:	8b 55 f4             	mov    -0xc(%ebp),%edx
    11e7:	8b 45 08             	mov    0x8(%ebp),%eax
    11ea:	01 d0                	add    %edx,%eax
    11ec:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
    11ef:	8b 45 08             	mov    0x8(%ebp),%eax
}
    11f2:	c9                   	leave  
    11f3:	c3                   	ret    

000011f4 <stat>:

int
stat(char *n, struct stat *st)
{
    11f4:	55                   	push   %ebp
    11f5:	89 e5                	mov    %esp,%ebp
    11f7:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    11fa:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1201:	00 
    1202:	8b 45 08             	mov    0x8(%ebp),%eax
    1205:	89 04 24             	mov    %eax,(%esp)
    1208:	e8 07 01 00 00       	call   1314 <open>
    120d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
    1210:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1214:	79 07                	jns    121d <stat+0x29>
    return -1;
    1216:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    121b:	eb 23                	jmp    1240 <stat+0x4c>
  r = fstat(fd, st);
    121d:	8b 45 0c             	mov    0xc(%ebp),%eax
    1220:	89 44 24 04          	mov    %eax,0x4(%esp)
    1224:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1227:	89 04 24             	mov    %eax,(%esp)
    122a:	e8 fd 00 00 00       	call   132c <fstat>
    122f:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
    1232:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1235:	89 04 24             	mov    %eax,(%esp)
    1238:	e8 bf 00 00 00       	call   12fc <close>
  return r;
    123d:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
    1240:	c9                   	leave  
    1241:	c3                   	ret    

00001242 <atoi>:

int
atoi(const char *s)
{
    1242:	55                   	push   %ebp
    1243:	89 e5                	mov    %esp,%ebp
    1245:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
    1248:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
    124f:	eb 25                	jmp    1276 <atoi+0x34>
    n = n*10 + *s++ - '0';
    1251:	8b 55 fc             	mov    -0x4(%ebp),%edx
    1254:	89 d0                	mov    %edx,%eax
    1256:	c1 e0 02             	shl    $0x2,%eax
    1259:	01 d0                	add    %edx,%eax
    125b:	01 c0                	add    %eax,%eax
    125d:	89 c1                	mov    %eax,%ecx
    125f:	8b 45 08             	mov    0x8(%ebp),%eax
    1262:	8d 50 01             	lea    0x1(%eax),%edx
    1265:	89 55 08             	mov    %edx,0x8(%ebp)
    1268:	0f b6 00             	movzbl (%eax),%eax
    126b:	0f be c0             	movsbl %al,%eax
    126e:	01 c8                	add    %ecx,%eax
    1270:	83 e8 30             	sub    $0x30,%eax
    1273:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    1276:	8b 45 08             	mov    0x8(%ebp),%eax
    1279:	0f b6 00             	movzbl (%eax),%eax
    127c:	3c 2f                	cmp    $0x2f,%al
    127e:	7e 0a                	jle    128a <atoi+0x48>
    1280:	8b 45 08             	mov    0x8(%ebp),%eax
    1283:	0f b6 00             	movzbl (%eax),%eax
    1286:	3c 39                	cmp    $0x39,%al
    1288:	7e c7                	jle    1251 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
    128a:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    128d:	c9                   	leave  
    128e:	c3                   	ret    

0000128f <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    128f:	55                   	push   %ebp
    1290:	89 e5                	mov    %esp,%ebp
    1292:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
    1295:	8b 45 08             	mov    0x8(%ebp),%eax
    1298:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
    129b:	8b 45 0c             	mov    0xc(%ebp),%eax
    129e:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
    12a1:	eb 17                	jmp    12ba <memmove+0x2b>
    *dst++ = *src++;
    12a3:	8b 45 fc             	mov    -0x4(%ebp),%eax
    12a6:	8d 50 01             	lea    0x1(%eax),%edx
    12a9:	89 55 fc             	mov    %edx,-0x4(%ebp)
    12ac:	8b 55 f8             	mov    -0x8(%ebp),%edx
    12af:	8d 4a 01             	lea    0x1(%edx),%ecx
    12b2:	89 4d f8             	mov    %ecx,-0x8(%ebp)
    12b5:	0f b6 12             	movzbl (%edx),%edx
    12b8:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    12ba:	8b 45 10             	mov    0x10(%ebp),%eax
    12bd:	8d 50 ff             	lea    -0x1(%eax),%edx
    12c0:	89 55 10             	mov    %edx,0x10(%ebp)
    12c3:	85 c0                	test   %eax,%eax
    12c5:	7f dc                	jg     12a3 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
    12c7:	8b 45 08             	mov    0x8(%ebp),%eax
}
    12ca:	c9                   	leave  
    12cb:	c3                   	ret    

000012cc <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    12cc:	b8 01 00 00 00       	mov    $0x1,%eax
    12d1:	cd 40                	int    $0x40
    12d3:	c3                   	ret    

000012d4 <exit>:
SYSCALL(exit)
    12d4:	b8 02 00 00 00       	mov    $0x2,%eax
    12d9:	cd 40                	int    $0x40
    12db:	c3                   	ret    

000012dc <wait>:
SYSCALL(wait)
    12dc:	b8 03 00 00 00       	mov    $0x3,%eax
    12e1:	cd 40                	int    $0x40
    12e3:	c3                   	ret    

000012e4 <pipe>:
SYSCALL(pipe)
    12e4:	b8 04 00 00 00       	mov    $0x4,%eax
    12e9:	cd 40                	int    $0x40
    12eb:	c3                   	ret    

000012ec <read>:
SYSCALL(read)
    12ec:	b8 05 00 00 00       	mov    $0x5,%eax
    12f1:	cd 40                	int    $0x40
    12f3:	c3                   	ret    

000012f4 <write>:
SYSCALL(write)
    12f4:	b8 10 00 00 00       	mov    $0x10,%eax
    12f9:	cd 40                	int    $0x40
    12fb:	c3                   	ret    

000012fc <close>:
SYSCALL(close)
    12fc:	b8 15 00 00 00       	mov    $0x15,%eax
    1301:	cd 40                	int    $0x40
    1303:	c3                   	ret    

00001304 <kill>:
SYSCALL(kill)
    1304:	b8 06 00 00 00       	mov    $0x6,%eax
    1309:	cd 40                	int    $0x40
    130b:	c3                   	ret    

0000130c <exec>:
SYSCALL(exec)
    130c:	b8 07 00 00 00       	mov    $0x7,%eax
    1311:	cd 40                	int    $0x40
    1313:	c3                   	ret    

00001314 <open>:
SYSCALL(open)
    1314:	b8 0f 00 00 00       	mov    $0xf,%eax
    1319:	cd 40                	int    $0x40
    131b:	c3                   	ret    

0000131c <mknod>:
SYSCALL(mknod)
    131c:	b8 11 00 00 00       	mov    $0x11,%eax
    1321:	cd 40                	int    $0x40
    1323:	c3                   	ret    

00001324 <unlink>:
SYSCALL(unlink)
    1324:	b8 12 00 00 00       	mov    $0x12,%eax
    1329:	cd 40                	int    $0x40
    132b:	c3                   	ret    

0000132c <fstat>:
SYSCALL(fstat)
    132c:	b8 08 00 00 00       	mov    $0x8,%eax
    1331:	cd 40                	int    $0x40
    1333:	c3                   	ret    

00001334 <link>:
SYSCALL(link)
    1334:	b8 13 00 00 00       	mov    $0x13,%eax
    1339:	cd 40                	int    $0x40
    133b:	c3                   	ret    

0000133c <mkdir>:
SYSCALL(mkdir)
    133c:	b8 14 00 00 00       	mov    $0x14,%eax
    1341:	cd 40                	int    $0x40
    1343:	c3                   	ret    

00001344 <chdir>:
SYSCALL(chdir)
    1344:	b8 09 00 00 00       	mov    $0x9,%eax
    1349:	cd 40                	int    $0x40
    134b:	c3                   	ret    

0000134c <dup>:
SYSCALL(dup)
    134c:	b8 0a 00 00 00       	mov    $0xa,%eax
    1351:	cd 40                	int    $0x40
    1353:	c3                   	ret    

00001354 <getpid>:
SYSCALL(getpid)
    1354:	b8 0b 00 00 00       	mov    $0xb,%eax
    1359:	cd 40                	int    $0x40
    135b:	c3                   	ret    

0000135c <sbrk>:
SYSCALL(sbrk)
    135c:	b8 0c 00 00 00       	mov    $0xc,%eax
    1361:	cd 40                	int    $0x40
    1363:	c3                   	ret    

00001364 <sleep>:
SYSCALL(sleep)
    1364:	b8 0d 00 00 00       	mov    $0xd,%eax
    1369:	cd 40                	int    $0x40
    136b:	c3                   	ret    

0000136c <uptime>:
SYSCALL(uptime)
    136c:	b8 0e 00 00 00       	mov    $0xe,%eax
    1371:	cd 40                	int    $0x40
    1373:	c3                   	ret    

00001374 <clone>:
SYSCALL(clone)
    1374:	b8 16 00 00 00       	mov    $0x16,%eax
    1379:	cd 40                	int    $0x40
    137b:	c3                   	ret    

0000137c <texit>:
SYSCALL(texit)
    137c:	b8 17 00 00 00       	mov    $0x17,%eax
    1381:	cd 40                	int    $0x40
    1383:	c3                   	ret    

00001384 <tsleep>:
SYSCALL(tsleep)
    1384:	b8 18 00 00 00       	mov    $0x18,%eax
    1389:	cd 40                	int    $0x40
    138b:	c3                   	ret    

0000138c <twakeup>:
SYSCALL(twakeup)
    138c:	b8 19 00 00 00       	mov    $0x19,%eax
    1391:	cd 40                	int    $0x40
    1393:	c3                   	ret    

00001394 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
    1394:	55                   	push   %ebp
    1395:	89 e5                	mov    %esp,%ebp
    1397:	83 ec 18             	sub    $0x18,%esp
    139a:	8b 45 0c             	mov    0xc(%ebp),%eax
    139d:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
    13a0:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    13a7:	00 
    13a8:	8d 45 f4             	lea    -0xc(%ebp),%eax
    13ab:	89 44 24 04          	mov    %eax,0x4(%esp)
    13af:	8b 45 08             	mov    0x8(%ebp),%eax
    13b2:	89 04 24             	mov    %eax,(%esp)
    13b5:	e8 3a ff ff ff       	call   12f4 <write>
}
    13ba:	c9                   	leave  
    13bb:	c3                   	ret    

000013bc <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
    13bc:	55                   	push   %ebp
    13bd:	89 e5                	mov    %esp,%ebp
    13bf:	56                   	push   %esi
    13c0:	53                   	push   %ebx
    13c1:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    13c4:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
    13cb:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
    13cf:	74 17                	je     13e8 <printint+0x2c>
    13d1:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    13d5:	79 11                	jns    13e8 <printint+0x2c>
    neg = 1;
    13d7:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
    13de:	8b 45 0c             	mov    0xc(%ebp),%eax
    13e1:	f7 d8                	neg    %eax
    13e3:	89 45 ec             	mov    %eax,-0x14(%ebp)
    13e6:	eb 06                	jmp    13ee <printint+0x32>
  } else {
    x = xx;
    13e8:	8b 45 0c             	mov    0xc(%ebp),%eax
    13eb:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
    13ee:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
    13f5:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    13f8:	8d 41 01             	lea    0x1(%ecx),%eax
    13fb:	89 45 f4             	mov    %eax,-0xc(%ebp)
    13fe:	8b 5d 10             	mov    0x10(%ebp),%ebx
    1401:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1404:	ba 00 00 00 00       	mov    $0x0,%edx
    1409:	f7 f3                	div    %ebx
    140b:	89 d0                	mov    %edx,%eax
    140d:	0f b6 80 d0 20 00 00 	movzbl 0x20d0(%eax),%eax
    1414:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
    1418:	8b 75 10             	mov    0x10(%ebp),%esi
    141b:	8b 45 ec             	mov    -0x14(%ebp),%eax
    141e:	ba 00 00 00 00       	mov    $0x0,%edx
    1423:	f7 f6                	div    %esi
    1425:	89 45 ec             	mov    %eax,-0x14(%ebp)
    1428:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    142c:	75 c7                	jne    13f5 <printint+0x39>
  if(neg)
    142e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1432:	74 10                	je     1444 <printint+0x88>
    buf[i++] = '-';
    1434:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1437:	8d 50 01             	lea    0x1(%eax),%edx
    143a:	89 55 f4             	mov    %edx,-0xc(%ebp)
    143d:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
    1442:	eb 1f                	jmp    1463 <printint+0xa7>
    1444:	eb 1d                	jmp    1463 <printint+0xa7>
    putc(fd, buf[i]);
    1446:	8d 55 dc             	lea    -0x24(%ebp),%edx
    1449:	8b 45 f4             	mov    -0xc(%ebp),%eax
    144c:	01 d0                	add    %edx,%eax
    144e:	0f b6 00             	movzbl (%eax),%eax
    1451:	0f be c0             	movsbl %al,%eax
    1454:	89 44 24 04          	mov    %eax,0x4(%esp)
    1458:	8b 45 08             	mov    0x8(%ebp),%eax
    145b:	89 04 24             	mov    %eax,(%esp)
    145e:	e8 31 ff ff ff       	call   1394 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    1463:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    1467:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    146b:	79 d9                	jns    1446 <printint+0x8a>
    putc(fd, buf[i]);
}
    146d:	83 c4 30             	add    $0x30,%esp
    1470:	5b                   	pop    %ebx
    1471:	5e                   	pop    %esi
    1472:	5d                   	pop    %ebp
    1473:	c3                   	ret    

00001474 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    1474:	55                   	push   %ebp
    1475:	89 e5                	mov    %esp,%ebp
    1477:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
    147a:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
    1481:	8d 45 0c             	lea    0xc(%ebp),%eax
    1484:	83 c0 04             	add    $0x4,%eax
    1487:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
    148a:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    1491:	e9 7c 01 00 00       	jmp    1612 <printf+0x19e>
    c = fmt[i] & 0xff;
    1496:	8b 55 0c             	mov    0xc(%ebp),%edx
    1499:	8b 45 f0             	mov    -0x10(%ebp),%eax
    149c:	01 d0                	add    %edx,%eax
    149e:	0f b6 00             	movzbl (%eax),%eax
    14a1:	0f be c0             	movsbl %al,%eax
    14a4:	25 ff 00 00 00       	and    $0xff,%eax
    14a9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
    14ac:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    14b0:	75 2c                	jne    14de <printf+0x6a>
      if(c == '%'){
    14b2:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    14b6:	75 0c                	jne    14c4 <printf+0x50>
        state = '%';
    14b8:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
    14bf:	e9 4a 01 00 00       	jmp    160e <printf+0x19a>
      } else {
        putc(fd, c);
    14c4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    14c7:	0f be c0             	movsbl %al,%eax
    14ca:	89 44 24 04          	mov    %eax,0x4(%esp)
    14ce:	8b 45 08             	mov    0x8(%ebp),%eax
    14d1:	89 04 24             	mov    %eax,(%esp)
    14d4:	e8 bb fe ff ff       	call   1394 <putc>
    14d9:	e9 30 01 00 00       	jmp    160e <printf+0x19a>
      }
    } else if(state == '%'){
    14de:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
    14e2:	0f 85 26 01 00 00    	jne    160e <printf+0x19a>
      if(c == 'd'){
    14e8:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
    14ec:	75 2d                	jne    151b <printf+0xa7>
        printint(fd, *ap, 10, 1);
    14ee:	8b 45 e8             	mov    -0x18(%ebp),%eax
    14f1:	8b 00                	mov    (%eax),%eax
    14f3:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    14fa:	00 
    14fb:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
    1502:	00 
    1503:	89 44 24 04          	mov    %eax,0x4(%esp)
    1507:	8b 45 08             	mov    0x8(%ebp),%eax
    150a:	89 04 24             	mov    %eax,(%esp)
    150d:	e8 aa fe ff ff       	call   13bc <printint>
        ap++;
    1512:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    1516:	e9 ec 00 00 00       	jmp    1607 <printf+0x193>
      } else if(c == 'x' || c == 'p'){
    151b:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
    151f:	74 06                	je     1527 <printf+0xb3>
    1521:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
    1525:	75 2d                	jne    1554 <printf+0xe0>
        printint(fd, *ap, 16, 0);
    1527:	8b 45 e8             	mov    -0x18(%ebp),%eax
    152a:	8b 00                	mov    (%eax),%eax
    152c:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    1533:	00 
    1534:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
    153b:	00 
    153c:	89 44 24 04          	mov    %eax,0x4(%esp)
    1540:	8b 45 08             	mov    0x8(%ebp),%eax
    1543:	89 04 24             	mov    %eax,(%esp)
    1546:	e8 71 fe ff ff       	call   13bc <printint>
        ap++;
    154b:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    154f:	e9 b3 00 00 00       	jmp    1607 <printf+0x193>
      } else if(c == 's'){
    1554:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
    1558:	75 45                	jne    159f <printf+0x12b>
        s = (char*)*ap;
    155a:	8b 45 e8             	mov    -0x18(%ebp),%eax
    155d:	8b 00                	mov    (%eax),%eax
    155f:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
    1562:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
    1566:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    156a:	75 09                	jne    1575 <printf+0x101>
          s = "(null)";
    156c:	c7 45 f4 76 1c 00 00 	movl   $0x1c76,-0xc(%ebp)
        while(*s != 0){
    1573:	eb 1e                	jmp    1593 <printf+0x11f>
    1575:	eb 1c                	jmp    1593 <printf+0x11f>
          putc(fd, *s);
    1577:	8b 45 f4             	mov    -0xc(%ebp),%eax
    157a:	0f b6 00             	movzbl (%eax),%eax
    157d:	0f be c0             	movsbl %al,%eax
    1580:	89 44 24 04          	mov    %eax,0x4(%esp)
    1584:	8b 45 08             	mov    0x8(%ebp),%eax
    1587:	89 04 24             	mov    %eax,(%esp)
    158a:	e8 05 fe ff ff       	call   1394 <putc>
          s++;
    158f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    1593:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1596:	0f b6 00             	movzbl (%eax),%eax
    1599:	84 c0                	test   %al,%al
    159b:	75 da                	jne    1577 <printf+0x103>
    159d:	eb 68                	jmp    1607 <printf+0x193>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    159f:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
    15a3:	75 1d                	jne    15c2 <printf+0x14e>
        putc(fd, *ap);
    15a5:	8b 45 e8             	mov    -0x18(%ebp),%eax
    15a8:	8b 00                	mov    (%eax),%eax
    15aa:	0f be c0             	movsbl %al,%eax
    15ad:	89 44 24 04          	mov    %eax,0x4(%esp)
    15b1:	8b 45 08             	mov    0x8(%ebp),%eax
    15b4:	89 04 24             	mov    %eax,(%esp)
    15b7:	e8 d8 fd ff ff       	call   1394 <putc>
        ap++;
    15bc:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    15c0:	eb 45                	jmp    1607 <printf+0x193>
      } else if(c == '%'){
    15c2:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    15c6:	75 17                	jne    15df <printf+0x16b>
        putc(fd, c);
    15c8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    15cb:	0f be c0             	movsbl %al,%eax
    15ce:	89 44 24 04          	mov    %eax,0x4(%esp)
    15d2:	8b 45 08             	mov    0x8(%ebp),%eax
    15d5:	89 04 24             	mov    %eax,(%esp)
    15d8:	e8 b7 fd ff ff       	call   1394 <putc>
    15dd:	eb 28                	jmp    1607 <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
    15df:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
    15e6:	00 
    15e7:	8b 45 08             	mov    0x8(%ebp),%eax
    15ea:	89 04 24             	mov    %eax,(%esp)
    15ed:	e8 a2 fd ff ff       	call   1394 <putc>
        putc(fd, c);
    15f2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    15f5:	0f be c0             	movsbl %al,%eax
    15f8:	89 44 24 04          	mov    %eax,0x4(%esp)
    15fc:	8b 45 08             	mov    0x8(%ebp),%eax
    15ff:	89 04 24             	mov    %eax,(%esp)
    1602:	e8 8d fd ff ff       	call   1394 <putc>
      }
      state = 0;
    1607:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    160e:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    1612:	8b 55 0c             	mov    0xc(%ebp),%edx
    1615:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1618:	01 d0                	add    %edx,%eax
    161a:	0f b6 00             	movzbl (%eax),%eax
    161d:	84 c0                	test   %al,%al
    161f:	0f 85 71 fe ff ff    	jne    1496 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    1625:	c9                   	leave  
    1626:	c3                   	ret    
    1627:	90                   	nop

00001628 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    1628:	55                   	push   %ebp
    1629:	89 e5                	mov    %esp,%ebp
    162b:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
    162e:	8b 45 08             	mov    0x8(%ebp),%eax
    1631:	83 e8 08             	sub    $0x8,%eax
    1634:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1637:	a1 f0 20 00 00       	mov    0x20f0,%eax
    163c:	89 45 fc             	mov    %eax,-0x4(%ebp)
    163f:	eb 24                	jmp    1665 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1641:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1644:	8b 00                	mov    (%eax),%eax
    1646:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    1649:	77 12                	ja     165d <free+0x35>
    164b:	8b 45 f8             	mov    -0x8(%ebp),%eax
    164e:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    1651:	77 24                	ja     1677 <free+0x4f>
    1653:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1656:	8b 00                	mov    (%eax),%eax
    1658:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    165b:	77 1a                	ja     1677 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    165d:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1660:	8b 00                	mov    (%eax),%eax
    1662:	89 45 fc             	mov    %eax,-0x4(%ebp)
    1665:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1668:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    166b:	76 d4                	jbe    1641 <free+0x19>
    166d:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1670:	8b 00                	mov    (%eax),%eax
    1672:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    1675:	76 ca                	jbe    1641 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    1677:	8b 45 f8             	mov    -0x8(%ebp),%eax
    167a:	8b 40 04             	mov    0x4(%eax),%eax
    167d:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    1684:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1687:	01 c2                	add    %eax,%edx
    1689:	8b 45 fc             	mov    -0x4(%ebp),%eax
    168c:	8b 00                	mov    (%eax),%eax
    168e:	39 c2                	cmp    %eax,%edx
    1690:	75 24                	jne    16b6 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
    1692:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1695:	8b 50 04             	mov    0x4(%eax),%edx
    1698:	8b 45 fc             	mov    -0x4(%ebp),%eax
    169b:	8b 00                	mov    (%eax),%eax
    169d:	8b 40 04             	mov    0x4(%eax),%eax
    16a0:	01 c2                	add    %eax,%edx
    16a2:	8b 45 f8             	mov    -0x8(%ebp),%eax
    16a5:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
    16a8:	8b 45 fc             	mov    -0x4(%ebp),%eax
    16ab:	8b 00                	mov    (%eax),%eax
    16ad:	8b 10                	mov    (%eax),%edx
    16af:	8b 45 f8             	mov    -0x8(%ebp),%eax
    16b2:	89 10                	mov    %edx,(%eax)
    16b4:	eb 0a                	jmp    16c0 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
    16b6:	8b 45 fc             	mov    -0x4(%ebp),%eax
    16b9:	8b 10                	mov    (%eax),%edx
    16bb:	8b 45 f8             	mov    -0x8(%ebp),%eax
    16be:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
    16c0:	8b 45 fc             	mov    -0x4(%ebp),%eax
    16c3:	8b 40 04             	mov    0x4(%eax),%eax
    16c6:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    16cd:	8b 45 fc             	mov    -0x4(%ebp),%eax
    16d0:	01 d0                	add    %edx,%eax
    16d2:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    16d5:	75 20                	jne    16f7 <free+0xcf>
    p->s.size += bp->s.size;
    16d7:	8b 45 fc             	mov    -0x4(%ebp),%eax
    16da:	8b 50 04             	mov    0x4(%eax),%edx
    16dd:	8b 45 f8             	mov    -0x8(%ebp),%eax
    16e0:	8b 40 04             	mov    0x4(%eax),%eax
    16e3:	01 c2                	add    %eax,%edx
    16e5:	8b 45 fc             	mov    -0x4(%ebp),%eax
    16e8:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    16eb:	8b 45 f8             	mov    -0x8(%ebp),%eax
    16ee:	8b 10                	mov    (%eax),%edx
    16f0:	8b 45 fc             	mov    -0x4(%ebp),%eax
    16f3:	89 10                	mov    %edx,(%eax)
    16f5:	eb 08                	jmp    16ff <free+0xd7>
  } else
    p->s.ptr = bp;
    16f7:	8b 45 fc             	mov    -0x4(%ebp),%eax
    16fa:	8b 55 f8             	mov    -0x8(%ebp),%edx
    16fd:	89 10                	mov    %edx,(%eax)
  freep = p;
    16ff:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1702:	a3 f0 20 00 00       	mov    %eax,0x20f0
}
    1707:	c9                   	leave  
    1708:	c3                   	ret    

00001709 <morecore>:

static Header*
morecore(uint nu)
{
    1709:	55                   	push   %ebp
    170a:	89 e5                	mov    %esp,%ebp
    170c:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
    170f:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
    1716:	77 07                	ja     171f <morecore+0x16>
    nu = 4096;
    1718:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
    171f:	8b 45 08             	mov    0x8(%ebp),%eax
    1722:	c1 e0 03             	shl    $0x3,%eax
    1725:	89 04 24             	mov    %eax,(%esp)
    1728:	e8 2f fc ff ff       	call   135c <sbrk>
    172d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
    1730:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
    1734:	75 07                	jne    173d <morecore+0x34>
    return 0;
    1736:	b8 00 00 00 00       	mov    $0x0,%eax
    173b:	eb 22                	jmp    175f <morecore+0x56>
  hp = (Header*)p;
    173d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1740:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
    1743:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1746:	8b 55 08             	mov    0x8(%ebp),%edx
    1749:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
    174c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    174f:	83 c0 08             	add    $0x8,%eax
    1752:	89 04 24             	mov    %eax,(%esp)
    1755:	e8 ce fe ff ff       	call   1628 <free>
  return freep;
    175a:	a1 f0 20 00 00       	mov    0x20f0,%eax
}
    175f:	c9                   	leave  
    1760:	c3                   	ret    

00001761 <malloc>:

void*
malloc(uint nbytes)
{
    1761:	55                   	push   %ebp
    1762:	89 e5                	mov    %esp,%ebp
    1764:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1767:	8b 45 08             	mov    0x8(%ebp),%eax
    176a:	83 c0 07             	add    $0x7,%eax
    176d:	c1 e8 03             	shr    $0x3,%eax
    1770:	83 c0 01             	add    $0x1,%eax
    1773:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
    1776:	a1 f0 20 00 00       	mov    0x20f0,%eax
    177b:	89 45 f0             	mov    %eax,-0x10(%ebp)
    177e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1782:	75 23                	jne    17a7 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
    1784:	c7 45 f0 e8 20 00 00 	movl   $0x20e8,-0x10(%ebp)
    178b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    178e:	a3 f0 20 00 00       	mov    %eax,0x20f0
    1793:	a1 f0 20 00 00       	mov    0x20f0,%eax
    1798:	a3 e8 20 00 00       	mov    %eax,0x20e8
    base.s.size = 0;
    179d:	c7 05 ec 20 00 00 00 	movl   $0x0,0x20ec
    17a4:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    17a7:	8b 45 f0             	mov    -0x10(%ebp),%eax
    17aa:	8b 00                	mov    (%eax),%eax
    17ac:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
    17af:	8b 45 f4             	mov    -0xc(%ebp),%eax
    17b2:	8b 40 04             	mov    0x4(%eax),%eax
    17b5:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    17b8:	72 4d                	jb     1807 <malloc+0xa6>
      if(p->s.size == nunits)
    17ba:	8b 45 f4             	mov    -0xc(%ebp),%eax
    17bd:	8b 40 04             	mov    0x4(%eax),%eax
    17c0:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    17c3:	75 0c                	jne    17d1 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
    17c5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    17c8:	8b 10                	mov    (%eax),%edx
    17ca:	8b 45 f0             	mov    -0x10(%ebp),%eax
    17cd:	89 10                	mov    %edx,(%eax)
    17cf:	eb 26                	jmp    17f7 <malloc+0x96>
      else {
        p->s.size -= nunits;
    17d1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    17d4:	8b 40 04             	mov    0x4(%eax),%eax
    17d7:	2b 45 ec             	sub    -0x14(%ebp),%eax
    17da:	89 c2                	mov    %eax,%edx
    17dc:	8b 45 f4             	mov    -0xc(%ebp),%eax
    17df:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
    17e2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    17e5:	8b 40 04             	mov    0x4(%eax),%eax
    17e8:	c1 e0 03             	shl    $0x3,%eax
    17eb:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
    17ee:	8b 45 f4             	mov    -0xc(%ebp),%eax
    17f1:	8b 55 ec             	mov    -0x14(%ebp),%edx
    17f4:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
    17f7:	8b 45 f0             	mov    -0x10(%ebp),%eax
    17fa:	a3 f0 20 00 00       	mov    %eax,0x20f0
      return (void*)(p + 1);
    17ff:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1802:	83 c0 08             	add    $0x8,%eax
    1805:	eb 38                	jmp    183f <malloc+0xde>
    }
    if(p == freep)
    1807:	a1 f0 20 00 00       	mov    0x20f0,%eax
    180c:	39 45 f4             	cmp    %eax,-0xc(%ebp)
    180f:	75 1b                	jne    182c <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
    1811:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1814:	89 04 24             	mov    %eax,(%esp)
    1817:	e8 ed fe ff ff       	call   1709 <morecore>
    181c:	89 45 f4             	mov    %eax,-0xc(%ebp)
    181f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1823:	75 07                	jne    182c <malloc+0xcb>
        return 0;
    1825:	b8 00 00 00 00       	mov    $0x0,%eax
    182a:	eb 13                	jmp    183f <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    182c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    182f:	89 45 f0             	mov    %eax,-0x10(%ebp)
    1832:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1835:	8b 00                	mov    (%eax),%eax
    1837:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
    183a:	e9 70 ff ff ff       	jmp    17af <malloc+0x4e>
}
    183f:	c9                   	leave  
    1840:	c3                   	ret    
    1841:	66 90                	xchg   %ax,%ax
    1843:	90                   	nop

00001844 <xchg>:
  asm volatile("sti");
}

static inline uint
xchg(volatile uint *addr, uint newval)
{
    1844:	55                   	push   %ebp
    1845:	89 e5                	mov    %esp,%ebp
    1847:	83 ec 10             	sub    $0x10,%esp
  uint result;
  
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
    184a:	8b 55 08             	mov    0x8(%ebp),%edx
    184d:	8b 45 0c             	mov    0xc(%ebp),%eax
    1850:	8b 4d 08             	mov    0x8(%ebp),%ecx
    1853:	f0 87 02             	lock xchg %eax,(%edx)
    1856:	89 45 fc             	mov    %eax,-0x4(%ebp)
               "+m" (*addr), "=a" (result) :
               "1" (newval) :
               "cc");
  return result;
    1859:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    185c:	c9                   	leave  
    185d:	c3                   	ret    

0000185e <lock_init>:
#include "x86.h"
#include "proc.h"

unsigned long rands = 1;

void lock_init(lock_t *lock){
    185e:	55                   	push   %ebp
    185f:	89 e5                	mov    %esp,%ebp
    lock->locked = 0;
    1861:	8b 45 08             	mov    0x8(%ebp),%eax
    1864:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
    186a:	5d                   	pop    %ebp
    186b:	c3                   	ret    

0000186c <lock_acquire>:
void lock_acquire(lock_t *lock){
    186c:	55                   	push   %ebp
    186d:	89 e5                	mov    %esp,%ebp
    186f:	83 ec 08             	sub    $0x8,%esp
    while(xchg(&lock->locked,1) != 0);
    1872:	90                   	nop
    1873:	8b 45 08             	mov    0x8(%ebp),%eax
    1876:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
    187d:	00 
    187e:	89 04 24             	mov    %eax,(%esp)
    1881:	e8 be ff ff ff       	call   1844 <xchg>
    1886:	85 c0                	test   %eax,%eax
    1888:	75 e9                	jne    1873 <lock_acquire+0x7>
}
    188a:	c9                   	leave  
    188b:	c3                   	ret    

0000188c <lock_release>:
void lock_release(lock_t *lock){
    188c:	55                   	push   %ebp
    188d:	89 e5                	mov    %esp,%ebp
    188f:	83 ec 08             	sub    $0x8,%esp
    xchg(&lock->locked,0);
    1892:	8b 45 08             	mov    0x8(%ebp),%eax
    1895:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    189c:	00 
    189d:	89 04 24             	mov    %eax,(%esp)
    18a0:	e8 9f ff ff ff       	call   1844 <xchg>
}
    18a5:	c9                   	leave  
    18a6:	c3                   	ret    

000018a7 <thread_create>:


void *thread_create(void(*start_routine)(void*), void *arg){
    18a7:	55                   	push   %ebp
    18a8:	89 e5                	mov    %esp,%ebp
    18aa:	83 ec 28             	sub    $0x28,%esp
    int tid;
    void * stack = malloc(2 * 4096);
    18ad:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
    18b4:	e8 a8 fe ff ff       	call   1761 <malloc>
    18b9:	89 45 f4             	mov    %eax,-0xc(%ebp)
    void *garbage_stack = stack; 
    18bc:	8b 45 f4             	mov    -0xc(%ebp),%eax
    18bf:	89 45 f0             	mov    %eax,-0x10(%ebp)
   // printf(1,"start routine addr : %d\n",(uint)start_routine);


    if((uint)stack % 4096){
    18c2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    18c5:	25 ff 0f 00 00       	and    $0xfff,%eax
    18ca:	85 c0                	test   %eax,%eax
    18cc:	74 14                	je     18e2 <thread_create+0x3b>
        stack = stack + (4096 - (uint)stack % 4096);
    18ce:	8b 45 f4             	mov    -0xc(%ebp),%eax
    18d1:	25 ff 0f 00 00       	and    $0xfff,%eax
    18d6:	89 c2                	mov    %eax,%edx
    18d8:	b8 00 10 00 00       	mov    $0x1000,%eax
    18dd:	29 d0                	sub    %edx,%eax
    18df:	01 45 f4             	add    %eax,-0xc(%ebp)
    }
    if (stack == 0){
    18e2:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    18e6:	75 1b                	jne    1903 <thread_create+0x5c>

        printf(1,"malloc fail \n");
    18e8:	c7 44 24 04 7d 1c 00 	movl   $0x1c7d,0x4(%esp)
    18ef:	00 
    18f0:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    18f7:	e8 78 fb ff ff       	call   1474 <printf>
        return 0;
    18fc:	b8 00 00 00 00       	mov    $0x0,%eax
    1901:	eb 6f                	jmp    1972 <thread_create+0xcb>
    }

    tid = clone((uint)stack,PSIZE,(uint)start_routine,(int)arg);
    1903:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    1906:	8b 55 08             	mov    0x8(%ebp),%edx
    1909:	8b 45 f4             	mov    -0xc(%ebp),%eax
    190c:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
    1910:	89 54 24 08          	mov    %edx,0x8(%esp)
    1914:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
    191b:	00 
    191c:	89 04 24             	mov    %eax,(%esp)
    191f:	e8 50 fa ff ff       	call   1374 <clone>
    1924:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(tid < 0){
    1927:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    192b:	79 1b                	jns    1948 <thread_create+0xa1>
        printf(1,"clone fails\n");
    192d:	c7 44 24 04 8b 1c 00 	movl   $0x1c8b,0x4(%esp)
    1934:	00 
    1935:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    193c:	e8 33 fb ff ff       	call   1474 <printf>
        return 0;
    1941:	b8 00 00 00 00       	mov    $0x0,%eax
    1946:	eb 2a                	jmp    1972 <thread_create+0xcb>
    }
    if(tid > 0){
    1948:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    194c:	7e 05                	jle    1953 <thread_create+0xac>
        //store threads on thread table
        return garbage_stack;
    194e:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1951:	eb 1f                	jmp    1972 <thread_create+0xcb>
    }
    if(tid == 0){
    1953:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1957:	75 14                	jne    196d <thread_create+0xc6>
        printf(1,"tid = 0 return \n");
    1959:	c7 44 24 04 98 1c 00 	movl   $0x1c98,0x4(%esp)
    1960:	00 
    1961:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1968:	e8 07 fb ff ff       	call   1474 <printf>
    }
//    wait();
//    free(garbage_stack);

    return 0;
    196d:	b8 00 00 00 00       	mov    $0x0,%eax
}
    1972:	c9                   	leave  
    1973:	c3                   	ret    

00001974 <random>:

// generate 0 -> max random number exclude max.
int random(int max){
    1974:	55                   	push   %ebp
    1975:	89 e5                	mov    %esp,%ebp
    rands = rands * 1664525 + 1013904233;
    1977:	a1 e4 20 00 00       	mov    0x20e4,%eax
    197c:	69 c0 0d 66 19 00    	imul   $0x19660d,%eax,%eax
    1982:	05 69 f3 6e 3c       	add    $0x3c6ef369,%eax
    1987:	a3 e4 20 00 00       	mov    %eax,0x20e4
    return (int)(rands % max);
    198c:	a1 e4 20 00 00       	mov    0x20e4,%eax
    1991:	8b 4d 08             	mov    0x8(%ebp),%ecx
    1994:	ba 00 00 00 00       	mov    $0x0,%edx
    1999:	f7 f1                	div    %ecx
    199b:	89 d0                	mov    %edx,%eax
}
    199d:	5d                   	pop    %ebp
    199e:	c3                   	ret    
    199f:	90                   	nop

000019a0 <init_q>:
#include "queue.h"
#include "types.h"
#include "user.h"

void init_q(struct queue *q){
    19a0:	55                   	push   %ebp
    19a1:	89 e5                	mov    %esp,%ebp
    q->size = 0;
    19a3:	8b 45 08             	mov    0x8(%ebp),%eax
    19a6:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    q->head = 0;
    19ac:	8b 45 08             	mov    0x8(%ebp),%eax
    19af:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    q->tail = 0;
    19b6:	8b 45 08             	mov    0x8(%ebp),%eax
    19b9:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
}
    19c0:	5d                   	pop    %ebp
    19c1:	c3                   	ret    

000019c2 <add_q>:

void add_q(struct queue *q, int v){
    19c2:	55                   	push   %ebp
    19c3:	89 e5                	mov    %esp,%ebp
    19c5:	83 ec 28             	sub    $0x28,%esp
    struct node * n = malloc(sizeof(struct node));
    19c8:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
    19cf:	e8 8d fd ff ff       	call   1761 <malloc>
    19d4:	89 45 f4             	mov    %eax,-0xc(%ebp)
    n->next = 0;
    19d7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    19da:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    n->value = v;
    19e1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    19e4:	8b 55 0c             	mov    0xc(%ebp),%edx
    19e7:	89 10                	mov    %edx,(%eax)
    if(q->head == 0){
    19e9:	8b 45 08             	mov    0x8(%ebp),%eax
    19ec:	8b 40 04             	mov    0x4(%eax),%eax
    19ef:	85 c0                	test   %eax,%eax
    19f1:	75 0b                	jne    19fe <add_q+0x3c>
        q->head = n;
    19f3:	8b 45 08             	mov    0x8(%ebp),%eax
    19f6:	8b 55 f4             	mov    -0xc(%ebp),%edx
    19f9:	89 50 04             	mov    %edx,0x4(%eax)
    19fc:	eb 0c                	jmp    1a0a <add_q+0x48>
    }else{
        q->tail->next = n;
    19fe:	8b 45 08             	mov    0x8(%ebp),%eax
    1a01:	8b 40 08             	mov    0x8(%eax),%eax
    1a04:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1a07:	89 50 04             	mov    %edx,0x4(%eax)
    }
    q->tail = n;
    1a0a:	8b 45 08             	mov    0x8(%ebp),%eax
    1a0d:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1a10:	89 50 08             	mov    %edx,0x8(%eax)
    q->size++;
    1a13:	8b 45 08             	mov    0x8(%ebp),%eax
    1a16:	8b 00                	mov    (%eax),%eax
    1a18:	8d 50 01             	lea    0x1(%eax),%edx
    1a1b:	8b 45 08             	mov    0x8(%ebp),%eax
    1a1e:	89 10                	mov    %edx,(%eax)
}
    1a20:	c9                   	leave  
    1a21:	c3                   	ret    

00001a22 <empty_q>:

int empty_q(struct queue *q){
    1a22:	55                   	push   %ebp
    1a23:	89 e5                	mov    %esp,%ebp
    if(q->size == 0)
    1a25:	8b 45 08             	mov    0x8(%ebp),%eax
    1a28:	8b 00                	mov    (%eax),%eax
    1a2a:	85 c0                	test   %eax,%eax
    1a2c:	75 07                	jne    1a35 <empty_q+0x13>
        return 1;
    1a2e:	b8 01 00 00 00       	mov    $0x1,%eax
    1a33:	eb 05                	jmp    1a3a <empty_q+0x18>
    else
        return 0;
    1a35:	b8 00 00 00 00       	mov    $0x0,%eax
} 
    1a3a:	5d                   	pop    %ebp
    1a3b:	c3                   	ret    

00001a3c <pop_q>:
int pop_q(struct queue *q){
    1a3c:	55                   	push   %ebp
    1a3d:	89 e5                	mov    %esp,%ebp
    1a3f:	83 ec 28             	sub    $0x28,%esp
    int val;
    struct node *destroy;
    if(!empty_q(q)){
    1a42:	8b 45 08             	mov    0x8(%ebp),%eax
    1a45:	89 04 24             	mov    %eax,(%esp)
    1a48:	e8 d5 ff ff ff       	call   1a22 <empty_q>
    1a4d:	85 c0                	test   %eax,%eax
    1a4f:	75 5d                	jne    1aae <pop_q+0x72>
       val = q->head->value; 
    1a51:	8b 45 08             	mov    0x8(%ebp),%eax
    1a54:	8b 40 04             	mov    0x4(%eax),%eax
    1a57:	8b 00                	mov    (%eax),%eax
    1a59:	89 45 f4             	mov    %eax,-0xc(%ebp)
       destroy = q->head;
    1a5c:	8b 45 08             	mov    0x8(%ebp),%eax
    1a5f:	8b 40 04             	mov    0x4(%eax),%eax
    1a62:	89 45 f0             	mov    %eax,-0x10(%ebp)
       q->head = q->head->next;
    1a65:	8b 45 08             	mov    0x8(%ebp),%eax
    1a68:	8b 40 04             	mov    0x4(%eax),%eax
    1a6b:	8b 50 04             	mov    0x4(%eax),%edx
    1a6e:	8b 45 08             	mov    0x8(%ebp),%eax
    1a71:	89 50 04             	mov    %edx,0x4(%eax)
       free(destroy);
    1a74:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1a77:	89 04 24             	mov    %eax,(%esp)
    1a7a:	e8 a9 fb ff ff       	call   1628 <free>
       q->size--;
    1a7f:	8b 45 08             	mov    0x8(%ebp),%eax
    1a82:	8b 00                	mov    (%eax),%eax
    1a84:	8d 50 ff             	lea    -0x1(%eax),%edx
    1a87:	8b 45 08             	mov    0x8(%ebp),%eax
    1a8a:	89 10                	mov    %edx,(%eax)
       if(q->size == 0){
    1a8c:	8b 45 08             	mov    0x8(%ebp),%eax
    1a8f:	8b 00                	mov    (%eax),%eax
    1a91:	85 c0                	test   %eax,%eax
    1a93:	75 14                	jne    1aa9 <pop_q+0x6d>
            q->head = 0;
    1a95:	8b 45 08             	mov    0x8(%ebp),%eax
    1a98:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
            q->tail = 0;
    1a9f:	8b 45 08             	mov    0x8(%ebp),%eax
    1aa2:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
       }
       return val;
    1aa9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1aac:	eb 05                	jmp    1ab3 <pop_q+0x77>
    }
    return -1;
    1aae:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
    1ab3:	c9                   	leave  
    1ab4:	c3                   	ret    

00001ab5 <dominant>:

void dominant(struct queue* q, int i){
    1ab5:	55                   	push   %ebp
    1ab6:	89 e5                	mov    %esp,%ebp
    1ab8:	83 ec 28             	sub    $0x28,%esp
    struct node * n = malloc(sizeof(struct node));
    1abb:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
    1ac2:	e8 9a fc ff ff       	call   1761 <malloc>
    1ac7:	89 45 f4             	mov    %eax,-0xc(%ebp)
    n->value = i;
    1aca:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1acd:	8b 55 0c             	mov    0xc(%ebp),%edx
    1ad0:	89 10                	mov    %edx,(%eax)

    if(q->head == 0){
    1ad2:	8b 45 08             	mov    0x8(%ebp),%eax
    1ad5:	8b 40 04             	mov    0x4(%eax),%eax
    1ad8:	85 c0                	test   %eax,%eax
    1ada:	75 14                	jne    1af0 <dominant+0x3b>
        q->head = n;
    1adc:	8b 45 08             	mov    0x8(%ebp),%eax
    1adf:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1ae2:	89 50 04             	mov    %edx,0x4(%eax)
        q->tail = n;
    1ae5:	8b 45 08             	mov    0x8(%ebp),%eax
    1ae8:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1aeb:	89 50 08             	mov    %edx,0x8(%eax)
    1aee:	eb 15                	jmp    1b05 <dominant+0x50>
    }
    else{
        n->next = q->head;
    1af0:	8b 45 08             	mov    0x8(%ebp),%eax
    1af3:	8b 50 04             	mov    0x4(%eax),%edx
    1af6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1af9:	89 50 04             	mov    %edx,0x4(%eax)
        q->head = n;
    1afc:	8b 45 08             	mov    0x8(%ebp),%eax
    1aff:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1b02:	89 50 04             	mov    %edx,0x4(%eax)
    }
    q->size++;
    1b05:	8b 45 08             	mov    0x8(%ebp),%eax
    1b08:	8b 00                	mov    (%eax),%eax
    1b0a:	8d 50 01             	lea    0x1(%eax),%edx
    1b0d:	8b 45 08             	mov    0x8(%ebp),%eax
    1b10:	89 10                	mov    %edx,(%eax)
}
    1b12:	c9                   	leave  
    1b13:	c3                   	ret    

00001b14 <sem_init>:
#include "semaphore.h"
#include "user.h"

// Initializes the semaphore
void sem_init(struct Semaphore* s, int value){
    1b14:	55                   	push   %ebp
    1b15:	89 e5                	mov    %esp,%ebp
    1b17:	83 ec 18             	sub    $0x18,%esp
    s->val = value;
    1b1a:	8b 45 08             	mov    0x8(%ebp),%eax
    1b1d:	8b 55 0c             	mov    0xc(%ebp),%edx
    1b20:	89 10                	mov    %edx,(%eax)
    lock_init(&s->lock);
    1b22:	8b 45 08             	mov    0x8(%ebp),%eax
    1b25:	83 c0 04             	add    $0x4,%eax
    1b28:	89 04 24             	mov    %eax,(%esp)
    1b2b:	e8 2e fd ff ff       	call   185e <lock_init>
    init_q(&s->q);
    1b30:	8b 45 08             	mov    0x8(%ebp),%eax
    1b33:	83 c0 08             	add    $0x8,%eax
    1b36:	89 04 24             	mov    %eax,(%esp)
    1b39:	e8 62 fe ff ff       	call   19a0 <init_q>
}
    1b3e:	c9                   	leave  
    1b3f:	c3                   	ret    

00001b40 <sem_acquire>:

// Decrements the semaphore
void sem_acquire(struct Semaphore* s){
    1b40:	55                   	push   %ebp
    1b41:	89 e5                	mov    %esp,%ebp
    1b43:	83 ec 28             	sub    $0x28,%esp
    lock_acquire(&s->lock);
    1b46:	8b 45 08             	mov    0x8(%ebp),%eax
    1b49:	83 c0 04             	add    $0x4,%eax
    1b4c:	89 04 24             	mov    %eax,(%esp)
    1b4f:	e8 18 fd ff ff       	call   186c <lock_acquire>

    if(s->val == 0){
    1b54:	8b 45 08             	mov    0x8(%ebp),%eax
    1b57:	8b 00                	mov    (%eax),%eax
    1b59:	85 c0                	test   %eax,%eax
    1b5b:	75 32                	jne    1b8f <sem_acquire+0x4f>
        int pid;
        pid = getpid();
    1b5d:	e8 f2 f7 ff ff       	call   1354 <getpid>
    1b62:	89 45 f4             	mov    %eax,-0xc(%ebp)
        add_q(&s->q, pid);
    1b65:	8b 45 08             	mov    0x8(%ebp),%eax
    1b68:	8d 50 08             	lea    0x8(%eax),%edx
    1b6b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1b6e:	89 44 24 04          	mov    %eax,0x4(%esp)
    1b72:	89 14 24             	mov    %edx,(%esp)
    1b75:	e8 48 fe ff ff       	call   19c2 <add_q>
        lock_release(&s->lock);
    1b7a:	8b 45 08             	mov    0x8(%ebp),%eax
    1b7d:	83 c0 04             	add    $0x4,%eax
    1b80:	89 04 24             	mov    %eax,(%esp)
    1b83:	e8 04 fd ff ff       	call   188c <lock_release>
        tsleep();
    1b88:	e8 f7 f7 ff ff       	call   1384 <tsleep>
    1b8d:	eb 1b                	jmp    1baa <sem_acquire+0x6a>
    }
    else{
        s->val--;
    1b8f:	8b 45 08             	mov    0x8(%ebp),%eax
    1b92:	8b 00                	mov    (%eax),%eax
    1b94:	8d 50 ff             	lea    -0x1(%eax),%edx
    1b97:	8b 45 08             	mov    0x8(%ebp),%eax
    1b9a:	89 10                	mov    %edx,(%eax)
        lock_release(&s->lock);
    1b9c:	8b 45 08             	mov    0x8(%ebp),%eax
    1b9f:	83 c0 04             	add    $0x4,%eax
    1ba2:	89 04 24             	mov    %eax,(%esp)
    1ba5:	e8 e2 fc ff ff       	call   188c <lock_release>
    }
}
    1baa:	c9                   	leave  
    1bab:	c3                   	ret    

00001bac <sem_signal>:

// Increments the semaphore
void sem_signal(struct Semaphore* s){
    1bac:	55                   	push   %ebp
    1bad:	89 e5                	mov    %esp,%ebp
    1baf:	83 ec 18             	sub    $0x18,%esp
    lock_acquire(&s->lock);
    1bb2:	8b 45 08             	mov    0x8(%ebp),%eax
    1bb5:	83 c0 04             	add    $0x4,%eax
    1bb8:	89 04 24             	mov    %eax,(%esp)
    1bbb:	e8 ac fc ff ff       	call   186c <lock_acquire>

    if(!empty_q(&s->q)){
    1bc0:	8b 45 08             	mov    0x8(%ebp),%eax
    1bc3:	83 c0 08             	add    $0x8,%eax
    1bc6:	89 04 24             	mov    %eax,(%esp)
    1bc9:	e8 54 fe ff ff       	call   1a22 <empty_q>
    1bce:	85 c0                	test   %eax,%eax
    1bd0:	75 18                	jne    1bea <sem_signal+0x3e>
        twakeup(pop_q(&s->q));
    1bd2:	8b 45 08             	mov    0x8(%ebp),%eax
    1bd5:	83 c0 08             	add    $0x8,%eax
    1bd8:	89 04 24             	mov    %eax,(%esp)
    1bdb:	e8 5c fe ff ff       	call   1a3c <pop_q>
    1be0:	89 04 24             	mov    %eax,(%esp)
    1be3:	e8 a4 f7 ff ff       	call   138c <twakeup>
    1be8:	eb 0d                	jmp    1bf7 <sem_signal+0x4b>
    }
    else{
        s->val++;
    1bea:	8b 45 08             	mov    0x8(%ebp),%eax
    1bed:	8b 00                	mov    (%eax),%eax
    1bef:	8d 50 01             	lea    0x1(%eax),%edx
    1bf2:	8b 45 08             	mov    0x8(%ebp),%eax
    1bf5:	89 10                	mov    %edx,(%eax)
    }

    lock_release(&s->lock);
    1bf7:	8b 45 08             	mov    0x8(%ebp),%eax
    1bfa:	83 c0 04             	add    $0x4,%eax
    1bfd:	89 04 24             	mov    %eax,(%esp)
    1c00:	e8 87 fc ff ff       	call   188c <lock_release>
}
    1c05:	c9                   	leave  
    1c06:	c3                   	ret    

00001c07 <sem_dom_acquire>:

void sem_dom_acquire(struct Semaphore* s){
    1c07:	55                   	push   %ebp
    1c08:	89 e5                	mov    %esp,%ebp
    1c0a:	83 ec 18             	sub    $0x18,%esp
    lock_acquire(&s->lock);
    1c0d:	8b 45 08             	mov    0x8(%ebp),%eax
    1c10:	83 c0 04             	add    $0x4,%eax
    1c13:	89 04 24             	mov    %eax,(%esp)
    1c16:	e8 51 fc ff ff       	call   186c <lock_acquire>

    if(s->val > 0){
    1c1b:	8b 45 08             	mov    0x8(%ebp),%eax
    1c1e:	8b 00                	mov    (%eax),%eax
    1c20:	85 c0                	test   %eax,%eax
    1c22:	7e 1d                	jle    1c41 <sem_dom_acquire+0x3a>
        s->val--;
    1c24:	8b 45 08             	mov    0x8(%ebp),%eax
    1c27:	8b 00                	mov    (%eax),%eax
    1c29:	8d 50 ff             	lea    -0x1(%eax),%edx
    1c2c:	8b 45 08             	mov    0x8(%ebp),%eax
    1c2f:	89 10                	mov    %edx,(%eax)
        lock_release(&s->lock);
    1c31:	8b 45 08             	mov    0x8(%ebp),%eax
    1c34:	83 c0 04             	add    $0x4,%eax
    1c37:	89 04 24             	mov    %eax,(%esp)
    1c3a:	e8 4d fc ff ff       	call   188c <lock_release>
        return;
    1c3f:	eb 2a                	jmp    1c6b <sem_dom_acquire+0x64>
    }

    dominant(&s->q,getpid());
    1c41:	e8 0e f7 ff ff       	call   1354 <getpid>
    1c46:	8b 55 08             	mov    0x8(%ebp),%edx
    1c49:	83 c2 08             	add    $0x8,%edx
    1c4c:	89 44 24 04          	mov    %eax,0x4(%esp)
    1c50:	89 14 24             	mov    %edx,(%esp)
    1c53:	e8 5d fe ff ff       	call   1ab5 <dominant>
    lock_release(&s->lock);
    1c58:	8b 45 08             	mov    0x8(%ebp),%eax
    1c5b:	83 c0 04             	add    $0x4,%eax
    1c5e:	89 04 24             	mov    %eax,(%esp)
    1c61:	e8 26 fc ff ff       	call   188c <lock_release>
    tsleep();
    1c66:	e8 19 f7 ff ff       	call   1384 <tsleep>
}
    1c6b:	c9                   	leave  
    1c6c:	c3                   	ret    
