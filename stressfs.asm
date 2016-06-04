
_stressfs:     file format elf32-i386


Disassembly of section .text:

00001000 <main>:
#include "fs.h"
#include "fcntl.h"

int
main(int argc, char *argv[])
{
    1000:	55                   	push   %ebp
    1001:	89 e5                	mov    %esp,%ebp
    1003:	83 e4 f0             	and    $0xfffffff0,%esp
    1006:	81 ec 30 02 00 00    	sub    $0x230,%esp
  int fd, i;
  char path[] = "stressfs0";
    100c:	c7 84 24 1e 02 00 00 	movl   $0x65727473,0x21e(%esp)
    1013:	73 74 72 65 
    1017:	c7 84 24 22 02 00 00 	movl   $0x73667373,0x222(%esp)
    101e:	73 73 66 73 
    1022:	66 c7 84 24 26 02 00 	movw   $0x30,0x226(%esp)
    1029:	00 30 00 
  char data[512];

  printf(1, "stressfs starting\n");
    102c:	c7 44 24 04 b5 1d 00 	movl   $0x1db5,0x4(%esp)
    1033:	00 
    1034:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    103b:	e8 7c 05 00 00       	call   15bc <printf>
  memset(data, 'a', sizeof(data));
    1040:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
    1047:	00 
    1048:	c7 44 24 04 61 00 00 	movl   $0x61,0x4(%esp)
    104f:	00 
    1050:	8d 44 24 1e          	lea    0x1e(%esp),%eax
    1054:	89 04 24             	mov    %eax,(%esp)
    1057:	e8 13 02 00 00       	call   126f <memset>

  for(i = 0; i < 4; i++)
    105c:	c7 84 24 2c 02 00 00 	movl   $0x0,0x22c(%esp)
    1063:	00 00 00 00 
    1067:	eb 13                	jmp    107c <main+0x7c>
    if(fork() > 0)
    1069:	e8 a6 03 00 00       	call   1414 <fork>
    106e:	85 c0                	test   %eax,%eax
    1070:	7e 02                	jle    1074 <main+0x74>
      break;
    1072:	eb 12                	jmp    1086 <main+0x86>
  char data[512];

  printf(1, "stressfs starting\n");
  memset(data, 'a', sizeof(data));

  for(i = 0; i < 4; i++)
    1074:	83 84 24 2c 02 00 00 	addl   $0x1,0x22c(%esp)
    107b:	01 
    107c:	83 bc 24 2c 02 00 00 	cmpl   $0x3,0x22c(%esp)
    1083:	03 
    1084:	7e e3                	jle    1069 <main+0x69>
    if(fork() > 0)
      break;

  printf(1, "write %d\n", i);
    1086:	8b 84 24 2c 02 00 00 	mov    0x22c(%esp),%eax
    108d:	89 44 24 08          	mov    %eax,0x8(%esp)
    1091:	c7 44 24 04 c8 1d 00 	movl   $0x1dc8,0x4(%esp)
    1098:	00 
    1099:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    10a0:	e8 17 05 00 00       	call   15bc <printf>

  path[8] += i;
    10a5:	0f b6 84 24 26 02 00 	movzbl 0x226(%esp),%eax
    10ac:	00 
    10ad:	89 c2                	mov    %eax,%edx
    10af:	8b 84 24 2c 02 00 00 	mov    0x22c(%esp),%eax
    10b6:	01 d0                	add    %edx,%eax
    10b8:	88 84 24 26 02 00 00 	mov    %al,0x226(%esp)
  fd = open(path, O_CREATE | O_RDWR);
    10bf:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
    10c6:	00 
    10c7:	8d 84 24 1e 02 00 00 	lea    0x21e(%esp),%eax
    10ce:	89 04 24             	mov    %eax,(%esp)
    10d1:	e8 86 03 00 00       	call   145c <open>
    10d6:	89 84 24 28 02 00 00 	mov    %eax,0x228(%esp)
  for(i = 0; i < 20; i++)
    10dd:	c7 84 24 2c 02 00 00 	movl   $0x0,0x22c(%esp)
    10e4:	00 00 00 00 
    10e8:	eb 27                	jmp    1111 <main+0x111>
//    printf(fd, "%d\n", i);
    write(fd, data, sizeof(data));
    10ea:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
    10f1:	00 
    10f2:	8d 44 24 1e          	lea    0x1e(%esp),%eax
    10f6:	89 44 24 04          	mov    %eax,0x4(%esp)
    10fa:	8b 84 24 28 02 00 00 	mov    0x228(%esp),%eax
    1101:	89 04 24             	mov    %eax,(%esp)
    1104:	e8 33 03 00 00       	call   143c <write>

  printf(1, "write %d\n", i);

  path[8] += i;
  fd = open(path, O_CREATE | O_RDWR);
  for(i = 0; i < 20; i++)
    1109:	83 84 24 2c 02 00 00 	addl   $0x1,0x22c(%esp)
    1110:	01 
    1111:	83 bc 24 2c 02 00 00 	cmpl   $0x13,0x22c(%esp)
    1118:	13 
    1119:	7e cf                	jle    10ea <main+0xea>
//    printf(fd, "%d\n", i);
    write(fd, data, sizeof(data));
  close(fd);
    111b:	8b 84 24 28 02 00 00 	mov    0x228(%esp),%eax
    1122:	89 04 24             	mov    %eax,(%esp)
    1125:	e8 1a 03 00 00       	call   1444 <close>

  printf(1, "read\n");
    112a:	c7 44 24 04 d2 1d 00 	movl   $0x1dd2,0x4(%esp)
    1131:	00 
    1132:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1139:	e8 7e 04 00 00       	call   15bc <printf>

  fd = open(path, O_RDONLY);
    113e:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1145:	00 
    1146:	8d 84 24 1e 02 00 00 	lea    0x21e(%esp),%eax
    114d:	89 04 24             	mov    %eax,(%esp)
    1150:	e8 07 03 00 00       	call   145c <open>
    1155:	89 84 24 28 02 00 00 	mov    %eax,0x228(%esp)
  for (i = 0; i < 20; i++)
    115c:	c7 84 24 2c 02 00 00 	movl   $0x0,0x22c(%esp)
    1163:	00 00 00 00 
    1167:	eb 27                	jmp    1190 <main+0x190>
    read(fd, data, sizeof(data));
    1169:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
    1170:	00 
    1171:	8d 44 24 1e          	lea    0x1e(%esp),%eax
    1175:	89 44 24 04          	mov    %eax,0x4(%esp)
    1179:	8b 84 24 28 02 00 00 	mov    0x228(%esp),%eax
    1180:	89 04 24             	mov    %eax,(%esp)
    1183:	e8 ac 02 00 00       	call   1434 <read>
  close(fd);

  printf(1, "read\n");

  fd = open(path, O_RDONLY);
  for (i = 0; i < 20; i++)
    1188:	83 84 24 2c 02 00 00 	addl   $0x1,0x22c(%esp)
    118f:	01 
    1190:	83 bc 24 2c 02 00 00 	cmpl   $0x13,0x22c(%esp)
    1197:	13 
    1198:	7e cf                	jle    1169 <main+0x169>
    read(fd, data, sizeof(data));
  close(fd);
    119a:	8b 84 24 28 02 00 00 	mov    0x228(%esp),%eax
    11a1:	89 04 24             	mov    %eax,(%esp)
    11a4:	e8 9b 02 00 00       	call   1444 <close>

  wait();
    11a9:	e8 76 02 00 00       	call   1424 <wait>
  
  exit();
    11ae:	e8 69 02 00 00       	call   141c <exit>
    11b3:	90                   	nop

000011b4 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
    11b4:	55                   	push   %ebp
    11b5:	89 e5                	mov    %esp,%ebp
    11b7:	57                   	push   %edi
    11b8:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
    11b9:	8b 4d 08             	mov    0x8(%ebp),%ecx
    11bc:	8b 55 10             	mov    0x10(%ebp),%edx
    11bf:	8b 45 0c             	mov    0xc(%ebp),%eax
    11c2:	89 cb                	mov    %ecx,%ebx
    11c4:	89 df                	mov    %ebx,%edi
    11c6:	89 d1                	mov    %edx,%ecx
    11c8:	fc                   	cld    
    11c9:	f3 aa                	rep stos %al,%es:(%edi)
    11cb:	89 ca                	mov    %ecx,%edx
    11cd:	89 fb                	mov    %edi,%ebx
    11cf:	89 5d 08             	mov    %ebx,0x8(%ebp)
    11d2:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
    11d5:	5b                   	pop    %ebx
    11d6:	5f                   	pop    %edi
    11d7:	5d                   	pop    %ebp
    11d8:	c3                   	ret    

000011d9 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
    11d9:	55                   	push   %ebp
    11da:	89 e5                	mov    %esp,%ebp
    11dc:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
    11df:	8b 45 08             	mov    0x8(%ebp),%eax
    11e2:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
    11e5:	90                   	nop
    11e6:	8b 45 08             	mov    0x8(%ebp),%eax
    11e9:	8d 50 01             	lea    0x1(%eax),%edx
    11ec:	89 55 08             	mov    %edx,0x8(%ebp)
    11ef:	8b 55 0c             	mov    0xc(%ebp),%edx
    11f2:	8d 4a 01             	lea    0x1(%edx),%ecx
    11f5:	89 4d 0c             	mov    %ecx,0xc(%ebp)
    11f8:	0f b6 12             	movzbl (%edx),%edx
    11fb:	88 10                	mov    %dl,(%eax)
    11fd:	0f b6 00             	movzbl (%eax),%eax
    1200:	84 c0                	test   %al,%al
    1202:	75 e2                	jne    11e6 <strcpy+0xd>
    ;
  return os;
    1204:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    1207:	c9                   	leave  
    1208:	c3                   	ret    

00001209 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    1209:	55                   	push   %ebp
    120a:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
    120c:	eb 08                	jmp    1216 <strcmp+0xd>
    p++, q++;
    120e:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    1212:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    1216:	8b 45 08             	mov    0x8(%ebp),%eax
    1219:	0f b6 00             	movzbl (%eax),%eax
    121c:	84 c0                	test   %al,%al
    121e:	74 10                	je     1230 <strcmp+0x27>
    1220:	8b 45 08             	mov    0x8(%ebp),%eax
    1223:	0f b6 10             	movzbl (%eax),%edx
    1226:	8b 45 0c             	mov    0xc(%ebp),%eax
    1229:	0f b6 00             	movzbl (%eax),%eax
    122c:	38 c2                	cmp    %al,%dl
    122e:	74 de                	je     120e <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
    1230:	8b 45 08             	mov    0x8(%ebp),%eax
    1233:	0f b6 00             	movzbl (%eax),%eax
    1236:	0f b6 d0             	movzbl %al,%edx
    1239:	8b 45 0c             	mov    0xc(%ebp),%eax
    123c:	0f b6 00             	movzbl (%eax),%eax
    123f:	0f b6 c0             	movzbl %al,%eax
    1242:	29 c2                	sub    %eax,%edx
    1244:	89 d0                	mov    %edx,%eax
}
    1246:	5d                   	pop    %ebp
    1247:	c3                   	ret    

00001248 <strlen>:

uint
strlen(char *s)
{
    1248:	55                   	push   %ebp
    1249:	89 e5                	mov    %esp,%ebp
    124b:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
    124e:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    1255:	eb 04                	jmp    125b <strlen+0x13>
    1257:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    125b:	8b 55 fc             	mov    -0x4(%ebp),%edx
    125e:	8b 45 08             	mov    0x8(%ebp),%eax
    1261:	01 d0                	add    %edx,%eax
    1263:	0f b6 00             	movzbl (%eax),%eax
    1266:	84 c0                	test   %al,%al
    1268:	75 ed                	jne    1257 <strlen+0xf>
    ;
  return n;
    126a:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    126d:	c9                   	leave  
    126e:	c3                   	ret    

0000126f <memset>:

void*
memset(void *dst, int c, uint n)
{
    126f:	55                   	push   %ebp
    1270:	89 e5                	mov    %esp,%ebp
    1272:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
    1275:	8b 45 10             	mov    0x10(%ebp),%eax
    1278:	89 44 24 08          	mov    %eax,0x8(%esp)
    127c:	8b 45 0c             	mov    0xc(%ebp),%eax
    127f:	89 44 24 04          	mov    %eax,0x4(%esp)
    1283:	8b 45 08             	mov    0x8(%ebp),%eax
    1286:	89 04 24             	mov    %eax,(%esp)
    1289:	e8 26 ff ff ff       	call   11b4 <stosb>
  return dst;
    128e:	8b 45 08             	mov    0x8(%ebp),%eax
}
    1291:	c9                   	leave  
    1292:	c3                   	ret    

00001293 <strchr>:

char*
strchr(const char *s, char c)
{
    1293:	55                   	push   %ebp
    1294:	89 e5                	mov    %esp,%ebp
    1296:	83 ec 04             	sub    $0x4,%esp
    1299:	8b 45 0c             	mov    0xc(%ebp),%eax
    129c:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
    129f:	eb 14                	jmp    12b5 <strchr+0x22>
    if(*s == c)
    12a1:	8b 45 08             	mov    0x8(%ebp),%eax
    12a4:	0f b6 00             	movzbl (%eax),%eax
    12a7:	3a 45 fc             	cmp    -0x4(%ebp),%al
    12aa:	75 05                	jne    12b1 <strchr+0x1e>
      return (char*)s;
    12ac:	8b 45 08             	mov    0x8(%ebp),%eax
    12af:	eb 13                	jmp    12c4 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
    12b1:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    12b5:	8b 45 08             	mov    0x8(%ebp),%eax
    12b8:	0f b6 00             	movzbl (%eax),%eax
    12bb:	84 c0                	test   %al,%al
    12bd:	75 e2                	jne    12a1 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
    12bf:	b8 00 00 00 00       	mov    $0x0,%eax
}
    12c4:	c9                   	leave  
    12c5:	c3                   	ret    

000012c6 <gets>:

char*
gets(char *buf, int max)
{
    12c6:	55                   	push   %ebp
    12c7:	89 e5                	mov    %esp,%ebp
    12c9:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    12cc:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    12d3:	eb 4c                	jmp    1321 <gets+0x5b>
    cc = read(0, &c, 1);
    12d5:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    12dc:	00 
    12dd:	8d 45 ef             	lea    -0x11(%ebp),%eax
    12e0:	89 44 24 04          	mov    %eax,0x4(%esp)
    12e4:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    12eb:	e8 44 01 00 00       	call   1434 <read>
    12f0:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
    12f3:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    12f7:	7f 02                	jg     12fb <gets+0x35>
      break;
    12f9:	eb 31                	jmp    132c <gets+0x66>
    buf[i++] = c;
    12fb:	8b 45 f4             	mov    -0xc(%ebp),%eax
    12fe:	8d 50 01             	lea    0x1(%eax),%edx
    1301:	89 55 f4             	mov    %edx,-0xc(%ebp)
    1304:	89 c2                	mov    %eax,%edx
    1306:	8b 45 08             	mov    0x8(%ebp),%eax
    1309:	01 c2                	add    %eax,%edx
    130b:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    130f:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
    1311:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    1315:	3c 0a                	cmp    $0xa,%al
    1317:	74 13                	je     132c <gets+0x66>
    1319:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    131d:	3c 0d                	cmp    $0xd,%al
    131f:	74 0b                	je     132c <gets+0x66>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1321:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1324:	83 c0 01             	add    $0x1,%eax
    1327:	3b 45 0c             	cmp    0xc(%ebp),%eax
    132a:	7c a9                	jl     12d5 <gets+0xf>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    132c:	8b 55 f4             	mov    -0xc(%ebp),%edx
    132f:	8b 45 08             	mov    0x8(%ebp),%eax
    1332:	01 d0                	add    %edx,%eax
    1334:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
    1337:	8b 45 08             	mov    0x8(%ebp),%eax
}
    133a:	c9                   	leave  
    133b:	c3                   	ret    

0000133c <stat>:

int
stat(char *n, struct stat *st)
{
    133c:	55                   	push   %ebp
    133d:	89 e5                	mov    %esp,%ebp
    133f:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    1342:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1349:	00 
    134a:	8b 45 08             	mov    0x8(%ebp),%eax
    134d:	89 04 24             	mov    %eax,(%esp)
    1350:	e8 07 01 00 00       	call   145c <open>
    1355:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
    1358:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    135c:	79 07                	jns    1365 <stat+0x29>
    return -1;
    135e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    1363:	eb 23                	jmp    1388 <stat+0x4c>
  r = fstat(fd, st);
    1365:	8b 45 0c             	mov    0xc(%ebp),%eax
    1368:	89 44 24 04          	mov    %eax,0x4(%esp)
    136c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    136f:	89 04 24             	mov    %eax,(%esp)
    1372:	e8 fd 00 00 00       	call   1474 <fstat>
    1377:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
    137a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    137d:	89 04 24             	mov    %eax,(%esp)
    1380:	e8 bf 00 00 00       	call   1444 <close>
  return r;
    1385:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
    1388:	c9                   	leave  
    1389:	c3                   	ret    

0000138a <atoi>:

int
atoi(const char *s)
{
    138a:	55                   	push   %ebp
    138b:	89 e5                	mov    %esp,%ebp
    138d:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
    1390:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
    1397:	eb 25                	jmp    13be <atoi+0x34>
    n = n*10 + *s++ - '0';
    1399:	8b 55 fc             	mov    -0x4(%ebp),%edx
    139c:	89 d0                	mov    %edx,%eax
    139e:	c1 e0 02             	shl    $0x2,%eax
    13a1:	01 d0                	add    %edx,%eax
    13a3:	01 c0                	add    %eax,%eax
    13a5:	89 c1                	mov    %eax,%ecx
    13a7:	8b 45 08             	mov    0x8(%ebp),%eax
    13aa:	8d 50 01             	lea    0x1(%eax),%edx
    13ad:	89 55 08             	mov    %edx,0x8(%ebp)
    13b0:	0f b6 00             	movzbl (%eax),%eax
    13b3:	0f be c0             	movsbl %al,%eax
    13b6:	01 c8                	add    %ecx,%eax
    13b8:	83 e8 30             	sub    $0x30,%eax
    13bb:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    13be:	8b 45 08             	mov    0x8(%ebp),%eax
    13c1:	0f b6 00             	movzbl (%eax),%eax
    13c4:	3c 2f                	cmp    $0x2f,%al
    13c6:	7e 0a                	jle    13d2 <atoi+0x48>
    13c8:	8b 45 08             	mov    0x8(%ebp),%eax
    13cb:	0f b6 00             	movzbl (%eax),%eax
    13ce:	3c 39                	cmp    $0x39,%al
    13d0:	7e c7                	jle    1399 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
    13d2:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    13d5:	c9                   	leave  
    13d6:	c3                   	ret    

000013d7 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    13d7:	55                   	push   %ebp
    13d8:	89 e5                	mov    %esp,%ebp
    13da:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
    13dd:	8b 45 08             	mov    0x8(%ebp),%eax
    13e0:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
    13e3:	8b 45 0c             	mov    0xc(%ebp),%eax
    13e6:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
    13e9:	eb 17                	jmp    1402 <memmove+0x2b>
    *dst++ = *src++;
    13eb:	8b 45 fc             	mov    -0x4(%ebp),%eax
    13ee:	8d 50 01             	lea    0x1(%eax),%edx
    13f1:	89 55 fc             	mov    %edx,-0x4(%ebp)
    13f4:	8b 55 f8             	mov    -0x8(%ebp),%edx
    13f7:	8d 4a 01             	lea    0x1(%edx),%ecx
    13fa:	89 4d f8             	mov    %ecx,-0x8(%ebp)
    13fd:	0f b6 12             	movzbl (%edx),%edx
    1400:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    1402:	8b 45 10             	mov    0x10(%ebp),%eax
    1405:	8d 50 ff             	lea    -0x1(%eax),%edx
    1408:	89 55 10             	mov    %edx,0x10(%ebp)
    140b:	85 c0                	test   %eax,%eax
    140d:	7f dc                	jg     13eb <memmove+0x14>
    *dst++ = *src++;
  return vdst;
    140f:	8b 45 08             	mov    0x8(%ebp),%eax
}
    1412:	c9                   	leave  
    1413:	c3                   	ret    

00001414 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    1414:	b8 01 00 00 00       	mov    $0x1,%eax
    1419:	cd 40                	int    $0x40
    141b:	c3                   	ret    

0000141c <exit>:
SYSCALL(exit)
    141c:	b8 02 00 00 00       	mov    $0x2,%eax
    1421:	cd 40                	int    $0x40
    1423:	c3                   	ret    

00001424 <wait>:
SYSCALL(wait)
    1424:	b8 03 00 00 00       	mov    $0x3,%eax
    1429:	cd 40                	int    $0x40
    142b:	c3                   	ret    

0000142c <pipe>:
SYSCALL(pipe)
    142c:	b8 04 00 00 00       	mov    $0x4,%eax
    1431:	cd 40                	int    $0x40
    1433:	c3                   	ret    

00001434 <read>:
SYSCALL(read)
    1434:	b8 05 00 00 00       	mov    $0x5,%eax
    1439:	cd 40                	int    $0x40
    143b:	c3                   	ret    

0000143c <write>:
SYSCALL(write)
    143c:	b8 10 00 00 00       	mov    $0x10,%eax
    1441:	cd 40                	int    $0x40
    1443:	c3                   	ret    

00001444 <close>:
SYSCALL(close)
    1444:	b8 15 00 00 00       	mov    $0x15,%eax
    1449:	cd 40                	int    $0x40
    144b:	c3                   	ret    

0000144c <kill>:
SYSCALL(kill)
    144c:	b8 06 00 00 00       	mov    $0x6,%eax
    1451:	cd 40                	int    $0x40
    1453:	c3                   	ret    

00001454 <exec>:
SYSCALL(exec)
    1454:	b8 07 00 00 00       	mov    $0x7,%eax
    1459:	cd 40                	int    $0x40
    145b:	c3                   	ret    

0000145c <open>:
SYSCALL(open)
    145c:	b8 0f 00 00 00       	mov    $0xf,%eax
    1461:	cd 40                	int    $0x40
    1463:	c3                   	ret    

00001464 <mknod>:
SYSCALL(mknod)
    1464:	b8 11 00 00 00       	mov    $0x11,%eax
    1469:	cd 40                	int    $0x40
    146b:	c3                   	ret    

0000146c <unlink>:
SYSCALL(unlink)
    146c:	b8 12 00 00 00       	mov    $0x12,%eax
    1471:	cd 40                	int    $0x40
    1473:	c3                   	ret    

00001474 <fstat>:
SYSCALL(fstat)
    1474:	b8 08 00 00 00       	mov    $0x8,%eax
    1479:	cd 40                	int    $0x40
    147b:	c3                   	ret    

0000147c <link>:
SYSCALL(link)
    147c:	b8 13 00 00 00       	mov    $0x13,%eax
    1481:	cd 40                	int    $0x40
    1483:	c3                   	ret    

00001484 <mkdir>:
SYSCALL(mkdir)
    1484:	b8 14 00 00 00       	mov    $0x14,%eax
    1489:	cd 40                	int    $0x40
    148b:	c3                   	ret    

0000148c <chdir>:
SYSCALL(chdir)
    148c:	b8 09 00 00 00       	mov    $0x9,%eax
    1491:	cd 40                	int    $0x40
    1493:	c3                   	ret    

00001494 <dup>:
SYSCALL(dup)
    1494:	b8 0a 00 00 00       	mov    $0xa,%eax
    1499:	cd 40                	int    $0x40
    149b:	c3                   	ret    

0000149c <getpid>:
SYSCALL(getpid)
    149c:	b8 0b 00 00 00       	mov    $0xb,%eax
    14a1:	cd 40                	int    $0x40
    14a3:	c3                   	ret    

000014a4 <sbrk>:
SYSCALL(sbrk)
    14a4:	b8 0c 00 00 00       	mov    $0xc,%eax
    14a9:	cd 40                	int    $0x40
    14ab:	c3                   	ret    

000014ac <sleep>:
SYSCALL(sleep)
    14ac:	b8 0d 00 00 00       	mov    $0xd,%eax
    14b1:	cd 40                	int    $0x40
    14b3:	c3                   	ret    

000014b4 <uptime>:
SYSCALL(uptime)
    14b4:	b8 0e 00 00 00       	mov    $0xe,%eax
    14b9:	cd 40                	int    $0x40
    14bb:	c3                   	ret    

000014bc <clone>:
SYSCALL(clone)
    14bc:	b8 16 00 00 00       	mov    $0x16,%eax
    14c1:	cd 40                	int    $0x40
    14c3:	c3                   	ret    

000014c4 <texit>:
SYSCALL(texit)
    14c4:	b8 17 00 00 00       	mov    $0x17,%eax
    14c9:	cd 40                	int    $0x40
    14cb:	c3                   	ret    

000014cc <tsleep>:
SYSCALL(tsleep)
    14cc:	b8 18 00 00 00       	mov    $0x18,%eax
    14d1:	cd 40                	int    $0x40
    14d3:	c3                   	ret    

000014d4 <twakeup>:
SYSCALL(twakeup)
    14d4:	b8 19 00 00 00       	mov    $0x19,%eax
    14d9:	cd 40                	int    $0x40
    14db:	c3                   	ret    

000014dc <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
    14dc:	55                   	push   %ebp
    14dd:	89 e5                	mov    %esp,%ebp
    14df:	83 ec 18             	sub    $0x18,%esp
    14e2:	8b 45 0c             	mov    0xc(%ebp),%eax
    14e5:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
    14e8:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    14ef:	00 
    14f0:	8d 45 f4             	lea    -0xc(%ebp),%eax
    14f3:	89 44 24 04          	mov    %eax,0x4(%esp)
    14f7:	8b 45 08             	mov    0x8(%ebp),%eax
    14fa:	89 04 24             	mov    %eax,(%esp)
    14fd:	e8 3a ff ff ff       	call   143c <write>
}
    1502:	c9                   	leave  
    1503:	c3                   	ret    

00001504 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
    1504:	55                   	push   %ebp
    1505:	89 e5                	mov    %esp,%ebp
    1507:	56                   	push   %esi
    1508:	53                   	push   %ebx
    1509:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    150c:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
    1513:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
    1517:	74 17                	je     1530 <printint+0x2c>
    1519:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    151d:	79 11                	jns    1530 <printint+0x2c>
    neg = 1;
    151f:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
    1526:	8b 45 0c             	mov    0xc(%ebp),%eax
    1529:	f7 d8                	neg    %eax
    152b:	89 45 ec             	mov    %eax,-0x14(%ebp)
    152e:	eb 06                	jmp    1536 <printint+0x32>
  } else {
    x = xx;
    1530:	8b 45 0c             	mov    0xc(%ebp),%eax
    1533:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
    1536:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
    153d:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    1540:	8d 41 01             	lea    0x1(%ecx),%eax
    1543:	89 45 f4             	mov    %eax,-0xc(%ebp)
    1546:	8b 5d 10             	mov    0x10(%ebp),%ebx
    1549:	8b 45 ec             	mov    -0x14(%ebp),%eax
    154c:	ba 00 00 00 00       	mov    $0x0,%edx
    1551:	f7 f3                	div    %ebx
    1553:	89 d0                	mov    %edx,%eax
    1555:	0f b6 80 30 22 00 00 	movzbl 0x2230(%eax),%eax
    155c:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
    1560:	8b 75 10             	mov    0x10(%ebp),%esi
    1563:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1566:	ba 00 00 00 00       	mov    $0x0,%edx
    156b:	f7 f6                	div    %esi
    156d:	89 45 ec             	mov    %eax,-0x14(%ebp)
    1570:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1574:	75 c7                	jne    153d <printint+0x39>
  if(neg)
    1576:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    157a:	74 10                	je     158c <printint+0x88>
    buf[i++] = '-';
    157c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    157f:	8d 50 01             	lea    0x1(%eax),%edx
    1582:	89 55 f4             	mov    %edx,-0xc(%ebp)
    1585:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
    158a:	eb 1f                	jmp    15ab <printint+0xa7>
    158c:	eb 1d                	jmp    15ab <printint+0xa7>
    putc(fd, buf[i]);
    158e:	8d 55 dc             	lea    -0x24(%ebp),%edx
    1591:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1594:	01 d0                	add    %edx,%eax
    1596:	0f b6 00             	movzbl (%eax),%eax
    1599:	0f be c0             	movsbl %al,%eax
    159c:	89 44 24 04          	mov    %eax,0x4(%esp)
    15a0:	8b 45 08             	mov    0x8(%ebp),%eax
    15a3:	89 04 24             	mov    %eax,(%esp)
    15a6:	e8 31 ff ff ff       	call   14dc <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    15ab:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    15af:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    15b3:	79 d9                	jns    158e <printint+0x8a>
    putc(fd, buf[i]);
}
    15b5:	83 c4 30             	add    $0x30,%esp
    15b8:	5b                   	pop    %ebx
    15b9:	5e                   	pop    %esi
    15ba:	5d                   	pop    %ebp
    15bb:	c3                   	ret    

000015bc <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    15bc:	55                   	push   %ebp
    15bd:	89 e5                	mov    %esp,%ebp
    15bf:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
    15c2:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
    15c9:	8d 45 0c             	lea    0xc(%ebp),%eax
    15cc:	83 c0 04             	add    $0x4,%eax
    15cf:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
    15d2:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    15d9:	e9 7c 01 00 00       	jmp    175a <printf+0x19e>
    c = fmt[i] & 0xff;
    15de:	8b 55 0c             	mov    0xc(%ebp),%edx
    15e1:	8b 45 f0             	mov    -0x10(%ebp),%eax
    15e4:	01 d0                	add    %edx,%eax
    15e6:	0f b6 00             	movzbl (%eax),%eax
    15e9:	0f be c0             	movsbl %al,%eax
    15ec:	25 ff 00 00 00       	and    $0xff,%eax
    15f1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
    15f4:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    15f8:	75 2c                	jne    1626 <printf+0x6a>
      if(c == '%'){
    15fa:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    15fe:	75 0c                	jne    160c <printf+0x50>
        state = '%';
    1600:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
    1607:	e9 4a 01 00 00       	jmp    1756 <printf+0x19a>
      } else {
        putc(fd, c);
    160c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    160f:	0f be c0             	movsbl %al,%eax
    1612:	89 44 24 04          	mov    %eax,0x4(%esp)
    1616:	8b 45 08             	mov    0x8(%ebp),%eax
    1619:	89 04 24             	mov    %eax,(%esp)
    161c:	e8 bb fe ff ff       	call   14dc <putc>
    1621:	e9 30 01 00 00       	jmp    1756 <printf+0x19a>
      }
    } else if(state == '%'){
    1626:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
    162a:	0f 85 26 01 00 00    	jne    1756 <printf+0x19a>
      if(c == 'd'){
    1630:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
    1634:	75 2d                	jne    1663 <printf+0xa7>
        printint(fd, *ap, 10, 1);
    1636:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1639:	8b 00                	mov    (%eax),%eax
    163b:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    1642:	00 
    1643:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
    164a:	00 
    164b:	89 44 24 04          	mov    %eax,0x4(%esp)
    164f:	8b 45 08             	mov    0x8(%ebp),%eax
    1652:	89 04 24             	mov    %eax,(%esp)
    1655:	e8 aa fe ff ff       	call   1504 <printint>
        ap++;
    165a:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    165e:	e9 ec 00 00 00       	jmp    174f <printf+0x193>
      } else if(c == 'x' || c == 'p'){
    1663:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
    1667:	74 06                	je     166f <printf+0xb3>
    1669:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
    166d:	75 2d                	jne    169c <printf+0xe0>
        printint(fd, *ap, 16, 0);
    166f:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1672:	8b 00                	mov    (%eax),%eax
    1674:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    167b:	00 
    167c:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
    1683:	00 
    1684:	89 44 24 04          	mov    %eax,0x4(%esp)
    1688:	8b 45 08             	mov    0x8(%ebp),%eax
    168b:	89 04 24             	mov    %eax,(%esp)
    168e:	e8 71 fe ff ff       	call   1504 <printint>
        ap++;
    1693:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    1697:	e9 b3 00 00 00       	jmp    174f <printf+0x193>
      } else if(c == 's'){
    169c:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
    16a0:	75 45                	jne    16e7 <printf+0x12b>
        s = (char*)*ap;
    16a2:	8b 45 e8             	mov    -0x18(%ebp),%eax
    16a5:	8b 00                	mov    (%eax),%eax
    16a7:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
    16aa:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
    16ae:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    16b2:	75 09                	jne    16bd <printf+0x101>
          s = "(null)";
    16b4:	c7 45 f4 d8 1d 00 00 	movl   $0x1dd8,-0xc(%ebp)
        while(*s != 0){
    16bb:	eb 1e                	jmp    16db <printf+0x11f>
    16bd:	eb 1c                	jmp    16db <printf+0x11f>
          putc(fd, *s);
    16bf:	8b 45 f4             	mov    -0xc(%ebp),%eax
    16c2:	0f b6 00             	movzbl (%eax),%eax
    16c5:	0f be c0             	movsbl %al,%eax
    16c8:	89 44 24 04          	mov    %eax,0x4(%esp)
    16cc:	8b 45 08             	mov    0x8(%ebp),%eax
    16cf:	89 04 24             	mov    %eax,(%esp)
    16d2:	e8 05 fe ff ff       	call   14dc <putc>
          s++;
    16d7:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    16db:	8b 45 f4             	mov    -0xc(%ebp),%eax
    16de:	0f b6 00             	movzbl (%eax),%eax
    16e1:	84 c0                	test   %al,%al
    16e3:	75 da                	jne    16bf <printf+0x103>
    16e5:	eb 68                	jmp    174f <printf+0x193>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    16e7:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
    16eb:	75 1d                	jne    170a <printf+0x14e>
        putc(fd, *ap);
    16ed:	8b 45 e8             	mov    -0x18(%ebp),%eax
    16f0:	8b 00                	mov    (%eax),%eax
    16f2:	0f be c0             	movsbl %al,%eax
    16f5:	89 44 24 04          	mov    %eax,0x4(%esp)
    16f9:	8b 45 08             	mov    0x8(%ebp),%eax
    16fc:	89 04 24             	mov    %eax,(%esp)
    16ff:	e8 d8 fd ff ff       	call   14dc <putc>
        ap++;
    1704:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    1708:	eb 45                	jmp    174f <printf+0x193>
      } else if(c == '%'){
    170a:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    170e:	75 17                	jne    1727 <printf+0x16b>
        putc(fd, c);
    1710:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1713:	0f be c0             	movsbl %al,%eax
    1716:	89 44 24 04          	mov    %eax,0x4(%esp)
    171a:	8b 45 08             	mov    0x8(%ebp),%eax
    171d:	89 04 24             	mov    %eax,(%esp)
    1720:	e8 b7 fd ff ff       	call   14dc <putc>
    1725:	eb 28                	jmp    174f <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
    1727:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
    172e:	00 
    172f:	8b 45 08             	mov    0x8(%ebp),%eax
    1732:	89 04 24             	mov    %eax,(%esp)
    1735:	e8 a2 fd ff ff       	call   14dc <putc>
        putc(fd, c);
    173a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    173d:	0f be c0             	movsbl %al,%eax
    1740:	89 44 24 04          	mov    %eax,0x4(%esp)
    1744:	8b 45 08             	mov    0x8(%ebp),%eax
    1747:	89 04 24             	mov    %eax,(%esp)
    174a:	e8 8d fd ff ff       	call   14dc <putc>
      }
      state = 0;
    174f:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1756:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    175a:	8b 55 0c             	mov    0xc(%ebp),%edx
    175d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1760:	01 d0                	add    %edx,%eax
    1762:	0f b6 00             	movzbl (%eax),%eax
    1765:	84 c0                	test   %al,%al
    1767:	0f 85 71 fe ff ff    	jne    15de <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    176d:	c9                   	leave  
    176e:	c3                   	ret    
    176f:	90                   	nop

00001770 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    1770:	55                   	push   %ebp
    1771:	89 e5                	mov    %esp,%ebp
    1773:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
    1776:	8b 45 08             	mov    0x8(%ebp),%eax
    1779:	83 e8 08             	sub    $0x8,%eax
    177c:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    177f:	a1 50 22 00 00       	mov    0x2250,%eax
    1784:	89 45 fc             	mov    %eax,-0x4(%ebp)
    1787:	eb 24                	jmp    17ad <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1789:	8b 45 fc             	mov    -0x4(%ebp),%eax
    178c:	8b 00                	mov    (%eax),%eax
    178e:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    1791:	77 12                	ja     17a5 <free+0x35>
    1793:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1796:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    1799:	77 24                	ja     17bf <free+0x4f>
    179b:	8b 45 fc             	mov    -0x4(%ebp),%eax
    179e:	8b 00                	mov    (%eax),%eax
    17a0:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    17a3:	77 1a                	ja     17bf <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    17a5:	8b 45 fc             	mov    -0x4(%ebp),%eax
    17a8:	8b 00                	mov    (%eax),%eax
    17aa:	89 45 fc             	mov    %eax,-0x4(%ebp)
    17ad:	8b 45 f8             	mov    -0x8(%ebp),%eax
    17b0:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    17b3:	76 d4                	jbe    1789 <free+0x19>
    17b5:	8b 45 fc             	mov    -0x4(%ebp),%eax
    17b8:	8b 00                	mov    (%eax),%eax
    17ba:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    17bd:	76 ca                	jbe    1789 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    17bf:	8b 45 f8             	mov    -0x8(%ebp),%eax
    17c2:	8b 40 04             	mov    0x4(%eax),%eax
    17c5:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    17cc:	8b 45 f8             	mov    -0x8(%ebp),%eax
    17cf:	01 c2                	add    %eax,%edx
    17d1:	8b 45 fc             	mov    -0x4(%ebp),%eax
    17d4:	8b 00                	mov    (%eax),%eax
    17d6:	39 c2                	cmp    %eax,%edx
    17d8:	75 24                	jne    17fe <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
    17da:	8b 45 f8             	mov    -0x8(%ebp),%eax
    17dd:	8b 50 04             	mov    0x4(%eax),%edx
    17e0:	8b 45 fc             	mov    -0x4(%ebp),%eax
    17e3:	8b 00                	mov    (%eax),%eax
    17e5:	8b 40 04             	mov    0x4(%eax),%eax
    17e8:	01 c2                	add    %eax,%edx
    17ea:	8b 45 f8             	mov    -0x8(%ebp),%eax
    17ed:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
    17f0:	8b 45 fc             	mov    -0x4(%ebp),%eax
    17f3:	8b 00                	mov    (%eax),%eax
    17f5:	8b 10                	mov    (%eax),%edx
    17f7:	8b 45 f8             	mov    -0x8(%ebp),%eax
    17fa:	89 10                	mov    %edx,(%eax)
    17fc:	eb 0a                	jmp    1808 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
    17fe:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1801:	8b 10                	mov    (%eax),%edx
    1803:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1806:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
    1808:	8b 45 fc             	mov    -0x4(%ebp),%eax
    180b:	8b 40 04             	mov    0x4(%eax),%eax
    180e:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    1815:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1818:	01 d0                	add    %edx,%eax
    181a:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    181d:	75 20                	jne    183f <free+0xcf>
    p->s.size += bp->s.size;
    181f:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1822:	8b 50 04             	mov    0x4(%eax),%edx
    1825:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1828:	8b 40 04             	mov    0x4(%eax),%eax
    182b:	01 c2                	add    %eax,%edx
    182d:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1830:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    1833:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1836:	8b 10                	mov    (%eax),%edx
    1838:	8b 45 fc             	mov    -0x4(%ebp),%eax
    183b:	89 10                	mov    %edx,(%eax)
    183d:	eb 08                	jmp    1847 <free+0xd7>
  } else
    p->s.ptr = bp;
    183f:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1842:	8b 55 f8             	mov    -0x8(%ebp),%edx
    1845:	89 10                	mov    %edx,(%eax)
  freep = p;
    1847:	8b 45 fc             	mov    -0x4(%ebp),%eax
    184a:	a3 50 22 00 00       	mov    %eax,0x2250
}
    184f:	c9                   	leave  
    1850:	c3                   	ret    

00001851 <morecore>:

static Header*
morecore(uint nu)
{
    1851:	55                   	push   %ebp
    1852:	89 e5                	mov    %esp,%ebp
    1854:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
    1857:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
    185e:	77 07                	ja     1867 <morecore+0x16>
    nu = 4096;
    1860:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
    1867:	8b 45 08             	mov    0x8(%ebp),%eax
    186a:	c1 e0 03             	shl    $0x3,%eax
    186d:	89 04 24             	mov    %eax,(%esp)
    1870:	e8 2f fc ff ff       	call   14a4 <sbrk>
    1875:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
    1878:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
    187c:	75 07                	jne    1885 <morecore+0x34>
    return 0;
    187e:	b8 00 00 00 00       	mov    $0x0,%eax
    1883:	eb 22                	jmp    18a7 <morecore+0x56>
  hp = (Header*)p;
    1885:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1888:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
    188b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    188e:	8b 55 08             	mov    0x8(%ebp),%edx
    1891:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
    1894:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1897:	83 c0 08             	add    $0x8,%eax
    189a:	89 04 24             	mov    %eax,(%esp)
    189d:	e8 ce fe ff ff       	call   1770 <free>
  return freep;
    18a2:	a1 50 22 00 00       	mov    0x2250,%eax
}
    18a7:	c9                   	leave  
    18a8:	c3                   	ret    

000018a9 <malloc>:

void*
malloc(uint nbytes)
{
    18a9:	55                   	push   %ebp
    18aa:	89 e5                	mov    %esp,%ebp
    18ac:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    18af:	8b 45 08             	mov    0x8(%ebp),%eax
    18b2:	83 c0 07             	add    $0x7,%eax
    18b5:	c1 e8 03             	shr    $0x3,%eax
    18b8:	83 c0 01             	add    $0x1,%eax
    18bb:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
    18be:	a1 50 22 00 00       	mov    0x2250,%eax
    18c3:	89 45 f0             	mov    %eax,-0x10(%ebp)
    18c6:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    18ca:	75 23                	jne    18ef <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
    18cc:	c7 45 f0 48 22 00 00 	movl   $0x2248,-0x10(%ebp)
    18d3:	8b 45 f0             	mov    -0x10(%ebp),%eax
    18d6:	a3 50 22 00 00       	mov    %eax,0x2250
    18db:	a1 50 22 00 00       	mov    0x2250,%eax
    18e0:	a3 48 22 00 00       	mov    %eax,0x2248
    base.s.size = 0;
    18e5:	c7 05 4c 22 00 00 00 	movl   $0x0,0x224c
    18ec:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    18ef:	8b 45 f0             	mov    -0x10(%ebp),%eax
    18f2:	8b 00                	mov    (%eax),%eax
    18f4:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
    18f7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    18fa:	8b 40 04             	mov    0x4(%eax),%eax
    18fd:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    1900:	72 4d                	jb     194f <malloc+0xa6>
      if(p->s.size == nunits)
    1902:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1905:	8b 40 04             	mov    0x4(%eax),%eax
    1908:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    190b:	75 0c                	jne    1919 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
    190d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1910:	8b 10                	mov    (%eax),%edx
    1912:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1915:	89 10                	mov    %edx,(%eax)
    1917:	eb 26                	jmp    193f <malloc+0x96>
      else {
        p->s.size -= nunits;
    1919:	8b 45 f4             	mov    -0xc(%ebp),%eax
    191c:	8b 40 04             	mov    0x4(%eax),%eax
    191f:	2b 45 ec             	sub    -0x14(%ebp),%eax
    1922:	89 c2                	mov    %eax,%edx
    1924:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1927:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
    192a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    192d:	8b 40 04             	mov    0x4(%eax),%eax
    1930:	c1 e0 03             	shl    $0x3,%eax
    1933:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
    1936:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1939:	8b 55 ec             	mov    -0x14(%ebp),%edx
    193c:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
    193f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1942:	a3 50 22 00 00       	mov    %eax,0x2250
      return (void*)(p + 1);
    1947:	8b 45 f4             	mov    -0xc(%ebp),%eax
    194a:	83 c0 08             	add    $0x8,%eax
    194d:	eb 38                	jmp    1987 <malloc+0xde>
    }
    if(p == freep)
    194f:	a1 50 22 00 00       	mov    0x2250,%eax
    1954:	39 45 f4             	cmp    %eax,-0xc(%ebp)
    1957:	75 1b                	jne    1974 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
    1959:	8b 45 ec             	mov    -0x14(%ebp),%eax
    195c:	89 04 24             	mov    %eax,(%esp)
    195f:	e8 ed fe ff ff       	call   1851 <morecore>
    1964:	89 45 f4             	mov    %eax,-0xc(%ebp)
    1967:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    196b:	75 07                	jne    1974 <malloc+0xcb>
        return 0;
    196d:	b8 00 00 00 00       	mov    $0x0,%eax
    1972:	eb 13                	jmp    1987 <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1974:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1977:	89 45 f0             	mov    %eax,-0x10(%ebp)
    197a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    197d:	8b 00                	mov    (%eax),%eax
    197f:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
    1982:	e9 70 ff ff ff       	jmp    18f7 <malloc+0x4e>
}
    1987:	c9                   	leave  
    1988:	c3                   	ret    
    1989:	66 90                	xchg   %ax,%ax
    198b:	90                   	nop

0000198c <xchg>:
  asm volatile("sti");
}

static inline uint
xchg(volatile uint *addr, uint newval)
{
    198c:	55                   	push   %ebp
    198d:	89 e5                	mov    %esp,%ebp
    198f:	83 ec 10             	sub    $0x10,%esp
  uint result;
  
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
    1992:	8b 55 08             	mov    0x8(%ebp),%edx
    1995:	8b 45 0c             	mov    0xc(%ebp),%eax
    1998:	8b 4d 08             	mov    0x8(%ebp),%ecx
    199b:	f0 87 02             	lock xchg %eax,(%edx)
    199e:	89 45 fc             	mov    %eax,-0x4(%ebp)
               "+m" (*addr), "=a" (result) :
               "1" (newval) :
               "cc");
  return result;
    19a1:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    19a4:	c9                   	leave  
    19a5:	c3                   	ret    

000019a6 <lock_init>:
#include "x86.h"
#include "proc.h"

unsigned long rands = 1;

void lock_init(lock_t *lock){
    19a6:	55                   	push   %ebp
    19a7:	89 e5                	mov    %esp,%ebp
    lock->locked = 0;
    19a9:	8b 45 08             	mov    0x8(%ebp),%eax
    19ac:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
    19b2:	5d                   	pop    %ebp
    19b3:	c3                   	ret    

000019b4 <lock_acquire>:
void lock_acquire(lock_t *lock){
    19b4:	55                   	push   %ebp
    19b5:	89 e5                	mov    %esp,%ebp
    19b7:	83 ec 08             	sub    $0x8,%esp
    while(xchg(&lock->locked,1) != 0);
    19ba:	90                   	nop
    19bb:	8b 45 08             	mov    0x8(%ebp),%eax
    19be:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
    19c5:	00 
    19c6:	89 04 24             	mov    %eax,(%esp)
    19c9:	e8 be ff ff ff       	call   198c <xchg>
    19ce:	85 c0                	test   %eax,%eax
    19d0:	75 e9                	jne    19bb <lock_acquire+0x7>
}
    19d2:	c9                   	leave  
    19d3:	c3                   	ret    

000019d4 <lock_release>:
void lock_release(lock_t *lock){
    19d4:	55                   	push   %ebp
    19d5:	89 e5                	mov    %esp,%ebp
    19d7:	83 ec 08             	sub    $0x8,%esp
    xchg(&lock->locked,0);
    19da:	8b 45 08             	mov    0x8(%ebp),%eax
    19dd:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    19e4:	00 
    19e5:	89 04 24             	mov    %eax,(%esp)
    19e8:	e8 9f ff ff ff       	call   198c <xchg>
}
    19ed:	c9                   	leave  
    19ee:	c3                   	ret    

000019ef <thread_create>:


void *thread_create(void(*start_routine)(void*), void *arg){
    19ef:	55                   	push   %ebp
    19f0:	89 e5                	mov    %esp,%ebp
    19f2:	83 ec 28             	sub    $0x28,%esp
    int tid;
    void * stack = malloc(2 * 4096);
    19f5:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
    19fc:	e8 a8 fe ff ff       	call   18a9 <malloc>
    1a01:	89 45 f4             	mov    %eax,-0xc(%ebp)
    void *garbage_stack = stack; 
    1a04:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1a07:	89 45 f0             	mov    %eax,-0x10(%ebp)
   // printf(1,"start routine addr : %d\n",(uint)start_routine);


    if((uint)stack % 4096){
    1a0a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1a0d:	25 ff 0f 00 00       	and    $0xfff,%eax
    1a12:	85 c0                	test   %eax,%eax
    1a14:	74 14                	je     1a2a <thread_create+0x3b>
        stack = stack + (4096 - (uint)stack % 4096);
    1a16:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1a19:	25 ff 0f 00 00       	and    $0xfff,%eax
    1a1e:	89 c2                	mov    %eax,%edx
    1a20:	b8 00 10 00 00       	mov    $0x1000,%eax
    1a25:	29 d0                	sub    %edx,%eax
    1a27:	01 45 f4             	add    %eax,-0xc(%ebp)
    }
    if (stack == 0){
    1a2a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1a2e:	75 1b                	jne    1a4b <thread_create+0x5c>

        printf(1,"malloc fail \n");
    1a30:	c7 44 24 04 df 1d 00 	movl   $0x1ddf,0x4(%esp)
    1a37:	00 
    1a38:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1a3f:	e8 78 fb ff ff       	call   15bc <printf>
        return 0;
    1a44:	b8 00 00 00 00       	mov    $0x0,%eax
    1a49:	eb 6f                	jmp    1aba <thread_create+0xcb>
    }

    tid = clone((uint)stack,PSIZE,(uint)start_routine,(int)arg);
    1a4b:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    1a4e:	8b 55 08             	mov    0x8(%ebp),%edx
    1a51:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1a54:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
    1a58:	89 54 24 08          	mov    %edx,0x8(%esp)
    1a5c:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
    1a63:	00 
    1a64:	89 04 24             	mov    %eax,(%esp)
    1a67:	e8 50 fa ff ff       	call   14bc <clone>
    1a6c:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(tid < 0){
    1a6f:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1a73:	79 1b                	jns    1a90 <thread_create+0xa1>
        printf(1,"clone fails\n");
    1a75:	c7 44 24 04 ed 1d 00 	movl   $0x1ded,0x4(%esp)
    1a7c:	00 
    1a7d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1a84:	e8 33 fb ff ff       	call   15bc <printf>
        return 0;
    1a89:	b8 00 00 00 00       	mov    $0x0,%eax
    1a8e:	eb 2a                	jmp    1aba <thread_create+0xcb>
    }
    if(tid > 0){
    1a90:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1a94:	7e 05                	jle    1a9b <thread_create+0xac>
        //store threads on thread table
        return garbage_stack;
    1a96:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1a99:	eb 1f                	jmp    1aba <thread_create+0xcb>
    }
    if(tid == 0){
    1a9b:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1a9f:	75 14                	jne    1ab5 <thread_create+0xc6>
        printf(1,"tid = 0 return \n");
    1aa1:	c7 44 24 04 fa 1d 00 	movl   $0x1dfa,0x4(%esp)
    1aa8:	00 
    1aa9:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1ab0:	e8 07 fb ff ff       	call   15bc <printf>
    }
//    wait();
//    free(garbage_stack);

    return 0;
    1ab5:	b8 00 00 00 00       	mov    $0x0,%eax
}
    1aba:	c9                   	leave  
    1abb:	c3                   	ret    

00001abc <random>:

// generate 0 -> max random number exclude max.
int random(int max){
    1abc:	55                   	push   %ebp
    1abd:	89 e5                	mov    %esp,%ebp
    rands = rands * 1664525 + 1013904233;
    1abf:	a1 44 22 00 00       	mov    0x2244,%eax
    1ac4:	69 c0 0d 66 19 00    	imul   $0x19660d,%eax,%eax
    1aca:	05 69 f3 6e 3c       	add    $0x3c6ef369,%eax
    1acf:	a3 44 22 00 00       	mov    %eax,0x2244
    return (int)(rands % max);
    1ad4:	a1 44 22 00 00       	mov    0x2244,%eax
    1ad9:	8b 4d 08             	mov    0x8(%ebp),%ecx
    1adc:	ba 00 00 00 00       	mov    $0x0,%edx
    1ae1:	f7 f1                	div    %ecx
    1ae3:	89 d0                	mov    %edx,%eax
}
    1ae5:	5d                   	pop    %ebp
    1ae6:	c3                   	ret    
    1ae7:	90                   	nop

00001ae8 <init_q>:
#include "queue.h"
#include "types.h"
#include "user.h"

void init_q(struct queue *q){
    1ae8:	55                   	push   %ebp
    1ae9:	89 e5                	mov    %esp,%ebp
    q->size = 0;
    1aeb:	8b 45 08             	mov    0x8(%ebp),%eax
    1aee:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    q->head = 0;
    1af4:	8b 45 08             	mov    0x8(%ebp),%eax
    1af7:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    q->tail = 0;
    1afe:	8b 45 08             	mov    0x8(%ebp),%eax
    1b01:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
}
    1b08:	5d                   	pop    %ebp
    1b09:	c3                   	ret    

00001b0a <add_q>:

void add_q(struct queue *q, int v){
    1b0a:	55                   	push   %ebp
    1b0b:	89 e5                	mov    %esp,%ebp
    1b0d:	83 ec 28             	sub    $0x28,%esp
    struct node * n = malloc(sizeof(struct node));
    1b10:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
    1b17:	e8 8d fd ff ff       	call   18a9 <malloc>
    1b1c:	89 45 f4             	mov    %eax,-0xc(%ebp)
    n->next = 0;
    1b1f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1b22:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    n->value = v;
    1b29:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1b2c:	8b 55 0c             	mov    0xc(%ebp),%edx
    1b2f:	89 10                	mov    %edx,(%eax)
    if(q->head == 0){
    1b31:	8b 45 08             	mov    0x8(%ebp),%eax
    1b34:	8b 40 04             	mov    0x4(%eax),%eax
    1b37:	85 c0                	test   %eax,%eax
    1b39:	75 0b                	jne    1b46 <add_q+0x3c>
        q->head = n;
    1b3b:	8b 45 08             	mov    0x8(%ebp),%eax
    1b3e:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1b41:	89 50 04             	mov    %edx,0x4(%eax)
    1b44:	eb 0c                	jmp    1b52 <add_q+0x48>
    }else{
        q->tail->next = n;
    1b46:	8b 45 08             	mov    0x8(%ebp),%eax
    1b49:	8b 40 08             	mov    0x8(%eax),%eax
    1b4c:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1b4f:	89 50 04             	mov    %edx,0x4(%eax)
    }
    q->tail = n;
    1b52:	8b 45 08             	mov    0x8(%ebp),%eax
    1b55:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1b58:	89 50 08             	mov    %edx,0x8(%eax)
    q->size++;
    1b5b:	8b 45 08             	mov    0x8(%ebp),%eax
    1b5e:	8b 00                	mov    (%eax),%eax
    1b60:	8d 50 01             	lea    0x1(%eax),%edx
    1b63:	8b 45 08             	mov    0x8(%ebp),%eax
    1b66:	89 10                	mov    %edx,(%eax)
}
    1b68:	c9                   	leave  
    1b69:	c3                   	ret    

00001b6a <empty_q>:

int empty_q(struct queue *q){
    1b6a:	55                   	push   %ebp
    1b6b:	89 e5                	mov    %esp,%ebp
    if(q->size == 0)
    1b6d:	8b 45 08             	mov    0x8(%ebp),%eax
    1b70:	8b 00                	mov    (%eax),%eax
    1b72:	85 c0                	test   %eax,%eax
    1b74:	75 07                	jne    1b7d <empty_q+0x13>
        return 1;
    1b76:	b8 01 00 00 00       	mov    $0x1,%eax
    1b7b:	eb 05                	jmp    1b82 <empty_q+0x18>
    else
        return 0;
    1b7d:	b8 00 00 00 00       	mov    $0x0,%eax
} 
    1b82:	5d                   	pop    %ebp
    1b83:	c3                   	ret    

00001b84 <pop_q>:
int pop_q(struct queue *q){
    1b84:	55                   	push   %ebp
    1b85:	89 e5                	mov    %esp,%ebp
    1b87:	83 ec 28             	sub    $0x28,%esp
    int val;
    struct node *destroy;
    if(!empty_q(q)){
    1b8a:	8b 45 08             	mov    0x8(%ebp),%eax
    1b8d:	89 04 24             	mov    %eax,(%esp)
    1b90:	e8 d5 ff ff ff       	call   1b6a <empty_q>
    1b95:	85 c0                	test   %eax,%eax
    1b97:	75 5d                	jne    1bf6 <pop_q+0x72>
       val = q->head->value; 
    1b99:	8b 45 08             	mov    0x8(%ebp),%eax
    1b9c:	8b 40 04             	mov    0x4(%eax),%eax
    1b9f:	8b 00                	mov    (%eax),%eax
    1ba1:	89 45 f4             	mov    %eax,-0xc(%ebp)
       destroy = q->head;
    1ba4:	8b 45 08             	mov    0x8(%ebp),%eax
    1ba7:	8b 40 04             	mov    0x4(%eax),%eax
    1baa:	89 45 f0             	mov    %eax,-0x10(%ebp)
       q->head = q->head->next;
    1bad:	8b 45 08             	mov    0x8(%ebp),%eax
    1bb0:	8b 40 04             	mov    0x4(%eax),%eax
    1bb3:	8b 50 04             	mov    0x4(%eax),%edx
    1bb6:	8b 45 08             	mov    0x8(%ebp),%eax
    1bb9:	89 50 04             	mov    %edx,0x4(%eax)
       free(destroy);
    1bbc:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1bbf:	89 04 24             	mov    %eax,(%esp)
    1bc2:	e8 a9 fb ff ff       	call   1770 <free>
       q->size--;
    1bc7:	8b 45 08             	mov    0x8(%ebp),%eax
    1bca:	8b 00                	mov    (%eax),%eax
    1bcc:	8d 50 ff             	lea    -0x1(%eax),%edx
    1bcf:	8b 45 08             	mov    0x8(%ebp),%eax
    1bd2:	89 10                	mov    %edx,(%eax)
       if(q->size == 0){
    1bd4:	8b 45 08             	mov    0x8(%ebp),%eax
    1bd7:	8b 00                	mov    (%eax),%eax
    1bd9:	85 c0                	test   %eax,%eax
    1bdb:	75 14                	jne    1bf1 <pop_q+0x6d>
            q->head = 0;
    1bdd:	8b 45 08             	mov    0x8(%ebp),%eax
    1be0:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
            q->tail = 0;
    1be7:	8b 45 08             	mov    0x8(%ebp),%eax
    1bea:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
       }
       return val;
    1bf1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1bf4:	eb 05                	jmp    1bfb <pop_q+0x77>
    }
    return -1;
    1bf6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
    1bfb:	c9                   	leave  
    1bfc:	c3                   	ret    

00001bfd <dominant>:

void dominant(struct queue* q, int i){
    1bfd:	55                   	push   %ebp
    1bfe:	89 e5                	mov    %esp,%ebp
    1c00:	83 ec 28             	sub    $0x28,%esp
    struct node * n = malloc(sizeof(struct node));
    1c03:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
    1c0a:	e8 9a fc ff ff       	call   18a9 <malloc>
    1c0f:	89 45 f4             	mov    %eax,-0xc(%ebp)
    n->value = i;
    1c12:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1c15:	8b 55 0c             	mov    0xc(%ebp),%edx
    1c18:	89 10                	mov    %edx,(%eax)

    if(q->head == 0){
    1c1a:	8b 45 08             	mov    0x8(%ebp),%eax
    1c1d:	8b 40 04             	mov    0x4(%eax),%eax
    1c20:	85 c0                	test   %eax,%eax
    1c22:	75 14                	jne    1c38 <dominant+0x3b>
        q->head = n;
    1c24:	8b 45 08             	mov    0x8(%ebp),%eax
    1c27:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1c2a:	89 50 04             	mov    %edx,0x4(%eax)
        q->tail = n;
    1c2d:	8b 45 08             	mov    0x8(%ebp),%eax
    1c30:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1c33:	89 50 08             	mov    %edx,0x8(%eax)
    1c36:	eb 15                	jmp    1c4d <dominant+0x50>
    }
    else{
        n->next = q->head;
    1c38:	8b 45 08             	mov    0x8(%ebp),%eax
    1c3b:	8b 50 04             	mov    0x4(%eax),%edx
    1c3e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1c41:	89 50 04             	mov    %edx,0x4(%eax)
        q->head = n;
    1c44:	8b 45 08             	mov    0x8(%ebp),%eax
    1c47:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1c4a:	89 50 04             	mov    %edx,0x4(%eax)
    }
    q->size++;
    1c4d:	8b 45 08             	mov    0x8(%ebp),%eax
    1c50:	8b 00                	mov    (%eax),%eax
    1c52:	8d 50 01             	lea    0x1(%eax),%edx
    1c55:	8b 45 08             	mov    0x8(%ebp),%eax
    1c58:	89 10                	mov    %edx,(%eax)
}
    1c5a:	c9                   	leave  
    1c5b:	c3                   	ret    

00001c5c <sem_init>:
#include "semaphore.h"
#include "user.h"

// Initializes the semaphore
void sem_init(struct Semaphore* s, int value){
    1c5c:	55                   	push   %ebp
    1c5d:	89 e5                	mov    %esp,%ebp
    1c5f:	83 ec 18             	sub    $0x18,%esp
    s->val = value;
    1c62:	8b 45 08             	mov    0x8(%ebp),%eax
    1c65:	8b 55 0c             	mov    0xc(%ebp),%edx
    1c68:	89 10                	mov    %edx,(%eax)
    lock_init(&s->lock);
    1c6a:	8b 45 08             	mov    0x8(%ebp),%eax
    1c6d:	83 c0 04             	add    $0x4,%eax
    1c70:	89 04 24             	mov    %eax,(%esp)
    1c73:	e8 2e fd ff ff       	call   19a6 <lock_init>
    init_q(&s->q);
    1c78:	8b 45 08             	mov    0x8(%ebp),%eax
    1c7b:	83 c0 08             	add    $0x8,%eax
    1c7e:	89 04 24             	mov    %eax,(%esp)
    1c81:	e8 62 fe ff ff       	call   1ae8 <init_q>
}
    1c86:	c9                   	leave  
    1c87:	c3                   	ret    

00001c88 <sem_acquire>:

// Decrements the semaphore
void sem_acquire(struct Semaphore* s){
    1c88:	55                   	push   %ebp
    1c89:	89 e5                	mov    %esp,%ebp
    1c8b:	83 ec 28             	sub    $0x28,%esp
    lock_acquire(&s->lock);
    1c8e:	8b 45 08             	mov    0x8(%ebp),%eax
    1c91:	83 c0 04             	add    $0x4,%eax
    1c94:	89 04 24             	mov    %eax,(%esp)
    1c97:	e8 18 fd ff ff       	call   19b4 <lock_acquire>

    if(s->val == 0){
    1c9c:	8b 45 08             	mov    0x8(%ebp),%eax
    1c9f:	8b 00                	mov    (%eax),%eax
    1ca1:	85 c0                	test   %eax,%eax
    1ca3:	75 32                	jne    1cd7 <sem_acquire+0x4f>
        int pid;
        pid = getpid();
    1ca5:	e8 f2 f7 ff ff       	call   149c <getpid>
    1caa:	89 45 f4             	mov    %eax,-0xc(%ebp)
        add_q(&s->q, pid);
    1cad:	8b 45 08             	mov    0x8(%ebp),%eax
    1cb0:	8d 50 08             	lea    0x8(%eax),%edx
    1cb3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1cb6:	89 44 24 04          	mov    %eax,0x4(%esp)
    1cba:	89 14 24             	mov    %edx,(%esp)
    1cbd:	e8 48 fe ff ff       	call   1b0a <add_q>
        lock_release(&s->lock);
    1cc2:	8b 45 08             	mov    0x8(%ebp),%eax
    1cc5:	83 c0 04             	add    $0x4,%eax
    1cc8:	89 04 24             	mov    %eax,(%esp)
    1ccb:	e8 04 fd ff ff       	call   19d4 <lock_release>
        tsleep();
    1cd0:	e8 f7 f7 ff ff       	call   14cc <tsleep>
    1cd5:	eb 1b                	jmp    1cf2 <sem_acquire+0x6a>
    }
    else{
        s->val--;
    1cd7:	8b 45 08             	mov    0x8(%ebp),%eax
    1cda:	8b 00                	mov    (%eax),%eax
    1cdc:	8d 50 ff             	lea    -0x1(%eax),%edx
    1cdf:	8b 45 08             	mov    0x8(%ebp),%eax
    1ce2:	89 10                	mov    %edx,(%eax)
        lock_release(&s->lock);
    1ce4:	8b 45 08             	mov    0x8(%ebp),%eax
    1ce7:	83 c0 04             	add    $0x4,%eax
    1cea:	89 04 24             	mov    %eax,(%esp)
    1ced:	e8 e2 fc ff ff       	call   19d4 <lock_release>
    }
}
    1cf2:	c9                   	leave  
    1cf3:	c3                   	ret    

00001cf4 <sem_signal>:

// Increments the semaphore
void sem_signal(struct Semaphore* s){
    1cf4:	55                   	push   %ebp
    1cf5:	89 e5                	mov    %esp,%ebp
    1cf7:	83 ec 18             	sub    $0x18,%esp
    lock_acquire(&s->lock);
    1cfa:	8b 45 08             	mov    0x8(%ebp),%eax
    1cfd:	83 c0 04             	add    $0x4,%eax
    1d00:	89 04 24             	mov    %eax,(%esp)
    1d03:	e8 ac fc ff ff       	call   19b4 <lock_acquire>

    if(!empty_q(&s->q)){
    1d08:	8b 45 08             	mov    0x8(%ebp),%eax
    1d0b:	83 c0 08             	add    $0x8,%eax
    1d0e:	89 04 24             	mov    %eax,(%esp)
    1d11:	e8 54 fe ff ff       	call   1b6a <empty_q>
    1d16:	85 c0                	test   %eax,%eax
    1d18:	75 18                	jne    1d32 <sem_signal+0x3e>
        twakeup(pop_q(&s->q));
    1d1a:	8b 45 08             	mov    0x8(%ebp),%eax
    1d1d:	83 c0 08             	add    $0x8,%eax
    1d20:	89 04 24             	mov    %eax,(%esp)
    1d23:	e8 5c fe ff ff       	call   1b84 <pop_q>
    1d28:	89 04 24             	mov    %eax,(%esp)
    1d2b:	e8 a4 f7 ff ff       	call   14d4 <twakeup>
    1d30:	eb 0d                	jmp    1d3f <sem_signal+0x4b>
    }
    else{
        s->val++;
    1d32:	8b 45 08             	mov    0x8(%ebp),%eax
    1d35:	8b 00                	mov    (%eax),%eax
    1d37:	8d 50 01             	lea    0x1(%eax),%edx
    1d3a:	8b 45 08             	mov    0x8(%ebp),%eax
    1d3d:	89 10                	mov    %edx,(%eax)
    }

    lock_release(&s->lock);
    1d3f:	8b 45 08             	mov    0x8(%ebp),%eax
    1d42:	83 c0 04             	add    $0x4,%eax
    1d45:	89 04 24             	mov    %eax,(%esp)
    1d48:	e8 87 fc ff ff       	call   19d4 <lock_release>
}
    1d4d:	c9                   	leave  
    1d4e:	c3                   	ret    

00001d4f <sem_dom_acquire>:

void sem_dom_acquire(struct Semaphore* s){
    1d4f:	55                   	push   %ebp
    1d50:	89 e5                	mov    %esp,%ebp
    1d52:	83 ec 18             	sub    $0x18,%esp
    lock_acquire(&s->lock);
    1d55:	8b 45 08             	mov    0x8(%ebp),%eax
    1d58:	83 c0 04             	add    $0x4,%eax
    1d5b:	89 04 24             	mov    %eax,(%esp)
    1d5e:	e8 51 fc ff ff       	call   19b4 <lock_acquire>

    if(s->val > 0){
    1d63:	8b 45 08             	mov    0x8(%ebp),%eax
    1d66:	8b 00                	mov    (%eax),%eax
    1d68:	85 c0                	test   %eax,%eax
    1d6a:	7e 1d                	jle    1d89 <sem_dom_acquire+0x3a>
        s->val--;
    1d6c:	8b 45 08             	mov    0x8(%ebp),%eax
    1d6f:	8b 00                	mov    (%eax),%eax
    1d71:	8d 50 ff             	lea    -0x1(%eax),%edx
    1d74:	8b 45 08             	mov    0x8(%ebp),%eax
    1d77:	89 10                	mov    %edx,(%eax)
        lock_release(&s->lock);
    1d79:	8b 45 08             	mov    0x8(%ebp),%eax
    1d7c:	83 c0 04             	add    $0x4,%eax
    1d7f:	89 04 24             	mov    %eax,(%esp)
    1d82:	e8 4d fc ff ff       	call   19d4 <lock_release>
        return;
    1d87:	eb 2a                	jmp    1db3 <sem_dom_acquire+0x64>
    }

    dominant(&s->q,getpid());
    1d89:	e8 0e f7 ff ff       	call   149c <getpid>
    1d8e:	8b 55 08             	mov    0x8(%ebp),%edx
    1d91:	83 c2 08             	add    $0x8,%edx
    1d94:	89 44 24 04          	mov    %eax,0x4(%esp)
    1d98:	89 14 24             	mov    %edx,(%esp)
    1d9b:	e8 5d fe ff ff       	call   1bfd <dominant>
    lock_release(&s->lock);
    1da0:	8b 45 08             	mov    0x8(%ebp),%eax
    1da3:	83 c0 04             	add    $0x4,%eax
    1da6:	89 04 24             	mov    %eax,(%esp)
    1da9:	e8 26 fc ff ff       	call   19d4 <lock_release>
    tsleep();
    1dae:	e8 19 f7 ff ff       	call   14cc <tsleep>
}
    1db3:	c9                   	leave  
    1db4:	c3                   	ret    
