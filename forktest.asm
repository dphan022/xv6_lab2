
_forktest:     file format elf32-i386


Disassembly of section .text:

00001000 <printf>:

#define N  1000

void
printf(int fd, char *s, ...)
{
    1000:	55                   	push   %ebp
    1001:	89 e5                	mov    %esp,%ebp
    1003:	83 ec 18             	sub    $0x18,%esp
  write(fd, s, strlen(s));
    1006:	8b 45 0c             	mov    0xc(%ebp),%eax
    1009:	89 04 24             	mov    %eax,(%esp)
    100c:	e8 9b 01 00 00       	call   11ac <strlen>
    1011:	89 44 24 08          	mov    %eax,0x8(%esp)
    1015:	8b 45 0c             	mov    0xc(%ebp),%eax
    1018:	89 44 24 04          	mov    %eax,0x4(%esp)
    101c:	8b 45 08             	mov    0x8(%ebp),%eax
    101f:	89 04 24             	mov    %eax,(%esp)
    1022:	e8 79 03 00 00       	call   13a0 <write>
}
    1027:	c9                   	leave  
    1028:	c3                   	ret    

00001029 <forktest>:

void
forktest(void)
{
    1029:	55                   	push   %ebp
    102a:	89 e5                	mov    %esp,%ebp
    102c:	83 ec 28             	sub    $0x28,%esp
  int n, pid;

  printf(1, "fork test\n");
    102f:	c7 44 24 04 40 14 00 	movl   $0x1440,0x4(%esp)
    1036:	00 
    1037:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    103e:	e8 bd ff ff ff       	call   1000 <printf>

  for(n=0; n<N; n++){
    1043:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    104a:	eb 1f                	jmp    106b <forktest+0x42>
    pid = fork();
    104c:	e8 27 03 00 00       	call   1378 <fork>
    1051:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(pid < 0)
    1054:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1058:	79 02                	jns    105c <forktest+0x33>
      break;
    105a:	eb 18                	jmp    1074 <forktest+0x4b>
    if(pid == 0)
    105c:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1060:	75 05                	jne    1067 <forktest+0x3e>
      exit();
    1062:	e8 19 03 00 00       	call   1380 <exit>
{
  int n, pid;

  printf(1, "fork test\n");

  for(n=0; n<N; n++){
    1067:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    106b:	81 7d f4 e7 03 00 00 	cmpl   $0x3e7,-0xc(%ebp)
    1072:	7e d8                	jle    104c <forktest+0x23>
      break;
    if(pid == 0)
      exit();
  }
  
  if(n == N){
    1074:	81 7d f4 e8 03 00 00 	cmpl   $0x3e8,-0xc(%ebp)
    107b:	75 21                	jne    109e <forktest+0x75>
    printf(1, "fork claimed to work N times!\n", N);
    107d:	c7 44 24 08 e8 03 00 	movl   $0x3e8,0x8(%esp)
    1084:	00 
    1085:	c7 44 24 04 4c 14 00 	movl   $0x144c,0x4(%esp)
    108c:	00 
    108d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1094:	e8 67 ff ff ff       	call   1000 <printf>
    exit();
    1099:	e8 e2 02 00 00       	call   1380 <exit>
  }
  
  for(; n > 0; n--){
    109e:	eb 26                	jmp    10c6 <forktest+0x9d>
    if(wait() < 0){
    10a0:	e8 e3 02 00 00       	call   1388 <wait>
    10a5:	85 c0                	test   %eax,%eax
    10a7:	79 19                	jns    10c2 <forktest+0x99>
      printf(1, "wait stopped early\n");
    10a9:	c7 44 24 04 6b 14 00 	movl   $0x146b,0x4(%esp)
    10b0:	00 
    10b1:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    10b8:	e8 43 ff ff ff       	call   1000 <printf>
      exit();
    10bd:	e8 be 02 00 00       	call   1380 <exit>
  if(n == N){
    printf(1, "fork claimed to work N times!\n", N);
    exit();
  }
  
  for(; n > 0; n--){
    10c2:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    10c6:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    10ca:	7f d4                	jg     10a0 <forktest+0x77>
      printf(1, "wait stopped early\n");
      exit();
    }
  }
  
  if(wait() != -1){
    10cc:	e8 b7 02 00 00       	call   1388 <wait>
    10d1:	83 f8 ff             	cmp    $0xffffffff,%eax
    10d4:	74 19                	je     10ef <forktest+0xc6>
    printf(1, "wait got too many\n");
    10d6:	c7 44 24 04 7f 14 00 	movl   $0x147f,0x4(%esp)
    10dd:	00 
    10de:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    10e5:	e8 16 ff ff ff       	call   1000 <printf>
    exit();
    10ea:	e8 91 02 00 00       	call   1380 <exit>
  }
  
  printf(1, "fork test OK\n");
    10ef:	c7 44 24 04 92 14 00 	movl   $0x1492,0x4(%esp)
    10f6:	00 
    10f7:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    10fe:	e8 fd fe ff ff       	call   1000 <printf>
}
    1103:	c9                   	leave  
    1104:	c3                   	ret    

00001105 <main>:

int
main(void)
{
    1105:	55                   	push   %ebp
    1106:	89 e5                	mov    %esp,%ebp
    1108:	83 e4 f0             	and    $0xfffffff0,%esp
  forktest();
    110b:	e8 19 ff ff ff       	call   1029 <forktest>
  exit();
    1110:	e8 6b 02 00 00       	call   1380 <exit>
    1115:	66 90                	xchg   %ax,%ax
    1117:	90                   	nop

00001118 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
    1118:	55                   	push   %ebp
    1119:	89 e5                	mov    %esp,%ebp
    111b:	57                   	push   %edi
    111c:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
    111d:	8b 4d 08             	mov    0x8(%ebp),%ecx
    1120:	8b 55 10             	mov    0x10(%ebp),%edx
    1123:	8b 45 0c             	mov    0xc(%ebp),%eax
    1126:	89 cb                	mov    %ecx,%ebx
    1128:	89 df                	mov    %ebx,%edi
    112a:	89 d1                	mov    %edx,%ecx
    112c:	fc                   	cld    
    112d:	f3 aa                	rep stos %al,%es:(%edi)
    112f:	89 ca                	mov    %ecx,%edx
    1131:	89 fb                	mov    %edi,%ebx
    1133:	89 5d 08             	mov    %ebx,0x8(%ebp)
    1136:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
    1139:	5b                   	pop    %ebx
    113a:	5f                   	pop    %edi
    113b:	5d                   	pop    %ebp
    113c:	c3                   	ret    

0000113d <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
    113d:	55                   	push   %ebp
    113e:	89 e5                	mov    %esp,%ebp
    1140:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
    1143:	8b 45 08             	mov    0x8(%ebp),%eax
    1146:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
    1149:	90                   	nop
    114a:	8b 45 08             	mov    0x8(%ebp),%eax
    114d:	8d 50 01             	lea    0x1(%eax),%edx
    1150:	89 55 08             	mov    %edx,0x8(%ebp)
    1153:	8b 55 0c             	mov    0xc(%ebp),%edx
    1156:	8d 4a 01             	lea    0x1(%edx),%ecx
    1159:	89 4d 0c             	mov    %ecx,0xc(%ebp)
    115c:	0f b6 12             	movzbl (%edx),%edx
    115f:	88 10                	mov    %dl,(%eax)
    1161:	0f b6 00             	movzbl (%eax),%eax
    1164:	84 c0                	test   %al,%al
    1166:	75 e2                	jne    114a <strcpy+0xd>
    ;
  return os;
    1168:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    116b:	c9                   	leave  
    116c:	c3                   	ret    

0000116d <strcmp>:

int
strcmp(const char *p, const char *q)
{
    116d:	55                   	push   %ebp
    116e:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
    1170:	eb 08                	jmp    117a <strcmp+0xd>
    p++, q++;
    1172:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    1176:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    117a:	8b 45 08             	mov    0x8(%ebp),%eax
    117d:	0f b6 00             	movzbl (%eax),%eax
    1180:	84 c0                	test   %al,%al
    1182:	74 10                	je     1194 <strcmp+0x27>
    1184:	8b 45 08             	mov    0x8(%ebp),%eax
    1187:	0f b6 10             	movzbl (%eax),%edx
    118a:	8b 45 0c             	mov    0xc(%ebp),%eax
    118d:	0f b6 00             	movzbl (%eax),%eax
    1190:	38 c2                	cmp    %al,%dl
    1192:	74 de                	je     1172 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
    1194:	8b 45 08             	mov    0x8(%ebp),%eax
    1197:	0f b6 00             	movzbl (%eax),%eax
    119a:	0f b6 d0             	movzbl %al,%edx
    119d:	8b 45 0c             	mov    0xc(%ebp),%eax
    11a0:	0f b6 00             	movzbl (%eax),%eax
    11a3:	0f b6 c0             	movzbl %al,%eax
    11a6:	29 c2                	sub    %eax,%edx
    11a8:	89 d0                	mov    %edx,%eax
}
    11aa:	5d                   	pop    %ebp
    11ab:	c3                   	ret    

000011ac <strlen>:

uint
strlen(char *s)
{
    11ac:	55                   	push   %ebp
    11ad:	89 e5                	mov    %esp,%ebp
    11af:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
    11b2:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    11b9:	eb 04                	jmp    11bf <strlen+0x13>
    11bb:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    11bf:	8b 55 fc             	mov    -0x4(%ebp),%edx
    11c2:	8b 45 08             	mov    0x8(%ebp),%eax
    11c5:	01 d0                	add    %edx,%eax
    11c7:	0f b6 00             	movzbl (%eax),%eax
    11ca:	84 c0                	test   %al,%al
    11cc:	75 ed                	jne    11bb <strlen+0xf>
    ;
  return n;
    11ce:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    11d1:	c9                   	leave  
    11d2:	c3                   	ret    

000011d3 <memset>:

void*
memset(void *dst, int c, uint n)
{
    11d3:	55                   	push   %ebp
    11d4:	89 e5                	mov    %esp,%ebp
    11d6:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
    11d9:	8b 45 10             	mov    0x10(%ebp),%eax
    11dc:	89 44 24 08          	mov    %eax,0x8(%esp)
    11e0:	8b 45 0c             	mov    0xc(%ebp),%eax
    11e3:	89 44 24 04          	mov    %eax,0x4(%esp)
    11e7:	8b 45 08             	mov    0x8(%ebp),%eax
    11ea:	89 04 24             	mov    %eax,(%esp)
    11ed:	e8 26 ff ff ff       	call   1118 <stosb>
  return dst;
    11f2:	8b 45 08             	mov    0x8(%ebp),%eax
}
    11f5:	c9                   	leave  
    11f6:	c3                   	ret    

000011f7 <strchr>:

char*
strchr(const char *s, char c)
{
    11f7:	55                   	push   %ebp
    11f8:	89 e5                	mov    %esp,%ebp
    11fa:	83 ec 04             	sub    $0x4,%esp
    11fd:	8b 45 0c             	mov    0xc(%ebp),%eax
    1200:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
    1203:	eb 14                	jmp    1219 <strchr+0x22>
    if(*s == c)
    1205:	8b 45 08             	mov    0x8(%ebp),%eax
    1208:	0f b6 00             	movzbl (%eax),%eax
    120b:	3a 45 fc             	cmp    -0x4(%ebp),%al
    120e:	75 05                	jne    1215 <strchr+0x1e>
      return (char*)s;
    1210:	8b 45 08             	mov    0x8(%ebp),%eax
    1213:	eb 13                	jmp    1228 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
    1215:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    1219:	8b 45 08             	mov    0x8(%ebp),%eax
    121c:	0f b6 00             	movzbl (%eax),%eax
    121f:	84 c0                	test   %al,%al
    1221:	75 e2                	jne    1205 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
    1223:	b8 00 00 00 00       	mov    $0x0,%eax
}
    1228:	c9                   	leave  
    1229:	c3                   	ret    

0000122a <gets>:

char*
gets(char *buf, int max)
{
    122a:	55                   	push   %ebp
    122b:	89 e5                	mov    %esp,%ebp
    122d:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1230:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    1237:	eb 4c                	jmp    1285 <gets+0x5b>
    cc = read(0, &c, 1);
    1239:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    1240:	00 
    1241:	8d 45 ef             	lea    -0x11(%ebp),%eax
    1244:	89 44 24 04          	mov    %eax,0x4(%esp)
    1248:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    124f:	e8 44 01 00 00       	call   1398 <read>
    1254:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
    1257:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    125b:	7f 02                	jg     125f <gets+0x35>
      break;
    125d:	eb 31                	jmp    1290 <gets+0x66>
    buf[i++] = c;
    125f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1262:	8d 50 01             	lea    0x1(%eax),%edx
    1265:	89 55 f4             	mov    %edx,-0xc(%ebp)
    1268:	89 c2                	mov    %eax,%edx
    126a:	8b 45 08             	mov    0x8(%ebp),%eax
    126d:	01 c2                	add    %eax,%edx
    126f:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    1273:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
    1275:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    1279:	3c 0a                	cmp    $0xa,%al
    127b:	74 13                	je     1290 <gets+0x66>
    127d:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    1281:	3c 0d                	cmp    $0xd,%al
    1283:	74 0b                	je     1290 <gets+0x66>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1285:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1288:	83 c0 01             	add    $0x1,%eax
    128b:	3b 45 0c             	cmp    0xc(%ebp),%eax
    128e:	7c a9                	jl     1239 <gets+0xf>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    1290:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1293:	8b 45 08             	mov    0x8(%ebp),%eax
    1296:	01 d0                	add    %edx,%eax
    1298:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
    129b:	8b 45 08             	mov    0x8(%ebp),%eax
}
    129e:	c9                   	leave  
    129f:	c3                   	ret    

000012a0 <stat>:

int
stat(char *n, struct stat *st)
{
    12a0:	55                   	push   %ebp
    12a1:	89 e5                	mov    %esp,%ebp
    12a3:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    12a6:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    12ad:	00 
    12ae:	8b 45 08             	mov    0x8(%ebp),%eax
    12b1:	89 04 24             	mov    %eax,(%esp)
    12b4:	e8 07 01 00 00       	call   13c0 <open>
    12b9:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
    12bc:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    12c0:	79 07                	jns    12c9 <stat+0x29>
    return -1;
    12c2:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    12c7:	eb 23                	jmp    12ec <stat+0x4c>
  r = fstat(fd, st);
    12c9:	8b 45 0c             	mov    0xc(%ebp),%eax
    12cc:	89 44 24 04          	mov    %eax,0x4(%esp)
    12d0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    12d3:	89 04 24             	mov    %eax,(%esp)
    12d6:	e8 fd 00 00 00       	call   13d8 <fstat>
    12db:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
    12de:	8b 45 f4             	mov    -0xc(%ebp),%eax
    12e1:	89 04 24             	mov    %eax,(%esp)
    12e4:	e8 bf 00 00 00       	call   13a8 <close>
  return r;
    12e9:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
    12ec:	c9                   	leave  
    12ed:	c3                   	ret    

000012ee <atoi>:

int
atoi(const char *s)
{
    12ee:	55                   	push   %ebp
    12ef:	89 e5                	mov    %esp,%ebp
    12f1:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
    12f4:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
    12fb:	eb 25                	jmp    1322 <atoi+0x34>
    n = n*10 + *s++ - '0';
    12fd:	8b 55 fc             	mov    -0x4(%ebp),%edx
    1300:	89 d0                	mov    %edx,%eax
    1302:	c1 e0 02             	shl    $0x2,%eax
    1305:	01 d0                	add    %edx,%eax
    1307:	01 c0                	add    %eax,%eax
    1309:	89 c1                	mov    %eax,%ecx
    130b:	8b 45 08             	mov    0x8(%ebp),%eax
    130e:	8d 50 01             	lea    0x1(%eax),%edx
    1311:	89 55 08             	mov    %edx,0x8(%ebp)
    1314:	0f b6 00             	movzbl (%eax),%eax
    1317:	0f be c0             	movsbl %al,%eax
    131a:	01 c8                	add    %ecx,%eax
    131c:	83 e8 30             	sub    $0x30,%eax
    131f:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    1322:	8b 45 08             	mov    0x8(%ebp),%eax
    1325:	0f b6 00             	movzbl (%eax),%eax
    1328:	3c 2f                	cmp    $0x2f,%al
    132a:	7e 0a                	jle    1336 <atoi+0x48>
    132c:	8b 45 08             	mov    0x8(%ebp),%eax
    132f:	0f b6 00             	movzbl (%eax),%eax
    1332:	3c 39                	cmp    $0x39,%al
    1334:	7e c7                	jle    12fd <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
    1336:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    1339:	c9                   	leave  
    133a:	c3                   	ret    

0000133b <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    133b:	55                   	push   %ebp
    133c:	89 e5                	mov    %esp,%ebp
    133e:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
    1341:	8b 45 08             	mov    0x8(%ebp),%eax
    1344:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
    1347:	8b 45 0c             	mov    0xc(%ebp),%eax
    134a:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
    134d:	eb 17                	jmp    1366 <memmove+0x2b>
    *dst++ = *src++;
    134f:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1352:	8d 50 01             	lea    0x1(%eax),%edx
    1355:	89 55 fc             	mov    %edx,-0x4(%ebp)
    1358:	8b 55 f8             	mov    -0x8(%ebp),%edx
    135b:	8d 4a 01             	lea    0x1(%edx),%ecx
    135e:	89 4d f8             	mov    %ecx,-0x8(%ebp)
    1361:	0f b6 12             	movzbl (%edx),%edx
    1364:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    1366:	8b 45 10             	mov    0x10(%ebp),%eax
    1369:	8d 50 ff             	lea    -0x1(%eax),%edx
    136c:	89 55 10             	mov    %edx,0x10(%ebp)
    136f:	85 c0                	test   %eax,%eax
    1371:	7f dc                	jg     134f <memmove+0x14>
    *dst++ = *src++;
  return vdst;
    1373:	8b 45 08             	mov    0x8(%ebp),%eax
}
    1376:	c9                   	leave  
    1377:	c3                   	ret    

00001378 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    1378:	b8 01 00 00 00       	mov    $0x1,%eax
    137d:	cd 40                	int    $0x40
    137f:	c3                   	ret    

00001380 <exit>:
SYSCALL(exit)
    1380:	b8 02 00 00 00       	mov    $0x2,%eax
    1385:	cd 40                	int    $0x40
    1387:	c3                   	ret    

00001388 <wait>:
SYSCALL(wait)
    1388:	b8 03 00 00 00       	mov    $0x3,%eax
    138d:	cd 40                	int    $0x40
    138f:	c3                   	ret    

00001390 <pipe>:
SYSCALL(pipe)
    1390:	b8 04 00 00 00       	mov    $0x4,%eax
    1395:	cd 40                	int    $0x40
    1397:	c3                   	ret    

00001398 <read>:
SYSCALL(read)
    1398:	b8 05 00 00 00       	mov    $0x5,%eax
    139d:	cd 40                	int    $0x40
    139f:	c3                   	ret    

000013a0 <write>:
SYSCALL(write)
    13a0:	b8 10 00 00 00       	mov    $0x10,%eax
    13a5:	cd 40                	int    $0x40
    13a7:	c3                   	ret    

000013a8 <close>:
SYSCALL(close)
    13a8:	b8 15 00 00 00       	mov    $0x15,%eax
    13ad:	cd 40                	int    $0x40
    13af:	c3                   	ret    

000013b0 <kill>:
SYSCALL(kill)
    13b0:	b8 06 00 00 00       	mov    $0x6,%eax
    13b5:	cd 40                	int    $0x40
    13b7:	c3                   	ret    

000013b8 <exec>:
SYSCALL(exec)
    13b8:	b8 07 00 00 00       	mov    $0x7,%eax
    13bd:	cd 40                	int    $0x40
    13bf:	c3                   	ret    

000013c0 <open>:
SYSCALL(open)
    13c0:	b8 0f 00 00 00       	mov    $0xf,%eax
    13c5:	cd 40                	int    $0x40
    13c7:	c3                   	ret    

000013c8 <mknod>:
SYSCALL(mknod)
    13c8:	b8 11 00 00 00       	mov    $0x11,%eax
    13cd:	cd 40                	int    $0x40
    13cf:	c3                   	ret    

000013d0 <unlink>:
SYSCALL(unlink)
    13d0:	b8 12 00 00 00       	mov    $0x12,%eax
    13d5:	cd 40                	int    $0x40
    13d7:	c3                   	ret    

000013d8 <fstat>:
SYSCALL(fstat)
    13d8:	b8 08 00 00 00       	mov    $0x8,%eax
    13dd:	cd 40                	int    $0x40
    13df:	c3                   	ret    

000013e0 <link>:
SYSCALL(link)
    13e0:	b8 13 00 00 00       	mov    $0x13,%eax
    13e5:	cd 40                	int    $0x40
    13e7:	c3                   	ret    

000013e8 <mkdir>:
SYSCALL(mkdir)
    13e8:	b8 14 00 00 00       	mov    $0x14,%eax
    13ed:	cd 40                	int    $0x40
    13ef:	c3                   	ret    

000013f0 <chdir>:
SYSCALL(chdir)
    13f0:	b8 09 00 00 00       	mov    $0x9,%eax
    13f5:	cd 40                	int    $0x40
    13f7:	c3                   	ret    

000013f8 <dup>:
SYSCALL(dup)
    13f8:	b8 0a 00 00 00       	mov    $0xa,%eax
    13fd:	cd 40                	int    $0x40
    13ff:	c3                   	ret    

00001400 <getpid>:
SYSCALL(getpid)
    1400:	b8 0b 00 00 00       	mov    $0xb,%eax
    1405:	cd 40                	int    $0x40
    1407:	c3                   	ret    

00001408 <sbrk>:
SYSCALL(sbrk)
    1408:	b8 0c 00 00 00       	mov    $0xc,%eax
    140d:	cd 40                	int    $0x40
    140f:	c3                   	ret    

00001410 <sleep>:
SYSCALL(sleep)
    1410:	b8 0d 00 00 00       	mov    $0xd,%eax
    1415:	cd 40                	int    $0x40
    1417:	c3                   	ret    

00001418 <uptime>:
SYSCALL(uptime)
    1418:	b8 0e 00 00 00       	mov    $0xe,%eax
    141d:	cd 40                	int    $0x40
    141f:	c3                   	ret    

00001420 <clone>:
SYSCALL(clone)
    1420:	b8 16 00 00 00       	mov    $0x16,%eax
    1425:	cd 40                	int    $0x40
    1427:	c3                   	ret    

00001428 <texit>:
SYSCALL(texit)
    1428:	b8 17 00 00 00       	mov    $0x17,%eax
    142d:	cd 40                	int    $0x40
    142f:	c3                   	ret    

00001430 <tsleep>:
SYSCALL(tsleep)
    1430:	b8 18 00 00 00       	mov    $0x18,%eax
    1435:	cd 40                	int    $0x40
    1437:	c3                   	ret    

00001438 <twakeup>:
SYSCALL(twakeup)
    1438:	b8 19 00 00 00       	mov    $0x19,%eax
    143d:	cd 40                	int    $0x40
    143f:	c3                   	ret    
