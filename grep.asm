
_grep:     file format elf32-i386


Disassembly of section .text:

00001000 <grep>:
char buf[1024];
int match(char*, char*);

void
grep(char *pattern, int fd)
{
    1000:	55                   	push   %ebp
    1001:	89 e5                	mov    %esp,%ebp
    1003:	83 ec 28             	sub    $0x28,%esp
  int n, m;
  char *p, *q;
  
  m = 0;
    1006:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  while((n = read(fd, buf+m, sizeof(buf)-m)) > 0){
    100d:	e9 bb 00 00 00       	jmp    10cd <grep+0xcd>
    m += n;
    1012:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1015:	01 45 f4             	add    %eax,-0xc(%ebp)
    p = buf;
    1018:	c7 45 f0 c0 24 00 00 	movl   $0x24c0,-0x10(%ebp)
    while((q = strchr(p, '\n')) != 0){
    101f:	eb 51                	jmp    1072 <grep+0x72>
      *q = 0;
    1021:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1024:	c6 00 00             	movb   $0x0,(%eax)
      if(match(pattern, p)){
    1027:	8b 45 f0             	mov    -0x10(%ebp),%eax
    102a:	89 44 24 04          	mov    %eax,0x4(%esp)
    102e:	8b 45 08             	mov    0x8(%ebp),%eax
    1031:	89 04 24             	mov    %eax,(%esp)
    1034:	e8 bc 01 00 00       	call   11f5 <match>
    1039:	85 c0                	test   %eax,%eax
    103b:	74 2c                	je     1069 <grep+0x69>
        *q = '\n';
    103d:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1040:	c6 00 0a             	movb   $0xa,(%eax)
        write(1, p, q+1 - p);
    1043:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1046:	83 c0 01             	add    $0x1,%eax
    1049:	89 c2                	mov    %eax,%edx
    104b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    104e:	29 c2                	sub    %eax,%edx
    1050:	89 d0                	mov    %edx,%eax
    1052:	89 44 24 08          	mov    %eax,0x8(%esp)
    1056:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1059:	89 44 24 04          	mov    %eax,0x4(%esp)
    105d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1064:	e8 77 05 00 00       	call   15e0 <write>
      }
      p = q+1;
    1069:	8b 45 e8             	mov    -0x18(%ebp),%eax
    106c:	83 c0 01             	add    $0x1,%eax
    106f:	89 45 f0             	mov    %eax,-0x10(%ebp)
  
  m = 0;
  while((n = read(fd, buf+m, sizeof(buf)-m)) > 0){
    m += n;
    p = buf;
    while((q = strchr(p, '\n')) != 0){
    1072:	c7 44 24 04 0a 00 00 	movl   $0xa,0x4(%esp)
    1079:	00 
    107a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    107d:	89 04 24             	mov    %eax,(%esp)
    1080:	e8 b2 03 00 00       	call   1437 <strchr>
    1085:	89 45 e8             	mov    %eax,-0x18(%ebp)
    1088:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    108c:	75 93                	jne    1021 <grep+0x21>
        *q = '\n';
        write(1, p, q+1 - p);
      }
      p = q+1;
    }
    if(p == buf)
    108e:	81 7d f0 c0 24 00 00 	cmpl   $0x24c0,-0x10(%ebp)
    1095:	75 07                	jne    109e <grep+0x9e>
      m = 0;
    1097:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    if(m > 0){
    109e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    10a2:	7e 29                	jle    10cd <grep+0xcd>
      m -= p - buf;
    10a4:	ba c0 24 00 00       	mov    $0x24c0,%edx
    10a9:	8b 45 f0             	mov    -0x10(%ebp),%eax
    10ac:	29 c2                	sub    %eax,%edx
    10ae:	89 d0                	mov    %edx,%eax
    10b0:	01 45 f4             	add    %eax,-0xc(%ebp)
      memmove(buf, p, m);
    10b3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    10b6:	89 44 24 08          	mov    %eax,0x8(%esp)
    10ba:	8b 45 f0             	mov    -0x10(%ebp),%eax
    10bd:	89 44 24 04          	mov    %eax,0x4(%esp)
    10c1:	c7 04 24 c0 24 00 00 	movl   $0x24c0,(%esp)
    10c8:	e8 ae 04 00 00       	call   157b <memmove>
{
  int n, m;
  char *p, *q;
  
  m = 0;
  while((n = read(fd, buf+m, sizeof(buf)-m)) > 0){
    10cd:	8b 45 f4             	mov    -0xc(%ebp),%eax
    10d0:	ba 00 04 00 00       	mov    $0x400,%edx
    10d5:	29 c2                	sub    %eax,%edx
    10d7:	89 d0                	mov    %edx,%eax
    10d9:	8b 55 f4             	mov    -0xc(%ebp),%edx
    10dc:	81 c2 c0 24 00 00    	add    $0x24c0,%edx
    10e2:	89 44 24 08          	mov    %eax,0x8(%esp)
    10e6:	89 54 24 04          	mov    %edx,0x4(%esp)
    10ea:	8b 45 0c             	mov    0xc(%ebp),%eax
    10ed:	89 04 24             	mov    %eax,(%esp)
    10f0:	e8 e3 04 00 00       	call   15d8 <read>
    10f5:	89 45 ec             	mov    %eax,-0x14(%ebp)
    10f8:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    10fc:	0f 8f 10 ff ff ff    	jg     1012 <grep+0x12>
    if(m > 0){
      m -= p - buf;
      memmove(buf, p, m);
    }
  }
}
    1102:	c9                   	leave  
    1103:	c3                   	ret    

00001104 <main>:

int
main(int argc, char *argv[])
{
    1104:	55                   	push   %ebp
    1105:	89 e5                	mov    %esp,%ebp
    1107:	83 e4 f0             	and    $0xfffffff0,%esp
    110a:	83 ec 20             	sub    $0x20,%esp
  int fd, i;
  char *pattern;
  
  if(argc <= 1){
    110d:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
    1111:	7f 19                	jg     112c <main+0x28>
    printf(2, "usage: grep pattern [file ...]\n");
    1113:	c7 44 24 04 5c 1f 00 	movl   $0x1f5c,0x4(%esp)
    111a:	00 
    111b:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
    1122:	e8 39 06 00 00       	call   1760 <printf>
    exit();
    1127:	e8 94 04 00 00       	call   15c0 <exit>
  }
  pattern = argv[1];
    112c:	8b 45 0c             	mov    0xc(%ebp),%eax
    112f:	8b 40 04             	mov    0x4(%eax),%eax
    1132:	89 44 24 18          	mov    %eax,0x18(%esp)
  
  if(argc <= 2){
    1136:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
    113a:	7f 19                	jg     1155 <main+0x51>
    grep(pattern, 0);
    113c:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1143:	00 
    1144:	8b 44 24 18          	mov    0x18(%esp),%eax
    1148:	89 04 24             	mov    %eax,(%esp)
    114b:	e8 b0 fe ff ff       	call   1000 <grep>
    exit();
    1150:	e8 6b 04 00 00       	call   15c0 <exit>
  }

  for(i = 2; i < argc; i++){
    1155:	c7 44 24 1c 02 00 00 	movl   $0x2,0x1c(%esp)
    115c:	00 
    115d:	e9 81 00 00 00       	jmp    11e3 <main+0xdf>
    if((fd = open(argv[i], 0)) < 0){
    1162:	8b 44 24 1c          	mov    0x1c(%esp),%eax
    1166:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
    116d:	8b 45 0c             	mov    0xc(%ebp),%eax
    1170:	01 d0                	add    %edx,%eax
    1172:	8b 00                	mov    (%eax),%eax
    1174:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    117b:	00 
    117c:	89 04 24             	mov    %eax,(%esp)
    117f:	e8 7c 04 00 00       	call   1600 <open>
    1184:	89 44 24 14          	mov    %eax,0x14(%esp)
    1188:	83 7c 24 14 00       	cmpl   $0x0,0x14(%esp)
    118d:	79 2f                	jns    11be <main+0xba>
      printf(1, "grep: cannot open %s\n", argv[i]);
    118f:	8b 44 24 1c          	mov    0x1c(%esp),%eax
    1193:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
    119a:	8b 45 0c             	mov    0xc(%ebp),%eax
    119d:	01 d0                	add    %edx,%eax
    119f:	8b 00                	mov    (%eax),%eax
    11a1:	89 44 24 08          	mov    %eax,0x8(%esp)
    11a5:	c7 44 24 04 7c 1f 00 	movl   $0x1f7c,0x4(%esp)
    11ac:	00 
    11ad:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    11b4:	e8 a7 05 00 00       	call   1760 <printf>
      exit();
    11b9:	e8 02 04 00 00       	call   15c0 <exit>
    }
    grep(pattern, fd);
    11be:	8b 44 24 14          	mov    0x14(%esp),%eax
    11c2:	89 44 24 04          	mov    %eax,0x4(%esp)
    11c6:	8b 44 24 18          	mov    0x18(%esp),%eax
    11ca:	89 04 24             	mov    %eax,(%esp)
    11cd:	e8 2e fe ff ff       	call   1000 <grep>
    close(fd);
    11d2:	8b 44 24 14          	mov    0x14(%esp),%eax
    11d6:	89 04 24             	mov    %eax,(%esp)
    11d9:	e8 0a 04 00 00       	call   15e8 <close>
  if(argc <= 2){
    grep(pattern, 0);
    exit();
  }

  for(i = 2; i < argc; i++){
    11de:	83 44 24 1c 01       	addl   $0x1,0x1c(%esp)
    11e3:	8b 44 24 1c          	mov    0x1c(%esp),%eax
    11e7:	3b 45 08             	cmp    0x8(%ebp),%eax
    11ea:	0f 8c 72 ff ff ff    	jl     1162 <main+0x5e>
      exit();
    }
    grep(pattern, fd);
    close(fd);
  }
  exit();
    11f0:	e8 cb 03 00 00       	call   15c0 <exit>

000011f5 <match>:
int matchhere(char*, char*);
int matchstar(int, char*, char*);

int
match(char *re, char *text)
{
    11f5:	55                   	push   %ebp
    11f6:	89 e5                	mov    %esp,%ebp
    11f8:	83 ec 18             	sub    $0x18,%esp
  if(re[0] == '^')
    11fb:	8b 45 08             	mov    0x8(%ebp),%eax
    11fe:	0f b6 00             	movzbl (%eax),%eax
    1201:	3c 5e                	cmp    $0x5e,%al
    1203:	75 17                	jne    121c <match+0x27>
    return matchhere(re+1, text);
    1205:	8b 45 08             	mov    0x8(%ebp),%eax
    1208:	8d 50 01             	lea    0x1(%eax),%edx
    120b:	8b 45 0c             	mov    0xc(%ebp),%eax
    120e:	89 44 24 04          	mov    %eax,0x4(%esp)
    1212:	89 14 24             	mov    %edx,(%esp)
    1215:	e8 36 00 00 00       	call   1250 <matchhere>
    121a:	eb 32                	jmp    124e <match+0x59>
  do{  // must look at empty string
    if(matchhere(re, text))
    121c:	8b 45 0c             	mov    0xc(%ebp),%eax
    121f:	89 44 24 04          	mov    %eax,0x4(%esp)
    1223:	8b 45 08             	mov    0x8(%ebp),%eax
    1226:	89 04 24             	mov    %eax,(%esp)
    1229:	e8 22 00 00 00       	call   1250 <matchhere>
    122e:	85 c0                	test   %eax,%eax
    1230:	74 07                	je     1239 <match+0x44>
      return 1;
    1232:	b8 01 00 00 00       	mov    $0x1,%eax
    1237:	eb 15                	jmp    124e <match+0x59>
  }while(*text++ != '\0');
    1239:	8b 45 0c             	mov    0xc(%ebp),%eax
    123c:	8d 50 01             	lea    0x1(%eax),%edx
    123f:	89 55 0c             	mov    %edx,0xc(%ebp)
    1242:	0f b6 00             	movzbl (%eax),%eax
    1245:	84 c0                	test   %al,%al
    1247:	75 d3                	jne    121c <match+0x27>
  return 0;
    1249:	b8 00 00 00 00       	mov    $0x0,%eax
}
    124e:	c9                   	leave  
    124f:	c3                   	ret    

00001250 <matchhere>:

// matchhere: search for re at beginning of text
int matchhere(char *re, char *text)
{
    1250:	55                   	push   %ebp
    1251:	89 e5                	mov    %esp,%ebp
    1253:	83 ec 18             	sub    $0x18,%esp
  if(re[0] == '\0')
    1256:	8b 45 08             	mov    0x8(%ebp),%eax
    1259:	0f b6 00             	movzbl (%eax),%eax
    125c:	84 c0                	test   %al,%al
    125e:	75 0a                	jne    126a <matchhere+0x1a>
    return 1;
    1260:	b8 01 00 00 00       	mov    $0x1,%eax
    1265:	e9 9b 00 00 00       	jmp    1305 <matchhere+0xb5>
  if(re[1] == '*')
    126a:	8b 45 08             	mov    0x8(%ebp),%eax
    126d:	83 c0 01             	add    $0x1,%eax
    1270:	0f b6 00             	movzbl (%eax),%eax
    1273:	3c 2a                	cmp    $0x2a,%al
    1275:	75 24                	jne    129b <matchhere+0x4b>
    return matchstar(re[0], re+2, text);
    1277:	8b 45 08             	mov    0x8(%ebp),%eax
    127a:	8d 48 02             	lea    0x2(%eax),%ecx
    127d:	8b 45 08             	mov    0x8(%ebp),%eax
    1280:	0f b6 00             	movzbl (%eax),%eax
    1283:	0f be c0             	movsbl %al,%eax
    1286:	8b 55 0c             	mov    0xc(%ebp),%edx
    1289:	89 54 24 08          	mov    %edx,0x8(%esp)
    128d:	89 4c 24 04          	mov    %ecx,0x4(%esp)
    1291:	89 04 24             	mov    %eax,(%esp)
    1294:	e8 6e 00 00 00       	call   1307 <matchstar>
    1299:	eb 6a                	jmp    1305 <matchhere+0xb5>
  if(re[0] == '$' && re[1] == '\0')
    129b:	8b 45 08             	mov    0x8(%ebp),%eax
    129e:	0f b6 00             	movzbl (%eax),%eax
    12a1:	3c 24                	cmp    $0x24,%al
    12a3:	75 1d                	jne    12c2 <matchhere+0x72>
    12a5:	8b 45 08             	mov    0x8(%ebp),%eax
    12a8:	83 c0 01             	add    $0x1,%eax
    12ab:	0f b6 00             	movzbl (%eax),%eax
    12ae:	84 c0                	test   %al,%al
    12b0:	75 10                	jne    12c2 <matchhere+0x72>
    return *text == '\0';
    12b2:	8b 45 0c             	mov    0xc(%ebp),%eax
    12b5:	0f b6 00             	movzbl (%eax),%eax
    12b8:	84 c0                	test   %al,%al
    12ba:	0f 94 c0             	sete   %al
    12bd:	0f b6 c0             	movzbl %al,%eax
    12c0:	eb 43                	jmp    1305 <matchhere+0xb5>
  if(*text!='\0' && (re[0]=='.' || re[0]==*text))
    12c2:	8b 45 0c             	mov    0xc(%ebp),%eax
    12c5:	0f b6 00             	movzbl (%eax),%eax
    12c8:	84 c0                	test   %al,%al
    12ca:	74 34                	je     1300 <matchhere+0xb0>
    12cc:	8b 45 08             	mov    0x8(%ebp),%eax
    12cf:	0f b6 00             	movzbl (%eax),%eax
    12d2:	3c 2e                	cmp    $0x2e,%al
    12d4:	74 10                	je     12e6 <matchhere+0x96>
    12d6:	8b 45 08             	mov    0x8(%ebp),%eax
    12d9:	0f b6 10             	movzbl (%eax),%edx
    12dc:	8b 45 0c             	mov    0xc(%ebp),%eax
    12df:	0f b6 00             	movzbl (%eax),%eax
    12e2:	38 c2                	cmp    %al,%dl
    12e4:	75 1a                	jne    1300 <matchhere+0xb0>
    return matchhere(re+1, text+1);
    12e6:	8b 45 0c             	mov    0xc(%ebp),%eax
    12e9:	8d 50 01             	lea    0x1(%eax),%edx
    12ec:	8b 45 08             	mov    0x8(%ebp),%eax
    12ef:	83 c0 01             	add    $0x1,%eax
    12f2:	89 54 24 04          	mov    %edx,0x4(%esp)
    12f6:	89 04 24             	mov    %eax,(%esp)
    12f9:	e8 52 ff ff ff       	call   1250 <matchhere>
    12fe:	eb 05                	jmp    1305 <matchhere+0xb5>
  return 0;
    1300:	b8 00 00 00 00       	mov    $0x0,%eax
}
    1305:	c9                   	leave  
    1306:	c3                   	ret    

00001307 <matchstar>:

// matchstar: search for c*re at beginning of text
int matchstar(int c, char *re, char *text)
{
    1307:	55                   	push   %ebp
    1308:	89 e5                	mov    %esp,%ebp
    130a:	83 ec 18             	sub    $0x18,%esp
  do{  // a * matches zero or more instances
    if(matchhere(re, text))
    130d:	8b 45 10             	mov    0x10(%ebp),%eax
    1310:	89 44 24 04          	mov    %eax,0x4(%esp)
    1314:	8b 45 0c             	mov    0xc(%ebp),%eax
    1317:	89 04 24             	mov    %eax,(%esp)
    131a:	e8 31 ff ff ff       	call   1250 <matchhere>
    131f:	85 c0                	test   %eax,%eax
    1321:	74 07                	je     132a <matchstar+0x23>
      return 1;
    1323:	b8 01 00 00 00       	mov    $0x1,%eax
    1328:	eb 29                	jmp    1353 <matchstar+0x4c>
  }while(*text!='\0' && (*text++==c || c=='.'));
    132a:	8b 45 10             	mov    0x10(%ebp),%eax
    132d:	0f b6 00             	movzbl (%eax),%eax
    1330:	84 c0                	test   %al,%al
    1332:	74 1a                	je     134e <matchstar+0x47>
    1334:	8b 45 10             	mov    0x10(%ebp),%eax
    1337:	8d 50 01             	lea    0x1(%eax),%edx
    133a:	89 55 10             	mov    %edx,0x10(%ebp)
    133d:	0f b6 00             	movzbl (%eax),%eax
    1340:	0f be c0             	movsbl %al,%eax
    1343:	3b 45 08             	cmp    0x8(%ebp),%eax
    1346:	74 c5                	je     130d <matchstar+0x6>
    1348:	83 7d 08 2e          	cmpl   $0x2e,0x8(%ebp)
    134c:	74 bf                	je     130d <matchstar+0x6>
  return 0;
    134e:	b8 00 00 00 00       	mov    $0x0,%eax
}
    1353:	c9                   	leave  
    1354:	c3                   	ret    
    1355:	66 90                	xchg   %ax,%ax
    1357:	90                   	nop

00001358 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
    1358:	55                   	push   %ebp
    1359:	89 e5                	mov    %esp,%ebp
    135b:	57                   	push   %edi
    135c:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
    135d:	8b 4d 08             	mov    0x8(%ebp),%ecx
    1360:	8b 55 10             	mov    0x10(%ebp),%edx
    1363:	8b 45 0c             	mov    0xc(%ebp),%eax
    1366:	89 cb                	mov    %ecx,%ebx
    1368:	89 df                	mov    %ebx,%edi
    136a:	89 d1                	mov    %edx,%ecx
    136c:	fc                   	cld    
    136d:	f3 aa                	rep stos %al,%es:(%edi)
    136f:	89 ca                	mov    %ecx,%edx
    1371:	89 fb                	mov    %edi,%ebx
    1373:	89 5d 08             	mov    %ebx,0x8(%ebp)
    1376:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
    1379:	5b                   	pop    %ebx
    137a:	5f                   	pop    %edi
    137b:	5d                   	pop    %ebp
    137c:	c3                   	ret    

0000137d <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
    137d:	55                   	push   %ebp
    137e:	89 e5                	mov    %esp,%ebp
    1380:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
    1383:	8b 45 08             	mov    0x8(%ebp),%eax
    1386:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
    1389:	90                   	nop
    138a:	8b 45 08             	mov    0x8(%ebp),%eax
    138d:	8d 50 01             	lea    0x1(%eax),%edx
    1390:	89 55 08             	mov    %edx,0x8(%ebp)
    1393:	8b 55 0c             	mov    0xc(%ebp),%edx
    1396:	8d 4a 01             	lea    0x1(%edx),%ecx
    1399:	89 4d 0c             	mov    %ecx,0xc(%ebp)
    139c:	0f b6 12             	movzbl (%edx),%edx
    139f:	88 10                	mov    %dl,(%eax)
    13a1:	0f b6 00             	movzbl (%eax),%eax
    13a4:	84 c0                	test   %al,%al
    13a6:	75 e2                	jne    138a <strcpy+0xd>
    ;
  return os;
    13a8:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    13ab:	c9                   	leave  
    13ac:	c3                   	ret    

000013ad <strcmp>:

int
strcmp(const char *p, const char *q)
{
    13ad:	55                   	push   %ebp
    13ae:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
    13b0:	eb 08                	jmp    13ba <strcmp+0xd>
    p++, q++;
    13b2:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    13b6:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    13ba:	8b 45 08             	mov    0x8(%ebp),%eax
    13bd:	0f b6 00             	movzbl (%eax),%eax
    13c0:	84 c0                	test   %al,%al
    13c2:	74 10                	je     13d4 <strcmp+0x27>
    13c4:	8b 45 08             	mov    0x8(%ebp),%eax
    13c7:	0f b6 10             	movzbl (%eax),%edx
    13ca:	8b 45 0c             	mov    0xc(%ebp),%eax
    13cd:	0f b6 00             	movzbl (%eax),%eax
    13d0:	38 c2                	cmp    %al,%dl
    13d2:	74 de                	je     13b2 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
    13d4:	8b 45 08             	mov    0x8(%ebp),%eax
    13d7:	0f b6 00             	movzbl (%eax),%eax
    13da:	0f b6 d0             	movzbl %al,%edx
    13dd:	8b 45 0c             	mov    0xc(%ebp),%eax
    13e0:	0f b6 00             	movzbl (%eax),%eax
    13e3:	0f b6 c0             	movzbl %al,%eax
    13e6:	29 c2                	sub    %eax,%edx
    13e8:	89 d0                	mov    %edx,%eax
}
    13ea:	5d                   	pop    %ebp
    13eb:	c3                   	ret    

000013ec <strlen>:

uint
strlen(char *s)
{
    13ec:	55                   	push   %ebp
    13ed:	89 e5                	mov    %esp,%ebp
    13ef:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
    13f2:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    13f9:	eb 04                	jmp    13ff <strlen+0x13>
    13fb:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    13ff:	8b 55 fc             	mov    -0x4(%ebp),%edx
    1402:	8b 45 08             	mov    0x8(%ebp),%eax
    1405:	01 d0                	add    %edx,%eax
    1407:	0f b6 00             	movzbl (%eax),%eax
    140a:	84 c0                	test   %al,%al
    140c:	75 ed                	jne    13fb <strlen+0xf>
    ;
  return n;
    140e:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    1411:	c9                   	leave  
    1412:	c3                   	ret    

00001413 <memset>:

void*
memset(void *dst, int c, uint n)
{
    1413:	55                   	push   %ebp
    1414:	89 e5                	mov    %esp,%ebp
    1416:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
    1419:	8b 45 10             	mov    0x10(%ebp),%eax
    141c:	89 44 24 08          	mov    %eax,0x8(%esp)
    1420:	8b 45 0c             	mov    0xc(%ebp),%eax
    1423:	89 44 24 04          	mov    %eax,0x4(%esp)
    1427:	8b 45 08             	mov    0x8(%ebp),%eax
    142a:	89 04 24             	mov    %eax,(%esp)
    142d:	e8 26 ff ff ff       	call   1358 <stosb>
  return dst;
    1432:	8b 45 08             	mov    0x8(%ebp),%eax
}
    1435:	c9                   	leave  
    1436:	c3                   	ret    

00001437 <strchr>:

char*
strchr(const char *s, char c)
{
    1437:	55                   	push   %ebp
    1438:	89 e5                	mov    %esp,%ebp
    143a:	83 ec 04             	sub    $0x4,%esp
    143d:	8b 45 0c             	mov    0xc(%ebp),%eax
    1440:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
    1443:	eb 14                	jmp    1459 <strchr+0x22>
    if(*s == c)
    1445:	8b 45 08             	mov    0x8(%ebp),%eax
    1448:	0f b6 00             	movzbl (%eax),%eax
    144b:	3a 45 fc             	cmp    -0x4(%ebp),%al
    144e:	75 05                	jne    1455 <strchr+0x1e>
      return (char*)s;
    1450:	8b 45 08             	mov    0x8(%ebp),%eax
    1453:	eb 13                	jmp    1468 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
    1455:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    1459:	8b 45 08             	mov    0x8(%ebp),%eax
    145c:	0f b6 00             	movzbl (%eax),%eax
    145f:	84 c0                	test   %al,%al
    1461:	75 e2                	jne    1445 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
    1463:	b8 00 00 00 00       	mov    $0x0,%eax
}
    1468:	c9                   	leave  
    1469:	c3                   	ret    

0000146a <gets>:

char*
gets(char *buf, int max)
{
    146a:	55                   	push   %ebp
    146b:	89 e5                	mov    %esp,%ebp
    146d:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1470:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    1477:	eb 4c                	jmp    14c5 <gets+0x5b>
    cc = read(0, &c, 1);
    1479:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    1480:	00 
    1481:	8d 45 ef             	lea    -0x11(%ebp),%eax
    1484:	89 44 24 04          	mov    %eax,0x4(%esp)
    1488:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    148f:	e8 44 01 00 00       	call   15d8 <read>
    1494:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
    1497:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    149b:	7f 02                	jg     149f <gets+0x35>
      break;
    149d:	eb 31                	jmp    14d0 <gets+0x66>
    buf[i++] = c;
    149f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    14a2:	8d 50 01             	lea    0x1(%eax),%edx
    14a5:	89 55 f4             	mov    %edx,-0xc(%ebp)
    14a8:	89 c2                	mov    %eax,%edx
    14aa:	8b 45 08             	mov    0x8(%ebp),%eax
    14ad:	01 c2                	add    %eax,%edx
    14af:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    14b3:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
    14b5:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    14b9:	3c 0a                	cmp    $0xa,%al
    14bb:	74 13                	je     14d0 <gets+0x66>
    14bd:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    14c1:	3c 0d                	cmp    $0xd,%al
    14c3:	74 0b                	je     14d0 <gets+0x66>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    14c5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    14c8:	83 c0 01             	add    $0x1,%eax
    14cb:	3b 45 0c             	cmp    0xc(%ebp),%eax
    14ce:	7c a9                	jl     1479 <gets+0xf>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    14d0:	8b 55 f4             	mov    -0xc(%ebp),%edx
    14d3:	8b 45 08             	mov    0x8(%ebp),%eax
    14d6:	01 d0                	add    %edx,%eax
    14d8:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
    14db:	8b 45 08             	mov    0x8(%ebp),%eax
}
    14de:	c9                   	leave  
    14df:	c3                   	ret    

000014e0 <stat>:

int
stat(char *n, struct stat *st)
{
    14e0:	55                   	push   %ebp
    14e1:	89 e5                	mov    %esp,%ebp
    14e3:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    14e6:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    14ed:	00 
    14ee:	8b 45 08             	mov    0x8(%ebp),%eax
    14f1:	89 04 24             	mov    %eax,(%esp)
    14f4:	e8 07 01 00 00       	call   1600 <open>
    14f9:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
    14fc:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1500:	79 07                	jns    1509 <stat+0x29>
    return -1;
    1502:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    1507:	eb 23                	jmp    152c <stat+0x4c>
  r = fstat(fd, st);
    1509:	8b 45 0c             	mov    0xc(%ebp),%eax
    150c:	89 44 24 04          	mov    %eax,0x4(%esp)
    1510:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1513:	89 04 24             	mov    %eax,(%esp)
    1516:	e8 fd 00 00 00       	call   1618 <fstat>
    151b:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
    151e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1521:	89 04 24             	mov    %eax,(%esp)
    1524:	e8 bf 00 00 00       	call   15e8 <close>
  return r;
    1529:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
    152c:	c9                   	leave  
    152d:	c3                   	ret    

0000152e <atoi>:

int
atoi(const char *s)
{
    152e:	55                   	push   %ebp
    152f:	89 e5                	mov    %esp,%ebp
    1531:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
    1534:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
    153b:	eb 25                	jmp    1562 <atoi+0x34>
    n = n*10 + *s++ - '0';
    153d:	8b 55 fc             	mov    -0x4(%ebp),%edx
    1540:	89 d0                	mov    %edx,%eax
    1542:	c1 e0 02             	shl    $0x2,%eax
    1545:	01 d0                	add    %edx,%eax
    1547:	01 c0                	add    %eax,%eax
    1549:	89 c1                	mov    %eax,%ecx
    154b:	8b 45 08             	mov    0x8(%ebp),%eax
    154e:	8d 50 01             	lea    0x1(%eax),%edx
    1551:	89 55 08             	mov    %edx,0x8(%ebp)
    1554:	0f b6 00             	movzbl (%eax),%eax
    1557:	0f be c0             	movsbl %al,%eax
    155a:	01 c8                	add    %ecx,%eax
    155c:	83 e8 30             	sub    $0x30,%eax
    155f:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    1562:	8b 45 08             	mov    0x8(%ebp),%eax
    1565:	0f b6 00             	movzbl (%eax),%eax
    1568:	3c 2f                	cmp    $0x2f,%al
    156a:	7e 0a                	jle    1576 <atoi+0x48>
    156c:	8b 45 08             	mov    0x8(%ebp),%eax
    156f:	0f b6 00             	movzbl (%eax),%eax
    1572:	3c 39                	cmp    $0x39,%al
    1574:	7e c7                	jle    153d <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
    1576:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    1579:	c9                   	leave  
    157a:	c3                   	ret    

0000157b <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    157b:	55                   	push   %ebp
    157c:	89 e5                	mov    %esp,%ebp
    157e:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
    1581:	8b 45 08             	mov    0x8(%ebp),%eax
    1584:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
    1587:	8b 45 0c             	mov    0xc(%ebp),%eax
    158a:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
    158d:	eb 17                	jmp    15a6 <memmove+0x2b>
    *dst++ = *src++;
    158f:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1592:	8d 50 01             	lea    0x1(%eax),%edx
    1595:	89 55 fc             	mov    %edx,-0x4(%ebp)
    1598:	8b 55 f8             	mov    -0x8(%ebp),%edx
    159b:	8d 4a 01             	lea    0x1(%edx),%ecx
    159e:	89 4d f8             	mov    %ecx,-0x8(%ebp)
    15a1:	0f b6 12             	movzbl (%edx),%edx
    15a4:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    15a6:	8b 45 10             	mov    0x10(%ebp),%eax
    15a9:	8d 50 ff             	lea    -0x1(%eax),%edx
    15ac:	89 55 10             	mov    %edx,0x10(%ebp)
    15af:	85 c0                	test   %eax,%eax
    15b1:	7f dc                	jg     158f <memmove+0x14>
    *dst++ = *src++;
  return vdst;
    15b3:	8b 45 08             	mov    0x8(%ebp),%eax
}
    15b6:	c9                   	leave  
    15b7:	c3                   	ret    

000015b8 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    15b8:	b8 01 00 00 00       	mov    $0x1,%eax
    15bd:	cd 40                	int    $0x40
    15bf:	c3                   	ret    

000015c0 <exit>:
SYSCALL(exit)
    15c0:	b8 02 00 00 00       	mov    $0x2,%eax
    15c5:	cd 40                	int    $0x40
    15c7:	c3                   	ret    

000015c8 <wait>:
SYSCALL(wait)
    15c8:	b8 03 00 00 00       	mov    $0x3,%eax
    15cd:	cd 40                	int    $0x40
    15cf:	c3                   	ret    

000015d0 <pipe>:
SYSCALL(pipe)
    15d0:	b8 04 00 00 00       	mov    $0x4,%eax
    15d5:	cd 40                	int    $0x40
    15d7:	c3                   	ret    

000015d8 <read>:
SYSCALL(read)
    15d8:	b8 05 00 00 00       	mov    $0x5,%eax
    15dd:	cd 40                	int    $0x40
    15df:	c3                   	ret    

000015e0 <write>:
SYSCALL(write)
    15e0:	b8 10 00 00 00       	mov    $0x10,%eax
    15e5:	cd 40                	int    $0x40
    15e7:	c3                   	ret    

000015e8 <close>:
SYSCALL(close)
    15e8:	b8 15 00 00 00       	mov    $0x15,%eax
    15ed:	cd 40                	int    $0x40
    15ef:	c3                   	ret    

000015f0 <kill>:
SYSCALL(kill)
    15f0:	b8 06 00 00 00       	mov    $0x6,%eax
    15f5:	cd 40                	int    $0x40
    15f7:	c3                   	ret    

000015f8 <exec>:
SYSCALL(exec)
    15f8:	b8 07 00 00 00       	mov    $0x7,%eax
    15fd:	cd 40                	int    $0x40
    15ff:	c3                   	ret    

00001600 <open>:
SYSCALL(open)
    1600:	b8 0f 00 00 00       	mov    $0xf,%eax
    1605:	cd 40                	int    $0x40
    1607:	c3                   	ret    

00001608 <mknod>:
SYSCALL(mknod)
    1608:	b8 11 00 00 00       	mov    $0x11,%eax
    160d:	cd 40                	int    $0x40
    160f:	c3                   	ret    

00001610 <unlink>:
SYSCALL(unlink)
    1610:	b8 12 00 00 00       	mov    $0x12,%eax
    1615:	cd 40                	int    $0x40
    1617:	c3                   	ret    

00001618 <fstat>:
SYSCALL(fstat)
    1618:	b8 08 00 00 00       	mov    $0x8,%eax
    161d:	cd 40                	int    $0x40
    161f:	c3                   	ret    

00001620 <link>:
SYSCALL(link)
    1620:	b8 13 00 00 00       	mov    $0x13,%eax
    1625:	cd 40                	int    $0x40
    1627:	c3                   	ret    

00001628 <mkdir>:
SYSCALL(mkdir)
    1628:	b8 14 00 00 00       	mov    $0x14,%eax
    162d:	cd 40                	int    $0x40
    162f:	c3                   	ret    

00001630 <chdir>:
SYSCALL(chdir)
    1630:	b8 09 00 00 00       	mov    $0x9,%eax
    1635:	cd 40                	int    $0x40
    1637:	c3                   	ret    

00001638 <dup>:
SYSCALL(dup)
    1638:	b8 0a 00 00 00       	mov    $0xa,%eax
    163d:	cd 40                	int    $0x40
    163f:	c3                   	ret    

00001640 <getpid>:
SYSCALL(getpid)
    1640:	b8 0b 00 00 00       	mov    $0xb,%eax
    1645:	cd 40                	int    $0x40
    1647:	c3                   	ret    

00001648 <sbrk>:
SYSCALL(sbrk)
    1648:	b8 0c 00 00 00       	mov    $0xc,%eax
    164d:	cd 40                	int    $0x40
    164f:	c3                   	ret    

00001650 <sleep>:
SYSCALL(sleep)
    1650:	b8 0d 00 00 00       	mov    $0xd,%eax
    1655:	cd 40                	int    $0x40
    1657:	c3                   	ret    

00001658 <uptime>:
SYSCALL(uptime)
    1658:	b8 0e 00 00 00       	mov    $0xe,%eax
    165d:	cd 40                	int    $0x40
    165f:	c3                   	ret    

00001660 <clone>:
SYSCALL(clone)
    1660:	b8 16 00 00 00       	mov    $0x16,%eax
    1665:	cd 40                	int    $0x40
    1667:	c3                   	ret    

00001668 <texit>:
SYSCALL(texit)
    1668:	b8 17 00 00 00       	mov    $0x17,%eax
    166d:	cd 40                	int    $0x40
    166f:	c3                   	ret    

00001670 <tsleep>:
SYSCALL(tsleep)
    1670:	b8 18 00 00 00       	mov    $0x18,%eax
    1675:	cd 40                	int    $0x40
    1677:	c3                   	ret    

00001678 <twakeup>:
SYSCALL(twakeup)
    1678:	b8 19 00 00 00       	mov    $0x19,%eax
    167d:	cd 40                	int    $0x40
    167f:	c3                   	ret    

00001680 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
    1680:	55                   	push   %ebp
    1681:	89 e5                	mov    %esp,%ebp
    1683:	83 ec 18             	sub    $0x18,%esp
    1686:	8b 45 0c             	mov    0xc(%ebp),%eax
    1689:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
    168c:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    1693:	00 
    1694:	8d 45 f4             	lea    -0xc(%ebp),%eax
    1697:	89 44 24 04          	mov    %eax,0x4(%esp)
    169b:	8b 45 08             	mov    0x8(%ebp),%eax
    169e:	89 04 24             	mov    %eax,(%esp)
    16a1:	e8 3a ff ff ff       	call   15e0 <write>
}
    16a6:	c9                   	leave  
    16a7:	c3                   	ret    

000016a8 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
    16a8:	55                   	push   %ebp
    16a9:	89 e5                	mov    %esp,%ebp
    16ab:	56                   	push   %esi
    16ac:	53                   	push   %ebx
    16ad:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    16b0:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
    16b7:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
    16bb:	74 17                	je     16d4 <printint+0x2c>
    16bd:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    16c1:	79 11                	jns    16d4 <printint+0x2c>
    neg = 1;
    16c3:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
    16ca:	8b 45 0c             	mov    0xc(%ebp),%eax
    16cd:	f7 d8                	neg    %eax
    16cf:	89 45 ec             	mov    %eax,-0x14(%ebp)
    16d2:	eb 06                	jmp    16da <printint+0x32>
  } else {
    x = xx;
    16d4:	8b 45 0c             	mov    0xc(%ebp),%eax
    16d7:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
    16da:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
    16e1:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    16e4:	8d 41 01             	lea    0x1(%ecx),%eax
    16e7:	89 45 f4             	mov    %eax,-0xc(%ebp)
    16ea:	8b 5d 10             	mov    0x10(%ebp),%ebx
    16ed:	8b 45 ec             	mov    -0x14(%ebp),%eax
    16f0:	ba 00 00 00 00       	mov    $0x0,%edx
    16f5:	f7 f3                	div    %ebx
    16f7:	89 d0                	mov    %edx,%eax
    16f9:	0f b6 80 6c 24 00 00 	movzbl 0x246c(%eax),%eax
    1700:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
    1704:	8b 75 10             	mov    0x10(%ebp),%esi
    1707:	8b 45 ec             	mov    -0x14(%ebp),%eax
    170a:	ba 00 00 00 00       	mov    $0x0,%edx
    170f:	f7 f6                	div    %esi
    1711:	89 45 ec             	mov    %eax,-0x14(%ebp)
    1714:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1718:	75 c7                	jne    16e1 <printint+0x39>
  if(neg)
    171a:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    171e:	74 10                	je     1730 <printint+0x88>
    buf[i++] = '-';
    1720:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1723:	8d 50 01             	lea    0x1(%eax),%edx
    1726:	89 55 f4             	mov    %edx,-0xc(%ebp)
    1729:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
    172e:	eb 1f                	jmp    174f <printint+0xa7>
    1730:	eb 1d                	jmp    174f <printint+0xa7>
    putc(fd, buf[i]);
    1732:	8d 55 dc             	lea    -0x24(%ebp),%edx
    1735:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1738:	01 d0                	add    %edx,%eax
    173a:	0f b6 00             	movzbl (%eax),%eax
    173d:	0f be c0             	movsbl %al,%eax
    1740:	89 44 24 04          	mov    %eax,0x4(%esp)
    1744:	8b 45 08             	mov    0x8(%ebp),%eax
    1747:	89 04 24             	mov    %eax,(%esp)
    174a:	e8 31 ff ff ff       	call   1680 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    174f:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    1753:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1757:	79 d9                	jns    1732 <printint+0x8a>
    putc(fd, buf[i]);
}
    1759:	83 c4 30             	add    $0x30,%esp
    175c:	5b                   	pop    %ebx
    175d:	5e                   	pop    %esi
    175e:	5d                   	pop    %ebp
    175f:	c3                   	ret    

00001760 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    1760:	55                   	push   %ebp
    1761:	89 e5                	mov    %esp,%ebp
    1763:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
    1766:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
    176d:	8d 45 0c             	lea    0xc(%ebp),%eax
    1770:	83 c0 04             	add    $0x4,%eax
    1773:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
    1776:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    177d:	e9 7c 01 00 00       	jmp    18fe <printf+0x19e>
    c = fmt[i] & 0xff;
    1782:	8b 55 0c             	mov    0xc(%ebp),%edx
    1785:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1788:	01 d0                	add    %edx,%eax
    178a:	0f b6 00             	movzbl (%eax),%eax
    178d:	0f be c0             	movsbl %al,%eax
    1790:	25 ff 00 00 00       	and    $0xff,%eax
    1795:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
    1798:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    179c:	75 2c                	jne    17ca <printf+0x6a>
      if(c == '%'){
    179e:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    17a2:	75 0c                	jne    17b0 <printf+0x50>
        state = '%';
    17a4:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
    17ab:	e9 4a 01 00 00       	jmp    18fa <printf+0x19a>
      } else {
        putc(fd, c);
    17b0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    17b3:	0f be c0             	movsbl %al,%eax
    17b6:	89 44 24 04          	mov    %eax,0x4(%esp)
    17ba:	8b 45 08             	mov    0x8(%ebp),%eax
    17bd:	89 04 24             	mov    %eax,(%esp)
    17c0:	e8 bb fe ff ff       	call   1680 <putc>
    17c5:	e9 30 01 00 00       	jmp    18fa <printf+0x19a>
      }
    } else if(state == '%'){
    17ca:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
    17ce:	0f 85 26 01 00 00    	jne    18fa <printf+0x19a>
      if(c == 'd'){
    17d4:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
    17d8:	75 2d                	jne    1807 <printf+0xa7>
        printint(fd, *ap, 10, 1);
    17da:	8b 45 e8             	mov    -0x18(%ebp),%eax
    17dd:	8b 00                	mov    (%eax),%eax
    17df:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    17e6:	00 
    17e7:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
    17ee:	00 
    17ef:	89 44 24 04          	mov    %eax,0x4(%esp)
    17f3:	8b 45 08             	mov    0x8(%ebp),%eax
    17f6:	89 04 24             	mov    %eax,(%esp)
    17f9:	e8 aa fe ff ff       	call   16a8 <printint>
        ap++;
    17fe:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    1802:	e9 ec 00 00 00       	jmp    18f3 <printf+0x193>
      } else if(c == 'x' || c == 'p'){
    1807:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
    180b:	74 06                	je     1813 <printf+0xb3>
    180d:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
    1811:	75 2d                	jne    1840 <printf+0xe0>
        printint(fd, *ap, 16, 0);
    1813:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1816:	8b 00                	mov    (%eax),%eax
    1818:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    181f:	00 
    1820:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
    1827:	00 
    1828:	89 44 24 04          	mov    %eax,0x4(%esp)
    182c:	8b 45 08             	mov    0x8(%ebp),%eax
    182f:	89 04 24             	mov    %eax,(%esp)
    1832:	e8 71 fe ff ff       	call   16a8 <printint>
        ap++;
    1837:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    183b:	e9 b3 00 00 00       	jmp    18f3 <printf+0x193>
      } else if(c == 's'){
    1840:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
    1844:	75 45                	jne    188b <printf+0x12b>
        s = (char*)*ap;
    1846:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1849:	8b 00                	mov    (%eax),%eax
    184b:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
    184e:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
    1852:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1856:	75 09                	jne    1861 <printf+0x101>
          s = "(null)";
    1858:	c7 45 f4 92 1f 00 00 	movl   $0x1f92,-0xc(%ebp)
        while(*s != 0){
    185f:	eb 1e                	jmp    187f <printf+0x11f>
    1861:	eb 1c                	jmp    187f <printf+0x11f>
          putc(fd, *s);
    1863:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1866:	0f b6 00             	movzbl (%eax),%eax
    1869:	0f be c0             	movsbl %al,%eax
    186c:	89 44 24 04          	mov    %eax,0x4(%esp)
    1870:	8b 45 08             	mov    0x8(%ebp),%eax
    1873:	89 04 24             	mov    %eax,(%esp)
    1876:	e8 05 fe ff ff       	call   1680 <putc>
          s++;
    187b:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    187f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1882:	0f b6 00             	movzbl (%eax),%eax
    1885:	84 c0                	test   %al,%al
    1887:	75 da                	jne    1863 <printf+0x103>
    1889:	eb 68                	jmp    18f3 <printf+0x193>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    188b:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
    188f:	75 1d                	jne    18ae <printf+0x14e>
        putc(fd, *ap);
    1891:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1894:	8b 00                	mov    (%eax),%eax
    1896:	0f be c0             	movsbl %al,%eax
    1899:	89 44 24 04          	mov    %eax,0x4(%esp)
    189d:	8b 45 08             	mov    0x8(%ebp),%eax
    18a0:	89 04 24             	mov    %eax,(%esp)
    18a3:	e8 d8 fd ff ff       	call   1680 <putc>
        ap++;
    18a8:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    18ac:	eb 45                	jmp    18f3 <printf+0x193>
      } else if(c == '%'){
    18ae:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    18b2:	75 17                	jne    18cb <printf+0x16b>
        putc(fd, c);
    18b4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    18b7:	0f be c0             	movsbl %al,%eax
    18ba:	89 44 24 04          	mov    %eax,0x4(%esp)
    18be:	8b 45 08             	mov    0x8(%ebp),%eax
    18c1:	89 04 24             	mov    %eax,(%esp)
    18c4:	e8 b7 fd ff ff       	call   1680 <putc>
    18c9:	eb 28                	jmp    18f3 <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
    18cb:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
    18d2:	00 
    18d3:	8b 45 08             	mov    0x8(%ebp),%eax
    18d6:	89 04 24             	mov    %eax,(%esp)
    18d9:	e8 a2 fd ff ff       	call   1680 <putc>
        putc(fd, c);
    18de:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    18e1:	0f be c0             	movsbl %al,%eax
    18e4:	89 44 24 04          	mov    %eax,0x4(%esp)
    18e8:	8b 45 08             	mov    0x8(%ebp),%eax
    18eb:	89 04 24             	mov    %eax,(%esp)
    18ee:	e8 8d fd ff ff       	call   1680 <putc>
      }
      state = 0;
    18f3:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    18fa:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    18fe:	8b 55 0c             	mov    0xc(%ebp),%edx
    1901:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1904:	01 d0                	add    %edx,%eax
    1906:	0f b6 00             	movzbl (%eax),%eax
    1909:	84 c0                	test   %al,%al
    190b:	0f 85 71 fe ff ff    	jne    1782 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    1911:	c9                   	leave  
    1912:	c3                   	ret    
    1913:	90                   	nop

00001914 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    1914:	55                   	push   %ebp
    1915:	89 e5                	mov    %esp,%ebp
    1917:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
    191a:	8b 45 08             	mov    0x8(%ebp),%eax
    191d:	83 e8 08             	sub    $0x8,%eax
    1920:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1923:	a1 a8 24 00 00       	mov    0x24a8,%eax
    1928:	89 45 fc             	mov    %eax,-0x4(%ebp)
    192b:	eb 24                	jmp    1951 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    192d:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1930:	8b 00                	mov    (%eax),%eax
    1932:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    1935:	77 12                	ja     1949 <free+0x35>
    1937:	8b 45 f8             	mov    -0x8(%ebp),%eax
    193a:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    193d:	77 24                	ja     1963 <free+0x4f>
    193f:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1942:	8b 00                	mov    (%eax),%eax
    1944:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    1947:	77 1a                	ja     1963 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1949:	8b 45 fc             	mov    -0x4(%ebp),%eax
    194c:	8b 00                	mov    (%eax),%eax
    194e:	89 45 fc             	mov    %eax,-0x4(%ebp)
    1951:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1954:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    1957:	76 d4                	jbe    192d <free+0x19>
    1959:	8b 45 fc             	mov    -0x4(%ebp),%eax
    195c:	8b 00                	mov    (%eax),%eax
    195e:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    1961:	76 ca                	jbe    192d <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    1963:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1966:	8b 40 04             	mov    0x4(%eax),%eax
    1969:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    1970:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1973:	01 c2                	add    %eax,%edx
    1975:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1978:	8b 00                	mov    (%eax),%eax
    197a:	39 c2                	cmp    %eax,%edx
    197c:	75 24                	jne    19a2 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
    197e:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1981:	8b 50 04             	mov    0x4(%eax),%edx
    1984:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1987:	8b 00                	mov    (%eax),%eax
    1989:	8b 40 04             	mov    0x4(%eax),%eax
    198c:	01 c2                	add    %eax,%edx
    198e:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1991:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
    1994:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1997:	8b 00                	mov    (%eax),%eax
    1999:	8b 10                	mov    (%eax),%edx
    199b:	8b 45 f8             	mov    -0x8(%ebp),%eax
    199e:	89 10                	mov    %edx,(%eax)
    19a0:	eb 0a                	jmp    19ac <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
    19a2:	8b 45 fc             	mov    -0x4(%ebp),%eax
    19a5:	8b 10                	mov    (%eax),%edx
    19a7:	8b 45 f8             	mov    -0x8(%ebp),%eax
    19aa:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
    19ac:	8b 45 fc             	mov    -0x4(%ebp),%eax
    19af:	8b 40 04             	mov    0x4(%eax),%eax
    19b2:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    19b9:	8b 45 fc             	mov    -0x4(%ebp),%eax
    19bc:	01 d0                	add    %edx,%eax
    19be:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    19c1:	75 20                	jne    19e3 <free+0xcf>
    p->s.size += bp->s.size;
    19c3:	8b 45 fc             	mov    -0x4(%ebp),%eax
    19c6:	8b 50 04             	mov    0x4(%eax),%edx
    19c9:	8b 45 f8             	mov    -0x8(%ebp),%eax
    19cc:	8b 40 04             	mov    0x4(%eax),%eax
    19cf:	01 c2                	add    %eax,%edx
    19d1:	8b 45 fc             	mov    -0x4(%ebp),%eax
    19d4:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    19d7:	8b 45 f8             	mov    -0x8(%ebp),%eax
    19da:	8b 10                	mov    (%eax),%edx
    19dc:	8b 45 fc             	mov    -0x4(%ebp),%eax
    19df:	89 10                	mov    %edx,(%eax)
    19e1:	eb 08                	jmp    19eb <free+0xd7>
  } else
    p->s.ptr = bp;
    19e3:	8b 45 fc             	mov    -0x4(%ebp),%eax
    19e6:	8b 55 f8             	mov    -0x8(%ebp),%edx
    19e9:	89 10                	mov    %edx,(%eax)
  freep = p;
    19eb:	8b 45 fc             	mov    -0x4(%ebp),%eax
    19ee:	a3 a8 24 00 00       	mov    %eax,0x24a8
}
    19f3:	c9                   	leave  
    19f4:	c3                   	ret    

000019f5 <morecore>:

static Header*
morecore(uint nu)
{
    19f5:	55                   	push   %ebp
    19f6:	89 e5                	mov    %esp,%ebp
    19f8:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
    19fb:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
    1a02:	77 07                	ja     1a0b <morecore+0x16>
    nu = 4096;
    1a04:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
    1a0b:	8b 45 08             	mov    0x8(%ebp),%eax
    1a0e:	c1 e0 03             	shl    $0x3,%eax
    1a11:	89 04 24             	mov    %eax,(%esp)
    1a14:	e8 2f fc ff ff       	call   1648 <sbrk>
    1a19:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
    1a1c:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
    1a20:	75 07                	jne    1a29 <morecore+0x34>
    return 0;
    1a22:	b8 00 00 00 00       	mov    $0x0,%eax
    1a27:	eb 22                	jmp    1a4b <morecore+0x56>
  hp = (Header*)p;
    1a29:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1a2c:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
    1a2f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1a32:	8b 55 08             	mov    0x8(%ebp),%edx
    1a35:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
    1a38:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1a3b:	83 c0 08             	add    $0x8,%eax
    1a3e:	89 04 24             	mov    %eax,(%esp)
    1a41:	e8 ce fe ff ff       	call   1914 <free>
  return freep;
    1a46:	a1 a8 24 00 00       	mov    0x24a8,%eax
}
    1a4b:	c9                   	leave  
    1a4c:	c3                   	ret    

00001a4d <malloc>:

void*
malloc(uint nbytes)
{
    1a4d:	55                   	push   %ebp
    1a4e:	89 e5                	mov    %esp,%ebp
    1a50:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1a53:	8b 45 08             	mov    0x8(%ebp),%eax
    1a56:	83 c0 07             	add    $0x7,%eax
    1a59:	c1 e8 03             	shr    $0x3,%eax
    1a5c:	83 c0 01             	add    $0x1,%eax
    1a5f:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
    1a62:	a1 a8 24 00 00       	mov    0x24a8,%eax
    1a67:	89 45 f0             	mov    %eax,-0x10(%ebp)
    1a6a:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1a6e:	75 23                	jne    1a93 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
    1a70:	c7 45 f0 a0 24 00 00 	movl   $0x24a0,-0x10(%ebp)
    1a77:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1a7a:	a3 a8 24 00 00       	mov    %eax,0x24a8
    1a7f:	a1 a8 24 00 00       	mov    0x24a8,%eax
    1a84:	a3 a0 24 00 00       	mov    %eax,0x24a0
    base.s.size = 0;
    1a89:	c7 05 a4 24 00 00 00 	movl   $0x0,0x24a4
    1a90:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1a93:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1a96:	8b 00                	mov    (%eax),%eax
    1a98:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
    1a9b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1a9e:	8b 40 04             	mov    0x4(%eax),%eax
    1aa1:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    1aa4:	72 4d                	jb     1af3 <malloc+0xa6>
      if(p->s.size == nunits)
    1aa6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1aa9:	8b 40 04             	mov    0x4(%eax),%eax
    1aac:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    1aaf:	75 0c                	jne    1abd <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
    1ab1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1ab4:	8b 10                	mov    (%eax),%edx
    1ab6:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1ab9:	89 10                	mov    %edx,(%eax)
    1abb:	eb 26                	jmp    1ae3 <malloc+0x96>
      else {
        p->s.size -= nunits;
    1abd:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1ac0:	8b 40 04             	mov    0x4(%eax),%eax
    1ac3:	2b 45 ec             	sub    -0x14(%ebp),%eax
    1ac6:	89 c2                	mov    %eax,%edx
    1ac8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1acb:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
    1ace:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1ad1:	8b 40 04             	mov    0x4(%eax),%eax
    1ad4:	c1 e0 03             	shl    $0x3,%eax
    1ad7:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
    1ada:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1add:	8b 55 ec             	mov    -0x14(%ebp),%edx
    1ae0:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
    1ae3:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1ae6:	a3 a8 24 00 00       	mov    %eax,0x24a8
      return (void*)(p + 1);
    1aeb:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1aee:	83 c0 08             	add    $0x8,%eax
    1af1:	eb 38                	jmp    1b2b <malloc+0xde>
    }
    if(p == freep)
    1af3:	a1 a8 24 00 00       	mov    0x24a8,%eax
    1af8:	39 45 f4             	cmp    %eax,-0xc(%ebp)
    1afb:	75 1b                	jne    1b18 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
    1afd:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1b00:	89 04 24             	mov    %eax,(%esp)
    1b03:	e8 ed fe ff ff       	call   19f5 <morecore>
    1b08:	89 45 f4             	mov    %eax,-0xc(%ebp)
    1b0b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1b0f:	75 07                	jne    1b18 <malloc+0xcb>
        return 0;
    1b11:	b8 00 00 00 00       	mov    $0x0,%eax
    1b16:	eb 13                	jmp    1b2b <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1b18:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1b1b:	89 45 f0             	mov    %eax,-0x10(%ebp)
    1b1e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1b21:	8b 00                	mov    (%eax),%eax
    1b23:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
    1b26:	e9 70 ff ff ff       	jmp    1a9b <malloc+0x4e>
}
    1b2b:	c9                   	leave  
    1b2c:	c3                   	ret    
    1b2d:	66 90                	xchg   %ax,%ax
    1b2f:	90                   	nop

00001b30 <xchg>:
  asm volatile("sti");
}

static inline uint
xchg(volatile uint *addr, uint newval)
{
    1b30:	55                   	push   %ebp
    1b31:	89 e5                	mov    %esp,%ebp
    1b33:	83 ec 10             	sub    $0x10,%esp
  uint result;
  
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
    1b36:	8b 55 08             	mov    0x8(%ebp),%edx
    1b39:	8b 45 0c             	mov    0xc(%ebp),%eax
    1b3c:	8b 4d 08             	mov    0x8(%ebp),%ecx
    1b3f:	f0 87 02             	lock xchg %eax,(%edx)
    1b42:	89 45 fc             	mov    %eax,-0x4(%ebp)
               "+m" (*addr), "=a" (result) :
               "1" (newval) :
               "cc");
  return result;
    1b45:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    1b48:	c9                   	leave  
    1b49:	c3                   	ret    

00001b4a <lock_init>:
#include "x86.h"
#include "proc.h"

unsigned long rands = 1;

void lock_init(lock_t *lock){
    1b4a:	55                   	push   %ebp
    1b4b:	89 e5                	mov    %esp,%ebp
    lock->locked = 0;
    1b4d:	8b 45 08             	mov    0x8(%ebp),%eax
    1b50:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
    1b56:	5d                   	pop    %ebp
    1b57:	c3                   	ret    

00001b58 <lock_acquire>:
void lock_acquire(lock_t *lock){
    1b58:	55                   	push   %ebp
    1b59:	89 e5                	mov    %esp,%ebp
    1b5b:	83 ec 08             	sub    $0x8,%esp
    while(xchg(&lock->locked,1) != 0);
    1b5e:	90                   	nop
    1b5f:	8b 45 08             	mov    0x8(%ebp),%eax
    1b62:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
    1b69:	00 
    1b6a:	89 04 24             	mov    %eax,(%esp)
    1b6d:	e8 be ff ff ff       	call   1b30 <xchg>
    1b72:	85 c0                	test   %eax,%eax
    1b74:	75 e9                	jne    1b5f <lock_acquire+0x7>
}
    1b76:	c9                   	leave  
    1b77:	c3                   	ret    

00001b78 <lock_release>:
void lock_release(lock_t *lock){
    1b78:	55                   	push   %ebp
    1b79:	89 e5                	mov    %esp,%ebp
    1b7b:	83 ec 08             	sub    $0x8,%esp
    xchg(&lock->locked,0);
    1b7e:	8b 45 08             	mov    0x8(%ebp),%eax
    1b81:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1b88:	00 
    1b89:	89 04 24             	mov    %eax,(%esp)
    1b8c:	e8 9f ff ff ff       	call   1b30 <xchg>
}
    1b91:	c9                   	leave  
    1b92:	c3                   	ret    

00001b93 <thread_create>:


void *thread_create(void(*start_routine)(void*), void *arg){
    1b93:	55                   	push   %ebp
    1b94:	89 e5                	mov    %esp,%ebp
    1b96:	83 ec 28             	sub    $0x28,%esp
    int tid;
    void * stack = malloc(2 * 4096);
    1b99:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
    1ba0:	e8 a8 fe ff ff       	call   1a4d <malloc>
    1ba5:	89 45 f4             	mov    %eax,-0xc(%ebp)
    void *garbage_stack = stack; 
    1ba8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1bab:	89 45 f0             	mov    %eax,-0x10(%ebp)
   // printf(1,"start routine addr : %d\n",(uint)start_routine);


    if((uint)stack % 4096){
    1bae:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1bb1:	25 ff 0f 00 00       	and    $0xfff,%eax
    1bb6:	85 c0                	test   %eax,%eax
    1bb8:	74 14                	je     1bce <thread_create+0x3b>
        stack = stack + (4096 - (uint)stack % 4096);
    1bba:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1bbd:	25 ff 0f 00 00       	and    $0xfff,%eax
    1bc2:	89 c2                	mov    %eax,%edx
    1bc4:	b8 00 10 00 00       	mov    $0x1000,%eax
    1bc9:	29 d0                	sub    %edx,%eax
    1bcb:	01 45 f4             	add    %eax,-0xc(%ebp)
    }
    if (stack == 0){
    1bce:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1bd2:	75 1b                	jne    1bef <thread_create+0x5c>

        printf(1,"malloc fail \n");
    1bd4:	c7 44 24 04 99 1f 00 	movl   $0x1f99,0x4(%esp)
    1bdb:	00 
    1bdc:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1be3:	e8 78 fb ff ff       	call   1760 <printf>
        return 0;
    1be8:	b8 00 00 00 00       	mov    $0x0,%eax
    1bed:	eb 6f                	jmp    1c5e <thread_create+0xcb>
    }

    tid = clone((uint)stack,PSIZE,(uint)start_routine,(int)arg);
    1bef:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    1bf2:	8b 55 08             	mov    0x8(%ebp),%edx
    1bf5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1bf8:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
    1bfc:	89 54 24 08          	mov    %edx,0x8(%esp)
    1c00:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
    1c07:	00 
    1c08:	89 04 24             	mov    %eax,(%esp)
    1c0b:	e8 50 fa ff ff       	call   1660 <clone>
    1c10:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(tid < 0){
    1c13:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1c17:	79 1b                	jns    1c34 <thread_create+0xa1>
        printf(1,"clone fails\n");
    1c19:	c7 44 24 04 a7 1f 00 	movl   $0x1fa7,0x4(%esp)
    1c20:	00 
    1c21:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1c28:	e8 33 fb ff ff       	call   1760 <printf>
        return 0;
    1c2d:	b8 00 00 00 00       	mov    $0x0,%eax
    1c32:	eb 2a                	jmp    1c5e <thread_create+0xcb>
    }
    if(tid > 0){
    1c34:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1c38:	7e 05                	jle    1c3f <thread_create+0xac>
        //store threads on thread table
        return garbage_stack;
    1c3a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1c3d:	eb 1f                	jmp    1c5e <thread_create+0xcb>
    }
    if(tid == 0){
    1c3f:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1c43:	75 14                	jne    1c59 <thread_create+0xc6>
        printf(1,"tid = 0 return \n");
    1c45:	c7 44 24 04 b4 1f 00 	movl   $0x1fb4,0x4(%esp)
    1c4c:	00 
    1c4d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1c54:	e8 07 fb ff ff       	call   1760 <printf>
    }
//    wait();
//    free(garbage_stack);

    return 0;
    1c59:	b8 00 00 00 00       	mov    $0x0,%eax
}
    1c5e:	c9                   	leave  
    1c5f:	c3                   	ret    

00001c60 <random>:

// generate 0 -> max random number exclude max.
int random(int max){
    1c60:	55                   	push   %ebp
    1c61:	89 e5                	mov    %esp,%ebp
    rands = rands * 1664525 + 1013904233;
    1c63:	a1 80 24 00 00       	mov    0x2480,%eax
    1c68:	69 c0 0d 66 19 00    	imul   $0x19660d,%eax,%eax
    1c6e:	05 69 f3 6e 3c       	add    $0x3c6ef369,%eax
    1c73:	a3 80 24 00 00       	mov    %eax,0x2480
    return (int)(rands % max);
    1c78:	a1 80 24 00 00       	mov    0x2480,%eax
    1c7d:	8b 4d 08             	mov    0x8(%ebp),%ecx
    1c80:	ba 00 00 00 00       	mov    $0x0,%edx
    1c85:	f7 f1                	div    %ecx
    1c87:	89 d0                	mov    %edx,%eax
}
    1c89:	5d                   	pop    %ebp
    1c8a:	c3                   	ret    
    1c8b:	90                   	nop

00001c8c <init_q>:
#include "queue.h"
#include "types.h"
#include "user.h"

void init_q(struct queue *q){
    1c8c:	55                   	push   %ebp
    1c8d:	89 e5                	mov    %esp,%ebp
    q->size = 0;
    1c8f:	8b 45 08             	mov    0x8(%ebp),%eax
    1c92:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    q->head = 0;
    1c98:	8b 45 08             	mov    0x8(%ebp),%eax
    1c9b:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    q->tail = 0;
    1ca2:	8b 45 08             	mov    0x8(%ebp),%eax
    1ca5:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
}
    1cac:	5d                   	pop    %ebp
    1cad:	c3                   	ret    

00001cae <add_q>:

void add_q(struct queue *q, int v){
    1cae:	55                   	push   %ebp
    1caf:	89 e5                	mov    %esp,%ebp
    1cb1:	83 ec 28             	sub    $0x28,%esp
    struct node * n = malloc(sizeof(struct node));
    1cb4:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
    1cbb:	e8 8d fd ff ff       	call   1a4d <malloc>
    1cc0:	89 45 f4             	mov    %eax,-0xc(%ebp)
    n->next = 0;
    1cc3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1cc6:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    n->value = v;
    1ccd:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1cd0:	8b 55 0c             	mov    0xc(%ebp),%edx
    1cd3:	89 10                	mov    %edx,(%eax)
    if(q->head == 0){
    1cd5:	8b 45 08             	mov    0x8(%ebp),%eax
    1cd8:	8b 40 04             	mov    0x4(%eax),%eax
    1cdb:	85 c0                	test   %eax,%eax
    1cdd:	75 0b                	jne    1cea <add_q+0x3c>
        q->head = n;
    1cdf:	8b 45 08             	mov    0x8(%ebp),%eax
    1ce2:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1ce5:	89 50 04             	mov    %edx,0x4(%eax)
    1ce8:	eb 0c                	jmp    1cf6 <add_q+0x48>
    }else{
        q->tail->next = n;
    1cea:	8b 45 08             	mov    0x8(%ebp),%eax
    1ced:	8b 40 08             	mov    0x8(%eax),%eax
    1cf0:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1cf3:	89 50 04             	mov    %edx,0x4(%eax)
    }
    q->tail = n;
    1cf6:	8b 45 08             	mov    0x8(%ebp),%eax
    1cf9:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1cfc:	89 50 08             	mov    %edx,0x8(%eax)
    q->size++;
    1cff:	8b 45 08             	mov    0x8(%ebp),%eax
    1d02:	8b 00                	mov    (%eax),%eax
    1d04:	8d 50 01             	lea    0x1(%eax),%edx
    1d07:	8b 45 08             	mov    0x8(%ebp),%eax
    1d0a:	89 10                	mov    %edx,(%eax)
}
    1d0c:	c9                   	leave  
    1d0d:	c3                   	ret    

00001d0e <empty_q>:

int empty_q(struct queue *q){
    1d0e:	55                   	push   %ebp
    1d0f:	89 e5                	mov    %esp,%ebp
    if(q->size == 0)
    1d11:	8b 45 08             	mov    0x8(%ebp),%eax
    1d14:	8b 00                	mov    (%eax),%eax
    1d16:	85 c0                	test   %eax,%eax
    1d18:	75 07                	jne    1d21 <empty_q+0x13>
        return 1;
    1d1a:	b8 01 00 00 00       	mov    $0x1,%eax
    1d1f:	eb 05                	jmp    1d26 <empty_q+0x18>
    else
        return 0;
    1d21:	b8 00 00 00 00       	mov    $0x0,%eax
} 
    1d26:	5d                   	pop    %ebp
    1d27:	c3                   	ret    

00001d28 <pop_q>:
int pop_q(struct queue *q){
    1d28:	55                   	push   %ebp
    1d29:	89 e5                	mov    %esp,%ebp
    1d2b:	83 ec 28             	sub    $0x28,%esp
    int val;
    struct node *destroy;
    if(!empty_q(q)){
    1d2e:	8b 45 08             	mov    0x8(%ebp),%eax
    1d31:	89 04 24             	mov    %eax,(%esp)
    1d34:	e8 d5 ff ff ff       	call   1d0e <empty_q>
    1d39:	85 c0                	test   %eax,%eax
    1d3b:	75 5d                	jne    1d9a <pop_q+0x72>
       val = q->head->value; 
    1d3d:	8b 45 08             	mov    0x8(%ebp),%eax
    1d40:	8b 40 04             	mov    0x4(%eax),%eax
    1d43:	8b 00                	mov    (%eax),%eax
    1d45:	89 45 f4             	mov    %eax,-0xc(%ebp)
       destroy = q->head;
    1d48:	8b 45 08             	mov    0x8(%ebp),%eax
    1d4b:	8b 40 04             	mov    0x4(%eax),%eax
    1d4e:	89 45 f0             	mov    %eax,-0x10(%ebp)
       q->head = q->head->next;
    1d51:	8b 45 08             	mov    0x8(%ebp),%eax
    1d54:	8b 40 04             	mov    0x4(%eax),%eax
    1d57:	8b 50 04             	mov    0x4(%eax),%edx
    1d5a:	8b 45 08             	mov    0x8(%ebp),%eax
    1d5d:	89 50 04             	mov    %edx,0x4(%eax)
       free(destroy);
    1d60:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1d63:	89 04 24             	mov    %eax,(%esp)
    1d66:	e8 a9 fb ff ff       	call   1914 <free>
       q->size--;
    1d6b:	8b 45 08             	mov    0x8(%ebp),%eax
    1d6e:	8b 00                	mov    (%eax),%eax
    1d70:	8d 50 ff             	lea    -0x1(%eax),%edx
    1d73:	8b 45 08             	mov    0x8(%ebp),%eax
    1d76:	89 10                	mov    %edx,(%eax)
       if(q->size == 0){
    1d78:	8b 45 08             	mov    0x8(%ebp),%eax
    1d7b:	8b 00                	mov    (%eax),%eax
    1d7d:	85 c0                	test   %eax,%eax
    1d7f:	75 14                	jne    1d95 <pop_q+0x6d>
            q->head = 0;
    1d81:	8b 45 08             	mov    0x8(%ebp),%eax
    1d84:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
            q->tail = 0;
    1d8b:	8b 45 08             	mov    0x8(%ebp),%eax
    1d8e:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
       }
       return val;
    1d95:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1d98:	eb 05                	jmp    1d9f <pop_q+0x77>
    }
    return -1;
    1d9a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
    1d9f:	c9                   	leave  
    1da0:	c3                   	ret    

00001da1 <dominant>:

void dominant(struct queue* q, int i){
    1da1:	55                   	push   %ebp
    1da2:	89 e5                	mov    %esp,%ebp
    1da4:	83 ec 28             	sub    $0x28,%esp
    struct node * n = malloc(sizeof(struct node));
    1da7:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
    1dae:	e8 9a fc ff ff       	call   1a4d <malloc>
    1db3:	89 45 f4             	mov    %eax,-0xc(%ebp)
    n->value = i;
    1db6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1db9:	8b 55 0c             	mov    0xc(%ebp),%edx
    1dbc:	89 10                	mov    %edx,(%eax)

    if(q->head == 0){
    1dbe:	8b 45 08             	mov    0x8(%ebp),%eax
    1dc1:	8b 40 04             	mov    0x4(%eax),%eax
    1dc4:	85 c0                	test   %eax,%eax
    1dc6:	75 14                	jne    1ddc <dominant+0x3b>
        q->head = n;
    1dc8:	8b 45 08             	mov    0x8(%ebp),%eax
    1dcb:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1dce:	89 50 04             	mov    %edx,0x4(%eax)
        q->tail = n;
    1dd1:	8b 45 08             	mov    0x8(%ebp),%eax
    1dd4:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1dd7:	89 50 08             	mov    %edx,0x8(%eax)
    1dda:	eb 15                	jmp    1df1 <dominant+0x50>
    }
    else{
        n->next = q->head;
    1ddc:	8b 45 08             	mov    0x8(%ebp),%eax
    1ddf:	8b 50 04             	mov    0x4(%eax),%edx
    1de2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1de5:	89 50 04             	mov    %edx,0x4(%eax)
        q->head = n;
    1de8:	8b 45 08             	mov    0x8(%ebp),%eax
    1deb:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1dee:	89 50 04             	mov    %edx,0x4(%eax)
    }
    q->size++;
    1df1:	8b 45 08             	mov    0x8(%ebp),%eax
    1df4:	8b 00                	mov    (%eax),%eax
    1df6:	8d 50 01             	lea    0x1(%eax),%edx
    1df9:	8b 45 08             	mov    0x8(%ebp),%eax
    1dfc:	89 10                	mov    %edx,(%eax)
}
    1dfe:	c9                   	leave  
    1dff:	c3                   	ret    

00001e00 <sem_init>:
#include "semaphore.h"
#include "user.h"

// Initializes the semaphore
void sem_init(struct Semaphore* s, int value){
    1e00:	55                   	push   %ebp
    1e01:	89 e5                	mov    %esp,%ebp
    1e03:	83 ec 18             	sub    $0x18,%esp
    s->val = value;
    1e06:	8b 45 08             	mov    0x8(%ebp),%eax
    1e09:	8b 55 0c             	mov    0xc(%ebp),%edx
    1e0c:	89 10                	mov    %edx,(%eax)
    lock_init(&s->lock);
    1e0e:	8b 45 08             	mov    0x8(%ebp),%eax
    1e11:	83 c0 04             	add    $0x4,%eax
    1e14:	89 04 24             	mov    %eax,(%esp)
    1e17:	e8 2e fd ff ff       	call   1b4a <lock_init>
    init_q(&s->q);
    1e1c:	8b 45 08             	mov    0x8(%ebp),%eax
    1e1f:	83 c0 08             	add    $0x8,%eax
    1e22:	89 04 24             	mov    %eax,(%esp)
    1e25:	e8 62 fe ff ff       	call   1c8c <init_q>
}
    1e2a:	c9                   	leave  
    1e2b:	c3                   	ret    

00001e2c <sem_acquire>:

// Decrements the semaphore
void sem_acquire(struct Semaphore* s){
    1e2c:	55                   	push   %ebp
    1e2d:	89 e5                	mov    %esp,%ebp
    1e2f:	83 ec 28             	sub    $0x28,%esp
    lock_acquire(&s->lock);
    1e32:	8b 45 08             	mov    0x8(%ebp),%eax
    1e35:	83 c0 04             	add    $0x4,%eax
    1e38:	89 04 24             	mov    %eax,(%esp)
    1e3b:	e8 18 fd ff ff       	call   1b58 <lock_acquire>

    if(s->val == 0){
    1e40:	8b 45 08             	mov    0x8(%ebp),%eax
    1e43:	8b 00                	mov    (%eax),%eax
    1e45:	85 c0                	test   %eax,%eax
    1e47:	75 32                	jne    1e7b <sem_acquire+0x4f>
        int pid;
        pid = getpid();
    1e49:	e8 f2 f7 ff ff       	call   1640 <getpid>
    1e4e:	89 45 f4             	mov    %eax,-0xc(%ebp)
        add_q(&s->q, pid);
    1e51:	8b 45 08             	mov    0x8(%ebp),%eax
    1e54:	8d 50 08             	lea    0x8(%eax),%edx
    1e57:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1e5a:	89 44 24 04          	mov    %eax,0x4(%esp)
    1e5e:	89 14 24             	mov    %edx,(%esp)
    1e61:	e8 48 fe ff ff       	call   1cae <add_q>
        lock_release(&s->lock);
    1e66:	8b 45 08             	mov    0x8(%ebp),%eax
    1e69:	83 c0 04             	add    $0x4,%eax
    1e6c:	89 04 24             	mov    %eax,(%esp)
    1e6f:	e8 04 fd ff ff       	call   1b78 <lock_release>
        tsleep();
    1e74:	e8 f7 f7 ff ff       	call   1670 <tsleep>
    1e79:	eb 1b                	jmp    1e96 <sem_acquire+0x6a>
    }
    else{
        s->val--;
    1e7b:	8b 45 08             	mov    0x8(%ebp),%eax
    1e7e:	8b 00                	mov    (%eax),%eax
    1e80:	8d 50 ff             	lea    -0x1(%eax),%edx
    1e83:	8b 45 08             	mov    0x8(%ebp),%eax
    1e86:	89 10                	mov    %edx,(%eax)
        lock_release(&s->lock);
    1e88:	8b 45 08             	mov    0x8(%ebp),%eax
    1e8b:	83 c0 04             	add    $0x4,%eax
    1e8e:	89 04 24             	mov    %eax,(%esp)
    1e91:	e8 e2 fc ff ff       	call   1b78 <lock_release>
    }
}
    1e96:	c9                   	leave  
    1e97:	c3                   	ret    

00001e98 <sem_signal>:

// Increments the semaphore
void sem_signal(struct Semaphore* s){
    1e98:	55                   	push   %ebp
    1e99:	89 e5                	mov    %esp,%ebp
    1e9b:	83 ec 18             	sub    $0x18,%esp
    lock_acquire(&s->lock);
    1e9e:	8b 45 08             	mov    0x8(%ebp),%eax
    1ea1:	83 c0 04             	add    $0x4,%eax
    1ea4:	89 04 24             	mov    %eax,(%esp)
    1ea7:	e8 ac fc ff ff       	call   1b58 <lock_acquire>

    if(!empty_q(&s->q)){
    1eac:	8b 45 08             	mov    0x8(%ebp),%eax
    1eaf:	83 c0 08             	add    $0x8,%eax
    1eb2:	89 04 24             	mov    %eax,(%esp)
    1eb5:	e8 54 fe ff ff       	call   1d0e <empty_q>
    1eba:	85 c0                	test   %eax,%eax
    1ebc:	75 18                	jne    1ed6 <sem_signal+0x3e>
        twakeup(pop_q(&s->q));
    1ebe:	8b 45 08             	mov    0x8(%ebp),%eax
    1ec1:	83 c0 08             	add    $0x8,%eax
    1ec4:	89 04 24             	mov    %eax,(%esp)
    1ec7:	e8 5c fe ff ff       	call   1d28 <pop_q>
    1ecc:	89 04 24             	mov    %eax,(%esp)
    1ecf:	e8 a4 f7 ff ff       	call   1678 <twakeup>
    1ed4:	eb 0d                	jmp    1ee3 <sem_signal+0x4b>
    }
    else{
        s->val++;
    1ed6:	8b 45 08             	mov    0x8(%ebp),%eax
    1ed9:	8b 00                	mov    (%eax),%eax
    1edb:	8d 50 01             	lea    0x1(%eax),%edx
    1ede:	8b 45 08             	mov    0x8(%ebp),%eax
    1ee1:	89 10                	mov    %edx,(%eax)
    }

    lock_release(&s->lock);
    1ee3:	8b 45 08             	mov    0x8(%ebp),%eax
    1ee6:	83 c0 04             	add    $0x4,%eax
    1ee9:	89 04 24             	mov    %eax,(%esp)
    1eec:	e8 87 fc ff ff       	call   1b78 <lock_release>
}
    1ef1:	c9                   	leave  
    1ef2:	c3                   	ret    

00001ef3 <sem_dom_acquire>:

void sem_dom_acquire(struct Semaphore* s){
    1ef3:	55                   	push   %ebp
    1ef4:	89 e5                	mov    %esp,%ebp
    1ef6:	83 ec 18             	sub    $0x18,%esp
    lock_acquire(&s->lock);
    1ef9:	8b 45 08             	mov    0x8(%ebp),%eax
    1efc:	83 c0 04             	add    $0x4,%eax
    1eff:	89 04 24             	mov    %eax,(%esp)
    1f02:	e8 51 fc ff ff       	call   1b58 <lock_acquire>

    if(s->val > 0){
    1f07:	8b 45 08             	mov    0x8(%ebp),%eax
    1f0a:	8b 00                	mov    (%eax),%eax
    1f0c:	85 c0                	test   %eax,%eax
    1f0e:	7e 1d                	jle    1f2d <sem_dom_acquire+0x3a>
        s->val--;
    1f10:	8b 45 08             	mov    0x8(%ebp),%eax
    1f13:	8b 00                	mov    (%eax),%eax
    1f15:	8d 50 ff             	lea    -0x1(%eax),%edx
    1f18:	8b 45 08             	mov    0x8(%ebp),%eax
    1f1b:	89 10                	mov    %edx,(%eax)
        lock_release(&s->lock);
    1f1d:	8b 45 08             	mov    0x8(%ebp),%eax
    1f20:	83 c0 04             	add    $0x4,%eax
    1f23:	89 04 24             	mov    %eax,(%esp)
    1f26:	e8 4d fc ff ff       	call   1b78 <lock_release>
        return;
    1f2b:	eb 2a                	jmp    1f57 <sem_dom_acquire+0x64>
    }

    dominant(&s->q,getpid());
    1f2d:	e8 0e f7 ff ff       	call   1640 <getpid>
    1f32:	8b 55 08             	mov    0x8(%ebp),%edx
    1f35:	83 c2 08             	add    $0x8,%edx
    1f38:	89 44 24 04          	mov    %eax,0x4(%esp)
    1f3c:	89 14 24             	mov    %edx,(%esp)
    1f3f:	e8 5d fe ff ff       	call   1da1 <dominant>
    lock_release(&s->lock);
    1f44:	8b 45 08             	mov    0x8(%ebp),%eax
    1f47:	83 c0 04             	add    $0x4,%eax
    1f4a:	89 04 24             	mov    %eax,(%esp)
    1f4d:	e8 26 fc ff ff       	call   1b78 <lock_release>
    tsleep();
    1f52:	e8 19 f7 ff ff       	call   1670 <tsleep>
}
    1f57:	c9                   	leave  
    1f58:	c3                   	ret    
