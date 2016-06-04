
_kill:     file format elf32-i386


Disassembly of section .text:

00001000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char **argv)
{
    1000:	55                   	push   %ebp
    1001:	89 e5                	mov    %esp,%ebp
    1003:	83 e4 f0             	and    $0xfffffff0,%esp
    1006:	83 ec 20             	sub    $0x20,%esp
  int i;

  if(argc < 1){
    1009:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    100d:	7f 19                	jg     1028 <main+0x28>
    printf(2, "usage: kill pid...\n");
    100f:	c7 44 24 04 69 1c 00 	movl   $0x1c69,0x4(%esp)
    1016:	00 
    1017:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
    101e:	e8 4d 04 00 00       	call   1470 <printf>
    exit();
    1023:	e8 a8 02 00 00       	call   12d0 <exit>
  }
  for(i=1; i<argc; i++)
    1028:	c7 44 24 1c 01 00 00 	movl   $0x1,0x1c(%esp)
    102f:	00 
    1030:	eb 27                	jmp    1059 <main+0x59>
    kill(atoi(argv[i]));
    1032:	8b 44 24 1c          	mov    0x1c(%esp),%eax
    1036:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
    103d:	8b 45 0c             	mov    0xc(%ebp),%eax
    1040:	01 d0                	add    %edx,%eax
    1042:	8b 00                	mov    (%eax),%eax
    1044:	89 04 24             	mov    %eax,(%esp)
    1047:	e8 f2 01 00 00       	call   123e <atoi>
    104c:	89 04 24             	mov    %eax,(%esp)
    104f:	e8 ac 02 00 00       	call   1300 <kill>

  if(argc < 1){
    printf(2, "usage: kill pid...\n");
    exit();
  }
  for(i=1; i<argc; i++)
    1054:	83 44 24 1c 01       	addl   $0x1,0x1c(%esp)
    1059:	8b 44 24 1c          	mov    0x1c(%esp),%eax
    105d:	3b 45 08             	cmp    0x8(%ebp),%eax
    1060:	7c d0                	jl     1032 <main+0x32>
    kill(atoi(argv[i]));
  exit();
    1062:	e8 69 02 00 00       	call   12d0 <exit>
    1067:	90                   	nop

00001068 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
    1068:	55                   	push   %ebp
    1069:	89 e5                	mov    %esp,%ebp
    106b:	57                   	push   %edi
    106c:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
    106d:	8b 4d 08             	mov    0x8(%ebp),%ecx
    1070:	8b 55 10             	mov    0x10(%ebp),%edx
    1073:	8b 45 0c             	mov    0xc(%ebp),%eax
    1076:	89 cb                	mov    %ecx,%ebx
    1078:	89 df                	mov    %ebx,%edi
    107a:	89 d1                	mov    %edx,%ecx
    107c:	fc                   	cld    
    107d:	f3 aa                	rep stos %al,%es:(%edi)
    107f:	89 ca                	mov    %ecx,%edx
    1081:	89 fb                	mov    %edi,%ebx
    1083:	89 5d 08             	mov    %ebx,0x8(%ebp)
    1086:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
    1089:	5b                   	pop    %ebx
    108a:	5f                   	pop    %edi
    108b:	5d                   	pop    %ebp
    108c:	c3                   	ret    

0000108d <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
    108d:	55                   	push   %ebp
    108e:	89 e5                	mov    %esp,%ebp
    1090:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
    1093:	8b 45 08             	mov    0x8(%ebp),%eax
    1096:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
    1099:	90                   	nop
    109a:	8b 45 08             	mov    0x8(%ebp),%eax
    109d:	8d 50 01             	lea    0x1(%eax),%edx
    10a0:	89 55 08             	mov    %edx,0x8(%ebp)
    10a3:	8b 55 0c             	mov    0xc(%ebp),%edx
    10a6:	8d 4a 01             	lea    0x1(%edx),%ecx
    10a9:	89 4d 0c             	mov    %ecx,0xc(%ebp)
    10ac:	0f b6 12             	movzbl (%edx),%edx
    10af:	88 10                	mov    %dl,(%eax)
    10b1:	0f b6 00             	movzbl (%eax),%eax
    10b4:	84 c0                	test   %al,%al
    10b6:	75 e2                	jne    109a <strcpy+0xd>
    ;
  return os;
    10b8:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    10bb:	c9                   	leave  
    10bc:	c3                   	ret    

000010bd <strcmp>:

int
strcmp(const char *p, const char *q)
{
    10bd:	55                   	push   %ebp
    10be:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
    10c0:	eb 08                	jmp    10ca <strcmp+0xd>
    p++, q++;
    10c2:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    10c6:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    10ca:	8b 45 08             	mov    0x8(%ebp),%eax
    10cd:	0f b6 00             	movzbl (%eax),%eax
    10d0:	84 c0                	test   %al,%al
    10d2:	74 10                	je     10e4 <strcmp+0x27>
    10d4:	8b 45 08             	mov    0x8(%ebp),%eax
    10d7:	0f b6 10             	movzbl (%eax),%edx
    10da:	8b 45 0c             	mov    0xc(%ebp),%eax
    10dd:	0f b6 00             	movzbl (%eax),%eax
    10e0:	38 c2                	cmp    %al,%dl
    10e2:	74 de                	je     10c2 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
    10e4:	8b 45 08             	mov    0x8(%ebp),%eax
    10e7:	0f b6 00             	movzbl (%eax),%eax
    10ea:	0f b6 d0             	movzbl %al,%edx
    10ed:	8b 45 0c             	mov    0xc(%ebp),%eax
    10f0:	0f b6 00             	movzbl (%eax),%eax
    10f3:	0f b6 c0             	movzbl %al,%eax
    10f6:	29 c2                	sub    %eax,%edx
    10f8:	89 d0                	mov    %edx,%eax
}
    10fa:	5d                   	pop    %ebp
    10fb:	c3                   	ret    

000010fc <strlen>:

uint
strlen(char *s)
{
    10fc:	55                   	push   %ebp
    10fd:	89 e5                	mov    %esp,%ebp
    10ff:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
    1102:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    1109:	eb 04                	jmp    110f <strlen+0x13>
    110b:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    110f:	8b 55 fc             	mov    -0x4(%ebp),%edx
    1112:	8b 45 08             	mov    0x8(%ebp),%eax
    1115:	01 d0                	add    %edx,%eax
    1117:	0f b6 00             	movzbl (%eax),%eax
    111a:	84 c0                	test   %al,%al
    111c:	75 ed                	jne    110b <strlen+0xf>
    ;
  return n;
    111e:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    1121:	c9                   	leave  
    1122:	c3                   	ret    

00001123 <memset>:

void*
memset(void *dst, int c, uint n)
{
    1123:	55                   	push   %ebp
    1124:	89 e5                	mov    %esp,%ebp
    1126:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
    1129:	8b 45 10             	mov    0x10(%ebp),%eax
    112c:	89 44 24 08          	mov    %eax,0x8(%esp)
    1130:	8b 45 0c             	mov    0xc(%ebp),%eax
    1133:	89 44 24 04          	mov    %eax,0x4(%esp)
    1137:	8b 45 08             	mov    0x8(%ebp),%eax
    113a:	89 04 24             	mov    %eax,(%esp)
    113d:	e8 26 ff ff ff       	call   1068 <stosb>
  return dst;
    1142:	8b 45 08             	mov    0x8(%ebp),%eax
}
    1145:	c9                   	leave  
    1146:	c3                   	ret    

00001147 <strchr>:

char*
strchr(const char *s, char c)
{
    1147:	55                   	push   %ebp
    1148:	89 e5                	mov    %esp,%ebp
    114a:	83 ec 04             	sub    $0x4,%esp
    114d:	8b 45 0c             	mov    0xc(%ebp),%eax
    1150:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
    1153:	eb 14                	jmp    1169 <strchr+0x22>
    if(*s == c)
    1155:	8b 45 08             	mov    0x8(%ebp),%eax
    1158:	0f b6 00             	movzbl (%eax),%eax
    115b:	3a 45 fc             	cmp    -0x4(%ebp),%al
    115e:	75 05                	jne    1165 <strchr+0x1e>
      return (char*)s;
    1160:	8b 45 08             	mov    0x8(%ebp),%eax
    1163:	eb 13                	jmp    1178 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
    1165:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    1169:	8b 45 08             	mov    0x8(%ebp),%eax
    116c:	0f b6 00             	movzbl (%eax),%eax
    116f:	84 c0                	test   %al,%al
    1171:	75 e2                	jne    1155 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
    1173:	b8 00 00 00 00       	mov    $0x0,%eax
}
    1178:	c9                   	leave  
    1179:	c3                   	ret    

0000117a <gets>:

char*
gets(char *buf, int max)
{
    117a:	55                   	push   %ebp
    117b:	89 e5                	mov    %esp,%ebp
    117d:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1180:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    1187:	eb 4c                	jmp    11d5 <gets+0x5b>
    cc = read(0, &c, 1);
    1189:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    1190:	00 
    1191:	8d 45 ef             	lea    -0x11(%ebp),%eax
    1194:	89 44 24 04          	mov    %eax,0x4(%esp)
    1198:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    119f:	e8 44 01 00 00       	call   12e8 <read>
    11a4:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
    11a7:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    11ab:	7f 02                	jg     11af <gets+0x35>
      break;
    11ad:	eb 31                	jmp    11e0 <gets+0x66>
    buf[i++] = c;
    11af:	8b 45 f4             	mov    -0xc(%ebp),%eax
    11b2:	8d 50 01             	lea    0x1(%eax),%edx
    11b5:	89 55 f4             	mov    %edx,-0xc(%ebp)
    11b8:	89 c2                	mov    %eax,%edx
    11ba:	8b 45 08             	mov    0x8(%ebp),%eax
    11bd:	01 c2                	add    %eax,%edx
    11bf:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    11c3:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
    11c5:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    11c9:	3c 0a                	cmp    $0xa,%al
    11cb:	74 13                	je     11e0 <gets+0x66>
    11cd:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    11d1:	3c 0d                	cmp    $0xd,%al
    11d3:	74 0b                	je     11e0 <gets+0x66>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    11d5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    11d8:	83 c0 01             	add    $0x1,%eax
    11db:	3b 45 0c             	cmp    0xc(%ebp),%eax
    11de:	7c a9                	jl     1189 <gets+0xf>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    11e0:	8b 55 f4             	mov    -0xc(%ebp),%edx
    11e3:	8b 45 08             	mov    0x8(%ebp),%eax
    11e6:	01 d0                	add    %edx,%eax
    11e8:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
    11eb:	8b 45 08             	mov    0x8(%ebp),%eax
}
    11ee:	c9                   	leave  
    11ef:	c3                   	ret    

000011f0 <stat>:

int
stat(char *n, struct stat *st)
{
    11f0:	55                   	push   %ebp
    11f1:	89 e5                	mov    %esp,%ebp
    11f3:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    11f6:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    11fd:	00 
    11fe:	8b 45 08             	mov    0x8(%ebp),%eax
    1201:	89 04 24             	mov    %eax,(%esp)
    1204:	e8 07 01 00 00       	call   1310 <open>
    1209:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
    120c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1210:	79 07                	jns    1219 <stat+0x29>
    return -1;
    1212:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    1217:	eb 23                	jmp    123c <stat+0x4c>
  r = fstat(fd, st);
    1219:	8b 45 0c             	mov    0xc(%ebp),%eax
    121c:	89 44 24 04          	mov    %eax,0x4(%esp)
    1220:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1223:	89 04 24             	mov    %eax,(%esp)
    1226:	e8 fd 00 00 00       	call   1328 <fstat>
    122b:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
    122e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1231:	89 04 24             	mov    %eax,(%esp)
    1234:	e8 bf 00 00 00       	call   12f8 <close>
  return r;
    1239:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
    123c:	c9                   	leave  
    123d:	c3                   	ret    

0000123e <atoi>:

int
atoi(const char *s)
{
    123e:	55                   	push   %ebp
    123f:	89 e5                	mov    %esp,%ebp
    1241:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
    1244:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
    124b:	eb 25                	jmp    1272 <atoi+0x34>
    n = n*10 + *s++ - '0';
    124d:	8b 55 fc             	mov    -0x4(%ebp),%edx
    1250:	89 d0                	mov    %edx,%eax
    1252:	c1 e0 02             	shl    $0x2,%eax
    1255:	01 d0                	add    %edx,%eax
    1257:	01 c0                	add    %eax,%eax
    1259:	89 c1                	mov    %eax,%ecx
    125b:	8b 45 08             	mov    0x8(%ebp),%eax
    125e:	8d 50 01             	lea    0x1(%eax),%edx
    1261:	89 55 08             	mov    %edx,0x8(%ebp)
    1264:	0f b6 00             	movzbl (%eax),%eax
    1267:	0f be c0             	movsbl %al,%eax
    126a:	01 c8                	add    %ecx,%eax
    126c:	83 e8 30             	sub    $0x30,%eax
    126f:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    1272:	8b 45 08             	mov    0x8(%ebp),%eax
    1275:	0f b6 00             	movzbl (%eax),%eax
    1278:	3c 2f                	cmp    $0x2f,%al
    127a:	7e 0a                	jle    1286 <atoi+0x48>
    127c:	8b 45 08             	mov    0x8(%ebp),%eax
    127f:	0f b6 00             	movzbl (%eax),%eax
    1282:	3c 39                	cmp    $0x39,%al
    1284:	7e c7                	jle    124d <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
    1286:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    1289:	c9                   	leave  
    128a:	c3                   	ret    

0000128b <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    128b:	55                   	push   %ebp
    128c:	89 e5                	mov    %esp,%ebp
    128e:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
    1291:	8b 45 08             	mov    0x8(%ebp),%eax
    1294:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
    1297:	8b 45 0c             	mov    0xc(%ebp),%eax
    129a:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
    129d:	eb 17                	jmp    12b6 <memmove+0x2b>
    *dst++ = *src++;
    129f:	8b 45 fc             	mov    -0x4(%ebp),%eax
    12a2:	8d 50 01             	lea    0x1(%eax),%edx
    12a5:	89 55 fc             	mov    %edx,-0x4(%ebp)
    12a8:	8b 55 f8             	mov    -0x8(%ebp),%edx
    12ab:	8d 4a 01             	lea    0x1(%edx),%ecx
    12ae:	89 4d f8             	mov    %ecx,-0x8(%ebp)
    12b1:	0f b6 12             	movzbl (%edx),%edx
    12b4:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    12b6:	8b 45 10             	mov    0x10(%ebp),%eax
    12b9:	8d 50 ff             	lea    -0x1(%eax),%edx
    12bc:	89 55 10             	mov    %edx,0x10(%ebp)
    12bf:	85 c0                	test   %eax,%eax
    12c1:	7f dc                	jg     129f <memmove+0x14>
    *dst++ = *src++;
  return vdst;
    12c3:	8b 45 08             	mov    0x8(%ebp),%eax
}
    12c6:	c9                   	leave  
    12c7:	c3                   	ret    

000012c8 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    12c8:	b8 01 00 00 00       	mov    $0x1,%eax
    12cd:	cd 40                	int    $0x40
    12cf:	c3                   	ret    

000012d0 <exit>:
SYSCALL(exit)
    12d0:	b8 02 00 00 00       	mov    $0x2,%eax
    12d5:	cd 40                	int    $0x40
    12d7:	c3                   	ret    

000012d8 <wait>:
SYSCALL(wait)
    12d8:	b8 03 00 00 00       	mov    $0x3,%eax
    12dd:	cd 40                	int    $0x40
    12df:	c3                   	ret    

000012e0 <pipe>:
SYSCALL(pipe)
    12e0:	b8 04 00 00 00       	mov    $0x4,%eax
    12e5:	cd 40                	int    $0x40
    12e7:	c3                   	ret    

000012e8 <read>:
SYSCALL(read)
    12e8:	b8 05 00 00 00       	mov    $0x5,%eax
    12ed:	cd 40                	int    $0x40
    12ef:	c3                   	ret    

000012f0 <write>:
SYSCALL(write)
    12f0:	b8 10 00 00 00       	mov    $0x10,%eax
    12f5:	cd 40                	int    $0x40
    12f7:	c3                   	ret    

000012f8 <close>:
SYSCALL(close)
    12f8:	b8 15 00 00 00       	mov    $0x15,%eax
    12fd:	cd 40                	int    $0x40
    12ff:	c3                   	ret    

00001300 <kill>:
SYSCALL(kill)
    1300:	b8 06 00 00 00       	mov    $0x6,%eax
    1305:	cd 40                	int    $0x40
    1307:	c3                   	ret    

00001308 <exec>:
SYSCALL(exec)
    1308:	b8 07 00 00 00       	mov    $0x7,%eax
    130d:	cd 40                	int    $0x40
    130f:	c3                   	ret    

00001310 <open>:
SYSCALL(open)
    1310:	b8 0f 00 00 00       	mov    $0xf,%eax
    1315:	cd 40                	int    $0x40
    1317:	c3                   	ret    

00001318 <mknod>:
SYSCALL(mknod)
    1318:	b8 11 00 00 00       	mov    $0x11,%eax
    131d:	cd 40                	int    $0x40
    131f:	c3                   	ret    

00001320 <unlink>:
SYSCALL(unlink)
    1320:	b8 12 00 00 00       	mov    $0x12,%eax
    1325:	cd 40                	int    $0x40
    1327:	c3                   	ret    

00001328 <fstat>:
SYSCALL(fstat)
    1328:	b8 08 00 00 00       	mov    $0x8,%eax
    132d:	cd 40                	int    $0x40
    132f:	c3                   	ret    

00001330 <link>:
SYSCALL(link)
    1330:	b8 13 00 00 00       	mov    $0x13,%eax
    1335:	cd 40                	int    $0x40
    1337:	c3                   	ret    

00001338 <mkdir>:
SYSCALL(mkdir)
    1338:	b8 14 00 00 00       	mov    $0x14,%eax
    133d:	cd 40                	int    $0x40
    133f:	c3                   	ret    

00001340 <chdir>:
SYSCALL(chdir)
    1340:	b8 09 00 00 00       	mov    $0x9,%eax
    1345:	cd 40                	int    $0x40
    1347:	c3                   	ret    

00001348 <dup>:
SYSCALL(dup)
    1348:	b8 0a 00 00 00       	mov    $0xa,%eax
    134d:	cd 40                	int    $0x40
    134f:	c3                   	ret    

00001350 <getpid>:
SYSCALL(getpid)
    1350:	b8 0b 00 00 00       	mov    $0xb,%eax
    1355:	cd 40                	int    $0x40
    1357:	c3                   	ret    

00001358 <sbrk>:
SYSCALL(sbrk)
    1358:	b8 0c 00 00 00       	mov    $0xc,%eax
    135d:	cd 40                	int    $0x40
    135f:	c3                   	ret    

00001360 <sleep>:
SYSCALL(sleep)
    1360:	b8 0d 00 00 00       	mov    $0xd,%eax
    1365:	cd 40                	int    $0x40
    1367:	c3                   	ret    

00001368 <uptime>:
SYSCALL(uptime)
    1368:	b8 0e 00 00 00       	mov    $0xe,%eax
    136d:	cd 40                	int    $0x40
    136f:	c3                   	ret    

00001370 <clone>:
SYSCALL(clone)
    1370:	b8 16 00 00 00       	mov    $0x16,%eax
    1375:	cd 40                	int    $0x40
    1377:	c3                   	ret    

00001378 <texit>:
SYSCALL(texit)
    1378:	b8 17 00 00 00       	mov    $0x17,%eax
    137d:	cd 40                	int    $0x40
    137f:	c3                   	ret    

00001380 <tsleep>:
SYSCALL(tsleep)
    1380:	b8 18 00 00 00       	mov    $0x18,%eax
    1385:	cd 40                	int    $0x40
    1387:	c3                   	ret    

00001388 <twakeup>:
SYSCALL(twakeup)
    1388:	b8 19 00 00 00       	mov    $0x19,%eax
    138d:	cd 40                	int    $0x40
    138f:	c3                   	ret    

00001390 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
    1390:	55                   	push   %ebp
    1391:	89 e5                	mov    %esp,%ebp
    1393:	83 ec 18             	sub    $0x18,%esp
    1396:	8b 45 0c             	mov    0xc(%ebp),%eax
    1399:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
    139c:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    13a3:	00 
    13a4:	8d 45 f4             	lea    -0xc(%ebp),%eax
    13a7:	89 44 24 04          	mov    %eax,0x4(%esp)
    13ab:	8b 45 08             	mov    0x8(%ebp),%eax
    13ae:	89 04 24             	mov    %eax,(%esp)
    13b1:	e8 3a ff ff ff       	call   12f0 <write>
}
    13b6:	c9                   	leave  
    13b7:	c3                   	ret    

000013b8 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
    13b8:	55                   	push   %ebp
    13b9:	89 e5                	mov    %esp,%ebp
    13bb:	56                   	push   %esi
    13bc:	53                   	push   %ebx
    13bd:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    13c0:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
    13c7:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
    13cb:	74 17                	je     13e4 <printint+0x2c>
    13cd:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    13d1:	79 11                	jns    13e4 <printint+0x2c>
    neg = 1;
    13d3:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
    13da:	8b 45 0c             	mov    0xc(%ebp),%eax
    13dd:	f7 d8                	neg    %eax
    13df:	89 45 ec             	mov    %eax,-0x14(%ebp)
    13e2:	eb 06                	jmp    13ea <printint+0x32>
  } else {
    x = xx;
    13e4:	8b 45 0c             	mov    0xc(%ebp),%eax
    13e7:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
    13ea:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
    13f1:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    13f4:	8d 41 01             	lea    0x1(%ecx),%eax
    13f7:	89 45 f4             	mov    %eax,-0xc(%ebp)
    13fa:	8b 5d 10             	mov    0x10(%ebp),%ebx
    13fd:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1400:	ba 00 00 00 00       	mov    $0x0,%edx
    1405:	f7 f3                	div    %ebx
    1407:	89 d0                	mov    %edx,%eax
    1409:	0f b6 80 d4 20 00 00 	movzbl 0x20d4(%eax),%eax
    1410:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
    1414:	8b 75 10             	mov    0x10(%ebp),%esi
    1417:	8b 45 ec             	mov    -0x14(%ebp),%eax
    141a:	ba 00 00 00 00       	mov    $0x0,%edx
    141f:	f7 f6                	div    %esi
    1421:	89 45 ec             	mov    %eax,-0x14(%ebp)
    1424:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1428:	75 c7                	jne    13f1 <printint+0x39>
  if(neg)
    142a:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    142e:	74 10                	je     1440 <printint+0x88>
    buf[i++] = '-';
    1430:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1433:	8d 50 01             	lea    0x1(%eax),%edx
    1436:	89 55 f4             	mov    %edx,-0xc(%ebp)
    1439:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
    143e:	eb 1f                	jmp    145f <printint+0xa7>
    1440:	eb 1d                	jmp    145f <printint+0xa7>
    putc(fd, buf[i]);
    1442:	8d 55 dc             	lea    -0x24(%ebp),%edx
    1445:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1448:	01 d0                	add    %edx,%eax
    144a:	0f b6 00             	movzbl (%eax),%eax
    144d:	0f be c0             	movsbl %al,%eax
    1450:	89 44 24 04          	mov    %eax,0x4(%esp)
    1454:	8b 45 08             	mov    0x8(%ebp),%eax
    1457:	89 04 24             	mov    %eax,(%esp)
    145a:	e8 31 ff ff ff       	call   1390 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    145f:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    1463:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1467:	79 d9                	jns    1442 <printint+0x8a>
    putc(fd, buf[i]);
}
    1469:	83 c4 30             	add    $0x30,%esp
    146c:	5b                   	pop    %ebx
    146d:	5e                   	pop    %esi
    146e:	5d                   	pop    %ebp
    146f:	c3                   	ret    

00001470 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    1470:	55                   	push   %ebp
    1471:	89 e5                	mov    %esp,%ebp
    1473:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
    1476:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
    147d:	8d 45 0c             	lea    0xc(%ebp),%eax
    1480:	83 c0 04             	add    $0x4,%eax
    1483:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
    1486:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    148d:	e9 7c 01 00 00       	jmp    160e <printf+0x19e>
    c = fmt[i] & 0xff;
    1492:	8b 55 0c             	mov    0xc(%ebp),%edx
    1495:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1498:	01 d0                	add    %edx,%eax
    149a:	0f b6 00             	movzbl (%eax),%eax
    149d:	0f be c0             	movsbl %al,%eax
    14a0:	25 ff 00 00 00       	and    $0xff,%eax
    14a5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
    14a8:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    14ac:	75 2c                	jne    14da <printf+0x6a>
      if(c == '%'){
    14ae:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    14b2:	75 0c                	jne    14c0 <printf+0x50>
        state = '%';
    14b4:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
    14bb:	e9 4a 01 00 00       	jmp    160a <printf+0x19a>
      } else {
        putc(fd, c);
    14c0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    14c3:	0f be c0             	movsbl %al,%eax
    14c6:	89 44 24 04          	mov    %eax,0x4(%esp)
    14ca:	8b 45 08             	mov    0x8(%ebp),%eax
    14cd:	89 04 24             	mov    %eax,(%esp)
    14d0:	e8 bb fe ff ff       	call   1390 <putc>
    14d5:	e9 30 01 00 00       	jmp    160a <printf+0x19a>
      }
    } else if(state == '%'){
    14da:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
    14de:	0f 85 26 01 00 00    	jne    160a <printf+0x19a>
      if(c == 'd'){
    14e4:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
    14e8:	75 2d                	jne    1517 <printf+0xa7>
        printint(fd, *ap, 10, 1);
    14ea:	8b 45 e8             	mov    -0x18(%ebp),%eax
    14ed:	8b 00                	mov    (%eax),%eax
    14ef:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    14f6:	00 
    14f7:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
    14fe:	00 
    14ff:	89 44 24 04          	mov    %eax,0x4(%esp)
    1503:	8b 45 08             	mov    0x8(%ebp),%eax
    1506:	89 04 24             	mov    %eax,(%esp)
    1509:	e8 aa fe ff ff       	call   13b8 <printint>
        ap++;
    150e:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    1512:	e9 ec 00 00 00       	jmp    1603 <printf+0x193>
      } else if(c == 'x' || c == 'p'){
    1517:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
    151b:	74 06                	je     1523 <printf+0xb3>
    151d:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
    1521:	75 2d                	jne    1550 <printf+0xe0>
        printint(fd, *ap, 16, 0);
    1523:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1526:	8b 00                	mov    (%eax),%eax
    1528:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    152f:	00 
    1530:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
    1537:	00 
    1538:	89 44 24 04          	mov    %eax,0x4(%esp)
    153c:	8b 45 08             	mov    0x8(%ebp),%eax
    153f:	89 04 24             	mov    %eax,(%esp)
    1542:	e8 71 fe ff ff       	call   13b8 <printint>
        ap++;
    1547:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    154b:	e9 b3 00 00 00       	jmp    1603 <printf+0x193>
      } else if(c == 's'){
    1550:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
    1554:	75 45                	jne    159b <printf+0x12b>
        s = (char*)*ap;
    1556:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1559:	8b 00                	mov    (%eax),%eax
    155b:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
    155e:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
    1562:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1566:	75 09                	jne    1571 <printf+0x101>
          s = "(null)";
    1568:	c7 45 f4 7d 1c 00 00 	movl   $0x1c7d,-0xc(%ebp)
        while(*s != 0){
    156f:	eb 1e                	jmp    158f <printf+0x11f>
    1571:	eb 1c                	jmp    158f <printf+0x11f>
          putc(fd, *s);
    1573:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1576:	0f b6 00             	movzbl (%eax),%eax
    1579:	0f be c0             	movsbl %al,%eax
    157c:	89 44 24 04          	mov    %eax,0x4(%esp)
    1580:	8b 45 08             	mov    0x8(%ebp),%eax
    1583:	89 04 24             	mov    %eax,(%esp)
    1586:	e8 05 fe ff ff       	call   1390 <putc>
          s++;
    158b:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    158f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1592:	0f b6 00             	movzbl (%eax),%eax
    1595:	84 c0                	test   %al,%al
    1597:	75 da                	jne    1573 <printf+0x103>
    1599:	eb 68                	jmp    1603 <printf+0x193>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    159b:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
    159f:	75 1d                	jne    15be <printf+0x14e>
        putc(fd, *ap);
    15a1:	8b 45 e8             	mov    -0x18(%ebp),%eax
    15a4:	8b 00                	mov    (%eax),%eax
    15a6:	0f be c0             	movsbl %al,%eax
    15a9:	89 44 24 04          	mov    %eax,0x4(%esp)
    15ad:	8b 45 08             	mov    0x8(%ebp),%eax
    15b0:	89 04 24             	mov    %eax,(%esp)
    15b3:	e8 d8 fd ff ff       	call   1390 <putc>
        ap++;
    15b8:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    15bc:	eb 45                	jmp    1603 <printf+0x193>
      } else if(c == '%'){
    15be:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    15c2:	75 17                	jne    15db <printf+0x16b>
        putc(fd, c);
    15c4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    15c7:	0f be c0             	movsbl %al,%eax
    15ca:	89 44 24 04          	mov    %eax,0x4(%esp)
    15ce:	8b 45 08             	mov    0x8(%ebp),%eax
    15d1:	89 04 24             	mov    %eax,(%esp)
    15d4:	e8 b7 fd ff ff       	call   1390 <putc>
    15d9:	eb 28                	jmp    1603 <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
    15db:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
    15e2:	00 
    15e3:	8b 45 08             	mov    0x8(%ebp),%eax
    15e6:	89 04 24             	mov    %eax,(%esp)
    15e9:	e8 a2 fd ff ff       	call   1390 <putc>
        putc(fd, c);
    15ee:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    15f1:	0f be c0             	movsbl %al,%eax
    15f4:	89 44 24 04          	mov    %eax,0x4(%esp)
    15f8:	8b 45 08             	mov    0x8(%ebp),%eax
    15fb:	89 04 24             	mov    %eax,(%esp)
    15fe:	e8 8d fd ff ff       	call   1390 <putc>
      }
      state = 0;
    1603:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    160a:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    160e:	8b 55 0c             	mov    0xc(%ebp),%edx
    1611:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1614:	01 d0                	add    %edx,%eax
    1616:	0f b6 00             	movzbl (%eax),%eax
    1619:	84 c0                	test   %al,%al
    161b:	0f 85 71 fe ff ff    	jne    1492 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    1621:	c9                   	leave  
    1622:	c3                   	ret    
    1623:	90                   	nop

00001624 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    1624:	55                   	push   %ebp
    1625:	89 e5                	mov    %esp,%ebp
    1627:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
    162a:	8b 45 08             	mov    0x8(%ebp),%eax
    162d:	83 e8 08             	sub    $0x8,%eax
    1630:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1633:	a1 f4 20 00 00       	mov    0x20f4,%eax
    1638:	89 45 fc             	mov    %eax,-0x4(%ebp)
    163b:	eb 24                	jmp    1661 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    163d:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1640:	8b 00                	mov    (%eax),%eax
    1642:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    1645:	77 12                	ja     1659 <free+0x35>
    1647:	8b 45 f8             	mov    -0x8(%ebp),%eax
    164a:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    164d:	77 24                	ja     1673 <free+0x4f>
    164f:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1652:	8b 00                	mov    (%eax),%eax
    1654:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    1657:	77 1a                	ja     1673 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1659:	8b 45 fc             	mov    -0x4(%ebp),%eax
    165c:	8b 00                	mov    (%eax),%eax
    165e:	89 45 fc             	mov    %eax,-0x4(%ebp)
    1661:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1664:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    1667:	76 d4                	jbe    163d <free+0x19>
    1669:	8b 45 fc             	mov    -0x4(%ebp),%eax
    166c:	8b 00                	mov    (%eax),%eax
    166e:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    1671:	76 ca                	jbe    163d <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    1673:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1676:	8b 40 04             	mov    0x4(%eax),%eax
    1679:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    1680:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1683:	01 c2                	add    %eax,%edx
    1685:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1688:	8b 00                	mov    (%eax),%eax
    168a:	39 c2                	cmp    %eax,%edx
    168c:	75 24                	jne    16b2 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
    168e:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1691:	8b 50 04             	mov    0x4(%eax),%edx
    1694:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1697:	8b 00                	mov    (%eax),%eax
    1699:	8b 40 04             	mov    0x4(%eax),%eax
    169c:	01 c2                	add    %eax,%edx
    169e:	8b 45 f8             	mov    -0x8(%ebp),%eax
    16a1:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
    16a4:	8b 45 fc             	mov    -0x4(%ebp),%eax
    16a7:	8b 00                	mov    (%eax),%eax
    16a9:	8b 10                	mov    (%eax),%edx
    16ab:	8b 45 f8             	mov    -0x8(%ebp),%eax
    16ae:	89 10                	mov    %edx,(%eax)
    16b0:	eb 0a                	jmp    16bc <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
    16b2:	8b 45 fc             	mov    -0x4(%ebp),%eax
    16b5:	8b 10                	mov    (%eax),%edx
    16b7:	8b 45 f8             	mov    -0x8(%ebp),%eax
    16ba:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
    16bc:	8b 45 fc             	mov    -0x4(%ebp),%eax
    16bf:	8b 40 04             	mov    0x4(%eax),%eax
    16c2:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    16c9:	8b 45 fc             	mov    -0x4(%ebp),%eax
    16cc:	01 d0                	add    %edx,%eax
    16ce:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    16d1:	75 20                	jne    16f3 <free+0xcf>
    p->s.size += bp->s.size;
    16d3:	8b 45 fc             	mov    -0x4(%ebp),%eax
    16d6:	8b 50 04             	mov    0x4(%eax),%edx
    16d9:	8b 45 f8             	mov    -0x8(%ebp),%eax
    16dc:	8b 40 04             	mov    0x4(%eax),%eax
    16df:	01 c2                	add    %eax,%edx
    16e1:	8b 45 fc             	mov    -0x4(%ebp),%eax
    16e4:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    16e7:	8b 45 f8             	mov    -0x8(%ebp),%eax
    16ea:	8b 10                	mov    (%eax),%edx
    16ec:	8b 45 fc             	mov    -0x4(%ebp),%eax
    16ef:	89 10                	mov    %edx,(%eax)
    16f1:	eb 08                	jmp    16fb <free+0xd7>
  } else
    p->s.ptr = bp;
    16f3:	8b 45 fc             	mov    -0x4(%ebp),%eax
    16f6:	8b 55 f8             	mov    -0x8(%ebp),%edx
    16f9:	89 10                	mov    %edx,(%eax)
  freep = p;
    16fb:	8b 45 fc             	mov    -0x4(%ebp),%eax
    16fe:	a3 f4 20 00 00       	mov    %eax,0x20f4
}
    1703:	c9                   	leave  
    1704:	c3                   	ret    

00001705 <morecore>:

static Header*
morecore(uint nu)
{
    1705:	55                   	push   %ebp
    1706:	89 e5                	mov    %esp,%ebp
    1708:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
    170b:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
    1712:	77 07                	ja     171b <morecore+0x16>
    nu = 4096;
    1714:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
    171b:	8b 45 08             	mov    0x8(%ebp),%eax
    171e:	c1 e0 03             	shl    $0x3,%eax
    1721:	89 04 24             	mov    %eax,(%esp)
    1724:	e8 2f fc ff ff       	call   1358 <sbrk>
    1729:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
    172c:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
    1730:	75 07                	jne    1739 <morecore+0x34>
    return 0;
    1732:	b8 00 00 00 00       	mov    $0x0,%eax
    1737:	eb 22                	jmp    175b <morecore+0x56>
  hp = (Header*)p;
    1739:	8b 45 f4             	mov    -0xc(%ebp),%eax
    173c:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
    173f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1742:	8b 55 08             	mov    0x8(%ebp),%edx
    1745:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
    1748:	8b 45 f0             	mov    -0x10(%ebp),%eax
    174b:	83 c0 08             	add    $0x8,%eax
    174e:	89 04 24             	mov    %eax,(%esp)
    1751:	e8 ce fe ff ff       	call   1624 <free>
  return freep;
    1756:	a1 f4 20 00 00       	mov    0x20f4,%eax
}
    175b:	c9                   	leave  
    175c:	c3                   	ret    

0000175d <malloc>:

void*
malloc(uint nbytes)
{
    175d:	55                   	push   %ebp
    175e:	89 e5                	mov    %esp,%ebp
    1760:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1763:	8b 45 08             	mov    0x8(%ebp),%eax
    1766:	83 c0 07             	add    $0x7,%eax
    1769:	c1 e8 03             	shr    $0x3,%eax
    176c:	83 c0 01             	add    $0x1,%eax
    176f:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
    1772:	a1 f4 20 00 00       	mov    0x20f4,%eax
    1777:	89 45 f0             	mov    %eax,-0x10(%ebp)
    177a:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    177e:	75 23                	jne    17a3 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
    1780:	c7 45 f0 ec 20 00 00 	movl   $0x20ec,-0x10(%ebp)
    1787:	8b 45 f0             	mov    -0x10(%ebp),%eax
    178a:	a3 f4 20 00 00       	mov    %eax,0x20f4
    178f:	a1 f4 20 00 00       	mov    0x20f4,%eax
    1794:	a3 ec 20 00 00       	mov    %eax,0x20ec
    base.s.size = 0;
    1799:	c7 05 f0 20 00 00 00 	movl   $0x0,0x20f0
    17a0:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    17a3:	8b 45 f0             	mov    -0x10(%ebp),%eax
    17a6:	8b 00                	mov    (%eax),%eax
    17a8:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
    17ab:	8b 45 f4             	mov    -0xc(%ebp),%eax
    17ae:	8b 40 04             	mov    0x4(%eax),%eax
    17b1:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    17b4:	72 4d                	jb     1803 <malloc+0xa6>
      if(p->s.size == nunits)
    17b6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    17b9:	8b 40 04             	mov    0x4(%eax),%eax
    17bc:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    17bf:	75 0c                	jne    17cd <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
    17c1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    17c4:	8b 10                	mov    (%eax),%edx
    17c6:	8b 45 f0             	mov    -0x10(%ebp),%eax
    17c9:	89 10                	mov    %edx,(%eax)
    17cb:	eb 26                	jmp    17f3 <malloc+0x96>
      else {
        p->s.size -= nunits;
    17cd:	8b 45 f4             	mov    -0xc(%ebp),%eax
    17d0:	8b 40 04             	mov    0x4(%eax),%eax
    17d3:	2b 45 ec             	sub    -0x14(%ebp),%eax
    17d6:	89 c2                	mov    %eax,%edx
    17d8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    17db:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
    17de:	8b 45 f4             	mov    -0xc(%ebp),%eax
    17e1:	8b 40 04             	mov    0x4(%eax),%eax
    17e4:	c1 e0 03             	shl    $0x3,%eax
    17e7:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
    17ea:	8b 45 f4             	mov    -0xc(%ebp),%eax
    17ed:	8b 55 ec             	mov    -0x14(%ebp),%edx
    17f0:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
    17f3:	8b 45 f0             	mov    -0x10(%ebp),%eax
    17f6:	a3 f4 20 00 00       	mov    %eax,0x20f4
      return (void*)(p + 1);
    17fb:	8b 45 f4             	mov    -0xc(%ebp),%eax
    17fe:	83 c0 08             	add    $0x8,%eax
    1801:	eb 38                	jmp    183b <malloc+0xde>
    }
    if(p == freep)
    1803:	a1 f4 20 00 00       	mov    0x20f4,%eax
    1808:	39 45 f4             	cmp    %eax,-0xc(%ebp)
    180b:	75 1b                	jne    1828 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
    180d:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1810:	89 04 24             	mov    %eax,(%esp)
    1813:	e8 ed fe ff ff       	call   1705 <morecore>
    1818:	89 45 f4             	mov    %eax,-0xc(%ebp)
    181b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    181f:	75 07                	jne    1828 <malloc+0xcb>
        return 0;
    1821:	b8 00 00 00 00       	mov    $0x0,%eax
    1826:	eb 13                	jmp    183b <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1828:	8b 45 f4             	mov    -0xc(%ebp),%eax
    182b:	89 45 f0             	mov    %eax,-0x10(%ebp)
    182e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1831:	8b 00                	mov    (%eax),%eax
    1833:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
    1836:	e9 70 ff ff ff       	jmp    17ab <malloc+0x4e>
}
    183b:	c9                   	leave  
    183c:	c3                   	ret    
    183d:	66 90                	xchg   %ax,%ax
    183f:	90                   	nop

00001840 <xchg>:
  asm volatile("sti");
}

static inline uint
xchg(volatile uint *addr, uint newval)
{
    1840:	55                   	push   %ebp
    1841:	89 e5                	mov    %esp,%ebp
    1843:	83 ec 10             	sub    $0x10,%esp
  uint result;
  
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
    1846:	8b 55 08             	mov    0x8(%ebp),%edx
    1849:	8b 45 0c             	mov    0xc(%ebp),%eax
    184c:	8b 4d 08             	mov    0x8(%ebp),%ecx
    184f:	f0 87 02             	lock xchg %eax,(%edx)
    1852:	89 45 fc             	mov    %eax,-0x4(%ebp)
               "+m" (*addr), "=a" (result) :
               "1" (newval) :
               "cc");
  return result;
    1855:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    1858:	c9                   	leave  
    1859:	c3                   	ret    

0000185a <lock_init>:
#include "x86.h"
#include "proc.h"

unsigned long rands = 1;

void lock_init(lock_t *lock){
    185a:	55                   	push   %ebp
    185b:	89 e5                	mov    %esp,%ebp
    lock->locked = 0;
    185d:	8b 45 08             	mov    0x8(%ebp),%eax
    1860:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
    1866:	5d                   	pop    %ebp
    1867:	c3                   	ret    

00001868 <lock_acquire>:
void lock_acquire(lock_t *lock){
    1868:	55                   	push   %ebp
    1869:	89 e5                	mov    %esp,%ebp
    186b:	83 ec 08             	sub    $0x8,%esp
    while(xchg(&lock->locked,1) != 0);
    186e:	90                   	nop
    186f:	8b 45 08             	mov    0x8(%ebp),%eax
    1872:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
    1879:	00 
    187a:	89 04 24             	mov    %eax,(%esp)
    187d:	e8 be ff ff ff       	call   1840 <xchg>
    1882:	85 c0                	test   %eax,%eax
    1884:	75 e9                	jne    186f <lock_acquire+0x7>
}
    1886:	c9                   	leave  
    1887:	c3                   	ret    

00001888 <lock_release>:
void lock_release(lock_t *lock){
    1888:	55                   	push   %ebp
    1889:	89 e5                	mov    %esp,%ebp
    188b:	83 ec 08             	sub    $0x8,%esp
    xchg(&lock->locked,0);
    188e:	8b 45 08             	mov    0x8(%ebp),%eax
    1891:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1898:	00 
    1899:	89 04 24             	mov    %eax,(%esp)
    189c:	e8 9f ff ff ff       	call   1840 <xchg>
}
    18a1:	c9                   	leave  
    18a2:	c3                   	ret    

000018a3 <thread_create>:


void *thread_create(void(*start_routine)(void*), void *arg){
    18a3:	55                   	push   %ebp
    18a4:	89 e5                	mov    %esp,%ebp
    18a6:	83 ec 28             	sub    $0x28,%esp
    int tid;
    void * stack = malloc(2 * 4096);
    18a9:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
    18b0:	e8 a8 fe ff ff       	call   175d <malloc>
    18b5:	89 45 f4             	mov    %eax,-0xc(%ebp)
    void *garbage_stack = stack; 
    18b8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    18bb:	89 45 f0             	mov    %eax,-0x10(%ebp)
   // printf(1,"start routine addr : %d\n",(uint)start_routine);


    if((uint)stack % 4096){
    18be:	8b 45 f4             	mov    -0xc(%ebp),%eax
    18c1:	25 ff 0f 00 00       	and    $0xfff,%eax
    18c6:	85 c0                	test   %eax,%eax
    18c8:	74 14                	je     18de <thread_create+0x3b>
        stack = stack + (4096 - (uint)stack % 4096);
    18ca:	8b 45 f4             	mov    -0xc(%ebp),%eax
    18cd:	25 ff 0f 00 00       	and    $0xfff,%eax
    18d2:	89 c2                	mov    %eax,%edx
    18d4:	b8 00 10 00 00       	mov    $0x1000,%eax
    18d9:	29 d0                	sub    %edx,%eax
    18db:	01 45 f4             	add    %eax,-0xc(%ebp)
    }
    if (stack == 0){
    18de:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    18e2:	75 1b                	jne    18ff <thread_create+0x5c>

        printf(1,"malloc fail \n");
    18e4:	c7 44 24 04 84 1c 00 	movl   $0x1c84,0x4(%esp)
    18eb:	00 
    18ec:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    18f3:	e8 78 fb ff ff       	call   1470 <printf>
        return 0;
    18f8:	b8 00 00 00 00       	mov    $0x0,%eax
    18fd:	eb 6f                	jmp    196e <thread_create+0xcb>
    }

    tid = clone((uint)stack,PSIZE,(uint)start_routine,(int)arg);
    18ff:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    1902:	8b 55 08             	mov    0x8(%ebp),%edx
    1905:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1908:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
    190c:	89 54 24 08          	mov    %edx,0x8(%esp)
    1910:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
    1917:	00 
    1918:	89 04 24             	mov    %eax,(%esp)
    191b:	e8 50 fa ff ff       	call   1370 <clone>
    1920:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(tid < 0){
    1923:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1927:	79 1b                	jns    1944 <thread_create+0xa1>
        printf(1,"clone fails\n");
    1929:	c7 44 24 04 92 1c 00 	movl   $0x1c92,0x4(%esp)
    1930:	00 
    1931:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1938:	e8 33 fb ff ff       	call   1470 <printf>
        return 0;
    193d:	b8 00 00 00 00       	mov    $0x0,%eax
    1942:	eb 2a                	jmp    196e <thread_create+0xcb>
    }
    if(tid > 0){
    1944:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1948:	7e 05                	jle    194f <thread_create+0xac>
        //store threads on thread table
        return garbage_stack;
    194a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    194d:	eb 1f                	jmp    196e <thread_create+0xcb>
    }
    if(tid == 0){
    194f:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1953:	75 14                	jne    1969 <thread_create+0xc6>
        printf(1,"tid = 0 return \n");
    1955:	c7 44 24 04 9f 1c 00 	movl   $0x1c9f,0x4(%esp)
    195c:	00 
    195d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1964:	e8 07 fb ff ff       	call   1470 <printf>
    }
//    wait();
//    free(garbage_stack);

    return 0;
    1969:	b8 00 00 00 00       	mov    $0x0,%eax
}
    196e:	c9                   	leave  
    196f:	c3                   	ret    

00001970 <random>:

// generate 0 -> max random number exclude max.
int random(int max){
    1970:	55                   	push   %ebp
    1971:	89 e5                	mov    %esp,%ebp
    rands = rands * 1664525 + 1013904233;
    1973:	a1 e8 20 00 00       	mov    0x20e8,%eax
    1978:	69 c0 0d 66 19 00    	imul   $0x19660d,%eax,%eax
    197e:	05 69 f3 6e 3c       	add    $0x3c6ef369,%eax
    1983:	a3 e8 20 00 00       	mov    %eax,0x20e8
    return (int)(rands % max);
    1988:	a1 e8 20 00 00       	mov    0x20e8,%eax
    198d:	8b 4d 08             	mov    0x8(%ebp),%ecx
    1990:	ba 00 00 00 00       	mov    $0x0,%edx
    1995:	f7 f1                	div    %ecx
    1997:	89 d0                	mov    %edx,%eax
}
    1999:	5d                   	pop    %ebp
    199a:	c3                   	ret    
    199b:	90                   	nop

0000199c <init_q>:
#include "queue.h"
#include "types.h"
#include "user.h"

void init_q(struct queue *q){
    199c:	55                   	push   %ebp
    199d:	89 e5                	mov    %esp,%ebp
    q->size = 0;
    199f:	8b 45 08             	mov    0x8(%ebp),%eax
    19a2:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    q->head = 0;
    19a8:	8b 45 08             	mov    0x8(%ebp),%eax
    19ab:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    q->tail = 0;
    19b2:	8b 45 08             	mov    0x8(%ebp),%eax
    19b5:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
}
    19bc:	5d                   	pop    %ebp
    19bd:	c3                   	ret    

000019be <add_q>:

void add_q(struct queue *q, int v){
    19be:	55                   	push   %ebp
    19bf:	89 e5                	mov    %esp,%ebp
    19c1:	83 ec 28             	sub    $0x28,%esp
    struct node * n = malloc(sizeof(struct node));
    19c4:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
    19cb:	e8 8d fd ff ff       	call   175d <malloc>
    19d0:	89 45 f4             	mov    %eax,-0xc(%ebp)
    n->next = 0;
    19d3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    19d6:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    n->value = v;
    19dd:	8b 45 f4             	mov    -0xc(%ebp),%eax
    19e0:	8b 55 0c             	mov    0xc(%ebp),%edx
    19e3:	89 10                	mov    %edx,(%eax)
    if(q->head == 0){
    19e5:	8b 45 08             	mov    0x8(%ebp),%eax
    19e8:	8b 40 04             	mov    0x4(%eax),%eax
    19eb:	85 c0                	test   %eax,%eax
    19ed:	75 0b                	jne    19fa <add_q+0x3c>
        q->head = n;
    19ef:	8b 45 08             	mov    0x8(%ebp),%eax
    19f2:	8b 55 f4             	mov    -0xc(%ebp),%edx
    19f5:	89 50 04             	mov    %edx,0x4(%eax)
    19f8:	eb 0c                	jmp    1a06 <add_q+0x48>
    }else{
        q->tail->next = n;
    19fa:	8b 45 08             	mov    0x8(%ebp),%eax
    19fd:	8b 40 08             	mov    0x8(%eax),%eax
    1a00:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1a03:	89 50 04             	mov    %edx,0x4(%eax)
    }
    q->tail = n;
    1a06:	8b 45 08             	mov    0x8(%ebp),%eax
    1a09:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1a0c:	89 50 08             	mov    %edx,0x8(%eax)
    q->size++;
    1a0f:	8b 45 08             	mov    0x8(%ebp),%eax
    1a12:	8b 00                	mov    (%eax),%eax
    1a14:	8d 50 01             	lea    0x1(%eax),%edx
    1a17:	8b 45 08             	mov    0x8(%ebp),%eax
    1a1a:	89 10                	mov    %edx,(%eax)
}
    1a1c:	c9                   	leave  
    1a1d:	c3                   	ret    

00001a1e <empty_q>:

int empty_q(struct queue *q){
    1a1e:	55                   	push   %ebp
    1a1f:	89 e5                	mov    %esp,%ebp
    if(q->size == 0)
    1a21:	8b 45 08             	mov    0x8(%ebp),%eax
    1a24:	8b 00                	mov    (%eax),%eax
    1a26:	85 c0                	test   %eax,%eax
    1a28:	75 07                	jne    1a31 <empty_q+0x13>
        return 1;
    1a2a:	b8 01 00 00 00       	mov    $0x1,%eax
    1a2f:	eb 05                	jmp    1a36 <empty_q+0x18>
    else
        return 0;
    1a31:	b8 00 00 00 00       	mov    $0x0,%eax
} 
    1a36:	5d                   	pop    %ebp
    1a37:	c3                   	ret    

00001a38 <pop_q>:
int pop_q(struct queue *q){
    1a38:	55                   	push   %ebp
    1a39:	89 e5                	mov    %esp,%ebp
    1a3b:	83 ec 28             	sub    $0x28,%esp
    int val;
    struct node *destroy;
    if(!empty_q(q)){
    1a3e:	8b 45 08             	mov    0x8(%ebp),%eax
    1a41:	89 04 24             	mov    %eax,(%esp)
    1a44:	e8 d5 ff ff ff       	call   1a1e <empty_q>
    1a49:	85 c0                	test   %eax,%eax
    1a4b:	75 5d                	jne    1aaa <pop_q+0x72>
       val = q->head->value; 
    1a4d:	8b 45 08             	mov    0x8(%ebp),%eax
    1a50:	8b 40 04             	mov    0x4(%eax),%eax
    1a53:	8b 00                	mov    (%eax),%eax
    1a55:	89 45 f4             	mov    %eax,-0xc(%ebp)
       destroy = q->head;
    1a58:	8b 45 08             	mov    0x8(%ebp),%eax
    1a5b:	8b 40 04             	mov    0x4(%eax),%eax
    1a5e:	89 45 f0             	mov    %eax,-0x10(%ebp)
       q->head = q->head->next;
    1a61:	8b 45 08             	mov    0x8(%ebp),%eax
    1a64:	8b 40 04             	mov    0x4(%eax),%eax
    1a67:	8b 50 04             	mov    0x4(%eax),%edx
    1a6a:	8b 45 08             	mov    0x8(%ebp),%eax
    1a6d:	89 50 04             	mov    %edx,0x4(%eax)
       free(destroy);
    1a70:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1a73:	89 04 24             	mov    %eax,(%esp)
    1a76:	e8 a9 fb ff ff       	call   1624 <free>
       q->size--;
    1a7b:	8b 45 08             	mov    0x8(%ebp),%eax
    1a7e:	8b 00                	mov    (%eax),%eax
    1a80:	8d 50 ff             	lea    -0x1(%eax),%edx
    1a83:	8b 45 08             	mov    0x8(%ebp),%eax
    1a86:	89 10                	mov    %edx,(%eax)
       if(q->size == 0){
    1a88:	8b 45 08             	mov    0x8(%ebp),%eax
    1a8b:	8b 00                	mov    (%eax),%eax
    1a8d:	85 c0                	test   %eax,%eax
    1a8f:	75 14                	jne    1aa5 <pop_q+0x6d>
            q->head = 0;
    1a91:	8b 45 08             	mov    0x8(%ebp),%eax
    1a94:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
            q->tail = 0;
    1a9b:	8b 45 08             	mov    0x8(%ebp),%eax
    1a9e:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
       }
       return val;
    1aa5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1aa8:	eb 05                	jmp    1aaf <pop_q+0x77>
    }
    return -1;
    1aaa:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
    1aaf:	c9                   	leave  
    1ab0:	c3                   	ret    

00001ab1 <dominant>:

void dominant(struct queue* q, int i){
    1ab1:	55                   	push   %ebp
    1ab2:	89 e5                	mov    %esp,%ebp
    1ab4:	83 ec 28             	sub    $0x28,%esp
    struct node * n = malloc(sizeof(struct node));
    1ab7:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
    1abe:	e8 9a fc ff ff       	call   175d <malloc>
    1ac3:	89 45 f4             	mov    %eax,-0xc(%ebp)
    n->value = i;
    1ac6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1ac9:	8b 55 0c             	mov    0xc(%ebp),%edx
    1acc:	89 10                	mov    %edx,(%eax)

    if(q->head == 0){
    1ace:	8b 45 08             	mov    0x8(%ebp),%eax
    1ad1:	8b 40 04             	mov    0x4(%eax),%eax
    1ad4:	85 c0                	test   %eax,%eax
    1ad6:	75 14                	jne    1aec <dominant+0x3b>
        q->head = n;
    1ad8:	8b 45 08             	mov    0x8(%ebp),%eax
    1adb:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1ade:	89 50 04             	mov    %edx,0x4(%eax)
        q->tail = n;
    1ae1:	8b 45 08             	mov    0x8(%ebp),%eax
    1ae4:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1ae7:	89 50 08             	mov    %edx,0x8(%eax)
    1aea:	eb 15                	jmp    1b01 <dominant+0x50>
    }
    else{
        n->next = q->head;
    1aec:	8b 45 08             	mov    0x8(%ebp),%eax
    1aef:	8b 50 04             	mov    0x4(%eax),%edx
    1af2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1af5:	89 50 04             	mov    %edx,0x4(%eax)
        q->head = n;
    1af8:	8b 45 08             	mov    0x8(%ebp),%eax
    1afb:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1afe:	89 50 04             	mov    %edx,0x4(%eax)
    }
    q->size++;
    1b01:	8b 45 08             	mov    0x8(%ebp),%eax
    1b04:	8b 00                	mov    (%eax),%eax
    1b06:	8d 50 01             	lea    0x1(%eax),%edx
    1b09:	8b 45 08             	mov    0x8(%ebp),%eax
    1b0c:	89 10                	mov    %edx,(%eax)
}
    1b0e:	c9                   	leave  
    1b0f:	c3                   	ret    

00001b10 <sem_init>:
#include "semaphore.h"
#include "user.h"

// Initializes the semaphore
void sem_init(struct Semaphore* s, int value){
    1b10:	55                   	push   %ebp
    1b11:	89 e5                	mov    %esp,%ebp
    1b13:	83 ec 18             	sub    $0x18,%esp
    s->val = value;
    1b16:	8b 45 08             	mov    0x8(%ebp),%eax
    1b19:	8b 55 0c             	mov    0xc(%ebp),%edx
    1b1c:	89 10                	mov    %edx,(%eax)
    lock_init(&s->lock);
    1b1e:	8b 45 08             	mov    0x8(%ebp),%eax
    1b21:	83 c0 04             	add    $0x4,%eax
    1b24:	89 04 24             	mov    %eax,(%esp)
    1b27:	e8 2e fd ff ff       	call   185a <lock_init>
    init_q(&s->q);
    1b2c:	8b 45 08             	mov    0x8(%ebp),%eax
    1b2f:	83 c0 08             	add    $0x8,%eax
    1b32:	89 04 24             	mov    %eax,(%esp)
    1b35:	e8 62 fe ff ff       	call   199c <init_q>
}
    1b3a:	c9                   	leave  
    1b3b:	c3                   	ret    

00001b3c <sem_acquire>:

// Decrements the semaphore
void sem_acquire(struct Semaphore* s){
    1b3c:	55                   	push   %ebp
    1b3d:	89 e5                	mov    %esp,%ebp
    1b3f:	83 ec 28             	sub    $0x28,%esp
    lock_acquire(&s->lock);
    1b42:	8b 45 08             	mov    0x8(%ebp),%eax
    1b45:	83 c0 04             	add    $0x4,%eax
    1b48:	89 04 24             	mov    %eax,(%esp)
    1b4b:	e8 18 fd ff ff       	call   1868 <lock_acquire>

    if(s->val == 0){
    1b50:	8b 45 08             	mov    0x8(%ebp),%eax
    1b53:	8b 00                	mov    (%eax),%eax
    1b55:	85 c0                	test   %eax,%eax
    1b57:	75 32                	jne    1b8b <sem_acquire+0x4f>
        int pid;
        pid = getpid();
    1b59:	e8 f2 f7 ff ff       	call   1350 <getpid>
    1b5e:	89 45 f4             	mov    %eax,-0xc(%ebp)
        add_q(&s->q, pid);
    1b61:	8b 45 08             	mov    0x8(%ebp),%eax
    1b64:	8d 50 08             	lea    0x8(%eax),%edx
    1b67:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1b6a:	89 44 24 04          	mov    %eax,0x4(%esp)
    1b6e:	89 14 24             	mov    %edx,(%esp)
    1b71:	e8 48 fe ff ff       	call   19be <add_q>
        lock_release(&s->lock);
    1b76:	8b 45 08             	mov    0x8(%ebp),%eax
    1b79:	83 c0 04             	add    $0x4,%eax
    1b7c:	89 04 24             	mov    %eax,(%esp)
    1b7f:	e8 04 fd ff ff       	call   1888 <lock_release>
        tsleep();
    1b84:	e8 f7 f7 ff ff       	call   1380 <tsleep>
    1b89:	eb 1b                	jmp    1ba6 <sem_acquire+0x6a>
    }
    else{
        s->val--;
    1b8b:	8b 45 08             	mov    0x8(%ebp),%eax
    1b8e:	8b 00                	mov    (%eax),%eax
    1b90:	8d 50 ff             	lea    -0x1(%eax),%edx
    1b93:	8b 45 08             	mov    0x8(%ebp),%eax
    1b96:	89 10                	mov    %edx,(%eax)
        lock_release(&s->lock);
    1b98:	8b 45 08             	mov    0x8(%ebp),%eax
    1b9b:	83 c0 04             	add    $0x4,%eax
    1b9e:	89 04 24             	mov    %eax,(%esp)
    1ba1:	e8 e2 fc ff ff       	call   1888 <lock_release>
    }
}
    1ba6:	c9                   	leave  
    1ba7:	c3                   	ret    

00001ba8 <sem_signal>:

// Increments the semaphore
void sem_signal(struct Semaphore* s){
    1ba8:	55                   	push   %ebp
    1ba9:	89 e5                	mov    %esp,%ebp
    1bab:	83 ec 18             	sub    $0x18,%esp
    lock_acquire(&s->lock);
    1bae:	8b 45 08             	mov    0x8(%ebp),%eax
    1bb1:	83 c0 04             	add    $0x4,%eax
    1bb4:	89 04 24             	mov    %eax,(%esp)
    1bb7:	e8 ac fc ff ff       	call   1868 <lock_acquire>

    if(!empty_q(&s->q)){
    1bbc:	8b 45 08             	mov    0x8(%ebp),%eax
    1bbf:	83 c0 08             	add    $0x8,%eax
    1bc2:	89 04 24             	mov    %eax,(%esp)
    1bc5:	e8 54 fe ff ff       	call   1a1e <empty_q>
    1bca:	85 c0                	test   %eax,%eax
    1bcc:	75 18                	jne    1be6 <sem_signal+0x3e>
        twakeup(pop_q(&s->q));
    1bce:	8b 45 08             	mov    0x8(%ebp),%eax
    1bd1:	83 c0 08             	add    $0x8,%eax
    1bd4:	89 04 24             	mov    %eax,(%esp)
    1bd7:	e8 5c fe ff ff       	call   1a38 <pop_q>
    1bdc:	89 04 24             	mov    %eax,(%esp)
    1bdf:	e8 a4 f7 ff ff       	call   1388 <twakeup>
    1be4:	eb 0d                	jmp    1bf3 <sem_signal+0x4b>
    }
    else{
        s->val++;
    1be6:	8b 45 08             	mov    0x8(%ebp),%eax
    1be9:	8b 00                	mov    (%eax),%eax
    1beb:	8d 50 01             	lea    0x1(%eax),%edx
    1bee:	8b 45 08             	mov    0x8(%ebp),%eax
    1bf1:	89 10                	mov    %edx,(%eax)
    }

    lock_release(&s->lock);
    1bf3:	8b 45 08             	mov    0x8(%ebp),%eax
    1bf6:	83 c0 04             	add    $0x4,%eax
    1bf9:	89 04 24             	mov    %eax,(%esp)
    1bfc:	e8 87 fc ff ff       	call   1888 <lock_release>
}
    1c01:	c9                   	leave  
    1c02:	c3                   	ret    

00001c03 <sem_dom_acquire>:

void sem_dom_acquire(struct Semaphore* s){
    1c03:	55                   	push   %ebp
    1c04:	89 e5                	mov    %esp,%ebp
    1c06:	83 ec 18             	sub    $0x18,%esp
    lock_acquire(&s->lock);
    1c09:	8b 45 08             	mov    0x8(%ebp),%eax
    1c0c:	83 c0 04             	add    $0x4,%eax
    1c0f:	89 04 24             	mov    %eax,(%esp)
    1c12:	e8 51 fc ff ff       	call   1868 <lock_acquire>

    if(s->val > 0){
    1c17:	8b 45 08             	mov    0x8(%ebp),%eax
    1c1a:	8b 00                	mov    (%eax),%eax
    1c1c:	85 c0                	test   %eax,%eax
    1c1e:	7e 1d                	jle    1c3d <sem_dom_acquire+0x3a>
        s->val--;
    1c20:	8b 45 08             	mov    0x8(%ebp),%eax
    1c23:	8b 00                	mov    (%eax),%eax
    1c25:	8d 50 ff             	lea    -0x1(%eax),%edx
    1c28:	8b 45 08             	mov    0x8(%ebp),%eax
    1c2b:	89 10                	mov    %edx,(%eax)
        lock_release(&s->lock);
    1c2d:	8b 45 08             	mov    0x8(%ebp),%eax
    1c30:	83 c0 04             	add    $0x4,%eax
    1c33:	89 04 24             	mov    %eax,(%esp)
    1c36:	e8 4d fc ff ff       	call   1888 <lock_release>
        return;
    1c3b:	eb 2a                	jmp    1c67 <sem_dom_acquire+0x64>
    }

    dominant(&s->q,getpid());
    1c3d:	e8 0e f7 ff ff       	call   1350 <getpid>
    1c42:	8b 55 08             	mov    0x8(%ebp),%edx
    1c45:	83 c2 08             	add    $0x8,%edx
    1c48:	89 44 24 04          	mov    %eax,0x4(%esp)
    1c4c:	89 14 24             	mov    %edx,(%esp)
    1c4f:	e8 5d fe ff ff       	call   1ab1 <dominant>
    lock_release(&s->lock);
    1c54:	8b 45 08             	mov    0x8(%ebp),%eax
    1c57:	83 c0 04             	add    $0x4,%eax
    1c5a:	89 04 24             	mov    %eax,(%esp)
    1c5d:	e8 26 fc ff ff       	call   1888 <lock_release>
    tsleep();
    1c62:	e8 19 f7 ff ff       	call   1380 <tsleep>
}
    1c67:	c9                   	leave  
    1c68:	c3                   	ret    
