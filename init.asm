
_init:     file format elf32-i386


Disassembly of section .text:

00001000 <main>:

char *argv[] = { "sh", 0 };

int
main(void)
{
    1000:	55                   	push   %ebp
    1001:	89 e5                	mov    %esp,%ebp
    1003:	83 e4 f0             	and    $0xfffffff0,%esp
    1006:	83 ec 20             	sub    $0x20,%esp
  int pid, wpid;

  if(open("console", O_RDWR) < 0){
    1009:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    1010:	00 
    1011:	c7 04 24 14 1d 00 00 	movl   $0x1d14,(%esp)
    1018:	e8 9b 03 00 00       	call   13b8 <open>
    101d:	85 c0                	test   %eax,%eax
    101f:	79 30                	jns    1051 <main+0x51>
    mknod("console", 1, 1);
    1021:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    1028:	00 
    1029:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
    1030:	00 
    1031:	c7 04 24 14 1d 00 00 	movl   $0x1d14,(%esp)
    1038:	e8 83 03 00 00       	call   13c0 <mknod>
    open("console", O_RDWR);
    103d:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    1044:	00 
    1045:	c7 04 24 14 1d 00 00 	movl   $0x1d14,(%esp)
    104c:	e8 67 03 00 00       	call   13b8 <open>
  }
  dup(0);  // stdout
    1051:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1058:	e8 93 03 00 00       	call   13f0 <dup>
  dup(0);  // stderr
    105d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1064:	e8 87 03 00 00       	call   13f0 <dup>

  for(;;){
    printf(1, "init: starting sh\n");
    1069:	c7 44 24 04 1c 1d 00 	movl   $0x1d1c,0x4(%esp)
    1070:	00 
    1071:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1078:	e8 9b 04 00 00       	call   1518 <printf>
    pid = fork();
    107d:	e8 ee 02 00 00       	call   1370 <fork>
    1082:	89 44 24 1c          	mov    %eax,0x1c(%esp)
    if(pid < 0){
    1086:	83 7c 24 1c 00       	cmpl   $0x0,0x1c(%esp)
    108b:	79 19                	jns    10a6 <main+0xa6>
      printf(1, "init: fork failed\n");
    108d:	c7 44 24 04 2f 1d 00 	movl   $0x1d2f,0x4(%esp)
    1094:	00 
    1095:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    109c:	e8 77 04 00 00       	call   1518 <printf>
      exit();
    10a1:	e8 d2 02 00 00       	call   1378 <exit>
    }
    if(pid == 0){
    10a6:	83 7c 24 1c 00       	cmpl   $0x0,0x1c(%esp)
    10ab:	75 2d                	jne    10da <main+0xda>
      exec("sh", argv);
    10ad:	c7 44 24 04 b8 21 00 	movl   $0x21b8,0x4(%esp)
    10b4:	00 
    10b5:	c7 04 24 11 1d 00 00 	movl   $0x1d11,(%esp)
    10bc:	e8 ef 02 00 00       	call   13b0 <exec>
      printf(1, "init: exec sh failed\n");
    10c1:	c7 44 24 04 42 1d 00 	movl   $0x1d42,0x4(%esp)
    10c8:	00 
    10c9:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    10d0:	e8 43 04 00 00       	call   1518 <printf>
      exit();
    10d5:	e8 9e 02 00 00       	call   1378 <exit>
    }
    while((wpid=wait()) >= 0 && wpid != pid)
    10da:	eb 14                	jmp    10f0 <main+0xf0>
      printf(1, "zombie!\n");
    10dc:	c7 44 24 04 58 1d 00 	movl   $0x1d58,0x4(%esp)
    10e3:	00 
    10e4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    10eb:	e8 28 04 00 00       	call   1518 <printf>
    if(pid == 0){
      exec("sh", argv);
      printf(1, "init: exec sh failed\n");
      exit();
    }
    while((wpid=wait()) >= 0 && wpid != pid)
    10f0:	e8 8b 02 00 00       	call   1380 <wait>
    10f5:	89 44 24 18          	mov    %eax,0x18(%esp)
    10f9:	83 7c 24 18 00       	cmpl   $0x0,0x18(%esp)
    10fe:	78 0a                	js     110a <main+0x10a>
    1100:	8b 44 24 18          	mov    0x18(%esp),%eax
    1104:	3b 44 24 1c          	cmp    0x1c(%esp),%eax
    1108:	75 d2                	jne    10dc <main+0xdc>
      printf(1, "zombie!\n");
  }
    110a:	e9 5a ff ff ff       	jmp    1069 <main+0x69>
    110f:	90                   	nop

00001110 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
    1110:	55                   	push   %ebp
    1111:	89 e5                	mov    %esp,%ebp
    1113:	57                   	push   %edi
    1114:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
    1115:	8b 4d 08             	mov    0x8(%ebp),%ecx
    1118:	8b 55 10             	mov    0x10(%ebp),%edx
    111b:	8b 45 0c             	mov    0xc(%ebp),%eax
    111e:	89 cb                	mov    %ecx,%ebx
    1120:	89 df                	mov    %ebx,%edi
    1122:	89 d1                	mov    %edx,%ecx
    1124:	fc                   	cld    
    1125:	f3 aa                	rep stos %al,%es:(%edi)
    1127:	89 ca                	mov    %ecx,%edx
    1129:	89 fb                	mov    %edi,%ebx
    112b:	89 5d 08             	mov    %ebx,0x8(%ebp)
    112e:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
    1131:	5b                   	pop    %ebx
    1132:	5f                   	pop    %edi
    1133:	5d                   	pop    %ebp
    1134:	c3                   	ret    

00001135 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
    1135:	55                   	push   %ebp
    1136:	89 e5                	mov    %esp,%ebp
    1138:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
    113b:	8b 45 08             	mov    0x8(%ebp),%eax
    113e:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
    1141:	90                   	nop
    1142:	8b 45 08             	mov    0x8(%ebp),%eax
    1145:	8d 50 01             	lea    0x1(%eax),%edx
    1148:	89 55 08             	mov    %edx,0x8(%ebp)
    114b:	8b 55 0c             	mov    0xc(%ebp),%edx
    114e:	8d 4a 01             	lea    0x1(%edx),%ecx
    1151:	89 4d 0c             	mov    %ecx,0xc(%ebp)
    1154:	0f b6 12             	movzbl (%edx),%edx
    1157:	88 10                	mov    %dl,(%eax)
    1159:	0f b6 00             	movzbl (%eax),%eax
    115c:	84 c0                	test   %al,%al
    115e:	75 e2                	jne    1142 <strcpy+0xd>
    ;
  return os;
    1160:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    1163:	c9                   	leave  
    1164:	c3                   	ret    

00001165 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    1165:	55                   	push   %ebp
    1166:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
    1168:	eb 08                	jmp    1172 <strcmp+0xd>
    p++, q++;
    116a:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    116e:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    1172:	8b 45 08             	mov    0x8(%ebp),%eax
    1175:	0f b6 00             	movzbl (%eax),%eax
    1178:	84 c0                	test   %al,%al
    117a:	74 10                	je     118c <strcmp+0x27>
    117c:	8b 45 08             	mov    0x8(%ebp),%eax
    117f:	0f b6 10             	movzbl (%eax),%edx
    1182:	8b 45 0c             	mov    0xc(%ebp),%eax
    1185:	0f b6 00             	movzbl (%eax),%eax
    1188:	38 c2                	cmp    %al,%dl
    118a:	74 de                	je     116a <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
    118c:	8b 45 08             	mov    0x8(%ebp),%eax
    118f:	0f b6 00             	movzbl (%eax),%eax
    1192:	0f b6 d0             	movzbl %al,%edx
    1195:	8b 45 0c             	mov    0xc(%ebp),%eax
    1198:	0f b6 00             	movzbl (%eax),%eax
    119b:	0f b6 c0             	movzbl %al,%eax
    119e:	29 c2                	sub    %eax,%edx
    11a0:	89 d0                	mov    %edx,%eax
}
    11a2:	5d                   	pop    %ebp
    11a3:	c3                   	ret    

000011a4 <strlen>:

uint
strlen(char *s)
{
    11a4:	55                   	push   %ebp
    11a5:	89 e5                	mov    %esp,%ebp
    11a7:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
    11aa:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    11b1:	eb 04                	jmp    11b7 <strlen+0x13>
    11b3:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    11b7:	8b 55 fc             	mov    -0x4(%ebp),%edx
    11ba:	8b 45 08             	mov    0x8(%ebp),%eax
    11bd:	01 d0                	add    %edx,%eax
    11bf:	0f b6 00             	movzbl (%eax),%eax
    11c2:	84 c0                	test   %al,%al
    11c4:	75 ed                	jne    11b3 <strlen+0xf>
    ;
  return n;
    11c6:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    11c9:	c9                   	leave  
    11ca:	c3                   	ret    

000011cb <memset>:

void*
memset(void *dst, int c, uint n)
{
    11cb:	55                   	push   %ebp
    11cc:	89 e5                	mov    %esp,%ebp
    11ce:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
    11d1:	8b 45 10             	mov    0x10(%ebp),%eax
    11d4:	89 44 24 08          	mov    %eax,0x8(%esp)
    11d8:	8b 45 0c             	mov    0xc(%ebp),%eax
    11db:	89 44 24 04          	mov    %eax,0x4(%esp)
    11df:	8b 45 08             	mov    0x8(%ebp),%eax
    11e2:	89 04 24             	mov    %eax,(%esp)
    11e5:	e8 26 ff ff ff       	call   1110 <stosb>
  return dst;
    11ea:	8b 45 08             	mov    0x8(%ebp),%eax
}
    11ed:	c9                   	leave  
    11ee:	c3                   	ret    

000011ef <strchr>:

char*
strchr(const char *s, char c)
{
    11ef:	55                   	push   %ebp
    11f0:	89 e5                	mov    %esp,%ebp
    11f2:	83 ec 04             	sub    $0x4,%esp
    11f5:	8b 45 0c             	mov    0xc(%ebp),%eax
    11f8:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
    11fb:	eb 14                	jmp    1211 <strchr+0x22>
    if(*s == c)
    11fd:	8b 45 08             	mov    0x8(%ebp),%eax
    1200:	0f b6 00             	movzbl (%eax),%eax
    1203:	3a 45 fc             	cmp    -0x4(%ebp),%al
    1206:	75 05                	jne    120d <strchr+0x1e>
      return (char*)s;
    1208:	8b 45 08             	mov    0x8(%ebp),%eax
    120b:	eb 13                	jmp    1220 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
    120d:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    1211:	8b 45 08             	mov    0x8(%ebp),%eax
    1214:	0f b6 00             	movzbl (%eax),%eax
    1217:	84 c0                	test   %al,%al
    1219:	75 e2                	jne    11fd <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
    121b:	b8 00 00 00 00       	mov    $0x0,%eax
}
    1220:	c9                   	leave  
    1221:	c3                   	ret    

00001222 <gets>:

char*
gets(char *buf, int max)
{
    1222:	55                   	push   %ebp
    1223:	89 e5                	mov    %esp,%ebp
    1225:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1228:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    122f:	eb 4c                	jmp    127d <gets+0x5b>
    cc = read(0, &c, 1);
    1231:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    1238:	00 
    1239:	8d 45 ef             	lea    -0x11(%ebp),%eax
    123c:	89 44 24 04          	mov    %eax,0x4(%esp)
    1240:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1247:	e8 44 01 00 00       	call   1390 <read>
    124c:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
    124f:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1253:	7f 02                	jg     1257 <gets+0x35>
      break;
    1255:	eb 31                	jmp    1288 <gets+0x66>
    buf[i++] = c;
    1257:	8b 45 f4             	mov    -0xc(%ebp),%eax
    125a:	8d 50 01             	lea    0x1(%eax),%edx
    125d:	89 55 f4             	mov    %edx,-0xc(%ebp)
    1260:	89 c2                	mov    %eax,%edx
    1262:	8b 45 08             	mov    0x8(%ebp),%eax
    1265:	01 c2                	add    %eax,%edx
    1267:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    126b:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
    126d:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    1271:	3c 0a                	cmp    $0xa,%al
    1273:	74 13                	je     1288 <gets+0x66>
    1275:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    1279:	3c 0d                	cmp    $0xd,%al
    127b:	74 0b                	je     1288 <gets+0x66>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    127d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1280:	83 c0 01             	add    $0x1,%eax
    1283:	3b 45 0c             	cmp    0xc(%ebp),%eax
    1286:	7c a9                	jl     1231 <gets+0xf>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    1288:	8b 55 f4             	mov    -0xc(%ebp),%edx
    128b:	8b 45 08             	mov    0x8(%ebp),%eax
    128e:	01 d0                	add    %edx,%eax
    1290:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
    1293:	8b 45 08             	mov    0x8(%ebp),%eax
}
    1296:	c9                   	leave  
    1297:	c3                   	ret    

00001298 <stat>:

int
stat(char *n, struct stat *st)
{
    1298:	55                   	push   %ebp
    1299:	89 e5                	mov    %esp,%ebp
    129b:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    129e:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    12a5:	00 
    12a6:	8b 45 08             	mov    0x8(%ebp),%eax
    12a9:	89 04 24             	mov    %eax,(%esp)
    12ac:	e8 07 01 00 00       	call   13b8 <open>
    12b1:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
    12b4:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    12b8:	79 07                	jns    12c1 <stat+0x29>
    return -1;
    12ba:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    12bf:	eb 23                	jmp    12e4 <stat+0x4c>
  r = fstat(fd, st);
    12c1:	8b 45 0c             	mov    0xc(%ebp),%eax
    12c4:	89 44 24 04          	mov    %eax,0x4(%esp)
    12c8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    12cb:	89 04 24             	mov    %eax,(%esp)
    12ce:	e8 fd 00 00 00       	call   13d0 <fstat>
    12d3:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
    12d6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    12d9:	89 04 24             	mov    %eax,(%esp)
    12dc:	e8 bf 00 00 00       	call   13a0 <close>
  return r;
    12e1:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
    12e4:	c9                   	leave  
    12e5:	c3                   	ret    

000012e6 <atoi>:

int
atoi(const char *s)
{
    12e6:	55                   	push   %ebp
    12e7:	89 e5                	mov    %esp,%ebp
    12e9:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
    12ec:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
    12f3:	eb 25                	jmp    131a <atoi+0x34>
    n = n*10 + *s++ - '0';
    12f5:	8b 55 fc             	mov    -0x4(%ebp),%edx
    12f8:	89 d0                	mov    %edx,%eax
    12fa:	c1 e0 02             	shl    $0x2,%eax
    12fd:	01 d0                	add    %edx,%eax
    12ff:	01 c0                	add    %eax,%eax
    1301:	89 c1                	mov    %eax,%ecx
    1303:	8b 45 08             	mov    0x8(%ebp),%eax
    1306:	8d 50 01             	lea    0x1(%eax),%edx
    1309:	89 55 08             	mov    %edx,0x8(%ebp)
    130c:	0f b6 00             	movzbl (%eax),%eax
    130f:	0f be c0             	movsbl %al,%eax
    1312:	01 c8                	add    %ecx,%eax
    1314:	83 e8 30             	sub    $0x30,%eax
    1317:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    131a:	8b 45 08             	mov    0x8(%ebp),%eax
    131d:	0f b6 00             	movzbl (%eax),%eax
    1320:	3c 2f                	cmp    $0x2f,%al
    1322:	7e 0a                	jle    132e <atoi+0x48>
    1324:	8b 45 08             	mov    0x8(%ebp),%eax
    1327:	0f b6 00             	movzbl (%eax),%eax
    132a:	3c 39                	cmp    $0x39,%al
    132c:	7e c7                	jle    12f5 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
    132e:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    1331:	c9                   	leave  
    1332:	c3                   	ret    

00001333 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    1333:	55                   	push   %ebp
    1334:	89 e5                	mov    %esp,%ebp
    1336:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
    1339:	8b 45 08             	mov    0x8(%ebp),%eax
    133c:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
    133f:	8b 45 0c             	mov    0xc(%ebp),%eax
    1342:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
    1345:	eb 17                	jmp    135e <memmove+0x2b>
    *dst++ = *src++;
    1347:	8b 45 fc             	mov    -0x4(%ebp),%eax
    134a:	8d 50 01             	lea    0x1(%eax),%edx
    134d:	89 55 fc             	mov    %edx,-0x4(%ebp)
    1350:	8b 55 f8             	mov    -0x8(%ebp),%edx
    1353:	8d 4a 01             	lea    0x1(%edx),%ecx
    1356:	89 4d f8             	mov    %ecx,-0x8(%ebp)
    1359:	0f b6 12             	movzbl (%edx),%edx
    135c:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    135e:	8b 45 10             	mov    0x10(%ebp),%eax
    1361:	8d 50 ff             	lea    -0x1(%eax),%edx
    1364:	89 55 10             	mov    %edx,0x10(%ebp)
    1367:	85 c0                	test   %eax,%eax
    1369:	7f dc                	jg     1347 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
    136b:	8b 45 08             	mov    0x8(%ebp),%eax
}
    136e:	c9                   	leave  
    136f:	c3                   	ret    

00001370 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    1370:	b8 01 00 00 00       	mov    $0x1,%eax
    1375:	cd 40                	int    $0x40
    1377:	c3                   	ret    

00001378 <exit>:
SYSCALL(exit)
    1378:	b8 02 00 00 00       	mov    $0x2,%eax
    137d:	cd 40                	int    $0x40
    137f:	c3                   	ret    

00001380 <wait>:
SYSCALL(wait)
    1380:	b8 03 00 00 00       	mov    $0x3,%eax
    1385:	cd 40                	int    $0x40
    1387:	c3                   	ret    

00001388 <pipe>:
SYSCALL(pipe)
    1388:	b8 04 00 00 00       	mov    $0x4,%eax
    138d:	cd 40                	int    $0x40
    138f:	c3                   	ret    

00001390 <read>:
SYSCALL(read)
    1390:	b8 05 00 00 00       	mov    $0x5,%eax
    1395:	cd 40                	int    $0x40
    1397:	c3                   	ret    

00001398 <write>:
SYSCALL(write)
    1398:	b8 10 00 00 00       	mov    $0x10,%eax
    139d:	cd 40                	int    $0x40
    139f:	c3                   	ret    

000013a0 <close>:
SYSCALL(close)
    13a0:	b8 15 00 00 00       	mov    $0x15,%eax
    13a5:	cd 40                	int    $0x40
    13a7:	c3                   	ret    

000013a8 <kill>:
SYSCALL(kill)
    13a8:	b8 06 00 00 00       	mov    $0x6,%eax
    13ad:	cd 40                	int    $0x40
    13af:	c3                   	ret    

000013b0 <exec>:
SYSCALL(exec)
    13b0:	b8 07 00 00 00       	mov    $0x7,%eax
    13b5:	cd 40                	int    $0x40
    13b7:	c3                   	ret    

000013b8 <open>:
SYSCALL(open)
    13b8:	b8 0f 00 00 00       	mov    $0xf,%eax
    13bd:	cd 40                	int    $0x40
    13bf:	c3                   	ret    

000013c0 <mknod>:
SYSCALL(mknod)
    13c0:	b8 11 00 00 00       	mov    $0x11,%eax
    13c5:	cd 40                	int    $0x40
    13c7:	c3                   	ret    

000013c8 <unlink>:
SYSCALL(unlink)
    13c8:	b8 12 00 00 00       	mov    $0x12,%eax
    13cd:	cd 40                	int    $0x40
    13cf:	c3                   	ret    

000013d0 <fstat>:
SYSCALL(fstat)
    13d0:	b8 08 00 00 00       	mov    $0x8,%eax
    13d5:	cd 40                	int    $0x40
    13d7:	c3                   	ret    

000013d8 <link>:
SYSCALL(link)
    13d8:	b8 13 00 00 00       	mov    $0x13,%eax
    13dd:	cd 40                	int    $0x40
    13df:	c3                   	ret    

000013e0 <mkdir>:
SYSCALL(mkdir)
    13e0:	b8 14 00 00 00       	mov    $0x14,%eax
    13e5:	cd 40                	int    $0x40
    13e7:	c3                   	ret    

000013e8 <chdir>:
SYSCALL(chdir)
    13e8:	b8 09 00 00 00       	mov    $0x9,%eax
    13ed:	cd 40                	int    $0x40
    13ef:	c3                   	ret    

000013f0 <dup>:
SYSCALL(dup)
    13f0:	b8 0a 00 00 00       	mov    $0xa,%eax
    13f5:	cd 40                	int    $0x40
    13f7:	c3                   	ret    

000013f8 <getpid>:
SYSCALL(getpid)
    13f8:	b8 0b 00 00 00       	mov    $0xb,%eax
    13fd:	cd 40                	int    $0x40
    13ff:	c3                   	ret    

00001400 <sbrk>:
SYSCALL(sbrk)
    1400:	b8 0c 00 00 00       	mov    $0xc,%eax
    1405:	cd 40                	int    $0x40
    1407:	c3                   	ret    

00001408 <sleep>:
SYSCALL(sleep)
    1408:	b8 0d 00 00 00       	mov    $0xd,%eax
    140d:	cd 40                	int    $0x40
    140f:	c3                   	ret    

00001410 <uptime>:
SYSCALL(uptime)
    1410:	b8 0e 00 00 00       	mov    $0xe,%eax
    1415:	cd 40                	int    $0x40
    1417:	c3                   	ret    

00001418 <clone>:
SYSCALL(clone)
    1418:	b8 16 00 00 00       	mov    $0x16,%eax
    141d:	cd 40                	int    $0x40
    141f:	c3                   	ret    

00001420 <texit>:
SYSCALL(texit)
    1420:	b8 17 00 00 00       	mov    $0x17,%eax
    1425:	cd 40                	int    $0x40
    1427:	c3                   	ret    

00001428 <tsleep>:
SYSCALL(tsleep)
    1428:	b8 18 00 00 00       	mov    $0x18,%eax
    142d:	cd 40                	int    $0x40
    142f:	c3                   	ret    

00001430 <twakeup>:
SYSCALL(twakeup)
    1430:	b8 19 00 00 00       	mov    $0x19,%eax
    1435:	cd 40                	int    $0x40
    1437:	c3                   	ret    

00001438 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
    1438:	55                   	push   %ebp
    1439:	89 e5                	mov    %esp,%ebp
    143b:	83 ec 18             	sub    $0x18,%esp
    143e:	8b 45 0c             	mov    0xc(%ebp),%eax
    1441:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
    1444:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    144b:	00 
    144c:	8d 45 f4             	lea    -0xc(%ebp),%eax
    144f:	89 44 24 04          	mov    %eax,0x4(%esp)
    1453:	8b 45 08             	mov    0x8(%ebp),%eax
    1456:	89 04 24             	mov    %eax,(%esp)
    1459:	e8 3a ff ff ff       	call   1398 <write>
}
    145e:	c9                   	leave  
    145f:	c3                   	ret    

00001460 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
    1460:	55                   	push   %ebp
    1461:	89 e5                	mov    %esp,%ebp
    1463:	56                   	push   %esi
    1464:	53                   	push   %ebx
    1465:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    1468:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
    146f:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
    1473:	74 17                	je     148c <printint+0x2c>
    1475:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    1479:	79 11                	jns    148c <printint+0x2c>
    neg = 1;
    147b:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
    1482:	8b 45 0c             	mov    0xc(%ebp),%eax
    1485:	f7 d8                	neg    %eax
    1487:	89 45 ec             	mov    %eax,-0x14(%ebp)
    148a:	eb 06                	jmp    1492 <printint+0x32>
  } else {
    x = xx;
    148c:	8b 45 0c             	mov    0xc(%ebp),%eax
    148f:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
    1492:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
    1499:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    149c:	8d 41 01             	lea    0x1(%ecx),%eax
    149f:	89 45 f4             	mov    %eax,-0xc(%ebp)
    14a2:	8b 5d 10             	mov    0x10(%ebp),%ebx
    14a5:	8b 45 ec             	mov    -0x14(%ebp),%eax
    14a8:	ba 00 00 00 00       	mov    $0x0,%edx
    14ad:	f7 f3                	div    %ebx
    14af:	89 d0                	mov    %edx,%eax
    14b1:	0f b6 80 c0 21 00 00 	movzbl 0x21c0(%eax),%eax
    14b8:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
    14bc:	8b 75 10             	mov    0x10(%ebp),%esi
    14bf:	8b 45 ec             	mov    -0x14(%ebp),%eax
    14c2:	ba 00 00 00 00       	mov    $0x0,%edx
    14c7:	f7 f6                	div    %esi
    14c9:	89 45 ec             	mov    %eax,-0x14(%ebp)
    14cc:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    14d0:	75 c7                	jne    1499 <printint+0x39>
  if(neg)
    14d2:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    14d6:	74 10                	je     14e8 <printint+0x88>
    buf[i++] = '-';
    14d8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    14db:	8d 50 01             	lea    0x1(%eax),%edx
    14de:	89 55 f4             	mov    %edx,-0xc(%ebp)
    14e1:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
    14e6:	eb 1f                	jmp    1507 <printint+0xa7>
    14e8:	eb 1d                	jmp    1507 <printint+0xa7>
    putc(fd, buf[i]);
    14ea:	8d 55 dc             	lea    -0x24(%ebp),%edx
    14ed:	8b 45 f4             	mov    -0xc(%ebp),%eax
    14f0:	01 d0                	add    %edx,%eax
    14f2:	0f b6 00             	movzbl (%eax),%eax
    14f5:	0f be c0             	movsbl %al,%eax
    14f8:	89 44 24 04          	mov    %eax,0x4(%esp)
    14fc:	8b 45 08             	mov    0x8(%ebp),%eax
    14ff:	89 04 24             	mov    %eax,(%esp)
    1502:	e8 31 ff ff ff       	call   1438 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    1507:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    150b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    150f:	79 d9                	jns    14ea <printint+0x8a>
    putc(fd, buf[i]);
}
    1511:	83 c4 30             	add    $0x30,%esp
    1514:	5b                   	pop    %ebx
    1515:	5e                   	pop    %esi
    1516:	5d                   	pop    %ebp
    1517:	c3                   	ret    

00001518 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    1518:	55                   	push   %ebp
    1519:	89 e5                	mov    %esp,%ebp
    151b:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
    151e:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
    1525:	8d 45 0c             	lea    0xc(%ebp),%eax
    1528:	83 c0 04             	add    $0x4,%eax
    152b:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
    152e:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    1535:	e9 7c 01 00 00       	jmp    16b6 <printf+0x19e>
    c = fmt[i] & 0xff;
    153a:	8b 55 0c             	mov    0xc(%ebp),%edx
    153d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1540:	01 d0                	add    %edx,%eax
    1542:	0f b6 00             	movzbl (%eax),%eax
    1545:	0f be c0             	movsbl %al,%eax
    1548:	25 ff 00 00 00       	and    $0xff,%eax
    154d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
    1550:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1554:	75 2c                	jne    1582 <printf+0x6a>
      if(c == '%'){
    1556:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    155a:	75 0c                	jne    1568 <printf+0x50>
        state = '%';
    155c:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
    1563:	e9 4a 01 00 00       	jmp    16b2 <printf+0x19a>
      } else {
        putc(fd, c);
    1568:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    156b:	0f be c0             	movsbl %al,%eax
    156e:	89 44 24 04          	mov    %eax,0x4(%esp)
    1572:	8b 45 08             	mov    0x8(%ebp),%eax
    1575:	89 04 24             	mov    %eax,(%esp)
    1578:	e8 bb fe ff ff       	call   1438 <putc>
    157d:	e9 30 01 00 00       	jmp    16b2 <printf+0x19a>
      }
    } else if(state == '%'){
    1582:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
    1586:	0f 85 26 01 00 00    	jne    16b2 <printf+0x19a>
      if(c == 'd'){
    158c:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
    1590:	75 2d                	jne    15bf <printf+0xa7>
        printint(fd, *ap, 10, 1);
    1592:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1595:	8b 00                	mov    (%eax),%eax
    1597:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    159e:	00 
    159f:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
    15a6:	00 
    15a7:	89 44 24 04          	mov    %eax,0x4(%esp)
    15ab:	8b 45 08             	mov    0x8(%ebp),%eax
    15ae:	89 04 24             	mov    %eax,(%esp)
    15b1:	e8 aa fe ff ff       	call   1460 <printint>
        ap++;
    15b6:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    15ba:	e9 ec 00 00 00       	jmp    16ab <printf+0x193>
      } else if(c == 'x' || c == 'p'){
    15bf:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
    15c3:	74 06                	je     15cb <printf+0xb3>
    15c5:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
    15c9:	75 2d                	jne    15f8 <printf+0xe0>
        printint(fd, *ap, 16, 0);
    15cb:	8b 45 e8             	mov    -0x18(%ebp),%eax
    15ce:	8b 00                	mov    (%eax),%eax
    15d0:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    15d7:	00 
    15d8:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
    15df:	00 
    15e0:	89 44 24 04          	mov    %eax,0x4(%esp)
    15e4:	8b 45 08             	mov    0x8(%ebp),%eax
    15e7:	89 04 24             	mov    %eax,(%esp)
    15ea:	e8 71 fe ff ff       	call   1460 <printint>
        ap++;
    15ef:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    15f3:	e9 b3 00 00 00       	jmp    16ab <printf+0x193>
      } else if(c == 's'){
    15f8:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
    15fc:	75 45                	jne    1643 <printf+0x12b>
        s = (char*)*ap;
    15fe:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1601:	8b 00                	mov    (%eax),%eax
    1603:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
    1606:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
    160a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    160e:	75 09                	jne    1619 <printf+0x101>
          s = "(null)";
    1610:	c7 45 f4 61 1d 00 00 	movl   $0x1d61,-0xc(%ebp)
        while(*s != 0){
    1617:	eb 1e                	jmp    1637 <printf+0x11f>
    1619:	eb 1c                	jmp    1637 <printf+0x11f>
          putc(fd, *s);
    161b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    161e:	0f b6 00             	movzbl (%eax),%eax
    1621:	0f be c0             	movsbl %al,%eax
    1624:	89 44 24 04          	mov    %eax,0x4(%esp)
    1628:	8b 45 08             	mov    0x8(%ebp),%eax
    162b:	89 04 24             	mov    %eax,(%esp)
    162e:	e8 05 fe ff ff       	call   1438 <putc>
          s++;
    1633:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    1637:	8b 45 f4             	mov    -0xc(%ebp),%eax
    163a:	0f b6 00             	movzbl (%eax),%eax
    163d:	84 c0                	test   %al,%al
    163f:	75 da                	jne    161b <printf+0x103>
    1641:	eb 68                	jmp    16ab <printf+0x193>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    1643:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
    1647:	75 1d                	jne    1666 <printf+0x14e>
        putc(fd, *ap);
    1649:	8b 45 e8             	mov    -0x18(%ebp),%eax
    164c:	8b 00                	mov    (%eax),%eax
    164e:	0f be c0             	movsbl %al,%eax
    1651:	89 44 24 04          	mov    %eax,0x4(%esp)
    1655:	8b 45 08             	mov    0x8(%ebp),%eax
    1658:	89 04 24             	mov    %eax,(%esp)
    165b:	e8 d8 fd ff ff       	call   1438 <putc>
        ap++;
    1660:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    1664:	eb 45                	jmp    16ab <printf+0x193>
      } else if(c == '%'){
    1666:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    166a:	75 17                	jne    1683 <printf+0x16b>
        putc(fd, c);
    166c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    166f:	0f be c0             	movsbl %al,%eax
    1672:	89 44 24 04          	mov    %eax,0x4(%esp)
    1676:	8b 45 08             	mov    0x8(%ebp),%eax
    1679:	89 04 24             	mov    %eax,(%esp)
    167c:	e8 b7 fd ff ff       	call   1438 <putc>
    1681:	eb 28                	jmp    16ab <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
    1683:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
    168a:	00 
    168b:	8b 45 08             	mov    0x8(%ebp),%eax
    168e:	89 04 24             	mov    %eax,(%esp)
    1691:	e8 a2 fd ff ff       	call   1438 <putc>
        putc(fd, c);
    1696:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1699:	0f be c0             	movsbl %al,%eax
    169c:	89 44 24 04          	mov    %eax,0x4(%esp)
    16a0:	8b 45 08             	mov    0x8(%ebp),%eax
    16a3:	89 04 24             	mov    %eax,(%esp)
    16a6:	e8 8d fd ff ff       	call   1438 <putc>
      }
      state = 0;
    16ab:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    16b2:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    16b6:	8b 55 0c             	mov    0xc(%ebp),%edx
    16b9:	8b 45 f0             	mov    -0x10(%ebp),%eax
    16bc:	01 d0                	add    %edx,%eax
    16be:	0f b6 00             	movzbl (%eax),%eax
    16c1:	84 c0                	test   %al,%al
    16c3:	0f 85 71 fe ff ff    	jne    153a <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    16c9:	c9                   	leave  
    16ca:	c3                   	ret    
    16cb:	90                   	nop

000016cc <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    16cc:	55                   	push   %ebp
    16cd:	89 e5                	mov    %esp,%ebp
    16cf:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
    16d2:	8b 45 08             	mov    0x8(%ebp),%eax
    16d5:	83 e8 08             	sub    $0x8,%eax
    16d8:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    16db:	a1 e0 21 00 00       	mov    0x21e0,%eax
    16e0:	89 45 fc             	mov    %eax,-0x4(%ebp)
    16e3:	eb 24                	jmp    1709 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    16e5:	8b 45 fc             	mov    -0x4(%ebp),%eax
    16e8:	8b 00                	mov    (%eax),%eax
    16ea:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    16ed:	77 12                	ja     1701 <free+0x35>
    16ef:	8b 45 f8             	mov    -0x8(%ebp),%eax
    16f2:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    16f5:	77 24                	ja     171b <free+0x4f>
    16f7:	8b 45 fc             	mov    -0x4(%ebp),%eax
    16fa:	8b 00                	mov    (%eax),%eax
    16fc:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    16ff:	77 1a                	ja     171b <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1701:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1704:	8b 00                	mov    (%eax),%eax
    1706:	89 45 fc             	mov    %eax,-0x4(%ebp)
    1709:	8b 45 f8             	mov    -0x8(%ebp),%eax
    170c:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    170f:	76 d4                	jbe    16e5 <free+0x19>
    1711:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1714:	8b 00                	mov    (%eax),%eax
    1716:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    1719:	76 ca                	jbe    16e5 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    171b:	8b 45 f8             	mov    -0x8(%ebp),%eax
    171e:	8b 40 04             	mov    0x4(%eax),%eax
    1721:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    1728:	8b 45 f8             	mov    -0x8(%ebp),%eax
    172b:	01 c2                	add    %eax,%edx
    172d:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1730:	8b 00                	mov    (%eax),%eax
    1732:	39 c2                	cmp    %eax,%edx
    1734:	75 24                	jne    175a <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
    1736:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1739:	8b 50 04             	mov    0x4(%eax),%edx
    173c:	8b 45 fc             	mov    -0x4(%ebp),%eax
    173f:	8b 00                	mov    (%eax),%eax
    1741:	8b 40 04             	mov    0x4(%eax),%eax
    1744:	01 c2                	add    %eax,%edx
    1746:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1749:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
    174c:	8b 45 fc             	mov    -0x4(%ebp),%eax
    174f:	8b 00                	mov    (%eax),%eax
    1751:	8b 10                	mov    (%eax),%edx
    1753:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1756:	89 10                	mov    %edx,(%eax)
    1758:	eb 0a                	jmp    1764 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
    175a:	8b 45 fc             	mov    -0x4(%ebp),%eax
    175d:	8b 10                	mov    (%eax),%edx
    175f:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1762:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
    1764:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1767:	8b 40 04             	mov    0x4(%eax),%eax
    176a:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    1771:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1774:	01 d0                	add    %edx,%eax
    1776:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    1779:	75 20                	jne    179b <free+0xcf>
    p->s.size += bp->s.size;
    177b:	8b 45 fc             	mov    -0x4(%ebp),%eax
    177e:	8b 50 04             	mov    0x4(%eax),%edx
    1781:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1784:	8b 40 04             	mov    0x4(%eax),%eax
    1787:	01 c2                	add    %eax,%edx
    1789:	8b 45 fc             	mov    -0x4(%ebp),%eax
    178c:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    178f:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1792:	8b 10                	mov    (%eax),%edx
    1794:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1797:	89 10                	mov    %edx,(%eax)
    1799:	eb 08                	jmp    17a3 <free+0xd7>
  } else
    p->s.ptr = bp;
    179b:	8b 45 fc             	mov    -0x4(%ebp),%eax
    179e:	8b 55 f8             	mov    -0x8(%ebp),%edx
    17a1:	89 10                	mov    %edx,(%eax)
  freep = p;
    17a3:	8b 45 fc             	mov    -0x4(%ebp),%eax
    17a6:	a3 e0 21 00 00       	mov    %eax,0x21e0
}
    17ab:	c9                   	leave  
    17ac:	c3                   	ret    

000017ad <morecore>:

static Header*
morecore(uint nu)
{
    17ad:	55                   	push   %ebp
    17ae:	89 e5                	mov    %esp,%ebp
    17b0:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
    17b3:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
    17ba:	77 07                	ja     17c3 <morecore+0x16>
    nu = 4096;
    17bc:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
    17c3:	8b 45 08             	mov    0x8(%ebp),%eax
    17c6:	c1 e0 03             	shl    $0x3,%eax
    17c9:	89 04 24             	mov    %eax,(%esp)
    17cc:	e8 2f fc ff ff       	call   1400 <sbrk>
    17d1:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
    17d4:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
    17d8:	75 07                	jne    17e1 <morecore+0x34>
    return 0;
    17da:	b8 00 00 00 00       	mov    $0x0,%eax
    17df:	eb 22                	jmp    1803 <morecore+0x56>
  hp = (Header*)p;
    17e1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    17e4:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
    17e7:	8b 45 f0             	mov    -0x10(%ebp),%eax
    17ea:	8b 55 08             	mov    0x8(%ebp),%edx
    17ed:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
    17f0:	8b 45 f0             	mov    -0x10(%ebp),%eax
    17f3:	83 c0 08             	add    $0x8,%eax
    17f6:	89 04 24             	mov    %eax,(%esp)
    17f9:	e8 ce fe ff ff       	call   16cc <free>
  return freep;
    17fe:	a1 e0 21 00 00       	mov    0x21e0,%eax
}
    1803:	c9                   	leave  
    1804:	c3                   	ret    

00001805 <malloc>:

void*
malloc(uint nbytes)
{
    1805:	55                   	push   %ebp
    1806:	89 e5                	mov    %esp,%ebp
    1808:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    180b:	8b 45 08             	mov    0x8(%ebp),%eax
    180e:	83 c0 07             	add    $0x7,%eax
    1811:	c1 e8 03             	shr    $0x3,%eax
    1814:	83 c0 01             	add    $0x1,%eax
    1817:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
    181a:	a1 e0 21 00 00       	mov    0x21e0,%eax
    181f:	89 45 f0             	mov    %eax,-0x10(%ebp)
    1822:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1826:	75 23                	jne    184b <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
    1828:	c7 45 f0 d8 21 00 00 	movl   $0x21d8,-0x10(%ebp)
    182f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1832:	a3 e0 21 00 00       	mov    %eax,0x21e0
    1837:	a1 e0 21 00 00       	mov    0x21e0,%eax
    183c:	a3 d8 21 00 00       	mov    %eax,0x21d8
    base.s.size = 0;
    1841:	c7 05 dc 21 00 00 00 	movl   $0x0,0x21dc
    1848:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    184b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    184e:	8b 00                	mov    (%eax),%eax
    1850:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
    1853:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1856:	8b 40 04             	mov    0x4(%eax),%eax
    1859:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    185c:	72 4d                	jb     18ab <malloc+0xa6>
      if(p->s.size == nunits)
    185e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1861:	8b 40 04             	mov    0x4(%eax),%eax
    1864:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    1867:	75 0c                	jne    1875 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
    1869:	8b 45 f4             	mov    -0xc(%ebp),%eax
    186c:	8b 10                	mov    (%eax),%edx
    186e:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1871:	89 10                	mov    %edx,(%eax)
    1873:	eb 26                	jmp    189b <malloc+0x96>
      else {
        p->s.size -= nunits;
    1875:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1878:	8b 40 04             	mov    0x4(%eax),%eax
    187b:	2b 45 ec             	sub    -0x14(%ebp),%eax
    187e:	89 c2                	mov    %eax,%edx
    1880:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1883:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
    1886:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1889:	8b 40 04             	mov    0x4(%eax),%eax
    188c:	c1 e0 03             	shl    $0x3,%eax
    188f:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
    1892:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1895:	8b 55 ec             	mov    -0x14(%ebp),%edx
    1898:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
    189b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    189e:	a3 e0 21 00 00       	mov    %eax,0x21e0
      return (void*)(p + 1);
    18a3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    18a6:	83 c0 08             	add    $0x8,%eax
    18a9:	eb 38                	jmp    18e3 <malloc+0xde>
    }
    if(p == freep)
    18ab:	a1 e0 21 00 00       	mov    0x21e0,%eax
    18b0:	39 45 f4             	cmp    %eax,-0xc(%ebp)
    18b3:	75 1b                	jne    18d0 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
    18b5:	8b 45 ec             	mov    -0x14(%ebp),%eax
    18b8:	89 04 24             	mov    %eax,(%esp)
    18bb:	e8 ed fe ff ff       	call   17ad <morecore>
    18c0:	89 45 f4             	mov    %eax,-0xc(%ebp)
    18c3:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    18c7:	75 07                	jne    18d0 <malloc+0xcb>
        return 0;
    18c9:	b8 00 00 00 00       	mov    $0x0,%eax
    18ce:	eb 13                	jmp    18e3 <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    18d0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    18d3:	89 45 f0             	mov    %eax,-0x10(%ebp)
    18d6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    18d9:	8b 00                	mov    (%eax),%eax
    18db:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
    18de:	e9 70 ff ff ff       	jmp    1853 <malloc+0x4e>
}
    18e3:	c9                   	leave  
    18e4:	c3                   	ret    
    18e5:	66 90                	xchg   %ax,%ax
    18e7:	90                   	nop

000018e8 <xchg>:
  asm volatile("sti");
}

static inline uint
xchg(volatile uint *addr, uint newval)
{
    18e8:	55                   	push   %ebp
    18e9:	89 e5                	mov    %esp,%ebp
    18eb:	83 ec 10             	sub    $0x10,%esp
  uint result;
  
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
    18ee:	8b 55 08             	mov    0x8(%ebp),%edx
    18f1:	8b 45 0c             	mov    0xc(%ebp),%eax
    18f4:	8b 4d 08             	mov    0x8(%ebp),%ecx
    18f7:	f0 87 02             	lock xchg %eax,(%edx)
    18fa:	89 45 fc             	mov    %eax,-0x4(%ebp)
               "+m" (*addr), "=a" (result) :
               "1" (newval) :
               "cc");
  return result;
    18fd:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    1900:	c9                   	leave  
    1901:	c3                   	ret    

00001902 <lock_init>:
#include "x86.h"
#include "proc.h"

unsigned long rands = 1;

void lock_init(lock_t *lock){
    1902:	55                   	push   %ebp
    1903:	89 e5                	mov    %esp,%ebp
    lock->locked = 0;
    1905:	8b 45 08             	mov    0x8(%ebp),%eax
    1908:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
    190e:	5d                   	pop    %ebp
    190f:	c3                   	ret    

00001910 <lock_acquire>:
void lock_acquire(lock_t *lock){
    1910:	55                   	push   %ebp
    1911:	89 e5                	mov    %esp,%ebp
    1913:	83 ec 08             	sub    $0x8,%esp
    while(xchg(&lock->locked,1) != 0);
    1916:	90                   	nop
    1917:	8b 45 08             	mov    0x8(%ebp),%eax
    191a:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
    1921:	00 
    1922:	89 04 24             	mov    %eax,(%esp)
    1925:	e8 be ff ff ff       	call   18e8 <xchg>
    192a:	85 c0                	test   %eax,%eax
    192c:	75 e9                	jne    1917 <lock_acquire+0x7>
}
    192e:	c9                   	leave  
    192f:	c3                   	ret    

00001930 <lock_release>:
void lock_release(lock_t *lock){
    1930:	55                   	push   %ebp
    1931:	89 e5                	mov    %esp,%ebp
    1933:	83 ec 08             	sub    $0x8,%esp
    xchg(&lock->locked,0);
    1936:	8b 45 08             	mov    0x8(%ebp),%eax
    1939:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1940:	00 
    1941:	89 04 24             	mov    %eax,(%esp)
    1944:	e8 9f ff ff ff       	call   18e8 <xchg>
}
    1949:	c9                   	leave  
    194a:	c3                   	ret    

0000194b <thread_create>:


void *thread_create(void(*start_routine)(void*), void *arg){
    194b:	55                   	push   %ebp
    194c:	89 e5                	mov    %esp,%ebp
    194e:	83 ec 28             	sub    $0x28,%esp
    int tid;
    void * stack = malloc(2 * 4096);
    1951:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
    1958:	e8 a8 fe ff ff       	call   1805 <malloc>
    195d:	89 45 f4             	mov    %eax,-0xc(%ebp)
    void *garbage_stack = stack; 
    1960:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1963:	89 45 f0             	mov    %eax,-0x10(%ebp)
   // printf(1,"start routine addr : %d\n",(uint)start_routine);


    if((uint)stack % 4096){
    1966:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1969:	25 ff 0f 00 00       	and    $0xfff,%eax
    196e:	85 c0                	test   %eax,%eax
    1970:	74 14                	je     1986 <thread_create+0x3b>
        stack = stack + (4096 - (uint)stack % 4096);
    1972:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1975:	25 ff 0f 00 00       	and    $0xfff,%eax
    197a:	89 c2                	mov    %eax,%edx
    197c:	b8 00 10 00 00       	mov    $0x1000,%eax
    1981:	29 d0                	sub    %edx,%eax
    1983:	01 45 f4             	add    %eax,-0xc(%ebp)
    }
    if (stack == 0){
    1986:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    198a:	75 1b                	jne    19a7 <thread_create+0x5c>

        printf(1,"malloc fail \n");
    198c:	c7 44 24 04 68 1d 00 	movl   $0x1d68,0x4(%esp)
    1993:	00 
    1994:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    199b:	e8 78 fb ff ff       	call   1518 <printf>
        return 0;
    19a0:	b8 00 00 00 00       	mov    $0x0,%eax
    19a5:	eb 6f                	jmp    1a16 <thread_create+0xcb>
    }

    tid = clone((uint)stack,PSIZE,(uint)start_routine,(int)arg);
    19a7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    19aa:	8b 55 08             	mov    0x8(%ebp),%edx
    19ad:	8b 45 f4             	mov    -0xc(%ebp),%eax
    19b0:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
    19b4:	89 54 24 08          	mov    %edx,0x8(%esp)
    19b8:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
    19bf:	00 
    19c0:	89 04 24             	mov    %eax,(%esp)
    19c3:	e8 50 fa ff ff       	call   1418 <clone>
    19c8:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(tid < 0){
    19cb:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    19cf:	79 1b                	jns    19ec <thread_create+0xa1>
        printf(1,"clone fails\n");
    19d1:	c7 44 24 04 76 1d 00 	movl   $0x1d76,0x4(%esp)
    19d8:	00 
    19d9:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    19e0:	e8 33 fb ff ff       	call   1518 <printf>
        return 0;
    19e5:	b8 00 00 00 00       	mov    $0x0,%eax
    19ea:	eb 2a                	jmp    1a16 <thread_create+0xcb>
    }
    if(tid > 0){
    19ec:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    19f0:	7e 05                	jle    19f7 <thread_create+0xac>
        //store threads on thread table
        return garbage_stack;
    19f2:	8b 45 f0             	mov    -0x10(%ebp),%eax
    19f5:	eb 1f                	jmp    1a16 <thread_create+0xcb>
    }
    if(tid == 0){
    19f7:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    19fb:	75 14                	jne    1a11 <thread_create+0xc6>
        printf(1,"tid = 0 return \n");
    19fd:	c7 44 24 04 83 1d 00 	movl   $0x1d83,0x4(%esp)
    1a04:	00 
    1a05:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1a0c:	e8 07 fb ff ff       	call   1518 <printf>
    }
//    wait();
//    free(garbage_stack);

    return 0;
    1a11:	b8 00 00 00 00       	mov    $0x0,%eax
}
    1a16:	c9                   	leave  
    1a17:	c3                   	ret    

00001a18 <random>:

// generate 0 -> max random number exclude max.
int random(int max){
    1a18:	55                   	push   %ebp
    1a19:	89 e5                	mov    %esp,%ebp
    rands = rands * 1664525 + 1013904233;
    1a1b:	a1 d4 21 00 00       	mov    0x21d4,%eax
    1a20:	69 c0 0d 66 19 00    	imul   $0x19660d,%eax,%eax
    1a26:	05 69 f3 6e 3c       	add    $0x3c6ef369,%eax
    1a2b:	a3 d4 21 00 00       	mov    %eax,0x21d4
    return (int)(rands % max);
    1a30:	a1 d4 21 00 00       	mov    0x21d4,%eax
    1a35:	8b 4d 08             	mov    0x8(%ebp),%ecx
    1a38:	ba 00 00 00 00       	mov    $0x0,%edx
    1a3d:	f7 f1                	div    %ecx
    1a3f:	89 d0                	mov    %edx,%eax
}
    1a41:	5d                   	pop    %ebp
    1a42:	c3                   	ret    
    1a43:	90                   	nop

00001a44 <init_q>:
#include "queue.h"
#include "types.h"
#include "user.h"

void init_q(struct queue *q){
    1a44:	55                   	push   %ebp
    1a45:	89 e5                	mov    %esp,%ebp
    q->size = 0;
    1a47:	8b 45 08             	mov    0x8(%ebp),%eax
    1a4a:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    q->head = 0;
    1a50:	8b 45 08             	mov    0x8(%ebp),%eax
    1a53:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    q->tail = 0;
    1a5a:	8b 45 08             	mov    0x8(%ebp),%eax
    1a5d:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
}
    1a64:	5d                   	pop    %ebp
    1a65:	c3                   	ret    

00001a66 <add_q>:

void add_q(struct queue *q, int v){
    1a66:	55                   	push   %ebp
    1a67:	89 e5                	mov    %esp,%ebp
    1a69:	83 ec 28             	sub    $0x28,%esp
    struct node * n = malloc(sizeof(struct node));
    1a6c:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
    1a73:	e8 8d fd ff ff       	call   1805 <malloc>
    1a78:	89 45 f4             	mov    %eax,-0xc(%ebp)
    n->next = 0;
    1a7b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1a7e:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    n->value = v;
    1a85:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1a88:	8b 55 0c             	mov    0xc(%ebp),%edx
    1a8b:	89 10                	mov    %edx,(%eax)
    if(q->head == 0){
    1a8d:	8b 45 08             	mov    0x8(%ebp),%eax
    1a90:	8b 40 04             	mov    0x4(%eax),%eax
    1a93:	85 c0                	test   %eax,%eax
    1a95:	75 0b                	jne    1aa2 <add_q+0x3c>
        q->head = n;
    1a97:	8b 45 08             	mov    0x8(%ebp),%eax
    1a9a:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1a9d:	89 50 04             	mov    %edx,0x4(%eax)
    1aa0:	eb 0c                	jmp    1aae <add_q+0x48>
    }else{
        q->tail->next = n;
    1aa2:	8b 45 08             	mov    0x8(%ebp),%eax
    1aa5:	8b 40 08             	mov    0x8(%eax),%eax
    1aa8:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1aab:	89 50 04             	mov    %edx,0x4(%eax)
    }
    q->tail = n;
    1aae:	8b 45 08             	mov    0x8(%ebp),%eax
    1ab1:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1ab4:	89 50 08             	mov    %edx,0x8(%eax)
    q->size++;
    1ab7:	8b 45 08             	mov    0x8(%ebp),%eax
    1aba:	8b 00                	mov    (%eax),%eax
    1abc:	8d 50 01             	lea    0x1(%eax),%edx
    1abf:	8b 45 08             	mov    0x8(%ebp),%eax
    1ac2:	89 10                	mov    %edx,(%eax)
}
    1ac4:	c9                   	leave  
    1ac5:	c3                   	ret    

00001ac6 <empty_q>:

int empty_q(struct queue *q){
    1ac6:	55                   	push   %ebp
    1ac7:	89 e5                	mov    %esp,%ebp
    if(q->size == 0)
    1ac9:	8b 45 08             	mov    0x8(%ebp),%eax
    1acc:	8b 00                	mov    (%eax),%eax
    1ace:	85 c0                	test   %eax,%eax
    1ad0:	75 07                	jne    1ad9 <empty_q+0x13>
        return 1;
    1ad2:	b8 01 00 00 00       	mov    $0x1,%eax
    1ad7:	eb 05                	jmp    1ade <empty_q+0x18>
    else
        return 0;
    1ad9:	b8 00 00 00 00       	mov    $0x0,%eax
} 
    1ade:	5d                   	pop    %ebp
    1adf:	c3                   	ret    

00001ae0 <pop_q>:
int pop_q(struct queue *q){
    1ae0:	55                   	push   %ebp
    1ae1:	89 e5                	mov    %esp,%ebp
    1ae3:	83 ec 28             	sub    $0x28,%esp
    int val;
    struct node *destroy;
    if(!empty_q(q)){
    1ae6:	8b 45 08             	mov    0x8(%ebp),%eax
    1ae9:	89 04 24             	mov    %eax,(%esp)
    1aec:	e8 d5 ff ff ff       	call   1ac6 <empty_q>
    1af1:	85 c0                	test   %eax,%eax
    1af3:	75 5d                	jne    1b52 <pop_q+0x72>
       val = q->head->value; 
    1af5:	8b 45 08             	mov    0x8(%ebp),%eax
    1af8:	8b 40 04             	mov    0x4(%eax),%eax
    1afb:	8b 00                	mov    (%eax),%eax
    1afd:	89 45 f4             	mov    %eax,-0xc(%ebp)
       destroy = q->head;
    1b00:	8b 45 08             	mov    0x8(%ebp),%eax
    1b03:	8b 40 04             	mov    0x4(%eax),%eax
    1b06:	89 45 f0             	mov    %eax,-0x10(%ebp)
       q->head = q->head->next;
    1b09:	8b 45 08             	mov    0x8(%ebp),%eax
    1b0c:	8b 40 04             	mov    0x4(%eax),%eax
    1b0f:	8b 50 04             	mov    0x4(%eax),%edx
    1b12:	8b 45 08             	mov    0x8(%ebp),%eax
    1b15:	89 50 04             	mov    %edx,0x4(%eax)
       free(destroy);
    1b18:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1b1b:	89 04 24             	mov    %eax,(%esp)
    1b1e:	e8 a9 fb ff ff       	call   16cc <free>
       q->size--;
    1b23:	8b 45 08             	mov    0x8(%ebp),%eax
    1b26:	8b 00                	mov    (%eax),%eax
    1b28:	8d 50 ff             	lea    -0x1(%eax),%edx
    1b2b:	8b 45 08             	mov    0x8(%ebp),%eax
    1b2e:	89 10                	mov    %edx,(%eax)
       if(q->size == 0){
    1b30:	8b 45 08             	mov    0x8(%ebp),%eax
    1b33:	8b 00                	mov    (%eax),%eax
    1b35:	85 c0                	test   %eax,%eax
    1b37:	75 14                	jne    1b4d <pop_q+0x6d>
            q->head = 0;
    1b39:	8b 45 08             	mov    0x8(%ebp),%eax
    1b3c:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
            q->tail = 0;
    1b43:	8b 45 08             	mov    0x8(%ebp),%eax
    1b46:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
       }
       return val;
    1b4d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1b50:	eb 05                	jmp    1b57 <pop_q+0x77>
    }
    return -1;
    1b52:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
    1b57:	c9                   	leave  
    1b58:	c3                   	ret    

00001b59 <dominant>:

void dominant(struct queue* q, int i){
    1b59:	55                   	push   %ebp
    1b5a:	89 e5                	mov    %esp,%ebp
    1b5c:	83 ec 28             	sub    $0x28,%esp
    struct node * n = malloc(sizeof(struct node));
    1b5f:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
    1b66:	e8 9a fc ff ff       	call   1805 <malloc>
    1b6b:	89 45 f4             	mov    %eax,-0xc(%ebp)
    n->value = i;
    1b6e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1b71:	8b 55 0c             	mov    0xc(%ebp),%edx
    1b74:	89 10                	mov    %edx,(%eax)

    if(q->head == 0){
    1b76:	8b 45 08             	mov    0x8(%ebp),%eax
    1b79:	8b 40 04             	mov    0x4(%eax),%eax
    1b7c:	85 c0                	test   %eax,%eax
    1b7e:	75 14                	jne    1b94 <dominant+0x3b>
        q->head = n;
    1b80:	8b 45 08             	mov    0x8(%ebp),%eax
    1b83:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1b86:	89 50 04             	mov    %edx,0x4(%eax)
        q->tail = n;
    1b89:	8b 45 08             	mov    0x8(%ebp),%eax
    1b8c:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1b8f:	89 50 08             	mov    %edx,0x8(%eax)
    1b92:	eb 15                	jmp    1ba9 <dominant+0x50>
    }
    else{
        n->next = q->head;
    1b94:	8b 45 08             	mov    0x8(%ebp),%eax
    1b97:	8b 50 04             	mov    0x4(%eax),%edx
    1b9a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1b9d:	89 50 04             	mov    %edx,0x4(%eax)
        q->head = n;
    1ba0:	8b 45 08             	mov    0x8(%ebp),%eax
    1ba3:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1ba6:	89 50 04             	mov    %edx,0x4(%eax)
    }
    q->size++;
    1ba9:	8b 45 08             	mov    0x8(%ebp),%eax
    1bac:	8b 00                	mov    (%eax),%eax
    1bae:	8d 50 01             	lea    0x1(%eax),%edx
    1bb1:	8b 45 08             	mov    0x8(%ebp),%eax
    1bb4:	89 10                	mov    %edx,(%eax)
}
    1bb6:	c9                   	leave  
    1bb7:	c3                   	ret    

00001bb8 <sem_init>:
#include "semaphore.h"
#include "user.h"

// Initializes the semaphore
void sem_init(struct Semaphore* s, int value){
    1bb8:	55                   	push   %ebp
    1bb9:	89 e5                	mov    %esp,%ebp
    1bbb:	83 ec 18             	sub    $0x18,%esp
    s->val = value;
    1bbe:	8b 45 08             	mov    0x8(%ebp),%eax
    1bc1:	8b 55 0c             	mov    0xc(%ebp),%edx
    1bc4:	89 10                	mov    %edx,(%eax)
    lock_init(&s->lock);
    1bc6:	8b 45 08             	mov    0x8(%ebp),%eax
    1bc9:	83 c0 04             	add    $0x4,%eax
    1bcc:	89 04 24             	mov    %eax,(%esp)
    1bcf:	e8 2e fd ff ff       	call   1902 <lock_init>
    init_q(&s->q);
    1bd4:	8b 45 08             	mov    0x8(%ebp),%eax
    1bd7:	83 c0 08             	add    $0x8,%eax
    1bda:	89 04 24             	mov    %eax,(%esp)
    1bdd:	e8 62 fe ff ff       	call   1a44 <init_q>
}
    1be2:	c9                   	leave  
    1be3:	c3                   	ret    

00001be4 <sem_acquire>:

// Decrements the semaphore
void sem_acquire(struct Semaphore* s){
    1be4:	55                   	push   %ebp
    1be5:	89 e5                	mov    %esp,%ebp
    1be7:	83 ec 28             	sub    $0x28,%esp
    lock_acquire(&s->lock);
    1bea:	8b 45 08             	mov    0x8(%ebp),%eax
    1bed:	83 c0 04             	add    $0x4,%eax
    1bf0:	89 04 24             	mov    %eax,(%esp)
    1bf3:	e8 18 fd ff ff       	call   1910 <lock_acquire>

    if(s->val == 0){
    1bf8:	8b 45 08             	mov    0x8(%ebp),%eax
    1bfb:	8b 00                	mov    (%eax),%eax
    1bfd:	85 c0                	test   %eax,%eax
    1bff:	75 32                	jne    1c33 <sem_acquire+0x4f>
        int pid;
        pid = getpid();
    1c01:	e8 f2 f7 ff ff       	call   13f8 <getpid>
    1c06:	89 45 f4             	mov    %eax,-0xc(%ebp)
        add_q(&s->q, pid);
    1c09:	8b 45 08             	mov    0x8(%ebp),%eax
    1c0c:	8d 50 08             	lea    0x8(%eax),%edx
    1c0f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1c12:	89 44 24 04          	mov    %eax,0x4(%esp)
    1c16:	89 14 24             	mov    %edx,(%esp)
    1c19:	e8 48 fe ff ff       	call   1a66 <add_q>
        lock_release(&s->lock);
    1c1e:	8b 45 08             	mov    0x8(%ebp),%eax
    1c21:	83 c0 04             	add    $0x4,%eax
    1c24:	89 04 24             	mov    %eax,(%esp)
    1c27:	e8 04 fd ff ff       	call   1930 <lock_release>
        tsleep();
    1c2c:	e8 f7 f7 ff ff       	call   1428 <tsleep>
    1c31:	eb 1b                	jmp    1c4e <sem_acquire+0x6a>
    }
    else{
        s->val--;
    1c33:	8b 45 08             	mov    0x8(%ebp),%eax
    1c36:	8b 00                	mov    (%eax),%eax
    1c38:	8d 50 ff             	lea    -0x1(%eax),%edx
    1c3b:	8b 45 08             	mov    0x8(%ebp),%eax
    1c3e:	89 10                	mov    %edx,(%eax)
        lock_release(&s->lock);
    1c40:	8b 45 08             	mov    0x8(%ebp),%eax
    1c43:	83 c0 04             	add    $0x4,%eax
    1c46:	89 04 24             	mov    %eax,(%esp)
    1c49:	e8 e2 fc ff ff       	call   1930 <lock_release>
    }
}
    1c4e:	c9                   	leave  
    1c4f:	c3                   	ret    

00001c50 <sem_signal>:

// Increments the semaphore
void sem_signal(struct Semaphore* s){
    1c50:	55                   	push   %ebp
    1c51:	89 e5                	mov    %esp,%ebp
    1c53:	83 ec 18             	sub    $0x18,%esp
    lock_acquire(&s->lock);
    1c56:	8b 45 08             	mov    0x8(%ebp),%eax
    1c59:	83 c0 04             	add    $0x4,%eax
    1c5c:	89 04 24             	mov    %eax,(%esp)
    1c5f:	e8 ac fc ff ff       	call   1910 <lock_acquire>

    if(!empty_q(&s->q)){
    1c64:	8b 45 08             	mov    0x8(%ebp),%eax
    1c67:	83 c0 08             	add    $0x8,%eax
    1c6a:	89 04 24             	mov    %eax,(%esp)
    1c6d:	e8 54 fe ff ff       	call   1ac6 <empty_q>
    1c72:	85 c0                	test   %eax,%eax
    1c74:	75 18                	jne    1c8e <sem_signal+0x3e>
        twakeup(pop_q(&s->q));
    1c76:	8b 45 08             	mov    0x8(%ebp),%eax
    1c79:	83 c0 08             	add    $0x8,%eax
    1c7c:	89 04 24             	mov    %eax,(%esp)
    1c7f:	e8 5c fe ff ff       	call   1ae0 <pop_q>
    1c84:	89 04 24             	mov    %eax,(%esp)
    1c87:	e8 a4 f7 ff ff       	call   1430 <twakeup>
    1c8c:	eb 0d                	jmp    1c9b <sem_signal+0x4b>
    }
    else{
        s->val++;
    1c8e:	8b 45 08             	mov    0x8(%ebp),%eax
    1c91:	8b 00                	mov    (%eax),%eax
    1c93:	8d 50 01             	lea    0x1(%eax),%edx
    1c96:	8b 45 08             	mov    0x8(%ebp),%eax
    1c99:	89 10                	mov    %edx,(%eax)
    }

    lock_release(&s->lock);
    1c9b:	8b 45 08             	mov    0x8(%ebp),%eax
    1c9e:	83 c0 04             	add    $0x4,%eax
    1ca1:	89 04 24             	mov    %eax,(%esp)
    1ca4:	e8 87 fc ff ff       	call   1930 <lock_release>
}
    1ca9:	c9                   	leave  
    1caa:	c3                   	ret    

00001cab <sem_dom_acquire>:

void sem_dom_acquire(struct Semaphore* s){
    1cab:	55                   	push   %ebp
    1cac:	89 e5                	mov    %esp,%ebp
    1cae:	83 ec 18             	sub    $0x18,%esp
    lock_acquire(&s->lock);
    1cb1:	8b 45 08             	mov    0x8(%ebp),%eax
    1cb4:	83 c0 04             	add    $0x4,%eax
    1cb7:	89 04 24             	mov    %eax,(%esp)
    1cba:	e8 51 fc ff ff       	call   1910 <lock_acquire>

    if(s->val > 0){
    1cbf:	8b 45 08             	mov    0x8(%ebp),%eax
    1cc2:	8b 00                	mov    (%eax),%eax
    1cc4:	85 c0                	test   %eax,%eax
    1cc6:	7e 1d                	jle    1ce5 <sem_dom_acquire+0x3a>
        s->val--;
    1cc8:	8b 45 08             	mov    0x8(%ebp),%eax
    1ccb:	8b 00                	mov    (%eax),%eax
    1ccd:	8d 50 ff             	lea    -0x1(%eax),%edx
    1cd0:	8b 45 08             	mov    0x8(%ebp),%eax
    1cd3:	89 10                	mov    %edx,(%eax)
        lock_release(&s->lock);
    1cd5:	8b 45 08             	mov    0x8(%ebp),%eax
    1cd8:	83 c0 04             	add    $0x4,%eax
    1cdb:	89 04 24             	mov    %eax,(%esp)
    1cde:	e8 4d fc ff ff       	call   1930 <lock_release>
        return;
    1ce3:	eb 2a                	jmp    1d0f <sem_dom_acquire+0x64>
    }

    dominant(&s->q,getpid());
    1ce5:	e8 0e f7 ff ff       	call   13f8 <getpid>
    1cea:	8b 55 08             	mov    0x8(%ebp),%edx
    1ced:	83 c2 08             	add    $0x8,%edx
    1cf0:	89 44 24 04          	mov    %eax,0x4(%esp)
    1cf4:	89 14 24             	mov    %edx,(%esp)
    1cf7:	e8 5d fe ff ff       	call   1b59 <dominant>
    lock_release(&s->lock);
    1cfc:	8b 45 08             	mov    0x8(%ebp),%eax
    1cff:	83 c0 04             	add    $0x4,%eax
    1d02:	89 04 24             	mov    %eax,(%esp)
    1d05:	e8 26 fc ff ff       	call   1930 <lock_release>
    tsleep();
    1d0a:	e8 19 f7 ff ff       	call   1428 <tsleep>
}
    1d0f:	c9                   	leave  
    1d10:	c3                   	ret    
