
_ln:     file format elf32-i386


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
    1006:	83 ec 10             	sub    $0x10,%esp
  if(argc != 3){
    1009:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
    100d:	74 19                	je     1028 <main+0x28>
    printf(2, "Usage: ln old new\n");
    100f:	c7 44 24 04 7d 1c 00 	movl   $0x1c7d,0x4(%esp)
    1016:	00 
    1017:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
    101e:	e8 61 04 00 00       	call   1484 <printf>
    exit();
    1023:	e8 bc 02 00 00       	call   12e4 <exit>
  }
  if(link(argv[1], argv[2]) < 0)
    1028:	8b 45 0c             	mov    0xc(%ebp),%eax
    102b:	83 c0 08             	add    $0x8,%eax
    102e:	8b 10                	mov    (%eax),%edx
    1030:	8b 45 0c             	mov    0xc(%ebp),%eax
    1033:	83 c0 04             	add    $0x4,%eax
    1036:	8b 00                	mov    (%eax),%eax
    1038:	89 54 24 04          	mov    %edx,0x4(%esp)
    103c:	89 04 24             	mov    %eax,(%esp)
    103f:	e8 00 03 00 00       	call   1344 <link>
    1044:	85 c0                	test   %eax,%eax
    1046:	79 2c                	jns    1074 <main+0x74>
    printf(2, "link %s %s: failed\n", argv[1], argv[2]);
    1048:	8b 45 0c             	mov    0xc(%ebp),%eax
    104b:	83 c0 08             	add    $0x8,%eax
    104e:	8b 10                	mov    (%eax),%edx
    1050:	8b 45 0c             	mov    0xc(%ebp),%eax
    1053:	83 c0 04             	add    $0x4,%eax
    1056:	8b 00                	mov    (%eax),%eax
    1058:	89 54 24 0c          	mov    %edx,0xc(%esp)
    105c:	89 44 24 08          	mov    %eax,0x8(%esp)
    1060:	c7 44 24 04 90 1c 00 	movl   $0x1c90,0x4(%esp)
    1067:	00 
    1068:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
    106f:	e8 10 04 00 00       	call   1484 <printf>
  exit();
    1074:	e8 6b 02 00 00       	call   12e4 <exit>
    1079:	66 90                	xchg   %ax,%ax
    107b:	90                   	nop

0000107c <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
    107c:	55                   	push   %ebp
    107d:	89 e5                	mov    %esp,%ebp
    107f:	57                   	push   %edi
    1080:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
    1081:	8b 4d 08             	mov    0x8(%ebp),%ecx
    1084:	8b 55 10             	mov    0x10(%ebp),%edx
    1087:	8b 45 0c             	mov    0xc(%ebp),%eax
    108a:	89 cb                	mov    %ecx,%ebx
    108c:	89 df                	mov    %ebx,%edi
    108e:	89 d1                	mov    %edx,%ecx
    1090:	fc                   	cld    
    1091:	f3 aa                	rep stos %al,%es:(%edi)
    1093:	89 ca                	mov    %ecx,%edx
    1095:	89 fb                	mov    %edi,%ebx
    1097:	89 5d 08             	mov    %ebx,0x8(%ebp)
    109a:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
    109d:	5b                   	pop    %ebx
    109e:	5f                   	pop    %edi
    109f:	5d                   	pop    %ebp
    10a0:	c3                   	ret    

000010a1 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
    10a1:	55                   	push   %ebp
    10a2:	89 e5                	mov    %esp,%ebp
    10a4:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
    10a7:	8b 45 08             	mov    0x8(%ebp),%eax
    10aa:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
    10ad:	90                   	nop
    10ae:	8b 45 08             	mov    0x8(%ebp),%eax
    10b1:	8d 50 01             	lea    0x1(%eax),%edx
    10b4:	89 55 08             	mov    %edx,0x8(%ebp)
    10b7:	8b 55 0c             	mov    0xc(%ebp),%edx
    10ba:	8d 4a 01             	lea    0x1(%edx),%ecx
    10bd:	89 4d 0c             	mov    %ecx,0xc(%ebp)
    10c0:	0f b6 12             	movzbl (%edx),%edx
    10c3:	88 10                	mov    %dl,(%eax)
    10c5:	0f b6 00             	movzbl (%eax),%eax
    10c8:	84 c0                	test   %al,%al
    10ca:	75 e2                	jne    10ae <strcpy+0xd>
    ;
  return os;
    10cc:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    10cf:	c9                   	leave  
    10d0:	c3                   	ret    

000010d1 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    10d1:	55                   	push   %ebp
    10d2:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
    10d4:	eb 08                	jmp    10de <strcmp+0xd>
    p++, q++;
    10d6:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    10da:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    10de:	8b 45 08             	mov    0x8(%ebp),%eax
    10e1:	0f b6 00             	movzbl (%eax),%eax
    10e4:	84 c0                	test   %al,%al
    10e6:	74 10                	je     10f8 <strcmp+0x27>
    10e8:	8b 45 08             	mov    0x8(%ebp),%eax
    10eb:	0f b6 10             	movzbl (%eax),%edx
    10ee:	8b 45 0c             	mov    0xc(%ebp),%eax
    10f1:	0f b6 00             	movzbl (%eax),%eax
    10f4:	38 c2                	cmp    %al,%dl
    10f6:	74 de                	je     10d6 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
    10f8:	8b 45 08             	mov    0x8(%ebp),%eax
    10fb:	0f b6 00             	movzbl (%eax),%eax
    10fe:	0f b6 d0             	movzbl %al,%edx
    1101:	8b 45 0c             	mov    0xc(%ebp),%eax
    1104:	0f b6 00             	movzbl (%eax),%eax
    1107:	0f b6 c0             	movzbl %al,%eax
    110a:	29 c2                	sub    %eax,%edx
    110c:	89 d0                	mov    %edx,%eax
}
    110e:	5d                   	pop    %ebp
    110f:	c3                   	ret    

00001110 <strlen>:

uint
strlen(char *s)
{
    1110:	55                   	push   %ebp
    1111:	89 e5                	mov    %esp,%ebp
    1113:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
    1116:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    111d:	eb 04                	jmp    1123 <strlen+0x13>
    111f:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    1123:	8b 55 fc             	mov    -0x4(%ebp),%edx
    1126:	8b 45 08             	mov    0x8(%ebp),%eax
    1129:	01 d0                	add    %edx,%eax
    112b:	0f b6 00             	movzbl (%eax),%eax
    112e:	84 c0                	test   %al,%al
    1130:	75 ed                	jne    111f <strlen+0xf>
    ;
  return n;
    1132:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    1135:	c9                   	leave  
    1136:	c3                   	ret    

00001137 <memset>:

void*
memset(void *dst, int c, uint n)
{
    1137:	55                   	push   %ebp
    1138:	89 e5                	mov    %esp,%ebp
    113a:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
    113d:	8b 45 10             	mov    0x10(%ebp),%eax
    1140:	89 44 24 08          	mov    %eax,0x8(%esp)
    1144:	8b 45 0c             	mov    0xc(%ebp),%eax
    1147:	89 44 24 04          	mov    %eax,0x4(%esp)
    114b:	8b 45 08             	mov    0x8(%ebp),%eax
    114e:	89 04 24             	mov    %eax,(%esp)
    1151:	e8 26 ff ff ff       	call   107c <stosb>
  return dst;
    1156:	8b 45 08             	mov    0x8(%ebp),%eax
}
    1159:	c9                   	leave  
    115a:	c3                   	ret    

0000115b <strchr>:

char*
strchr(const char *s, char c)
{
    115b:	55                   	push   %ebp
    115c:	89 e5                	mov    %esp,%ebp
    115e:	83 ec 04             	sub    $0x4,%esp
    1161:	8b 45 0c             	mov    0xc(%ebp),%eax
    1164:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
    1167:	eb 14                	jmp    117d <strchr+0x22>
    if(*s == c)
    1169:	8b 45 08             	mov    0x8(%ebp),%eax
    116c:	0f b6 00             	movzbl (%eax),%eax
    116f:	3a 45 fc             	cmp    -0x4(%ebp),%al
    1172:	75 05                	jne    1179 <strchr+0x1e>
      return (char*)s;
    1174:	8b 45 08             	mov    0x8(%ebp),%eax
    1177:	eb 13                	jmp    118c <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
    1179:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    117d:	8b 45 08             	mov    0x8(%ebp),%eax
    1180:	0f b6 00             	movzbl (%eax),%eax
    1183:	84 c0                	test   %al,%al
    1185:	75 e2                	jne    1169 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
    1187:	b8 00 00 00 00       	mov    $0x0,%eax
}
    118c:	c9                   	leave  
    118d:	c3                   	ret    

0000118e <gets>:

char*
gets(char *buf, int max)
{
    118e:	55                   	push   %ebp
    118f:	89 e5                	mov    %esp,%ebp
    1191:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1194:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    119b:	eb 4c                	jmp    11e9 <gets+0x5b>
    cc = read(0, &c, 1);
    119d:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    11a4:	00 
    11a5:	8d 45 ef             	lea    -0x11(%ebp),%eax
    11a8:	89 44 24 04          	mov    %eax,0x4(%esp)
    11ac:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    11b3:	e8 44 01 00 00       	call   12fc <read>
    11b8:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
    11bb:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    11bf:	7f 02                	jg     11c3 <gets+0x35>
      break;
    11c1:	eb 31                	jmp    11f4 <gets+0x66>
    buf[i++] = c;
    11c3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    11c6:	8d 50 01             	lea    0x1(%eax),%edx
    11c9:	89 55 f4             	mov    %edx,-0xc(%ebp)
    11cc:	89 c2                	mov    %eax,%edx
    11ce:	8b 45 08             	mov    0x8(%ebp),%eax
    11d1:	01 c2                	add    %eax,%edx
    11d3:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    11d7:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
    11d9:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    11dd:	3c 0a                	cmp    $0xa,%al
    11df:	74 13                	je     11f4 <gets+0x66>
    11e1:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    11e5:	3c 0d                	cmp    $0xd,%al
    11e7:	74 0b                	je     11f4 <gets+0x66>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    11e9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    11ec:	83 c0 01             	add    $0x1,%eax
    11ef:	3b 45 0c             	cmp    0xc(%ebp),%eax
    11f2:	7c a9                	jl     119d <gets+0xf>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    11f4:	8b 55 f4             	mov    -0xc(%ebp),%edx
    11f7:	8b 45 08             	mov    0x8(%ebp),%eax
    11fa:	01 d0                	add    %edx,%eax
    11fc:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
    11ff:	8b 45 08             	mov    0x8(%ebp),%eax
}
    1202:	c9                   	leave  
    1203:	c3                   	ret    

00001204 <stat>:

int
stat(char *n, struct stat *st)
{
    1204:	55                   	push   %ebp
    1205:	89 e5                	mov    %esp,%ebp
    1207:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    120a:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1211:	00 
    1212:	8b 45 08             	mov    0x8(%ebp),%eax
    1215:	89 04 24             	mov    %eax,(%esp)
    1218:	e8 07 01 00 00       	call   1324 <open>
    121d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
    1220:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1224:	79 07                	jns    122d <stat+0x29>
    return -1;
    1226:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    122b:	eb 23                	jmp    1250 <stat+0x4c>
  r = fstat(fd, st);
    122d:	8b 45 0c             	mov    0xc(%ebp),%eax
    1230:	89 44 24 04          	mov    %eax,0x4(%esp)
    1234:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1237:	89 04 24             	mov    %eax,(%esp)
    123a:	e8 fd 00 00 00       	call   133c <fstat>
    123f:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
    1242:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1245:	89 04 24             	mov    %eax,(%esp)
    1248:	e8 bf 00 00 00       	call   130c <close>
  return r;
    124d:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
    1250:	c9                   	leave  
    1251:	c3                   	ret    

00001252 <atoi>:

int
atoi(const char *s)
{
    1252:	55                   	push   %ebp
    1253:	89 e5                	mov    %esp,%ebp
    1255:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
    1258:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
    125f:	eb 25                	jmp    1286 <atoi+0x34>
    n = n*10 + *s++ - '0';
    1261:	8b 55 fc             	mov    -0x4(%ebp),%edx
    1264:	89 d0                	mov    %edx,%eax
    1266:	c1 e0 02             	shl    $0x2,%eax
    1269:	01 d0                	add    %edx,%eax
    126b:	01 c0                	add    %eax,%eax
    126d:	89 c1                	mov    %eax,%ecx
    126f:	8b 45 08             	mov    0x8(%ebp),%eax
    1272:	8d 50 01             	lea    0x1(%eax),%edx
    1275:	89 55 08             	mov    %edx,0x8(%ebp)
    1278:	0f b6 00             	movzbl (%eax),%eax
    127b:	0f be c0             	movsbl %al,%eax
    127e:	01 c8                	add    %ecx,%eax
    1280:	83 e8 30             	sub    $0x30,%eax
    1283:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    1286:	8b 45 08             	mov    0x8(%ebp),%eax
    1289:	0f b6 00             	movzbl (%eax),%eax
    128c:	3c 2f                	cmp    $0x2f,%al
    128e:	7e 0a                	jle    129a <atoi+0x48>
    1290:	8b 45 08             	mov    0x8(%ebp),%eax
    1293:	0f b6 00             	movzbl (%eax),%eax
    1296:	3c 39                	cmp    $0x39,%al
    1298:	7e c7                	jle    1261 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
    129a:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    129d:	c9                   	leave  
    129e:	c3                   	ret    

0000129f <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    129f:	55                   	push   %ebp
    12a0:	89 e5                	mov    %esp,%ebp
    12a2:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
    12a5:	8b 45 08             	mov    0x8(%ebp),%eax
    12a8:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
    12ab:	8b 45 0c             	mov    0xc(%ebp),%eax
    12ae:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
    12b1:	eb 17                	jmp    12ca <memmove+0x2b>
    *dst++ = *src++;
    12b3:	8b 45 fc             	mov    -0x4(%ebp),%eax
    12b6:	8d 50 01             	lea    0x1(%eax),%edx
    12b9:	89 55 fc             	mov    %edx,-0x4(%ebp)
    12bc:	8b 55 f8             	mov    -0x8(%ebp),%edx
    12bf:	8d 4a 01             	lea    0x1(%edx),%ecx
    12c2:	89 4d f8             	mov    %ecx,-0x8(%ebp)
    12c5:	0f b6 12             	movzbl (%edx),%edx
    12c8:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    12ca:	8b 45 10             	mov    0x10(%ebp),%eax
    12cd:	8d 50 ff             	lea    -0x1(%eax),%edx
    12d0:	89 55 10             	mov    %edx,0x10(%ebp)
    12d3:	85 c0                	test   %eax,%eax
    12d5:	7f dc                	jg     12b3 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
    12d7:	8b 45 08             	mov    0x8(%ebp),%eax
}
    12da:	c9                   	leave  
    12db:	c3                   	ret    

000012dc <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    12dc:	b8 01 00 00 00       	mov    $0x1,%eax
    12e1:	cd 40                	int    $0x40
    12e3:	c3                   	ret    

000012e4 <exit>:
SYSCALL(exit)
    12e4:	b8 02 00 00 00       	mov    $0x2,%eax
    12e9:	cd 40                	int    $0x40
    12eb:	c3                   	ret    

000012ec <wait>:
SYSCALL(wait)
    12ec:	b8 03 00 00 00       	mov    $0x3,%eax
    12f1:	cd 40                	int    $0x40
    12f3:	c3                   	ret    

000012f4 <pipe>:
SYSCALL(pipe)
    12f4:	b8 04 00 00 00       	mov    $0x4,%eax
    12f9:	cd 40                	int    $0x40
    12fb:	c3                   	ret    

000012fc <read>:
SYSCALL(read)
    12fc:	b8 05 00 00 00       	mov    $0x5,%eax
    1301:	cd 40                	int    $0x40
    1303:	c3                   	ret    

00001304 <write>:
SYSCALL(write)
    1304:	b8 10 00 00 00       	mov    $0x10,%eax
    1309:	cd 40                	int    $0x40
    130b:	c3                   	ret    

0000130c <close>:
SYSCALL(close)
    130c:	b8 15 00 00 00       	mov    $0x15,%eax
    1311:	cd 40                	int    $0x40
    1313:	c3                   	ret    

00001314 <kill>:
SYSCALL(kill)
    1314:	b8 06 00 00 00       	mov    $0x6,%eax
    1319:	cd 40                	int    $0x40
    131b:	c3                   	ret    

0000131c <exec>:
SYSCALL(exec)
    131c:	b8 07 00 00 00       	mov    $0x7,%eax
    1321:	cd 40                	int    $0x40
    1323:	c3                   	ret    

00001324 <open>:
SYSCALL(open)
    1324:	b8 0f 00 00 00       	mov    $0xf,%eax
    1329:	cd 40                	int    $0x40
    132b:	c3                   	ret    

0000132c <mknod>:
SYSCALL(mknod)
    132c:	b8 11 00 00 00       	mov    $0x11,%eax
    1331:	cd 40                	int    $0x40
    1333:	c3                   	ret    

00001334 <unlink>:
SYSCALL(unlink)
    1334:	b8 12 00 00 00       	mov    $0x12,%eax
    1339:	cd 40                	int    $0x40
    133b:	c3                   	ret    

0000133c <fstat>:
SYSCALL(fstat)
    133c:	b8 08 00 00 00       	mov    $0x8,%eax
    1341:	cd 40                	int    $0x40
    1343:	c3                   	ret    

00001344 <link>:
SYSCALL(link)
    1344:	b8 13 00 00 00       	mov    $0x13,%eax
    1349:	cd 40                	int    $0x40
    134b:	c3                   	ret    

0000134c <mkdir>:
SYSCALL(mkdir)
    134c:	b8 14 00 00 00       	mov    $0x14,%eax
    1351:	cd 40                	int    $0x40
    1353:	c3                   	ret    

00001354 <chdir>:
SYSCALL(chdir)
    1354:	b8 09 00 00 00       	mov    $0x9,%eax
    1359:	cd 40                	int    $0x40
    135b:	c3                   	ret    

0000135c <dup>:
SYSCALL(dup)
    135c:	b8 0a 00 00 00       	mov    $0xa,%eax
    1361:	cd 40                	int    $0x40
    1363:	c3                   	ret    

00001364 <getpid>:
SYSCALL(getpid)
    1364:	b8 0b 00 00 00       	mov    $0xb,%eax
    1369:	cd 40                	int    $0x40
    136b:	c3                   	ret    

0000136c <sbrk>:
SYSCALL(sbrk)
    136c:	b8 0c 00 00 00       	mov    $0xc,%eax
    1371:	cd 40                	int    $0x40
    1373:	c3                   	ret    

00001374 <sleep>:
SYSCALL(sleep)
    1374:	b8 0d 00 00 00       	mov    $0xd,%eax
    1379:	cd 40                	int    $0x40
    137b:	c3                   	ret    

0000137c <uptime>:
SYSCALL(uptime)
    137c:	b8 0e 00 00 00       	mov    $0xe,%eax
    1381:	cd 40                	int    $0x40
    1383:	c3                   	ret    

00001384 <clone>:
SYSCALL(clone)
    1384:	b8 16 00 00 00       	mov    $0x16,%eax
    1389:	cd 40                	int    $0x40
    138b:	c3                   	ret    

0000138c <texit>:
SYSCALL(texit)
    138c:	b8 17 00 00 00       	mov    $0x17,%eax
    1391:	cd 40                	int    $0x40
    1393:	c3                   	ret    

00001394 <tsleep>:
SYSCALL(tsleep)
    1394:	b8 18 00 00 00       	mov    $0x18,%eax
    1399:	cd 40                	int    $0x40
    139b:	c3                   	ret    

0000139c <twakeup>:
SYSCALL(twakeup)
    139c:	b8 19 00 00 00       	mov    $0x19,%eax
    13a1:	cd 40                	int    $0x40
    13a3:	c3                   	ret    

000013a4 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
    13a4:	55                   	push   %ebp
    13a5:	89 e5                	mov    %esp,%ebp
    13a7:	83 ec 18             	sub    $0x18,%esp
    13aa:	8b 45 0c             	mov    0xc(%ebp),%eax
    13ad:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
    13b0:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    13b7:	00 
    13b8:	8d 45 f4             	lea    -0xc(%ebp),%eax
    13bb:	89 44 24 04          	mov    %eax,0x4(%esp)
    13bf:	8b 45 08             	mov    0x8(%ebp),%eax
    13c2:	89 04 24             	mov    %eax,(%esp)
    13c5:	e8 3a ff ff ff       	call   1304 <write>
}
    13ca:	c9                   	leave  
    13cb:	c3                   	ret    

000013cc <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
    13cc:	55                   	push   %ebp
    13cd:	89 e5                	mov    %esp,%ebp
    13cf:	56                   	push   %esi
    13d0:	53                   	push   %ebx
    13d1:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    13d4:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
    13db:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
    13df:	74 17                	je     13f8 <printint+0x2c>
    13e1:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    13e5:	79 11                	jns    13f8 <printint+0x2c>
    neg = 1;
    13e7:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
    13ee:	8b 45 0c             	mov    0xc(%ebp),%eax
    13f1:	f7 d8                	neg    %eax
    13f3:	89 45 ec             	mov    %eax,-0x14(%ebp)
    13f6:	eb 06                	jmp    13fe <printint+0x32>
  } else {
    x = xx;
    13f8:	8b 45 0c             	mov    0xc(%ebp),%eax
    13fb:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
    13fe:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
    1405:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    1408:	8d 41 01             	lea    0x1(%ecx),%eax
    140b:	89 45 f4             	mov    %eax,-0xc(%ebp)
    140e:	8b 5d 10             	mov    0x10(%ebp),%ebx
    1411:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1414:	ba 00 00 00 00       	mov    $0x0,%edx
    1419:	f7 f3                	div    %ebx
    141b:	89 d0                	mov    %edx,%eax
    141d:	0f b6 80 fc 20 00 00 	movzbl 0x20fc(%eax),%eax
    1424:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
    1428:	8b 75 10             	mov    0x10(%ebp),%esi
    142b:	8b 45 ec             	mov    -0x14(%ebp),%eax
    142e:	ba 00 00 00 00       	mov    $0x0,%edx
    1433:	f7 f6                	div    %esi
    1435:	89 45 ec             	mov    %eax,-0x14(%ebp)
    1438:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    143c:	75 c7                	jne    1405 <printint+0x39>
  if(neg)
    143e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1442:	74 10                	je     1454 <printint+0x88>
    buf[i++] = '-';
    1444:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1447:	8d 50 01             	lea    0x1(%eax),%edx
    144a:	89 55 f4             	mov    %edx,-0xc(%ebp)
    144d:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
    1452:	eb 1f                	jmp    1473 <printint+0xa7>
    1454:	eb 1d                	jmp    1473 <printint+0xa7>
    putc(fd, buf[i]);
    1456:	8d 55 dc             	lea    -0x24(%ebp),%edx
    1459:	8b 45 f4             	mov    -0xc(%ebp),%eax
    145c:	01 d0                	add    %edx,%eax
    145e:	0f b6 00             	movzbl (%eax),%eax
    1461:	0f be c0             	movsbl %al,%eax
    1464:	89 44 24 04          	mov    %eax,0x4(%esp)
    1468:	8b 45 08             	mov    0x8(%ebp),%eax
    146b:	89 04 24             	mov    %eax,(%esp)
    146e:	e8 31 ff ff ff       	call   13a4 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    1473:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    1477:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    147b:	79 d9                	jns    1456 <printint+0x8a>
    putc(fd, buf[i]);
}
    147d:	83 c4 30             	add    $0x30,%esp
    1480:	5b                   	pop    %ebx
    1481:	5e                   	pop    %esi
    1482:	5d                   	pop    %ebp
    1483:	c3                   	ret    

00001484 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    1484:	55                   	push   %ebp
    1485:	89 e5                	mov    %esp,%ebp
    1487:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
    148a:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
    1491:	8d 45 0c             	lea    0xc(%ebp),%eax
    1494:	83 c0 04             	add    $0x4,%eax
    1497:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
    149a:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    14a1:	e9 7c 01 00 00       	jmp    1622 <printf+0x19e>
    c = fmt[i] & 0xff;
    14a6:	8b 55 0c             	mov    0xc(%ebp),%edx
    14a9:	8b 45 f0             	mov    -0x10(%ebp),%eax
    14ac:	01 d0                	add    %edx,%eax
    14ae:	0f b6 00             	movzbl (%eax),%eax
    14b1:	0f be c0             	movsbl %al,%eax
    14b4:	25 ff 00 00 00       	and    $0xff,%eax
    14b9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
    14bc:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    14c0:	75 2c                	jne    14ee <printf+0x6a>
      if(c == '%'){
    14c2:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    14c6:	75 0c                	jne    14d4 <printf+0x50>
        state = '%';
    14c8:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
    14cf:	e9 4a 01 00 00       	jmp    161e <printf+0x19a>
      } else {
        putc(fd, c);
    14d4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    14d7:	0f be c0             	movsbl %al,%eax
    14da:	89 44 24 04          	mov    %eax,0x4(%esp)
    14de:	8b 45 08             	mov    0x8(%ebp),%eax
    14e1:	89 04 24             	mov    %eax,(%esp)
    14e4:	e8 bb fe ff ff       	call   13a4 <putc>
    14e9:	e9 30 01 00 00       	jmp    161e <printf+0x19a>
      }
    } else if(state == '%'){
    14ee:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
    14f2:	0f 85 26 01 00 00    	jne    161e <printf+0x19a>
      if(c == 'd'){
    14f8:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
    14fc:	75 2d                	jne    152b <printf+0xa7>
        printint(fd, *ap, 10, 1);
    14fe:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1501:	8b 00                	mov    (%eax),%eax
    1503:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    150a:	00 
    150b:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
    1512:	00 
    1513:	89 44 24 04          	mov    %eax,0x4(%esp)
    1517:	8b 45 08             	mov    0x8(%ebp),%eax
    151a:	89 04 24             	mov    %eax,(%esp)
    151d:	e8 aa fe ff ff       	call   13cc <printint>
        ap++;
    1522:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    1526:	e9 ec 00 00 00       	jmp    1617 <printf+0x193>
      } else if(c == 'x' || c == 'p'){
    152b:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
    152f:	74 06                	je     1537 <printf+0xb3>
    1531:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
    1535:	75 2d                	jne    1564 <printf+0xe0>
        printint(fd, *ap, 16, 0);
    1537:	8b 45 e8             	mov    -0x18(%ebp),%eax
    153a:	8b 00                	mov    (%eax),%eax
    153c:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    1543:	00 
    1544:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
    154b:	00 
    154c:	89 44 24 04          	mov    %eax,0x4(%esp)
    1550:	8b 45 08             	mov    0x8(%ebp),%eax
    1553:	89 04 24             	mov    %eax,(%esp)
    1556:	e8 71 fe ff ff       	call   13cc <printint>
        ap++;
    155b:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    155f:	e9 b3 00 00 00       	jmp    1617 <printf+0x193>
      } else if(c == 's'){
    1564:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
    1568:	75 45                	jne    15af <printf+0x12b>
        s = (char*)*ap;
    156a:	8b 45 e8             	mov    -0x18(%ebp),%eax
    156d:	8b 00                	mov    (%eax),%eax
    156f:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
    1572:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
    1576:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    157a:	75 09                	jne    1585 <printf+0x101>
          s = "(null)";
    157c:	c7 45 f4 a4 1c 00 00 	movl   $0x1ca4,-0xc(%ebp)
        while(*s != 0){
    1583:	eb 1e                	jmp    15a3 <printf+0x11f>
    1585:	eb 1c                	jmp    15a3 <printf+0x11f>
          putc(fd, *s);
    1587:	8b 45 f4             	mov    -0xc(%ebp),%eax
    158a:	0f b6 00             	movzbl (%eax),%eax
    158d:	0f be c0             	movsbl %al,%eax
    1590:	89 44 24 04          	mov    %eax,0x4(%esp)
    1594:	8b 45 08             	mov    0x8(%ebp),%eax
    1597:	89 04 24             	mov    %eax,(%esp)
    159a:	e8 05 fe ff ff       	call   13a4 <putc>
          s++;
    159f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    15a3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    15a6:	0f b6 00             	movzbl (%eax),%eax
    15a9:	84 c0                	test   %al,%al
    15ab:	75 da                	jne    1587 <printf+0x103>
    15ad:	eb 68                	jmp    1617 <printf+0x193>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    15af:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
    15b3:	75 1d                	jne    15d2 <printf+0x14e>
        putc(fd, *ap);
    15b5:	8b 45 e8             	mov    -0x18(%ebp),%eax
    15b8:	8b 00                	mov    (%eax),%eax
    15ba:	0f be c0             	movsbl %al,%eax
    15bd:	89 44 24 04          	mov    %eax,0x4(%esp)
    15c1:	8b 45 08             	mov    0x8(%ebp),%eax
    15c4:	89 04 24             	mov    %eax,(%esp)
    15c7:	e8 d8 fd ff ff       	call   13a4 <putc>
        ap++;
    15cc:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    15d0:	eb 45                	jmp    1617 <printf+0x193>
      } else if(c == '%'){
    15d2:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    15d6:	75 17                	jne    15ef <printf+0x16b>
        putc(fd, c);
    15d8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    15db:	0f be c0             	movsbl %al,%eax
    15de:	89 44 24 04          	mov    %eax,0x4(%esp)
    15e2:	8b 45 08             	mov    0x8(%ebp),%eax
    15e5:	89 04 24             	mov    %eax,(%esp)
    15e8:	e8 b7 fd ff ff       	call   13a4 <putc>
    15ed:	eb 28                	jmp    1617 <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
    15ef:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
    15f6:	00 
    15f7:	8b 45 08             	mov    0x8(%ebp),%eax
    15fa:	89 04 24             	mov    %eax,(%esp)
    15fd:	e8 a2 fd ff ff       	call   13a4 <putc>
        putc(fd, c);
    1602:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1605:	0f be c0             	movsbl %al,%eax
    1608:	89 44 24 04          	mov    %eax,0x4(%esp)
    160c:	8b 45 08             	mov    0x8(%ebp),%eax
    160f:	89 04 24             	mov    %eax,(%esp)
    1612:	e8 8d fd ff ff       	call   13a4 <putc>
      }
      state = 0;
    1617:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    161e:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    1622:	8b 55 0c             	mov    0xc(%ebp),%edx
    1625:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1628:	01 d0                	add    %edx,%eax
    162a:	0f b6 00             	movzbl (%eax),%eax
    162d:	84 c0                	test   %al,%al
    162f:	0f 85 71 fe ff ff    	jne    14a6 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    1635:	c9                   	leave  
    1636:	c3                   	ret    
    1637:	90                   	nop

00001638 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    1638:	55                   	push   %ebp
    1639:	89 e5                	mov    %esp,%ebp
    163b:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
    163e:	8b 45 08             	mov    0x8(%ebp),%eax
    1641:	83 e8 08             	sub    $0x8,%eax
    1644:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1647:	a1 1c 21 00 00       	mov    0x211c,%eax
    164c:	89 45 fc             	mov    %eax,-0x4(%ebp)
    164f:	eb 24                	jmp    1675 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1651:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1654:	8b 00                	mov    (%eax),%eax
    1656:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    1659:	77 12                	ja     166d <free+0x35>
    165b:	8b 45 f8             	mov    -0x8(%ebp),%eax
    165e:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    1661:	77 24                	ja     1687 <free+0x4f>
    1663:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1666:	8b 00                	mov    (%eax),%eax
    1668:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    166b:	77 1a                	ja     1687 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    166d:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1670:	8b 00                	mov    (%eax),%eax
    1672:	89 45 fc             	mov    %eax,-0x4(%ebp)
    1675:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1678:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    167b:	76 d4                	jbe    1651 <free+0x19>
    167d:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1680:	8b 00                	mov    (%eax),%eax
    1682:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    1685:	76 ca                	jbe    1651 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    1687:	8b 45 f8             	mov    -0x8(%ebp),%eax
    168a:	8b 40 04             	mov    0x4(%eax),%eax
    168d:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    1694:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1697:	01 c2                	add    %eax,%edx
    1699:	8b 45 fc             	mov    -0x4(%ebp),%eax
    169c:	8b 00                	mov    (%eax),%eax
    169e:	39 c2                	cmp    %eax,%edx
    16a0:	75 24                	jne    16c6 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
    16a2:	8b 45 f8             	mov    -0x8(%ebp),%eax
    16a5:	8b 50 04             	mov    0x4(%eax),%edx
    16a8:	8b 45 fc             	mov    -0x4(%ebp),%eax
    16ab:	8b 00                	mov    (%eax),%eax
    16ad:	8b 40 04             	mov    0x4(%eax),%eax
    16b0:	01 c2                	add    %eax,%edx
    16b2:	8b 45 f8             	mov    -0x8(%ebp),%eax
    16b5:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
    16b8:	8b 45 fc             	mov    -0x4(%ebp),%eax
    16bb:	8b 00                	mov    (%eax),%eax
    16bd:	8b 10                	mov    (%eax),%edx
    16bf:	8b 45 f8             	mov    -0x8(%ebp),%eax
    16c2:	89 10                	mov    %edx,(%eax)
    16c4:	eb 0a                	jmp    16d0 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
    16c6:	8b 45 fc             	mov    -0x4(%ebp),%eax
    16c9:	8b 10                	mov    (%eax),%edx
    16cb:	8b 45 f8             	mov    -0x8(%ebp),%eax
    16ce:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
    16d0:	8b 45 fc             	mov    -0x4(%ebp),%eax
    16d3:	8b 40 04             	mov    0x4(%eax),%eax
    16d6:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    16dd:	8b 45 fc             	mov    -0x4(%ebp),%eax
    16e0:	01 d0                	add    %edx,%eax
    16e2:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    16e5:	75 20                	jne    1707 <free+0xcf>
    p->s.size += bp->s.size;
    16e7:	8b 45 fc             	mov    -0x4(%ebp),%eax
    16ea:	8b 50 04             	mov    0x4(%eax),%edx
    16ed:	8b 45 f8             	mov    -0x8(%ebp),%eax
    16f0:	8b 40 04             	mov    0x4(%eax),%eax
    16f3:	01 c2                	add    %eax,%edx
    16f5:	8b 45 fc             	mov    -0x4(%ebp),%eax
    16f8:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    16fb:	8b 45 f8             	mov    -0x8(%ebp),%eax
    16fe:	8b 10                	mov    (%eax),%edx
    1700:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1703:	89 10                	mov    %edx,(%eax)
    1705:	eb 08                	jmp    170f <free+0xd7>
  } else
    p->s.ptr = bp;
    1707:	8b 45 fc             	mov    -0x4(%ebp),%eax
    170a:	8b 55 f8             	mov    -0x8(%ebp),%edx
    170d:	89 10                	mov    %edx,(%eax)
  freep = p;
    170f:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1712:	a3 1c 21 00 00       	mov    %eax,0x211c
}
    1717:	c9                   	leave  
    1718:	c3                   	ret    

00001719 <morecore>:

static Header*
morecore(uint nu)
{
    1719:	55                   	push   %ebp
    171a:	89 e5                	mov    %esp,%ebp
    171c:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
    171f:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
    1726:	77 07                	ja     172f <morecore+0x16>
    nu = 4096;
    1728:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
    172f:	8b 45 08             	mov    0x8(%ebp),%eax
    1732:	c1 e0 03             	shl    $0x3,%eax
    1735:	89 04 24             	mov    %eax,(%esp)
    1738:	e8 2f fc ff ff       	call   136c <sbrk>
    173d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
    1740:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
    1744:	75 07                	jne    174d <morecore+0x34>
    return 0;
    1746:	b8 00 00 00 00       	mov    $0x0,%eax
    174b:	eb 22                	jmp    176f <morecore+0x56>
  hp = (Header*)p;
    174d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1750:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
    1753:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1756:	8b 55 08             	mov    0x8(%ebp),%edx
    1759:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
    175c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    175f:	83 c0 08             	add    $0x8,%eax
    1762:	89 04 24             	mov    %eax,(%esp)
    1765:	e8 ce fe ff ff       	call   1638 <free>
  return freep;
    176a:	a1 1c 21 00 00       	mov    0x211c,%eax
}
    176f:	c9                   	leave  
    1770:	c3                   	ret    

00001771 <malloc>:

void*
malloc(uint nbytes)
{
    1771:	55                   	push   %ebp
    1772:	89 e5                	mov    %esp,%ebp
    1774:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1777:	8b 45 08             	mov    0x8(%ebp),%eax
    177a:	83 c0 07             	add    $0x7,%eax
    177d:	c1 e8 03             	shr    $0x3,%eax
    1780:	83 c0 01             	add    $0x1,%eax
    1783:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
    1786:	a1 1c 21 00 00       	mov    0x211c,%eax
    178b:	89 45 f0             	mov    %eax,-0x10(%ebp)
    178e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1792:	75 23                	jne    17b7 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
    1794:	c7 45 f0 14 21 00 00 	movl   $0x2114,-0x10(%ebp)
    179b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    179e:	a3 1c 21 00 00       	mov    %eax,0x211c
    17a3:	a1 1c 21 00 00       	mov    0x211c,%eax
    17a8:	a3 14 21 00 00       	mov    %eax,0x2114
    base.s.size = 0;
    17ad:	c7 05 18 21 00 00 00 	movl   $0x0,0x2118
    17b4:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    17b7:	8b 45 f0             	mov    -0x10(%ebp),%eax
    17ba:	8b 00                	mov    (%eax),%eax
    17bc:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
    17bf:	8b 45 f4             	mov    -0xc(%ebp),%eax
    17c2:	8b 40 04             	mov    0x4(%eax),%eax
    17c5:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    17c8:	72 4d                	jb     1817 <malloc+0xa6>
      if(p->s.size == nunits)
    17ca:	8b 45 f4             	mov    -0xc(%ebp),%eax
    17cd:	8b 40 04             	mov    0x4(%eax),%eax
    17d0:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    17d3:	75 0c                	jne    17e1 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
    17d5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    17d8:	8b 10                	mov    (%eax),%edx
    17da:	8b 45 f0             	mov    -0x10(%ebp),%eax
    17dd:	89 10                	mov    %edx,(%eax)
    17df:	eb 26                	jmp    1807 <malloc+0x96>
      else {
        p->s.size -= nunits;
    17e1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    17e4:	8b 40 04             	mov    0x4(%eax),%eax
    17e7:	2b 45 ec             	sub    -0x14(%ebp),%eax
    17ea:	89 c2                	mov    %eax,%edx
    17ec:	8b 45 f4             	mov    -0xc(%ebp),%eax
    17ef:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
    17f2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    17f5:	8b 40 04             	mov    0x4(%eax),%eax
    17f8:	c1 e0 03             	shl    $0x3,%eax
    17fb:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
    17fe:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1801:	8b 55 ec             	mov    -0x14(%ebp),%edx
    1804:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
    1807:	8b 45 f0             	mov    -0x10(%ebp),%eax
    180a:	a3 1c 21 00 00       	mov    %eax,0x211c
      return (void*)(p + 1);
    180f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1812:	83 c0 08             	add    $0x8,%eax
    1815:	eb 38                	jmp    184f <malloc+0xde>
    }
    if(p == freep)
    1817:	a1 1c 21 00 00       	mov    0x211c,%eax
    181c:	39 45 f4             	cmp    %eax,-0xc(%ebp)
    181f:	75 1b                	jne    183c <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
    1821:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1824:	89 04 24             	mov    %eax,(%esp)
    1827:	e8 ed fe ff ff       	call   1719 <morecore>
    182c:	89 45 f4             	mov    %eax,-0xc(%ebp)
    182f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1833:	75 07                	jne    183c <malloc+0xcb>
        return 0;
    1835:	b8 00 00 00 00       	mov    $0x0,%eax
    183a:	eb 13                	jmp    184f <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    183c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    183f:	89 45 f0             	mov    %eax,-0x10(%ebp)
    1842:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1845:	8b 00                	mov    (%eax),%eax
    1847:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
    184a:	e9 70 ff ff ff       	jmp    17bf <malloc+0x4e>
}
    184f:	c9                   	leave  
    1850:	c3                   	ret    
    1851:	66 90                	xchg   %ax,%ax
    1853:	90                   	nop

00001854 <xchg>:
  asm volatile("sti");
}

static inline uint
xchg(volatile uint *addr, uint newval)
{
    1854:	55                   	push   %ebp
    1855:	89 e5                	mov    %esp,%ebp
    1857:	83 ec 10             	sub    $0x10,%esp
  uint result;
  
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
    185a:	8b 55 08             	mov    0x8(%ebp),%edx
    185d:	8b 45 0c             	mov    0xc(%ebp),%eax
    1860:	8b 4d 08             	mov    0x8(%ebp),%ecx
    1863:	f0 87 02             	lock xchg %eax,(%edx)
    1866:	89 45 fc             	mov    %eax,-0x4(%ebp)
               "+m" (*addr), "=a" (result) :
               "1" (newval) :
               "cc");
  return result;
    1869:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    186c:	c9                   	leave  
    186d:	c3                   	ret    

0000186e <lock_init>:
#include "x86.h"
#include "proc.h"

unsigned long rands = 1;

void lock_init(lock_t *lock){
    186e:	55                   	push   %ebp
    186f:	89 e5                	mov    %esp,%ebp
    lock->locked = 0;
    1871:	8b 45 08             	mov    0x8(%ebp),%eax
    1874:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
    187a:	5d                   	pop    %ebp
    187b:	c3                   	ret    

0000187c <lock_acquire>:
void lock_acquire(lock_t *lock){
    187c:	55                   	push   %ebp
    187d:	89 e5                	mov    %esp,%ebp
    187f:	83 ec 08             	sub    $0x8,%esp
    while(xchg(&lock->locked,1) != 0);
    1882:	90                   	nop
    1883:	8b 45 08             	mov    0x8(%ebp),%eax
    1886:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
    188d:	00 
    188e:	89 04 24             	mov    %eax,(%esp)
    1891:	e8 be ff ff ff       	call   1854 <xchg>
    1896:	85 c0                	test   %eax,%eax
    1898:	75 e9                	jne    1883 <lock_acquire+0x7>
}
    189a:	c9                   	leave  
    189b:	c3                   	ret    

0000189c <lock_release>:
void lock_release(lock_t *lock){
    189c:	55                   	push   %ebp
    189d:	89 e5                	mov    %esp,%ebp
    189f:	83 ec 08             	sub    $0x8,%esp
    xchg(&lock->locked,0);
    18a2:	8b 45 08             	mov    0x8(%ebp),%eax
    18a5:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    18ac:	00 
    18ad:	89 04 24             	mov    %eax,(%esp)
    18b0:	e8 9f ff ff ff       	call   1854 <xchg>
}
    18b5:	c9                   	leave  
    18b6:	c3                   	ret    

000018b7 <thread_create>:


void *thread_create(void(*start_routine)(void*), void *arg){
    18b7:	55                   	push   %ebp
    18b8:	89 e5                	mov    %esp,%ebp
    18ba:	83 ec 28             	sub    $0x28,%esp
    int tid;
    void * stack = malloc(2 * 4096);
    18bd:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
    18c4:	e8 a8 fe ff ff       	call   1771 <malloc>
    18c9:	89 45 f4             	mov    %eax,-0xc(%ebp)
    void *garbage_stack = stack; 
    18cc:	8b 45 f4             	mov    -0xc(%ebp),%eax
    18cf:	89 45 f0             	mov    %eax,-0x10(%ebp)
   // printf(1,"start routine addr : %d\n",(uint)start_routine);


    if((uint)stack % 4096){
    18d2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    18d5:	25 ff 0f 00 00       	and    $0xfff,%eax
    18da:	85 c0                	test   %eax,%eax
    18dc:	74 14                	je     18f2 <thread_create+0x3b>
        stack = stack + (4096 - (uint)stack % 4096);
    18de:	8b 45 f4             	mov    -0xc(%ebp),%eax
    18e1:	25 ff 0f 00 00       	and    $0xfff,%eax
    18e6:	89 c2                	mov    %eax,%edx
    18e8:	b8 00 10 00 00       	mov    $0x1000,%eax
    18ed:	29 d0                	sub    %edx,%eax
    18ef:	01 45 f4             	add    %eax,-0xc(%ebp)
    }
    if (stack == 0){
    18f2:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    18f6:	75 1b                	jne    1913 <thread_create+0x5c>

        printf(1,"malloc fail \n");
    18f8:	c7 44 24 04 ab 1c 00 	movl   $0x1cab,0x4(%esp)
    18ff:	00 
    1900:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1907:	e8 78 fb ff ff       	call   1484 <printf>
        return 0;
    190c:	b8 00 00 00 00       	mov    $0x0,%eax
    1911:	eb 6f                	jmp    1982 <thread_create+0xcb>
    }

    tid = clone((uint)stack,PSIZE,(uint)start_routine,(int)arg);
    1913:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    1916:	8b 55 08             	mov    0x8(%ebp),%edx
    1919:	8b 45 f4             	mov    -0xc(%ebp),%eax
    191c:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
    1920:	89 54 24 08          	mov    %edx,0x8(%esp)
    1924:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
    192b:	00 
    192c:	89 04 24             	mov    %eax,(%esp)
    192f:	e8 50 fa ff ff       	call   1384 <clone>
    1934:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(tid < 0){
    1937:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    193b:	79 1b                	jns    1958 <thread_create+0xa1>
        printf(1,"clone fails\n");
    193d:	c7 44 24 04 b9 1c 00 	movl   $0x1cb9,0x4(%esp)
    1944:	00 
    1945:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    194c:	e8 33 fb ff ff       	call   1484 <printf>
        return 0;
    1951:	b8 00 00 00 00       	mov    $0x0,%eax
    1956:	eb 2a                	jmp    1982 <thread_create+0xcb>
    }
    if(tid > 0){
    1958:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    195c:	7e 05                	jle    1963 <thread_create+0xac>
        //store threads on thread table
        return garbage_stack;
    195e:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1961:	eb 1f                	jmp    1982 <thread_create+0xcb>
    }
    if(tid == 0){
    1963:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1967:	75 14                	jne    197d <thread_create+0xc6>
        printf(1,"tid = 0 return \n");
    1969:	c7 44 24 04 c6 1c 00 	movl   $0x1cc6,0x4(%esp)
    1970:	00 
    1971:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1978:	e8 07 fb ff ff       	call   1484 <printf>
    }
//    wait();
//    free(garbage_stack);

    return 0;
    197d:	b8 00 00 00 00       	mov    $0x0,%eax
}
    1982:	c9                   	leave  
    1983:	c3                   	ret    

00001984 <random>:

// generate 0 -> max random number exclude max.
int random(int max){
    1984:	55                   	push   %ebp
    1985:	89 e5                	mov    %esp,%ebp
    rands = rands * 1664525 + 1013904233;
    1987:	a1 10 21 00 00       	mov    0x2110,%eax
    198c:	69 c0 0d 66 19 00    	imul   $0x19660d,%eax,%eax
    1992:	05 69 f3 6e 3c       	add    $0x3c6ef369,%eax
    1997:	a3 10 21 00 00       	mov    %eax,0x2110
    return (int)(rands % max);
    199c:	a1 10 21 00 00       	mov    0x2110,%eax
    19a1:	8b 4d 08             	mov    0x8(%ebp),%ecx
    19a4:	ba 00 00 00 00       	mov    $0x0,%edx
    19a9:	f7 f1                	div    %ecx
    19ab:	89 d0                	mov    %edx,%eax
}
    19ad:	5d                   	pop    %ebp
    19ae:	c3                   	ret    
    19af:	90                   	nop

000019b0 <init_q>:
#include "queue.h"
#include "types.h"
#include "user.h"

void init_q(struct queue *q){
    19b0:	55                   	push   %ebp
    19b1:	89 e5                	mov    %esp,%ebp
    q->size = 0;
    19b3:	8b 45 08             	mov    0x8(%ebp),%eax
    19b6:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    q->head = 0;
    19bc:	8b 45 08             	mov    0x8(%ebp),%eax
    19bf:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    q->tail = 0;
    19c6:	8b 45 08             	mov    0x8(%ebp),%eax
    19c9:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
}
    19d0:	5d                   	pop    %ebp
    19d1:	c3                   	ret    

000019d2 <add_q>:

void add_q(struct queue *q, int v){
    19d2:	55                   	push   %ebp
    19d3:	89 e5                	mov    %esp,%ebp
    19d5:	83 ec 28             	sub    $0x28,%esp
    struct node * n = malloc(sizeof(struct node));
    19d8:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
    19df:	e8 8d fd ff ff       	call   1771 <malloc>
    19e4:	89 45 f4             	mov    %eax,-0xc(%ebp)
    n->next = 0;
    19e7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    19ea:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    n->value = v;
    19f1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    19f4:	8b 55 0c             	mov    0xc(%ebp),%edx
    19f7:	89 10                	mov    %edx,(%eax)
    if(q->head == 0){
    19f9:	8b 45 08             	mov    0x8(%ebp),%eax
    19fc:	8b 40 04             	mov    0x4(%eax),%eax
    19ff:	85 c0                	test   %eax,%eax
    1a01:	75 0b                	jne    1a0e <add_q+0x3c>
        q->head = n;
    1a03:	8b 45 08             	mov    0x8(%ebp),%eax
    1a06:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1a09:	89 50 04             	mov    %edx,0x4(%eax)
    1a0c:	eb 0c                	jmp    1a1a <add_q+0x48>
    }else{
        q->tail->next = n;
    1a0e:	8b 45 08             	mov    0x8(%ebp),%eax
    1a11:	8b 40 08             	mov    0x8(%eax),%eax
    1a14:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1a17:	89 50 04             	mov    %edx,0x4(%eax)
    }
    q->tail = n;
    1a1a:	8b 45 08             	mov    0x8(%ebp),%eax
    1a1d:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1a20:	89 50 08             	mov    %edx,0x8(%eax)
    q->size++;
    1a23:	8b 45 08             	mov    0x8(%ebp),%eax
    1a26:	8b 00                	mov    (%eax),%eax
    1a28:	8d 50 01             	lea    0x1(%eax),%edx
    1a2b:	8b 45 08             	mov    0x8(%ebp),%eax
    1a2e:	89 10                	mov    %edx,(%eax)
}
    1a30:	c9                   	leave  
    1a31:	c3                   	ret    

00001a32 <empty_q>:

int empty_q(struct queue *q){
    1a32:	55                   	push   %ebp
    1a33:	89 e5                	mov    %esp,%ebp
    if(q->size == 0)
    1a35:	8b 45 08             	mov    0x8(%ebp),%eax
    1a38:	8b 00                	mov    (%eax),%eax
    1a3a:	85 c0                	test   %eax,%eax
    1a3c:	75 07                	jne    1a45 <empty_q+0x13>
        return 1;
    1a3e:	b8 01 00 00 00       	mov    $0x1,%eax
    1a43:	eb 05                	jmp    1a4a <empty_q+0x18>
    else
        return 0;
    1a45:	b8 00 00 00 00       	mov    $0x0,%eax
} 
    1a4a:	5d                   	pop    %ebp
    1a4b:	c3                   	ret    

00001a4c <pop_q>:
int pop_q(struct queue *q){
    1a4c:	55                   	push   %ebp
    1a4d:	89 e5                	mov    %esp,%ebp
    1a4f:	83 ec 28             	sub    $0x28,%esp
    int val;
    struct node *destroy;
    if(!empty_q(q)){
    1a52:	8b 45 08             	mov    0x8(%ebp),%eax
    1a55:	89 04 24             	mov    %eax,(%esp)
    1a58:	e8 d5 ff ff ff       	call   1a32 <empty_q>
    1a5d:	85 c0                	test   %eax,%eax
    1a5f:	75 5d                	jne    1abe <pop_q+0x72>
       val = q->head->value; 
    1a61:	8b 45 08             	mov    0x8(%ebp),%eax
    1a64:	8b 40 04             	mov    0x4(%eax),%eax
    1a67:	8b 00                	mov    (%eax),%eax
    1a69:	89 45 f4             	mov    %eax,-0xc(%ebp)
       destroy = q->head;
    1a6c:	8b 45 08             	mov    0x8(%ebp),%eax
    1a6f:	8b 40 04             	mov    0x4(%eax),%eax
    1a72:	89 45 f0             	mov    %eax,-0x10(%ebp)
       q->head = q->head->next;
    1a75:	8b 45 08             	mov    0x8(%ebp),%eax
    1a78:	8b 40 04             	mov    0x4(%eax),%eax
    1a7b:	8b 50 04             	mov    0x4(%eax),%edx
    1a7e:	8b 45 08             	mov    0x8(%ebp),%eax
    1a81:	89 50 04             	mov    %edx,0x4(%eax)
       free(destroy);
    1a84:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1a87:	89 04 24             	mov    %eax,(%esp)
    1a8a:	e8 a9 fb ff ff       	call   1638 <free>
       q->size--;
    1a8f:	8b 45 08             	mov    0x8(%ebp),%eax
    1a92:	8b 00                	mov    (%eax),%eax
    1a94:	8d 50 ff             	lea    -0x1(%eax),%edx
    1a97:	8b 45 08             	mov    0x8(%ebp),%eax
    1a9a:	89 10                	mov    %edx,(%eax)
       if(q->size == 0){
    1a9c:	8b 45 08             	mov    0x8(%ebp),%eax
    1a9f:	8b 00                	mov    (%eax),%eax
    1aa1:	85 c0                	test   %eax,%eax
    1aa3:	75 14                	jne    1ab9 <pop_q+0x6d>
            q->head = 0;
    1aa5:	8b 45 08             	mov    0x8(%ebp),%eax
    1aa8:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
            q->tail = 0;
    1aaf:	8b 45 08             	mov    0x8(%ebp),%eax
    1ab2:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
       }
       return val;
    1ab9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1abc:	eb 05                	jmp    1ac3 <pop_q+0x77>
    }
    return -1;
    1abe:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
    1ac3:	c9                   	leave  
    1ac4:	c3                   	ret    

00001ac5 <dominant>:

void dominant(struct queue* q, int i){
    1ac5:	55                   	push   %ebp
    1ac6:	89 e5                	mov    %esp,%ebp
    1ac8:	83 ec 28             	sub    $0x28,%esp
    struct node * n = malloc(sizeof(struct node));
    1acb:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
    1ad2:	e8 9a fc ff ff       	call   1771 <malloc>
    1ad7:	89 45 f4             	mov    %eax,-0xc(%ebp)
    n->value = i;
    1ada:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1add:	8b 55 0c             	mov    0xc(%ebp),%edx
    1ae0:	89 10                	mov    %edx,(%eax)

    if(q->head == 0){
    1ae2:	8b 45 08             	mov    0x8(%ebp),%eax
    1ae5:	8b 40 04             	mov    0x4(%eax),%eax
    1ae8:	85 c0                	test   %eax,%eax
    1aea:	75 14                	jne    1b00 <dominant+0x3b>
        q->head = n;
    1aec:	8b 45 08             	mov    0x8(%ebp),%eax
    1aef:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1af2:	89 50 04             	mov    %edx,0x4(%eax)
        q->tail = n;
    1af5:	8b 45 08             	mov    0x8(%ebp),%eax
    1af8:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1afb:	89 50 08             	mov    %edx,0x8(%eax)
    1afe:	eb 15                	jmp    1b15 <dominant+0x50>
    }
    else{
        n->next = q->head;
    1b00:	8b 45 08             	mov    0x8(%ebp),%eax
    1b03:	8b 50 04             	mov    0x4(%eax),%edx
    1b06:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1b09:	89 50 04             	mov    %edx,0x4(%eax)
        q->head = n;
    1b0c:	8b 45 08             	mov    0x8(%ebp),%eax
    1b0f:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1b12:	89 50 04             	mov    %edx,0x4(%eax)
    }
    q->size++;
    1b15:	8b 45 08             	mov    0x8(%ebp),%eax
    1b18:	8b 00                	mov    (%eax),%eax
    1b1a:	8d 50 01             	lea    0x1(%eax),%edx
    1b1d:	8b 45 08             	mov    0x8(%ebp),%eax
    1b20:	89 10                	mov    %edx,(%eax)
}
    1b22:	c9                   	leave  
    1b23:	c3                   	ret    

00001b24 <sem_init>:
#include "semaphore.h"
#include "user.h"

// Initializes the semaphore
void sem_init(struct Semaphore* s, int value){
    1b24:	55                   	push   %ebp
    1b25:	89 e5                	mov    %esp,%ebp
    1b27:	83 ec 18             	sub    $0x18,%esp
    s->val = value;
    1b2a:	8b 45 08             	mov    0x8(%ebp),%eax
    1b2d:	8b 55 0c             	mov    0xc(%ebp),%edx
    1b30:	89 10                	mov    %edx,(%eax)
    lock_init(&s->lock);
    1b32:	8b 45 08             	mov    0x8(%ebp),%eax
    1b35:	83 c0 04             	add    $0x4,%eax
    1b38:	89 04 24             	mov    %eax,(%esp)
    1b3b:	e8 2e fd ff ff       	call   186e <lock_init>
    init_q(&s->q);
    1b40:	8b 45 08             	mov    0x8(%ebp),%eax
    1b43:	83 c0 08             	add    $0x8,%eax
    1b46:	89 04 24             	mov    %eax,(%esp)
    1b49:	e8 62 fe ff ff       	call   19b0 <init_q>
}
    1b4e:	c9                   	leave  
    1b4f:	c3                   	ret    

00001b50 <sem_acquire>:

// Decrements the semaphore
void sem_acquire(struct Semaphore* s){
    1b50:	55                   	push   %ebp
    1b51:	89 e5                	mov    %esp,%ebp
    1b53:	83 ec 28             	sub    $0x28,%esp
    lock_acquire(&s->lock);
    1b56:	8b 45 08             	mov    0x8(%ebp),%eax
    1b59:	83 c0 04             	add    $0x4,%eax
    1b5c:	89 04 24             	mov    %eax,(%esp)
    1b5f:	e8 18 fd ff ff       	call   187c <lock_acquire>

    if(s->val == 0){
    1b64:	8b 45 08             	mov    0x8(%ebp),%eax
    1b67:	8b 00                	mov    (%eax),%eax
    1b69:	85 c0                	test   %eax,%eax
    1b6b:	75 32                	jne    1b9f <sem_acquire+0x4f>
        int pid;
        pid = getpid();
    1b6d:	e8 f2 f7 ff ff       	call   1364 <getpid>
    1b72:	89 45 f4             	mov    %eax,-0xc(%ebp)
        add_q(&s->q, pid);
    1b75:	8b 45 08             	mov    0x8(%ebp),%eax
    1b78:	8d 50 08             	lea    0x8(%eax),%edx
    1b7b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1b7e:	89 44 24 04          	mov    %eax,0x4(%esp)
    1b82:	89 14 24             	mov    %edx,(%esp)
    1b85:	e8 48 fe ff ff       	call   19d2 <add_q>
        lock_release(&s->lock);
    1b8a:	8b 45 08             	mov    0x8(%ebp),%eax
    1b8d:	83 c0 04             	add    $0x4,%eax
    1b90:	89 04 24             	mov    %eax,(%esp)
    1b93:	e8 04 fd ff ff       	call   189c <lock_release>
        tsleep();
    1b98:	e8 f7 f7 ff ff       	call   1394 <tsleep>
    1b9d:	eb 1b                	jmp    1bba <sem_acquire+0x6a>
    }
    else{
        s->val--;
    1b9f:	8b 45 08             	mov    0x8(%ebp),%eax
    1ba2:	8b 00                	mov    (%eax),%eax
    1ba4:	8d 50 ff             	lea    -0x1(%eax),%edx
    1ba7:	8b 45 08             	mov    0x8(%ebp),%eax
    1baa:	89 10                	mov    %edx,(%eax)
        lock_release(&s->lock);
    1bac:	8b 45 08             	mov    0x8(%ebp),%eax
    1baf:	83 c0 04             	add    $0x4,%eax
    1bb2:	89 04 24             	mov    %eax,(%esp)
    1bb5:	e8 e2 fc ff ff       	call   189c <lock_release>
    }
}
    1bba:	c9                   	leave  
    1bbb:	c3                   	ret    

00001bbc <sem_signal>:

// Increments the semaphore
void sem_signal(struct Semaphore* s){
    1bbc:	55                   	push   %ebp
    1bbd:	89 e5                	mov    %esp,%ebp
    1bbf:	83 ec 18             	sub    $0x18,%esp
    lock_acquire(&s->lock);
    1bc2:	8b 45 08             	mov    0x8(%ebp),%eax
    1bc5:	83 c0 04             	add    $0x4,%eax
    1bc8:	89 04 24             	mov    %eax,(%esp)
    1bcb:	e8 ac fc ff ff       	call   187c <lock_acquire>

    if(!empty_q(&s->q)){
    1bd0:	8b 45 08             	mov    0x8(%ebp),%eax
    1bd3:	83 c0 08             	add    $0x8,%eax
    1bd6:	89 04 24             	mov    %eax,(%esp)
    1bd9:	e8 54 fe ff ff       	call   1a32 <empty_q>
    1bde:	85 c0                	test   %eax,%eax
    1be0:	75 18                	jne    1bfa <sem_signal+0x3e>
        twakeup(pop_q(&s->q));
    1be2:	8b 45 08             	mov    0x8(%ebp),%eax
    1be5:	83 c0 08             	add    $0x8,%eax
    1be8:	89 04 24             	mov    %eax,(%esp)
    1beb:	e8 5c fe ff ff       	call   1a4c <pop_q>
    1bf0:	89 04 24             	mov    %eax,(%esp)
    1bf3:	e8 a4 f7 ff ff       	call   139c <twakeup>
    1bf8:	eb 0d                	jmp    1c07 <sem_signal+0x4b>
    }
    else{
        s->val++;
    1bfa:	8b 45 08             	mov    0x8(%ebp),%eax
    1bfd:	8b 00                	mov    (%eax),%eax
    1bff:	8d 50 01             	lea    0x1(%eax),%edx
    1c02:	8b 45 08             	mov    0x8(%ebp),%eax
    1c05:	89 10                	mov    %edx,(%eax)
    }

    lock_release(&s->lock);
    1c07:	8b 45 08             	mov    0x8(%ebp),%eax
    1c0a:	83 c0 04             	add    $0x4,%eax
    1c0d:	89 04 24             	mov    %eax,(%esp)
    1c10:	e8 87 fc ff ff       	call   189c <lock_release>
}
    1c15:	c9                   	leave  
    1c16:	c3                   	ret    

00001c17 <sem_dom_acquire>:

void sem_dom_acquire(struct Semaphore* s){
    1c17:	55                   	push   %ebp
    1c18:	89 e5                	mov    %esp,%ebp
    1c1a:	83 ec 18             	sub    $0x18,%esp
    lock_acquire(&s->lock);
    1c1d:	8b 45 08             	mov    0x8(%ebp),%eax
    1c20:	83 c0 04             	add    $0x4,%eax
    1c23:	89 04 24             	mov    %eax,(%esp)
    1c26:	e8 51 fc ff ff       	call   187c <lock_acquire>

    if(s->val > 0){
    1c2b:	8b 45 08             	mov    0x8(%ebp),%eax
    1c2e:	8b 00                	mov    (%eax),%eax
    1c30:	85 c0                	test   %eax,%eax
    1c32:	7e 1d                	jle    1c51 <sem_dom_acquire+0x3a>
        s->val--;
    1c34:	8b 45 08             	mov    0x8(%ebp),%eax
    1c37:	8b 00                	mov    (%eax),%eax
    1c39:	8d 50 ff             	lea    -0x1(%eax),%edx
    1c3c:	8b 45 08             	mov    0x8(%ebp),%eax
    1c3f:	89 10                	mov    %edx,(%eax)
        lock_release(&s->lock);
    1c41:	8b 45 08             	mov    0x8(%ebp),%eax
    1c44:	83 c0 04             	add    $0x4,%eax
    1c47:	89 04 24             	mov    %eax,(%esp)
    1c4a:	e8 4d fc ff ff       	call   189c <lock_release>
        return;
    1c4f:	eb 2a                	jmp    1c7b <sem_dom_acquire+0x64>
    }

    dominant(&s->q,getpid());
    1c51:	e8 0e f7 ff ff       	call   1364 <getpid>
    1c56:	8b 55 08             	mov    0x8(%ebp),%edx
    1c59:	83 c2 08             	add    $0x8,%edx
    1c5c:	89 44 24 04          	mov    %eax,0x4(%esp)
    1c60:	89 14 24             	mov    %edx,(%esp)
    1c63:	e8 5d fe ff ff       	call   1ac5 <dominant>
    lock_release(&s->lock);
    1c68:	8b 45 08             	mov    0x8(%ebp),%eax
    1c6b:	83 c0 04             	add    $0x4,%eax
    1c6e:	89 04 24             	mov    %eax,(%esp)
    1c71:	e8 26 fc ff ff       	call   189c <lock_release>
    tsleep();
    1c76:	e8 19 f7 ff ff       	call   1394 <tsleep>
}
    1c7b:	c9                   	leave  
    1c7c:	c3                   	ret    
