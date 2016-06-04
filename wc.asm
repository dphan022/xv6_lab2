
_wc:     file format elf32-i386


Disassembly of section .text:

00001000 <wc>:

char buf[512];

void
wc(int fd, char *name)
{
    1000:	55                   	push   %ebp
    1001:	89 e5                	mov    %esp,%ebp
    1003:	83 ec 48             	sub    $0x48,%esp
  int i, n;
  int l, w, c, inword;

  l = w = c = 0;
    1006:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    100d:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1010:	89 45 ec             	mov    %eax,-0x14(%ebp)
    1013:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1016:	89 45 f0             	mov    %eax,-0x10(%ebp)
  inword = 0;
    1019:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  while((n = read(fd, buf, sizeof(buf))) > 0){
    1020:	eb 68                	jmp    108a <wc+0x8a>
    for(i=0; i<n; i++){
    1022:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    1029:	eb 57                	jmp    1082 <wc+0x82>
      c++;
    102b:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
      if(buf[i] == '\n')
    102f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1032:	05 e0 22 00 00       	add    $0x22e0,%eax
    1037:	0f b6 00             	movzbl (%eax),%eax
    103a:	3c 0a                	cmp    $0xa,%al
    103c:	75 04                	jne    1042 <wc+0x42>
        l++;
    103e:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
      if(strchr(" \r\t\n\v", buf[i]))
    1042:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1045:	05 e0 22 00 00       	add    $0x22e0,%eax
    104a:	0f b6 00             	movzbl (%eax),%eax
    104d:	0f be c0             	movsbl %al,%eax
    1050:	89 44 24 04          	mov    %eax,0x4(%esp)
    1054:	c7 04 24 dd 1d 00 00 	movl   $0x1ddd,(%esp)
    105b:	e8 5b 02 00 00       	call   12bb <strchr>
    1060:	85 c0                	test   %eax,%eax
    1062:	74 09                	je     106d <wc+0x6d>
        inword = 0;
    1064:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    106b:	eb 11                	jmp    107e <wc+0x7e>
      else if(!inword){
    106d:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    1071:	75 0b                	jne    107e <wc+0x7e>
        w++;
    1073:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
        inword = 1;
    1077:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%ebp)
  int l, w, c, inword;

  l = w = c = 0;
  inword = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
    for(i=0; i<n; i++){
    107e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    1082:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1085:	3b 45 e0             	cmp    -0x20(%ebp),%eax
    1088:	7c a1                	jl     102b <wc+0x2b>
  int i, n;
  int l, w, c, inword;

  l = w = c = 0;
  inword = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
    108a:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
    1091:	00 
    1092:	c7 44 24 04 e0 22 00 	movl   $0x22e0,0x4(%esp)
    1099:	00 
    109a:	8b 45 08             	mov    0x8(%ebp),%eax
    109d:	89 04 24             	mov    %eax,(%esp)
    10a0:	e8 b7 03 00 00       	call   145c <read>
    10a5:	89 45 e0             	mov    %eax,-0x20(%ebp)
    10a8:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
    10ac:	0f 8f 70 ff ff ff    	jg     1022 <wc+0x22>
        w++;
        inword = 1;
      }
    }
  }
  if(n < 0){
    10b2:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
    10b6:	79 19                	jns    10d1 <wc+0xd1>
    printf(1, "wc: read error\n");
    10b8:	c7 44 24 04 e3 1d 00 	movl   $0x1de3,0x4(%esp)
    10bf:	00 
    10c0:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    10c7:	e8 18 05 00 00       	call   15e4 <printf>
    exit();
    10cc:	e8 73 03 00 00       	call   1444 <exit>
  }
  printf(1, "%d %d %d %s\n", l, w, c, name);
    10d1:	8b 45 0c             	mov    0xc(%ebp),%eax
    10d4:	89 44 24 14          	mov    %eax,0x14(%esp)
    10d8:	8b 45 e8             	mov    -0x18(%ebp),%eax
    10db:	89 44 24 10          	mov    %eax,0x10(%esp)
    10df:	8b 45 ec             	mov    -0x14(%ebp),%eax
    10e2:	89 44 24 0c          	mov    %eax,0xc(%esp)
    10e6:	8b 45 f0             	mov    -0x10(%ebp),%eax
    10e9:	89 44 24 08          	mov    %eax,0x8(%esp)
    10ed:	c7 44 24 04 f3 1d 00 	movl   $0x1df3,0x4(%esp)
    10f4:	00 
    10f5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    10fc:	e8 e3 04 00 00       	call   15e4 <printf>
}
    1101:	c9                   	leave  
    1102:	c3                   	ret    

00001103 <main>:

int
main(int argc, char *argv[])
{
    1103:	55                   	push   %ebp
    1104:	89 e5                	mov    %esp,%ebp
    1106:	83 e4 f0             	and    $0xfffffff0,%esp
    1109:	83 ec 20             	sub    $0x20,%esp
  int fd, i;

  if(argc <= 1){
    110c:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
    1110:	7f 19                	jg     112b <main+0x28>
    wc(0, "");
    1112:	c7 44 24 04 00 1e 00 	movl   $0x1e00,0x4(%esp)
    1119:	00 
    111a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1121:	e8 da fe ff ff       	call   1000 <wc>
    exit();
    1126:	e8 19 03 00 00       	call   1444 <exit>
  }

  for(i = 1; i < argc; i++){
    112b:	c7 44 24 1c 01 00 00 	movl   $0x1,0x1c(%esp)
    1132:	00 
    1133:	e9 8f 00 00 00       	jmp    11c7 <main+0xc4>
    if((fd = open(argv[i], 0)) < 0){
    1138:	8b 44 24 1c          	mov    0x1c(%esp),%eax
    113c:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
    1143:	8b 45 0c             	mov    0xc(%ebp),%eax
    1146:	01 d0                	add    %edx,%eax
    1148:	8b 00                	mov    (%eax),%eax
    114a:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1151:	00 
    1152:	89 04 24             	mov    %eax,(%esp)
    1155:	e8 2a 03 00 00       	call   1484 <open>
    115a:	89 44 24 18          	mov    %eax,0x18(%esp)
    115e:	83 7c 24 18 00       	cmpl   $0x0,0x18(%esp)
    1163:	79 2f                	jns    1194 <main+0x91>
      printf(1, "wc: cannot open %s\n", argv[i]);
    1165:	8b 44 24 1c          	mov    0x1c(%esp),%eax
    1169:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
    1170:	8b 45 0c             	mov    0xc(%ebp),%eax
    1173:	01 d0                	add    %edx,%eax
    1175:	8b 00                	mov    (%eax),%eax
    1177:	89 44 24 08          	mov    %eax,0x8(%esp)
    117b:	c7 44 24 04 01 1e 00 	movl   $0x1e01,0x4(%esp)
    1182:	00 
    1183:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    118a:	e8 55 04 00 00       	call   15e4 <printf>
      exit();
    118f:	e8 b0 02 00 00       	call   1444 <exit>
    }
    wc(fd, argv[i]);
    1194:	8b 44 24 1c          	mov    0x1c(%esp),%eax
    1198:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
    119f:	8b 45 0c             	mov    0xc(%ebp),%eax
    11a2:	01 d0                	add    %edx,%eax
    11a4:	8b 00                	mov    (%eax),%eax
    11a6:	89 44 24 04          	mov    %eax,0x4(%esp)
    11aa:	8b 44 24 18          	mov    0x18(%esp),%eax
    11ae:	89 04 24             	mov    %eax,(%esp)
    11b1:	e8 4a fe ff ff       	call   1000 <wc>
    close(fd);
    11b6:	8b 44 24 18          	mov    0x18(%esp),%eax
    11ba:	89 04 24             	mov    %eax,(%esp)
    11bd:	e8 aa 02 00 00       	call   146c <close>
  if(argc <= 1){
    wc(0, "");
    exit();
  }

  for(i = 1; i < argc; i++){
    11c2:	83 44 24 1c 01       	addl   $0x1,0x1c(%esp)
    11c7:	8b 44 24 1c          	mov    0x1c(%esp),%eax
    11cb:	3b 45 08             	cmp    0x8(%ebp),%eax
    11ce:	0f 8c 64 ff ff ff    	jl     1138 <main+0x35>
      exit();
    }
    wc(fd, argv[i]);
    close(fd);
  }
  exit();
    11d4:	e8 6b 02 00 00       	call   1444 <exit>
    11d9:	66 90                	xchg   %ax,%ax
    11db:	90                   	nop

000011dc <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
    11dc:	55                   	push   %ebp
    11dd:	89 e5                	mov    %esp,%ebp
    11df:	57                   	push   %edi
    11e0:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
    11e1:	8b 4d 08             	mov    0x8(%ebp),%ecx
    11e4:	8b 55 10             	mov    0x10(%ebp),%edx
    11e7:	8b 45 0c             	mov    0xc(%ebp),%eax
    11ea:	89 cb                	mov    %ecx,%ebx
    11ec:	89 df                	mov    %ebx,%edi
    11ee:	89 d1                	mov    %edx,%ecx
    11f0:	fc                   	cld    
    11f1:	f3 aa                	rep stos %al,%es:(%edi)
    11f3:	89 ca                	mov    %ecx,%edx
    11f5:	89 fb                	mov    %edi,%ebx
    11f7:	89 5d 08             	mov    %ebx,0x8(%ebp)
    11fa:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
    11fd:	5b                   	pop    %ebx
    11fe:	5f                   	pop    %edi
    11ff:	5d                   	pop    %ebp
    1200:	c3                   	ret    

00001201 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
    1201:	55                   	push   %ebp
    1202:	89 e5                	mov    %esp,%ebp
    1204:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
    1207:	8b 45 08             	mov    0x8(%ebp),%eax
    120a:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
    120d:	90                   	nop
    120e:	8b 45 08             	mov    0x8(%ebp),%eax
    1211:	8d 50 01             	lea    0x1(%eax),%edx
    1214:	89 55 08             	mov    %edx,0x8(%ebp)
    1217:	8b 55 0c             	mov    0xc(%ebp),%edx
    121a:	8d 4a 01             	lea    0x1(%edx),%ecx
    121d:	89 4d 0c             	mov    %ecx,0xc(%ebp)
    1220:	0f b6 12             	movzbl (%edx),%edx
    1223:	88 10                	mov    %dl,(%eax)
    1225:	0f b6 00             	movzbl (%eax),%eax
    1228:	84 c0                	test   %al,%al
    122a:	75 e2                	jne    120e <strcpy+0xd>
    ;
  return os;
    122c:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    122f:	c9                   	leave  
    1230:	c3                   	ret    

00001231 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    1231:	55                   	push   %ebp
    1232:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
    1234:	eb 08                	jmp    123e <strcmp+0xd>
    p++, q++;
    1236:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    123a:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    123e:	8b 45 08             	mov    0x8(%ebp),%eax
    1241:	0f b6 00             	movzbl (%eax),%eax
    1244:	84 c0                	test   %al,%al
    1246:	74 10                	je     1258 <strcmp+0x27>
    1248:	8b 45 08             	mov    0x8(%ebp),%eax
    124b:	0f b6 10             	movzbl (%eax),%edx
    124e:	8b 45 0c             	mov    0xc(%ebp),%eax
    1251:	0f b6 00             	movzbl (%eax),%eax
    1254:	38 c2                	cmp    %al,%dl
    1256:	74 de                	je     1236 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
    1258:	8b 45 08             	mov    0x8(%ebp),%eax
    125b:	0f b6 00             	movzbl (%eax),%eax
    125e:	0f b6 d0             	movzbl %al,%edx
    1261:	8b 45 0c             	mov    0xc(%ebp),%eax
    1264:	0f b6 00             	movzbl (%eax),%eax
    1267:	0f b6 c0             	movzbl %al,%eax
    126a:	29 c2                	sub    %eax,%edx
    126c:	89 d0                	mov    %edx,%eax
}
    126e:	5d                   	pop    %ebp
    126f:	c3                   	ret    

00001270 <strlen>:

uint
strlen(char *s)
{
    1270:	55                   	push   %ebp
    1271:	89 e5                	mov    %esp,%ebp
    1273:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
    1276:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    127d:	eb 04                	jmp    1283 <strlen+0x13>
    127f:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    1283:	8b 55 fc             	mov    -0x4(%ebp),%edx
    1286:	8b 45 08             	mov    0x8(%ebp),%eax
    1289:	01 d0                	add    %edx,%eax
    128b:	0f b6 00             	movzbl (%eax),%eax
    128e:	84 c0                	test   %al,%al
    1290:	75 ed                	jne    127f <strlen+0xf>
    ;
  return n;
    1292:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    1295:	c9                   	leave  
    1296:	c3                   	ret    

00001297 <memset>:

void*
memset(void *dst, int c, uint n)
{
    1297:	55                   	push   %ebp
    1298:	89 e5                	mov    %esp,%ebp
    129a:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
    129d:	8b 45 10             	mov    0x10(%ebp),%eax
    12a0:	89 44 24 08          	mov    %eax,0x8(%esp)
    12a4:	8b 45 0c             	mov    0xc(%ebp),%eax
    12a7:	89 44 24 04          	mov    %eax,0x4(%esp)
    12ab:	8b 45 08             	mov    0x8(%ebp),%eax
    12ae:	89 04 24             	mov    %eax,(%esp)
    12b1:	e8 26 ff ff ff       	call   11dc <stosb>
  return dst;
    12b6:	8b 45 08             	mov    0x8(%ebp),%eax
}
    12b9:	c9                   	leave  
    12ba:	c3                   	ret    

000012bb <strchr>:

char*
strchr(const char *s, char c)
{
    12bb:	55                   	push   %ebp
    12bc:	89 e5                	mov    %esp,%ebp
    12be:	83 ec 04             	sub    $0x4,%esp
    12c1:	8b 45 0c             	mov    0xc(%ebp),%eax
    12c4:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
    12c7:	eb 14                	jmp    12dd <strchr+0x22>
    if(*s == c)
    12c9:	8b 45 08             	mov    0x8(%ebp),%eax
    12cc:	0f b6 00             	movzbl (%eax),%eax
    12cf:	3a 45 fc             	cmp    -0x4(%ebp),%al
    12d2:	75 05                	jne    12d9 <strchr+0x1e>
      return (char*)s;
    12d4:	8b 45 08             	mov    0x8(%ebp),%eax
    12d7:	eb 13                	jmp    12ec <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
    12d9:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    12dd:	8b 45 08             	mov    0x8(%ebp),%eax
    12e0:	0f b6 00             	movzbl (%eax),%eax
    12e3:	84 c0                	test   %al,%al
    12e5:	75 e2                	jne    12c9 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
    12e7:	b8 00 00 00 00       	mov    $0x0,%eax
}
    12ec:	c9                   	leave  
    12ed:	c3                   	ret    

000012ee <gets>:

char*
gets(char *buf, int max)
{
    12ee:	55                   	push   %ebp
    12ef:	89 e5                	mov    %esp,%ebp
    12f1:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    12f4:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    12fb:	eb 4c                	jmp    1349 <gets+0x5b>
    cc = read(0, &c, 1);
    12fd:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    1304:	00 
    1305:	8d 45 ef             	lea    -0x11(%ebp),%eax
    1308:	89 44 24 04          	mov    %eax,0x4(%esp)
    130c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1313:	e8 44 01 00 00       	call   145c <read>
    1318:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
    131b:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    131f:	7f 02                	jg     1323 <gets+0x35>
      break;
    1321:	eb 31                	jmp    1354 <gets+0x66>
    buf[i++] = c;
    1323:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1326:	8d 50 01             	lea    0x1(%eax),%edx
    1329:	89 55 f4             	mov    %edx,-0xc(%ebp)
    132c:	89 c2                	mov    %eax,%edx
    132e:	8b 45 08             	mov    0x8(%ebp),%eax
    1331:	01 c2                	add    %eax,%edx
    1333:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    1337:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
    1339:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    133d:	3c 0a                	cmp    $0xa,%al
    133f:	74 13                	je     1354 <gets+0x66>
    1341:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    1345:	3c 0d                	cmp    $0xd,%al
    1347:	74 0b                	je     1354 <gets+0x66>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1349:	8b 45 f4             	mov    -0xc(%ebp),%eax
    134c:	83 c0 01             	add    $0x1,%eax
    134f:	3b 45 0c             	cmp    0xc(%ebp),%eax
    1352:	7c a9                	jl     12fd <gets+0xf>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    1354:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1357:	8b 45 08             	mov    0x8(%ebp),%eax
    135a:	01 d0                	add    %edx,%eax
    135c:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
    135f:	8b 45 08             	mov    0x8(%ebp),%eax
}
    1362:	c9                   	leave  
    1363:	c3                   	ret    

00001364 <stat>:

int
stat(char *n, struct stat *st)
{
    1364:	55                   	push   %ebp
    1365:	89 e5                	mov    %esp,%ebp
    1367:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    136a:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1371:	00 
    1372:	8b 45 08             	mov    0x8(%ebp),%eax
    1375:	89 04 24             	mov    %eax,(%esp)
    1378:	e8 07 01 00 00       	call   1484 <open>
    137d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
    1380:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1384:	79 07                	jns    138d <stat+0x29>
    return -1;
    1386:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    138b:	eb 23                	jmp    13b0 <stat+0x4c>
  r = fstat(fd, st);
    138d:	8b 45 0c             	mov    0xc(%ebp),%eax
    1390:	89 44 24 04          	mov    %eax,0x4(%esp)
    1394:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1397:	89 04 24             	mov    %eax,(%esp)
    139a:	e8 fd 00 00 00       	call   149c <fstat>
    139f:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
    13a2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    13a5:	89 04 24             	mov    %eax,(%esp)
    13a8:	e8 bf 00 00 00       	call   146c <close>
  return r;
    13ad:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
    13b0:	c9                   	leave  
    13b1:	c3                   	ret    

000013b2 <atoi>:

int
atoi(const char *s)
{
    13b2:	55                   	push   %ebp
    13b3:	89 e5                	mov    %esp,%ebp
    13b5:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
    13b8:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
    13bf:	eb 25                	jmp    13e6 <atoi+0x34>
    n = n*10 + *s++ - '0';
    13c1:	8b 55 fc             	mov    -0x4(%ebp),%edx
    13c4:	89 d0                	mov    %edx,%eax
    13c6:	c1 e0 02             	shl    $0x2,%eax
    13c9:	01 d0                	add    %edx,%eax
    13cb:	01 c0                	add    %eax,%eax
    13cd:	89 c1                	mov    %eax,%ecx
    13cf:	8b 45 08             	mov    0x8(%ebp),%eax
    13d2:	8d 50 01             	lea    0x1(%eax),%edx
    13d5:	89 55 08             	mov    %edx,0x8(%ebp)
    13d8:	0f b6 00             	movzbl (%eax),%eax
    13db:	0f be c0             	movsbl %al,%eax
    13de:	01 c8                	add    %ecx,%eax
    13e0:	83 e8 30             	sub    $0x30,%eax
    13e3:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    13e6:	8b 45 08             	mov    0x8(%ebp),%eax
    13e9:	0f b6 00             	movzbl (%eax),%eax
    13ec:	3c 2f                	cmp    $0x2f,%al
    13ee:	7e 0a                	jle    13fa <atoi+0x48>
    13f0:	8b 45 08             	mov    0x8(%ebp),%eax
    13f3:	0f b6 00             	movzbl (%eax),%eax
    13f6:	3c 39                	cmp    $0x39,%al
    13f8:	7e c7                	jle    13c1 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
    13fa:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    13fd:	c9                   	leave  
    13fe:	c3                   	ret    

000013ff <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    13ff:	55                   	push   %ebp
    1400:	89 e5                	mov    %esp,%ebp
    1402:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
    1405:	8b 45 08             	mov    0x8(%ebp),%eax
    1408:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
    140b:	8b 45 0c             	mov    0xc(%ebp),%eax
    140e:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
    1411:	eb 17                	jmp    142a <memmove+0x2b>
    *dst++ = *src++;
    1413:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1416:	8d 50 01             	lea    0x1(%eax),%edx
    1419:	89 55 fc             	mov    %edx,-0x4(%ebp)
    141c:	8b 55 f8             	mov    -0x8(%ebp),%edx
    141f:	8d 4a 01             	lea    0x1(%edx),%ecx
    1422:	89 4d f8             	mov    %ecx,-0x8(%ebp)
    1425:	0f b6 12             	movzbl (%edx),%edx
    1428:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    142a:	8b 45 10             	mov    0x10(%ebp),%eax
    142d:	8d 50 ff             	lea    -0x1(%eax),%edx
    1430:	89 55 10             	mov    %edx,0x10(%ebp)
    1433:	85 c0                	test   %eax,%eax
    1435:	7f dc                	jg     1413 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
    1437:	8b 45 08             	mov    0x8(%ebp),%eax
}
    143a:	c9                   	leave  
    143b:	c3                   	ret    

0000143c <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    143c:	b8 01 00 00 00       	mov    $0x1,%eax
    1441:	cd 40                	int    $0x40
    1443:	c3                   	ret    

00001444 <exit>:
SYSCALL(exit)
    1444:	b8 02 00 00 00       	mov    $0x2,%eax
    1449:	cd 40                	int    $0x40
    144b:	c3                   	ret    

0000144c <wait>:
SYSCALL(wait)
    144c:	b8 03 00 00 00       	mov    $0x3,%eax
    1451:	cd 40                	int    $0x40
    1453:	c3                   	ret    

00001454 <pipe>:
SYSCALL(pipe)
    1454:	b8 04 00 00 00       	mov    $0x4,%eax
    1459:	cd 40                	int    $0x40
    145b:	c3                   	ret    

0000145c <read>:
SYSCALL(read)
    145c:	b8 05 00 00 00       	mov    $0x5,%eax
    1461:	cd 40                	int    $0x40
    1463:	c3                   	ret    

00001464 <write>:
SYSCALL(write)
    1464:	b8 10 00 00 00       	mov    $0x10,%eax
    1469:	cd 40                	int    $0x40
    146b:	c3                   	ret    

0000146c <close>:
SYSCALL(close)
    146c:	b8 15 00 00 00       	mov    $0x15,%eax
    1471:	cd 40                	int    $0x40
    1473:	c3                   	ret    

00001474 <kill>:
SYSCALL(kill)
    1474:	b8 06 00 00 00       	mov    $0x6,%eax
    1479:	cd 40                	int    $0x40
    147b:	c3                   	ret    

0000147c <exec>:
SYSCALL(exec)
    147c:	b8 07 00 00 00       	mov    $0x7,%eax
    1481:	cd 40                	int    $0x40
    1483:	c3                   	ret    

00001484 <open>:
SYSCALL(open)
    1484:	b8 0f 00 00 00       	mov    $0xf,%eax
    1489:	cd 40                	int    $0x40
    148b:	c3                   	ret    

0000148c <mknod>:
SYSCALL(mknod)
    148c:	b8 11 00 00 00       	mov    $0x11,%eax
    1491:	cd 40                	int    $0x40
    1493:	c3                   	ret    

00001494 <unlink>:
SYSCALL(unlink)
    1494:	b8 12 00 00 00       	mov    $0x12,%eax
    1499:	cd 40                	int    $0x40
    149b:	c3                   	ret    

0000149c <fstat>:
SYSCALL(fstat)
    149c:	b8 08 00 00 00       	mov    $0x8,%eax
    14a1:	cd 40                	int    $0x40
    14a3:	c3                   	ret    

000014a4 <link>:
SYSCALL(link)
    14a4:	b8 13 00 00 00       	mov    $0x13,%eax
    14a9:	cd 40                	int    $0x40
    14ab:	c3                   	ret    

000014ac <mkdir>:
SYSCALL(mkdir)
    14ac:	b8 14 00 00 00       	mov    $0x14,%eax
    14b1:	cd 40                	int    $0x40
    14b3:	c3                   	ret    

000014b4 <chdir>:
SYSCALL(chdir)
    14b4:	b8 09 00 00 00       	mov    $0x9,%eax
    14b9:	cd 40                	int    $0x40
    14bb:	c3                   	ret    

000014bc <dup>:
SYSCALL(dup)
    14bc:	b8 0a 00 00 00       	mov    $0xa,%eax
    14c1:	cd 40                	int    $0x40
    14c3:	c3                   	ret    

000014c4 <getpid>:
SYSCALL(getpid)
    14c4:	b8 0b 00 00 00       	mov    $0xb,%eax
    14c9:	cd 40                	int    $0x40
    14cb:	c3                   	ret    

000014cc <sbrk>:
SYSCALL(sbrk)
    14cc:	b8 0c 00 00 00       	mov    $0xc,%eax
    14d1:	cd 40                	int    $0x40
    14d3:	c3                   	ret    

000014d4 <sleep>:
SYSCALL(sleep)
    14d4:	b8 0d 00 00 00       	mov    $0xd,%eax
    14d9:	cd 40                	int    $0x40
    14db:	c3                   	ret    

000014dc <uptime>:
SYSCALL(uptime)
    14dc:	b8 0e 00 00 00       	mov    $0xe,%eax
    14e1:	cd 40                	int    $0x40
    14e3:	c3                   	ret    

000014e4 <clone>:
SYSCALL(clone)
    14e4:	b8 16 00 00 00       	mov    $0x16,%eax
    14e9:	cd 40                	int    $0x40
    14eb:	c3                   	ret    

000014ec <texit>:
SYSCALL(texit)
    14ec:	b8 17 00 00 00       	mov    $0x17,%eax
    14f1:	cd 40                	int    $0x40
    14f3:	c3                   	ret    

000014f4 <tsleep>:
SYSCALL(tsleep)
    14f4:	b8 18 00 00 00       	mov    $0x18,%eax
    14f9:	cd 40                	int    $0x40
    14fb:	c3                   	ret    

000014fc <twakeup>:
SYSCALL(twakeup)
    14fc:	b8 19 00 00 00       	mov    $0x19,%eax
    1501:	cd 40                	int    $0x40
    1503:	c3                   	ret    

00001504 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
    1504:	55                   	push   %ebp
    1505:	89 e5                	mov    %esp,%ebp
    1507:	83 ec 18             	sub    $0x18,%esp
    150a:	8b 45 0c             	mov    0xc(%ebp),%eax
    150d:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
    1510:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    1517:	00 
    1518:	8d 45 f4             	lea    -0xc(%ebp),%eax
    151b:	89 44 24 04          	mov    %eax,0x4(%esp)
    151f:	8b 45 08             	mov    0x8(%ebp),%eax
    1522:	89 04 24             	mov    %eax,(%esp)
    1525:	e8 3a ff ff ff       	call   1464 <write>
}
    152a:	c9                   	leave  
    152b:	c3                   	ret    

0000152c <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
    152c:	55                   	push   %ebp
    152d:	89 e5                	mov    %esp,%ebp
    152f:	56                   	push   %esi
    1530:	53                   	push   %ebx
    1531:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    1534:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
    153b:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
    153f:	74 17                	je     1558 <printint+0x2c>
    1541:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    1545:	79 11                	jns    1558 <printint+0x2c>
    neg = 1;
    1547:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
    154e:	8b 45 0c             	mov    0xc(%ebp),%eax
    1551:	f7 d8                	neg    %eax
    1553:	89 45 ec             	mov    %eax,-0x14(%ebp)
    1556:	eb 06                	jmp    155e <printint+0x32>
  } else {
    x = xx;
    1558:	8b 45 0c             	mov    0xc(%ebp),%eax
    155b:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
    155e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
    1565:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    1568:	8d 41 01             	lea    0x1(%ecx),%eax
    156b:	89 45 f4             	mov    %eax,-0xc(%ebp)
    156e:	8b 5d 10             	mov    0x10(%ebp),%ebx
    1571:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1574:	ba 00 00 00 00       	mov    $0x0,%edx
    1579:	f7 f3                	div    %ebx
    157b:	89 d0                	mov    %edx,%eax
    157d:	0f b6 80 8c 22 00 00 	movzbl 0x228c(%eax),%eax
    1584:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
    1588:	8b 75 10             	mov    0x10(%ebp),%esi
    158b:	8b 45 ec             	mov    -0x14(%ebp),%eax
    158e:	ba 00 00 00 00       	mov    $0x0,%edx
    1593:	f7 f6                	div    %esi
    1595:	89 45 ec             	mov    %eax,-0x14(%ebp)
    1598:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    159c:	75 c7                	jne    1565 <printint+0x39>
  if(neg)
    159e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    15a2:	74 10                	je     15b4 <printint+0x88>
    buf[i++] = '-';
    15a4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    15a7:	8d 50 01             	lea    0x1(%eax),%edx
    15aa:	89 55 f4             	mov    %edx,-0xc(%ebp)
    15ad:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
    15b2:	eb 1f                	jmp    15d3 <printint+0xa7>
    15b4:	eb 1d                	jmp    15d3 <printint+0xa7>
    putc(fd, buf[i]);
    15b6:	8d 55 dc             	lea    -0x24(%ebp),%edx
    15b9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    15bc:	01 d0                	add    %edx,%eax
    15be:	0f b6 00             	movzbl (%eax),%eax
    15c1:	0f be c0             	movsbl %al,%eax
    15c4:	89 44 24 04          	mov    %eax,0x4(%esp)
    15c8:	8b 45 08             	mov    0x8(%ebp),%eax
    15cb:	89 04 24             	mov    %eax,(%esp)
    15ce:	e8 31 ff ff ff       	call   1504 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    15d3:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    15d7:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    15db:	79 d9                	jns    15b6 <printint+0x8a>
    putc(fd, buf[i]);
}
    15dd:	83 c4 30             	add    $0x30,%esp
    15e0:	5b                   	pop    %ebx
    15e1:	5e                   	pop    %esi
    15e2:	5d                   	pop    %ebp
    15e3:	c3                   	ret    

000015e4 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    15e4:	55                   	push   %ebp
    15e5:	89 e5                	mov    %esp,%ebp
    15e7:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
    15ea:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
    15f1:	8d 45 0c             	lea    0xc(%ebp),%eax
    15f4:	83 c0 04             	add    $0x4,%eax
    15f7:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
    15fa:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    1601:	e9 7c 01 00 00       	jmp    1782 <printf+0x19e>
    c = fmt[i] & 0xff;
    1606:	8b 55 0c             	mov    0xc(%ebp),%edx
    1609:	8b 45 f0             	mov    -0x10(%ebp),%eax
    160c:	01 d0                	add    %edx,%eax
    160e:	0f b6 00             	movzbl (%eax),%eax
    1611:	0f be c0             	movsbl %al,%eax
    1614:	25 ff 00 00 00       	and    $0xff,%eax
    1619:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
    161c:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1620:	75 2c                	jne    164e <printf+0x6a>
      if(c == '%'){
    1622:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    1626:	75 0c                	jne    1634 <printf+0x50>
        state = '%';
    1628:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
    162f:	e9 4a 01 00 00       	jmp    177e <printf+0x19a>
      } else {
        putc(fd, c);
    1634:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1637:	0f be c0             	movsbl %al,%eax
    163a:	89 44 24 04          	mov    %eax,0x4(%esp)
    163e:	8b 45 08             	mov    0x8(%ebp),%eax
    1641:	89 04 24             	mov    %eax,(%esp)
    1644:	e8 bb fe ff ff       	call   1504 <putc>
    1649:	e9 30 01 00 00       	jmp    177e <printf+0x19a>
      }
    } else if(state == '%'){
    164e:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
    1652:	0f 85 26 01 00 00    	jne    177e <printf+0x19a>
      if(c == 'd'){
    1658:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
    165c:	75 2d                	jne    168b <printf+0xa7>
        printint(fd, *ap, 10, 1);
    165e:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1661:	8b 00                	mov    (%eax),%eax
    1663:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    166a:	00 
    166b:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
    1672:	00 
    1673:	89 44 24 04          	mov    %eax,0x4(%esp)
    1677:	8b 45 08             	mov    0x8(%ebp),%eax
    167a:	89 04 24             	mov    %eax,(%esp)
    167d:	e8 aa fe ff ff       	call   152c <printint>
        ap++;
    1682:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    1686:	e9 ec 00 00 00       	jmp    1777 <printf+0x193>
      } else if(c == 'x' || c == 'p'){
    168b:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
    168f:	74 06                	je     1697 <printf+0xb3>
    1691:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
    1695:	75 2d                	jne    16c4 <printf+0xe0>
        printint(fd, *ap, 16, 0);
    1697:	8b 45 e8             	mov    -0x18(%ebp),%eax
    169a:	8b 00                	mov    (%eax),%eax
    169c:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    16a3:	00 
    16a4:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
    16ab:	00 
    16ac:	89 44 24 04          	mov    %eax,0x4(%esp)
    16b0:	8b 45 08             	mov    0x8(%ebp),%eax
    16b3:	89 04 24             	mov    %eax,(%esp)
    16b6:	e8 71 fe ff ff       	call   152c <printint>
        ap++;
    16bb:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    16bf:	e9 b3 00 00 00       	jmp    1777 <printf+0x193>
      } else if(c == 's'){
    16c4:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
    16c8:	75 45                	jne    170f <printf+0x12b>
        s = (char*)*ap;
    16ca:	8b 45 e8             	mov    -0x18(%ebp),%eax
    16cd:	8b 00                	mov    (%eax),%eax
    16cf:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
    16d2:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
    16d6:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    16da:	75 09                	jne    16e5 <printf+0x101>
          s = "(null)";
    16dc:	c7 45 f4 15 1e 00 00 	movl   $0x1e15,-0xc(%ebp)
        while(*s != 0){
    16e3:	eb 1e                	jmp    1703 <printf+0x11f>
    16e5:	eb 1c                	jmp    1703 <printf+0x11f>
          putc(fd, *s);
    16e7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    16ea:	0f b6 00             	movzbl (%eax),%eax
    16ed:	0f be c0             	movsbl %al,%eax
    16f0:	89 44 24 04          	mov    %eax,0x4(%esp)
    16f4:	8b 45 08             	mov    0x8(%ebp),%eax
    16f7:	89 04 24             	mov    %eax,(%esp)
    16fa:	e8 05 fe ff ff       	call   1504 <putc>
          s++;
    16ff:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    1703:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1706:	0f b6 00             	movzbl (%eax),%eax
    1709:	84 c0                	test   %al,%al
    170b:	75 da                	jne    16e7 <printf+0x103>
    170d:	eb 68                	jmp    1777 <printf+0x193>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    170f:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
    1713:	75 1d                	jne    1732 <printf+0x14e>
        putc(fd, *ap);
    1715:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1718:	8b 00                	mov    (%eax),%eax
    171a:	0f be c0             	movsbl %al,%eax
    171d:	89 44 24 04          	mov    %eax,0x4(%esp)
    1721:	8b 45 08             	mov    0x8(%ebp),%eax
    1724:	89 04 24             	mov    %eax,(%esp)
    1727:	e8 d8 fd ff ff       	call   1504 <putc>
        ap++;
    172c:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    1730:	eb 45                	jmp    1777 <printf+0x193>
      } else if(c == '%'){
    1732:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    1736:	75 17                	jne    174f <printf+0x16b>
        putc(fd, c);
    1738:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    173b:	0f be c0             	movsbl %al,%eax
    173e:	89 44 24 04          	mov    %eax,0x4(%esp)
    1742:	8b 45 08             	mov    0x8(%ebp),%eax
    1745:	89 04 24             	mov    %eax,(%esp)
    1748:	e8 b7 fd ff ff       	call   1504 <putc>
    174d:	eb 28                	jmp    1777 <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
    174f:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
    1756:	00 
    1757:	8b 45 08             	mov    0x8(%ebp),%eax
    175a:	89 04 24             	mov    %eax,(%esp)
    175d:	e8 a2 fd ff ff       	call   1504 <putc>
        putc(fd, c);
    1762:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1765:	0f be c0             	movsbl %al,%eax
    1768:	89 44 24 04          	mov    %eax,0x4(%esp)
    176c:	8b 45 08             	mov    0x8(%ebp),%eax
    176f:	89 04 24             	mov    %eax,(%esp)
    1772:	e8 8d fd ff ff       	call   1504 <putc>
      }
      state = 0;
    1777:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    177e:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    1782:	8b 55 0c             	mov    0xc(%ebp),%edx
    1785:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1788:	01 d0                	add    %edx,%eax
    178a:	0f b6 00             	movzbl (%eax),%eax
    178d:	84 c0                	test   %al,%al
    178f:	0f 85 71 fe ff ff    	jne    1606 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    1795:	c9                   	leave  
    1796:	c3                   	ret    
    1797:	90                   	nop

00001798 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    1798:	55                   	push   %ebp
    1799:	89 e5                	mov    %esp,%ebp
    179b:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
    179e:	8b 45 08             	mov    0x8(%ebp),%eax
    17a1:	83 e8 08             	sub    $0x8,%eax
    17a4:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    17a7:	a1 c8 22 00 00       	mov    0x22c8,%eax
    17ac:	89 45 fc             	mov    %eax,-0x4(%ebp)
    17af:	eb 24                	jmp    17d5 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    17b1:	8b 45 fc             	mov    -0x4(%ebp),%eax
    17b4:	8b 00                	mov    (%eax),%eax
    17b6:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    17b9:	77 12                	ja     17cd <free+0x35>
    17bb:	8b 45 f8             	mov    -0x8(%ebp),%eax
    17be:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    17c1:	77 24                	ja     17e7 <free+0x4f>
    17c3:	8b 45 fc             	mov    -0x4(%ebp),%eax
    17c6:	8b 00                	mov    (%eax),%eax
    17c8:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    17cb:	77 1a                	ja     17e7 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    17cd:	8b 45 fc             	mov    -0x4(%ebp),%eax
    17d0:	8b 00                	mov    (%eax),%eax
    17d2:	89 45 fc             	mov    %eax,-0x4(%ebp)
    17d5:	8b 45 f8             	mov    -0x8(%ebp),%eax
    17d8:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    17db:	76 d4                	jbe    17b1 <free+0x19>
    17dd:	8b 45 fc             	mov    -0x4(%ebp),%eax
    17e0:	8b 00                	mov    (%eax),%eax
    17e2:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    17e5:	76 ca                	jbe    17b1 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    17e7:	8b 45 f8             	mov    -0x8(%ebp),%eax
    17ea:	8b 40 04             	mov    0x4(%eax),%eax
    17ed:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    17f4:	8b 45 f8             	mov    -0x8(%ebp),%eax
    17f7:	01 c2                	add    %eax,%edx
    17f9:	8b 45 fc             	mov    -0x4(%ebp),%eax
    17fc:	8b 00                	mov    (%eax),%eax
    17fe:	39 c2                	cmp    %eax,%edx
    1800:	75 24                	jne    1826 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
    1802:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1805:	8b 50 04             	mov    0x4(%eax),%edx
    1808:	8b 45 fc             	mov    -0x4(%ebp),%eax
    180b:	8b 00                	mov    (%eax),%eax
    180d:	8b 40 04             	mov    0x4(%eax),%eax
    1810:	01 c2                	add    %eax,%edx
    1812:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1815:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
    1818:	8b 45 fc             	mov    -0x4(%ebp),%eax
    181b:	8b 00                	mov    (%eax),%eax
    181d:	8b 10                	mov    (%eax),%edx
    181f:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1822:	89 10                	mov    %edx,(%eax)
    1824:	eb 0a                	jmp    1830 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
    1826:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1829:	8b 10                	mov    (%eax),%edx
    182b:	8b 45 f8             	mov    -0x8(%ebp),%eax
    182e:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
    1830:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1833:	8b 40 04             	mov    0x4(%eax),%eax
    1836:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    183d:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1840:	01 d0                	add    %edx,%eax
    1842:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    1845:	75 20                	jne    1867 <free+0xcf>
    p->s.size += bp->s.size;
    1847:	8b 45 fc             	mov    -0x4(%ebp),%eax
    184a:	8b 50 04             	mov    0x4(%eax),%edx
    184d:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1850:	8b 40 04             	mov    0x4(%eax),%eax
    1853:	01 c2                	add    %eax,%edx
    1855:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1858:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    185b:	8b 45 f8             	mov    -0x8(%ebp),%eax
    185e:	8b 10                	mov    (%eax),%edx
    1860:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1863:	89 10                	mov    %edx,(%eax)
    1865:	eb 08                	jmp    186f <free+0xd7>
  } else
    p->s.ptr = bp;
    1867:	8b 45 fc             	mov    -0x4(%ebp),%eax
    186a:	8b 55 f8             	mov    -0x8(%ebp),%edx
    186d:	89 10                	mov    %edx,(%eax)
  freep = p;
    186f:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1872:	a3 c8 22 00 00       	mov    %eax,0x22c8
}
    1877:	c9                   	leave  
    1878:	c3                   	ret    

00001879 <morecore>:

static Header*
morecore(uint nu)
{
    1879:	55                   	push   %ebp
    187a:	89 e5                	mov    %esp,%ebp
    187c:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
    187f:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
    1886:	77 07                	ja     188f <morecore+0x16>
    nu = 4096;
    1888:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
    188f:	8b 45 08             	mov    0x8(%ebp),%eax
    1892:	c1 e0 03             	shl    $0x3,%eax
    1895:	89 04 24             	mov    %eax,(%esp)
    1898:	e8 2f fc ff ff       	call   14cc <sbrk>
    189d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
    18a0:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
    18a4:	75 07                	jne    18ad <morecore+0x34>
    return 0;
    18a6:	b8 00 00 00 00       	mov    $0x0,%eax
    18ab:	eb 22                	jmp    18cf <morecore+0x56>
  hp = (Header*)p;
    18ad:	8b 45 f4             	mov    -0xc(%ebp),%eax
    18b0:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
    18b3:	8b 45 f0             	mov    -0x10(%ebp),%eax
    18b6:	8b 55 08             	mov    0x8(%ebp),%edx
    18b9:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
    18bc:	8b 45 f0             	mov    -0x10(%ebp),%eax
    18bf:	83 c0 08             	add    $0x8,%eax
    18c2:	89 04 24             	mov    %eax,(%esp)
    18c5:	e8 ce fe ff ff       	call   1798 <free>
  return freep;
    18ca:	a1 c8 22 00 00       	mov    0x22c8,%eax
}
    18cf:	c9                   	leave  
    18d0:	c3                   	ret    

000018d1 <malloc>:

void*
malloc(uint nbytes)
{
    18d1:	55                   	push   %ebp
    18d2:	89 e5                	mov    %esp,%ebp
    18d4:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    18d7:	8b 45 08             	mov    0x8(%ebp),%eax
    18da:	83 c0 07             	add    $0x7,%eax
    18dd:	c1 e8 03             	shr    $0x3,%eax
    18e0:	83 c0 01             	add    $0x1,%eax
    18e3:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
    18e6:	a1 c8 22 00 00       	mov    0x22c8,%eax
    18eb:	89 45 f0             	mov    %eax,-0x10(%ebp)
    18ee:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    18f2:	75 23                	jne    1917 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
    18f4:	c7 45 f0 c0 22 00 00 	movl   $0x22c0,-0x10(%ebp)
    18fb:	8b 45 f0             	mov    -0x10(%ebp),%eax
    18fe:	a3 c8 22 00 00       	mov    %eax,0x22c8
    1903:	a1 c8 22 00 00       	mov    0x22c8,%eax
    1908:	a3 c0 22 00 00       	mov    %eax,0x22c0
    base.s.size = 0;
    190d:	c7 05 c4 22 00 00 00 	movl   $0x0,0x22c4
    1914:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1917:	8b 45 f0             	mov    -0x10(%ebp),%eax
    191a:	8b 00                	mov    (%eax),%eax
    191c:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
    191f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1922:	8b 40 04             	mov    0x4(%eax),%eax
    1925:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    1928:	72 4d                	jb     1977 <malloc+0xa6>
      if(p->s.size == nunits)
    192a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    192d:	8b 40 04             	mov    0x4(%eax),%eax
    1930:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    1933:	75 0c                	jne    1941 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
    1935:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1938:	8b 10                	mov    (%eax),%edx
    193a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    193d:	89 10                	mov    %edx,(%eax)
    193f:	eb 26                	jmp    1967 <malloc+0x96>
      else {
        p->s.size -= nunits;
    1941:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1944:	8b 40 04             	mov    0x4(%eax),%eax
    1947:	2b 45 ec             	sub    -0x14(%ebp),%eax
    194a:	89 c2                	mov    %eax,%edx
    194c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    194f:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
    1952:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1955:	8b 40 04             	mov    0x4(%eax),%eax
    1958:	c1 e0 03             	shl    $0x3,%eax
    195b:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
    195e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1961:	8b 55 ec             	mov    -0x14(%ebp),%edx
    1964:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
    1967:	8b 45 f0             	mov    -0x10(%ebp),%eax
    196a:	a3 c8 22 00 00       	mov    %eax,0x22c8
      return (void*)(p + 1);
    196f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1972:	83 c0 08             	add    $0x8,%eax
    1975:	eb 38                	jmp    19af <malloc+0xde>
    }
    if(p == freep)
    1977:	a1 c8 22 00 00       	mov    0x22c8,%eax
    197c:	39 45 f4             	cmp    %eax,-0xc(%ebp)
    197f:	75 1b                	jne    199c <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
    1981:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1984:	89 04 24             	mov    %eax,(%esp)
    1987:	e8 ed fe ff ff       	call   1879 <morecore>
    198c:	89 45 f4             	mov    %eax,-0xc(%ebp)
    198f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1993:	75 07                	jne    199c <malloc+0xcb>
        return 0;
    1995:	b8 00 00 00 00       	mov    $0x0,%eax
    199a:	eb 13                	jmp    19af <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    199c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    199f:	89 45 f0             	mov    %eax,-0x10(%ebp)
    19a2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    19a5:	8b 00                	mov    (%eax),%eax
    19a7:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
    19aa:	e9 70 ff ff ff       	jmp    191f <malloc+0x4e>
}
    19af:	c9                   	leave  
    19b0:	c3                   	ret    
    19b1:	66 90                	xchg   %ax,%ax
    19b3:	90                   	nop

000019b4 <xchg>:
  asm volatile("sti");
}

static inline uint
xchg(volatile uint *addr, uint newval)
{
    19b4:	55                   	push   %ebp
    19b5:	89 e5                	mov    %esp,%ebp
    19b7:	83 ec 10             	sub    $0x10,%esp
  uint result;
  
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
    19ba:	8b 55 08             	mov    0x8(%ebp),%edx
    19bd:	8b 45 0c             	mov    0xc(%ebp),%eax
    19c0:	8b 4d 08             	mov    0x8(%ebp),%ecx
    19c3:	f0 87 02             	lock xchg %eax,(%edx)
    19c6:	89 45 fc             	mov    %eax,-0x4(%ebp)
               "+m" (*addr), "=a" (result) :
               "1" (newval) :
               "cc");
  return result;
    19c9:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    19cc:	c9                   	leave  
    19cd:	c3                   	ret    

000019ce <lock_init>:
#include "x86.h"
#include "proc.h"

unsigned long rands = 1;

void lock_init(lock_t *lock){
    19ce:	55                   	push   %ebp
    19cf:	89 e5                	mov    %esp,%ebp
    lock->locked = 0;
    19d1:	8b 45 08             	mov    0x8(%ebp),%eax
    19d4:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
    19da:	5d                   	pop    %ebp
    19db:	c3                   	ret    

000019dc <lock_acquire>:
void lock_acquire(lock_t *lock){
    19dc:	55                   	push   %ebp
    19dd:	89 e5                	mov    %esp,%ebp
    19df:	83 ec 08             	sub    $0x8,%esp
    while(xchg(&lock->locked,1) != 0);
    19e2:	90                   	nop
    19e3:	8b 45 08             	mov    0x8(%ebp),%eax
    19e6:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
    19ed:	00 
    19ee:	89 04 24             	mov    %eax,(%esp)
    19f1:	e8 be ff ff ff       	call   19b4 <xchg>
    19f6:	85 c0                	test   %eax,%eax
    19f8:	75 e9                	jne    19e3 <lock_acquire+0x7>
}
    19fa:	c9                   	leave  
    19fb:	c3                   	ret    

000019fc <lock_release>:
void lock_release(lock_t *lock){
    19fc:	55                   	push   %ebp
    19fd:	89 e5                	mov    %esp,%ebp
    19ff:	83 ec 08             	sub    $0x8,%esp
    xchg(&lock->locked,0);
    1a02:	8b 45 08             	mov    0x8(%ebp),%eax
    1a05:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1a0c:	00 
    1a0d:	89 04 24             	mov    %eax,(%esp)
    1a10:	e8 9f ff ff ff       	call   19b4 <xchg>
}
    1a15:	c9                   	leave  
    1a16:	c3                   	ret    

00001a17 <thread_create>:


void *thread_create(void(*start_routine)(void*), void *arg){
    1a17:	55                   	push   %ebp
    1a18:	89 e5                	mov    %esp,%ebp
    1a1a:	83 ec 28             	sub    $0x28,%esp
    int tid;
    void * stack = malloc(2 * 4096);
    1a1d:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
    1a24:	e8 a8 fe ff ff       	call   18d1 <malloc>
    1a29:	89 45 f4             	mov    %eax,-0xc(%ebp)
    void *garbage_stack = stack; 
    1a2c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1a2f:	89 45 f0             	mov    %eax,-0x10(%ebp)
   // printf(1,"start routine addr : %d\n",(uint)start_routine);


    if((uint)stack % 4096){
    1a32:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1a35:	25 ff 0f 00 00       	and    $0xfff,%eax
    1a3a:	85 c0                	test   %eax,%eax
    1a3c:	74 14                	je     1a52 <thread_create+0x3b>
        stack = stack + (4096 - (uint)stack % 4096);
    1a3e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1a41:	25 ff 0f 00 00       	and    $0xfff,%eax
    1a46:	89 c2                	mov    %eax,%edx
    1a48:	b8 00 10 00 00       	mov    $0x1000,%eax
    1a4d:	29 d0                	sub    %edx,%eax
    1a4f:	01 45 f4             	add    %eax,-0xc(%ebp)
    }
    if (stack == 0){
    1a52:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1a56:	75 1b                	jne    1a73 <thread_create+0x5c>

        printf(1,"malloc fail \n");
    1a58:	c7 44 24 04 1c 1e 00 	movl   $0x1e1c,0x4(%esp)
    1a5f:	00 
    1a60:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1a67:	e8 78 fb ff ff       	call   15e4 <printf>
        return 0;
    1a6c:	b8 00 00 00 00       	mov    $0x0,%eax
    1a71:	eb 6f                	jmp    1ae2 <thread_create+0xcb>
    }

    tid = clone((uint)stack,PSIZE,(uint)start_routine,(int)arg);
    1a73:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    1a76:	8b 55 08             	mov    0x8(%ebp),%edx
    1a79:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1a7c:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
    1a80:	89 54 24 08          	mov    %edx,0x8(%esp)
    1a84:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
    1a8b:	00 
    1a8c:	89 04 24             	mov    %eax,(%esp)
    1a8f:	e8 50 fa ff ff       	call   14e4 <clone>
    1a94:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(tid < 0){
    1a97:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1a9b:	79 1b                	jns    1ab8 <thread_create+0xa1>
        printf(1,"clone fails\n");
    1a9d:	c7 44 24 04 2a 1e 00 	movl   $0x1e2a,0x4(%esp)
    1aa4:	00 
    1aa5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1aac:	e8 33 fb ff ff       	call   15e4 <printf>
        return 0;
    1ab1:	b8 00 00 00 00       	mov    $0x0,%eax
    1ab6:	eb 2a                	jmp    1ae2 <thread_create+0xcb>
    }
    if(tid > 0){
    1ab8:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1abc:	7e 05                	jle    1ac3 <thread_create+0xac>
        //store threads on thread table
        return garbage_stack;
    1abe:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1ac1:	eb 1f                	jmp    1ae2 <thread_create+0xcb>
    }
    if(tid == 0){
    1ac3:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1ac7:	75 14                	jne    1add <thread_create+0xc6>
        printf(1,"tid = 0 return \n");
    1ac9:	c7 44 24 04 37 1e 00 	movl   $0x1e37,0x4(%esp)
    1ad0:	00 
    1ad1:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1ad8:	e8 07 fb ff ff       	call   15e4 <printf>
    }
//    wait();
//    free(garbage_stack);

    return 0;
    1add:	b8 00 00 00 00       	mov    $0x0,%eax
}
    1ae2:	c9                   	leave  
    1ae3:	c3                   	ret    

00001ae4 <random>:

// generate 0 -> max random number exclude max.
int random(int max){
    1ae4:	55                   	push   %ebp
    1ae5:	89 e5                	mov    %esp,%ebp
    rands = rands * 1664525 + 1013904233;
    1ae7:	a1 a0 22 00 00       	mov    0x22a0,%eax
    1aec:	69 c0 0d 66 19 00    	imul   $0x19660d,%eax,%eax
    1af2:	05 69 f3 6e 3c       	add    $0x3c6ef369,%eax
    1af7:	a3 a0 22 00 00       	mov    %eax,0x22a0
    return (int)(rands % max);
    1afc:	a1 a0 22 00 00       	mov    0x22a0,%eax
    1b01:	8b 4d 08             	mov    0x8(%ebp),%ecx
    1b04:	ba 00 00 00 00       	mov    $0x0,%edx
    1b09:	f7 f1                	div    %ecx
    1b0b:	89 d0                	mov    %edx,%eax
}
    1b0d:	5d                   	pop    %ebp
    1b0e:	c3                   	ret    
    1b0f:	90                   	nop

00001b10 <init_q>:
#include "queue.h"
#include "types.h"
#include "user.h"

void init_q(struct queue *q){
    1b10:	55                   	push   %ebp
    1b11:	89 e5                	mov    %esp,%ebp
    q->size = 0;
    1b13:	8b 45 08             	mov    0x8(%ebp),%eax
    1b16:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    q->head = 0;
    1b1c:	8b 45 08             	mov    0x8(%ebp),%eax
    1b1f:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    q->tail = 0;
    1b26:	8b 45 08             	mov    0x8(%ebp),%eax
    1b29:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
}
    1b30:	5d                   	pop    %ebp
    1b31:	c3                   	ret    

00001b32 <add_q>:

void add_q(struct queue *q, int v){
    1b32:	55                   	push   %ebp
    1b33:	89 e5                	mov    %esp,%ebp
    1b35:	83 ec 28             	sub    $0x28,%esp
    struct node * n = malloc(sizeof(struct node));
    1b38:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
    1b3f:	e8 8d fd ff ff       	call   18d1 <malloc>
    1b44:	89 45 f4             	mov    %eax,-0xc(%ebp)
    n->next = 0;
    1b47:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1b4a:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    n->value = v;
    1b51:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1b54:	8b 55 0c             	mov    0xc(%ebp),%edx
    1b57:	89 10                	mov    %edx,(%eax)
    if(q->head == 0){
    1b59:	8b 45 08             	mov    0x8(%ebp),%eax
    1b5c:	8b 40 04             	mov    0x4(%eax),%eax
    1b5f:	85 c0                	test   %eax,%eax
    1b61:	75 0b                	jne    1b6e <add_q+0x3c>
        q->head = n;
    1b63:	8b 45 08             	mov    0x8(%ebp),%eax
    1b66:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1b69:	89 50 04             	mov    %edx,0x4(%eax)
    1b6c:	eb 0c                	jmp    1b7a <add_q+0x48>
    }else{
        q->tail->next = n;
    1b6e:	8b 45 08             	mov    0x8(%ebp),%eax
    1b71:	8b 40 08             	mov    0x8(%eax),%eax
    1b74:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1b77:	89 50 04             	mov    %edx,0x4(%eax)
    }
    q->tail = n;
    1b7a:	8b 45 08             	mov    0x8(%ebp),%eax
    1b7d:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1b80:	89 50 08             	mov    %edx,0x8(%eax)
    q->size++;
    1b83:	8b 45 08             	mov    0x8(%ebp),%eax
    1b86:	8b 00                	mov    (%eax),%eax
    1b88:	8d 50 01             	lea    0x1(%eax),%edx
    1b8b:	8b 45 08             	mov    0x8(%ebp),%eax
    1b8e:	89 10                	mov    %edx,(%eax)
}
    1b90:	c9                   	leave  
    1b91:	c3                   	ret    

00001b92 <empty_q>:

int empty_q(struct queue *q){
    1b92:	55                   	push   %ebp
    1b93:	89 e5                	mov    %esp,%ebp
    if(q->size == 0)
    1b95:	8b 45 08             	mov    0x8(%ebp),%eax
    1b98:	8b 00                	mov    (%eax),%eax
    1b9a:	85 c0                	test   %eax,%eax
    1b9c:	75 07                	jne    1ba5 <empty_q+0x13>
        return 1;
    1b9e:	b8 01 00 00 00       	mov    $0x1,%eax
    1ba3:	eb 05                	jmp    1baa <empty_q+0x18>
    else
        return 0;
    1ba5:	b8 00 00 00 00       	mov    $0x0,%eax
} 
    1baa:	5d                   	pop    %ebp
    1bab:	c3                   	ret    

00001bac <pop_q>:
int pop_q(struct queue *q){
    1bac:	55                   	push   %ebp
    1bad:	89 e5                	mov    %esp,%ebp
    1baf:	83 ec 28             	sub    $0x28,%esp
    int val;
    struct node *destroy;
    if(!empty_q(q)){
    1bb2:	8b 45 08             	mov    0x8(%ebp),%eax
    1bb5:	89 04 24             	mov    %eax,(%esp)
    1bb8:	e8 d5 ff ff ff       	call   1b92 <empty_q>
    1bbd:	85 c0                	test   %eax,%eax
    1bbf:	75 5d                	jne    1c1e <pop_q+0x72>
       val = q->head->value; 
    1bc1:	8b 45 08             	mov    0x8(%ebp),%eax
    1bc4:	8b 40 04             	mov    0x4(%eax),%eax
    1bc7:	8b 00                	mov    (%eax),%eax
    1bc9:	89 45 f4             	mov    %eax,-0xc(%ebp)
       destroy = q->head;
    1bcc:	8b 45 08             	mov    0x8(%ebp),%eax
    1bcf:	8b 40 04             	mov    0x4(%eax),%eax
    1bd2:	89 45 f0             	mov    %eax,-0x10(%ebp)
       q->head = q->head->next;
    1bd5:	8b 45 08             	mov    0x8(%ebp),%eax
    1bd8:	8b 40 04             	mov    0x4(%eax),%eax
    1bdb:	8b 50 04             	mov    0x4(%eax),%edx
    1bde:	8b 45 08             	mov    0x8(%ebp),%eax
    1be1:	89 50 04             	mov    %edx,0x4(%eax)
       free(destroy);
    1be4:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1be7:	89 04 24             	mov    %eax,(%esp)
    1bea:	e8 a9 fb ff ff       	call   1798 <free>
       q->size--;
    1bef:	8b 45 08             	mov    0x8(%ebp),%eax
    1bf2:	8b 00                	mov    (%eax),%eax
    1bf4:	8d 50 ff             	lea    -0x1(%eax),%edx
    1bf7:	8b 45 08             	mov    0x8(%ebp),%eax
    1bfa:	89 10                	mov    %edx,(%eax)
       if(q->size == 0){
    1bfc:	8b 45 08             	mov    0x8(%ebp),%eax
    1bff:	8b 00                	mov    (%eax),%eax
    1c01:	85 c0                	test   %eax,%eax
    1c03:	75 14                	jne    1c19 <pop_q+0x6d>
            q->head = 0;
    1c05:	8b 45 08             	mov    0x8(%ebp),%eax
    1c08:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
            q->tail = 0;
    1c0f:	8b 45 08             	mov    0x8(%ebp),%eax
    1c12:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
       }
       return val;
    1c19:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1c1c:	eb 05                	jmp    1c23 <pop_q+0x77>
    }
    return -1;
    1c1e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
    1c23:	c9                   	leave  
    1c24:	c3                   	ret    

00001c25 <dominant>:

void dominant(struct queue* q, int i){
    1c25:	55                   	push   %ebp
    1c26:	89 e5                	mov    %esp,%ebp
    1c28:	83 ec 28             	sub    $0x28,%esp
    struct node * n = malloc(sizeof(struct node));
    1c2b:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
    1c32:	e8 9a fc ff ff       	call   18d1 <malloc>
    1c37:	89 45 f4             	mov    %eax,-0xc(%ebp)
    n->value = i;
    1c3a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1c3d:	8b 55 0c             	mov    0xc(%ebp),%edx
    1c40:	89 10                	mov    %edx,(%eax)

    if(q->head == 0){
    1c42:	8b 45 08             	mov    0x8(%ebp),%eax
    1c45:	8b 40 04             	mov    0x4(%eax),%eax
    1c48:	85 c0                	test   %eax,%eax
    1c4a:	75 14                	jne    1c60 <dominant+0x3b>
        q->head = n;
    1c4c:	8b 45 08             	mov    0x8(%ebp),%eax
    1c4f:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1c52:	89 50 04             	mov    %edx,0x4(%eax)
        q->tail = n;
    1c55:	8b 45 08             	mov    0x8(%ebp),%eax
    1c58:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1c5b:	89 50 08             	mov    %edx,0x8(%eax)
    1c5e:	eb 15                	jmp    1c75 <dominant+0x50>
    }
    else{
        n->next = q->head;
    1c60:	8b 45 08             	mov    0x8(%ebp),%eax
    1c63:	8b 50 04             	mov    0x4(%eax),%edx
    1c66:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1c69:	89 50 04             	mov    %edx,0x4(%eax)
        q->head = n;
    1c6c:	8b 45 08             	mov    0x8(%ebp),%eax
    1c6f:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1c72:	89 50 04             	mov    %edx,0x4(%eax)
    }
    q->size++;
    1c75:	8b 45 08             	mov    0x8(%ebp),%eax
    1c78:	8b 00                	mov    (%eax),%eax
    1c7a:	8d 50 01             	lea    0x1(%eax),%edx
    1c7d:	8b 45 08             	mov    0x8(%ebp),%eax
    1c80:	89 10                	mov    %edx,(%eax)
}
    1c82:	c9                   	leave  
    1c83:	c3                   	ret    

00001c84 <sem_init>:
#include "semaphore.h"
#include "user.h"

// Initializes the semaphore
void sem_init(struct Semaphore* s, int value){
    1c84:	55                   	push   %ebp
    1c85:	89 e5                	mov    %esp,%ebp
    1c87:	83 ec 18             	sub    $0x18,%esp
    s->val = value;
    1c8a:	8b 45 08             	mov    0x8(%ebp),%eax
    1c8d:	8b 55 0c             	mov    0xc(%ebp),%edx
    1c90:	89 10                	mov    %edx,(%eax)
    lock_init(&s->lock);
    1c92:	8b 45 08             	mov    0x8(%ebp),%eax
    1c95:	83 c0 04             	add    $0x4,%eax
    1c98:	89 04 24             	mov    %eax,(%esp)
    1c9b:	e8 2e fd ff ff       	call   19ce <lock_init>
    init_q(&s->q);
    1ca0:	8b 45 08             	mov    0x8(%ebp),%eax
    1ca3:	83 c0 08             	add    $0x8,%eax
    1ca6:	89 04 24             	mov    %eax,(%esp)
    1ca9:	e8 62 fe ff ff       	call   1b10 <init_q>
}
    1cae:	c9                   	leave  
    1caf:	c3                   	ret    

00001cb0 <sem_acquire>:

// Decrements the semaphore
void sem_acquire(struct Semaphore* s){
    1cb0:	55                   	push   %ebp
    1cb1:	89 e5                	mov    %esp,%ebp
    1cb3:	83 ec 28             	sub    $0x28,%esp
    lock_acquire(&s->lock);
    1cb6:	8b 45 08             	mov    0x8(%ebp),%eax
    1cb9:	83 c0 04             	add    $0x4,%eax
    1cbc:	89 04 24             	mov    %eax,(%esp)
    1cbf:	e8 18 fd ff ff       	call   19dc <lock_acquire>

    if(s->val == 0){
    1cc4:	8b 45 08             	mov    0x8(%ebp),%eax
    1cc7:	8b 00                	mov    (%eax),%eax
    1cc9:	85 c0                	test   %eax,%eax
    1ccb:	75 32                	jne    1cff <sem_acquire+0x4f>
        int pid;
        pid = getpid();
    1ccd:	e8 f2 f7 ff ff       	call   14c4 <getpid>
    1cd2:	89 45 f4             	mov    %eax,-0xc(%ebp)
        add_q(&s->q, pid);
    1cd5:	8b 45 08             	mov    0x8(%ebp),%eax
    1cd8:	8d 50 08             	lea    0x8(%eax),%edx
    1cdb:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1cde:	89 44 24 04          	mov    %eax,0x4(%esp)
    1ce2:	89 14 24             	mov    %edx,(%esp)
    1ce5:	e8 48 fe ff ff       	call   1b32 <add_q>
        lock_release(&s->lock);
    1cea:	8b 45 08             	mov    0x8(%ebp),%eax
    1ced:	83 c0 04             	add    $0x4,%eax
    1cf0:	89 04 24             	mov    %eax,(%esp)
    1cf3:	e8 04 fd ff ff       	call   19fc <lock_release>
        tsleep();
    1cf8:	e8 f7 f7 ff ff       	call   14f4 <tsleep>
    1cfd:	eb 1b                	jmp    1d1a <sem_acquire+0x6a>
    }
    else{
        s->val--;
    1cff:	8b 45 08             	mov    0x8(%ebp),%eax
    1d02:	8b 00                	mov    (%eax),%eax
    1d04:	8d 50 ff             	lea    -0x1(%eax),%edx
    1d07:	8b 45 08             	mov    0x8(%ebp),%eax
    1d0a:	89 10                	mov    %edx,(%eax)
        lock_release(&s->lock);
    1d0c:	8b 45 08             	mov    0x8(%ebp),%eax
    1d0f:	83 c0 04             	add    $0x4,%eax
    1d12:	89 04 24             	mov    %eax,(%esp)
    1d15:	e8 e2 fc ff ff       	call   19fc <lock_release>
    }
}
    1d1a:	c9                   	leave  
    1d1b:	c3                   	ret    

00001d1c <sem_signal>:

// Increments the semaphore
void sem_signal(struct Semaphore* s){
    1d1c:	55                   	push   %ebp
    1d1d:	89 e5                	mov    %esp,%ebp
    1d1f:	83 ec 18             	sub    $0x18,%esp
    lock_acquire(&s->lock);
    1d22:	8b 45 08             	mov    0x8(%ebp),%eax
    1d25:	83 c0 04             	add    $0x4,%eax
    1d28:	89 04 24             	mov    %eax,(%esp)
    1d2b:	e8 ac fc ff ff       	call   19dc <lock_acquire>

    if(!empty_q(&s->q)){
    1d30:	8b 45 08             	mov    0x8(%ebp),%eax
    1d33:	83 c0 08             	add    $0x8,%eax
    1d36:	89 04 24             	mov    %eax,(%esp)
    1d39:	e8 54 fe ff ff       	call   1b92 <empty_q>
    1d3e:	85 c0                	test   %eax,%eax
    1d40:	75 18                	jne    1d5a <sem_signal+0x3e>
        twakeup(pop_q(&s->q));
    1d42:	8b 45 08             	mov    0x8(%ebp),%eax
    1d45:	83 c0 08             	add    $0x8,%eax
    1d48:	89 04 24             	mov    %eax,(%esp)
    1d4b:	e8 5c fe ff ff       	call   1bac <pop_q>
    1d50:	89 04 24             	mov    %eax,(%esp)
    1d53:	e8 a4 f7 ff ff       	call   14fc <twakeup>
    1d58:	eb 0d                	jmp    1d67 <sem_signal+0x4b>
    }
    else{
        s->val++;
    1d5a:	8b 45 08             	mov    0x8(%ebp),%eax
    1d5d:	8b 00                	mov    (%eax),%eax
    1d5f:	8d 50 01             	lea    0x1(%eax),%edx
    1d62:	8b 45 08             	mov    0x8(%ebp),%eax
    1d65:	89 10                	mov    %edx,(%eax)
    }

    lock_release(&s->lock);
    1d67:	8b 45 08             	mov    0x8(%ebp),%eax
    1d6a:	83 c0 04             	add    $0x4,%eax
    1d6d:	89 04 24             	mov    %eax,(%esp)
    1d70:	e8 87 fc ff ff       	call   19fc <lock_release>
}
    1d75:	c9                   	leave  
    1d76:	c3                   	ret    

00001d77 <sem_dom_acquire>:

void sem_dom_acquire(struct Semaphore* s){
    1d77:	55                   	push   %ebp
    1d78:	89 e5                	mov    %esp,%ebp
    1d7a:	83 ec 18             	sub    $0x18,%esp
    lock_acquire(&s->lock);
    1d7d:	8b 45 08             	mov    0x8(%ebp),%eax
    1d80:	83 c0 04             	add    $0x4,%eax
    1d83:	89 04 24             	mov    %eax,(%esp)
    1d86:	e8 51 fc ff ff       	call   19dc <lock_acquire>

    if(s->val > 0){
    1d8b:	8b 45 08             	mov    0x8(%ebp),%eax
    1d8e:	8b 00                	mov    (%eax),%eax
    1d90:	85 c0                	test   %eax,%eax
    1d92:	7e 1d                	jle    1db1 <sem_dom_acquire+0x3a>
        s->val--;
    1d94:	8b 45 08             	mov    0x8(%ebp),%eax
    1d97:	8b 00                	mov    (%eax),%eax
    1d99:	8d 50 ff             	lea    -0x1(%eax),%edx
    1d9c:	8b 45 08             	mov    0x8(%ebp),%eax
    1d9f:	89 10                	mov    %edx,(%eax)
        lock_release(&s->lock);
    1da1:	8b 45 08             	mov    0x8(%ebp),%eax
    1da4:	83 c0 04             	add    $0x4,%eax
    1da7:	89 04 24             	mov    %eax,(%esp)
    1daa:	e8 4d fc ff ff       	call   19fc <lock_release>
        return;
    1daf:	eb 2a                	jmp    1ddb <sem_dom_acquire+0x64>
    }

    dominant(&s->q,getpid());
    1db1:	e8 0e f7 ff ff       	call   14c4 <getpid>
    1db6:	8b 55 08             	mov    0x8(%ebp),%edx
    1db9:	83 c2 08             	add    $0x8,%edx
    1dbc:	89 44 24 04          	mov    %eax,0x4(%esp)
    1dc0:	89 14 24             	mov    %edx,(%esp)
    1dc3:	e8 5d fe ff ff       	call   1c25 <dominant>
    lock_release(&s->lock);
    1dc8:	8b 45 08             	mov    0x8(%ebp),%eax
    1dcb:	83 c0 04             	add    $0x4,%eax
    1dce:	89 04 24             	mov    %eax,(%esp)
    1dd1:	e8 26 fc ff ff       	call   19fc <lock_release>
    tsleep();
    1dd6:	e8 19 f7 ff ff       	call   14f4 <tsleep>
}
    1ddb:	c9                   	leave  
    1ddc:	c3                   	ret    
