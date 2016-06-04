
_test_null:     file format elf32-i386


Disassembly of section .text:

00001000 <main>:
#include "types.h"
#include "stat.h"
#include "user.h"

int main(){
    1000:	55                   	push   %ebp
    1001:	89 e5                	mov    %esp,%ebp
    1003:	83 e4 f0             	and    $0xfffffff0,%esp
    1006:	83 ec 30             	sub    $0x30,%esp
    int a = 1, b, c;
    1009:	c7 44 24 1c 01 00 00 	movl   $0x1,0x1c(%esp)
    1010:	00 
    int *p;

    p = &a;
    1011:	8d 44 24 1c          	lea    0x1c(%esp),%eax
    1015:	89 44 24 2c          	mov    %eax,0x2c(%esp)
    printf(1, "Printing p = &a : %d\n", *p);
    1019:	8b 44 24 2c          	mov    0x2c(%esp),%eax
    101d:	8b 00                	mov    (%eax),%eax
    101f:	89 44 24 08          	mov    %eax,0x8(%esp)
    1023:	c7 44 24 04 b8 1c 00 	movl   $0x1cb8,0x4(%esp)
    102a:	00 
    102b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1032:	e8 85 04 00 00       	call   14bc <printf>

    b = *p;
    1037:	8b 44 24 2c          	mov    0x2c(%esp),%eax
    103b:	8b 00                	mov    (%eax),%eax
    103d:	89 44 24 28          	mov    %eax,0x28(%esp)
    printf(1, "Printing b = *p : %d\n", b);
    1041:	8b 44 24 28          	mov    0x28(%esp),%eax
    1045:	89 44 24 08          	mov    %eax,0x8(%esp)
    1049:	c7 44 24 04 ce 1c 00 	movl   $0x1cce,0x4(%esp)
    1050:	00 
    1051:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1058:	e8 5f 04 00 00       	call   14bc <printf>

    p = 0;
    105d:	c7 44 24 2c 00 00 00 	movl   $0x0,0x2c(%esp)
    1064:	00 
    c = *p;
    1065:	8b 44 24 2c          	mov    0x2c(%esp),%eax
    1069:	8b 00                	mov    (%eax),%eax
    106b:	89 44 24 24          	mov    %eax,0x24(%esp)
    printf(1,"Null dereference, c = *p : %d\n", c);
    106f:	8b 44 24 24          	mov    0x24(%esp),%eax
    1073:	89 44 24 08          	mov    %eax,0x8(%esp)
    1077:	c7 44 24 04 e4 1c 00 	movl   $0x1ce4,0x4(%esp)
    107e:	00 
    107f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1086:	e8 31 04 00 00       	call   14bc <printf>

    int *p2 = 0;
    108b:	c7 44 24 20 00 00 00 	movl   $0x0,0x20(%esp)
    1092:	00 
    printf(1, "*Print new int *p2 : %p\n", p2);
    1093:	8b 44 24 20          	mov    0x20(%esp),%eax
    1097:	89 44 24 08          	mov    %eax,0x8(%esp)
    109b:	c7 44 24 04 03 1d 00 	movl   $0x1d03,0x4(%esp)
    10a2:	00 
    10a3:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    10aa:	e8 0d 04 00 00       	call   14bc <printf>
    exit();
    10af:	e8 68 02 00 00       	call   131c <exit>

000010b4 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
    10b4:	55                   	push   %ebp
    10b5:	89 e5                	mov    %esp,%ebp
    10b7:	57                   	push   %edi
    10b8:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
    10b9:	8b 4d 08             	mov    0x8(%ebp),%ecx
    10bc:	8b 55 10             	mov    0x10(%ebp),%edx
    10bf:	8b 45 0c             	mov    0xc(%ebp),%eax
    10c2:	89 cb                	mov    %ecx,%ebx
    10c4:	89 df                	mov    %ebx,%edi
    10c6:	89 d1                	mov    %edx,%ecx
    10c8:	fc                   	cld    
    10c9:	f3 aa                	rep stos %al,%es:(%edi)
    10cb:	89 ca                	mov    %ecx,%edx
    10cd:	89 fb                	mov    %edi,%ebx
    10cf:	89 5d 08             	mov    %ebx,0x8(%ebp)
    10d2:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
    10d5:	5b                   	pop    %ebx
    10d6:	5f                   	pop    %edi
    10d7:	5d                   	pop    %ebp
    10d8:	c3                   	ret    

000010d9 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
    10d9:	55                   	push   %ebp
    10da:	89 e5                	mov    %esp,%ebp
    10dc:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
    10df:	8b 45 08             	mov    0x8(%ebp),%eax
    10e2:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
    10e5:	90                   	nop
    10e6:	8b 45 08             	mov    0x8(%ebp),%eax
    10e9:	8d 50 01             	lea    0x1(%eax),%edx
    10ec:	89 55 08             	mov    %edx,0x8(%ebp)
    10ef:	8b 55 0c             	mov    0xc(%ebp),%edx
    10f2:	8d 4a 01             	lea    0x1(%edx),%ecx
    10f5:	89 4d 0c             	mov    %ecx,0xc(%ebp)
    10f8:	0f b6 12             	movzbl (%edx),%edx
    10fb:	88 10                	mov    %dl,(%eax)
    10fd:	0f b6 00             	movzbl (%eax),%eax
    1100:	84 c0                	test   %al,%al
    1102:	75 e2                	jne    10e6 <strcpy+0xd>
    ;
  return os;
    1104:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    1107:	c9                   	leave  
    1108:	c3                   	ret    

00001109 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    1109:	55                   	push   %ebp
    110a:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
    110c:	eb 08                	jmp    1116 <strcmp+0xd>
    p++, q++;
    110e:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    1112:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    1116:	8b 45 08             	mov    0x8(%ebp),%eax
    1119:	0f b6 00             	movzbl (%eax),%eax
    111c:	84 c0                	test   %al,%al
    111e:	74 10                	je     1130 <strcmp+0x27>
    1120:	8b 45 08             	mov    0x8(%ebp),%eax
    1123:	0f b6 10             	movzbl (%eax),%edx
    1126:	8b 45 0c             	mov    0xc(%ebp),%eax
    1129:	0f b6 00             	movzbl (%eax),%eax
    112c:	38 c2                	cmp    %al,%dl
    112e:	74 de                	je     110e <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
    1130:	8b 45 08             	mov    0x8(%ebp),%eax
    1133:	0f b6 00             	movzbl (%eax),%eax
    1136:	0f b6 d0             	movzbl %al,%edx
    1139:	8b 45 0c             	mov    0xc(%ebp),%eax
    113c:	0f b6 00             	movzbl (%eax),%eax
    113f:	0f b6 c0             	movzbl %al,%eax
    1142:	29 c2                	sub    %eax,%edx
    1144:	89 d0                	mov    %edx,%eax
}
    1146:	5d                   	pop    %ebp
    1147:	c3                   	ret    

00001148 <strlen>:

uint
strlen(char *s)
{
    1148:	55                   	push   %ebp
    1149:	89 e5                	mov    %esp,%ebp
    114b:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
    114e:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    1155:	eb 04                	jmp    115b <strlen+0x13>
    1157:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    115b:	8b 55 fc             	mov    -0x4(%ebp),%edx
    115e:	8b 45 08             	mov    0x8(%ebp),%eax
    1161:	01 d0                	add    %edx,%eax
    1163:	0f b6 00             	movzbl (%eax),%eax
    1166:	84 c0                	test   %al,%al
    1168:	75 ed                	jne    1157 <strlen+0xf>
    ;
  return n;
    116a:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    116d:	c9                   	leave  
    116e:	c3                   	ret    

0000116f <memset>:

void*
memset(void *dst, int c, uint n)
{
    116f:	55                   	push   %ebp
    1170:	89 e5                	mov    %esp,%ebp
    1172:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
    1175:	8b 45 10             	mov    0x10(%ebp),%eax
    1178:	89 44 24 08          	mov    %eax,0x8(%esp)
    117c:	8b 45 0c             	mov    0xc(%ebp),%eax
    117f:	89 44 24 04          	mov    %eax,0x4(%esp)
    1183:	8b 45 08             	mov    0x8(%ebp),%eax
    1186:	89 04 24             	mov    %eax,(%esp)
    1189:	e8 26 ff ff ff       	call   10b4 <stosb>
  return dst;
    118e:	8b 45 08             	mov    0x8(%ebp),%eax
}
    1191:	c9                   	leave  
    1192:	c3                   	ret    

00001193 <strchr>:

char*
strchr(const char *s, char c)
{
    1193:	55                   	push   %ebp
    1194:	89 e5                	mov    %esp,%ebp
    1196:	83 ec 04             	sub    $0x4,%esp
    1199:	8b 45 0c             	mov    0xc(%ebp),%eax
    119c:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
    119f:	eb 14                	jmp    11b5 <strchr+0x22>
    if(*s == c)
    11a1:	8b 45 08             	mov    0x8(%ebp),%eax
    11a4:	0f b6 00             	movzbl (%eax),%eax
    11a7:	3a 45 fc             	cmp    -0x4(%ebp),%al
    11aa:	75 05                	jne    11b1 <strchr+0x1e>
      return (char*)s;
    11ac:	8b 45 08             	mov    0x8(%ebp),%eax
    11af:	eb 13                	jmp    11c4 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
    11b1:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    11b5:	8b 45 08             	mov    0x8(%ebp),%eax
    11b8:	0f b6 00             	movzbl (%eax),%eax
    11bb:	84 c0                	test   %al,%al
    11bd:	75 e2                	jne    11a1 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
    11bf:	b8 00 00 00 00       	mov    $0x0,%eax
}
    11c4:	c9                   	leave  
    11c5:	c3                   	ret    

000011c6 <gets>:

char*
gets(char *buf, int max)
{
    11c6:	55                   	push   %ebp
    11c7:	89 e5                	mov    %esp,%ebp
    11c9:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    11cc:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    11d3:	eb 4c                	jmp    1221 <gets+0x5b>
    cc = read(0, &c, 1);
    11d5:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    11dc:	00 
    11dd:	8d 45 ef             	lea    -0x11(%ebp),%eax
    11e0:	89 44 24 04          	mov    %eax,0x4(%esp)
    11e4:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    11eb:	e8 44 01 00 00       	call   1334 <read>
    11f0:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
    11f3:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    11f7:	7f 02                	jg     11fb <gets+0x35>
      break;
    11f9:	eb 31                	jmp    122c <gets+0x66>
    buf[i++] = c;
    11fb:	8b 45 f4             	mov    -0xc(%ebp),%eax
    11fe:	8d 50 01             	lea    0x1(%eax),%edx
    1201:	89 55 f4             	mov    %edx,-0xc(%ebp)
    1204:	89 c2                	mov    %eax,%edx
    1206:	8b 45 08             	mov    0x8(%ebp),%eax
    1209:	01 c2                	add    %eax,%edx
    120b:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    120f:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
    1211:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    1215:	3c 0a                	cmp    $0xa,%al
    1217:	74 13                	je     122c <gets+0x66>
    1219:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    121d:	3c 0d                	cmp    $0xd,%al
    121f:	74 0b                	je     122c <gets+0x66>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1221:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1224:	83 c0 01             	add    $0x1,%eax
    1227:	3b 45 0c             	cmp    0xc(%ebp),%eax
    122a:	7c a9                	jl     11d5 <gets+0xf>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    122c:	8b 55 f4             	mov    -0xc(%ebp),%edx
    122f:	8b 45 08             	mov    0x8(%ebp),%eax
    1232:	01 d0                	add    %edx,%eax
    1234:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
    1237:	8b 45 08             	mov    0x8(%ebp),%eax
}
    123a:	c9                   	leave  
    123b:	c3                   	ret    

0000123c <stat>:

int
stat(char *n, struct stat *st)
{
    123c:	55                   	push   %ebp
    123d:	89 e5                	mov    %esp,%ebp
    123f:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    1242:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1249:	00 
    124a:	8b 45 08             	mov    0x8(%ebp),%eax
    124d:	89 04 24             	mov    %eax,(%esp)
    1250:	e8 07 01 00 00       	call   135c <open>
    1255:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
    1258:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    125c:	79 07                	jns    1265 <stat+0x29>
    return -1;
    125e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    1263:	eb 23                	jmp    1288 <stat+0x4c>
  r = fstat(fd, st);
    1265:	8b 45 0c             	mov    0xc(%ebp),%eax
    1268:	89 44 24 04          	mov    %eax,0x4(%esp)
    126c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    126f:	89 04 24             	mov    %eax,(%esp)
    1272:	e8 fd 00 00 00       	call   1374 <fstat>
    1277:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
    127a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    127d:	89 04 24             	mov    %eax,(%esp)
    1280:	e8 bf 00 00 00       	call   1344 <close>
  return r;
    1285:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
    1288:	c9                   	leave  
    1289:	c3                   	ret    

0000128a <atoi>:

int
atoi(const char *s)
{
    128a:	55                   	push   %ebp
    128b:	89 e5                	mov    %esp,%ebp
    128d:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
    1290:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
    1297:	eb 25                	jmp    12be <atoi+0x34>
    n = n*10 + *s++ - '0';
    1299:	8b 55 fc             	mov    -0x4(%ebp),%edx
    129c:	89 d0                	mov    %edx,%eax
    129e:	c1 e0 02             	shl    $0x2,%eax
    12a1:	01 d0                	add    %edx,%eax
    12a3:	01 c0                	add    %eax,%eax
    12a5:	89 c1                	mov    %eax,%ecx
    12a7:	8b 45 08             	mov    0x8(%ebp),%eax
    12aa:	8d 50 01             	lea    0x1(%eax),%edx
    12ad:	89 55 08             	mov    %edx,0x8(%ebp)
    12b0:	0f b6 00             	movzbl (%eax),%eax
    12b3:	0f be c0             	movsbl %al,%eax
    12b6:	01 c8                	add    %ecx,%eax
    12b8:	83 e8 30             	sub    $0x30,%eax
    12bb:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    12be:	8b 45 08             	mov    0x8(%ebp),%eax
    12c1:	0f b6 00             	movzbl (%eax),%eax
    12c4:	3c 2f                	cmp    $0x2f,%al
    12c6:	7e 0a                	jle    12d2 <atoi+0x48>
    12c8:	8b 45 08             	mov    0x8(%ebp),%eax
    12cb:	0f b6 00             	movzbl (%eax),%eax
    12ce:	3c 39                	cmp    $0x39,%al
    12d0:	7e c7                	jle    1299 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
    12d2:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    12d5:	c9                   	leave  
    12d6:	c3                   	ret    

000012d7 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    12d7:	55                   	push   %ebp
    12d8:	89 e5                	mov    %esp,%ebp
    12da:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
    12dd:	8b 45 08             	mov    0x8(%ebp),%eax
    12e0:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
    12e3:	8b 45 0c             	mov    0xc(%ebp),%eax
    12e6:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
    12e9:	eb 17                	jmp    1302 <memmove+0x2b>
    *dst++ = *src++;
    12eb:	8b 45 fc             	mov    -0x4(%ebp),%eax
    12ee:	8d 50 01             	lea    0x1(%eax),%edx
    12f1:	89 55 fc             	mov    %edx,-0x4(%ebp)
    12f4:	8b 55 f8             	mov    -0x8(%ebp),%edx
    12f7:	8d 4a 01             	lea    0x1(%edx),%ecx
    12fa:	89 4d f8             	mov    %ecx,-0x8(%ebp)
    12fd:	0f b6 12             	movzbl (%edx),%edx
    1300:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    1302:	8b 45 10             	mov    0x10(%ebp),%eax
    1305:	8d 50 ff             	lea    -0x1(%eax),%edx
    1308:	89 55 10             	mov    %edx,0x10(%ebp)
    130b:	85 c0                	test   %eax,%eax
    130d:	7f dc                	jg     12eb <memmove+0x14>
    *dst++ = *src++;
  return vdst;
    130f:	8b 45 08             	mov    0x8(%ebp),%eax
}
    1312:	c9                   	leave  
    1313:	c3                   	ret    

00001314 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    1314:	b8 01 00 00 00       	mov    $0x1,%eax
    1319:	cd 40                	int    $0x40
    131b:	c3                   	ret    

0000131c <exit>:
SYSCALL(exit)
    131c:	b8 02 00 00 00       	mov    $0x2,%eax
    1321:	cd 40                	int    $0x40
    1323:	c3                   	ret    

00001324 <wait>:
SYSCALL(wait)
    1324:	b8 03 00 00 00       	mov    $0x3,%eax
    1329:	cd 40                	int    $0x40
    132b:	c3                   	ret    

0000132c <pipe>:
SYSCALL(pipe)
    132c:	b8 04 00 00 00       	mov    $0x4,%eax
    1331:	cd 40                	int    $0x40
    1333:	c3                   	ret    

00001334 <read>:
SYSCALL(read)
    1334:	b8 05 00 00 00       	mov    $0x5,%eax
    1339:	cd 40                	int    $0x40
    133b:	c3                   	ret    

0000133c <write>:
SYSCALL(write)
    133c:	b8 10 00 00 00       	mov    $0x10,%eax
    1341:	cd 40                	int    $0x40
    1343:	c3                   	ret    

00001344 <close>:
SYSCALL(close)
    1344:	b8 15 00 00 00       	mov    $0x15,%eax
    1349:	cd 40                	int    $0x40
    134b:	c3                   	ret    

0000134c <kill>:
SYSCALL(kill)
    134c:	b8 06 00 00 00       	mov    $0x6,%eax
    1351:	cd 40                	int    $0x40
    1353:	c3                   	ret    

00001354 <exec>:
SYSCALL(exec)
    1354:	b8 07 00 00 00       	mov    $0x7,%eax
    1359:	cd 40                	int    $0x40
    135b:	c3                   	ret    

0000135c <open>:
SYSCALL(open)
    135c:	b8 0f 00 00 00       	mov    $0xf,%eax
    1361:	cd 40                	int    $0x40
    1363:	c3                   	ret    

00001364 <mknod>:
SYSCALL(mknod)
    1364:	b8 11 00 00 00       	mov    $0x11,%eax
    1369:	cd 40                	int    $0x40
    136b:	c3                   	ret    

0000136c <unlink>:
SYSCALL(unlink)
    136c:	b8 12 00 00 00       	mov    $0x12,%eax
    1371:	cd 40                	int    $0x40
    1373:	c3                   	ret    

00001374 <fstat>:
SYSCALL(fstat)
    1374:	b8 08 00 00 00       	mov    $0x8,%eax
    1379:	cd 40                	int    $0x40
    137b:	c3                   	ret    

0000137c <link>:
SYSCALL(link)
    137c:	b8 13 00 00 00       	mov    $0x13,%eax
    1381:	cd 40                	int    $0x40
    1383:	c3                   	ret    

00001384 <mkdir>:
SYSCALL(mkdir)
    1384:	b8 14 00 00 00       	mov    $0x14,%eax
    1389:	cd 40                	int    $0x40
    138b:	c3                   	ret    

0000138c <chdir>:
SYSCALL(chdir)
    138c:	b8 09 00 00 00       	mov    $0x9,%eax
    1391:	cd 40                	int    $0x40
    1393:	c3                   	ret    

00001394 <dup>:
SYSCALL(dup)
    1394:	b8 0a 00 00 00       	mov    $0xa,%eax
    1399:	cd 40                	int    $0x40
    139b:	c3                   	ret    

0000139c <getpid>:
SYSCALL(getpid)
    139c:	b8 0b 00 00 00       	mov    $0xb,%eax
    13a1:	cd 40                	int    $0x40
    13a3:	c3                   	ret    

000013a4 <sbrk>:
SYSCALL(sbrk)
    13a4:	b8 0c 00 00 00       	mov    $0xc,%eax
    13a9:	cd 40                	int    $0x40
    13ab:	c3                   	ret    

000013ac <sleep>:
SYSCALL(sleep)
    13ac:	b8 0d 00 00 00       	mov    $0xd,%eax
    13b1:	cd 40                	int    $0x40
    13b3:	c3                   	ret    

000013b4 <uptime>:
SYSCALL(uptime)
    13b4:	b8 0e 00 00 00       	mov    $0xe,%eax
    13b9:	cd 40                	int    $0x40
    13bb:	c3                   	ret    

000013bc <clone>:
SYSCALL(clone)
    13bc:	b8 16 00 00 00       	mov    $0x16,%eax
    13c1:	cd 40                	int    $0x40
    13c3:	c3                   	ret    

000013c4 <texit>:
SYSCALL(texit)
    13c4:	b8 17 00 00 00       	mov    $0x17,%eax
    13c9:	cd 40                	int    $0x40
    13cb:	c3                   	ret    

000013cc <tsleep>:
SYSCALL(tsleep)
    13cc:	b8 18 00 00 00       	mov    $0x18,%eax
    13d1:	cd 40                	int    $0x40
    13d3:	c3                   	ret    

000013d4 <twakeup>:
SYSCALL(twakeup)
    13d4:	b8 19 00 00 00       	mov    $0x19,%eax
    13d9:	cd 40                	int    $0x40
    13db:	c3                   	ret    

000013dc <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
    13dc:	55                   	push   %ebp
    13dd:	89 e5                	mov    %esp,%ebp
    13df:	83 ec 18             	sub    $0x18,%esp
    13e2:	8b 45 0c             	mov    0xc(%ebp),%eax
    13e5:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
    13e8:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    13ef:	00 
    13f0:	8d 45 f4             	lea    -0xc(%ebp),%eax
    13f3:	89 44 24 04          	mov    %eax,0x4(%esp)
    13f7:	8b 45 08             	mov    0x8(%ebp),%eax
    13fa:	89 04 24             	mov    %eax,(%esp)
    13fd:	e8 3a ff ff ff       	call   133c <write>
}
    1402:	c9                   	leave  
    1403:	c3                   	ret    

00001404 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
    1404:	55                   	push   %ebp
    1405:	89 e5                	mov    %esp,%ebp
    1407:	56                   	push   %esi
    1408:	53                   	push   %ebx
    1409:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    140c:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
    1413:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
    1417:	74 17                	je     1430 <printint+0x2c>
    1419:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    141d:	79 11                	jns    1430 <printint+0x2c>
    neg = 1;
    141f:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
    1426:	8b 45 0c             	mov    0xc(%ebp),%eax
    1429:	f7 d8                	neg    %eax
    142b:	89 45 ec             	mov    %eax,-0x14(%ebp)
    142e:	eb 06                	jmp    1436 <printint+0x32>
  } else {
    x = xx;
    1430:	8b 45 0c             	mov    0xc(%ebp),%eax
    1433:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
    1436:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
    143d:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    1440:	8d 41 01             	lea    0x1(%ecx),%eax
    1443:	89 45 f4             	mov    %eax,-0xc(%ebp)
    1446:	8b 5d 10             	mov    0x10(%ebp),%ebx
    1449:	8b 45 ec             	mov    -0x14(%ebp),%eax
    144c:	ba 00 00 00 00       	mov    $0x0,%edx
    1451:	f7 f3                	div    %ebx
    1453:	89 d0                	mov    %edx,%eax
    1455:	0f b6 80 74 21 00 00 	movzbl 0x2174(%eax),%eax
    145c:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
    1460:	8b 75 10             	mov    0x10(%ebp),%esi
    1463:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1466:	ba 00 00 00 00       	mov    $0x0,%edx
    146b:	f7 f6                	div    %esi
    146d:	89 45 ec             	mov    %eax,-0x14(%ebp)
    1470:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1474:	75 c7                	jne    143d <printint+0x39>
  if(neg)
    1476:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    147a:	74 10                	je     148c <printint+0x88>
    buf[i++] = '-';
    147c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    147f:	8d 50 01             	lea    0x1(%eax),%edx
    1482:	89 55 f4             	mov    %edx,-0xc(%ebp)
    1485:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
    148a:	eb 1f                	jmp    14ab <printint+0xa7>
    148c:	eb 1d                	jmp    14ab <printint+0xa7>
    putc(fd, buf[i]);
    148e:	8d 55 dc             	lea    -0x24(%ebp),%edx
    1491:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1494:	01 d0                	add    %edx,%eax
    1496:	0f b6 00             	movzbl (%eax),%eax
    1499:	0f be c0             	movsbl %al,%eax
    149c:	89 44 24 04          	mov    %eax,0x4(%esp)
    14a0:	8b 45 08             	mov    0x8(%ebp),%eax
    14a3:	89 04 24             	mov    %eax,(%esp)
    14a6:	e8 31 ff ff ff       	call   13dc <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    14ab:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    14af:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    14b3:	79 d9                	jns    148e <printint+0x8a>
    putc(fd, buf[i]);
}
    14b5:	83 c4 30             	add    $0x30,%esp
    14b8:	5b                   	pop    %ebx
    14b9:	5e                   	pop    %esi
    14ba:	5d                   	pop    %ebp
    14bb:	c3                   	ret    

000014bc <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    14bc:	55                   	push   %ebp
    14bd:	89 e5                	mov    %esp,%ebp
    14bf:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
    14c2:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
    14c9:	8d 45 0c             	lea    0xc(%ebp),%eax
    14cc:	83 c0 04             	add    $0x4,%eax
    14cf:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
    14d2:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    14d9:	e9 7c 01 00 00       	jmp    165a <printf+0x19e>
    c = fmt[i] & 0xff;
    14de:	8b 55 0c             	mov    0xc(%ebp),%edx
    14e1:	8b 45 f0             	mov    -0x10(%ebp),%eax
    14e4:	01 d0                	add    %edx,%eax
    14e6:	0f b6 00             	movzbl (%eax),%eax
    14e9:	0f be c0             	movsbl %al,%eax
    14ec:	25 ff 00 00 00       	and    $0xff,%eax
    14f1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
    14f4:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    14f8:	75 2c                	jne    1526 <printf+0x6a>
      if(c == '%'){
    14fa:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    14fe:	75 0c                	jne    150c <printf+0x50>
        state = '%';
    1500:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
    1507:	e9 4a 01 00 00       	jmp    1656 <printf+0x19a>
      } else {
        putc(fd, c);
    150c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    150f:	0f be c0             	movsbl %al,%eax
    1512:	89 44 24 04          	mov    %eax,0x4(%esp)
    1516:	8b 45 08             	mov    0x8(%ebp),%eax
    1519:	89 04 24             	mov    %eax,(%esp)
    151c:	e8 bb fe ff ff       	call   13dc <putc>
    1521:	e9 30 01 00 00       	jmp    1656 <printf+0x19a>
      }
    } else if(state == '%'){
    1526:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
    152a:	0f 85 26 01 00 00    	jne    1656 <printf+0x19a>
      if(c == 'd'){
    1530:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
    1534:	75 2d                	jne    1563 <printf+0xa7>
        printint(fd, *ap, 10, 1);
    1536:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1539:	8b 00                	mov    (%eax),%eax
    153b:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    1542:	00 
    1543:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
    154a:	00 
    154b:	89 44 24 04          	mov    %eax,0x4(%esp)
    154f:	8b 45 08             	mov    0x8(%ebp),%eax
    1552:	89 04 24             	mov    %eax,(%esp)
    1555:	e8 aa fe ff ff       	call   1404 <printint>
        ap++;
    155a:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    155e:	e9 ec 00 00 00       	jmp    164f <printf+0x193>
      } else if(c == 'x' || c == 'p'){
    1563:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
    1567:	74 06                	je     156f <printf+0xb3>
    1569:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
    156d:	75 2d                	jne    159c <printf+0xe0>
        printint(fd, *ap, 16, 0);
    156f:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1572:	8b 00                	mov    (%eax),%eax
    1574:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    157b:	00 
    157c:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
    1583:	00 
    1584:	89 44 24 04          	mov    %eax,0x4(%esp)
    1588:	8b 45 08             	mov    0x8(%ebp),%eax
    158b:	89 04 24             	mov    %eax,(%esp)
    158e:	e8 71 fe ff ff       	call   1404 <printint>
        ap++;
    1593:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    1597:	e9 b3 00 00 00       	jmp    164f <printf+0x193>
      } else if(c == 's'){
    159c:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
    15a0:	75 45                	jne    15e7 <printf+0x12b>
        s = (char*)*ap;
    15a2:	8b 45 e8             	mov    -0x18(%ebp),%eax
    15a5:	8b 00                	mov    (%eax),%eax
    15a7:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
    15aa:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
    15ae:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    15b2:	75 09                	jne    15bd <printf+0x101>
          s = "(null)";
    15b4:	c7 45 f4 1c 1d 00 00 	movl   $0x1d1c,-0xc(%ebp)
        while(*s != 0){
    15bb:	eb 1e                	jmp    15db <printf+0x11f>
    15bd:	eb 1c                	jmp    15db <printf+0x11f>
          putc(fd, *s);
    15bf:	8b 45 f4             	mov    -0xc(%ebp),%eax
    15c2:	0f b6 00             	movzbl (%eax),%eax
    15c5:	0f be c0             	movsbl %al,%eax
    15c8:	89 44 24 04          	mov    %eax,0x4(%esp)
    15cc:	8b 45 08             	mov    0x8(%ebp),%eax
    15cf:	89 04 24             	mov    %eax,(%esp)
    15d2:	e8 05 fe ff ff       	call   13dc <putc>
          s++;
    15d7:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    15db:	8b 45 f4             	mov    -0xc(%ebp),%eax
    15de:	0f b6 00             	movzbl (%eax),%eax
    15e1:	84 c0                	test   %al,%al
    15e3:	75 da                	jne    15bf <printf+0x103>
    15e5:	eb 68                	jmp    164f <printf+0x193>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    15e7:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
    15eb:	75 1d                	jne    160a <printf+0x14e>
        putc(fd, *ap);
    15ed:	8b 45 e8             	mov    -0x18(%ebp),%eax
    15f0:	8b 00                	mov    (%eax),%eax
    15f2:	0f be c0             	movsbl %al,%eax
    15f5:	89 44 24 04          	mov    %eax,0x4(%esp)
    15f9:	8b 45 08             	mov    0x8(%ebp),%eax
    15fc:	89 04 24             	mov    %eax,(%esp)
    15ff:	e8 d8 fd ff ff       	call   13dc <putc>
        ap++;
    1604:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    1608:	eb 45                	jmp    164f <printf+0x193>
      } else if(c == '%'){
    160a:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    160e:	75 17                	jne    1627 <printf+0x16b>
        putc(fd, c);
    1610:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1613:	0f be c0             	movsbl %al,%eax
    1616:	89 44 24 04          	mov    %eax,0x4(%esp)
    161a:	8b 45 08             	mov    0x8(%ebp),%eax
    161d:	89 04 24             	mov    %eax,(%esp)
    1620:	e8 b7 fd ff ff       	call   13dc <putc>
    1625:	eb 28                	jmp    164f <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
    1627:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
    162e:	00 
    162f:	8b 45 08             	mov    0x8(%ebp),%eax
    1632:	89 04 24             	mov    %eax,(%esp)
    1635:	e8 a2 fd ff ff       	call   13dc <putc>
        putc(fd, c);
    163a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    163d:	0f be c0             	movsbl %al,%eax
    1640:	89 44 24 04          	mov    %eax,0x4(%esp)
    1644:	8b 45 08             	mov    0x8(%ebp),%eax
    1647:	89 04 24             	mov    %eax,(%esp)
    164a:	e8 8d fd ff ff       	call   13dc <putc>
      }
      state = 0;
    164f:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1656:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    165a:	8b 55 0c             	mov    0xc(%ebp),%edx
    165d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1660:	01 d0                	add    %edx,%eax
    1662:	0f b6 00             	movzbl (%eax),%eax
    1665:	84 c0                	test   %al,%al
    1667:	0f 85 71 fe ff ff    	jne    14de <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    166d:	c9                   	leave  
    166e:	c3                   	ret    
    166f:	90                   	nop

00001670 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    1670:	55                   	push   %ebp
    1671:	89 e5                	mov    %esp,%ebp
    1673:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
    1676:	8b 45 08             	mov    0x8(%ebp),%eax
    1679:	83 e8 08             	sub    $0x8,%eax
    167c:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    167f:	a1 94 21 00 00       	mov    0x2194,%eax
    1684:	89 45 fc             	mov    %eax,-0x4(%ebp)
    1687:	eb 24                	jmp    16ad <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1689:	8b 45 fc             	mov    -0x4(%ebp),%eax
    168c:	8b 00                	mov    (%eax),%eax
    168e:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    1691:	77 12                	ja     16a5 <free+0x35>
    1693:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1696:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    1699:	77 24                	ja     16bf <free+0x4f>
    169b:	8b 45 fc             	mov    -0x4(%ebp),%eax
    169e:	8b 00                	mov    (%eax),%eax
    16a0:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    16a3:	77 1a                	ja     16bf <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    16a5:	8b 45 fc             	mov    -0x4(%ebp),%eax
    16a8:	8b 00                	mov    (%eax),%eax
    16aa:	89 45 fc             	mov    %eax,-0x4(%ebp)
    16ad:	8b 45 f8             	mov    -0x8(%ebp),%eax
    16b0:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    16b3:	76 d4                	jbe    1689 <free+0x19>
    16b5:	8b 45 fc             	mov    -0x4(%ebp),%eax
    16b8:	8b 00                	mov    (%eax),%eax
    16ba:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    16bd:	76 ca                	jbe    1689 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    16bf:	8b 45 f8             	mov    -0x8(%ebp),%eax
    16c2:	8b 40 04             	mov    0x4(%eax),%eax
    16c5:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    16cc:	8b 45 f8             	mov    -0x8(%ebp),%eax
    16cf:	01 c2                	add    %eax,%edx
    16d1:	8b 45 fc             	mov    -0x4(%ebp),%eax
    16d4:	8b 00                	mov    (%eax),%eax
    16d6:	39 c2                	cmp    %eax,%edx
    16d8:	75 24                	jne    16fe <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
    16da:	8b 45 f8             	mov    -0x8(%ebp),%eax
    16dd:	8b 50 04             	mov    0x4(%eax),%edx
    16e0:	8b 45 fc             	mov    -0x4(%ebp),%eax
    16e3:	8b 00                	mov    (%eax),%eax
    16e5:	8b 40 04             	mov    0x4(%eax),%eax
    16e8:	01 c2                	add    %eax,%edx
    16ea:	8b 45 f8             	mov    -0x8(%ebp),%eax
    16ed:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
    16f0:	8b 45 fc             	mov    -0x4(%ebp),%eax
    16f3:	8b 00                	mov    (%eax),%eax
    16f5:	8b 10                	mov    (%eax),%edx
    16f7:	8b 45 f8             	mov    -0x8(%ebp),%eax
    16fa:	89 10                	mov    %edx,(%eax)
    16fc:	eb 0a                	jmp    1708 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
    16fe:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1701:	8b 10                	mov    (%eax),%edx
    1703:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1706:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
    1708:	8b 45 fc             	mov    -0x4(%ebp),%eax
    170b:	8b 40 04             	mov    0x4(%eax),%eax
    170e:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    1715:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1718:	01 d0                	add    %edx,%eax
    171a:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    171d:	75 20                	jne    173f <free+0xcf>
    p->s.size += bp->s.size;
    171f:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1722:	8b 50 04             	mov    0x4(%eax),%edx
    1725:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1728:	8b 40 04             	mov    0x4(%eax),%eax
    172b:	01 c2                	add    %eax,%edx
    172d:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1730:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    1733:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1736:	8b 10                	mov    (%eax),%edx
    1738:	8b 45 fc             	mov    -0x4(%ebp),%eax
    173b:	89 10                	mov    %edx,(%eax)
    173d:	eb 08                	jmp    1747 <free+0xd7>
  } else
    p->s.ptr = bp;
    173f:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1742:	8b 55 f8             	mov    -0x8(%ebp),%edx
    1745:	89 10                	mov    %edx,(%eax)
  freep = p;
    1747:	8b 45 fc             	mov    -0x4(%ebp),%eax
    174a:	a3 94 21 00 00       	mov    %eax,0x2194
}
    174f:	c9                   	leave  
    1750:	c3                   	ret    

00001751 <morecore>:

static Header*
morecore(uint nu)
{
    1751:	55                   	push   %ebp
    1752:	89 e5                	mov    %esp,%ebp
    1754:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
    1757:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
    175e:	77 07                	ja     1767 <morecore+0x16>
    nu = 4096;
    1760:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
    1767:	8b 45 08             	mov    0x8(%ebp),%eax
    176a:	c1 e0 03             	shl    $0x3,%eax
    176d:	89 04 24             	mov    %eax,(%esp)
    1770:	e8 2f fc ff ff       	call   13a4 <sbrk>
    1775:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
    1778:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
    177c:	75 07                	jne    1785 <morecore+0x34>
    return 0;
    177e:	b8 00 00 00 00       	mov    $0x0,%eax
    1783:	eb 22                	jmp    17a7 <morecore+0x56>
  hp = (Header*)p;
    1785:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1788:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
    178b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    178e:	8b 55 08             	mov    0x8(%ebp),%edx
    1791:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
    1794:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1797:	83 c0 08             	add    $0x8,%eax
    179a:	89 04 24             	mov    %eax,(%esp)
    179d:	e8 ce fe ff ff       	call   1670 <free>
  return freep;
    17a2:	a1 94 21 00 00       	mov    0x2194,%eax
}
    17a7:	c9                   	leave  
    17a8:	c3                   	ret    

000017a9 <malloc>:

void*
malloc(uint nbytes)
{
    17a9:	55                   	push   %ebp
    17aa:	89 e5                	mov    %esp,%ebp
    17ac:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    17af:	8b 45 08             	mov    0x8(%ebp),%eax
    17b2:	83 c0 07             	add    $0x7,%eax
    17b5:	c1 e8 03             	shr    $0x3,%eax
    17b8:	83 c0 01             	add    $0x1,%eax
    17bb:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
    17be:	a1 94 21 00 00       	mov    0x2194,%eax
    17c3:	89 45 f0             	mov    %eax,-0x10(%ebp)
    17c6:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    17ca:	75 23                	jne    17ef <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
    17cc:	c7 45 f0 8c 21 00 00 	movl   $0x218c,-0x10(%ebp)
    17d3:	8b 45 f0             	mov    -0x10(%ebp),%eax
    17d6:	a3 94 21 00 00       	mov    %eax,0x2194
    17db:	a1 94 21 00 00       	mov    0x2194,%eax
    17e0:	a3 8c 21 00 00       	mov    %eax,0x218c
    base.s.size = 0;
    17e5:	c7 05 90 21 00 00 00 	movl   $0x0,0x2190
    17ec:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    17ef:	8b 45 f0             	mov    -0x10(%ebp),%eax
    17f2:	8b 00                	mov    (%eax),%eax
    17f4:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
    17f7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    17fa:	8b 40 04             	mov    0x4(%eax),%eax
    17fd:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    1800:	72 4d                	jb     184f <malloc+0xa6>
      if(p->s.size == nunits)
    1802:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1805:	8b 40 04             	mov    0x4(%eax),%eax
    1808:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    180b:	75 0c                	jne    1819 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
    180d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1810:	8b 10                	mov    (%eax),%edx
    1812:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1815:	89 10                	mov    %edx,(%eax)
    1817:	eb 26                	jmp    183f <malloc+0x96>
      else {
        p->s.size -= nunits;
    1819:	8b 45 f4             	mov    -0xc(%ebp),%eax
    181c:	8b 40 04             	mov    0x4(%eax),%eax
    181f:	2b 45 ec             	sub    -0x14(%ebp),%eax
    1822:	89 c2                	mov    %eax,%edx
    1824:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1827:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
    182a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    182d:	8b 40 04             	mov    0x4(%eax),%eax
    1830:	c1 e0 03             	shl    $0x3,%eax
    1833:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
    1836:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1839:	8b 55 ec             	mov    -0x14(%ebp),%edx
    183c:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
    183f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1842:	a3 94 21 00 00       	mov    %eax,0x2194
      return (void*)(p + 1);
    1847:	8b 45 f4             	mov    -0xc(%ebp),%eax
    184a:	83 c0 08             	add    $0x8,%eax
    184d:	eb 38                	jmp    1887 <malloc+0xde>
    }
    if(p == freep)
    184f:	a1 94 21 00 00       	mov    0x2194,%eax
    1854:	39 45 f4             	cmp    %eax,-0xc(%ebp)
    1857:	75 1b                	jne    1874 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
    1859:	8b 45 ec             	mov    -0x14(%ebp),%eax
    185c:	89 04 24             	mov    %eax,(%esp)
    185f:	e8 ed fe ff ff       	call   1751 <morecore>
    1864:	89 45 f4             	mov    %eax,-0xc(%ebp)
    1867:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    186b:	75 07                	jne    1874 <malloc+0xcb>
        return 0;
    186d:	b8 00 00 00 00       	mov    $0x0,%eax
    1872:	eb 13                	jmp    1887 <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1874:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1877:	89 45 f0             	mov    %eax,-0x10(%ebp)
    187a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    187d:	8b 00                	mov    (%eax),%eax
    187f:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
    1882:	e9 70 ff ff ff       	jmp    17f7 <malloc+0x4e>
}
    1887:	c9                   	leave  
    1888:	c3                   	ret    
    1889:	66 90                	xchg   %ax,%ax
    188b:	90                   	nop

0000188c <xchg>:
  asm volatile("sti");
}

static inline uint
xchg(volatile uint *addr, uint newval)
{
    188c:	55                   	push   %ebp
    188d:	89 e5                	mov    %esp,%ebp
    188f:	83 ec 10             	sub    $0x10,%esp
  uint result;
  
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
    1892:	8b 55 08             	mov    0x8(%ebp),%edx
    1895:	8b 45 0c             	mov    0xc(%ebp),%eax
    1898:	8b 4d 08             	mov    0x8(%ebp),%ecx
    189b:	f0 87 02             	lock xchg %eax,(%edx)
    189e:	89 45 fc             	mov    %eax,-0x4(%ebp)
               "+m" (*addr), "=a" (result) :
               "1" (newval) :
               "cc");
  return result;
    18a1:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    18a4:	c9                   	leave  
    18a5:	c3                   	ret    

000018a6 <lock_init>:
#include "x86.h"
#include "proc.h"

unsigned long rands = 1;

void lock_init(lock_t *lock){
    18a6:	55                   	push   %ebp
    18a7:	89 e5                	mov    %esp,%ebp
    lock->locked = 0;
    18a9:	8b 45 08             	mov    0x8(%ebp),%eax
    18ac:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
    18b2:	5d                   	pop    %ebp
    18b3:	c3                   	ret    

000018b4 <lock_acquire>:
void lock_acquire(lock_t *lock){
    18b4:	55                   	push   %ebp
    18b5:	89 e5                	mov    %esp,%ebp
    18b7:	83 ec 08             	sub    $0x8,%esp
    while(xchg(&lock->locked,1) != 0);
    18ba:	90                   	nop
    18bb:	8b 45 08             	mov    0x8(%ebp),%eax
    18be:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
    18c5:	00 
    18c6:	89 04 24             	mov    %eax,(%esp)
    18c9:	e8 be ff ff ff       	call   188c <xchg>
    18ce:	85 c0                	test   %eax,%eax
    18d0:	75 e9                	jne    18bb <lock_acquire+0x7>
}
    18d2:	c9                   	leave  
    18d3:	c3                   	ret    

000018d4 <lock_release>:
void lock_release(lock_t *lock){
    18d4:	55                   	push   %ebp
    18d5:	89 e5                	mov    %esp,%ebp
    18d7:	83 ec 08             	sub    $0x8,%esp
    xchg(&lock->locked,0);
    18da:	8b 45 08             	mov    0x8(%ebp),%eax
    18dd:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    18e4:	00 
    18e5:	89 04 24             	mov    %eax,(%esp)
    18e8:	e8 9f ff ff ff       	call   188c <xchg>
}
    18ed:	c9                   	leave  
    18ee:	c3                   	ret    

000018ef <thread_create>:


void *thread_create(void(*start_routine)(void*), void *arg){
    18ef:	55                   	push   %ebp
    18f0:	89 e5                	mov    %esp,%ebp
    18f2:	83 ec 28             	sub    $0x28,%esp
    int tid;
    void * stack = malloc(2 * 4096);
    18f5:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
    18fc:	e8 a8 fe ff ff       	call   17a9 <malloc>
    1901:	89 45 f4             	mov    %eax,-0xc(%ebp)
    void *garbage_stack = stack; 
    1904:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1907:	89 45 f0             	mov    %eax,-0x10(%ebp)
   // printf(1,"start routine addr : %d\n",(uint)start_routine);


    if((uint)stack % 4096){
    190a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    190d:	25 ff 0f 00 00       	and    $0xfff,%eax
    1912:	85 c0                	test   %eax,%eax
    1914:	74 14                	je     192a <thread_create+0x3b>
        stack = stack + (4096 - (uint)stack % 4096);
    1916:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1919:	25 ff 0f 00 00       	and    $0xfff,%eax
    191e:	89 c2                	mov    %eax,%edx
    1920:	b8 00 10 00 00       	mov    $0x1000,%eax
    1925:	29 d0                	sub    %edx,%eax
    1927:	01 45 f4             	add    %eax,-0xc(%ebp)
    }
    if (stack == 0){
    192a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    192e:	75 1b                	jne    194b <thread_create+0x5c>

        printf(1,"malloc fail \n");
    1930:	c7 44 24 04 23 1d 00 	movl   $0x1d23,0x4(%esp)
    1937:	00 
    1938:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    193f:	e8 78 fb ff ff       	call   14bc <printf>
        return 0;
    1944:	b8 00 00 00 00       	mov    $0x0,%eax
    1949:	eb 6f                	jmp    19ba <thread_create+0xcb>
    }

    tid = clone((uint)stack,PSIZE,(uint)start_routine,(int)arg);
    194b:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    194e:	8b 55 08             	mov    0x8(%ebp),%edx
    1951:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1954:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
    1958:	89 54 24 08          	mov    %edx,0x8(%esp)
    195c:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
    1963:	00 
    1964:	89 04 24             	mov    %eax,(%esp)
    1967:	e8 50 fa ff ff       	call   13bc <clone>
    196c:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(tid < 0){
    196f:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1973:	79 1b                	jns    1990 <thread_create+0xa1>
        printf(1,"clone fails\n");
    1975:	c7 44 24 04 31 1d 00 	movl   $0x1d31,0x4(%esp)
    197c:	00 
    197d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1984:	e8 33 fb ff ff       	call   14bc <printf>
        return 0;
    1989:	b8 00 00 00 00       	mov    $0x0,%eax
    198e:	eb 2a                	jmp    19ba <thread_create+0xcb>
    }
    if(tid > 0){
    1990:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1994:	7e 05                	jle    199b <thread_create+0xac>
        //store threads on thread table
        return garbage_stack;
    1996:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1999:	eb 1f                	jmp    19ba <thread_create+0xcb>
    }
    if(tid == 0){
    199b:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    199f:	75 14                	jne    19b5 <thread_create+0xc6>
        printf(1,"tid = 0 return \n");
    19a1:	c7 44 24 04 3e 1d 00 	movl   $0x1d3e,0x4(%esp)
    19a8:	00 
    19a9:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    19b0:	e8 07 fb ff ff       	call   14bc <printf>
    }
//    wait();
//    free(garbage_stack);

    return 0;
    19b5:	b8 00 00 00 00       	mov    $0x0,%eax
}
    19ba:	c9                   	leave  
    19bb:	c3                   	ret    

000019bc <random>:

// generate 0 -> max random number exclude max.
int random(int max){
    19bc:	55                   	push   %ebp
    19bd:	89 e5                	mov    %esp,%ebp
    rands = rands * 1664525 + 1013904233;
    19bf:	a1 88 21 00 00       	mov    0x2188,%eax
    19c4:	69 c0 0d 66 19 00    	imul   $0x19660d,%eax,%eax
    19ca:	05 69 f3 6e 3c       	add    $0x3c6ef369,%eax
    19cf:	a3 88 21 00 00       	mov    %eax,0x2188
    return (int)(rands % max);
    19d4:	a1 88 21 00 00       	mov    0x2188,%eax
    19d9:	8b 4d 08             	mov    0x8(%ebp),%ecx
    19dc:	ba 00 00 00 00       	mov    $0x0,%edx
    19e1:	f7 f1                	div    %ecx
    19e3:	89 d0                	mov    %edx,%eax
}
    19e5:	5d                   	pop    %ebp
    19e6:	c3                   	ret    
    19e7:	90                   	nop

000019e8 <init_q>:
#include "queue.h"
#include "types.h"
#include "user.h"

void init_q(struct queue *q){
    19e8:	55                   	push   %ebp
    19e9:	89 e5                	mov    %esp,%ebp
    q->size = 0;
    19eb:	8b 45 08             	mov    0x8(%ebp),%eax
    19ee:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    q->head = 0;
    19f4:	8b 45 08             	mov    0x8(%ebp),%eax
    19f7:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    q->tail = 0;
    19fe:	8b 45 08             	mov    0x8(%ebp),%eax
    1a01:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
}
    1a08:	5d                   	pop    %ebp
    1a09:	c3                   	ret    

00001a0a <add_q>:

void add_q(struct queue *q, int v){
    1a0a:	55                   	push   %ebp
    1a0b:	89 e5                	mov    %esp,%ebp
    1a0d:	83 ec 28             	sub    $0x28,%esp
    struct node * n = malloc(sizeof(struct node));
    1a10:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
    1a17:	e8 8d fd ff ff       	call   17a9 <malloc>
    1a1c:	89 45 f4             	mov    %eax,-0xc(%ebp)
    n->next = 0;
    1a1f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1a22:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    n->value = v;
    1a29:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1a2c:	8b 55 0c             	mov    0xc(%ebp),%edx
    1a2f:	89 10                	mov    %edx,(%eax)
    if(q->head == 0){
    1a31:	8b 45 08             	mov    0x8(%ebp),%eax
    1a34:	8b 40 04             	mov    0x4(%eax),%eax
    1a37:	85 c0                	test   %eax,%eax
    1a39:	75 0b                	jne    1a46 <add_q+0x3c>
        q->head = n;
    1a3b:	8b 45 08             	mov    0x8(%ebp),%eax
    1a3e:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1a41:	89 50 04             	mov    %edx,0x4(%eax)
    1a44:	eb 0c                	jmp    1a52 <add_q+0x48>
    }else{
        q->tail->next = n;
    1a46:	8b 45 08             	mov    0x8(%ebp),%eax
    1a49:	8b 40 08             	mov    0x8(%eax),%eax
    1a4c:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1a4f:	89 50 04             	mov    %edx,0x4(%eax)
    }
    q->tail = n;
    1a52:	8b 45 08             	mov    0x8(%ebp),%eax
    1a55:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1a58:	89 50 08             	mov    %edx,0x8(%eax)
    q->size++;
    1a5b:	8b 45 08             	mov    0x8(%ebp),%eax
    1a5e:	8b 00                	mov    (%eax),%eax
    1a60:	8d 50 01             	lea    0x1(%eax),%edx
    1a63:	8b 45 08             	mov    0x8(%ebp),%eax
    1a66:	89 10                	mov    %edx,(%eax)
}
    1a68:	c9                   	leave  
    1a69:	c3                   	ret    

00001a6a <empty_q>:

int empty_q(struct queue *q){
    1a6a:	55                   	push   %ebp
    1a6b:	89 e5                	mov    %esp,%ebp
    if(q->size == 0)
    1a6d:	8b 45 08             	mov    0x8(%ebp),%eax
    1a70:	8b 00                	mov    (%eax),%eax
    1a72:	85 c0                	test   %eax,%eax
    1a74:	75 07                	jne    1a7d <empty_q+0x13>
        return 1;
    1a76:	b8 01 00 00 00       	mov    $0x1,%eax
    1a7b:	eb 05                	jmp    1a82 <empty_q+0x18>
    else
        return 0;
    1a7d:	b8 00 00 00 00       	mov    $0x0,%eax
} 
    1a82:	5d                   	pop    %ebp
    1a83:	c3                   	ret    

00001a84 <pop_q>:
int pop_q(struct queue *q){
    1a84:	55                   	push   %ebp
    1a85:	89 e5                	mov    %esp,%ebp
    1a87:	83 ec 28             	sub    $0x28,%esp
    int val;
    struct node *destroy;
    if(!empty_q(q)){
    1a8a:	8b 45 08             	mov    0x8(%ebp),%eax
    1a8d:	89 04 24             	mov    %eax,(%esp)
    1a90:	e8 d5 ff ff ff       	call   1a6a <empty_q>
    1a95:	85 c0                	test   %eax,%eax
    1a97:	75 5d                	jne    1af6 <pop_q+0x72>
       val = q->head->value; 
    1a99:	8b 45 08             	mov    0x8(%ebp),%eax
    1a9c:	8b 40 04             	mov    0x4(%eax),%eax
    1a9f:	8b 00                	mov    (%eax),%eax
    1aa1:	89 45 f4             	mov    %eax,-0xc(%ebp)
       destroy = q->head;
    1aa4:	8b 45 08             	mov    0x8(%ebp),%eax
    1aa7:	8b 40 04             	mov    0x4(%eax),%eax
    1aaa:	89 45 f0             	mov    %eax,-0x10(%ebp)
       q->head = q->head->next;
    1aad:	8b 45 08             	mov    0x8(%ebp),%eax
    1ab0:	8b 40 04             	mov    0x4(%eax),%eax
    1ab3:	8b 50 04             	mov    0x4(%eax),%edx
    1ab6:	8b 45 08             	mov    0x8(%ebp),%eax
    1ab9:	89 50 04             	mov    %edx,0x4(%eax)
       free(destroy);
    1abc:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1abf:	89 04 24             	mov    %eax,(%esp)
    1ac2:	e8 a9 fb ff ff       	call   1670 <free>
       q->size--;
    1ac7:	8b 45 08             	mov    0x8(%ebp),%eax
    1aca:	8b 00                	mov    (%eax),%eax
    1acc:	8d 50 ff             	lea    -0x1(%eax),%edx
    1acf:	8b 45 08             	mov    0x8(%ebp),%eax
    1ad2:	89 10                	mov    %edx,(%eax)
       if(q->size == 0){
    1ad4:	8b 45 08             	mov    0x8(%ebp),%eax
    1ad7:	8b 00                	mov    (%eax),%eax
    1ad9:	85 c0                	test   %eax,%eax
    1adb:	75 14                	jne    1af1 <pop_q+0x6d>
            q->head = 0;
    1add:	8b 45 08             	mov    0x8(%ebp),%eax
    1ae0:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
            q->tail = 0;
    1ae7:	8b 45 08             	mov    0x8(%ebp),%eax
    1aea:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
       }
       return val;
    1af1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1af4:	eb 05                	jmp    1afb <pop_q+0x77>
    }
    return -1;
    1af6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
    1afb:	c9                   	leave  
    1afc:	c3                   	ret    

00001afd <dominant>:

void dominant(struct queue* q, int i){
    1afd:	55                   	push   %ebp
    1afe:	89 e5                	mov    %esp,%ebp
    1b00:	83 ec 28             	sub    $0x28,%esp
    struct node * n = malloc(sizeof(struct node));
    1b03:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
    1b0a:	e8 9a fc ff ff       	call   17a9 <malloc>
    1b0f:	89 45 f4             	mov    %eax,-0xc(%ebp)
    n->value = i;
    1b12:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1b15:	8b 55 0c             	mov    0xc(%ebp),%edx
    1b18:	89 10                	mov    %edx,(%eax)

    if(q->head == 0){
    1b1a:	8b 45 08             	mov    0x8(%ebp),%eax
    1b1d:	8b 40 04             	mov    0x4(%eax),%eax
    1b20:	85 c0                	test   %eax,%eax
    1b22:	75 14                	jne    1b38 <dominant+0x3b>
        q->head = n;
    1b24:	8b 45 08             	mov    0x8(%ebp),%eax
    1b27:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1b2a:	89 50 04             	mov    %edx,0x4(%eax)
        q->tail = n;
    1b2d:	8b 45 08             	mov    0x8(%ebp),%eax
    1b30:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1b33:	89 50 08             	mov    %edx,0x8(%eax)
    1b36:	eb 15                	jmp    1b4d <dominant+0x50>
    }
    else{
        n->next = q->head;
    1b38:	8b 45 08             	mov    0x8(%ebp),%eax
    1b3b:	8b 50 04             	mov    0x4(%eax),%edx
    1b3e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1b41:	89 50 04             	mov    %edx,0x4(%eax)
        q->head = n;
    1b44:	8b 45 08             	mov    0x8(%ebp),%eax
    1b47:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1b4a:	89 50 04             	mov    %edx,0x4(%eax)
    }
    q->size++;
    1b4d:	8b 45 08             	mov    0x8(%ebp),%eax
    1b50:	8b 00                	mov    (%eax),%eax
    1b52:	8d 50 01             	lea    0x1(%eax),%edx
    1b55:	8b 45 08             	mov    0x8(%ebp),%eax
    1b58:	89 10                	mov    %edx,(%eax)
}
    1b5a:	c9                   	leave  
    1b5b:	c3                   	ret    

00001b5c <sem_init>:
#include "semaphore.h"
#include "user.h"

// Initializes the semaphore
void sem_init(struct Semaphore* s, int value){
    1b5c:	55                   	push   %ebp
    1b5d:	89 e5                	mov    %esp,%ebp
    1b5f:	83 ec 18             	sub    $0x18,%esp
    s->val = value;
    1b62:	8b 45 08             	mov    0x8(%ebp),%eax
    1b65:	8b 55 0c             	mov    0xc(%ebp),%edx
    1b68:	89 10                	mov    %edx,(%eax)
    lock_init(&s->lock);
    1b6a:	8b 45 08             	mov    0x8(%ebp),%eax
    1b6d:	83 c0 04             	add    $0x4,%eax
    1b70:	89 04 24             	mov    %eax,(%esp)
    1b73:	e8 2e fd ff ff       	call   18a6 <lock_init>
    init_q(&s->q);
    1b78:	8b 45 08             	mov    0x8(%ebp),%eax
    1b7b:	83 c0 08             	add    $0x8,%eax
    1b7e:	89 04 24             	mov    %eax,(%esp)
    1b81:	e8 62 fe ff ff       	call   19e8 <init_q>
}
    1b86:	c9                   	leave  
    1b87:	c3                   	ret    

00001b88 <sem_acquire>:

// Decrements the semaphore
void sem_acquire(struct Semaphore* s){
    1b88:	55                   	push   %ebp
    1b89:	89 e5                	mov    %esp,%ebp
    1b8b:	83 ec 28             	sub    $0x28,%esp
    lock_acquire(&s->lock);
    1b8e:	8b 45 08             	mov    0x8(%ebp),%eax
    1b91:	83 c0 04             	add    $0x4,%eax
    1b94:	89 04 24             	mov    %eax,(%esp)
    1b97:	e8 18 fd ff ff       	call   18b4 <lock_acquire>

    if(s->val == 0){
    1b9c:	8b 45 08             	mov    0x8(%ebp),%eax
    1b9f:	8b 00                	mov    (%eax),%eax
    1ba1:	85 c0                	test   %eax,%eax
    1ba3:	75 32                	jne    1bd7 <sem_acquire+0x4f>
        int pid;
        pid = getpid();
    1ba5:	e8 f2 f7 ff ff       	call   139c <getpid>
    1baa:	89 45 f4             	mov    %eax,-0xc(%ebp)
        add_q(&s->q, pid);
    1bad:	8b 45 08             	mov    0x8(%ebp),%eax
    1bb0:	8d 50 08             	lea    0x8(%eax),%edx
    1bb3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1bb6:	89 44 24 04          	mov    %eax,0x4(%esp)
    1bba:	89 14 24             	mov    %edx,(%esp)
    1bbd:	e8 48 fe ff ff       	call   1a0a <add_q>
        lock_release(&s->lock);
    1bc2:	8b 45 08             	mov    0x8(%ebp),%eax
    1bc5:	83 c0 04             	add    $0x4,%eax
    1bc8:	89 04 24             	mov    %eax,(%esp)
    1bcb:	e8 04 fd ff ff       	call   18d4 <lock_release>
        tsleep();
    1bd0:	e8 f7 f7 ff ff       	call   13cc <tsleep>
    1bd5:	eb 1b                	jmp    1bf2 <sem_acquire+0x6a>
    }
    else{
        s->val--;
    1bd7:	8b 45 08             	mov    0x8(%ebp),%eax
    1bda:	8b 00                	mov    (%eax),%eax
    1bdc:	8d 50 ff             	lea    -0x1(%eax),%edx
    1bdf:	8b 45 08             	mov    0x8(%ebp),%eax
    1be2:	89 10                	mov    %edx,(%eax)
        lock_release(&s->lock);
    1be4:	8b 45 08             	mov    0x8(%ebp),%eax
    1be7:	83 c0 04             	add    $0x4,%eax
    1bea:	89 04 24             	mov    %eax,(%esp)
    1bed:	e8 e2 fc ff ff       	call   18d4 <lock_release>
    }
}
    1bf2:	c9                   	leave  
    1bf3:	c3                   	ret    

00001bf4 <sem_signal>:

// Increments the semaphore
void sem_signal(struct Semaphore* s){
    1bf4:	55                   	push   %ebp
    1bf5:	89 e5                	mov    %esp,%ebp
    1bf7:	83 ec 18             	sub    $0x18,%esp
    lock_acquire(&s->lock);
    1bfa:	8b 45 08             	mov    0x8(%ebp),%eax
    1bfd:	83 c0 04             	add    $0x4,%eax
    1c00:	89 04 24             	mov    %eax,(%esp)
    1c03:	e8 ac fc ff ff       	call   18b4 <lock_acquire>

    if(!empty_q(&s->q)){
    1c08:	8b 45 08             	mov    0x8(%ebp),%eax
    1c0b:	83 c0 08             	add    $0x8,%eax
    1c0e:	89 04 24             	mov    %eax,(%esp)
    1c11:	e8 54 fe ff ff       	call   1a6a <empty_q>
    1c16:	85 c0                	test   %eax,%eax
    1c18:	75 18                	jne    1c32 <sem_signal+0x3e>
        twakeup(pop_q(&s->q));
    1c1a:	8b 45 08             	mov    0x8(%ebp),%eax
    1c1d:	83 c0 08             	add    $0x8,%eax
    1c20:	89 04 24             	mov    %eax,(%esp)
    1c23:	e8 5c fe ff ff       	call   1a84 <pop_q>
    1c28:	89 04 24             	mov    %eax,(%esp)
    1c2b:	e8 a4 f7 ff ff       	call   13d4 <twakeup>
    1c30:	eb 0d                	jmp    1c3f <sem_signal+0x4b>
    }
    else{
        s->val++;
    1c32:	8b 45 08             	mov    0x8(%ebp),%eax
    1c35:	8b 00                	mov    (%eax),%eax
    1c37:	8d 50 01             	lea    0x1(%eax),%edx
    1c3a:	8b 45 08             	mov    0x8(%ebp),%eax
    1c3d:	89 10                	mov    %edx,(%eax)
    }

    lock_release(&s->lock);
    1c3f:	8b 45 08             	mov    0x8(%ebp),%eax
    1c42:	83 c0 04             	add    $0x4,%eax
    1c45:	89 04 24             	mov    %eax,(%esp)
    1c48:	e8 87 fc ff ff       	call   18d4 <lock_release>
}
    1c4d:	c9                   	leave  
    1c4e:	c3                   	ret    

00001c4f <sem_dom_acquire>:

void sem_dom_acquire(struct Semaphore* s){
    1c4f:	55                   	push   %ebp
    1c50:	89 e5                	mov    %esp,%ebp
    1c52:	83 ec 18             	sub    $0x18,%esp
    lock_acquire(&s->lock);
    1c55:	8b 45 08             	mov    0x8(%ebp),%eax
    1c58:	83 c0 04             	add    $0x4,%eax
    1c5b:	89 04 24             	mov    %eax,(%esp)
    1c5e:	e8 51 fc ff ff       	call   18b4 <lock_acquire>

    if(s->val > 0){
    1c63:	8b 45 08             	mov    0x8(%ebp),%eax
    1c66:	8b 00                	mov    (%eax),%eax
    1c68:	85 c0                	test   %eax,%eax
    1c6a:	7e 1d                	jle    1c89 <sem_dom_acquire+0x3a>
        s->val--;
    1c6c:	8b 45 08             	mov    0x8(%ebp),%eax
    1c6f:	8b 00                	mov    (%eax),%eax
    1c71:	8d 50 ff             	lea    -0x1(%eax),%edx
    1c74:	8b 45 08             	mov    0x8(%ebp),%eax
    1c77:	89 10                	mov    %edx,(%eax)
        lock_release(&s->lock);
    1c79:	8b 45 08             	mov    0x8(%ebp),%eax
    1c7c:	83 c0 04             	add    $0x4,%eax
    1c7f:	89 04 24             	mov    %eax,(%esp)
    1c82:	e8 4d fc ff ff       	call   18d4 <lock_release>
        return;
    1c87:	eb 2a                	jmp    1cb3 <sem_dom_acquire+0x64>
    }

    dominant(&s->q,getpid());
    1c89:	e8 0e f7 ff ff       	call   139c <getpid>
    1c8e:	8b 55 08             	mov    0x8(%ebp),%edx
    1c91:	83 c2 08             	add    $0x8,%edx
    1c94:	89 44 24 04          	mov    %eax,0x4(%esp)
    1c98:	89 14 24             	mov    %edx,(%esp)
    1c9b:	e8 5d fe ff ff       	call   1afd <dominant>
    lock_release(&s->lock);
    1ca0:	8b 45 08             	mov    0x8(%ebp),%eax
    1ca3:	83 c0 04             	add    $0x4,%eax
    1ca6:	89 04 24             	mov    %eax,(%esp)
    1ca9:	e8 26 fc ff ff       	call   18d4 <lock_release>
    tsleep();
    1cae:	e8 19 f7 ff ff       	call   13cc <tsleep>
}
    1cb3:	c9                   	leave  
    1cb4:	c3                   	ret    
