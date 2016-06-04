
_cat:     file format elf32-i386


Disassembly of section .text:

00001000 <cat>:

char buf[512];

void
cat(int fd)
{
    1000:	55                   	push   %ebp
    1001:	89 e5                	mov    %esp,%ebp
    1003:	83 ec 28             	sub    $0x28,%esp
  int n;

  while((n = read(fd, buf, sizeof(buf))) > 0)
    1006:	eb 1b                	jmp    1023 <cat+0x23>
    write(1, buf, n);
    1008:	8b 45 f4             	mov    -0xc(%ebp),%eax
    100b:	89 44 24 08          	mov    %eax,0x8(%esp)
    100f:	c7 44 24 04 00 22 00 	movl   $0x2200,0x4(%esp)
    1016:	00 
    1017:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    101e:	e8 85 03 00 00       	call   13a8 <write>
void
cat(int fd)
{
  int n;

  while((n = read(fd, buf, sizeof(buf))) > 0)
    1023:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
    102a:	00 
    102b:	c7 44 24 04 00 22 00 	movl   $0x2200,0x4(%esp)
    1032:	00 
    1033:	8b 45 08             	mov    0x8(%ebp),%eax
    1036:	89 04 24             	mov    %eax,(%esp)
    1039:	e8 62 03 00 00       	call   13a0 <read>
    103e:	89 45 f4             	mov    %eax,-0xc(%ebp)
    1041:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1045:	7f c1                	jg     1008 <cat+0x8>
    write(1, buf, n);
  if(n < 0){
    1047:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    104b:	79 19                	jns    1066 <cat+0x66>
    printf(1, "cat: read error\n");
    104d:	c7 44 24 04 21 1d 00 	movl   $0x1d21,0x4(%esp)
    1054:	00 
    1055:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    105c:	e8 c7 04 00 00       	call   1528 <printf>
    exit();
    1061:	e8 22 03 00 00       	call   1388 <exit>
  }
}
    1066:	c9                   	leave  
    1067:	c3                   	ret    

00001068 <main>:

int
main(int argc, char *argv[])
{
    1068:	55                   	push   %ebp
    1069:	89 e5                	mov    %esp,%ebp
    106b:	83 e4 f0             	and    $0xfffffff0,%esp
    106e:	83 ec 20             	sub    $0x20,%esp
  int fd, i;

  if(argc <= 1){
    1071:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
    1075:	7f 11                	jg     1088 <main+0x20>
    cat(0);
    1077:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    107e:	e8 7d ff ff ff       	call   1000 <cat>
    exit();
    1083:	e8 00 03 00 00       	call   1388 <exit>
  }

  for(i = 1; i < argc; i++){
    1088:	c7 44 24 1c 01 00 00 	movl   $0x1,0x1c(%esp)
    108f:	00 
    1090:	eb 79                	jmp    110b <main+0xa3>
    if((fd = open(argv[i], 0)) < 0){
    1092:	8b 44 24 1c          	mov    0x1c(%esp),%eax
    1096:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
    109d:	8b 45 0c             	mov    0xc(%ebp),%eax
    10a0:	01 d0                	add    %edx,%eax
    10a2:	8b 00                	mov    (%eax),%eax
    10a4:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    10ab:	00 
    10ac:	89 04 24             	mov    %eax,(%esp)
    10af:	e8 14 03 00 00       	call   13c8 <open>
    10b4:	89 44 24 18          	mov    %eax,0x18(%esp)
    10b8:	83 7c 24 18 00       	cmpl   $0x0,0x18(%esp)
    10bd:	79 2f                	jns    10ee <main+0x86>
      printf(1, "cat: cannot open %s\n", argv[i]);
    10bf:	8b 44 24 1c          	mov    0x1c(%esp),%eax
    10c3:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
    10ca:	8b 45 0c             	mov    0xc(%ebp),%eax
    10cd:	01 d0                	add    %edx,%eax
    10cf:	8b 00                	mov    (%eax),%eax
    10d1:	89 44 24 08          	mov    %eax,0x8(%esp)
    10d5:	c7 44 24 04 32 1d 00 	movl   $0x1d32,0x4(%esp)
    10dc:	00 
    10dd:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    10e4:	e8 3f 04 00 00       	call   1528 <printf>
      exit();
    10e9:	e8 9a 02 00 00       	call   1388 <exit>
    }
    cat(fd);
    10ee:	8b 44 24 18          	mov    0x18(%esp),%eax
    10f2:	89 04 24             	mov    %eax,(%esp)
    10f5:	e8 06 ff ff ff       	call   1000 <cat>
    close(fd);
    10fa:	8b 44 24 18          	mov    0x18(%esp),%eax
    10fe:	89 04 24             	mov    %eax,(%esp)
    1101:	e8 aa 02 00 00       	call   13b0 <close>
  if(argc <= 1){
    cat(0);
    exit();
  }

  for(i = 1; i < argc; i++){
    1106:	83 44 24 1c 01       	addl   $0x1,0x1c(%esp)
    110b:	8b 44 24 1c          	mov    0x1c(%esp),%eax
    110f:	3b 45 08             	cmp    0x8(%ebp),%eax
    1112:	0f 8c 7a ff ff ff    	jl     1092 <main+0x2a>
      exit();
    }
    cat(fd);
    close(fd);
  }
  exit();
    1118:	e8 6b 02 00 00       	call   1388 <exit>
    111d:	66 90                	xchg   %ax,%ax
    111f:	90                   	nop

00001120 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
    1120:	55                   	push   %ebp
    1121:	89 e5                	mov    %esp,%ebp
    1123:	57                   	push   %edi
    1124:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
    1125:	8b 4d 08             	mov    0x8(%ebp),%ecx
    1128:	8b 55 10             	mov    0x10(%ebp),%edx
    112b:	8b 45 0c             	mov    0xc(%ebp),%eax
    112e:	89 cb                	mov    %ecx,%ebx
    1130:	89 df                	mov    %ebx,%edi
    1132:	89 d1                	mov    %edx,%ecx
    1134:	fc                   	cld    
    1135:	f3 aa                	rep stos %al,%es:(%edi)
    1137:	89 ca                	mov    %ecx,%edx
    1139:	89 fb                	mov    %edi,%ebx
    113b:	89 5d 08             	mov    %ebx,0x8(%ebp)
    113e:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
    1141:	5b                   	pop    %ebx
    1142:	5f                   	pop    %edi
    1143:	5d                   	pop    %ebp
    1144:	c3                   	ret    

00001145 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
    1145:	55                   	push   %ebp
    1146:	89 e5                	mov    %esp,%ebp
    1148:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
    114b:	8b 45 08             	mov    0x8(%ebp),%eax
    114e:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
    1151:	90                   	nop
    1152:	8b 45 08             	mov    0x8(%ebp),%eax
    1155:	8d 50 01             	lea    0x1(%eax),%edx
    1158:	89 55 08             	mov    %edx,0x8(%ebp)
    115b:	8b 55 0c             	mov    0xc(%ebp),%edx
    115e:	8d 4a 01             	lea    0x1(%edx),%ecx
    1161:	89 4d 0c             	mov    %ecx,0xc(%ebp)
    1164:	0f b6 12             	movzbl (%edx),%edx
    1167:	88 10                	mov    %dl,(%eax)
    1169:	0f b6 00             	movzbl (%eax),%eax
    116c:	84 c0                	test   %al,%al
    116e:	75 e2                	jne    1152 <strcpy+0xd>
    ;
  return os;
    1170:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    1173:	c9                   	leave  
    1174:	c3                   	ret    

00001175 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    1175:	55                   	push   %ebp
    1176:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
    1178:	eb 08                	jmp    1182 <strcmp+0xd>
    p++, q++;
    117a:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    117e:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    1182:	8b 45 08             	mov    0x8(%ebp),%eax
    1185:	0f b6 00             	movzbl (%eax),%eax
    1188:	84 c0                	test   %al,%al
    118a:	74 10                	je     119c <strcmp+0x27>
    118c:	8b 45 08             	mov    0x8(%ebp),%eax
    118f:	0f b6 10             	movzbl (%eax),%edx
    1192:	8b 45 0c             	mov    0xc(%ebp),%eax
    1195:	0f b6 00             	movzbl (%eax),%eax
    1198:	38 c2                	cmp    %al,%dl
    119a:	74 de                	je     117a <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
    119c:	8b 45 08             	mov    0x8(%ebp),%eax
    119f:	0f b6 00             	movzbl (%eax),%eax
    11a2:	0f b6 d0             	movzbl %al,%edx
    11a5:	8b 45 0c             	mov    0xc(%ebp),%eax
    11a8:	0f b6 00             	movzbl (%eax),%eax
    11ab:	0f b6 c0             	movzbl %al,%eax
    11ae:	29 c2                	sub    %eax,%edx
    11b0:	89 d0                	mov    %edx,%eax
}
    11b2:	5d                   	pop    %ebp
    11b3:	c3                   	ret    

000011b4 <strlen>:

uint
strlen(char *s)
{
    11b4:	55                   	push   %ebp
    11b5:	89 e5                	mov    %esp,%ebp
    11b7:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
    11ba:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    11c1:	eb 04                	jmp    11c7 <strlen+0x13>
    11c3:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    11c7:	8b 55 fc             	mov    -0x4(%ebp),%edx
    11ca:	8b 45 08             	mov    0x8(%ebp),%eax
    11cd:	01 d0                	add    %edx,%eax
    11cf:	0f b6 00             	movzbl (%eax),%eax
    11d2:	84 c0                	test   %al,%al
    11d4:	75 ed                	jne    11c3 <strlen+0xf>
    ;
  return n;
    11d6:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    11d9:	c9                   	leave  
    11da:	c3                   	ret    

000011db <memset>:

void*
memset(void *dst, int c, uint n)
{
    11db:	55                   	push   %ebp
    11dc:	89 e5                	mov    %esp,%ebp
    11de:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
    11e1:	8b 45 10             	mov    0x10(%ebp),%eax
    11e4:	89 44 24 08          	mov    %eax,0x8(%esp)
    11e8:	8b 45 0c             	mov    0xc(%ebp),%eax
    11eb:	89 44 24 04          	mov    %eax,0x4(%esp)
    11ef:	8b 45 08             	mov    0x8(%ebp),%eax
    11f2:	89 04 24             	mov    %eax,(%esp)
    11f5:	e8 26 ff ff ff       	call   1120 <stosb>
  return dst;
    11fa:	8b 45 08             	mov    0x8(%ebp),%eax
}
    11fd:	c9                   	leave  
    11fe:	c3                   	ret    

000011ff <strchr>:

char*
strchr(const char *s, char c)
{
    11ff:	55                   	push   %ebp
    1200:	89 e5                	mov    %esp,%ebp
    1202:	83 ec 04             	sub    $0x4,%esp
    1205:	8b 45 0c             	mov    0xc(%ebp),%eax
    1208:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
    120b:	eb 14                	jmp    1221 <strchr+0x22>
    if(*s == c)
    120d:	8b 45 08             	mov    0x8(%ebp),%eax
    1210:	0f b6 00             	movzbl (%eax),%eax
    1213:	3a 45 fc             	cmp    -0x4(%ebp),%al
    1216:	75 05                	jne    121d <strchr+0x1e>
      return (char*)s;
    1218:	8b 45 08             	mov    0x8(%ebp),%eax
    121b:	eb 13                	jmp    1230 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
    121d:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    1221:	8b 45 08             	mov    0x8(%ebp),%eax
    1224:	0f b6 00             	movzbl (%eax),%eax
    1227:	84 c0                	test   %al,%al
    1229:	75 e2                	jne    120d <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
    122b:	b8 00 00 00 00       	mov    $0x0,%eax
}
    1230:	c9                   	leave  
    1231:	c3                   	ret    

00001232 <gets>:

char*
gets(char *buf, int max)
{
    1232:	55                   	push   %ebp
    1233:	89 e5                	mov    %esp,%ebp
    1235:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1238:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    123f:	eb 4c                	jmp    128d <gets+0x5b>
    cc = read(0, &c, 1);
    1241:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    1248:	00 
    1249:	8d 45 ef             	lea    -0x11(%ebp),%eax
    124c:	89 44 24 04          	mov    %eax,0x4(%esp)
    1250:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1257:	e8 44 01 00 00       	call   13a0 <read>
    125c:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
    125f:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1263:	7f 02                	jg     1267 <gets+0x35>
      break;
    1265:	eb 31                	jmp    1298 <gets+0x66>
    buf[i++] = c;
    1267:	8b 45 f4             	mov    -0xc(%ebp),%eax
    126a:	8d 50 01             	lea    0x1(%eax),%edx
    126d:	89 55 f4             	mov    %edx,-0xc(%ebp)
    1270:	89 c2                	mov    %eax,%edx
    1272:	8b 45 08             	mov    0x8(%ebp),%eax
    1275:	01 c2                	add    %eax,%edx
    1277:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    127b:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
    127d:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    1281:	3c 0a                	cmp    $0xa,%al
    1283:	74 13                	je     1298 <gets+0x66>
    1285:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    1289:	3c 0d                	cmp    $0xd,%al
    128b:	74 0b                	je     1298 <gets+0x66>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    128d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1290:	83 c0 01             	add    $0x1,%eax
    1293:	3b 45 0c             	cmp    0xc(%ebp),%eax
    1296:	7c a9                	jl     1241 <gets+0xf>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    1298:	8b 55 f4             	mov    -0xc(%ebp),%edx
    129b:	8b 45 08             	mov    0x8(%ebp),%eax
    129e:	01 d0                	add    %edx,%eax
    12a0:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
    12a3:	8b 45 08             	mov    0x8(%ebp),%eax
}
    12a6:	c9                   	leave  
    12a7:	c3                   	ret    

000012a8 <stat>:

int
stat(char *n, struct stat *st)
{
    12a8:	55                   	push   %ebp
    12a9:	89 e5                	mov    %esp,%ebp
    12ab:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    12ae:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    12b5:	00 
    12b6:	8b 45 08             	mov    0x8(%ebp),%eax
    12b9:	89 04 24             	mov    %eax,(%esp)
    12bc:	e8 07 01 00 00       	call   13c8 <open>
    12c1:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
    12c4:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    12c8:	79 07                	jns    12d1 <stat+0x29>
    return -1;
    12ca:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    12cf:	eb 23                	jmp    12f4 <stat+0x4c>
  r = fstat(fd, st);
    12d1:	8b 45 0c             	mov    0xc(%ebp),%eax
    12d4:	89 44 24 04          	mov    %eax,0x4(%esp)
    12d8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    12db:	89 04 24             	mov    %eax,(%esp)
    12de:	e8 fd 00 00 00       	call   13e0 <fstat>
    12e3:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
    12e6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    12e9:	89 04 24             	mov    %eax,(%esp)
    12ec:	e8 bf 00 00 00       	call   13b0 <close>
  return r;
    12f1:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
    12f4:	c9                   	leave  
    12f5:	c3                   	ret    

000012f6 <atoi>:

int
atoi(const char *s)
{
    12f6:	55                   	push   %ebp
    12f7:	89 e5                	mov    %esp,%ebp
    12f9:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
    12fc:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
    1303:	eb 25                	jmp    132a <atoi+0x34>
    n = n*10 + *s++ - '0';
    1305:	8b 55 fc             	mov    -0x4(%ebp),%edx
    1308:	89 d0                	mov    %edx,%eax
    130a:	c1 e0 02             	shl    $0x2,%eax
    130d:	01 d0                	add    %edx,%eax
    130f:	01 c0                	add    %eax,%eax
    1311:	89 c1                	mov    %eax,%ecx
    1313:	8b 45 08             	mov    0x8(%ebp),%eax
    1316:	8d 50 01             	lea    0x1(%eax),%edx
    1319:	89 55 08             	mov    %edx,0x8(%ebp)
    131c:	0f b6 00             	movzbl (%eax),%eax
    131f:	0f be c0             	movsbl %al,%eax
    1322:	01 c8                	add    %ecx,%eax
    1324:	83 e8 30             	sub    $0x30,%eax
    1327:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    132a:	8b 45 08             	mov    0x8(%ebp),%eax
    132d:	0f b6 00             	movzbl (%eax),%eax
    1330:	3c 2f                	cmp    $0x2f,%al
    1332:	7e 0a                	jle    133e <atoi+0x48>
    1334:	8b 45 08             	mov    0x8(%ebp),%eax
    1337:	0f b6 00             	movzbl (%eax),%eax
    133a:	3c 39                	cmp    $0x39,%al
    133c:	7e c7                	jle    1305 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
    133e:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    1341:	c9                   	leave  
    1342:	c3                   	ret    

00001343 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    1343:	55                   	push   %ebp
    1344:	89 e5                	mov    %esp,%ebp
    1346:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
    1349:	8b 45 08             	mov    0x8(%ebp),%eax
    134c:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
    134f:	8b 45 0c             	mov    0xc(%ebp),%eax
    1352:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
    1355:	eb 17                	jmp    136e <memmove+0x2b>
    *dst++ = *src++;
    1357:	8b 45 fc             	mov    -0x4(%ebp),%eax
    135a:	8d 50 01             	lea    0x1(%eax),%edx
    135d:	89 55 fc             	mov    %edx,-0x4(%ebp)
    1360:	8b 55 f8             	mov    -0x8(%ebp),%edx
    1363:	8d 4a 01             	lea    0x1(%edx),%ecx
    1366:	89 4d f8             	mov    %ecx,-0x8(%ebp)
    1369:	0f b6 12             	movzbl (%edx),%edx
    136c:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    136e:	8b 45 10             	mov    0x10(%ebp),%eax
    1371:	8d 50 ff             	lea    -0x1(%eax),%edx
    1374:	89 55 10             	mov    %edx,0x10(%ebp)
    1377:	85 c0                	test   %eax,%eax
    1379:	7f dc                	jg     1357 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
    137b:	8b 45 08             	mov    0x8(%ebp),%eax
}
    137e:	c9                   	leave  
    137f:	c3                   	ret    

00001380 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    1380:	b8 01 00 00 00       	mov    $0x1,%eax
    1385:	cd 40                	int    $0x40
    1387:	c3                   	ret    

00001388 <exit>:
SYSCALL(exit)
    1388:	b8 02 00 00 00       	mov    $0x2,%eax
    138d:	cd 40                	int    $0x40
    138f:	c3                   	ret    

00001390 <wait>:
SYSCALL(wait)
    1390:	b8 03 00 00 00       	mov    $0x3,%eax
    1395:	cd 40                	int    $0x40
    1397:	c3                   	ret    

00001398 <pipe>:
SYSCALL(pipe)
    1398:	b8 04 00 00 00       	mov    $0x4,%eax
    139d:	cd 40                	int    $0x40
    139f:	c3                   	ret    

000013a0 <read>:
SYSCALL(read)
    13a0:	b8 05 00 00 00       	mov    $0x5,%eax
    13a5:	cd 40                	int    $0x40
    13a7:	c3                   	ret    

000013a8 <write>:
SYSCALL(write)
    13a8:	b8 10 00 00 00       	mov    $0x10,%eax
    13ad:	cd 40                	int    $0x40
    13af:	c3                   	ret    

000013b0 <close>:
SYSCALL(close)
    13b0:	b8 15 00 00 00       	mov    $0x15,%eax
    13b5:	cd 40                	int    $0x40
    13b7:	c3                   	ret    

000013b8 <kill>:
SYSCALL(kill)
    13b8:	b8 06 00 00 00       	mov    $0x6,%eax
    13bd:	cd 40                	int    $0x40
    13bf:	c3                   	ret    

000013c0 <exec>:
SYSCALL(exec)
    13c0:	b8 07 00 00 00       	mov    $0x7,%eax
    13c5:	cd 40                	int    $0x40
    13c7:	c3                   	ret    

000013c8 <open>:
SYSCALL(open)
    13c8:	b8 0f 00 00 00       	mov    $0xf,%eax
    13cd:	cd 40                	int    $0x40
    13cf:	c3                   	ret    

000013d0 <mknod>:
SYSCALL(mknod)
    13d0:	b8 11 00 00 00       	mov    $0x11,%eax
    13d5:	cd 40                	int    $0x40
    13d7:	c3                   	ret    

000013d8 <unlink>:
SYSCALL(unlink)
    13d8:	b8 12 00 00 00       	mov    $0x12,%eax
    13dd:	cd 40                	int    $0x40
    13df:	c3                   	ret    

000013e0 <fstat>:
SYSCALL(fstat)
    13e0:	b8 08 00 00 00       	mov    $0x8,%eax
    13e5:	cd 40                	int    $0x40
    13e7:	c3                   	ret    

000013e8 <link>:
SYSCALL(link)
    13e8:	b8 13 00 00 00       	mov    $0x13,%eax
    13ed:	cd 40                	int    $0x40
    13ef:	c3                   	ret    

000013f0 <mkdir>:
SYSCALL(mkdir)
    13f0:	b8 14 00 00 00       	mov    $0x14,%eax
    13f5:	cd 40                	int    $0x40
    13f7:	c3                   	ret    

000013f8 <chdir>:
SYSCALL(chdir)
    13f8:	b8 09 00 00 00       	mov    $0x9,%eax
    13fd:	cd 40                	int    $0x40
    13ff:	c3                   	ret    

00001400 <dup>:
SYSCALL(dup)
    1400:	b8 0a 00 00 00       	mov    $0xa,%eax
    1405:	cd 40                	int    $0x40
    1407:	c3                   	ret    

00001408 <getpid>:
SYSCALL(getpid)
    1408:	b8 0b 00 00 00       	mov    $0xb,%eax
    140d:	cd 40                	int    $0x40
    140f:	c3                   	ret    

00001410 <sbrk>:
SYSCALL(sbrk)
    1410:	b8 0c 00 00 00       	mov    $0xc,%eax
    1415:	cd 40                	int    $0x40
    1417:	c3                   	ret    

00001418 <sleep>:
SYSCALL(sleep)
    1418:	b8 0d 00 00 00       	mov    $0xd,%eax
    141d:	cd 40                	int    $0x40
    141f:	c3                   	ret    

00001420 <uptime>:
SYSCALL(uptime)
    1420:	b8 0e 00 00 00       	mov    $0xe,%eax
    1425:	cd 40                	int    $0x40
    1427:	c3                   	ret    

00001428 <clone>:
SYSCALL(clone)
    1428:	b8 16 00 00 00       	mov    $0x16,%eax
    142d:	cd 40                	int    $0x40
    142f:	c3                   	ret    

00001430 <texit>:
SYSCALL(texit)
    1430:	b8 17 00 00 00       	mov    $0x17,%eax
    1435:	cd 40                	int    $0x40
    1437:	c3                   	ret    

00001438 <tsleep>:
SYSCALL(tsleep)
    1438:	b8 18 00 00 00       	mov    $0x18,%eax
    143d:	cd 40                	int    $0x40
    143f:	c3                   	ret    

00001440 <twakeup>:
SYSCALL(twakeup)
    1440:	b8 19 00 00 00       	mov    $0x19,%eax
    1445:	cd 40                	int    $0x40
    1447:	c3                   	ret    

00001448 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
    1448:	55                   	push   %ebp
    1449:	89 e5                	mov    %esp,%ebp
    144b:	83 ec 18             	sub    $0x18,%esp
    144e:	8b 45 0c             	mov    0xc(%ebp),%eax
    1451:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
    1454:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    145b:	00 
    145c:	8d 45 f4             	lea    -0xc(%ebp),%eax
    145f:	89 44 24 04          	mov    %eax,0x4(%esp)
    1463:	8b 45 08             	mov    0x8(%ebp),%eax
    1466:	89 04 24             	mov    %eax,(%esp)
    1469:	e8 3a ff ff ff       	call   13a8 <write>
}
    146e:	c9                   	leave  
    146f:	c3                   	ret    

00001470 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
    1470:	55                   	push   %ebp
    1471:	89 e5                	mov    %esp,%ebp
    1473:	56                   	push   %esi
    1474:	53                   	push   %ebx
    1475:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    1478:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
    147f:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
    1483:	74 17                	je     149c <printint+0x2c>
    1485:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    1489:	79 11                	jns    149c <printint+0x2c>
    neg = 1;
    148b:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
    1492:	8b 45 0c             	mov    0xc(%ebp),%eax
    1495:	f7 d8                	neg    %eax
    1497:	89 45 ec             	mov    %eax,-0x14(%ebp)
    149a:	eb 06                	jmp    14a2 <printint+0x32>
  } else {
    x = xx;
    149c:	8b 45 0c             	mov    0xc(%ebp),%eax
    149f:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
    14a2:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
    14a9:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    14ac:	8d 41 01             	lea    0x1(%ecx),%eax
    14af:	89 45 f4             	mov    %eax,-0xc(%ebp)
    14b2:	8b 5d 10             	mov    0x10(%ebp),%ebx
    14b5:	8b 45 ec             	mov    -0x14(%ebp),%eax
    14b8:	ba 00 00 00 00       	mov    $0x0,%edx
    14bd:	f7 f3                	div    %ebx
    14bf:	89 d0                	mov    %edx,%eax
    14c1:	0f b6 80 c0 21 00 00 	movzbl 0x21c0(%eax),%eax
    14c8:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
    14cc:	8b 75 10             	mov    0x10(%ebp),%esi
    14cf:	8b 45 ec             	mov    -0x14(%ebp),%eax
    14d2:	ba 00 00 00 00       	mov    $0x0,%edx
    14d7:	f7 f6                	div    %esi
    14d9:	89 45 ec             	mov    %eax,-0x14(%ebp)
    14dc:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    14e0:	75 c7                	jne    14a9 <printint+0x39>
  if(neg)
    14e2:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    14e6:	74 10                	je     14f8 <printint+0x88>
    buf[i++] = '-';
    14e8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    14eb:	8d 50 01             	lea    0x1(%eax),%edx
    14ee:	89 55 f4             	mov    %edx,-0xc(%ebp)
    14f1:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
    14f6:	eb 1f                	jmp    1517 <printint+0xa7>
    14f8:	eb 1d                	jmp    1517 <printint+0xa7>
    putc(fd, buf[i]);
    14fa:	8d 55 dc             	lea    -0x24(%ebp),%edx
    14fd:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1500:	01 d0                	add    %edx,%eax
    1502:	0f b6 00             	movzbl (%eax),%eax
    1505:	0f be c0             	movsbl %al,%eax
    1508:	89 44 24 04          	mov    %eax,0x4(%esp)
    150c:	8b 45 08             	mov    0x8(%ebp),%eax
    150f:	89 04 24             	mov    %eax,(%esp)
    1512:	e8 31 ff ff ff       	call   1448 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    1517:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    151b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    151f:	79 d9                	jns    14fa <printint+0x8a>
    putc(fd, buf[i]);
}
    1521:	83 c4 30             	add    $0x30,%esp
    1524:	5b                   	pop    %ebx
    1525:	5e                   	pop    %esi
    1526:	5d                   	pop    %ebp
    1527:	c3                   	ret    

00001528 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    1528:	55                   	push   %ebp
    1529:	89 e5                	mov    %esp,%ebp
    152b:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
    152e:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
    1535:	8d 45 0c             	lea    0xc(%ebp),%eax
    1538:	83 c0 04             	add    $0x4,%eax
    153b:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
    153e:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    1545:	e9 7c 01 00 00       	jmp    16c6 <printf+0x19e>
    c = fmt[i] & 0xff;
    154a:	8b 55 0c             	mov    0xc(%ebp),%edx
    154d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1550:	01 d0                	add    %edx,%eax
    1552:	0f b6 00             	movzbl (%eax),%eax
    1555:	0f be c0             	movsbl %al,%eax
    1558:	25 ff 00 00 00       	and    $0xff,%eax
    155d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
    1560:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1564:	75 2c                	jne    1592 <printf+0x6a>
      if(c == '%'){
    1566:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    156a:	75 0c                	jne    1578 <printf+0x50>
        state = '%';
    156c:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
    1573:	e9 4a 01 00 00       	jmp    16c2 <printf+0x19a>
      } else {
        putc(fd, c);
    1578:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    157b:	0f be c0             	movsbl %al,%eax
    157e:	89 44 24 04          	mov    %eax,0x4(%esp)
    1582:	8b 45 08             	mov    0x8(%ebp),%eax
    1585:	89 04 24             	mov    %eax,(%esp)
    1588:	e8 bb fe ff ff       	call   1448 <putc>
    158d:	e9 30 01 00 00       	jmp    16c2 <printf+0x19a>
      }
    } else if(state == '%'){
    1592:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
    1596:	0f 85 26 01 00 00    	jne    16c2 <printf+0x19a>
      if(c == 'd'){
    159c:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
    15a0:	75 2d                	jne    15cf <printf+0xa7>
        printint(fd, *ap, 10, 1);
    15a2:	8b 45 e8             	mov    -0x18(%ebp),%eax
    15a5:	8b 00                	mov    (%eax),%eax
    15a7:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    15ae:	00 
    15af:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
    15b6:	00 
    15b7:	89 44 24 04          	mov    %eax,0x4(%esp)
    15bb:	8b 45 08             	mov    0x8(%ebp),%eax
    15be:	89 04 24             	mov    %eax,(%esp)
    15c1:	e8 aa fe ff ff       	call   1470 <printint>
        ap++;
    15c6:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    15ca:	e9 ec 00 00 00       	jmp    16bb <printf+0x193>
      } else if(c == 'x' || c == 'p'){
    15cf:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
    15d3:	74 06                	je     15db <printf+0xb3>
    15d5:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
    15d9:	75 2d                	jne    1608 <printf+0xe0>
        printint(fd, *ap, 16, 0);
    15db:	8b 45 e8             	mov    -0x18(%ebp),%eax
    15de:	8b 00                	mov    (%eax),%eax
    15e0:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    15e7:	00 
    15e8:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
    15ef:	00 
    15f0:	89 44 24 04          	mov    %eax,0x4(%esp)
    15f4:	8b 45 08             	mov    0x8(%ebp),%eax
    15f7:	89 04 24             	mov    %eax,(%esp)
    15fa:	e8 71 fe ff ff       	call   1470 <printint>
        ap++;
    15ff:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    1603:	e9 b3 00 00 00       	jmp    16bb <printf+0x193>
      } else if(c == 's'){
    1608:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
    160c:	75 45                	jne    1653 <printf+0x12b>
        s = (char*)*ap;
    160e:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1611:	8b 00                	mov    (%eax),%eax
    1613:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
    1616:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
    161a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    161e:	75 09                	jne    1629 <printf+0x101>
          s = "(null)";
    1620:	c7 45 f4 47 1d 00 00 	movl   $0x1d47,-0xc(%ebp)
        while(*s != 0){
    1627:	eb 1e                	jmp    1647 <printf+0x11f>
    1629:	eb 1c                	jmp    1647 <printf+0x11f>
          putc(fd, *s);
    162b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    162e:	0f b6 00             	movzbl (%eax),%eax
    1631:	0f be c0             	movsbl %al,%eax
    1634:	89 44 24 04          	mov    %eax,0x4(%esp)
    1638:	8b 45 08             	mov    0x8(%ebp),%eax
    163b:	89 04 24             	mov    %eax,(%esp)
    163e:	e8 05 fe ff ff       	call   1448 <putc>
          s++;
    1643:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    1647:	8b 45 f4             	mov    -0xc(%ebp),%eax
    164a:	0f b6 00             	movzbl (%eax),%eax
    164d:	84 c0                	test   %al,%al
    164f:	75 da                	jne    162b <printf+0x103>
    1651:	eb 68                	jmp    16bb <printf+0x193>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    1653:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
    1657:	75 1d                	jne    1676 <printf+0x14e>
        putc(fd, *ap);
    1659:	8b 45 e8             	mov    -0x18(%ebp),%eax
    165c:	8b 00                	mov    (%eax),%eax
    165e:	0f be c0             	movsbl %al,%eax
    1661:	89 44 24 04          	mov    %eax,0x4(%esp)
    1665:	8b 45 08             	mov    0x8(%ebp),%eax
    1668:	89 04 24             	mov    %eax,(%esp)
    166b:	e8 d8 fd ff ff       	call   1448 <putc>
        ap++;
    1670:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    1674:	eb 45                	jmp    16bb <printf+0x193>
      } else if(c == '%'){
    1676:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    167a:	75 17                	jne    1693 <printf+0x16b>
        putc(fd, c);
    167c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    167f:	0f be c0             	movsbl %al,%eax
    1682:	89 44 24 04          	mov    %eax,0x4(%esp)
    1686:	8b 45 08             	mov    0x8(%ebp),%eax
    1689:	89 04 24             	mov    %eax,(%esp)
    168c:	e8 b7 fd ff ff       	call   1448 <putc>
    1691:	eb 28                	jmp    16bb <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
    1693:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
    169a:	00 
    169b:	8b 45 08             	mov    0x8(%ebp),%eax
    169e:	89 04 24             	mov    %eax,(%esp)
    16a1:	e8 a2 fd ff ff       	call   1448 <putc>
        putc(fd, c);
    16a6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    16a9:	0f be c0             	movsbl %al,%eax
    16ac:	89 44 24 04          	mov    %eax,0x4(%esp)
    16b0:	8b 45 08             	mov    0x8(%ebp),%eax
    16b3:	89 04 24             	mov    %eax,(%esp)
    16b6:	e8 8d fd ff ff       	call   1448 <putc>
      }
      state = 0;
    16bb:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    16c2:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    16c6:	8b 55 0c             	mov    0xc(%ebp),%edx
    16c9:	8b 45 f0             	mov    -0x10(%ebp),%eax
    16cc:	01 d0                	add    %edx,%eax
    16ce:	0f b6 00             	movzbl (%eax),%eax
    16d1:	84 c0                	test   %al,%al
    16d3:	0f 85 71 fe ff ff    	jne    154a <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    16d9:	c9                   	leave  
    16da:	c3                   	ret    
    16db:	90                   	nop

000016dc <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    16dc:	55                   	push   %ebp
    16dd:	89 e5                	mov    %esp,%ebp
    16df:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
    16e2:	8b 45 08             	mov    0x8(%ebp),%eax
    16e5:	83 e8 08             	sub    $0x8,%eax
    16e8:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    16eb:	a1 e8 21 00 00       	mov    0x21e8,%eax
    16f0:	89 45 fc             	mov    %eax,-0x4(%ebp)
    16f3:	eb 24                	jmp    1719 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    16f5:	8b 45 fc             	mov    -0x4(%ebp),%eax
    16f8:	8b 00                	mov    (%eax),%eax
    16fa:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    16fd:	77 12                	ja     1711 <free+0x35>
    16ff:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1702:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    1705:	77 24                	ja     172b <free+0x4f>
    1707:	8b 45 fc             	mov    -0x4(%ebp),%eax
    170a:	8b 00                	mov    (%eax),%eax
    170c:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    170f:	77 1a                	ja     172b <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1711:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1714:	8b 00                	mov    (%eax),%eax
    1716:	89 45 fc             	mov    %eax,-0x4(%ebp)
    1719:	8b 45 f8             	mov    -0x8(%ebp),%eax
    171c:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    171f:	76 d4                	jbe    16f5 <free+0x19>
    1721:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1724:	8b 00                	mov    (%eax),%eax
    1726:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    1729:	76 ca                	jbe    16f5 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    172b:	8b 45 f8             	mov    -0x8(%ebp),%eax
    172e:	8b 40 04             	mov    0x4(%eax),%eax
    1731:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    1738:	8b 45 f8             	mov    -0x8(%ebp),%eax
    173b:	01 c2                	add    %eax,%edx
    173d:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1740:	8b 00                	mov    (%eax),%eax
    1742:	39 c2                	cmp    %eax,%edx
    1744:	75 24                	jne    176a <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
    1746:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1749:	8b 50 04             	mov    0x4(%eax),%edx
    174c:	8b 45 fc             	mov    -0x4(%ebp),%eax
    174f:	8b 00                	mov    (%eax),%eax
    1751:	8b 40 04             	mov    0x4(%eax),%eax
    1754:	01 c2                	add    %eax,%edx
    1756:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1759:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
    175c:	8b 45 fc             	mov    -0x4(%ebp),%eax
    175f:	8b 00                	mov    (%eax),%eax
    1761:	8b 10                	mov    (%eax),%edx
    1763:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1766:	89 10                	mov    %edx,(%eax)
    1768:	eb 0a                	jmp    1774 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
    176a:	8b 45 fc             	mov    -0x4(%ebp),%eax
    176d:	8b 10                	mov    (%eax),%edx
    176f:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1772:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
    1774:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1777:	8b 40 04             	mov    0x4(%eax),%eax
    177a:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    1781:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1784:	01 d0                	add    %edx,%eax
    1786:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    1789:	75 20                	jne    17ab <free+0xcf>
    p->s.size += bp->s.size;
    178b:	8b 45 fc             	mov    -0x4(%ebp),%eax
    178e:	8b 50 04             	mov    0x4(%eax),%edx
    1791:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1794:	8b 40 04             	mov    0x4(%eax),%eax
    1797:	01 c2                	add    %eax,%edx
    1799:	8b 45 fc             	mov    -0x4(%ebp),%eax
    179c:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    179f:	8b 45 f8             	mov    -0x8(%ebp),%eax
    17a2:	8b 10                	mov    (%eax),%edx
    17a4:	8b 45 fc             	mov    -0x4(%ebp),%eax
    17a7:	89 10                	mov    %edx,(%eax)
    17a9:	eb 08                	jmp    17b3 <free+0xd7>
  } else
    p->s.ptr = bp;
    17ab:	8b 45 fc             	mov    -0x4(%ebp),%eax
    17ae:	8b 55 f8             	mov    -0x8(%ebp),%edx
    17b1:	89 10                	mov    %edx,(%eax)
  freep = p;
    17b3:	8b 45 fc             	mov    -0x4(%ebp),%eax
    17b6:	a3 e8 21 00 00       	mov    %eax,0x21e8
}
    17bb:	c9                   	leave  
    17bc:	c3                   	ret    

000017bd <morecore>:

static Header*
morecore(uint nu)
{
    17bd:	55                   	push   %ebp
    17be:	89 e5                	mov    %esp,%ebp
    17c0:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
    17c3:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
    17ca:	77 07                	ja     17d3 <morecore+0x16>
    nu = 4096;
    17cc:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
    17d3:	8b 45 08             	mov    0x8(%ebp),%eax
    17d6:	c1 e0 03             	shl    $0x3,%eax
    17d9:	89 04 24             	mov    %eax,(%esp)
    17dc:	e8 2f fc ff ff       	call   1410 <sbrk>
    17e1:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
    17e4:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
    17e8:	75 07                	jne    17f1 <morecore+0x34>
    return 0;
    17ea:	b8 00 00 00 00       	mov    $0x0,%eax
    17ef:	eb 22                	jmp    1813 <morecore+0x56>
  hp = (Header*)p;
    17f1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    17f4:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
    17f7:	8b 45 f0             	mov    -0x10(%ebp),%eax
    17fa:	8b 55 08             	mov    0x8(%ebp),%edx
    17fd:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
    1800:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1803:	83 c0 08             	add    $0x8,%eax
    1806:	89 04 24             	mov    %eax,(%esp)
    1809:	e8 ce fe ff ff       	call   16dc <free>
  return freep;
    180e:	a1 e8 21 00 00       	mov    0x21e8,%eax
}
    1813:	c9                   	leave  
    1814:	c3                   	ret    

00001815 <malloc>:

void*
malloc(uint nbytes)
{
    1815:	55                   	push   %ebp
    1816:	89 e5                	mov    %esp,%ebp
    1818:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    181b:	8b 45 08             	mov    0x8(%ebp),%eax
    181e:	83 c0 07             	add    $0x7,%eax
    1821:	c1 e8 03             	shr    $0x3,%eax
    1824:	83 c0 01             	add    $0x1,%eax
    1827:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
    182a:	a1 e8 21 00 00       	mov    0x21e8,%eax
    182f:	89 45 f0             	mov    %eax,-0x10(%ebp)
    1832:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1836:	75 23                	jne    185b <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
    1838:	c7 45 f0 e0 21 00 00 	movl   $0x21e0,-0x10(%ebp)
    183f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1842:	a3 e8 21 00 00       	mov    %eax,0x21e8
    1847:	a1 e8 21 00 00       	mov    0x21e8,%eax
    184c:	a3 e0 21 00 00       	mov    %eax,0x21e0
    base.s.size = 0;
    1851:	c7 05 e4 21 00 00 00 	movl   $0x0,0x21e4
    1858:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    185b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    185e:	8b 00                	mov    (%eax),%eax
    1860:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
    1863:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1866:	8b 40 04             	mov    0x4(%eax),%eax
    1869:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    186c:	72 4d                	jb     18bb <malloc+0xa6>
      if(p->s.size == nunits)
    186e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1871:	8b 40 04             	mov    0x4(%eax),%eax
    1874:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    1877:	75 0c                	jne    1885 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
    1879:	8b 45 f4             	mov    -0xc(%ebp),%eax
    187c:	8b 10                	mov    (%eax),%edx
    187e:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1881:	89 10                	mov    %edx,(%eax)
    1883:	eb 26                	jmp    18ab <malloc+0x96>
      else {
        p->s.size -= nunits;
    1885:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1888:	8b 40 04             	mov    0x4(%eax),%eax
    188b:	2b 45 ec             	sub    -0x14(%ebp),%eax
    188e:	89 c2                	mov    %eax,%edx
    1890:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1893:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
    1896:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1899:	8b 40 04             	mov    0x4(%eax),%eax
    189c:	c1 e0 03             	shl    $0x3,%eax
    189f:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
    18a2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    18a5:	8b 55 ec             	mov    -0x14(%ebp),%edx
    18a8:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
    18ab:	8b 45 f0             	mov    -0x10(%ebp),%eax
    18ae:	a3 e8 21 00 00       	mov    %eax,0x21e8
      return (void*)(p + 1);
    18b3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    18b6:	83 c0 08             	add    $0x8,%eax
    18b9:	eb 38                	jmp    18f3 <malloc+0xde>
    }
    if(p == freep)
    18bb:	a1 e8 21 00 00       	mov    0x21e8,%eax
    18c0:	39 45 f4             	cmp    %eax,-0xc(%ebp)
    18c3:	75 1b                	jne    18e0 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
    18c5:	8b 45 ec             	mov    -0x14(%ebp),%eax
    18c8:	89 04 24             	mov    %eax,(%esp)
    18cb:	e8 ed fe ff ff       	call   17bd <morecore>
    18d0:	89 45 f4             	mov    %eax,-0xc(%ebp)
    18d3:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    18d7:	75 07                	jne    18e0 <malloc+0xcb>
        return 0;
    18d9:	b8 00 00 00 00       	mov    $0x0,%eax
    18de:	eb 13                	jmp    18f3 <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    18e0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    18e3:	89 45 f0             	mov    %eax,-0x10(%ebp)
    18e6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    18e9:	8b 00                	mov    (%eax),%eax
    18eb:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
    18ee:	e9 70 ff ff ff       	jmp    1863 <malloc+0x4e>
}
    18f3:	c9                   	leave  
    18f4:	c3                   	ret    
    18f5:	66 90                	xchg   %ax,%ax
    18f7:	90                   	nop

000018f8 <xchg>:
  asm volatile("sti");
}

static inline uint
xchg(volatile uint *addr, uint newval)
{
    18f8:	55                   	push   %ebp
    18f9:	89 e5                	mov    %esp,%ebp
    18fb:	83 ec 10             	sub    $0x10,%esp
  uint result;
  
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
    18fe:	8b 55 08             	mov    0x8(%ebp),%edx
    1901:	8b 45 0c             	mov    0xc(%ebp),%eax
    1904:	8b 4d 08             	mov    0x8(%ebp),%ecx
    1907:	f0 87 02             	lock xchg %eax,(%edx)
    190a:	89 45 fc             	mov    %eax,-0x4(%ebp)
               "+m" (*addr), "=a" (result) :
               "1" (newval) :
               "cc");
  return result;
    190d:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    1910:	c9                   	leave  
    1911:	c3                   	ret    

00001912 <lock_init>:
#include "x86.h"
#include "proc.h"

unsigned long rands = 1;

void lock_init(lock_t *lock){
    1912:	55                   	push   %ebp
    1913:	89 e5                	mov    %esp,%ebp
    lock->locked = 0;
    1915:	8b 45 08             	mov    0x8(%ebp),%eax
    1918:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
    191e:	5d                   	pop    %ebp
    191f:	c3                   	ret    

00001920 <lock_acquire>:
void lock_acquire(lock_t *lock){
    1920:	55                   	push   %ebp
    1921:	89 e5                	mov    %esp,%ebp
    1923:	83 ec 08             	sub    $0x8,%esp
    while(xchg(&lock->locked,1) != 0);
    1926:	90                   	nop
    1927:	8b 45 08             	mov    0x8(%ebp),%eax
    192a:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
    1931:	00 
    1932:	89 04 24             	mov    %eax,(%esp)
    1935:	e8 be ff ff ff       	call   18f8 <xchg>
    193a:	85 c0                	test   %eax,%eax
    193c:	75 e9                	jne    1927 <lock_acquire+0x7>
}
    193e:	c9                   	leave  
    193f:	c3                   	ret    

00001940 <lock_release>:
void lock_release(lock_t *lock){
    1940:	55                   	push   %ebp
    1941:	89 e5                	mov    %esp,%ebp
    1943:	83 ec 08             	sub    $0x8,%esp
    xchg(&lock->locked,0);
    1946:	8b 45 08             	mov    0x8(%ebp),%eax
    1949:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1950:	00 
    1951:	89 04 24             	mov    %eax,(%esp)
    1954:	e8 9f ff ff ff       	call   18f8 <xchg>
}
    1959:	c9                   	leave  
    195a:	c3                   	ret    

0000195b <thread_create>:


void *thread_create(void(*start_routine)(void*), void *arg){
    195b:	55                   	push   %ebp
    195c:	89 e5                	mov    %esp,%ebp
    195e:	83 ec 28             	sub    $0x28,%esp
    int tid;
    void * stack = malloc(2 * 4096);
    1961:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
    1968:	e8 a8 fe ff ff       	call   1815 <malloc>
    196d:	89 45 f4             	mov    %eax,-0xc(%ebp)
    void *garbage_stack = stack; 
    1970:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1973:	89 45 f0             	mov    %eax,-0x10(%ebp)
   // printf(1,"start routine addr : %d\n",(uint)start_routine);


    if((uint)stack % 4096){
    1976:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1979:	25 ff 0f 00 00       	and    $0xfff,%eax
    197e:	85 c0                	test   %eax,%eax
    1980:	74 14                	je     1996 <thread_create+0x3b>
        stack = stack + (4096 - (uint)stack % 4096);
    1982:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1985:	25 ff 0f 00 00       	and    $0xfff,%eax
    198a:	89 c2                	mov    %eax,%edx
    198c:	b8 00 10 00 00       	mov    $0x1000,%eax
    1991:	29 d0                	sub    %edx,%eax
    1993:	01 45 f4             	add    %eax,-0xc(%ebp)
    }
    if (stack == 0){
    1996:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    199a:	75 1b                	jne    19b7 <thread_create+0x5c>

        printf(1,"malloc fail \n");
    199c:	c7 44 24 04 4e 1d 00 	movl   $0x1d4e,0x4(%esp)
    19a3:	00 
    19a4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    19ab:	e8 78 fb ff ff       	call   1528 <printf>
        return 0;
    19b0:	b8 00 00 00 00       	mov    $0x0,%eax
    19b5:	eb 6f                	jmp    1a26 <thread_create+0xcb>
    }

    tid = clone((uint)stack,PSIZE,(uint)start_routine,(int)arg);
    19b7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    19ba:	8b 55 08             	mov    0x8(%ebp),%edx
    19bd:	8b 45 f4             	mov    -0xc(%ebp),%eax
    19c0:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
    19c4:	89 54 24 08          	mov    %edx,0x8(%esp)
    19c8:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
    19cf:	00 
    19d0:	89 04 24             	mov    %eax,(%esp)
    19d3:	e8 50 fa ff ff       	call   1428 <clone>
    19d8:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(tid < 0){
    19db:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    19df:	79 1b                	jns    19fc <thread_create+0xa1>
        printf(1,"clone fails\n");
    19e1:	c7 44 24 04 5c 1d 00 	movl   $0x1d5c,0x4(%esp)
    19e8:	00 
    19e9:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    19f0:	e8 33 fb ff ff       	call   1528 <printf>
        return 0;
    19f5:	b8 00 00 00 00       	mov    $0x0,%eax
    19fa:	eb 2a                	jmp    1a26 <thread_create+0xcb>
    }
    if(tid > 0){
    19fc:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1a00:	7e 05                	jle    1a07 <thread_create+0xac>
        //store threads on thread table
        return garbage_stack;
    1a02:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1a05:	eb 1f                	jmp    1a26 <thread_create+0xcb>
    }
    if(tid == 0){
    1a07:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1a0b:	75 14                	jne    1a21 <thread_create+0xc6>
        printf(1,"tid = 0 return \n");
    1a0d:	c7 44 24 04 69 1d 00 	movl   $0x1d69,0x4(%esp)
    1a14:	00 
    1a15:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1a1c:	e8 07 fb ff ff       	call   1528 <printf>
    }
//    wait();
//    free(garbage_stack);

    return 0;
    1a21:	b8 00 00 00 00       	mov    $0x0,%eax
}
    1a26:	c9                   	leave  
    1a27:	c3                   	ret    

00001a28 <random>:

// generate 0 -> max random number exclude max.
int random(int max){
    1a28:	55                   	push   %ebp
    1a29:	89 e5                	mov    %esp,%ebp
    rands = rands * 1664525 + 1013904233;
    1a2b:	a1 d4 21 00 00       	mov    0x21d4,%eax
    1a30:	69 c0 0d 66 19 00    	imul   $0x19660d,%eax,%eax
    1a36:	05 69 f3 6e 3c       	add    $0x3c6ef369,%eax
    1a3b:	a3 d4 21 00 00       	mov    %eax,0x21d4
    return (int)(rands % max);
    1a40:	a1 d4 21 00 00       	mov    0x21d4,%eax
    1a45:	8b 4d 08             	mov    0x8(%ebp),%ecx
    1a48:	ba 00 00 00 00       	mov    $0x0,%edx
    1a4d:	f7 f1                	div    %ecx
    1a4f:	89 d0                	mov    %edx,%eax
}
    1a51:	5d                   	pop    %ebp
    1a52:	c3                   	ret    
    1a53:	90                   	nop

00001a54 <init_q>:
#include "queue.h"
#include "types.h"
#include "user.h"

void init_q(struct queue *q){
    1a54:	55                   	push   %ebp
    1a55:	89 e5                	mov    %esp,%ebp
    q->size = 0;
    1a57:	8b 45 08             	mov    0x8(%ebp),%eax
    1a5a:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    q->head = 0;
    1a60:	8b 45 08             	mov    0x8(%ebp),%eax
    1a63:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    q->tail = 0;
    1a6a:	8b 45 08             	mov    0x8(%ebp),%eax
    1a6d:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
}
    1a74:	5d                   	pop    %ebp
    1a75:	c3                   	ret    

00001a76 <add_q>:

void add_q(struct queue *q, int v){
    1a76:	55                   	push   %ebp
    1a77:	89 e5                	mov    %esp,%ebp
    1a79:	83 ec 28             	sub    $0x28,%esp
    struct node * n = malloc(sizeof(struct node));
    1a7c:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
    1a83:	e8 8d fd ff ff       	call   1815 <malloc>
    1a88:	89 45 f4             	mov    %eax,-0xc(%ebp)
    n->next = 0;
    1a8b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1a8e:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    n->value = v;
    1a95:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1a98:	8b 55 0c             	mov    0xc(%ebp),%edx
    1a9b:	89 10                	mov    %edx,(%eax)
    if(q->head == 0){
    1a9d:	8b 45 08             	mov    0x8(%ebp),%eax
    1aa0:	8b 40 04             	mov    0x4(%eax),%eax
    1aa3:	85 c0                	test   %eax,%eax
    1aa5:	75 0b                	jne    1ab2 <add_q+0x3c>
        q->head = n;
    1aa7:	8b 45 08             	mov    0x8(%ebp),%eax
    1aaa:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1aad:	89 50 04             	mov    %edx,0x4(%eax)
    1ab0:	eb 0c                	jmp    1abe <add_q+0x48>
    }else{
        q->tail->next = n;
    1ab2:	8b 45 08             	mov    0x8(%ebp),%eax
    1ab5:	8b 40 08             	mov    0x8(%eax),%eax
    1ab8:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1abb:	89 50 04             	mov    %edx,0x4(%eax)
    }
    q->tail = n;
    1abe:	8b 45 08             	mov    0x8(%ebp),%eax
    1ac1:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1ac4:	89 50 08             	mov    %edx,0x8(%eax)
    q->size++;
    1ac7:	8b 45 08             	mov    0x8(%ebp),%eax
    1aca:	8b 00                	mov    (%eax),%eax
    1acc:	8d 50 01             	lea    0x1(%eax),%edx
    1acf:	8b 45 08             	mov    0x8(%ebp),%eax
    1ad2:	89 10                	mov    %edx,(%eax)
}
    1ad4:	c9                   	leave  
    1ad5:	c3                   	ret    

00001ad6 <empty_q>:

int empty_q(struct queue *q){
    1ad6:	55                   	push   %ebp
    1ad7:	89 e5                	mov    %esp,%ebp
    if(q->size == 0)
    1ad9:	8b 45 08             	mov    0x8(%ebp),%eax
    1adc:	8b 00                	mov    (%eax),%eax
    1ade:	85 c0                	test   %eax,%eax
    1ae0:	75 07                	jne    1ae9 <empty_q+0x13>
        return 1;
    1ae2:	b8 01 00 00 00       	mov    $0x1,%eax
    1ae7:	eb 05                	jmp    1aee <empty_q+0x18>
    else
        return 0;
    1ae9:	b8 00 00 00 00       	mov    $0x0,%eax
} 
    1aee:	5d                   	pop    %ebp
    1aef:	c3                   	ret    

00001af0 <pop_q>:
int pop_q(struct queue *q){
    1af0:	55                   	push   %ebp
    1af1:	89 e5                	mov    %esp,%ebp
    1af3:	83 ec 28             	sub    $0x28,%esp
    int val;
    struct node *destroy;
    if(!empty_q(q)){
    1af6:	8b 45 08             	mov    0x8(%ebp),%eax
    1af9:	89 04 24             	mov    %eax,(%esp)
    1afc:	e8 d5 ff ff ff       	call   1ad6 <empty_q>
    1b01:	85 c0                	test   %eax,%eax
    1b03:	75 5d                	jne    1b62 <pop_q+0x72>
       val = q->head->value; 
    1b05:	8b 45 08             	mov    0x8(%ebp),%eax
    1b08:	8b 40 04             	mov    0x4(%eax),%eax
    1b0b:	8b 00                	mov    (%eax),%eax
    1b0d:	89 45 f4             	mov    %eax,-0xc(%ebp)
       destroy = q->head;
    1b10:	8b 45 08             	mov    0x8(%ebp),%eax
    1b13:	8b 40 04             	mov    0x4(%eax),%eax
    1b16:	89 45 f0             	mov    %eax,-0x10(%ebp)
       q->head = q->head->next;
    1b19:	8b 45 08             	mov    0x8(%ebp),%eax
    1b1c:	8b 40 04             	mov    0x4(%eax),%eax
    1b1f:	8b 50 04             	mov    0x4(%eax),%edx
    1b22:	8b 45 08             	mov    0x8(%ebp),%eax
    1b25:	89 50 04             	mov    %edx,0x4(%eax)
       free(destroy);
    1b28:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1b2b:	89 04 24             	mov    %eax,(%esp)
    1b2e:	e8 a9 fb ff ff       	call   16dc <free>
       q->size--;
    1b33:	8b 45 08             	mov    0x8(%ebp),%eax
    1b36:	8b 00                	mov    (%eax),%eax
    1b38:	8d 50 ff             	lea    -0x1(%eax),%edx
    1b3b:	8b 45 08             	mov    0x8(%ebp),%eax
    1b3e:	89 10                	mov    %edx,(%eax)
       if(q->size == 0){
    1b40:	8b 45 08             	mov    0x8(%ebp),%eax
    1b43:	8b 00                	mov    (%eax),%eax
    1b45:	85 c0                	test   %eax,%eax
    1b47:	75 14                	jne    1b5d <pop_q+0x6d>
            q->head = 0;
    1b49:	8b 45 08             	mov    0x8(%ebp),%eax
    1b4c:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
            q->tail = 0;
    1b53:	8b 45 08             	mov    0x8(%ebp),%eax
    1b56:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
       }
       return val;
    1b5d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1b60:	eb 05                	jmp    1b67 <pop_q+0x77>
    }
    return -1;
    1b62:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
    1b67:	c9                   	leave  
    1b68:	c3                   	ret    

00001b69 <dominant>:

void dominant(struct queue* q, int i){
    1b69:	55                   	push   %ebp
    1b6a:	89 e5                	mov    %esp,%ebp
    1b6c:	83 ec 28             	sub    $0x28,%esp
    struct node * n = malloc(sizeof(struct node));
    1b6f:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
    1b76:	e8 9a fc ff ff       	call   1815 <malloc>
    1b7b:	89 45 f4             	mov    %eax,-0xc(%ebp)
    n->value = i;
    1b7e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1b81:	8b 55 0c             	mov    0xc(%ebp),%edx
    1b84:	89 10                	mov    %edx,(%eax)

    if(q->head == 0){
    1b86:	8b 45 08             	mov    0x8(%ebp),%eax
    1b89:	8b 40 04             	mov    0x4(%eax),%eax
    1b8c:	85 c0                	test   %eax,%eax
    1b8e:	75 14                	jne    1ba4 <dominant+0x3b>
        q->head = n;
    1b90:	8b 45 08             	mov    0x8(%ebp),%eax
    1b93:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1b96:	89 50 04             	mov    %edx,0x4(%eax)
        q->tail = n;
    1b99:	8b 45 08             	mov    0x8(%ebp),%eax
    1b9c:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1b9f:	89 50 08             	mov    %edx,0x8(%eax)
    1ba2:	eb 15                	jmp    1bb9 <dominant+0x50>
    }
    else{
        n->next = q->head;
    1ba4:	8b 45 08             	mov    0x8(%ebp),%eax
    1ba7:	8b 50 04             	mov    0x4(%eax),%edx
    1baa:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1bad:	89 50 04             	mov    %edx,0x4(%eax)
        q->head = n;
    1bb0:	8b 45 08             	mov    0x8(%ebp),%eax
    1bb3:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1bb6:	89 50 04             	mov    %edx,0x4(%eax)
    }
    q->size++;
    1bb9:	8b 45 08             	mov    0x8(%ebp),%eax
    1bbc:	8b 00                	mov    (%eax),%eax
    1bbe:	8d 50 01             	lea    0x1(%eax),%edx
    1bc1:	8b 45 08             	mov    0x8(%ebp),%eax
    1bc4:	89 10                	mov    %edx,(%eax)
}
    1bc6:	c9                   	leave  
    1bc7:	c3                   	ret    

00001bc8 <sem_init>:
#include "semaphore.h"
#include "user.h"

// Initializes the semaphore
void sem_init(struct Semaphore* s, int value){
    1bc8:	55                   	push   %ebp
    1bc9:	89 e5                	mov    %esp,%ebp
    1bcb:	83 ec 18             	sub    $0x18,%esp
    s->val = value;
    1bce:	8b 45 08             	mov    0x8(%ebp),%eax
    1bd1:	8b 55 0c             	mov    0xc(%ebp),%edx
    1bd4:	89 10                	mov    %edx,(%eax)
    lock_init(&s->lock);
    1bd6:	8b 45 08             	mov    0x8(%ebp),%eax
    1bd9:	83 c0 04             	add    $0x4,%eax
    1bdc:	89 04 24             	mov    %eax,(%esp)
    1bdf:	e8 2e fd ff ff       	call   1912 <lock_init>
    init_q(&s->q);
    1be4:	8b 45 08             	mov    0x8(%ebp),%eax
    1be7:	83 c0 08             	add    $0x8,%eax
    1bea:	89 04 24             	mov    %eax,(%esp)
    1bed:	e8 62 fe ff ff       	call   1a54 <init_q>
}
    1bf2:	c9                   	leave  
    1bf3:	c3                   	ret    

00001bf4 <sem_acquire>:

// Decrements the semaphore
void sem_acquire(struct Semaphore* s){
    1bf4:	55                   	push   %ebp
    1bf5:	89 e5                	mov    %esp,%ebp
    1bf7:	83 ec 28             	sub    $0x28,%esp
    lock_acquire(&s->lock);
    1bfa:	8b 45 08             	mov    0x8(%ebp),%eax
    1bfd:	83 c0 04             	add    $0x4,%eax
    1c00:	89 04 24             	mov    %eax,(%esp)
    1c03:	e8 18 fd ff ff       	call   1920 <lock_acquire>

    if(s->val == 0){
    1c08:	8b 45 08             	mov    0x8(%ebp),%eax
    1c0b:	8b 00                	mov    (%eax),%eax
    1c0d:	85 c0                	test   %eax,%eax
    1c0f:	75 32                	jne    1c43 <sem_acquire+0x4f>
        int pid;
        pid = getpid();
    1c11:	e8 f2 f7 ff ff       	call   1408 <getpid>
    1c16:	89 45 f4             	mov    %eax,-0xc(%ebp)
        add_q(&s->q, pid);
    1c19:	8b 45 08             	mov    0x8(%ebp),%eax
    1c1c:	8d 50 08             	lea    0x8(%eax),%edx
    1c1f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1c22:	89 44 24 04          	mov    %eax,0x4(%esp)
    1c26:	89 14 24             	mov    %edx,(%esp)
    1c29:	e8 48 fe ff ff       	call   1a76 <add_q>
        lock_release(&s->lock);
    1c2e:	8b 45 08             	mov    0x8(%ebp),%eax
    1c31:	83 c0 04             	add    $0x4,%eax
    1c34:	89 04 24             	mov    %eax,(%esp)
    1c37:	e8 04 fd ff ff       	call   1940 <lock_release>
        tsleep();
    1c3c:	e8 f7 f7 ff ff       	call   1438 <tsleep>
    1c41:	eb 1b                	jmp    1c5e <sem_acquire+0x6a>
    }
    else{
        s->val--;
    1c43:	8b 45 08             	mov    0x8(%ebp),%eax
    1c46:	8b 00                	mov    (%eax),%eax
    1c48:	8d 50 ff             	lea    -0x1(%eax),%edx
    1c4b:	8b 45 08             	mov    0x8(%ebp),%eax
    1c4e:	89 10                	mov    %edx,(%eax)
        lock_release(&s->lock);
    1c50:	8b 45 08             	mov    0x8(%ebp),%eax
    1c53:	83 c0 04             	add    $0x4,%eax
    1c56:	89 04 24             	mov    %eax,(%esp)
    1c59:	e8 e2 fc ff ff       	call   1940 <lock_release>
    }
}
    1c5e:	c9                   	leave  
    1c5f:	c3                   	ret    

00001c60 <sem_signal>:

// Increments the semaphore
void sem_signal(struct Semaphore* s){
    1c60:	55                   	push   %ebp
    1c61:	89 e5                	mov    %esp,%ebp
    1c63:	83 ec 18             	sub    $0x18,%esp
    lock_acquire(&s->lock);
    1c66:	8b 45 08             	mov    0x8(%ebp),%eax
    1c69:	83 c0 04             	add    $0x4,%eax
    1c6c:	89 04 24             	mov    %eax,(%esp)
    1c6f:	e8 ac fc ff ff       	call   1920 <lock_acquire>

    if(!empty_q(&s->q)){
    1c74:	8b 45 08             	mov    0x8(%ebp),%eax
    1c77:	83 c0 08             	add    $0x8,%eax
    1c7a:	89 04 24             	mov    %eax,(%esp)
    1c7d:	e8 54 fe ff ff       	call   1ad6 <empty_q>
    1c82:	85 c0                	test   %eax,%eax
    1c84:	75 18                	jne    1c9e <sem_signal+0x3e>
        twakeup(pop_q(&s->q));
    1c86:	8b 45 08             	mov    0x8(%ebp),%eax
    1c89:	83 c0 08             	add    $0x8,%eax
    1c8c:	89 04 24             	mov    %eax,(%esp)
    1c8f:	e8 5c fe ff ff       	call   1af0 <pop_q>
    1c94:	89 04 24             	mov    %eax,(%esp)
    1c97:	e8 a4 f7 ff ff       	call   1440 <twakeup>
    1c9c:	eb 0d                	jmp    1cab <sem_signal+0x4b>
    }
    else{
        s->val++;
    1c9e:	8b 45 08             	mov    0x8(%ebp),%eax
    1ca1:	8b 00                	mov    (%eax),%eax
    1ca3:	8d 50 01             	lea    0x1(%eax),%edx
    1ca6:	8b 45 08             	mov    0x8(%ebp),%eax
    1ca9:	89 10                	mov    %edx,(%eax)
    }

    lock_release(&s->lock);
    1cab:	8b 45 08             	mov    0x8(%ebp),%eax
    1cae:	83 c0 04             	add    $0x4,%eax
    1cb1:	89 04 24             	mov    %eax,(%esp)
    1cb4:	e8 87 fc ff ff       	call   1940 <lock_release>
}
    1cb9:	c9                   	leave  
    1cba:	c3                   	ret    

00001cbb <sem_dom_acquire>:

void sem_dom_acquire(struct Semaphore* s){
    1cbb:	55                   	push   %ebp
    1cbc:	89 e5                	mov    %esp,%ebp
    1cbe:	83 ec 18             	sub    $0x18,%esp
    lock_acquire(&s->lock);
    1cc1:	8b 45 08             	mov    0x8(%ebp),%eax
    1cc4:	83 c0 04             	add    $0x4,%eax
    1cc7:	89 04 24             	mov    %eax,(%esp)
    1cca:	e8 51 fc ff ff       	call   1920 <lock_acquire>

    if(s->val > 0){
    1ccf:	8b 45 08             	mov    0x8(%ebp),%eax
    1cd2:	8b 00                	mov    (%eax),%eax
    1cd4:	85 c0                	test   %eax,%eax
    1cd6:	7e 1d                	jle    1cf5 <sem_dom_acquire+0x3a>
        s->val--;
    1cd8:	8b 45 08             	mov    0x8(%ebp),%eax
    1cdb:	8b 00                	mov    (%eax),%eax
    1cdd:	8d 50 ff             	lea    -0x1(%eax),%edx
    1ce0:	8b 45 08             	mov    0x8(%ebp),%eax
    1ce3:	89 10                	mov    %edx,(%eax)
        lock_release(&s->lock);
    1ce5:	8b 45 08             	mov    0x8(%ebp),%eax
    1ce8:	83 c0 04             	add    $0x4,%eax
    1ceb:	89 04 24             	mov    %eax,(%esp)
    1cee:	e8 4d fc ff ff       	call   1940 <lock_release>
        return;
    1cf3:	eb 2a                	jmp    1d1f <sem_dom_acquire+0x64>
    }

    dominant(&s->q,getpid());
    1cf5:	e8 0e f7 ff ff       	call   1408 <getpid>
    1cfa:	8b 55 08             	mov    0x8(%ebp),%edx
    1cfd:	83 c2 08             	add    $0x8,%edx
    1d00:	89 44 24 04          	mov    %eax,0x4(%esp)
    1d04:	89 14 24             	mov    %edx,(%esp)
    1d07:	e8 5d fe ff ff       	call   1b69 <dominant>
    lock_release(&s->lock);
    1d0c:	8b 45 08             	mov    0x8(%ebp),%eax
    1d0f:	83 c0 04             	add    $0x4,%eax
    1d12:	89 04 24             	mov    %eax,(%esp)
    1d15:	e8 26 fc ff ff       	call   1940 <lock_release>
    tsleep();
    1d1a:	e8 19 f7 ff ff       	call   1438 <tsleep>
}
    1d1f:	c9                   	leave  
    1d20:	c3                   	ret    
