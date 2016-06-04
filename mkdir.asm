
_mkdir:     file format elf32-i386


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

  if(argc < 2){
    1009:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
    100d:	7f 19                	jg     1028 <main+0x28>
    printf(2, "Usage: mkdir files...\n");
    100f:	c7 44 24 04 91 1c 00 	movl   $0x1c91,0x4(%esp)
    1016:	00 
    1017:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
    101e:	e8 75 04 00 00       	call   1498 <printf>
    exit();
    1023:	e8 d0 02 00 00       	call   12f8 <exit>
  }

  for(i = 1; i < argc; i++){
    1028:	c7 44 24 1c 01 00 00 	movl   $0x1,0x1c(%esp)
    102f:	00 
    1030:	eb 4f                	jmp    1081 <main+0x81>
    if(mkdir(argv[i]) < 0){
    1032:	8b 44 24 1c          	mov    0x1c(%esp),%eax
    1036:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
    103d:	8b 45 0c             	mov    0xc(%ebp),%eax
    1040:	01 d0                	add    %edx,%eax
    1042:	8b 00                	mov    (%eax),%eax
    1044:	89 04 24             	mov    %eax,(%esp)
    1047:	e8 14 03 00 00       	call   1360 <mkdir>
    104c:	85 c0                	test   %eax,%eax
    104e:	79 2c                	jns    107c <main+0x7c>
      printf(2, "mkdir: %s failed to create\n", argv[i]);
    1050:	8b 44 24 1c          	mov    0x1c(%esp),%eax
    1054:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
    105b:	8b 45 0c             	mov    0xc(%ebp),%eax
    105e:	01 d0                	add    %edx,%eax
    1060:	8b 00                	mov    (%eax),%eax
    1062:	89 44 24 08          	mov    %eax,0x8(%esp)
    1066:	c7 44 24 04 a8 1c 00 	movl   $0x1ca8,0x4(%esp)
    106d:	00 
    106e:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
    1075:	e8 1e 04 00 00       	call   1498 <printf>
      break;
    107a:	eb 0e                	jmp    108a <main+0x8a>
  if(argc < 2){
    printf(2, "Usage: mkdir files...\n");
    exit();
  }

  for(i = 1; i < argc; i++){
    107c:	83 44 24 1c 01       	addl   $0x1,0x1c(%esp)
    1081:	8b 44 24 1c          	mov    0x1c(%esp),%eax
    1085:	3b 45 08             	cmp    0x8(%ebp),%eax
    1088:	7c a8                	jl     1032 <main+0x32>
      printf(2, "mkdir: %s failed to create\n", argv[i]);
      break;
    }
  }

  exit();
    108a:	e8 69 02 00 00       	call   12f8 <exit>
    108f:	90                   	nop

00001090 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
    1090:	55                   	push   %ebp
    1091:	89 e5                	mov    %esp,%ebp
    1093:	57                   	push   %edi
    1094:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
    1095:	8b 4d 08             	mov    0x8(%ebp),%ecx
    1098:	8b 55 10             	mov    0x10(%ebp),%edx
    109b:	8b 45 0c             	mov    0xc(%ebp),%eax
    109e:	89 cb                	mov    %ecx,%ebx
    10a0:	89 df                	mov    %ebx,%edi
    10a2:	89 d1                	mov    %edx,%ecx
    10a4:	fc                   	cld    
    10a5:	f3 aa                	rep stos %al,%es:(%edi)
    10a7:	89 ca                	mov    %ecx,%edx
    10a9:	89 fb                	mov    %edi,%ebx
    10ab:	89 5d 08             	mov    %ebx,0x8(%ebp)
    10ae:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
    10b1:	5b                   	pop    %ebx
    10b2:	5f                   	pop    %edi
    10b3:	5d                   	pop    %ebp
    10b4:	c3                   	ret    

000010b5 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
    10b5:	55                   	push   %ebp
    10b6:	89 e5                	mov    %esp,%ebp
    10b8:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
    10bb:	8b 45 08             	mov    0x8(%ebp),%eax
    10be:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
    10c1:	90                   	nop
    10c2:	8b 45 08             	mov    0x8(%ebp),%eax
    10c5:	8d 50 01             	lea    0x1(%eax),%edx
    10c8:	89 55 08             	mov    %edx,0x8(%ebp)
    10cb:	8b 55 0c             	mov    0xc(%ebp),%edx
    10ce:	8d 4a 01             	lea    0x1(%edx),%ecx
    10d1:	89 4d 0c             	mov    %ecx,0xc(%ebp)
    10d4:	0f b6 12             	movzbl (%edx),%edx
    10d7:	88 10                	mov    %dl,(%eax)
    10d9:	0f b6 00             	movzbl (%eax),%eax
    10dc:	84 c0                	test   %al,%al
    10de:	75 e2                	jne    10c2 <strcpy+0xd>
    ;
  return os;
    10e0:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    10e3:	c9                   	leave  
    10e4:	c3                   	ret    

000010e5 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    10e5:	55                   	push   %ebp
    10e6:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
    10e8:	eb 08                	jmp    10f2 <strcmp+0xd>
    p++, q++;
    10ea:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    10ee:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    10f2:	8b 45 08             	mov    0x8(%ebp),%eax
    10f5:	0f b6 00             	movzbl (%eax),%eax
    10f8:	84 c0                	test   %al,%al
    10fa:	74 10                	je     110c <strcmp+0x27>
    10fc:	8b 45 08             	mov    0x8(%ebp),%eax
    10ff:	0f b6 10             	movzbl (%eax),%edx
    1102:	8b 45 0c             	mov    0xc(%ebp),%eax
    1105:	0f b6 00             	movzbl (%eax),%eax
    1108:	38 c2                	cmp    %al,%dl
    110a:	74 de                	je     10ea <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
    110c:	8b 45 08             	mov    0x8(%ebp),%eax
    110f:	0f b6 00             	movzbl (%eax),%eax
    1112:	0f b6 d0             	movzbl %al,%edx
    1115:	8b 45 0c             	mov    0xc(%ebp),%eax
    1118:	0f b6 00             	movzbl (%eax),%eax
    111b:	0f b6 c0             	movzbl %al,%eax
    111e:	29 c2                	sub    %eax,%edx
    1120:	89 d0                	mov    %edx,%eax
}
    1122:	5d                   	pop    %ebp
    1123:	c3                   	ret    

00001124 <strlen>:

uint
strlen(char *s)
{
    1124:	55                   	push   %ebp
    1125:	89 e5                	mov    %esp,%ebp
    1127:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
    112a:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    1131:	eb 04                	jmp    1137 <strlen+0x13>
    1133:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    1137:	8b 55 fc             	mov    -0x4(%ebp),%edx
    113a:	8b 45 08             	mov    0x8(%ebp),%eax
    113d:	01 d0                	add    %edx,%eax
    113f:	0f b6 00             	movzbl (%eax),%eax
    1142:	84 c0                	test   %al,%al
    1144:	75 ed                	jne    1133 <strlen+0xf>
    ;
  return n;
    1146:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    1149:	c9                   	leave  
    114a:	c3                   	ret    

0000114b <memset>:

void*
memset(void *dst, int c, uint n)
{
    114b:	55                   	push   %ebp
    114c:	89 e5                	mov    %esp,%ebp
    114e:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
    1151:	8b 45 10             	mov    0x10(%ebp),%eax
    1154:	89 44 24 08          	mov    %eax,0x8(%esp)
    1158:	8b 45 0c             	mov    0xc(%ebp),%eax
    115b:	89 44 24 04          	mov    %eax,0x4(%esp)
    115f:	8b 45 08             	mov    0x8(%ebp),%eax
    1162:	89 04 24             	mov    %eax,(%esp)
    1165:	e8 26 ff ff ff       	call   1090 <stosb>
  return dst;
    116a:	8b 45 08             	mov    0x8(%ebp),%eax
}
    116d:	c9                   	leave  
    116e:	c3                   	ret    

0000116f <strchr>:

char*
strchr(const char *s, char c)
{
    116f:	55                   	push   %ebp
    1170:	89 e5                	mov    %esp,%ebp
    1172:	83 ec 04             	sub    $0x4,%esp
    1175:	8b 45 0c             	mov    0xc(%ebp),%eax
    1178:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
    117b:	eb 14                	jmp    1191 <strchr+0x22>
    if(*s == c)
    117d:	8b 45 08             	mov    0x8(%ebp),%eax
    1180:	0f b6 00             	movzbl (%eax),%eax
    1183:	3a 45 fc             	cmp    -0x4(%ebp),%al
    1186:	75 05                	jne    118d <strchr+0x1e>
      return (char*)s;
    1188:	8b 45 08             	mov    0x8(%ebp),%eax
    118b:	eb 13                	jmp    11a0 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
    118d:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    1191:	8b 45 08             	mov    0x8(%ebp),%eax
    1194:	0f b6 00             	movzbl (%eax),%eax
    1197:	84 c0                	test   %al,%al
    1199:	75 e2                	jne    117d <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
    119b:	b8 00 00 00 00       	mov    $0x0,%eax
}
    11a0:	c9                   	leave  
    11a1:	c3                   	ret    

000011a2 <gets>:

char*
gets(char *buf, int max)
{
    11a2:	55                   	push   %ebp
    11a3:	89 e5                	mov    %esp,%ebp
    11a5:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    11a8:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    11af:	eb 4c                	jmp    11fd <gets+0x5b>
    cc = read(0, &c, 1);
    11b1:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    11b8:	00 
    11b9:	8d 45 ef             	lea    -0x11(%ebp),%eax
    11bc:	89 44 24 04          	mov    %eax,0x4(%esp)
    11c0:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    11c7:	e8 44 01 00 00       	call   1310 <read>
    11cc:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
    11cf:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    11d3:	7f 02                	jg     11d7 <gets+0x35>
      break;
    11d5:	eb 31                	jmp    1208 <gets+0x66>
    buf[i++] = c;
    11d7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    11da:	8d 50 01             	lea    0x1(%eax),%edx
    11dd:	89 55 f4             	mov    %edx,-0xc(%ebp)
    11e0:	89 c2                	mov    %eax,%edx
    11e2:	8b 45 08             	mov    0x8(%ebp),%eax
    11e5:	01 c2                	add    %eax,%edx
    11e7:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    11eb:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
    11ed:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    11f1:	3c 0a                	cmp    $0xa,%al
    11f3:	74 13                	je     1208 <gets+0x66>
    11f5:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    11f9:	3c 0d                	cmp    $0xd,%al
    11fb:	74 0b                	je     1208 <gets+0x66>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    11fd:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1200:	83 c0 01             	add    $0x1,%eax
    1203:	3b 45 0c             	cmp    0xc(%ebp),%eax
    1206:	7c a9                	jl     11b1 <gets+0xf>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    1208:	8b 55 f4             	mov    -0xc(%ebp),%edx
    120b:	8b 45 08             	mov    0x8(%ebp),%eax
    120e:	01 d0                	add    %edx,%eax
    1210:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
    1213:	8b 45 08             	mov    0x8(%ebp),%eax
}
    1216:	c9                   	leave  
    1217:	c3                   	ret    

00001218 <stat>:

int
stat(char *n, struct stat *st)
{
    1218:	55                   	push   %ebp
    1219:	89 e5                	mov    %esp,%ebp
    121b:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    121e:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1225:	00 
    1226:	8b 45 08             	mov    0x8(%ebp),%eax
    1229:	89 04 24             	mov    %eax,(%esp)
    122c:	e8 07 01 00 00       	call   1338 <open>
    1231:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
    1234:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1238:	79 07                	jns    1241 <stat+0x29>
    return -1;
    123a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    123f:	eb 23                	jmp    1264 <stat+0x4c>
  r = fstat(fd, st);
    1241:	8b 45 0c             	mov    0xc(%ebp),%eax
    1244:	89 44 24 04          	mov    %eax,0x4(%esp)
    1248:	8b 45 f4             	mov    -0xc(%ebp),%eax
    124b:	89 04 24             	mov    %eax,(%esp)
    124e:	e8 fd 00 00 00       	call   1350 <fstat>
    1253:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
    1256:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1259:	89 04 24             	mov    %eax,(%esp)
    125c:	e8 bf 00 00 00       	call   1320 <close>
  return r;
    1261:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
    1264:	c9                   	leave  
    1265:	c3                   	ret    

00001266 <atoi>:

int
atoi(const char *s)
{
    1266:	55                   	push   %ebp
    1267:	89 e5                	mov    %esp,%ebp
    1269:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
    126c:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
    1273:	eb 25                	jmp    129a <atoi+0x34>
    n = n*10 + *s++ - '0';
    1275:	8b 55 fc             	mov    -0x4(%ebp),%edx
    1278:	89 d0                	mov    %edx,%eax
    127a:	c1 e0 02             	shl    $0x2,%eax
    127d:	01 d0                	add    %edx,%eax
    127f:	01 c0                	add    %eax,%eax
    1281:	89 c1                	mov    %eax,%ecx
    1283:	8b 45 08             	mov    0x8(%ebp),%eax
    1286:	8d 50 01             	lea    0x1(%eax),%edx
    1289:	89 55 08             	mov    %edx,0x8(%ebp)
    128c:	0f b6 00             	movzbl (%eax),%eax
    128f:	0f be c0             	movsbl %al,%eax
    1292:	01 c8                	add    %ecx,%eax
    1294:	83 e8 30             	sub    $0x30,%eax
    1297:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    129a:	8b 45 08             	mov    0x8(%ebp),%eax
    129d:	0f b6 00             	movzbl (%eax),%eax
    12a0:	3c 2f                	cmp    $0x2f,%al
    12a2:	7e 0a                	jle    12ae <atoi+0x48>
    12a4:	8b 45 08             	mov    0x8(%ebp),%eax
    12a7:	0f b6 00             	movzbl (%eax),%eax
    12aa:	3c 39                	cmp    $0x39,%al
    12ac:	7e c7                	jle    1275 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
    12ae:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    12b1:	c9                   	leave  
    12b2:	c3                   	ret    

000012b3 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    12b3:	55                   	push   %ebp
    12b4:	89 e5                	mov    %esp,%ebp
    12b6:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
    12b9:	8b 45 08             	mov    0x8(%ebp),%eax
    12bc:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
    12bf:	8b 45 0c             	mov    0xc(%ebp),%eax
    12c2:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
    12c5:	eb 17                	jmp    12de <memmove+0x2b>
    *dst++ = *src++;
    12c7:	8b 45 fc             	mov    -0x4(%ebp),%eax
    12ca:	8d 50 01             	lea    0x1(%eax),%edx
    12cd:	89 55 fc             	mov    %edx,-0x4(%ebp)
    12d0:	8b 55 f8             	mov    -0x8(%ebp),%edx
    12d3:	8d 4a 01             	lea    0x1(%edx),%ecx
    12d6:	89 4d f8             	mov    %ecx,-0x8(%ebp)
    12d9:	0f b6 12             	movzbl (%edx),%edx
    12dc:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    12de:	8b 45 10             	mov    0x10(%ebp),%eax
    12e1:	8d 50 ff             	lea    -0x1(%eax),%edx
    12e4:	89 55 10             	mov    %edx,0x10(%ebp)
    12e7:	85 c0                	test   %eax,%eax
    12e9:	7f dc                	jg     12c7 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
    12eb:	8b 45 08             	mov    0x8(%ebp),%eax
}
    12ee:	c9                   	leave  
    12ef:	c3                   	ret    

000012f0 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    12f0:	b8 01 00 00 00       	mov    $0x1,%eax
    12f5:	cd 40                	int    $0x40
    12f7:	c3                   	ret    

000012f8 <exit>:
SYSCALL(exit)
    12f8:	b8 02 00 00 00       	mov    $0x2,%eax
    12fd:	cd 40                	int    $0x40
    12ff:	c3                   	ret    

00001300 <wait>:
SYSCALL(wait)
    1300:	b8 03 00 00 00       	mov    $0x3,%eax
    1305:	cd 40                	int    $0x40
    1307:	c3                   	ret    

00001308 <pipe>:
SYSCALL(pipe)
    1308:	b8 04 00 00 00       	mov    $0x4,%eax
    130d:	cd 40                	int    $0x40
    130f:	c3                   	ret    

00001310 <read>:
SYSCALL(read)
    1310:	b8 05 00 00 00       	mov    $0x5,%eax
    1315:	cd 40                	int    $0x40
    1317:	c3                   	ret    

00001318 <write>:
SYSCALL(write)
    1318:	b8 10 00 00 00       	mov    $0x10,%eax
    131d:	cd 40                	int    $0x40
    131f:	c3                   	ret    

00001320 <close>:
SYSCALL(close)
    1320:	b8 15 00 00 00       	mov    $0x15,%eax
    1325:	cd 40                	int    $0x40
    1327:	c3                   	ret    

00001328 <kill>:
SYSCALL(kill)
    1328:	b8 06 00 00 00       	mov    $0x6,%eax
    132d:	cd 40                	int    $0x40
    132f:	c3                   	ret    

00001330 <exec>:
SYSCALL(exec)
    1330:	b8 07 00 00 00       	mov    $0x7,%eax
    1335:	cd 40                	int    $0x40
    1337:	c3                   	ret    

00001338 <open>:
SYSCALL(open)
    1338:	b8 0f 00 00 00       	mov    $0xf,%eax
    133d:	cd 40                	int    $0x40
    133f:	c3                   	ret    

00001340 <mknod>:
SYSCALL(mknod)
    1340:	b8 11 00 00 00       	mov    $0x11,%eax
    1345:	cd 40                	int    $0x40
    1347:	c3                   	ret    

00001348 <unlink>:
SYSCALL(unlink)
    1348:	b8 12 00 00 00       	mov    $0x12,%eax
    134d:	cd 40                	int    $0x40
    134f:	c3                   	ret    

00001350 <fstat>:
SYSCALL(fstat)
    1350:	b8 08 00 00 00       	mov    $0x8,%eax
    1355:	cd 40                	int    $0x40
    1357:	c3                   	ret    

00001358 <link>:
SYSCALL(link)
    1358:	b8 13 00 00 00       	mov    $0x13,%eax
    135d:	cd 40                	int    $0x40
    135f:	c3                   	ret    

00001360 <mkdir>:
SYSCALL(mkdir)
    1360:	b8 14 00 00 00       	mov    $0x14,%eax
    1365:	cd 40                	int    $0x40
    1367:	c3                   	ret    

00001368 <chdir>:
SYSCALL(chdir)
    1368:	b8 09 00 00 00       	mov    $0x9,%eax
    136d:	cd 40                	int    $0x40
    136f:	c3                   	ret    

00001370 <dup>:
SYSCALL(dup)
    1370:	b8 0a 00 00 00       	mov    $0xa,%eax
    1375:	cd 40                	int    $0x40
    1377:	c3                   	ret    

00001378 <getpid>:
SYSCALL(getpid)
    1378:	b8 0b 00 00 00       	mov    $0xb,%eax
    137d:	cd 40                	int    $0x40
    137f:	c3                   	ret    

00001380 <sbrk>:
SYSCALL(sbrk)
    1380:	b8 0c 00 00 00       	mov    $0xc,%eax
    1385:	cd 40                	int    $0x40
    1387:	c3                   	ret    

00001388 <sleep>:
SYSCALL(sleep)
    1388:	b8 0d 00 00 00       	mov    $0xd,%eax
    138d:	cd 40                	int    $0x40
    138f:	c3                   	ret    

00001390 <uptime>:
SYSCALL(uptime)
    1390:	b8 0e 00 00 00       	mov    $0xe,%eax
    1395:	cd 40                	int    $0x40
    1397:	c3                   	ret    

00001398 <clone>:
SYSCALL(clone)
    1398:	b8 16 00 00 00       	mov    $0x16,%eax
    139d:	cd 40                	int    $0x40
    139f:	c3                   	ret    

000013a0 <texit>:
SYSCALL(texit)
    13a0:	b8 17 00 00 00       	mov    $0x17,%eax
    13a5:	cd 40                	int    $0x40
    13a7:	c3                   	ret    

000013a8 <tsleep>:
SYSCALL(tsleep)
    13a8:	b8 18 00 00 00       	mov    $0x18,%eax
    13ad:	cd 40                	int    $0x40
    13af:	c3                   	ret    

000013b0 <twakeup>:
SYSCALL(twakeup)
    13b0:	b8 19 00 00 00       	mov    $0x19,%eax
    13b5:	cd 40                	int    $0x40
    13b7:	c3                   	ret    

000013b8 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
    13b8:	55                   	push   %ebp
    13b9:	89 e5                	mov    %esp,%ebp
    13bb:	83 ec 18             	sub    $0x18,%esp
    13be:	8b 45 0c             	mov    0xc(%ebp),%eax
    13c1:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
    13c4:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    13cb:	00 
    13cc:	8d 45 f4             	lea    -0xc(%ebp),%eax
    13cf:	89 44 24 04          	mov    %eax,0x4(%esp)
    13d3:	8b 45 08             	mov    0x8(%ebp),%eax
    13d6:	89 04 24             	mov    %eax,(%esp)
    13d9:	e8 3a ff ff ff       	call   1318 <write>
}
    13de:	c9                   	leave  
    13df:	c3                   	ret    

000013e0 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
    13e0:	55                   	push   %ebp
    13e1:	89 e5                	mov    %esp,%ebp
    13e3:	56                   	push   %esi
    13e4:	53                   	push   %ebx
    13e5:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    13e8:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
    13ef:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
    13f3:	74 17                	je     140c <printint+0x2c>
    13f5:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    13f9:	79 11                	jns    140c <printint+0x2c>
    neg = 1;
    13fb:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
    1402:	8b 45 0c             	mov    0xc(%ebp),%eax
    1405:	f7 d8                	neg    %eax
    1407:	89 45 ec             	mov    %eax,-0x14(%ebp)
    140a:	eb 06                	jmp    1412 <printint+0x32>
  } else {
    x = xx;
    140c:	8b 45 0c             	mov    0xc(%ebp),%eax
    140f:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
    1412:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
    1419:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    141c:	8d 41 01             	lea    0x1(%ecx),%eax
    141f:	89 45 f4             	mov    %eax,-0xc(%ebp)
    1422:	8b 5d 10             	mov    0x10(%ebp),%ebx
    1425:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1428:	ba 00 00 00 00       	mov    $0x0,%edx
    142d:	f7 f3                	div    %ebx
    142f:	89 d0                	mov    %edx,%eax
    1431:	0f b6 80 1c 21 00 00 	movzbl 0x211c(%eax),%eax
    1438:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
    143c:	8b 75 10             	mov    0x10(%ebp),%esi
    143f:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1442:	ba 00 00 00 00       	mov    $0x0,%edx
    1447:	f7 f6                	div    %esi
    1449:	89 45 ec             	mov    %eax,-0x14(%ebp)
    144c:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1450:	75 c7                	jne    1419 <printint+0x39>
  if(neg)
    1452:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1456:	74 10                	je     1468 <printint+0x88>
    buf[i++] = '-';
    1458:	8b 45 f4             	mov    -0xc(%ebp),%eax
    145b:	8d 50 01             	lea    0x1(%eax),%edx
    145e:	89 55 f4             	mov    %edx,-0xc(%ebp)
    1461:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
    1466:	eb 1f                	jmp    1487 <printint+0xa7>
    1468:	eb 1d                	jmp    1487 <printint+0xa7>
    putc(fd, buf[i]);
    146a:	8d 55 dc             	lea    -0x24(%ebp),%edx
    146d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1470:	01 d0                	add    %edx,%eax
    1472:	0f b6 00             	movzbl (%eax),%eax
    1475:	0f be c0             	movsbl %al,%eax
    1478:	89 44 24 04          	mov    %eax,0x4(%esp)
    147c:	8b 45 08             	mov    0x8(%ebp),%eax
    147f:	89 04 24             	mov    %eax,(%esp)
    1482:	e8 31 ff ff ff       	call   13b8 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    1487:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    148b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    148f:	79 d9                	jns    146a <printint+0x8a>
    putc(fd, buf[i]);
}
    1491:	83 c4 30             	add    $0x30,%esp
    1494:	5b                   	pop    %ebx
    1495:	5e                   	pop    %esi
    1496:	5d                   	pop    %ebp
    1497:	c3                   	ret    

00001498 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    1498:	55                   	push   %ebp
    1499:	89 e5                	mov    %esp,%ebp
    149b:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
    149e:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
    14a5:	8d 45 0c             	lea    0xc(%ebp),%eax
    14a8:	83 c0 04             	add    $0x4,%eax
    14ab:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
    14ae:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    14b5:	e9 7c 01 00 00       	jmp    1636 <printf+0x19e>
    c = fmt[i] & 0xff;
    14ba:	8b 55 0c             	mov    0xc(%ebp),%edx
    14bd:	8b 45 f0             	mov    -0x10(%ebp),%eax
    14c0:	01 d0                	add    %edx,%eax
    14c2:	0f b6 00             	movzbl (%eax),%eax
    14c5:	0f be c0             	movsbl %al,%eax
    14c8:	25 ff 00 00 00       	and    $0xff,%eax
    14cd:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
    14d0:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    14d4:	75 2c                	jne    1502 <printf+0x6a>
      if(c == '%'){
    14d6:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    14da:	75 0c                	jne    14e8 <printf+0x50>
        state = '%';
    14dc:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
    14e3:	e9 4a 01 00 00       	jmp    1632 <printf+0x19a>
      } else {
        putc(fd, c);
    14e8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    14eb:	0f be c0             	movsbl %al,%eax
    14ee:	89 44 24 04          	mov    %eax,0x4(%esp)
    14f2:	8b 45 08             	mov    0x8(%ebp),%eax
    14f5:	89 04 24             	mov    %eax,(%esp)
    14f8:	e8 bb fe ff ff       	call   13b8 <putc>
    14fd:	e9 30 01 00 00       	jmp    1632 <printf+0x19a>
      }
    } else if(state == '%'){
    1502:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
    1506:	0f 85 26 01 00 00    	jne    1632 <printf+0x19a>
      if(c == 'd'){
    150c:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
    1510:	75 2d                	jne    153f <printf+0xa7>
        printint(fd, *ap, 10, 1);
    1512:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1515:	8b 00                	mov    (%eax),%eax
    1517:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    151e:	00 
    151f:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
    1526:	00 
    1527:	89 44 24 04          	mov    %eax,0x4(%esp)
    152b:	8b 45 08             	mov    0x8(%ebp),%eax
    152e:	89 04 24             	mov    %eax,(%esp)
    1531:	e8 aa fe ff ff       	call   13e0 <printint>
        ap++;
    1536:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    153a:	e9 ec 00 00 00       	jmp    162b <printf+0x193>
      } else if(c == 'x' || c == 'p'){
    153f:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
    1543:	74 06                	je     154b <printf+0xb3>
    1545:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
    1549:	75 2d                	jne    1578 <printf+0xe0>
        printint(fd, *ap, 16, 0);
    154b:	8b 45 e8             	mov    -0x18(%ebp),%eax
    154e:	8b 00                	mov    (%eax),%eax
    1550:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    1557:	00 
    1558:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
    155f:	00 
    1560:	89 44 24 04          	mov    %eax,0x4(%esp)
    1564:	8b 45 08             	mov    0x8(%ebp),%eax
    1567:	89 04 24             	mov    %eax,(%esp)
    156a:	e8 71 fe ff ff       	call   13e0 <printint>
        ap++;
    156f:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    1573:	e9 b3 00 00 00       	jmp    162b <printf+0x193>
      } else if(c == 's'){
    1578:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
    157c:	75 45                	jne    15c3 <printf+0x12b>
        s = (char*)*ap;
    157e:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1581:	8b 00                	mov    (%eax),%eax
    1583:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
    1586:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
    158a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    158e:	75 09                	jne    1599 <printf+0x101>
          s = "(null)";
    1590:	c7 45 f4 c4 1c 00 00 	movl   $0x1cc4,-0xc(%ebp)
        while(*s != 0){
    1597:	eb 1e                	jmp    15b7 <printf+0x11f>
    1599:	eb 1c                	jmp    15b7 <printf+0x11f>
          putc(fd, *s);
    159b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    159e:	0f b6 00             	movzbl (%eax),%eax
    15a1:	0f be c0             	movsbl %al,%eax
    15a4:	89 44 24 04          	mov    %eax,0x4(%esp)
    15a8:	8b 45 08             	mov    0x8(%ebp),%eax
    15ab:	89 04 24             	mov    %eax,(%esp)
    15ae:	e8 05 fe ff ff       	call   13b8 <putc>
          s++;
    15b3:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    15b7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    15ba:	0f b6 00             	movzbl (%eax),%eax
    15bd:	84 c0                	test   %al,%al
    15bf:	75 da                	jne    159b <printf+0x103>
    15c1:	eb 68                	jmp    162b <printf+0x193>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    15c3:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
    15c7:	75 1d                	jne    15e6 <printf+0x14e>
        putc(fd, *ap);
    15c9:	8b 45 e8             	mov    -0x18(%ebp),%eax
    15cc:	8b 00                	mov    (%eax),%eax
    15ce:	0f be c0             	movsbl %al,%eax
    15d1:	89 44 24 04          	mov    %eax,0x4(%esp)
    15d5:	8b 45 08             	mov    0x8(%ebp),%eax
    15d8:	89 04 24             	mov    %eax,(%esp)
    15db:	e8 d8 fd ff ff       	call   13b8 <putc>
        ap++;
    15e0:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    15e4:	eb 45                	jmp    162b <printf+0x193>
      } else if(c == '%'){
    15e6:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    15ea:	75 17                	jne    1603 <printf+0x16b>
        putc(fd, c);
    15ec:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    15ef:	0f be c0             	movsbl %al,%eax
    15f2:	89 44 24 04          	mov    %eax,0x4(%esp)
    15f6:	8b 45 08             	mov    0x8(%ebp),%eax
    15f9:	89 04 24             	mov    %eax,(%esp)
    15fc:	e8 b7 fd ff ff       	call   13b8 <putc>
    1601:	eb 28                	jmp    162b <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
    1603:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
    160a:	00 
    160b:	8b 45 08             	mov    0x8(%ebp),%eax
    160e:	89 04 24             	mov    %eax,(%esp)
    1611:	e8 a2 fd ff ff       	call   13b8 <putc>
        putc(fd, c);
    1616:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1619:	0f be c0             	movsbl %al,%eax
    161c:	89 44 24 04          	mov    %eax,0x4(%esp)
    1620:	8b 45 08             	mov    0x8(%ebp),%eax
    1623:	89 04 24             	mov    %eax,(%esp)
    1626:	e8 8d fd ff ff       	call   13b8 <putc>
      }
      state = 0;
    162b:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1632:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    1636:	8b 55 0c             	mov    0xc(%ebp),%edx
    1639:	8b 45 f0             	mov    -0x10(%ebp),%eax
    163c:	01 d0                	add    %edx,%eax
    163e:	0f b6 00             	movzbl (%eax),%eax
    1641:	84 c0                	test   %al,%al
    1643:	0f 85 71 fe ff ff    	jne    14ba <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    1649:	c9                   	leave  
    164a:	c3                   	ret    
    164b:	90                   	nop

0000164c <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    164c:	55                   	push   %ebp
    164d:	89 e5                	mov    %esp,%ebp
    164f:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
    1652:	8b 45 08             	mov    0x8(%ebp),%eax
    1655:	83 e8 08             	sub    $0x8,%eax
    1658:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    165b:	a1 3c 21 00 00       	mov    0x213c,%eax
    1660:	89 45 fc             	mov    %eax,-0x4(%ebp)
    1663:	eb 24                	jmp    1689 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1665:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1668:	8b 00                	mov    (%eax),%eax
    166a:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    166d:	77 12                	ja     1681 <free+0x35>
    166f:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1672:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    1675:	77 24                	ja     169b <free+0x4f>
    1677:	8b 45 fc             	mov    -0x4(%ebp),%eax
    167a:	8b 00                	mov    (%eax),%eax
    167c:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    167f:	77 1a                	ja     169b <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1681:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1684:	8b 00                	mov    (%eax),%eax
    1686:	89 45 fc             	mov    %eax,-0x4(%ebp)
    1689:	8b 45 f8             	mov    -0x8(%ebp),%eax
    168c:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    168f:	76 d4                	jbe    1665 <free+0x19>
    1691:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1694:	8b 00                	mov    (%eax),%eax
    1696:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    1699:	76 ca                	jbe    1665 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    169b:	8b 45 f8             	mov    -0x8(%ebp),%eax
    169e:	8b 40 04             	mov    0x4(%eax),%eax
    16a1:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    16a8:	8b 45 f8             	mov    -0x8(%ebp),%eax
    16ab:	01 c2                	add    %eax,%edx
    16ad:	8b 45 fc             	mov    -0x4(%ebp),%eax
    16b0:	8b 00                	mov    (%eax),%eax
    16b2:	39 c2                	cmp    %eax,%edx
    16b4:	75 24                	jne    16da <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
    16b6:	8b 45 f8             	mov    -0x8(%ebp),%eax
    16b9:	8b 50 04             	mov    0x4(%eax),%edx
    16bc:	8b 45 fc             	mov    -0x4(%ebp),%eax
    16bf:	8b 00                	mov    (%eax),%eax
    16c1:	8b 40 04             	mov    0x4(%eax),%eax
    16c4:	01 c2                	add    %eax,%edx
    16c6:	8b 45 f8             	mov    -0x8(%ebp),%eax
    16c9:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
    16cc:	8b 45 fc             	mov    -0x4(%ebp),%eax
    16cf:	8b 00                	mov    (%eax),%eax
    16d1:	8b 10                	mov    (%eax),%edx
    16d3:	8b 45 f8             	mov    -0x8(%ebp),%eax
    16d6:	89 10                	mov    %edx,(%eax)
    16d8:	eb 0a                	jmp    16e4 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
    16da:	8b 45 fc             	mov    -0x4(%ebp),%eax
    16dd:	8b 10                	mov    (%eax),%edx
    16df:	8b 45 f8             	mov    -0x8(%ebp),%eax
    16e2:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
    16e4:	8b 45 fc             	mov    -0x4(%ebp),%eax
    16e7:	8b 40 04             	mov    0x4(%eax),%eax
    16ea:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    16f1:	8b 45 fc             	mov    -0x4(%ebp),%eax
    16f4:	01 d0                	add    %edx,%eax
    16f6:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    16f9:	75 20                	jne    171b <free+0xcf>
    p->s.size += bp->s.size;
    16fb:	8b 45 fc             	mov    -0x4(%ebp),%eax
    16fe:	8b 50 04             	mov    0x4(%eax),%edx
    1701:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1704:	8b 40 04             	mov    0x4(%eax),%eax
    1707:	01 c2                	add    %eax,%edx
    1709:	8b 45 fc             	mov    -0x4(%ebp),%eax
    170c:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    170f:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1712:	8b 10                	mov    (%eax),%edx
    1714:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1717:	89 10                	mov    %edx,(%eax)
    1719:	eb 08                	jmp    1723 <free+0xd7>
  } else
    p->s.ptr = bp;
    171b:	8b 45 fc             	mov    -0x4(%ebp),%eax
    171e:	8b 55 f8             	mov    -0x8(%ebp),%edx
    1721:	89 10                	mov    %edx,(%eax)
  freep = p;
    1723:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1726:	a3 3c 21 00 00       	mov    %eax,0x213c
}
    172b:	c9                   	leave  
    172c:	c3                   	ret    

0000172d <morecore>:

static Header*
morecore(uint nu)
{
    172d:	55                   	push   %ebp
    172e:	89 e5                	mov    %esp,%ebp
    1730:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
    1733:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
    173a:	77 07                	ja     1743 <morecore+0x16>
    nu = 4096;
    173c:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
    1743:	8b 45 08             	mov    0x8(%ebp),%eax
    1746:	c1 e0 03             	shl    $0x3,%eax
    1749:	89 04 24             	mov    %eax,(%esp)
    174c:	e8 2f fc ff ff       	call   1380 <sbrk>
    1751:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
    1754:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
    1758:	75 07                	jne    1761 <morecore+0x34>
    return 0;
    175a:	b8 00 00 00 00       	mov    $0x0,%eax
    175f:	eb 22                	jmp    1783 <morecore+0x56>
  hp = (Header*)p;
    1761:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1764:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
    1767:	8b 45 f0             	mov    -0x10(%ebp),%eax
    176a:	8b 55 08             	mov    0x8(%ebp),%edx
    176d:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
    1770:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1773:	83 c0 08             	add    $0x8,%eax
    1776:	89 04 24             	mov    %eax,(%esp)
    1779:	e8 ce fe ff ff       	call   164c <free>
  return freep;
    177e:	a1 3c 21 00 00       	mov    0x213c,%eax
}
    1783:	c9                   	leave  
    1784:	c3                   	ret    

00001785 <malloc>:

void*
malloc(uint nbytes)
{
    1785:	55                   	push   %ebp
    1786:	89 e5                	mov    %esp,%ebp
    1788:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    178b:	8b 45 08             	mov    0x8(%ebp),%eax
    178e:	83 c0 07             	add    $0x7,%eax
    1791:	c1 e8 03             	shr    $0x3,%eax
    1794:	83 c0 01             	add    $0x1,%eax
    1797:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
    179a:	a1 3c 21 00 00       	mov    0x213c,%eax
    179f:	89 45 f0             	mov    %eax,-0x10(%ebp)
    17a2:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    17a6:	75 23                	jne    17cb <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
    17a8:	c7 45 f0 34 21 00 00 	movl   $0x2134,-0x10(%ebp)
    17af:	8b 45 f0             	mov    -0x10(%ebp),%eax
    17b2:	a3 3c 21 00 00       	mov    %eax,0x213c
    17b7:	a1 3c 21 00 00       	mov    0x213c,%eax
    17bc:	a3 34 21 00 00       	mov    %eax,0x2134
    base.s.size = 0;
    17c1:	c7 05 38 21 00 00 00 	movl   $0x0,0x2138
    17c8:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    17cb:	8b 45 f0             	mov    -0x10(%ebp),%eax
    17ce:	8b 00                	mov    (%eax),%eax
    17d0:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
    17d3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    17d6:	8b 40 04             	mov    0x4(%eax),%eax
    17d9:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    17dc:	72 4d                	jb     182b <malloc+0xa6>
      if(p->s.size == nunits)
    17de:	8b 45 f4             	mov    -0xc(%ebp),%eax
    17e1:	8b 40 04             	mov    0x4(%eax),%eax
    17e4:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    17e7:	75 0c                	jne    17f5 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
    17e9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    17ec:	8b 10                	mov    (%eax),%edx
    17ee:	8b 45 f0             	mov    -0x10(%ebp),%eax
    17f1:	89 10                	mov    %edx,(%eax)
    17f3:	eb 26                	jmp    181b <malloc+0x96>
      else {
        p->s.size -= nunits;
    17f5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    17f8:	8b 40 04             	mov    0x4(%eax),%eax
    17fb:	2b 45 ec             	sub    -0x14(%ebp),%eax
    17fe:	89 c2                	mov    %eax,%edx
    1800:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1803:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
    1806:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1809:	8b 40 04             	mov    0x4(%eax),%eax
    180c:	c1 e0 03             	shl    $0x3,%eax
    180f:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
    1812:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1815:	8b 55 ec             	mov    -0x14(%ebp),%edx
    1818:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
    181b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    181e:	a3 3c 21 00 00       	mov    %eax,0x213c
      return (void*)(p + 1);
    1823:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1826:	83 c0 08             	add    $0x8,%eax
    1829:	eb 38                	jmp    1863 <malloc+0xde>
    }
    if(p == freep)
    182b:	a1 3c 21 00 00       	mov    0x213c,%eax
    1830:	39 45 f4             	cmp    %eax,-0xc(%ebp)
    1833:	75 1b                	jne    1850 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
    1835:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1838:	89 04 24             	mov    %eax,(%esp)
    183b:	e8 ed fe ff ff       	call   172d <morecore>
    1840:	89 45 f4             	mov    %eax,-0xc(%ebp)
    1843:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1847:	75 07                	jne    1850 <malloc+0xcb>
        return 0;
    1849:	b8 00 00 00 00       	mov    $0x0,%eax
    184e:	eb 13                	jmp    1863 <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1850:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1853:	89 45 f0             	mov    %eax,-0x10(%ebp)
    1856:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1859:	8b 00                	mov    (%eax),%eax
    185b:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
    185e:	e9 70 ff ff ff       	jmp    17d3 <malloc+0x4e>
}
    1863:	c9                   	leave  
    1864:	c3                   	ret    
    1865:	66 90                	xchg   %ax,%ax
    1867:	90                   	nop

00001868 <xchg>:
  asm volatile("sti");
}

static inline uint
xchg(volatile uint *addr, uint newval)
{
    1868:	55                   	push   %ebp
    1869:	89 e5                	mov    %esp,%ebp
    186b:	83 ec 10             	sub    $0x10,%esp
  uint result;
  
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
    186e:	8b 55 08             	mov    0x8(%ebp),%edx
    1871:	8b 45 0c             	mov    0xc(%ebp),%eax
    1874:	8b 4d 08             	mov    0x8(%ebp),%ecx
    1877:	f0 87 02             	lock xchg %eax,(%edx)
    187a:	89 45 fc             	mov    %eax,-0x4(%ebp)
               "+m" (*addr), "=a" (result) :
               "1" (newval) :
               "cc");
  return result;
    187d:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    1880:	c9                   	leave  
    1881:	c3                   	ret    

00001882 <lock_init>:
#include "x86.h"
#include "proc.h"

unsigned long rands = 1;

void lock_init(lock_t *lock){
    1882:	55                   	push   %ebp
    1883:	89 e5                	mov    %esp,%ebp
    lock->locked = 0;
    1885:	8b 45 08             	mov    0x8(%ebp),%eax
    1888:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
    188e:	5d                   	pop    %ebp
    188f:	c3                   	ret    

00001890 <lock_acquire>:
void lock_acquire(lock_t *lock){
    1890:	55                   	push   %ebp
    1891:	89 e5                	mov    %esp,%ebp
    1893:	83 ec 08             	sub    $0x8,%esp
    while(xchg(&lock->locked,1) != 0);
    1896:	90                   	nop
    1897:	8b 45 08             	mov    0x8(%ebp),%eax
    189a:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
    18a1:	00 
    18a2:	89 04 24             	mov    %eax,(%esp)
    18a5:	e8 be ff ff ff       	call   1868 <xchg>
    18aa:	85 c0                	test   %eax,%eax
    18ac:	75 e9                	jne    1897 <lock_acquire+0x7>
}
    18ae:	c9                   	leave  
    18af:	c3                   	ret    

000018b0 <lock_release>:
void lock_release(lock_t *lock){
    18b0:	55                   	push   %ebp
    18b1:	89 e5                	mov    %esp,%ebp
    18b3:	83 ec 08             	sub    $0x8,%esp
    xchg(&lock->locked,0);
    18b6:	8b 45 08             	mov    0x8(%ebp),%eax
    18b9:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    18c0:	00 
    18c1:	89 04 24             	mov    %eax,(%esp)
    18c4:	e8 9f ff ff ff       	call   1868 <xchg>
}
    18c9:	c9                   	leave  
    18ca:	c3                   	ret    

000018cb <thread_create>:


void *thread_create(void(*start_routine)(void*), void *arg){
    18cb:	55                   	push   %ebp
    18cc:	89 e5                	mov    %esp,%ebp
    18ce:	83 ec 28             	sub    $0x28,%esp
    int tid;
    void * stack = malloc(2 * 4096);
    18d1:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
    18d8:	e8 a8 fe ff ff       	call   1785 <malloc>
    18dd:	89 45 f4             	mov    %eax,-0xc(%ebp)
    void *garbage_stack = stack; 
    18e0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    18e3:	89 45 f0             	mov    %eax,-0x10(%ebp)
   // printf(1,"start routine addr : %d\n",(uint)start_routine);


    if((uint)stack % 4096){
    18e6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    18e9:	25 ff 0f 00 00       	and    $0xfff,%eax
    18ee:	85 c0                	test   %eax,%eax
    18f0:	74 14                	je     1906 <thread_create+0x3b>
        stack = stack + (4096 - (uint)stack % 4096);
    18f2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    18f5:	25 ff 0f 00 00       	and    $0xfff,%eax
    18fa:	89 c2                	mov    %eax,%edx
    18fc:	b8 00 10 00 00       	mov    $0x1000,%eax
    1901:	29 d0                	sub    %edx,%eax
    1903:	01 45 f4             	add    %eax,-0xc(%ebp)
    }
    if (stack == 0){
    1906:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    190a:	75 1b                	jne    1927 <thread_create+0x5c>

        printf(1,"malloc fail \n");
    190c:	c7 44 24 04 cb 1c 00 	movl   $0x1ccb,0x4(%esp)
    1913:	00 
    1914:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    191b:	e8 78 fb ff ff       	call   1498 <printf>
        return 0;
    1920:	b8 00 00 00 00       	mov    $0x0,%eax
    1925:	eb 6f                	jmp    1996 <thread_create+0xcb>
    }

    tid = clone((uint)stack,PSIZE,(uint)start_routine,(int)arg);
    1927:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    192a:	8b 55 08             	mov    0x8(%ebp),%edx
    192d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1930:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
    1934:	89 54 24 08          	mov    %edx,0x8(%esp)
    1938:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
    193f:	00 
    1940:	89 04 24             	mov    %eax,(%esp)
    1943:	e8 50 fa ff ff       	call   1398 <clone>
    1948:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(tid < 0){
    194b:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    194f:	79 1b                	jns    196c <thread_create+0xa1>
        printf(1,"clone fails\n");
    1951:	c7 44 24 04 d9 1c 00 	movl   $0x1cd9,0x4(%esp)
    1958:	00 
    1959:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1960:	e8 33 fb ff ff       	call   1498 <printf>
        return 0;
    1965:	b8 00 00 00 00       	mov    $0x0,%eax
    196a:	eb 2a                	jmp    1996 <thread_create+0xcb>
    }
    if(tid > 0){
    196c:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1970:	7e 05                	jle    1977 <thread_create+0xac>
        //store threads on thread table
        return garbage_stack;
    1972:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1975:	eb 1f                	jmp    1996 <thread_create+0xcb>
    }
    if(tid == 0){
    1977:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    197b:	75 14                	jne    1991 <thread_create+0xc6>
        printf(1,"tid = 0 return \n");
    197d:	c7 44 24 04 e6 1c 00 	movl   $0x1ce6,0x4(%esp)
    1984:	00 
    1985:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    198c:	e8 07 fb ff ff       	call   1498 <printf>
    }
//    wait();
//    free(garbage_stack);

    return 0;
    1991:	b8 00 00 00 00       	mov    $0x0,%eax
}
    1996:	c9                   	leave  
    1997:	c3                   	ret    

00001998 <random>:

// generate 0 -> max random number exclude max.
int random(int max){
    1998:	55                   	push   %ebp
    1999:	89 e5                	mov    %esp,%ebp
    rands = rands * 1664525 + 1013904233;
    199b:	a1 30 21 00 00       	mov    0x2130,%eax
    19a0:	69 c0 0d 66 19 00    	imul   $0x19660d,%eax,%eax
    19a6:	05 69 f3 6e 3c       	add    $0x3c6ef369,%eax
    19ab:	a3 30 21 00 00       	mov    %eax,0x2130
    return (int)(rands % max);
    19b0:	a1 30 21 00 00       	mov    0x2130,%eax
    19b5:	8b 4d 08             	mov    0x8(%ebp),%ecx
    19b8:	ba 00 00 00 00       	mov    $0x0,%edx
    19bd:	f7 f1                	div    %ecx
    19bf:	89 d0                	mov    %edx,%eax
}
    19c1:	5d                   	pop    %ebp
    19c2:	c3                   	ret    
    19c3:	90                   	nop

000019c4 <init_q>:
#include "queue.h"
#include "types.h"
#include "user.h"

void init_q(struct queue *q){
    19c4:	55                   	push   %ebp
    19c5:	89 e5                	mov    %esp,%ebp
    q->size = 0;
    19c7:	8b 45 08             	mov    0x8(%ebp),%eax
    19ca:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    q->head = 0;
    19d0:	8b 45 08             	mov    0x8(%ebp),%eax
    19d3:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    q->tail = 0;
    19da:	8b 45 08             	mov    0x8(%ebp),%eax
    19dd:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
}
    19e4:	5d                   	pop    %ebp
    19e5:	c3                   	ret    

000019e6 <add_q>:

void add_q(struct queue *q, int v){
    19e6:	55                   	push   %ebp
    19e7:	89 e5                	mov    %esp,%ebp
    19e9:	83 ec 28             	sub    $0x28,%esp
    struct node * n = malloc(sizeof(struct node));
    19ec:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
    19f3:	e8 8d fd ff ff       	call   1785 <malloc>
    19f8:	89 45 f4             	mov    %eax,-0xc(%ebp)
    n->next = 0;
    19fb:	8b 45 f4             	mov    -0xc(%ebp),%eax
    19fe:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    n->value = v;
    1a05:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1a08:	8b 55 0c             	mov    0xc(%ebp),%edx
    1a0b:	89 10                	mov    %edx,(%eax)
    if(q->head == 0){
    1a0d:	8b 45 08             	mov    0x8(%ebp),%eax
    1a10:	8b 40 04             	mov    0x4(%eax),%eax
    1a13:	85 c0                	test   %eax,%eax
    1a15:	75 0b                	jne    1a22 <add_q+0x3c>
        q->head = n;
    1a17:	8b 45 08             	mov    0x8(%ebp),%eax
    1a1a:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1a1d:	89 50 04             	mov    %edx,0x4(%eax)
    1a20:	eb 0c                	jmp    1a2e <add_q+0x48>
    }else{
        q->tail->next = n;
    1a22:	8b 45 08             	mov    0x8(%ebp),%eax
    1a25:	8b 40 08             	mov    0x8(%eax),%eax
    1a28:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1a2b:	89 50 04             	mov    %edx,0x4(%eax)
    }
    q->tail = n;
    1a2e:	8b 45 08             	mov    0x8(%ebp),%eax
    1a31:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1a34:	89 50 08             	mov    %edx,0x8(%eax)
    q->size++;
    1a37:	8b 45 08             	mov    0x8(%ebp),%eax
    1a3a:	8b 00                	mov    (%eax),%eax
    1a3c:	8d 50 01             	lea    0x1(%eax),%edx
    1a3f:	8b 45 08             	mov    0x8(%ebp),%eax
    1a42:	89 10                	mov    %edx,(%eax)
}
    1a44:	c9                   	leave  
    1a45:	c3                   	ret    

00001a46 <empty_q>:

int empty_q(struct queue *q){
    1a46:	55                   	push   %ebp
    1a47:	89 e5                	mov    %esp,%ebp
    if(q->size == 0)
    1a49:	8b 45 08             	mov    0x8(%ebp),%eax
    1a4c:	8b 00                	mov    (%eax),%eax
    1a4e:	85 c0                	test   %eax,%eax
    1a50:	75 07                	jne    1a59 <empty_q+0x13>
        return 1;
    1a52:	b8 01 00 00 00       	mov    $0x1,%eax
    1a57:	eb 05                	jmp    1a5e <empty_q+0x18>
    else
        return 0;
    1a59:	b8 00 00 00 00       	mov    $0x0,%eax
} 
    1a5e:	5d                   	pop    %ebp
    1a5f:	c3                   	ret    

00001a60 <pop_q>:
int pop_q(struct queue *q){
    1a60:	55                   	push   %ebp
    1a61:	89 e5                	mov    %esp,%ebp
    1a63:	83 ec 28             	sub    $0x28,%esp
    int val;
    struct node *destroy;
    if(!empty_q(q)){
    1a66:	8b 45 08             	mov    0x8(%ebp),%eax
    1a69:	89 04 24             	mov    %eax,(%esp)
    1a6c:	e8 d5 ff ff ff       	call   1a46 <empty_q>
    1a71:	85 c0                	test   %eax,%eax
    1a73:	75 5d                	jne    1ad2 <pop_q+0x72>
       val = q->head->value; 
    1a75:	8b 45 08             	mov    0x8(%ebp),%eax
    1a78:	8b 40 04             	mov    0x4(%eax),%eax
    1a7b:	8b 00                	mov    (%eax),%eax
    1a7d:	89 45 f4             	mov    %eax,-0xc(%ebp)
       destroy = q->head;
    1a80:	8b 45 08             	mov    0x8(%ebp),%eax
    1a83:	8b 40 04             	mov    0x4(%eax),%eax
    1a86:	89 45 f0             	mov    %eax,-0x10(%ebp)
       q->head = q->head->next;
    1a89:	8b 45 08             	mov    0x8(%ebp),%eax
    1a8c:	8b 40 04             	mov    0x4(%eax),%eax
    1a8f:	8b 50 04             	mov    0x4(%eax),%edx
    1a92:	8b 45 08             	mov    0x8(%ebp),%eax
    1a95:	89 50 04             	mov    %edx,0x4(%eax)
       free(destroy);
    1a98:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1a9b:	89 04 24             	mov    %eax,(%esp)
    1a9e:	e8 a9 fb ff ff       	call   164c <free>
       q->size--;
    1aa3:	8b 45 08             	mov    0x8(%ebp),%eax
    1aa6:	8b 00                	mov    (%eax),%eax
    1aa8:	8d 50 ff             	lea    -0x1(%eax),%edx
    1aab:	8b 45 08             	mov    0x8(%ebp),%eax
    1aae:	89 10                	mov    %edx,(%eax)
       if(q->size == 0){
    1ab0:	8b 45 08             	mov    0x8(%ebp),%eax
    1ab3:	8b 00                	mov    (%eax),%eax
    1ab5:	85 c0                	test   %eax,%eax
    1ab7:	75 14                	jne    1acd <pop_q+0x6d>
            q->head = 0;
    1ab9:	8b 45 08             	mov    0x8(%ebp),%eax
    1abc:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
            q->tail = 0;
    1ac3:	8b 45 08             	mov    0x8(%ebp),%eax
    1ac6:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
       }
       return val;
    1acd:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1ad0:	eb 05                	jmp    1ad7 <pop_q+0x77>
    }
    return -1;
    1ad2:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
    1ad7:	c9                   	leave  
    1ad8:	c3                   	ret    

00001ad9 <dominant>:

void dominant(struct queue* q, int i){
    1ad9:	55                   	push   %ebp
    1ada:	89 e5                	mov    %esp,%ebp
    1adc:	83 ec 28             	sub    $0x28,%esp
    struct node * n = malloc(sizeof(struct node));
    1adf:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
    1ae6:	e8 9a fc ff ff       	call   1785 <malloc>
    1aeb:	89 45 f4             	mov    %eax,-0xc(%ebp)
    n->value = i;
    1aee:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1af1:	8b 55 0c             	mov    0xc(%ebp),%edx
    1af4:	89 10                	mov    %edx,(%eax)

    if(q->head == 0){
    1af6:	8b 45 08             	mov    0x8(%ebp),%eax
    1af9:	8b 40 04             	mov    0x4(%eax),%eax
    1afc:	85 c0                	test   %eax,%eax
    1afe:	75 14                	jne    1b14 <dominant+0x3b>
        q->head = n;
    1b00:	8b 45 08             	mov    0x8(%ebp),%eax
    1b03:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1b06:	89 50 04             	mov    %edx,0x4(%eax)
        q->tail = n;
    1b09:	8b 45 08             	mov    0x8(%ebp),%eax
    1b0c:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1b0f:	89 50 08             	mov    %edx,0x8(%eax)
    1b12:	eb 15                	jmp    1b29 <dominant+0x50>
    }
    else{
        n->next = q->head;
    1b14:	8b 45 08             	mov    0x8(%ebp),%eax
    1b17:	8b 50 04             	mov    0x4(%eax),%edx
    1b1a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1b1d:	89 50 04             	mov    %edx,0x4(%eax)
        q->head = n;
    1b20:	8b 45 08             	mov    0x8(%ebp),%eax
    1b23:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1b26:	89 50 04             	mov    %edx,0x4(%eax)
    }
    q->size++;
    1b29:	8b 45 08             	mov    0x8(%ebp),%eax
    1b2c:	8b 00                	mov    (%eax),%eax
    1b2e:	8d 50 01             	lea    0x1(%eax),%edx
    1b31:	8b 45 08             	mov    0x8(%ebp),%eax
    1b34:	89 10                	mov    %edx,(%eax)
}
    1b36:	c9                   	leave  
    1b37:	c3                   	ret    

00001b38 <sem_init>:
#include "semaphore.h"
#include "user.h"

// Initializes the semaphore
void sem_init(struct Semaphore* s, int value){
    1b38:	55                   	push   %ebp
    1b39:	89 e5                	mov    %esp,%ebp
    1b3b:	83 ec 18             	sub    $0x18,%esp
    s->val = value;
    1b3e:	8b 45 08             	mov    0x8(%ebp),%eax
    1b41:	8b 55 0c             	mov    0xc(%ebp),%edx
    1b44:	89 10                	mov    %edx,(%eax)
    lock_init(&s->lock);
    1b46:	8b 45 08             	mov    0x8(%ebp),%eax
    1b49:	83 c0 04             	add    $0x4,%eax
    1b4c:	89 04 24             	mov    %eax,(%esp)
    1b4f:	e8 2e fd ff ff       	call   1882 <lock_init>
    init_q(&s->q);
    1b54:	8b 45 08             	mov    0x8(%ebp),%eax
    1b57:	83 c0 08             	add    $0x8,%eax
    1b5a:	89 04 24             	mov    %eax,(%esp)
    1b5d:	e8 62 fe ff ff       	call   19c4 <init_q>
}
    1b62:	c9                   	leave  
    1b63:	c3                   	ret    

00001b64 <sem_acquire>:

// Decrements the semaphore
void sem_acquire(struct Semaphore* s){
    1b64:	55                   	push   %ebp
    1b65:	89 e5                	mov    %esp,%ebp
    1b67:	83 ec 28             	sub    $0x28,%esp
    lock_acquire(&s->lock);
    1b6a:	8b 45 08             	mov    0x8(%ebp),%eax
    1b6d:	83 c0 04             	add    $0x4,%eax
    1b70:	89 04 24             	mov    %eax,(%esp)
    1b73:	e8 18 fd ff ff       	call   1890 <lock_acquire>

    if(s->val == 0){
    1b78:	8b 45 08             	mov    0x8(%ebp),%eax
    1b7b:	8b 00                	mov    (%eax),%eax
    1b7d:	85 c0                	test   %eax,%eax
    1b7f:	75 32                	jne    1bb3 <sem_acquire+0x4f>
        int pid;
        pid = getpid();
    1b81:	e8 f2 f7 ff ff       	call   1378 <getpid>
    1b86:	89 45 f4             	mov    %eax,-0xc(%ebp)
        add_q(&s->q, pid);
    1b89:	8b 45 08             	mov    0x8(%ebp),%eax
    1b8c:	8d 50 08             	lea    0x8(%eax),%edx
    1b8f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1b92:	89 44 24 04          	mov    %eax,0x4(%esp)
    1b96:	89 14 24             	mov    %edx,(%esp)
    1b99:	e8 48 fe ff ff       	call   19e6 <add_q>
        lock_release(&s->lock);
    1b9e:	8b 45 08             	mov    0x8(%ebp),%eax
    1ba1:	83 c0 04             	add    $0x4,%eax
    1ba4:	89 04 24             	mov    %eax,(%esp)
    1ba7:	e8 04 fd ff ff       	call   18b0 <lock_release>
        tsleep();
    1bac:	e8 f7 f7 ff ff       	call   13a8 <tsleep>
    1bb1:	eb 1b                	jmp    1bce <sem_acquire+0x6a>
    }
    else{
        s->val--;
    1bb3:	8b 45 08             	mov    0x8(%ebp),%eax
    1bb6:	8b 00                	mov    (%eax),%eax
    1bb8:	8d 50 ff             	lea    -0x1(%eax),%edx
    1bbb:	8b 45 08             	mov    0x8(%ebp),%eax
    1bbe:	89 10                	mov    %edx,(%eax)
        lock_release(&s->lock);
    1bc0:	8b 45 08             	mov    0x8(%ebp),%eax
    1bc3:	83 c0 04             	add    $0x4,%eax
    1bc6:	89 04 24             	mov    %eax,(%esp)
    1bc9:	e8 e2 fc ff ff       	call   18b0 <lock_release>
    }
}
    1bce:	c9                   	leave  
    1bcf:	c3                   	ret    

00001bd0 <sem_signal>:

// Increments the semaphore
void sem_signal(struct Semaphore* s){
    1bd0:	55                   	push   %ebp
    1bd1:	89 e5                	mov    %esp,%ebp
    1bd3:	83 ec 18             	sub    $0x18,%esp
    lock_acquire(&s->lock);
    1bd6:	8b 45 08             	mov    0x8(%ebp),%eax
    1bd9:	83 c0 04             	add    $0x4,%eax
    1bdc:	89 04 24             	mov    %eax,(%esp)
    1bdf:	e8 ac fc ff ff       	call   1890 <lock_acquire>

    if(!empty_q(&s->q)){
    1be4:	8b 45 08             	mov    0x8(%ebp),%eax
    1be7:	83 c0 08             	add    $0x8,%eax
    1bea:	89 04 24             	mov    %eax,(%esp)
    1bed:	e8 54 fe ff ff       	call   1a46 <empty_q>
    1bf2:	85 c0                	test   %eax,%eax
    1bf4:	75 18                	jne    1c0e <sem_signal+0x3e>
        twakeup(pop_q(&s->q));
    1bf6:	8b 45 08             	mov    0x8(%ebp),%eax
    1bf9:	83 c0 08             	add    $0x8,%eax
    1bfc:	89 04 24             	mov    %eax,(%esp)
    1bff:	e8 5c fe ff ff       	call   1a60 <pop_q>
    1c04:	89 04 24             	mov    %eax,(%esp)
    1c07:	e8 a4 f7 ff ff       	call   13b0 <twakeup>
    1c0c:	eb 0d                	jmp    1c1b <sem_signal+0x4b>
    }
    else{
        s->val++;
    1c0e:	8b 45 08             	mov    0x8(%ebp),%eax
    1c11:	8b 00                	mov    (%eax),%eax
    1c13:	8d 50 01             	lea    0x1(%eax),%edx
    1c16:	8b 45 08             	mov    0x8(%ebp),%eax
    1c19:	89 10                	mov    %edx,(%eax)
    }

    lock_release(&s->lock);
    1c1b:	8b 45 08             	mov    0x8(%ebp),%eax
    1c1e:	83 c0 04             	add    $0x4,%eax
    1c21:	89 04 24             	mov    %eax,(%esp)
    1c24:	e8 87 fc ff ff       	call   18b0 <lock_release>
}
    1c29:	c9                   	leave  
    1c2a:	c3                   	ret    

00001c2b <sem_dom_acquire>:

void sem_dom_acquire(struct Semaphore* s){
    1c2b:	55                   	push   %ebp
    1c2c:	89 e5                	mov    %esp,%ebp
    1c2e:	83 ec 18             	sub    $0x18,%esp
    lock_acquire(&s->lock);
    1c31:	8b 45 08             	mov    0x8(%ebp),%eax
    1c34:	83 c0 04             	add    $0x4,%eax
    1c37:	89 04 24             	mov    %eax,(%esp)
    1c3a:	e8 51 fc ff ff       	call   1890 <lock_acquire>

    if(s->val > 0){
    1c3f:	8b 45 08             	mov    0x8(%ebp),%eax
    1c42:	8b 00                	mov    (%eax),%eax
    1c44:	85 c0                	test   %eax,%eax
    1c46:	7e 1d                	jle    1c65 <sem_dom_acquire+0x3a>
        s->val--;
    1c48:	8b 45 08             	mov    0x8(%ebp),%eax
    1c4b:	8b 00                	mov    (%eax),%eax
    1c4d:	8d 50 ff             	lea    -0x1(%eax),%edx
    1c50:	8b 45 08             	mov    0x8(%ebp),%eax
    1c53:	89 10                	mov    %edx,(%eax)
        lock_release(&s->lock);
    1c55:	8b 45 08             	mov    0x8(%ebp),%eax
    1c58:	83 c0 04             	add    $0x4,%eax
    1c5b:	89 04 24             	mov    %eax,(%esp)
    1c5e:	e8 4d fc ff ff       	call   18b0 <lock_release>
        return;
    1c63:	eb 2a                	jmp    1c8f <sem_dom_acquire+0x64>
    }

    dominant(&s->q,getpid());
    1c65:	e8 0e f7 ff ff       	call   1378 <getpid>
    1c6a:	8b 55 08             	mov    0x8(%ebp),%edx
    1c6d:	83 c2 08             	add    $0x8,%edx
    1c70:	89 44 24 04          	mov    %eax,0x4(%esp)
    1c74:	89 14 24             	mov    %edx,(%esp)
    1c77:	e8 5d fe ff ff       	call   1ad9 <dominant>
    lock_release(&s->lock);
    1c7c:	8b 45 08             	mov    0x8(%ebp),%eax
    1c7f:	83 c0 04             	add    $0x4,%eax
    1c82:	89 04 24             	mov    %eax,(%esp)
    1c85:	e8 26 fc ff ff       	call   18b0 <lock_release>
    tsleep();
    1c8a:	e8 19 f7 ff ff       	call   13a8 <tsleep>
}
    1c8f:	c9                   	leave  
    1c90:	c3                   	ret    
