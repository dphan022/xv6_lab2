
_zombie:     file format elf32-i386


Disassembly of section .text:

00001000 <main>:
#include "stat.h"
#include "user.h"

int
main(void)
{
    1000:	55                   	push   %ebp
    1001:	89 e5                	mov    %esp,%ebp
    1003:	83 e4 f0             	and    $0xfffffff0,%esp
    1006:	83 ec 10             	sub    $0x10,%esp
  if(fork() > 0)
    1009:	e8 76 02 00 00       	call   1284 <fork>
    100e:	85 c0                	test   %eax,%eax
    1010:	7e 0c                	jle    101e <main+0x1e>
    sleep(5);  // Let child exit before parent.
    1012:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
    1019:	e8 fe 02 00 00       	call   131c <sleep>
  exit();
    101e:	e8 69 02 00 00       	call   128c <exit>
    1023:	90                   	nop

00001024 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
    1024:	55                   	push   %ebp
    1025:	89 e5                	mov    %esp,%ebp
    1027:	57                   	push   %edi
    1028:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
    1029:	8b 4d 08             	mov    0x8(%ebp),%ecx
    102c:	8b 55 10             	mov    0x10(%ebp),%edx
    102f:	8b 45 0c             	mov    0xc(%ebp),%eax
    1032:	89 cb                	mov    %ecx,%ebx
    1034:	89 df                	mov    %ebx,%edi
    1036:	89 d1                	mov    %edx,%ecx
    1038:	fc                   	cld    
    1039:	f3 aa                	rep stos %al,%es:(%edi)
    103b:	89 ca                	mov    %ecx,%edx
    103d:	89 fb                	mov    %edi,%ebx
    103f:	89 5d 08             	mov    %ebx,0x8(%ebp)
    1042:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
    1045:	5b                   	pop    %ebx
    1046:	5f                   	pop    %edi
    1047:	5d                   	pop    %ebp
    1048:	c3                   	ret    

00001049 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
    1049:	55                   	push   %ebp
    104a:	89 e5                	mov    %esp,%ebp
    104c:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
    104f:	8b 45 08             	mov    0x8(%ebp),%eax
    1052:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
    1055:	90                   	nop
    1056:	8b 45 08             	mov    0x8(%ebp),%eax
    1059:	8d 50 01             	lea    0x1(%eax),%edx
    105c:	89 55 08             	mov    %edx,0x8(%ebp)
    105f:	8b 55 0c             	mov    0xc(%ebp),%edx
    1062:	8d 4a 01             	lea    0x1(%edx),%ecx
    1065:	89 4d 0c             	mov    %ecx,0xc(%ebp)
    1068:	0f b6 12             	movzbl (%edx),%edx
    106b:	88 10                	mov    %dl,(%eax)
    106d:	0f b6 00             	movzbl (%eax),%eax
    1070:	84 c0                	test   %al,%al
    1072:	75 e2                	jne    1056 <strcpy+0xd>
    ;
  return os;
    1074:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    1077:	c9                   	leave  
    1078:	c3                   	ret    

00001079 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    1079:	55                   	push   %ebp
    107a:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
    107c:	eb 08                	jmp    1086 <strcmp+0xd>
    p++, q++;
    107e:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    1082:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    1086:	8b 45 08             	mov    0x8(%ebp),%eax
    1089:	0f b6 00             	movzbl (%eax),%eax
    108c:	84 c0                	test   %al,%al
    108e:	74 10                	je     10a0 <strcmp+0x27>
    1090:	8b 45 08             	mov    0x8(%ebp),%eax
    1093:	0f b6 10             	movzbl (%eax),%edx
    1096:	8b 45 0c             	mov    0xc(%ebp),%eax
    1099:	0f b6 00             	movzbl (%eax),%eax
    109c:	38 c2                	cmp    %al,%dl
    109e:	74 de                	je     107e <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
    10a0:	8b 45 08             	mov    0x8(%ebp),%eax
    10a3:	0f b6 00             	movzbl (%eax),%eax
    10a6:	0f b6 d0             	movzbl %al,%edx
    10a9:	8b 45 0c             	mov    0xc(%ebp),%eax
    10ac:	0f b6 00             	movzbl (%eax),%eax
    10af:	0f b6 c0             	movzbl %al,%eax
    10b2:	29 c2                	sub    %eax,%edx
    10b4:	89 d0                	mov    %edx,%eax
}
    10b6:	5d                   	pop    %ebp
    10b7:	c3                   	ret    

000010b8 <strlen>:

uint
strlen(char *s)
{
    10b8:	55                   	push   %ebp
    10b9:	89 e5                	mov    %esp,%ebp
    10bb:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
    10be:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    10c5:	eb 04                	jmp    10cb <strlen+0x13>
    10c7:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    10cb:	8b 55 fc             	mov    -0x4(%ebp),%edx
    10ce:	8b 45 08             	mov    0x8(%ebp),%eax
    10d1:	01 d0                	add    %edx,%eax
    10d3:	0f b6 00             	movzbl (%eax),%eax
    10d6:	84 c0                	test   %al,%al
    10d8:	75 ed                	jne    10c7 <strlen+0xf>
    ;
  return n;
    10da:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    10dd:	c9                   	leave  
    10de:	c3                   	ret    

000010df <memset>:

void*
memset(void *dst, int c, uint n)
{
    10df:	55                   	push   %ebp
    10e0:	89 e5                	mov    %esp,%ebp
    10e2:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
    10e5:	8b 45 10             	mov    0x10(%ebp),%eax
    10e8:	89 44 24 08          	mov    %eax,0x8(%esp)
    10ec:	8b 45 0c             	mov    0xc(%ebp),%eax
    10ef:	89 44 24 04          	mov    %eax,0x4(%esp)
    10f3:	8b 45 08             	mov    0x8(%ebp),%eax
    10f6:	89 04 24             	mov    %eax,(%esp)
    10f9:	e8 26 ff ff ff       	call   1024 <stosb>
  return dst;
    10fe:	8b 45 08             	mov    0x8(%ebp),%eax
}
    1101:	c9                   	leave  
    1102:	c3                   	ret    

00001103 <strchr>:

char*
strchr(const char *s, char c)
{
    1103:	55                   	push   %ebp
    1104:	89 e5                	mov    %esp,%ebp
    1106:	83 ec 04             	sub    $0x4,%esp
    1109:	8b 45 0c             	mov    0xc(%ebp),%eax
    110c:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
    110f:	eb 14                	jmp    1125 <strchr+0x22>
    if(*s == c)
    1111:	8b 45 08             	mov    0x8(%ebp),%eax
    1114:	0f b6 00             	movzbl (%eax),%eax
    1117:	3a 45 fc             	cmp    -0x4(%ebp),%al
    111a:	75 05                	jne    1121 <strchr+0x1e>
      return (char*)s;
    111c:	8b 45 08             	mov    0x8(%ebp),%eax
    111f:	eb 13                	jmp    1134 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
    1121:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    1125:	8b 45 08             	mov    0x8(%ebp),%eax
    1128:	0f b6 00             	movzbl (%eax),%eax
    112b:	84 c0                	test   %al,%al
    112d:	75 e2                	jne    1111 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
    112f:	b8 00 00 00 00       	mov    $0x0,%eax
}
    1134:	c9                   	leave  
    1135:	c3                   	ret    

00001136 <gets>:

char*
gets(char *buf, int max)
{
    1136:	55                   	push   %ebp
    1137:	89 e5                	mov    %esp,%ebp
    1139:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    113c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    1143:	eb 4c                	jmp    1191 <gets+0x5b>
    cc = read(0, &c, 1);
    1145:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    114c:	00 
    114d:	8d 45 ef             	lea    -0x11(%ebp),%eax
    1150:	89 44 24 04          	mov    %eax,0x4(%esp)
    1154:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    115b:	e8 44 01 00 00       	call   12a4 <read>
    1160:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
    1163:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1167:	7f 02                	jg     116b <gets+0x35>
      break;
    1169:	eb 31                	jmp    119c <gets+0x66>
    buf[i++] = c;
    116b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    116e:	8d 50 01             	lea    0x1(%eax),%edx
    1171:	89 55 f4             	mov    %edx,-0xc(%ebp)
    1174:	89 c2                	mov    %eax,%edx
    1176:	8b 45 08             	mov    0x8(%ebp),%eax
    1179:	01 c2                	add    %eax,%edx
    117b:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    117f:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
    1181:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    1185:	3c 0a                	cmp    $0xa,%al
    1187:	74 13                	je     119c <gets+0x66>
    1189:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    118d:	3c 0d                	cmp    $0xd,%al
    118f:	74 0b                	je     119c <gets+0x66>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1191:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1194:	83 c0 01             	add    $0x1,%eax
    1197:	3b 45 0c             	cmp    0xc(%ebp),%eax
    119a:	7c a9                	jl     1145 <gets+0xf>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    119c:	8b 55 f4             	mov    -0xc(%ebp),%edx
    119f:	8b 45 08             	mov    0x8(%ebp),%eax
    11a2:	01 d0                	add    %edx,%eax
    11a4:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
    11a7:	8b 45 08             	mov    0x8(%ebp),%eax
}
    11aa:	c9                   	leave  
    11ab:	c3                   	ret    

000011ac <stat>:

int
stat(char *n, struct stat *st)
{
    11ac:	55                   	push   %ebp
    11ad:	89 e5                	mov    %esp,%ebp
    11af:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    11b2:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    11b9:	00 
    11ba:	8b 45 08             	mov    0x8(%ebp),%eax
    11bd:	89 04 24             	mov    %eax,(%esp)
    11c0:	e8 07 01 00 00       	call   12cc <open>
    11c5:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
    11c8:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    11cc:	79 07                	jns    11d5 <stat+0x29>
    return -1;
    11ce:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    11d3:	eb 23                	jmp    11f8 <stat+0x4c>
  r = fstat(fd, st);
    11d5:	8b 45 0c             	mov    0xc(%ebp),%eax
    11d8:	89 44 24 04          	mov    %eax,0x4(%esp)
    11dc:	8b 45 f4             	mov    -0xc(%ebp),%eax
    11df:	89 04 24             	mov    %eax,(%esp)
    11e2:	e8 fd 00 00 00       	call   12e4 <fstat>
    11e7:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
    11ea:	8b 45 f4             	mov    -0xc(%ebp),%eax
    11ed:	89 04 24             	mov    %eax,(%esp)
    11f0:	e8 bf 00 00 00       	call   12b4 <close>
  return r;
    11f5:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
    11f8:	c9                   	leave  
    11f9:	c3                   	ret    

000011fa <atoi>:

int
atoi(const char *s)
{
    11fa:	55                   	push   %ebp
    11fb:	89 e5                	mov    %esp,%ebp
    11fd:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
    1200:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
    1207:	eb 25                	jmp    122e <atoi+0x34>
    n = n*10 + *s++ - '0';
    1209:	8b 55 fc             	mov    -0x4(%ebp),%edx
    120c:	89 d0                	mov    %edx,%eax
    120e:	c1 e0 02             	shl    $0x2,%eax
    1211:	01 d0                	add    %edx,%eax
    1213:	01 c0                	add    %eax,%eax
    1215:	89 c1                	mov    %eax,%ecx
    1217:	8b 45 08             	mov    0x8(%ebp),%eax
    121a:	8d 50 01             	lea    0x1(%eax),%edx
    121d:	89 55 08             	mov    %edx,0x8(%ebp)
    1220:	0f b6 00             	movzbl (%eax),%eax
    1223:	0f be c0             	movsbl %al,%eax
    1226:	01 c8                	add    %ecx,%eax
    1228:	83 e8 30             	sub    $0x30,%eax
    122b:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    122e:	8b 45 08             	mov    0x8(%ebp),%eax
    1231:	0f b6 00             	movzbl (%eax),%eax
    1234:	3c 2f                	cmp    $0x2f,%al
    1236:	7e 0a                	jle    1242 <atoi+0x48>
    1238:	8b 45 08             	mov    0x8(%ebp),%eax
    123b:	0f b6 00             	movzbl (%eax),%eax
    123e:	3c 39                	cmp    $0x39,%al
    1240:	7e c7                	jle    1209 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
    1242:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    1245:	c9                   	leave  
    1246:	c3                   	ret    

00001247 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    1247:	55                   	push   %ebp
    1248:	89 e5                	mov    %esp,%ebp
    124a:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
    124d:	8b 45 08             	mov    0x8(%ebp),%eax
    1250:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
    1253:	8b 45 0c             	mov    0xc(%ebp),%eax
    1256:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
    1259:	eb 17                	jmp    1272 <memmove+0x2b>
    *dst++ = *src++;
    125b:	8b 45 fc             	mov    -0x4(%ebp),%eax
    125e:	8d 50 01             	lea    0x1(%eax),%edx
    1261:	89 55 fc             	mov    %edx,-0x4(%ebp)
    1264:	8b 55 f8             	mov    -0x8(%ebp),%edx
    1267:	8d 4a 01             	lea    0x1(%edx),%ecx
    126a:	89 4d f8             	mov    %ecx,-0x8(%ebp)
    126d:	0f b6 12             	movzbl (%edx),%edx
    1270:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    1272:	8b 45 10             	mov    0x10(%ebp),%eax
    1275:	8d 50 ff             	lea    -0x1(%eax),%edx
    1278:	89 55 10             	mov    %edx,0x10(%ebp)
    127b:	85 c0                	test   %eax,%eax
    127d:	7f dc                	jg     125b <memmove+0x14>
    *dst++ = *src++;
  return vdst;
    127f:	8b 45 08             	mov    0x8(%ebp),%eax
}
    1282:	c9                   	leave  
    1283:	c3                   	ret    

00001284 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    1284:	b8 01 00 00 00       	mov    $0x1,%eax
    1289:	cd 40                	int    $0x40
    128b:	c3                   	ret    

0000128c <exit>:
SYSCALL(exit)
    128c:	b8 02 00 00 00       	mov    $0x2,%eax
    1291:	cd 40                	int    $0x40
    1293:	c3                   	ret    

00001294 <wait>:
SYSCALL(wait)
    1294:	b8 03 00 00 00       	mov    $0x3,%eax
    1299:	cd 40                	int    $0x40
    129b:	c3                   	ret    

0000129c <pipe>:
SYSCALL(pipe)
    129c:	b8 04 00 00 00       	mov    $0x4,%eax
    12a1:	cd 40                	int    $0x40
    12a3:	c3                   	ret    

000012a4 <read>:
SYSCALL(read)
    12a4:	b8 05 00 00 00       	mov    $0x5,%eax
    12a9:	cd 40                	int    $0x40
    12ab:	c3                   	ret    

000012ac <write>:
SYSCALL(write)
    12ac:	b8 10 00 00 00       	mov    $0x10,%eax
    12b1:	cd 40                	int    $0x40
    12b3:	c3                   	ret    

000012b4 <close>:
SYSCALL(close)
    12b4:	b8 15 00 00 00       	mov    $0x15,%eax
    12b9:	cd 40                	int    $0x40
    12bb:	c3                   	ret    

000012bc <kill>:
SYSCALL(kill)
    12bc:	b8 06 00 00 00       	mov    $0x6,%eax
    12c1:	cd 40                	int    $0x40
    12c3:	c3                   	ret    

000012c4 <exec>:
SYSCALL(exec)
    12c4:	b8 07 00 00 00       	mov    $0x7,%eax
    12c9:	cd 40                	int    $0x40
    12cb:	c3                   	ret    

000012cc <open>:
SYSCALL(open)
    12cc:	b8 0f 00 00 00       	mov    $0xf,%eax
    12d1:	cd 40                	int    $0x40
    12d3:	c3                   	ret    

000012d4 <mknod>:
SYSCALL(mknod)
    12d4:	b8 11 00 00 00       	mov    $0x11,%eax
    12d9:	cd 40                	int    $0x40
    12db:	c3                   	ret    

000012dc <unlink>:
SYSCALL(unlink)
    12dc:	b8 12 00 00 00       	mov    $0x12,%eax
    12e1:	cd 40                	int    $0x40
    12e3:	c3                   	ret    

000012e4 <fstat>:
SYSCALL(fstat)
    12e4:	b8 08 00 00 00       	mov    $0x8,%eax
    12e9:	cd 40                	int    $0x40
    12eb:	c3                   	ret    

000012ec <link>:
SYSCALL(link)
    12ec:	b8 13 00 00 00       	mov    $0x13,%eax
    12f1:	cd 40                	int    $0x40
    12f3:	c3                   	ret    

000012f4 <mkdir>:
SYSCALL(mkdir)
    12f4:	b8 14 00 00 00       	mov    $0x14,%eax
    12f9:	cd 40                	int    $0x40
    12fb:	c3                   	ret    

000012fc <chdir>:
SYSCALL(chdir)
    12fc:	b8 09 00 00 00       	mov    $0x9,%eax
    1301:	cd 40                	int    $0x40
    1303:	c3                   	ret    

00001304 <dup>:
SYSCALL(dup)
    1304:	b8 0a 00 00 00       	mov    $0xa,%eax
    1309:	cd 40                	int    $0x40
    130b:	c3                   	ret    

0000130c <getpid>:
SYSCALL(getpid)
    130c:	b8 0b 00 00 00       	mov    $0xb,%eax
    1311:	cd 40                	int    $0x40
    1313:	c3                   	ret    

00001314 <sbrk>:
SYSCALL(sbrk)
    1314:	b8 0c 00 00 00       	mov    $0xc,%eax
    1319:	cd 40                	int    $0x40
    131b:	c3                   	ret    

0000131c <sleep>:
SYSCALL(sleep)
    131c:	b8 0d 00 00 00       	mov    $0xd,%eax
    1321:	cd 40                	int    $0x40
    1323:	c3                   	ret    

00001324 <uptime>:
SYSCALL(uptime)
    1324:	b8 0e 00 00 00       	mov    $0xe,%eax
    1329:	cd 40                	int    $0x40
    132b:	c3                   	ret    

0000132c <clone>:
SYSCALL(clone)
    132c:	b8 16 00 00 00       	mov    $0x16,%eax
    1331:	cd 40                	int    $0x40
    1333:	c3                   	ret    

00001334 <texit>:
SYSCALL(texit)
    1334:	b8 17 00 00 00       	mov    $0x17,%eax
    1339:	cd 40                	int    $0x40
    133b:	c3                   	ret    

0000133c <tsleep>:
SYSCALL(tsleep)
    133c:	b8 18 00 00 00       	mov    $0x18,%eax
    1341:	cd 40                	int    $0x40
    1343:	c3                   	ret    

00001344 <twakeup>:
SYSCALL(twakeup)
    1344:	b8 19 00 00 00       	mov    $0x19,%eax
    1349:	cd 40                	int    $0x40
    134b:	c3                   	ret    

0000134c <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
    134c:	55                   	push   %ebp
    134d:	89 e5                	mov    %esp,%ebp
    134f:	83 ec 18             	sub    $0x18,%esp
    1352:	8b 45 0c             	mov    0xc(%ebp),%eax
    1355:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
    1358:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    135f:	00 
    1360:	8d 45 f4             	lea    -0xc(%ebp),%eax
    1363:	89 44 24 04          	mov    %eax,0x4(%esp)
    1367:	8b 45 08             	mov    0x8(%ebp),%eax
    136a:	89 04 24             	mov    %eax,(%esp)
    136d:	e8 3a ff ff ff       	call   12ac <write>
}
    1372:	c9                   	leave  
    1373:	c3                   	ret    

00001374 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
    1374:	55                   	push   %ebp
    1375:	89 e5                	mov    %esp,%ebp
    1377:	56                   	push   %esi
    1378:	53                   	push   %ebx
    1379:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    137c:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
    1383:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
    1387:	74 17                	je     13a0 <printint+0x2c>
    1389:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    138d:	79 11                	jns    13a0 <printint+0x2c>
    neg = 1;
    138f:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
    1396:	8b 45 0c             	mov    0xc(%ebp),%eax
    1399:	f7 d8                	neg    %eax
    139b:	89 45 ec             	mov    %eax,-0x14(%ebp)
    139e:	eb 06                	jmp    13a6 <printint+0x32>
  } else {
    x = xx;
    13a0:	8b 45 0c             	mov    0xc(%ebp),%eax
    13a3:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
    13a6:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
    13ad:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    13b0:	8d 41 01             	lea    0x1(%ecx),%eax
    13b3:	89 45 f4             	mov    %eax,-0xc(%ebp)
    13b6:	8b 5d 10             	mov    0x10(%ebp),%ebx
    13b9:	8b 45 ec             	mov    -0x14(%ebp),%eax
    13bc:	ba 00 00 00 00       	mov    $0x0,%edx
    13c1:	f7 f3                	div    %ebx
    13c3:	89 d0                	mov    %edx,%eax
    13c5:	0f b6 80 7c 20 00 00 	movzbl 0x207c(%eax),%eax
    13cc:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
    13d0:	8b 75 10             	mov    0x10(%ebp),%esi
    13d3:	8b 45 ec             	mov    -0x14(%ebp),%eax
    13d6:	ba 00 00 00 00       	mov    $0x0,%edx
    13db:	f7 f6                	div    %esi
    13dd:	89 45 ec             	mov    %eax,-0x14(%ebp)
    13e0:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    13e4:	75 c7                	jne    13ad <printint+0x39>
  if(neg)
    13e6:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    13ea:	74 10                	je     13fc <printint+0x88>
    buf[i++] = '-';
    13ec:	8b 45 f4             	mov    -0xc(%ebp),%eax
    13ef:	8d 50 01             	lea    0x1(%eax),%edx
    13f2:	89 55 f4             	mov    %edx,-0xc(%ebp)
    13f5:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
    13fa:	eb 1f                	jmp    141b <printint+0xa7>
    13fc:	eb 1d                	jmp    141b <printint+0xa7>
    putc(fd, buf[i]);
    13fe:	8d 55 dc             	lea    -0x24(%ebp),%edx
    1401:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1404:	01 d0                	add    %edx,%eax
    1406:	0f b6 00             	movzbl (%eax),%eax
    1409:	0f be c0             	movsbl %al,%eax
    140c:	89 44 24 04          	mov    %eax,0x4(%esp)
    1410:	8b 45 08             	mov    0x8(%ebp),%eax
    1413:	89 04 24             	mov    %eax,(%esp)
    1416:	e8 31 ff ff ff       	call   134c <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    141b:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    141f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1423:	79 d9                	jns    13fe <printint+0x8a>
    putc(fd, buf[i]);
}
    1425:	83 c4 30             	add    $0x30,%esp
    1428:	5b                   	pop    %ebx
    1429:	5e                   	pop    %esi
    142a:	5d                   	pop    %ebp
    142b:	c3                   	ret    

0000142c <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    142c:	55                   	push   %ebp
    142d:	89 e5                	mov    %esp,%ebp
    142f:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
    1432:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
    1439:	8d 45 0c             	lea    0xc(%ebp),%eax
    143c:	83 c0 04             	add    $0x4,%eax
    143f:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
    1442:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    1449:	e9 7c 01 00 00       	jmp    15ca <printf+0x19e>
    c = fmt[i] & 0xff;
    144e:	8b 55 0c             	mov    0xc(%ebp),%edx
    1451:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1454:	01 d0                	add    %edx,%eax
    1456:	0f b6 00             	movzbl (%eax),%eax
    1459:	0f be c0             	movsbl %al,%eax
    145c:	25 ff 00 00 00       	and    $0xff,%eax
    1461:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
    1464:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1468:	75 2c                	jne    1496 <printf+0x6a>
      if(c == '%'){
    146a:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    146e:	75 0c                	jne    147c <printf+0x50>
        state = '%';
    1470:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
    1477:	e9 4a 01 00 00       	jmp    15c6 <printf+0x19a>
      } else {
        putc(fd, c);
    147c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    147f:	0f be c0             	movsbl %al,%eax
    1482:	89 44 24 04          	mov    %eax,0x4(%esp)
    1486:	8b 45 08             	mov    0x8(%ebp),%eax
    1489:	89 04 24             	mov    %eax,(%esp)
    148c:	e8 bb fe ff ff       	call   134c <putc>
    1491:	e9 30 01 00 00       	jmp    15c6 <printf+0x19a>
      }
    } else if(state == '%'){
    1496:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
    149a:	0f 85 26 01 00 00    	jne    15c6 <printf+0x19a>
      if(c == 'd'){
    14a0:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
    14a4:	75 2d                	jne    14d3 <printf+0xa7>
        printint(fd, *ap, 10, 1);
    14a6:	8b 45 e8             	mov    -0x18(%ebp),%eax
    14a9:	8b 00                	mov    (%eax),%eax
    14ab:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    14b2:	00 
    14b3:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
    14ba:	00 
    14bb:	89 44 24 04          	mov    %eax,0x4(%esp)
    14bf:	8b 45 08             	mov    0x8(%ebp),%eax
    14c2:	89 04 24             	mov    %eax,(%esp)
    14c5:	e8 aa fe ff ff       	call   1374 <printint>
        ap++;
    14ca:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    14ce:	e9 ec 00 00 00       	jmp    15bf <printf+0x193>
      } else if(c == 'x' || c == 'p'){
    14d3:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
    14d7:	74 06                	je     14df <printf+0xb3>
    14d9:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
    14dd:	75 2d                	jne    150c <printf+0xe0>
        printint(fd, *ap, 16, 0);
    14df:	8b 45 e8             	mov    -0x18(%ebp),%eax
    14e2:	8b 00                	mov    (%eax),%eax
    14e4:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    14eb:	00 
    14ec:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
    14f3:	00 
    14f4:	89 44 24 04          	mov    %eax,0x4(%esp)
    14f8:	8b 45 08             	mov    0x8(%ebp),%eax
    14fb:	89 04 24             	mov    %eax,(%esp)
    14fe:	e8 71 fe ff ff       	call   1374 <printint>
        ap++;
    1503:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    1507:	e9 b3 00 00 00       	jmp    15bf <printf+0x193>
      } else if(c == 's'){
    150c:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
    1510:	75 45                	jne    1557 <printf+0x12b>
        s = (char*)*ap;
    1512:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1515:	8b 00                	mov    (%eax),%eax
    1517:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
    151a:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
    151e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1522:	75 09                	jne    152d <printf+0x101>
          s = "(null)";
    1524:	c7 45 f4 25 1c 00 00 	movl   $0x1c25,-0xc(%ebp)
        while(*s != 0){
    152b:	eb 1e                	jmp    154b <printf+0x11f>
    152d:	eb 1c                	jmp    154b <printf+0x11f>
          putc(fd, *s);
    152f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1532:	0f b6 00             	movzbl (%eax),%eax
    1535:	0f be c0             	movsbl %al,%eax
    1538:	89 44 24 04          	mov    %eax,0x4(%esp)
    153c:	8b 45 08             	mov    0x8(%ebp),%eax
    153f:	89 04 24             	mov    %eax,(%esp)
    1542:	e8 05 fe ff ff       	call   134c <putc>
          s++;
    1547:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    154b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    154e:	0f b6 00             	movzbl (%eax),%eax
    1551:	84 c0                	test   %al,%al
    1553:	75 da                	jne    152f <printf+0x103>
    1555:	eb 68                	jmp    15bf <printf+0x193>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    1557:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
    155b:	75 1d                	jne    157a <printf+0x14e>
        putc(fd, *ap);
    155d:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1560:	8b 00                	mov    (%eax),%eax
    1562:	0f be c0             	movsbl %al,%eax
    1565:	89 44 24 04          	mov    %eax,0x4(%esp)
    1569:	8b 45 08             	mov    0x8(%ebp),%eax
    156c:	89 04 24             	mov    %eax,(%esp)
    156f:	e8 d8 fd ff ff       	call   134c <putc>
        ap++;
    1574:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    1578:	eb 45                	jmp    15bf <printf+0x193>
      } else if(c == '%'){
    157a:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    157e:	75 17                	jne    1597 <printf+0x16b>
        putc(fd, c);
    1580:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1583:	0f be c0             	movsbl %al,%eax
    1586:	89 44 24 04          	mov    %eax,0x4(%esp)
    158a:	8b 45 08             	mov    0x8(%ebp),%eax
    158d:	89 04 24             	mov    %eax,(%esp)
    1590:	e8 b7 fd ff ff       	call   134c <putc>
    1595:	eb 28                	jmp    15bf <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
    1597:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
    159e:	00 
    159f:	8b 45 08             	mov    0x8(%ebp),%eax
    15a2:	89 04 24             	mov    %eax,(%esp)
    15a5:	e8 a2 fd ff ff       	call   134c <putc>
        putc(fd, c);
    15aa:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    15ad:	0f be c0             	movsbl %al,%eax
    15b0:	89 44 24 04          	mov    %eax,0x4(%esp)
    15b4:	8b 45 08             	mov    0x8(%ebp),%eax
    15b7:	89 04 24             	mov    %eax,(%esp)
    15ba:	e8 8d fd ff ff       	call   134c <putc>
      }
      state = 0;
    15bf:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    15c6:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    15ca:	8b 55 0c             	mov    0xc(%ebp),%edx
    15cd:	8b 45 f0             	mov    -0x10(%ebp),%eax
    15d0:	01 d0                	add    %edx,%eax
    15d2:	0f b6 00             	movzbl (%eax),%eax
    15d5:	84 c0                	test   %al,%al
    15d7:	0f 85 71 fe ff ff    	jne    144e <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    15dd:	c9                   	leave  
    15de:	c3                   	ret    
    15df:	90                   	nop

000015e0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    15e0:	55                   	push   %ebp
    15e1:	89 e5                	mov    %esp,%ebp
    15e3:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
    15e6:	8b 45 08             	mov    0x8(%ebp),%eax
    15e9:	83 e8 08             	sub    $0x8,%eax
    15ec:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    15ef:	a1 9c 20 00 00       	mov    0x209c,%eax
    15f4:	89 45 fc             	mov    %eax,-0x4(%ebp)
    15f7:	eb 24                	jmp    161d <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    15f9:	8b 45 fc             	mov    -0x4(%ebp),%eax
    15fc:	8b 00                	mov    (%eax),%eax
    15fe:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    1601:	77 12                	ja     1615 <free+0x35>
    1603:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1606:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    1609:	77 24                	ja     162f <free+0x4f>
    160b:	8b 45 fc             	mov    -0x4(%ebp),%eax
    160e:	8b 00                	mov    (%eax),%eax
    1610:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    1613:	77 1a                	ja     162f <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1615:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1618:	8b 00                	mov    (%eax),%eax
    161a:	89 45 fc             	mov    %eax,-0x4(%ebp)
    161d:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1620:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    1623:	76 d4                	jbe    15f9 <free+0x19>
    1625:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1628:	8b 00                	mov    (%eax),%eax
    162a:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    162d:	76 ca                	jbe    15f9 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    162f:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1632:	8b 40 04             	mov    0x4(%eax),%eax
    1635:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    163c:	8b 45 f8             	mov    -0x8(%ebp),%eax
    163f:	01 c2                	add    %eax,%edx
    1641:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1644:	8b 00                	mov    (%eax),%eax
    1646:	39 c2                	cmp    %eax,%edx
    1648:	75 24                	jne    166e <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
    164a:	8b 45 f8             	mov    -0x8(%ebp),%eax
    164d:	8b 50 04             	mov    0x4(%eax),%edx
    1650:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1653:	8b 00                	mov    (%eax),%eax
    1655:	8b 40 04             	mov    0x4(%eax),%eax
    1658:	01 c2                	add    %eax,%edx
    165a:	8b 45 f8             	mov    -0x8(%ebp),%eax
    165d:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
    1660:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1663:	8b 00                	mov    (%eax),%eax
    1665:	8b 10                	mov    (%eax),%edx
    1667:	8b 45 f8             	mov    -0x8(%ebp),%eax
    166a:	89 10                	mov    %edx,(%eax)
    166c:	eb 0a                	jmp    1678 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
    166e:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1671:	8b 10                	mov    (%eax),%edx
    1673:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1676:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
    1678:	8b 45 fc             	mov    -0x4(%ebp),%eax
    167b:	8b 40 04             	mov    0x4(%eax),%eax
    167e:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    1685:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1688:	01 d0                	add    %edx,%eax
    168a:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    168d:	75 20                	jne    16af <free+0xcf>
    p->s.size += bp->s.size;
    168f:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1692:	8b 50 04             	mov    0x4(%eax),%edx
    1695:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1698:	8b 40 04             	mov    0x4(%eax),%eax
    169b:	01 c2                	add    %eax,%edx
    169d:	8b 45 fc             	mov    -0x4(%ebp),%eax
    16a0:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    16a3:	8b 45 f8             	mov    -0x8(%ebp),%eax
    16a6:	8b 10                	mov    (%eax),%edx
    16a8:	8b 45 fc             	mov    -0x4(%ebp),%eax
    16ab:	89 10                	mov    %edx,(%eax)
    16ad:	eb 08                	jmp    16b7 <free+0xd7>
  } else
    p->s.ptr = bp;
    16af:	8b 45 fc             	mov    -0x4(%ebp),%eax
    16b2:	8b 55 f8             	mov    -0x8(%ebp),%edx
    16b5:	89 10                	mov    %edx,(%eax)
  freep = p;
    16b7:	8b 45 fc             	mov    -0x4(%ebp),%eax
    16ba:	a3 9c 20 00 00       	mov    %eax,0x209c
}
    16bf:	c9                   	leave  
    16c0:	c3                   	ret    

000016c1 <morecore>:

static Header*
morecore(uint nu)
{
    16c1:	55                   	push   %ebp
    16c2:	89 e5                	mov    %esp,%ebp
    16c4:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
    16c7:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
    16ce:	77 07                	ja     16d7 <morecore+0x16>
    nu = 4096;
    16d0:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
    16d7:	8b 45 08             	mov    0x8(%ebp),%eax
    16da:	c1 e0 03             	shl    $0x3,%eax
    16dd:	89 04 24             	mov    %eax,(%esp)
    16e0:	e8 2f fc ff ff       	call   1314 <sbrk>
    16e5:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
    16e8:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
    16ec:	75 07                	jne    16f5 <morecore+0x34>
    return 0;
    16ee:	b8 00 00 00 00       	mov    $0x0,%eax
    16f3:	eb 22                	jmp    1717 <morecore+0x56>
  hp = (Header*)p;
    16f5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    16f8:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
    16fb:	8b 45 f0             	mov    -0x10(%ebp),%eax
    16fe:	8b 55 08             	mov    0x8(%ebp),%edx
    1701:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
    1704:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1707:	83 c0 08             	add    $0x8,%eax
    170a:	89 04 24             	mov    %eax,(%esp)
    170d:	e8 ce fe ff ff       	call   15e0 <free>
  return freep;
    1712:	a1 9c 20 00 00       	mov    0x209c,%eax
}
    1717:	c9                   	leave  
    1718:	c3                   	ret    

00001719 <malloc>:

void*
malloc(uint nbytes)
{
    1719:	55                   	push   %ebp
    171a:	89 e5                	mov    %esp,%ebp
    171c:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    171f:	8b 45 08             	mov    0x8(%ebp),%eax
    1722:	83 c0 07             	add    $0x7,%eax
    1725:	c1 e8 03             	shr    $0x3,%eax
    1728:	83 c0 01             	add    $0x1,%eax
    172b:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
    172e:	a1 9c 20 00 00       	mov    0x209c,%eax
    1733:	89 45 f0             	mov    %eax,-0x10(%ebp)
    1736:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    173a:	75 23                	jne    175f <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
    173c:	c7 45 f0 94 20 00 00 	movl   $0x2094,-0x10(%ebp)
    1743:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1746:	a3 9c 20 00 00       	mov    %eax,0x209c
    174b:	a1 9c 20 00 00       	mov    0x209c,%eax
    1750:	a3 94 20 00 00       	mov    %eax,0x2094
    base.s.size = 0;
    1755:	c7 05 98 20 00 00 00 	movl   $0x0,0x2098
    175c:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    175f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1762:	8b 00                	mov    (%eax),%eax
    1764:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
    1767:	8b 45 f4             	mov    -0xc(%ebp),%eax
    176a:	8b 40 04             	mov    0x4(%eax),%eax
    176d:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    1770:	72 4d                	jb     17bf <malloc+0xa6>
      if(p->s.size == nunits)
    1772:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1775:	8b 40 04             	mov    0x4(%eax),%eax
    1778:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    177b:	75 0c                	jne    1789 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
    177d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1780:	8b 10                	mov    (%eax),%edx
    1782:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1785:	89 10                	mov    %edx,(%eax)
    1787:	eb 26                	jmp    17af <malloc+0x96>
      else {
        p->s.size -= nunits;
    1789:	8b 45 f4             	mov    -0xc(%ebp),%eax
    178c:	8b 40 04             	mov    0x4(%eax),%eax
    178f:	2b 45 ec             	sub    -0x14(%ebp),%eax
    1792:	89 c2                	mov    %eax,%edx
    1794:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1797:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
    179a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    179d:	8b 40 04             	mov    0x4(%eax),%eax
    17a0:	c1 e0 03             	shl    $0x3,%eax
    17a3:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
    17a6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    17a9:	8b 55 ec             	mov    -0x14(%ebp),%edx
    17ac:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
    17af:	8b 45 f0             	mov    -0x10(%ebp),%eax
    17b2:	a3 9c 20 00 00       	mov    %eax,0x209c
      return (void*)(p + 1);
    17b7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    17ba:	83 c0 08             	add    $0x8,%eax
    17bd:	eb 38                	jmp    17f7 <malloc+0xde>
    }
    if(p == freep)
    17bf:	a1 9c 20 00 00       	mov    0x209c,%eax
    17c4:	39 45 f4             	cmp    %eax,-0xc(%ebp)
    17c7:	75 1b                	jne    17e4 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
    17c9:	8b 45 ec             	mov    -0x14(%ebp),%eax
    17cc:	89 04 24             	mov    %eax,(%esp)
    17cf:	e8 ed fe ff ff       	call   16c1 <morecore>
    17d4:	89 45 f4             	mov    %eax,-0xc(%ebp)
    17d7:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    17db:	75 07                	jne    17e4 <malloc+0xcb>
        return 0;
    17dd:	b8 00 00 00 00       	mov    $0x0,%eax
    17e2:	eb 13                	jmp    17f7 <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    17e4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    17e7:	89 45 f0             	mov    %eax,-0x10(%ebp)
    17ea:	8b 45 f4             	mov    -0xc(%ebp),%eax
    17ed:	8b 00                	mov    (%eax),%eax
    17ef:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
    17f2:	e9 70 ff ff ff       	jmp    1767 <malloc+0x4e>
}
    17f7:	c9                   	leave  
    17f8:	c3                   	ret    
    17f9:	66 90                	xchg   %ax,%ax
    17fb:	90                   	nop

000017fc <xchg>:
  asm volatile("sti");
}

static inline uint
xchg(volatile uint *addr, uint newval)
{
    17fc:	55                   	push   %ebp
    17fd:	89 e5                	mov    %esp,%ebp
    17ff:	83 ec 10             	sub    $0x10,%esp
  uint result;
  
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
    1802:	8b 55 08             	mov    0x8(%ebp),%edx
    1805:	8b 45 0c             	mov    0xc(%ebp),%eax
    1808:	8b 4d 08             	mov    0x8(%ebp),%ecx
    180b:	f0 87 02             	lock xchg %eax,(%edx)
    180e:	89 45 fc             	mov    %eax,-0x4(%ebp)
               "+m" (*addr), "=a" (result) :
               "1" (newval) :
               "cc");
  return result;
    1811:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    1814:	c9                   	leave  
    1815:	c3                   	ret    

00001816 <lock_init>:
#include "x86.h"
#include "proc.h"

unsigned long rands = 1;

void lock_init(lock_t *lock){
    1816:	55                   	push   %ebp
    1817:	89 e5                	mov    %esp,%ebp
    lock->locked = 0;
    1819:	8b 45 08             	mov    0x8(%ebp),%eax
    181c:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
    1822:	5d                   	pop    %ebp
    1823:	c3                   	ret    

00001824 <lock_acquire>:
void lock_acquire(lock_t *lock){
    1824:	55                   	push   %ebp
    1825:	89 e5                	mov    %esp,%ebp
    1827:	83 ec 08             	sub    $0x8,%esp
    while(xchg(&lock->locked,1) != 0);
    182a:	90                   	nop
    182b:	8b 45 08             	mov    0x8(%ebp),%eax
    182e:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
    1835:	00 
    1836:	89 04 24             	mov    %eax,(%esp)
    1839:	e8 be ff ff ff       	call   17fc <xchg>
    183e:	85 c0                	test   %eax,%eax
    1840:	75 e9                	jne    182b <lock_acquire+0x7>
}
    1842:	c9                   	leave  
    1843:	c3                   	ret    

00001844 <lock_release>:
void lock_release(lock_t *lock){
    1844:	55                   	push   %ebp
    1845:	89 e5                	mov    %esp,%ebp
    1847:	83 ec 08             	sub    $0x8,%esp
    xchg(&lock->locked,0);
    184a:	8b 45 08             	mov    0x8(%ebp),%eax
    184d:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1854:	00 
    1855:	89 04 24             	mov    %eax,(%esp)
    1858:	e8 9f ff ff ff       	call   17fc <xchg>
}
    185d:	c9                   	leave  
    185e:	c3                   	ret    

0000185f <thread_create>:


void *thread_create(void(*start_routine)(void*), void *arg){
    185f:	55                   	push   %ebp
    1860:	89 e5                	mov    %esp,%ebp
    1862:	83 ec 28             	sub    $0x28,%esp
    int tid;
    void * stack = malloc(2 * 4096);
    1865:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
    186c:	e8 a8 fe ff ff       	call   1719 <malloc>
    1871:	89 45 f4             	mov    %eax,-0xc(%ebp)
    void *garbage_stack = stack; 
    1874:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1877:	89 45 f0             	mov    %eax,-0x10(%ebp)
   // printf(1,"start routine addr : %d\n",(uint)start_routine);


    if((uint)stack % 4096){
    187a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    187d:	25 ff 0f 00 00       	and    $0xfff,%eax
    1882:	85 c0                	test   %eax,%eax
    1884:	74 14                	je     189a <thread_create+0x3b>
        stack = stack + (4096 - (uint)stack % 4096);
    1886:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1889:	25 ff 0f 00 00       	and    $0xfff,%eax
    188e:	89 c2                	mov    %eax,%edx
    1890:	b8 00 10 00 00       	mov    $0x1000,%eax
    1895:	29 d0                	sub    %edx,%eax
    1897:	01 45 f4             	add    %eax,-0xc(%ebp)
    }
    if (stack == 0){
    189a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    189e:	75 1b                	jne    18bb <thread_create+0x5c>

        printf(1,"malloc fail \n");
    18a0:	c7 44 24 04 2c 1c 00 	movl   $0x1c2c,0x4(%esp)
    18a7:	00 
    18a8:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    18af:	e8 78 fb ff ff       	call   142c <printf>
        return 0;
    18b4:	b8 00 00 00 00       	mov    $0x0,%eax
    18b9:	eb 6f                	jmp    192a <thread_create+0xcb>
    }

    tid = clone((uint)stack,PSIZE,(uint)start_routine,(int)arg);
    18bb:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    18be:	8b 55 08             	mov    0x8(%ebp),%edx
    18c1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    18c4:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
    18c8:	89 54 24 08          	mov    %edx,0x8(%esp)
    18cc:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
    18d3:	00 
    18d4:	89 04 24             	mov    %eax,(%esp)
    18d7:	e8 50 fa ff ff       	call   132c <clone>
    18dc:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(tid < 0){
    18df:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    18e3:	79 1b                	jns    1900 <thread_create+0xa1>
        printf(1,"clone fails\n");
    18e5:	c7 44 24 04 3a 1c 00 	movl   $0x1c3a,0x4(%esp)
    18ec:	00 
    18ed:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    18f4:	e8 33 fb ff ff       	call   142c <printf>
        return 0;
    18f9:	b8 00 00 00 00       	mov    $0x0,%eax
    18fe:	eb 2a                	jmp    192a <thread_create+0xcb>
    }
    if(tid > 0){
    1900:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1904:	7e 05                	jle    190b <thread_create+0xac>
        //store threads on thread table
        return garbage_stack;
    1906:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1909:	eb 1f                	jmp    192a <thread_create+0xcb>
    }
    if(tid == 0){
    190b:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    190f:	75 14                	jne    1925 <thread_create+0xc6>
        printf(1,"tid = 0 return \n");
    1911:	c7 44 24 04 47 1c 00 	movl   $0x1c47,0x4(%esp)
    1918:	00 
    1919:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1920:	e8 07 fb ff ff       	call   142c <printf>
    }
//    wait();
//    free(garbage_stack);

    return 0;
    1925:	b8 00 00 00 00       	mov    $0x0,%eax
}
    192a:	c9                   	leave  
    192b:	c3                   	ret    

0000192c <random>:

// generate 0 -> max random number exclude max.
int random(int max){
    192c:	55                   	push   %ebp
    192d:	89 e5                	mov    %esp,%ebp
    rands = rands * 1664525 + 1013904233;
    192f:	a1 90 20 00 00       	mov    0x2090,%eax
    1934:	69 c0 0d 66 19 00    	imul   $0x19660d,%eax,%eax
    193a:	05 69 f3 6e 3c       	add    $0x3c6ef369,%eax
    193f:	a3 90 20 00 00       	mov    %eax,0x2090
    return (int)(rands % max);
    1944:	a1 90 20 00 00       	mov    0x2090,%eax
    1949:	8b 4d 08             	mov    0x8(%ebp),%ecx
    194c:	ba 00 00 00 00       	mov    $0x0,%edx
    1951:	f7 f1                	div    %ecx
    1953:	89 d0                	mov    %edx,%eax
}
    1955:	5d                   	pop    %ebp
    1956:	c3                   	ret    
    1957:	90                   	nop

00001958 <init_q>:
#include "queue.h"
#include "types.h"
#include "user.h"

void init_q(struct queue *q){
    1958:	55                   	push   %ebp
    1959:	89 e5                	mov    %esp,%ebp
    q->size = 0;
    195b:	8b 45 08             	mov    0x8(%ebp),%eax
    195e:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    q->head = 0;
    1964:	8b 45 08             	mov    0x8(%ebp),%eax
    1967:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    q->tail = 0;
    196e:	8b 45 08             	mov    0x8(%ebp),%eax
    1971:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
}
    1978:	5d                   	pop    %ebp
    1979:	c3                   	ret    

0000197a <add_q>:

void add_q(struct queue *q, int v){
    197a:	55                   	push   %ebp
    197b:	89 e5                	mov    %esp,%ebp
    197d:	83 ec 28             	sub    $0x28,%esp
    struct node * n = malloc(sizeof(struct node));
    1980:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
    1987:	e8 8d fd ff ff       	call   1719 <malloc>
    198c:	89 45 f4             	mov    %eax,-0xc(%ebp)
    n->next = 0;
    198f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1992:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    n->value = v;
    1999:	8b 45 f4             	mov    -0xc(%ebp),%eax
    199c:	8b 55 0c             	mov    0xc(%ebp),%edx
    199f:	89 10                	mov    %edx,(%eax)
    if(q->head == 0){
    19a1:	8b 45 08             	mov    0x8(%ebp),%eax
    19a4:	8b 40 04             	mov    0x4(%eax),%eax
    19a7:	85 c0                	test   %eax,%eax
    19a9:	75 0b                	jne    19b6 <add_q+0x3c>
        q->head = n;
    19ab:	8b 45 08             	mov    0x8(%ebp),%eax
    19ae:	8b 55 f4             	mov    -0xc(%ebp),%edx
    19b1:	89 50 04             	mov    %edx,0x4(%eax)
    19b4:	eb 0c                	jmp    19c2 <add_q+0x48>
    }else{
        q->tail->next = n;
    19b6:	8b 45 08             	mov    0x8(%ebp),%eax
    19b9:	8b 40 08             	mov    0x8(%eax),%eax
    19bc:	8b 55 f4             	mov    -0xc(%ebp),%edx
    19bf:	89 50 04             	mov    %edx,0x4(%eax)
    }
    q->tail = n;
    19c2:	8b 45 08             	mov    0x8(%ebp),%eax
    19c5:	8b 55 f4             	mov    -0xc(%ebp),%edx
    19c8:	89 50 08             	mov    %edx,0x8(%eax)
    q->size++;
    19cb:	8b 45 08             	mov    0x8(%ebp),%eax
    19ce:	8b 00                	mov    (%eax),%eax
    19d0:	8d 50 01             	lea    0x1(%eax),%edx
    19d3:	8b 45 08             	mov    0x8(%ebp),%eax
    19d6:	89 10                	mov    %edx,(%eax)
}
    19d8:	c9                   	leave  
    19d9:	c3                   	ret    

000019da <empty_q>:

int empty_q(struct queue *q){
    19da:	55                   	push   %ebp
    19db:	89 e5                	mov    %esp,%ebp
    if(q->size == 0)
    19dd:	8b 45 08             	mov    0x8(%ebp),%eax
    19e0:	8b 00                	mov    (%eax),%eax
    19e2:	85 c0                	test   %eax,%eax
    19e4:	75 07                	jne    19ed <empty_q+0x13>
        return 1;
    19e6:	b8 01 00 00 00       	mov    $0x1,%eax
    19eb:	eb 05                	jmp    19f2 <empty_q+0x18>
    else
        return 0;
    19ed:	b8 00 00 00 00       	mov    $0x0,%eax
} 
    19f2:	5d                   	pop    %ebp
    19f3:	c3                   	ret    

000019f4 <pop_q>:
int pop_q(struct queue *q){
    19f4:	55                   	push   %ebp
    19f5:	89 e5                	mov    %esp,%ebp
    19f7:	83 ec 28             	sub    $0x28,%esp
    int val;
    struct node *destroy;
    if(!empty_q(q)){
    19fa:	8b 45 08             	mov    0x8(%ebp),%eax
    19fd:	89 04 24             	mov    %eax,(%esp)
    1a00:	e8 d5 ff ff ff       	call   19da <empty_q>
    1a05:	85 c0                	test   %eax,%eax
    1a07:	75 5d                	jne    1a66 <pop_q+0x72>
       val = q->head->value; 
    1a09:	8b 45 08             	mov    0x8(%ebp),%eax
    1a0c:	8b 40 04             	mov    0x4(%eax),%eax
    1a0f:	8b 00                	mov    (%eax),%eax
    1a11:	89 45 f4             	mov    %eax,-0xc(%ebp)
       destroy = q->head;
    1a14:	8b 45 08             	mov    0x8(%ebp),%eax
    1a17:	8b 40 04             	mov    0x4(%eax),%eax
    1a1a:	89 45 f0             	mov    %eax,-0x10(%ebp)
       q->head = q->head->next;
    1a1d:	8b 45 08             	mov    0x8(%ebp),%eax
    1a20:	8b 40 04             	mov    0x4(%eax),%eax
    1a23:	8b 50 04             	mov    0x4(%eax),%edx
    1a26:	8b 45 08             	mov    0x8(%ebp),%eax
    1a29:	89 50 04             	mov    %edx,0x4(%eax)
       free(destroy);
    1a2c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1a2f:	89 04 24             	mov    %eax,(%esp)
    1a32:	e8 a9 fb ff ff       	call   15e0 <free>
       q->size--;
    1a37:	8b 45 08             	mov    0x8(%ebp),%eax
    1a3a:	8b 00                	mov    (%eax),%eax
    1a3c:	8d 50 ff             	lea    -0x1(%eax),%edx
    1a3f:	8b 45 08             	mov    0x8(%ebp),%eax
    1a42:	89 10                	mov    %edx,(%eax)
       if(q->size == 0){
    1a44:	8b 45 08             	mov    0x8(%ebp),%eax
    1a47:	8b 00                	mov    (%eax),%eax
    1a49:	85 c0                	test   %eax,%eax
    1a4b:	75 14                	jne    1a61 <pop_q+0x6d>
            q->head = 0;
    1a4d:	8b 45 08             	mov    0x8(%ebp),%eax
    1a50:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
            q->tail = 0;
    1a57:	8b 45 08             	mov    0x8(%ebp),%eax
    1a5a:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
       }
       return val;
    1a61:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1a64:	eb 05                	jmp    1a6b <pop_q+0x77>
    }
    return -1;
    1a66:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
    1a6b:	c9                   	leave  
    1a6c:	c3                   	ret    

00001a6d <dominant>:

void dominant(struct queue* q, int i){
    1a6d:	55                   	push   %ebp
    1a6e:	89 e5                	mov    %esp,%ebp
    1a70:	83 ec 28             	sub    $0x28,%esp
    struct node * n = malloc(sizeof(struct node));
    1a73:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
    1a7a:	e8 9a fc ff ff       	call   1719 <malloc>
    1a7f:	89 45 f4             	mov    %eax,-0xc(%ebp)
    n->value = i;
    1a82:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1a85:	8b 55 0c             	mov    0xc(%ebp),%edx
    1a88:	89 10                	mov    %edx,(%eax)

    if(q->head == 0){
    1a8a:	8b 45 08             	mov    0x8(%ebp),%eax
    1a8d:	8b 40 04             	mov    0x4(%eax),%eax
    1a90:	85 c0                	test   %eax,%eax
    1a92:	75 14                	jne    1aa8 <dominant+0x3b>
        q->head = n;
    1a94:	8b 45 08             	mov    0x8(%ebp),%eax
    1a97:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1a9a:	89 50 04             	mov    %edx,0x4(%eax)
        q->tail = n;
    1a9d:	8b 45 08             	mov    0x8(%ebp),%eax
    1aa0:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1aa3:	89 50 08             	mov    %edx,0x8(%eax)
    1aa6:	eb 15                	jmp    1abd <dominant+0x50>
    }
    else{
        n->next = q->head;
    1aa8:	8b 45 08             	mov    0x8(%ebp),%eax
    1aab:	8b 50 04             	mov    0x4(%eax),%edx
    1aae:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1ab1:	89 50 04             	mov    %edx,0x4(%eax)
        q->head = n;
    1ab4:	8b 45 08             	mov    0x8(%ebp),%eax
    1ab7:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1aba:	89 50 04             	mov    %edx,0x4(%eax)
    }
    q->size++;
    1abd:	8b 45 08             	mov    0x8(%ebp),%eax
    1ac0:	8b 00                	mov    (%eax),%eax
    1ac2:	8d 50 01             	lea    0x1(%eax),%edx
    1ac5:	8b 45 08             	mov    0x8(%ebp),%eax
    1ac8:	89 10                	mov    %edx,(%eax)
}
    1aca:	c9                   	leave  
    1acb:	c3                   	ret    

00001acc <sem_init>:
#include "semaphore.h"
#include "user.h"

// Initializes the semaphore
void sem_init(struct Semaphore* s, int value){
    1acc:	55                   	push   %ebp
    1acd:	89 e5                	mov    %esp,%ebp
    1acf:	83 ec 18             	sub    $0x18,%esp
    s->val = value;
    1ad2:	8b 45 08             	mov    0x8(%ebp),%eax
    1ad5:	8b 55 0c             	mov    0xc(%ebp),%edx
    1ad8:	89 10                	mov    %edx,(%eax)
    lock_init(&s->lock);
    1ada:	8b 45 08             	mov    0x8(%ebp),%eax
    1add:	83 c0 04             	add    $0x4,%eax
    1ae0:	89 04 24             	mov    %eax,(%esp)
    1ae3:	e8 2e fd ff ff       	call   1816 <lock_init>
    init_q(&s->q);
    1ae8:	8b 45 08             	mov    0x8(%ebp),%eax
    1aeb:	83 c0 08             	add    $0x8,%eax
    1aee:	89 04 24             	mov    %eax,(%esp)
    1af1:	e8 62 fe ff ff       	call   1958 <init_q>
}
    1af6:	c9                   	leave  
    1af7:	c3                   	ret    

00001af8 <sem_acquire>:

// Decrements the semaphore
void sem_acquire(struct Semaphore* s){
    1af8:	55                   	push   %ebp
    1af9:	89 e5                	mov    %esp,%ebp
    1afb:	83 ec 28             	sub    $0x28,%esp
    lock_acquire(&s->lock);
    1afe:	8b 45 08             	mov    0x8(%ebp),%eax
    1b01:	83 c0 04             	add    $0x4,%eax
    1b04:	89 04 24             	mov    %eax,(%esp)
    1b07:	e8 18 fd ff ff       	call   1824 <lock_acquire>

    if(s->val == 0){
    1b0c:	8b 45 08             	mov    0x8(%ebp),%eax
    1b0f:	8b 00                	mov    (%eax),%eax
    1b11:	85 c0                	test   %eax,%eax
    1b13:	75 32                	jne    1b47 <sem_acquire+0x4f>
        int pid;
        pid = getpid();
    1b15:	e8 f2 f7 ff ff       	call   130c <getpid>
    1b1a:	89 45 f4             	mov    %eax,-0xc(%ebp)
        add_q(&s->q, pid);
    1b1d:	8b 45 08             	mov    0x8(%ebp),%eax
    1b20:	8d 50 08             	lea    0x8(%eax),%edx
    1b23:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1b26:	89 44 24 04          	mov    %eax,0x4(%esp)
    1b2a:	89 14 24             	mov    %edx,(%esp)
    1b2d:	e8 48 fe ff ff       	call   197a <add_q>
        lock_release(&s->lock);
    1b32:	8b 45 08             	mov    0x8(%ebp),%eax
    1b35:	83 c0 04             	add    $0x4,%eax
    1b38:	89 04 24             	mov    %eax,(%esp)
    1b3b:	e8 04 fd ff ff       	call   1844 <lock_release>
        tsleep();
    1b40:	e8 f7 f7 ff ff       	call   133c <tsleep>
    1b45:	eb 1b                	jmp    1b62 <sem_acquire+0x6a>
    }
    else{
        s->val--;
    1b47:	8b 45 08             	mov    0x8(%ebp),%eax
    1b4a:	8b 00                	mov    (%eax),%eax
    1b4c:	8d 50 ff             	lea    -0x1(%eax),%edx
    1b4f:	8b 45 08             	mov    0x8(%ebp),%eax
    1b52:	89 10                	mov    %edx,(%eax)
        lock_release(&s->lock);
    1b54:	8b 45 08             	mov    0x8(%ebp),%eax
    1b57:	83 c0 04             	add    $0x4,%eax
    1b5a:	89 04 24             	mov    %eax,(%esp)
    1b5d:	e8 e2 fc ff ff       	call   1844 <lock_release>
    }
}
    1b62:	c9                   	leave  
    1b63:	c3                   	ret    

00001b64 <sem_signal>:

// Increments the semaphore
void sem_signal(struct Semaphore* s){
    1b64:	55                   	push   %ebp
    1b65:	89 e5                	mov    %esp,%ebp
    1b67:	83 ec 18             	sub    $0x18,%esp
    lock_acquire(&s->lock);
    1b6a:	8b 45 08             	mov    0x8(%ebp),%eax
    1b6d:	83 c0 04             	add    $0x4,%eax
    1b70:	89 04 24             	mov    %eax,(%esp)
    1b73:	e8 ac fc ff ff       	call   1824 <lock_acquire>

    if(!empty_q(&s->q)){
    1b78:	8b 45 08             	mov    0x8(%ebp),%eax
    1b7b:	83 c0 08             	add    $0x8,%eax
    1b7e:	89 04 24             	mov    %eax,(%esp)
    1b81:	e8 54 fe ff ff       	call   19da <empty_q>
    1b86:	85 c0                	test   %eax,%eax
    1b88:	75 18                	jne    1ba2 <sem_signal+0x3e>
        twakeup(pop_q(&s->q));
    1b8a:	8b 45 08             	mov    0x8(%ebp),%eax
    1b8d:	83 c0 08             	add    $0x8,%eax
    1b90:	89 04 24             	mov    %eax,(%esp)
    1b93:	e8 5c fe ff ff       	call   19f4 <pop_q>
    1b98:	89 04 24             	mov    %eax,(%esp)
    1b9b:	e8 a4 f7 ff ff       	call   1344 <twakeup>
    1ba0:	eb 0d                	jmp    1baf <sem_signal+0x4b>
    }
    else{
        s->val++;
    1ba2:	8b 45 08             	mov    0x8(%ebp),%eax
    1ba5:	8b 00                	mov    (%eax),%eax
    1ba7:	8d 50 01             	lea    0x1(%eax),%edx
    1baa:	8b 45 08             	mov    0x8(%ebp),%eax
    1bad:	89 10                	mov    %edx,(%eax)
    }

    lock_release(&s->lock);
    1baf:	8b 45 08             	mov    0x8(%ebp),%eax
    1bb2:	83 c0 04             	add    $0x4,%eax
    1bb5:	89 04 24             	mov    %eax,(%esp)
    1bb8:	e8 87 fc ff ff       	call   1844 <lock_release>
}
    1bbd:	c9                   	leave  
    1bbe:	c3                   	ret    

00001bbf <sem_dom_acquire>:

void sem_dom_acquire(struct Semaphore* s){
    1bbf:	55                   	push   %ebp
    1bc0:	89 e5                	mov    %esp,%ebp
    1bc2:	83 ec 18             	sub    $0x18,%esp
    lock_acquire(&s->lock);
    1bc5:	8b 45 08             	mov    0x8(%ebp),%eax
    1bc8:	83 c0 04             	add    $0x4,%eax
    1bcb:	89 04 24             	mov    %eax,(%esp)
    1bce:	e8 51 fc ff ff       	call   1824 <lock_acquire>

    if(s->val > 0){
    1bd3:	8b 45 08             	mov    0x8(%ebp),%eax
    1bd6:	8b 00                	mov    (%eax),%eax
    1bd8:	85 c0                	test   %eax,%eax
    1bda:	7e 1d                	jle    1bf9 <sem_dom_acquire+0x3a>
        s->val--;
    1bdc:	8b 45 08             	mov    0x8(%ebp),%eax
    1bdf:	8b 00                	mov    (%eax),%eax
    1be1:	8d 50 ff             	lea    -0x1(%eax),%edx
    1be4:	8b 45 08             	mov    0x8(%ebp),%eax
    1be7:	89 10                	mov    %edx,(%eax)
        lock_release(&s->lock);
    1be9:	8b 45 08             	mov    0x8(%ebp),%eax
    1bec:	83 c0 04             	add    $0x4,%eax
    1bef:	89 04 24             	mov    %eax,(%esp)
    1bf2:	e8 4d fc ff ff       	call   1844 <lock_release>
        return;
    1bf7:	eb 2a                	jmp    1c23 <sem_dom_acquire+0x64>
    }

    dominant(&s->q,getpid());
    1bf9:	e8 0e f7 ff ff       	call   130c <getpid>
    1bfe:	8b 55 08             	mov    0x8(%ebp),%edx
    1c01:	83 c2 08             	add    $0x8,%edx
    1c04:	89 44 24 04          	mov    %eax,0x4(%esp)
    1c08:	89 14 24             	mov    %edx,(%esp)
    1c0b:	e8 5d fe ff ff       	call   1a6d <dominant>
    lock_release(&s->lock);
    1c10:	8b 45 08             	mov    0x8(%ebp),%eax
    1c13:	83 c0 04             	add    $0x4,%eax
    1c16:	89 04 24             	mov    %eax,(%esp)
    1c19:	e8 26 fc ff ff       	call   1844 <lock_release>
    tsleep();
    1c1e:	e8 19 f7 ff ff       	call   133c <tsleep>
}
    1c23:	c9                   	leave  
    1c24:	c3                   	ret    
