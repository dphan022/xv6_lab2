
_test:     file format elf32-i386


Disassembly of section .text:

00001000 <main>:

int n = 1;

void test_func(void * arg_ptr);

int main(int argc, char *argv[]){
    1000:	55                   	push   %ebp
    1001:	89 e5                	mov    %esp,%ebp
    1003:	83 e4 f0             	and    $0xfffffff0,%esp
    1006:	83 ec 20             	sub    $0x20,%esp

   printf(1,"thread_create test begin\n\n");
    1009:	c7 44 24 04 e1 1c 00 	movl   $0x1ce1,0x4(%esp)
    1010:	00 
    1011:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1018:	e8 cb 04 00 00       	call   14e8 <printf>

   printf(1,"before thread_create n = %d\n",n);
    101d:	a1 c8 21 00 00       	mov    0x21c8,%eax
    1022:	89 44 24 08          	mov    %eax,0x8(%esp)
    1026:	c7 44 24 04 fc 1c 00 	movl   $0x1cfc,0x4(%esp)
    102d:	00 
    102e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1035:	e8 ae 04 00 00       	call   14e8 <printf>

   int arg = 10;
    103a:	c7 44 24 18 0a 00 00 	movl   $0xa,0x18(%esp)
    1041:	00 
   void *tid = thread_create(test_func, (void *)&arg);
    1042:	8d 44 24 18          	lea    0x18(%esp),%eax
    1046:	89 44 24 04          	mov    %eax,0x4(%esp)
    104a:	c7 04 24 a7 10 00 00 	movl   $0x10a7,(%esp)
    1051:	e8 c5 08 00 00       	call   191b <thread_create>
    1056:	89 44 24 1c          	mov    %eax,0x1c(%esp)
   if(tid <= 0){
    105a:	83 7c 24 1c 00       	cmpl   $0x0,0x1c(%esp)
    105f:	75 19                	jne    107a <main+0x7a>
       printf(1,"wrong happen");
    1061:	c7 44 24 04 19 1d 00 	movl   $0x1d19,0x4(%esp)
    1068:	00 
    1069:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1070:	e8 73 04 00 00       	call   14e8 <printf>
       exit();
    1075:	e8 ce 02 00 00       	call   1348 <exit>
   } 
   while(wait()>= 0)
    107a:	eb 1d                	jmp    1099 <main+0x99>
   printf(1,"\nback to parent n = %d\n",n);
    107c:	a1 c8 21 00 00       	mov    0x21c8,%eax
    1081:	89 44 24 08          	mov    %eax,0x8(%esp)
    1085:	c7 44 24 04 26 1d 00 	movl   $0x1d26,0x4(%esp)
    108c:	00 
    108d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1094:	e8 4f 04 00 00       	call   14e8 <printf>
   void *tid = thread_create(test_func, (void *)&arg);
   if(tid <= 0){
       printf(1,"wrong happen");
       exit();
   } 
   while(wait()>= 0)
    1099:	e8 b2 02 00 00       	call   1350 <wait>
    109e:	85 c0                	test   %eax,%eax
    10a0:	79 da                	jns    107c <main+0x7c>
   printf(1,"\nback to parent n = %d\n",n);
   
   exit();
    10a2:	e8 a1 02 00 00       	call   1348 <exit>

000010a7 <test_func>:
}

//void test_func(void *arg_ptr){
void test_func(void *arg_ptr){
    10a7:	55                   	push   %ebp
    10a8:	89 e5                	mov    %esp,%ebp
    10aa:	83 ec 28             	sub    $0x28,%esp
    int * num = (int *)arg_ptr;
    10ad:	8b 45 08             	mov    0x8(%ebp),%eax
    10b0:	89 45 f4             	mov    %eax,-0xc(%ebp)
    n = *num; 
    10b3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    10b6:	8b 00                	mov    (%eax),%eax
    10b8:	a3 c8 21 00 00       	mov    %eax,0x21c8
    printf(1,"\n n is updated as %d\n",*num);
    10bd:	8b 45 f4             	mov    -0xc(%ebp),%eax
    10c0:	8b 00                	mov    (%eax),%eax
    10c2:	89 44 24 08          	mov    %eax,0x8(%esp)
    10c6:	c7 44 24 04 3e 1d 00 	movl   $0x1d3e,0x4(%esp)
    10cd:	00 
    10ce:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    10d5:	e8 0e 04 00 00       	call   14e8 <printf>
    texit();
    10da:	e8 11 03 00 00       	call   13f0 <texit>
    10df:	90                   	nop

000010e0 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
    10e0:	55                   	push   %ebp
    10e1:	89 e5                	mov    %esp,%ebp
    10e3:	57                   	push   %edi
    10e4:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
    10e5:	8b 4d 08             	mov    0x8(%ebp),%ecx
    10e8:	8b 55 10             	mov    0x10(%ebp),%edx
    10eb:	8b 45 0c             	mov    0xc(%ebp),%eax
    10ee:	89 cb                	mov    %ecx,%ebx
    10f0:	89 df                	mov    %ebx,%edi
    10f2:	89 d1                	mov    %edx,%ecx
    10f4:	fc                   	cld    
    10f5:	f3 aa                	rep stos %al,%es:(%edi)
    10f7:	89 ca                	mov    %ecx,%edx
    10f9:	89 fb                	mov    %edi,%ebx
    10fb:	89 5d 08             	mov    %ebx,0x8(%ebp)
    10fe:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
    1101:	5b                   	pop    %ebx
    1102:	5f                   	pop    %edi
    1103:	5d                   	pop    %ebp
    1104:	c3                   	ret    

00001105 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
    1105:	55                   	push   %ebp
    1106:	89 e5                	mov    %esp,%ebp
    1108:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
    110b:	8b 45 08             	mov    0x8(%ebp),%eax
    110e:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
    1111:	90                   	nop
    1112:	8b 45 08             	mov    0x8(%ebp),%eax
    1115:	8d 50 01             	lea    0x1(%eax),%edx
    1118:	89 55 08             	mov    %edx,0x8(%ebp)
    111b:	8b 55 0c             	mov    0xc(%ebp),%edx
    111e:	8d 4a 01             	lea    0x1(%edx),%ecx
    1121:	89 4d 0c             	mov    %ecx,0xc(%ebp)
    1124:	0f b6 12             	movzbl (%edx),%edx
    1127:	88 10                	mov    %dl,(%eax)
    1129:	0f b6 00             	movzbl (%eax),%eax
    112c:	84 c0                	test   %al,%al
    112e:	75 e2                	jne    1112 <strcpy+0xd>
    ;
  return os;
    1130:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    1133:	c9                   	leave  
    1134:	c3                   	ret    

00001135 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    1135:	55                   	push   %ebp
    1136:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
    1138:	eb 08                	jmp    1142 <strcmp+0xd>
    p++, q++;
    113a:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    113e:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    1142:	8b 45 08             	mov    0x8(%ebp),%eax
    1145:	0f b6 00             	movzbl (%eax),%eax
    1148:	84 c0                	test   %al,%al
    114a:	74 10                	je     115c <strcmp+0x27>
    114c:	8b 45 08             	mov    0x8(%ebp),%eax
    114f:	0f b6 10             	movzbl (%eax),%edx
    1152:	8b 45 0c             	mov    0xc(%ebp),%eax
    1155:	0f b6 00             	movzbl (%eax),%eax
    1158:	38 c2                	cmp    %al,%dl
    115a:	74 de                	je     113a <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
    115c:	8b 45 08             	mov    0x8(%ebp),%eax
    115f:	0f b6 00             	movzbl (%eax),%eax
    1162:	0f b6 d0             	movzbl %al,%edx
    1165:	8b 45 0c             	mov    0xc(%ebp),%eax
    1168:	0f b6 00             	movzbl (%eax),%eax
    116b:	0f b6 c0             	movzbl %al,%eax
    116e:	29 c2                	sub    %eax,%edx
    1170:	89 d0                	mov    %edx,%eax
}
    1172:	5d                   	pop    %ebp
    1173:	c3                   	ret    

00001174 <strlen>:

uint
strlen(char *s)
{
    1174:	55                   	push   %ebp
    1175:	89 e5                	mov    %esp,%ebp
    1177:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
    117a:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    1181:	eb 04                	jmp    1187 <strlen+0x13>
    1183:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    1187:	8b 55 fc             	mov    -0x4(%ebp),%edx
    118a:	8b 45 08             	mov    0x8(%ebp),%eax
    118d:	01 d0                	add    %edx,%eax
    118f:	0f b6 00             	movzbl (%eax),%eax
    1192:	84 c0                	test   %al,%al
    1194:	75 ed                	jne    1183 <strlen+0xf>
    ;
  return n;
    1196:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    1199:	c9                   	leave  
    119a:	c3                   	ret    

0000119b <memset>:

void*
memset(void *dst, int c, uint n)
{
    119b:	55                   	push   %ebp
    119c:	89 e5                	mov    %esp,%ebp
    119e:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
    11a1:	8b 45 10             	mov    0x10(%ebp),%eax
    11a4:	89 44 24 08          	mov    %eax,0x8(%esp)
    11a8:	8b 45 0c             	mov    0xc(%ebp),%eax
    11ab:	89 44 24 04          	mov    %eax,0x4(%esp)
    11af:	8b 45 08             	mov    0x8(%ebp),%eax
    11b2:	89 04 24             	mov    %eax,(%esp)
    11b5:	e8 26 ff ff ff       	call   10e0 <stosb>
  return dst;
    11ba:	8b 45 08             	mov    0x8(%ebp),%eax
}
    11bd:	c9                   	leave  
    11be:	c3                   	ret    

000011bf <strchr>:

char*
strchr(const char *s, char c)
{
    11bf:	55                   	push   %ebp
    11c0:	89 e5                	mov    %esp,%ebp
    11c2:	83 ec 04             	sub    $0x4,%esp
    11c5:	8b 45 0c             	mov    0xc(%ebp),%eax
    11c8:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
    11cb:	eb 14                	jmp    11e1 <strchr+0x22>
    if(*s == c)
    11cd:	8b 45 08             	mov    0x8(%ebp),%eax
    11d0:	0f b6 00             	movzbl (%eax),%eax
    11d3:	3a 45 fc             	cmp    -0x4(%ebp),%al
    11d6:	75 05                	jne    11dd <strchr+0x1e>
      return (char*)s;
    11d8:	8b 45 08             	mov    0x8(%ebp),%eax
    11db:	eb 13                	jmp    11f0 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
    11dd:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    11e1:	8b 45 08             	mov    0x8(%ebp),%eax
    11e4:	0f b6 00             	movzbl (%eax),%eax
    11e7:	84 c0                	test   %al,%al
    11e9:	75 e2                	jne    11cd <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
    11eb:	b8 00 00 00 00       	mov    $0x0,%eax
}
    11f0:	c9                   	leave  
    11f1:	c3                   	ret    

000011f2 <gets>:

char*
gets(char *buf, int max)
{
    11f2:	55                   	push   %ebp
    11f3:	89 e5                	mov    %esp,%ebp
    11f5:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    11f8:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    11ff:	eb 4c                	jmp    124d <gets+0x5b>
    cc = read(0, &c, 1);
    1201:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    1208:	00 
    1209:	8d 45 ef             	lea    -0x11(%ebp),%eax
    120c:	89 44 24 04          	mov    %eax,0x4(%esp)
    1210:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1217:	e8 44 01 00 00       	call   1360 <read>
    121c:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
    121f:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1223:	7f 02                	jg     1227 <gets+0x35>
      break;
    1225:	eb 31                	jmp    1258 <gets+0x66>
    buf[i++] = c;
    1227:	8b 45 f4             	mov    -0xc(%ebp),%eax
    122a:	8d 50 01             	lea    0x1(%eax),%edx
    122d:	89 55 f4             	mov    %edx,-0xc(%ebp)
    1230:	89 c2                	mov    %eax,%edx
    1232:	8b 45 08             	mov    0x8(%ebp),%eax
    1235:	01 c2                	add    %eax,%edx
    1237:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    123b:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
    123d:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    1241:	3c 0a                	cmp    $0xa,%al
    1243:	74 13                	je     1258 <gets+0x66>
    1245:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    1249:	3c 0d                	cmp    $0xd,%al
    124b:	74 0b                	je     1258 <gets+0x66>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    124d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1250:	83 c0 01             	add    $0x1,%eax
    1253:	3b 45 0c             	cmp    0xc(%ebp),%eax
    1256:	7c a9                	jl     1201 <gets+0xf>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    1258:	8b 55 f4             	mov    -0xc(%ebp),%edx
    125b:	8b 45 08             	mov    0x8(%ebp),%eax
    125e:	01 d0                	add    %edx,%eax
    1260:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
    1263:	8b 45 08             	mov    0x8(%ebp),%eax
}
    1266:	c9                   	leave  
    1267:	c3                   	ret    

00001268 <stat>:

int
stat(char *n, struct stat *st)
{
    1268:	55                   	push   %ebp
    1269:	89 e5                	mov    %esp,%ebp
    126b:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    126e:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1275:	00 
    1276:	8b 45 08             	mov    0x8(%ebp),%eax
    1279:	89 04 24             	mov    %eax,(%esp)
    127c:	e8 07 01 00 00       	call   1388 <open>
    1281:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
    1284:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1288:	79 07                	jns    1291 <stat+0x29>
    return -1;
    128a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    128f:	eb 23                	jmp    12b4 <stat+0x4c>
  r = fstat(fd, st);
    1291:	8b 45 0c             	mov    0xc(%ebp),%eax
    1294:	89 44 24 04          	mov    %eax,0x4(%esp)
    1298:	8b 45 f4             	mov    -0xc(%ebp),%eax
    129b:	89 04 24             	mov    %eax,(%esp)
    129e:	e8 fd 00 00 00       	call   13a0 <fstat>
    12a3:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
    12a6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    12a9:	89 04 24             	mov    %eax,(%esp)
    12ac:	e8 bf 00 00 00       	call   1370 <close>
  return r;
    12b1:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
    12b4:	c9                   	leave  
    12b5:	c3                   	ret    

000012b6 <atoi>:

int
atoi(const char *s)
{
    12b6:	55                   	push   %ebp
    12b7:	89 e5                	mov    %esp,%ebp
    12b9:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
    12bc:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
    12c3:	eb 25                	jmp    12ea <atoi+0x34>
    n = n*10 + *s++ - '0';
    12c5:	8b 55 fc             	mov    -0x4(%ebp),%edx
    12c8:	89 d0                	mov    %edx,%eax
    12ca:	c1 e0 02             	shl    $0x2,%eax
    12cd:	01 d0                	add    %edx,%eax
    12cf:	01 c0                	add    %eax,%eax
    12d1:	89 c1                	mov    %eax,%ecx
    12d3:	8b 45 08             	mov    0x8(%ebp),%eax
    12d6:	8d 50 01             	lea    0x1(%eax),%edx
    12d9:	89 55 08             	mov    %edx,0x8(%ebp)
    12dc:	0f b6 00             	movzbl (%eax),%eax
    12df:	0f be c0             	movsbl %al,%eax
    12e2:	01 c8                	add    %ecx,%eax
    12e4:	83 e8 30             	sub    $0x30,%eax
    12e7:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    12ea:	8b 45 08             	mov    0x8(%ebp),%eax
    12ed:	0f b6 00             	movzbl (%eax),%eax
    12f0:	3c 2f                	cmp    $0x2f,%al
    12f2:	7e 0a                	jle    12fe <atoi+0x48>
    12f4:	8b 45 08             	mov    0x8(%ebp),%eax
    12f7:	0f b6 00             	movzbl (%eax),%eax
    12fa:	3c 39                	cmp    $0x39,%al
    12fc:	7e c7                	jle    12c5 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
    12fe:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    1301:	c9                   	leave  
    1302:	c3                   	ret    

00001303 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    1303:	55                   	push   %ebp
    1304:	89 e5                	mov    %esp,%ebp
    1306:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
    1309:	8b 45 08             	mov    0x8(%ebp),%eax
    130c:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
    130f:	8b 45 0c             	mov    0xc(%ebp),%eax
    1312:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
    1315:	eb 17                	jmp    132e <memmove+0x2b>
    *dst++ = *src++;
    1317:	8b 45 fc             	mov    -0x4(%ebp),%eax
    131a:	8d 50 01             	lea    0x1(%eax),%edx
    131d:	89 55 fc             	mov    %edx,-0x4(%ebp)
    1320:	8b 55 f8             	mov    -0x8(%ebp),%edx
    1323:	8d 4a 01             	lea    0x1(%edx),%ecx
    1326:	89 4d f8             	mov    %ecx,-0x8(%ebp)
    1329:	0f b6 12             	movzbl (%edx),%edx
    132c:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    132e:	8b 45 10             	mov    0x10(%ebp),%eax
    1331:	8d 50 ff             	lea    -0x1(%eax),%edx
    1334:	89 55 10             	mov    %edx,0x10(%ebp)
    1337:	85 c0                	test   %eax,%eax
    1339:	7f dc                	jg     1317 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
    133b:	8b 45 08             	mov    0x8(%ebp),%eax
}
    133e:	c9                   	leave  
    133f:	c3                   	ret    

00001340 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    1340:	b8 01 00 00 00       	mov    $0x1,%eax
    1345:	cd 40                	int    $0x40
    1347:	c3                   	ret    

00001348 <exit>:
SYSCALL(exit)
    1348:	b8 02 00 00 00       	mov    $0x2,%eax
    134d:	cd 40                	int    $0x40
    134f:	c3                   	ret    

00001350 <wait>:
SYSCALL(wait)
    1350:	b8 03 00 00 00       	mov    $0x3,%eax
    1355:	cd 40                	int    $0x40
    1357:	c3                   	ret    

00001358 <pipe>:
SYSCALL(pipe)
    1358:	b8 04 00 00 00       	mov    $0x4,%eax
    135d:	cd 40                	int    $0x40
    135f:	c3                   	ret    

00001360 <read>:
SYSCALL(read)
    1360:	b8 05 00 00 00       	mov    $0x5,%eax
    1365:	cd 40                	int    $0x40
    1367:	c3                   	ret    

00001368 <write>:
SYSCALL(write)
    1368:	b8 10 00 00 00       	mov    $0x10,%eax
    136d:	cd 40                	int    $0x40
    136f:	c3                   	ret    

00001370 <close>:
SYSCALL(close)
    1370:	b8 15 00 00 00       	mov    $0x15,%eax
    1375:	cd 40                	int    $0x40
    1377:	c3                   	ret    

00001378 <kill>:
SYSCALL(kill)
    1378:	b8 06 00 00 00       	mov    $0x6,%eax
    137d:	cd 40                	int    $0x40
    137f:	c3                   	ret    

00001380 <exec>:
SYSCALL(exec)
    1380:	b8 07 00 00 00       	mov    $0x7,%eax
    1385:	cd 40                	int    $0x40
    1387:	c3                   	ret    

00001388 <open>:
SYSCALL(open)
    1388:	b8 0f 00 00 00       	mov    $0xf,%eax
    138d:	cd 40                	int    $0x40
    138f:	c3                   	ret    

00001390 <mknod>:
SYSCALL(mknod)
    1390:	b8 11 00 00 00       	mov    $0x11,%eax
    1395:	cd 40                	int    $0x40
    1397:	c3                   	ret    

00001398 <unlink>:
SYSCALL(unlink)
    1398:	b8 12 00 00 00       	mov    $0x12,%eax
    139d:	cd 40                	int    $0x40
    139f:	c3                   	ret    

000013a0 <fstat>:
SYSCALL(fstat)
    13a0:	b8 08 00 00 00       	mov    $0x8,%eax
    13a5:	cd 40                	int    $0x40
    13a7:	c3                   	ret    

000013a8 <link>:
SYSCALL(link)
    13a8:	b8 13 00 00 00       	mov    $0x13,%eax
    13ad:	cd 40                	int    $0x40
    13af:	c3                   	ret    

000013b0 <mkdir>:
SYSCALL(mkdir)
    13b0:	b8 14 00 00 00       	mov    $0x14,%eax
    13b5:	cd 40                	int    $0x40
    13b7:	c3                   	ret    

000013b8 <chdir>:
SYSCALL(chdir)
    13b8:	b8 09 00 00 00       	mov    $0x9,%eax
    13bd:	cd 40                	int    $0x40
    13bf:	c3                   	ret    

000013c0 <dup>:
SYSCALL(dup)
    13c0:	b8 0a 00 00 00       	mov    $0xa,%eax
    13c5:	cd 40                	int    $0x40
    13c7:	c3                   	ret    

000013c8 <getpid>:
SYSCALL(getpid)
    13c8:	b8 0b 00 00 00       	mov    $0xb,%eax
    13cd:	cd 40                	int    $0x40
    13cf:	c3                   	ret    

000013d0 <sbrk>:
SYSCALL(sbrk)
    13d0:	b8 0c 00 00 00       	mov    $0xc,%eax
    13d5:	cd 40                	int    $0x40
    13d7:	c3                   	ret    

000013d8 <sleep>:
SYSCALL(sleep)
    13d8:	b8 0d 00 00 00       	mov    $0xd,%eax
    13dd:	cd 40                	int    $0x40
    13df:	c3                   	ret    

000013e0 <uptime>:
SYSCALL(uptime)
    13e0:	b8 0e 00 00 00       	mov    $0xe,%eax
    13e5:	cd 40                	int    $0x40
    13e7:	c3                   	ret    

000013e8 <clone>:
SYSCALL(clone)
    13e8:	b8 16 00 00 00       	mov    $0x16,%eax
    13ed:	cd 40                	int    $0x40
    13ef:	c3                   	ret    

000013f0 <texit>:
SYSCALL(texit)
    13f0:	b8 17 00 00 00       	mov    $0x17,%eax
    13f5:	cd 40                	int    $0x40
    13f7:	c3                   	ret    

000013f8 <tsleep>:
SYSCALL(tsleep)
    13f8:	b8 18 00 00 00       	mov    $0x18,%eax
    13fd:	cd 40                	int    $0x40
    13ff:	c3                   	ret    

00001400 <twakeup>:
SYSCALL(twakeup)
    1400:	b8 19 00 00 00       	mov    $0x19,%eax
    1405:	cd 40                	int    $0x40
    1407:	c3                   	ret    

00001408 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
    1408:	55                   	push   %ebp
    1409:	89 e5                	mov    %esp,%ebp
    140b:	83 ec 18             	sub    $0x18,%esp
    140e:	8b 45 0c             	mov    0xc(%ebp),%eax
    1411:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
    1414:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    141b:	00 
    141c:	8d 45 f4             	lea    -0xc(%ebp),%eax
    141f:	89 44 24 04          	mov    %eax,0x4(%esp)
    1423:	8b 45 08             	mov    0x8(%ebp),%eax
    1426:	89 04 24             	mov    %eax,(%esp)
    1429:	e8 3a ff ff ff       	call   1368 <write>
}
    142e:	c9                   	leave  
    142f:	c3                   	ret    

00001430 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
    1430:	55                   	push   %ebp
    1431:	89 e5                	mov    %esp,%ebp
    1433:	56                   	push   %esi
    1434:	53                   	push   %ebx
    1435:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    1438:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
    143f:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
    1443:	74 17                	je     145c <printint+0x2c>
    1445:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    1449:	79 11                	jns    145c <printint+0x2c>
    neg = 1;
    144b:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
    1452:	8b 45 0c             	mov    0xc(%ebp),%eax
    1455:	f7 d8                	neg    %eax
    1457:	89 45 ec             	mov    %eax,-0x14(%ebp)
    145a:	eb 06                	jmp    1462 <printint+0x32>
  } else {
    x = xx;
    145c:	8b 45 0c             	mov    0xc(%ebp),%eax
    145f:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
    1462:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
    1469:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    146c:	8d 41 01             	lea    0x1(%ecx),%eax
    146f:	89 45 f4             	mov    %eax,-0xc(%ebp)
    1472:	8b 5d 10             	mov    0x10(%ebp),%ebx
    1475:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1478:	ba 00 00 00 00       	mov    $0x0,%edx
    147d:	f7 f3                	div    %ebx
    147f:	89 d0                	mov    %edx,%eax
    1481:	0f b6 80 cc 21 00 00 	movzbl 0x21cc(%eax),%eax
    1488:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
    148c:	8b 75 10             	mov    0x10(%ebp),%esi
    148f:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1492:	ba 00 00 00 00       	mov    $0x0,%edx
    1497:	f7 f6                	div    %esi
    1499:	89 45 ec             	mov    %eax,-0x14(%ebp)
    149c:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    14a0:	75 c7                	jne    1469 <printint+0x39>
  if(neg)
    14a2:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    14a6:	74 10                	je     14b8 <printint+0x88>
    buf[i++] = '-';
    14a8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    14ab:	8d 50 01             	lea    0x1(%eax),%edx
    14ae:	89 55 f4             	mov    %edx,-0xc(%ebp)
    14b1:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
    14b6:	eb 1f                	jmp    14d7 <printint+0xa7>
    14b8:	eb 1d                	jmp    14d7 <printint+0xa7>
    putc(fd, buf[i]);
    14ba:	8d 55 dc             	lea    -0x24(%ebp),%edx
    14bd:	8b 45 f4             	mov    -0xc(%ebp),%eax
    14c0:	01 d0                	add    %edx,%eax
    14c2:	0f b6 00             	movzbl (%eax),%eax
    14c5:	0f be c0             	movsbl %al,%eax
    14c8:	89 44 24 04          	mov    %eax,0x4(%esp)
    14cc:	8b 45 08             	mov    0x8(%ebp),%eax
    14cf:	89 04 24             	mov    %eax,(%esp)
    14d2:	e8 31 ff ff ff       	call   1408 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    14d7:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    14db:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    14df:	79 d9                	jns    14ba <printint+0x8a>
    putc(fd, buf[i]);
}
    14e1:	83 c4 30             	add    $0x30,%esp
    14e4:	5b                   	pop    %ebx
    14e5:	5e                   	pop    %esi
    14e6:	5d                   	pop    %ebp
    14e7:	c3                   	ret    

000014e8 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    14e8:	55                   	push   %ebp
    14e9:	89 e5                	mov    %esp,%ebp
    14eb:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
    14ee:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
    14f5:	8d 45 0c             	lea    0xc(%ebp),%eax
    14f8:	83 c0 04             	add    $0x4,%eax
    14fb:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
    14fe:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    1505:	e9 7c 01 00 00       	jmp    1686 <printf+0x19e>
    c = fmt[i] & 0xff;
    150a:	8b 55 0c             	mov    0xc(%ebp),%edx
    150d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1510:	01 d0                	add    %edx,%eax
    1512:	0f b6 00             	movzbl (%eax),%eax
    1515:	0f be c0             	movsbl %al,%eax
    1518:	25 ff 00 00 00       	and    $0xff,%eax
    151d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
    1520:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1524:	75 2c                	jne    1552 <printf+0x6a>
      if(c == '%'){
    1526:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    152a:	75 0c                	jne    1538 <printf+0x50>
        state = '%';
    152c:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
    1533:	e9 4a 01 00 00       	jmp    1682 <printf+0x19a>
      } else {
        putc(fd, c);
    1538:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    153b:	0f be c0             	movsbl %al,%eax
    153e:	89 44 24 04          	mov    %eax,0x4(%esp)
    1542:	8b 45 08             	mov    0x8(%ebp),%eax
    1545:	89 04 24             	mov    %eax,(%esp)
    1548:	e8 bb fe ff ff       	call   1408 <putc>
    154d:	e9 30 01 00 00       	jmp    1682 <printf+0x19a>
      }
    } else if(state == '%'){
    1552:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
    1556:	0f 85 26 01 00 00    	jne    1682 <printf+0x19a>
      if(c == 'd'){
    155c:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
    1560:	75 2d                	jne    158f <printf+0xa7>
        printint(fd, *ap, 10, 1);
    1562:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1565:	8b 00                	mov    (%eax),%eax
    1567:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    156e:	00 
    156f:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
    1576:	00 
    1577:	89 44 24 04          	mov    %eax,0x4(%esp)
    157b:	8b 45 08             	mov    0x8(%ebp),%eax
    157e:	89 04 24             	mov    %eax,(%esp)
    1581:	e8 aa fe ff ff       	call   1430 <printint>
        ap++;
    1586:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    158a:	e9 ec 00 00 00       	jmp    167b <printf+0x193>
      } else if(c == 'x' || c == 'p'){
    158f:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
    1593:	74 06                	je     159b <printf+0xb3>
    1595:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
    1599:	75 2d                	jne    15c8 <printf+0xe0>
        printint(fd, *ap, 16, 0);
    159b:	8b 45 e8             	mov    -0x18(%ebp),%eax
    159e:	8b 00                	mov    (%eax),%eax
    15a0:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    15a7:	00 
    15a8:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
    15af:	00 
    15b0:	89 44 24 04          	mov    %eax,0x4(%esp)
    15b4:	8b 45 08             	mov    0x8(%ebp),%eax
    15b7:	89 04 24             	mov    %eax,(%esp)
    15ba:	e8 71 fe ff ff       	call   1430 <printint>
        ap++;
    15bf:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    15c3:	e9 b3 00 00 00       	jmp    167b <printf+0x193>
      } else if(c == 's'){
    15c8:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
    15cc:	75 45                	jne    1613 <printf+0x12b>
        s = (char*)*ap;
    15ce:	8b 45 e8             	mov    -0x18(%ebp),%eax
    15d1:	8b 00                	mov    (%eax),%eax
    15d3:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
    15d6:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
    15da:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    15de:	75 09                	jne    15e9 <printf+0x101>
          s = "(null)";
    15e0:	c7 45 f4 54 1d 00 00 	movl   $0x1d54,-0xc(%ebp)
        while(*s != 0){
    15e7:	eb 1e                	jmp    1607 <printf+0x11f>
    15e9:	eb 1c                	jmp    1607 <printf+0x11f>
          putc(fd, *s);
    15eb:	8b 45 f4             	mov    -0xc(%ebp),%eax
    15ee:	0f b6 00             	movzbl (%eax),%eax
    15f1:	0f be c0             	movsbl %al,%eax
    15f4:	89 44 24 04          	mov    %eax,0x4(%esp)
    15f8:	8b 45 08             	mov    0x8(%ebp),%eax
    15fb:	89 04 24             	mov    %eax,(%esp)
    15fe:	e8 05 fe ff ff       	call   1408 <putc>
          s++;
    1603:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    1607:	8b 45 f4             	mov    -0xc(%ebp),%eax
    160a:	0f b6 00             	movzbl (%eax),%eax
    160d:	84 c0                	test   %al,%al
    160f:	75 da                	jne    15eb <printf+0x103>
    1611:	eb 68                	jmp    167b <printf+0x193>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    1613:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
    1617:	75 1d                	jne    1636 <printf+0x14e>
        putc(fd, *ap);
    1619:	8b 45 e8             	mov    -0x18(%ebp),%eax
    161c:	8b 00                	mov    (%eax),%eax
    161e:	0f be c0             	movsbl %al,%eax
    1621:	89 44 24 04          	mov    %eax,0x4(%esp)
    1625:	8b 45 08             	mov    0x8(%ebp),%eax
    1628:	89 04 24             	mov    %eax,(%esp)
    162b:	e8 d8 fd ff ff       	call   1408 <putc>
        ap++;
    1630:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    1634:	eb 45                	jmp    167b <printf+0x193>
      } else if(c == '%'){
    1636:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    163a:	75 17                	jne    1653 <printf+0x16b>
        putc(fd, c);
    163c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    163f:	0f be c0             	movsbl %al,%eax
    1642:	89 44 24 04          	mov    %eax,0x4(%esp)
    1646:	8b 45 08             	mov    0x8(%ebp),%eax
    1649:	89 04 24             	mov    %eax,(%esp)
    164c:	e8 b7 fd ff ff       	call   1408 <putc>
    1651:	eb 28                	jmp    167b <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
    1653:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
    165a:	00 
    165b:	8b 45 08             	mov    0x8(%ebp),%eax
    165e:	89 04 24             	mov    %eax,(%esp)
    1661:	e8 a2 fd ff ff       	call   1408 <putc>
        putc(fd, c);
    1666:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1669:	0f be c0             	movsbl %al,%eax
    166c:	89 44 24 04          	mov    %eax,0x4(%esp)
    1670:	8b 45 08             	mov    0x8(%ebp),%eax
    1673:	89 04 24             	mov    %eax,(%esp)
    1676:	e8 8d fd ff ff       	call   1408 <putc>
      }
      state = 0;
    167b:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1682:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    1686:	8b 55 0c             	mov    0xc(%ebp),%edx
    1689:	8b 45 f0             	mov    -0x10(%ebp),%eax
    168c:	01 d0                	add    %edx,%eax
    168e:	0f b6 00             	movzbl (%eax),%eax
    1691:	84 c0                	test   %al,%al
    1693:	0f 85 71 fe ff ff    	jne    150a <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    1699:	c9                   	leave  
    169a:	c3                   	ret    
    169b:	90                   	nop

0000169c <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    169c:	55                   	push   %ebp
    169d:	89 e5                	mov    %esp,%ebp
    169f:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
    16a2:	8b 45 08             	mov    0x8(%ebp),%eax
    16a5:	83 e8 08             	sub    $0x8,%eax
    16a8:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    16ab:	a1 ec 21 00 00       	mov    0x21ec,%eax
    16b0:	89 45 fc             	mov    %eax,-0x4(%ebp)
    16b3:	eb 24                	jmp    16d9 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    16b5:	8b 45 fc             	mov    -0x4(%ebp),%eax
    16b8:	8b 00                	mov    (%eax),%eax
    16ba:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    16bd:	77 12                	ja     16d1 <free+0x35>
    16bf:	8b 45 f8             	mov    -0x8(%ebp),%eax
    16c2:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    16c5:	77 24                	ja     16eb <free+0x4f>
    16c7:	8b 45 fc             	mov    -0x4(%ebp),%eax
    16ca:	8b 00                	mov    (%eax),%eax
    16cc:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    16cf:	77 1a                	ja     16eb <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    16d1:	8b 45 fc             	mov    -0x4(%ebp),%eax
    16d4:	8b 00                	mov    (%eax),%eax
    16d6:	89 45 fc             	mov    %eax,-0x4(%ebp)
    16d9:	8b 45 f8             	mov    -0x8(%ebp),%eax
    16dc:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    16df:	76 d4                	jbe    16b5 <free+0x19>
    16e1:	8b 45 fc             	mov    -0x4(%ebp),%eax
    16e4:	8b 00                	mov    (%eax),%eax
    16e6:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    16e9:	76 ca                	jbe    16b5 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    16eb:	8b 45 f8             	mov    -0x8(%ebp),%eax
    16ee:	8b 40 04             	mov    0x4(%eax),%eax
    16f1:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    16f8:	8b 45 f8             	mov    -0x8(%ebp),%eax
    16fb:	01 c2                	add    %eax,%edx
    16fd:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1700:	8b 00                	mov    (%eax),%eax
    1702:	39 c2                	cmp    %eax,%edx
    1704:	75 24                	jne    172a <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
    1706:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1709:	8b 50 04             	mov    0x4(%eax),%edx
    170c:	8b 45 fc             	mov    -0x4(%ebp),%eax
    170f:	8b 00                	mov    (%eax),%eax
    1711:	8b 40 04             	mov    0x4(%eax),%eax
    1714:	01 c2                	add    %eax,%edx
    1716:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1719:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
    171c:	8b 45 fc             	mov    -0x4(%ebp),%eax
    171f:	8b 00                	mov    (%eax),%eax
    1721:	8b 10                	mov    (%eax),%edx
    1723:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1726:	89 10                	mov    %edx,(%eax)
    1728:	eb 0a                	jmp    1734 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
    172a:	8b 45 fc             	mov    -0x4(%ebp),%eax
    172d:	8b 10                	mov    (%eax),%edx
    172f:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1732:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
    1734:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1737:	8b 40 04             	mov    0x4(%eax),%eax
    173a:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    1741:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1744:	01 d0                	add    %edx,%eax
    1746:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    1749:	75 20                	jne    176b <free+0xcf>
    p->s.size += bp->s.size;
    174b:	8b 45 fc             	mov    -0x4(%ebp),%eax
    174e:	8b 50 04             	mov    0x4(%eax),%edx
    1751:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1754:	8b 40 04             	mov    0x4(%eax),%eax
    1757:	01 c2                	add    %eax,%edx
    1759:	8b 45 fc             	mov    -0x4(%ebp),%eax
    175c:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    175f:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1762:	8b 10                	mov    (%eax),%edx
    1764:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1767:	89 10                	mov    %edx,(%eax)
    1769:	eb 08                	jmp    1773 <free+0xd7>
  } else
    p->s.ptr = bp;
    176b:	8b 45 fc             	mov    -0x4(%ebp),%eax
    176e:	8b 55 f8             	mov    -0x8(%ebp),%edx
    1771:	89 10                	mov    %edx,(%eax)
  freep = p;
    1773:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1776:	a3 ec 21 00 00       	mov    %eax,0x21ec
}
    177b:	c9                   	leave  
    177c:	c3                   	ret    

0000177d <morecore>:

static Header*
morecore(uint nu)
{
    177d:	55                   	push   %ebp
    177e:	89 e5                	mov    %esp,%ebp
    1780:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
    1783:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
    178a:	77 07                	ja     1793 <morecore+0x16>
    nu = 4096;
    178c:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
    1793:	8b 45 08             	mov    0x8(%ebp),%eax
    1796:	c1 e0 03             	shl    $0x3,%eax
    1799:	89 04 24             	mov    %eax,(%esp)
    179c:	e8 2f fc ff ff       	call   13d0 <sbrk>
    17a1:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
    17a4:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
    17a8:	75 07                	jne    17b1 <morecore+0x34>
    return 0;
    17aa:	b8 00 00 00 00       	mov    $0x0,%eax
    17af:	eb 22                	jmp    17d3 <morecore+0x56>
  hp = (Header*)p;
    17b1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    17b4:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
    17b7:	8b 45 f0             	mov    -0x10(%ebp),%eax
    17ba:	8b 55 08             	mov    0x8(%ebp),%edx
    17bd:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
    17c0:	8b 45 f0             	mov    -0x10(%ebp),%eax
    17c3:	83 c0 08             	add    $0x8,%eax
    17c6:	89 04 24             	mov    %eax,(%esp)
    17c9:	e8 ce fe ff ff       	call   169c <free>
  return freep;
    17ce:	a1 ec 21 00 00       	mov    0x21ec,%eax
}
    17d3:	c9                   	leave  
    17d4:	c3                   	ret    

000017d5 <malloc>:

void*
malloc(uint nbytes)
{
    17d5:	55                   	push   %ebp
    17d6:	89 e5                	mov    %esp,%ebp
    17d8:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    17db:	8b 45 08             	mov    0x8(%ebp),%eax
    17de:	83 c0 07             	add    $0x7,%eax
    17e1:	c1 e8 03             	shr    $0x3,%eax
    17e4:	83 c0 01             	add    $0x1,%eax
    17e7:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
    17ea:	a1 ec 21 00 00       	mov    0x21ec,%eax
    17ef:	89 45 f0             	mov    %eax,-0x10(%ebp)
    17f2:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    17f6:	75 23                	jne    181b <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
    17f8:	c7 45 f0 e4 21 00 00 	movl   $0x21e4,-0x10(%ebp)
    17ff:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1802:	a3 ec 21 00 00       	mov    %eax,0x21ec
    1807:	a1 ec 21 00 00       	mov    0x21ec,%eax
    180c:	a3 e4 21 00 00       	mov    %eax,0x21e4
    base.s.size = 0;
    1811:	c7 05 e8 21 00 00 00 	movl   $0x0,0x21e8
    1818:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    181b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    181e:	8b 00                	mov    (%eax),%eax
    1820:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
    1823:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1826:	8b 40 04             	mov    0x4(%eax),%eax
    1829:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    182c:	72 4d                	jb     187b <malloc+0xa6>
      if(p->s.size == nunits)
    182e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1831:	8b 40 04             	mov    0x4(%eax),%eax
    1834:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    1837:	75 0c                	jne    1845 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
    1839:	8b 45 f4             	mov    -0xc(%ebp),%eax
    183c:	8b 10                	mov    (%eax),%edx
    183e:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1841:	89 10                	mov    %edx,(%eax)
    1843:	eb 26                	jmp    186b <malloc+0x96>
      else {
        p->s.size -= nunits;
    1845:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1848:	8b 40 04             	mov    0x4(%eax),%eax
    184b:	2b 45 ec             	sub    -0x14(%ebp),%eax
    184e:	89 c2                	mov    %eax,%edx
    1850:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1853:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
    1856:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1859:	8b 40 04             	mov    0x4(%eax),%eax
    185c:	c1 e0 03             	shl    $0x3,%eax
    185f:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
    1862:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1865:	8b 55 ec             	mov    -0x14(%ebp),%edx
    1868:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
    186b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    186e:	a3 ec 21 00 00       	mov    %eax,0x21ec
      return (void*)(p + 1);
    1873:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1876:	83 c0 08             	add    $0x8,%eax
    1879:	eb 38                	jmp    18b3 <malloc+0xde>
    }
    if(p == freep)
    187b:	a1 ec 21 00 00       	mov    0x21ec,%eax
    1880:	39 45 f4             	cmp    %eax,-0xc(%ebp)
    1883:	75 1b                	jne    18a0 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
    1885:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1888:	89 04 24             	mov    %eax,(%esp)
    188b:	e8 ed fe ff ff       	call   177d <morecore>
    1890:	89 45 f4             	mov    %eax,-0xc(%ebp)
    1893:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1897:	75 07                	jne    18a0 <malloc+0xcb>
        return 0;
    1899:	b8 00 00 00 00       	mov    $0x0,%eax
    189e:	eb 13                	jmp    18b3 <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    18a0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    18a3:	89 45 f0             	mov    %eax,-0x10(%ebp)
    18a6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    18a9:	8b 00                	mov    (%eax),%eax
    18ab:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
    18ae:	e9 70 ff ff ff       	jmp    1823 <malloc+0x4e>
}
    18b3:	c9                   	leave  
    18b4:	c3                   	ret    
    18b5:	66 90                	xchg   %ax,%ax
    18b7:	90                   	nop

000018b8 <xchg>:
  asm volatile("sti");
}

static inline uint
xchg(volatile uint *addr, uint newval)
{
    18b8:	55                   	push   %ebp
    18b9:	89 e5                	mov    %esp,%ebp
    18bb:	83 ec 10             	sub    $0x10,%esp
  uint result;
  
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
    18be:	8b 55 08             	mov    0x8(%ebp),%edx
    18c1:	8b 45 0c             	mov    0xc(%ebp),%eax
    18c4:	8b 4d 08             	mov    0x8(%ebp),%ecx
    18c7:	f0 87 02             	lock xchg %eax,(%edx)
    18ca:	89 45 fc             	mov    %eax,-0x4(%ebp)
               "+m" (*addr), "=a" (result) :
               "1" (newval) :
               "cc");
  return result;
    18cd:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    18d0:	c9                   	leave  
    18d1:	c3                   	ret    

000018d2 <lock_init>:
#include "x86.h"
#include "proc.h"

unsigned long rands = 1;

void lock_init(lock_t *lock){
    18d2:	55                   	push   %ebp
    18d3:	89 e5                	mov    %esp,%ebp
    lock->locked = 0;
    18d5:	8b 45 08             	mov    0x8(%ebp),%eax
    18d8:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
    18de:	5d                   	pop    %ebp
    18df:	c3                   	ret    

000018e0 <lock_acquire>:
void lock_acquire(lock_t *lock){
    18e0:	55                   	push   %ebp
    18e1:	89 e5                	mov    %esp,%ebp
    18e3:	83 ec 08             	sub    $0x8,%esp
    while(xchg(&lock->locked,1) != 0);
    18e6:	90                   	nop
    18e7:	8b 45 08             	mov    0x8(%ebp),%eax
    18ea:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
    18f1:	00 
    18f2:	89 04 24             	mov    %eax,(%esp)
    18f5:	e8 be ff ff ff       	call   18b8 <xchg>
    18fa:	85 c0                	test   %eax,%eax
    18fc:	75 e9                	jne    18e7 <lock_acquire+0x7>
}
    18fe:	c9                   	leave  
    18ff:	c3                   	ret    

00001900 <lock_release>:
void lock_release(lock_t *lock){
    1900:	55                   	push   %ebp
    1901:	89 e5                	mov    %esp,%ebp
    1903:	83 ec 08             	sub    $0x8,%esp
    xchg(&lock->locked,0);
    1906:	8b 45 08             	mov    0x8(%ebp),%eax
    1909:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1910:	00 
    1911:	89 04 24             	mov    %eax,(%esp)
    1914:	e8 9f ff ff ff       	call   18b8 <xchg>
}
    1919:	c9                   	leave  
    191a:	c3                   	ret    

0000191b <thread_create>:


void *thread_create(void(*start_routine)(void*), void *arg){
    191b:	55                   	push   %ebp
    191c:	89 e5                	mov    %esp,%ebp
    191e:	83 ec 28             	sub    $0x28,%esp
    int tid;
    void * stack = malloc(2 * 4096);
    1921:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
    1928:	e8 a8 fe ff ff       	call   17d5 <malloc>
    192d:	89 45 f4             	mov    %eax,-0xc(%ebp)
    void *garbage_stack = stack; 
    1930:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1933:	89 45 f0             	mov    %eax,-0x10(%ebp)
   // printf(1,"start routine addr : %d\n",(uint)start_routine);


    if((uint)stack % 4096){
    1936:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1939:	25 ff 0f 00 00       	and    $0xfff,%eax
    193e:	85 c0                	test   %eax,%eax
    1940:	74 14                	je     1956 <thread_create+0x3b>
        stack = stack + (4096 - (uint)stack % 4096);
    1942:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1945:	25 ff 0f 00 00       	and    $0xfff,%eax
    194a:	89 c2                	mov    %eax,%edx
    194c:	b8 00 10 00 00       	mov    $0x1000,%eax
    1951:	29 d0                	sub    %edx,%eax
    1953:	01 45 f4             	add    %eax,-0xc(%ebp)
    }
    if (stack == 0){
    1956:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    195a:	75 1b                	jne    1977 <thread_create+0x5c>

        printf(1,"malloc fail \n");
    195c:	c7 44 24 04 5b 1d 00 	movl   $0x1d5b,0x4(%esp)
    1963:	00 
    1964:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    196b:	e8 78 fb ff ff       	call   14e8 <printf>
        return 0;
    1970:	b8 00 00 00 00       	mov    $0x0,%eax
    1975:	eb 6f                	jmp    19e6 <thread_create+0xcb>
    }

    tid = clone((uint)stack,PSIZE,(uint)start_routine,(int)arg);
    1977:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    197a:	8b 55 08             	mov    0x8(%ebp),%edx
    197d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1980:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
    1984:	89 54 24 08          	mov    %edx,0x8(%esp)
    1988:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
    198f:	00 
    1990:	89 04 24             	mov    %eax,(%esp)
    1993:	e8 50 fa ff ff       	call   13e8 <clone>
    1998:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(tid < 0){
    199b:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    199f:	79 1b                	jns    19bc <thread_create+0xa1>
        printf(1,"clone fails\n");
    19a1:	c7 44 24 04 69 1d 00 	movl   $0x1d69,0x4(%esp)
    19a8:	00 
    19a9:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    19b0:	e8 33 fb ff ff       	call   14e8 <printf>
        return 0;
    19b5:	b8 00 00 00 00       	mov    $0x0,%eax
    19ba:	eb 2a                	jmp    19e6 <thread_create+0xcb>
    }
    if(tid > 0){
    19bc:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    19c0:	7e 05                	jle    19c7 <thread_create+0xac>
        //store threads on thread table
        return garbage_stack;
    19c2:	8b 45 f0             	mov    -0x10(%ebp),%eax
    19c5:	eb 1f                	jmp    19e6 <thread_create+0xcb>
    }
    if(tid == 0){
    19c7:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    19cb:	75 14                	jne    19e1 <thread_create+0xc6>
        printf(1,"tid = 0 return \n");
    19cd:	c7 44 24 04 76 1d 00 	movl   $0x1d76,0x4(%esp)
    19d4:	00 
    19d5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    19dc:	e8 07 fb ff ff       	call   14e8 <printf>
    }
//    wait();
//    free(garbage_stack);

    return 0;
    19e1:	b8 00 00 00 00       	mov    $0x0,%eax
}
    19e6:	c9                   	leave  
    19e7:	c3                   	ret    

000019e8 <random>:

// generate 0 -> max random number exclude max.
int random(int max){
    19e8:	55                   	push   %ebp
    19e9:	89 e5                	mov    %esp,%ebp
    rands = rands * 1664525 + 1013904233;
    19eb:	a1 e0 21 00 00       	mov    0x21e0,%eax
    19f0:	69 c0 0d 66 19 00    	imul   $0x19660d,%eax,%eax
    19f6:	05 69 f3 6e 3c       	add    $0x3c6ef369,%eax
    19fb:	a3 e0 21 00 00       	mov    %eax,0x21e0
    return (int)(rands % max);
    1a00:	a1 e0 21 00 00       	mov    0x21e0,%eax
    1a05:	8b 4d 08             	mov    0x8(%ebp),%ecx
    1a08:	ba 00 00 00 00       	mov    $0x0,%edx
    1a0d:	f7 f1                	div    %ecx
    1a0f:	89 d0                	mov    %edx,%eax
}
    1a11:	5d                   	pop    %ebp
    1a12:	c3                   	ret    
    1a13:	90                   	nop

00001a14 <init_q>:
#include "queue.h"
#include "types.h"
#include "user.h"

void init_q(struct queue *q){
    1a14:	55                   	push   %ebp
    1a15:	89 e5                	mov    %esp,%ebp
    q->size = 0;
    1a17:	8b 45 08             	mov    0x8(%ebp),%eax
    1a1a:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    q->head = 0;
    1a20:	8b 45 08             	mov    0x8(%ebp),%eax
    1a23:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    q->tail = 0;
    1a2a:	8b 45 08             	mov    0x8(%ebp),%eax
    1a2d:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
}
    1a34:	5d                   	pop    %ebp
    1a35:	c3                   	ret    

00001a36 <add_q>:

void add_q(struct queue *q, int v){
    1a36:	55                   	push   %ebp
    1a37:	89 e5                	mov    %esp,%ebp
    1a39:	83 ec 28             	sub    $0x28,%esp
    struct node * n = malloc(sizeof(struct node));
    1a3c:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
    1a43:	e8 8d fd ff ff       	call   17d5 <malloc>
    1a48:	89 45 f4             	mov    %eax,-0xc(%ebp)
    n->next = 0;
    1a4b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1a4e:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    n->value = v;
    1a55:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1a58:	8b 55 0c             	mov    0xc(%ebp),%edx
    1a5b:	89 10                	mov    %edx,(%eax)
    if(q->head == 0){
    1a5d:	8b 45 08             	mov    0x8(%ebp),%eax
    1a60:	8b 40 04             	mov    0x4(%eax),%eax
    1a63:	85 c0                	test   %eax,%eax
    1a65:	75 0b                	jne    1a72 <add_q+0x3c>
        q->head = n;
    1a67:	8b 45 08             	mov    0x8(%ebp),%eax
    1a6a:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1a6d:	89 50 04             	mov    %edx,0x4(%eax)
    1a70:	eb 0c                	jmp    1a7e <add_q+0x48>
    }else{
        q->tail->next = n;
    1a72:	8b 45 08             	mov    0x8(%ebp),%eax
    1a75:	8b 40 08             	mov    0x8(%eax),%eax
    1a78:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1a7b:	89 50 04             	mov    %edx,0x4(%eax)
    }
    q->tail = n;
    1a7e:	8b 45 08             	mov    0x8(%ebp),%eax
    1a81:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1a84:	89 50 08             	mov    %edx,0x8(%eax)
    q->size++;
    1a87:	8b 45 08             	mov    0x8(%ebp),%eax
    1a8a:	8b 00                	mov    (%eax),%eax
    1a8c:	8d 50 01             	lea    0x1(%eax),%edx
    1a8f:	8b 45 08             	mov    0x8(%ebp),%eax
    1a92:	89 10                	mov    %edx,(%eax)
}
    1a94:	c9                   	leave  
    1a95:	c3                   	ret    

00001a96 <empty_q>:

int empty_q(struct queue *q){
    1a96:	55                   	push   %ebp
    1a97:	89 e5                	mov    %esp,%ebp
    if(q->size == 0)
    1a99:	8b 45 08             	mov    0x8(%ebp),%eax
    1a9c:	8b 00                	mov    (%eax),%eax
    1a9e:	85 c0                	test   %eax,%eax
    1aa0:	75 07                	jne    1aa9 <empty_q+0x13>
        return 1;
    1aa2:	b8 01 00 00 00       	mov    $0x1,%eax
    1aa7:	eb 05                	jmp    1aae <empty_q+0x18>
    else
        return 0;
    1aa9:	b8 00 00 00 00       	mov    $0x0,%eax
} 
    1aae:	5d                   	pop    %ebp
    1aaf:	c3                   	ret    

00001ab0 <pop_q>:
int pop_q(struct queue *q){
    1ab0:	55                   	push   %ebp
    1ab1:	89 e5                	mov    %esp,%ebp
    1ab3:	83 ec 28             	sub    $0x28,%esp
    int val;
    struct node *destroy;
    if(!empty_q(q)){
    1ab6:	8b 45 08             	mov    0x8(%ebp),%eax
    1ab9:	89 04 24             	mov    %eax,(%esp)
    1abc:	e8 d5 ff ff ff       	call   1a96 <empty_q>
    1ac1:	85 c0                	test   %eax,%eax
    1ac3:	75 5d                	jne    1b22 <pop_q+0x72>
       val = q->head->value; 
    1ac5:	8b 45 08             	mov    0x8(%ebp),%eax
    1ac8:	8b 40 04             	mov    0x4(%eax),%eax
    1acb:	8b 00                	mov    (%eax),%eax
    1acd:	89 45 f4             	mov    %eax,-0xc(%ebp)
       destroy = q->head;
    1ad0:	8b 45 08             	mov    0x8(%ebp),%eax
    1ad3:	8b 40 04             	mov    0x4(%eax),%eax
    1ad6:	89 45 f0             	mov    %eax,-0x10(%ebp)
       q->head = q->head->next;
    1ad9:	8b 45 08             	mov    0x8(%ebp),%eax
    1adc:	8b 40 04             	mov    0x4(%eax),%eax
    1adf:	8b 50 04             	mov    0x4(%eax),%edx
    1ae2:	8b 45 08             	mov    0x8(%ebp),%eax
    1ae5:	89 50 04             	mov    %edx,0x4(%eax)
       free(destroy);
    1ae8:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1aeb:	89 04 24             	mov    %eax,(%esp)
    1aee:	e8 a9 fb ff ff       	call   169c <free>
       q->size--;
    1af3:	8b 45 08             	mov    0x8(%ebp),%eax
    1af6:	8b 00                	mov    (%eax),%eax
    1af8:	8d 50 ff             	lea    -0x1(%eax),%edx
    1afb:	8b 45 08             	mov    0x8(%ebp),%eax
    1afe:	89 10                	mov    %edx,(%eax)
       if(q->size == 0){
    1b00:	8b 45 08             	mov    0x8(%ebp),%eax
    1b03:	8b 00                	mov    (%eax),%eax
    1b05:	85 c0                	test   %eax,%eax
    1b07:	75 14                	jne    1b1d <pop_q+0x6d>
            q->head = 0;
    1b09:	8b 45 08             	mov    0x8(%ebp),%eax
    1b0c:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
            q->tail = 0;
    1b13:	8b 45 08             	mov    0x8(%ebp),%eax
    1b16:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
       }
       return val;
    1b1d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1b20:	eb 05                	jmp    1b27 <pop_q+0x77>
    }
    return -1;
    1b22:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
    1b27:	c9                   	leave  
    1b28:	c3                   	ret    

00001b29 <dominant>:

void dominant(struct queue* q, int i){
    1b29:	55                   	push   %ebp
    1b2a:	89 e5                	mov    %esp,%ebp
    1b2c:	83 ec 28             	sub    $0x28,%esp
    struct node * n = malloc(sizeof(struct node));
    1b2f:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
    1b36:	e8 9a fc ff ff       	call   17d5 <malloc>
    1b3b:	89 45 f4             	mov    %eax,-0xc(%ebp)
    n->value = i;
    1b3e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1b41:	8b 55 0c             	mov    0xc(%ebp),%edx
    1b44:	89 10                	mov    %edx,(%eax)

    if(q->head == 0){
    1b46:	8b 45 08             	mov    0x8(%ebp),%eax
    1b49:	8b 40 04             	mov    0x4(%eax),%eax
    1b4c:	85 c0                	test   %eax,%eax
    1b4e:	75 14                	jne    1b64 <dominant+0x3b>
        q->head = n;
    1b50:	8b 45 08             	mov    0x8(%ebp),%eax
    1b53:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1b56:	89 50 04             	mov    %edx,0x4(%eax)
        q->tail = n;
    1b59:	8b 45 08             	mov    0x8(%ebp),%eax
    1b5c:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1b5f:	89 50 08             	mov    %edx,0x8(%eax)
    1b62:	eb 15                	jmp    1b79 <dominant+0x50>
    }
    else{
        n->next = q->head;
    1b64:	8b 45 08             	mov    0x8(%ebp),%eax
    1b67:	8b 50 04             	mov    0x4(%eax),%edx
    1b6a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1b6d:	89 50 04             	mov    %edx,0x4(%eax)
        q->head = n;
    1b70:	8b 45 08             	mov    0x8(%ebp),%eax
    1b73:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1b76:	89 50 04             	mov    %edx,0x4(%eax)
    }
    q->size++;
    1b79:	8b 45 08             	mov    0x8(%ebp),%eax
    1b7c:	8b 00                	mov    (%eax),%eax
    1b7e:	8d 50 01             	lea    0x1(%eax),%edx
    1b81:	8b 45 08             	mov    0x8(%ebp),%eax
    1b84:	89 10                	mov    %edx,(%eax)
}
    1b86:	c9                   	leave  
    1b87:	c3                   	ret    

00001b88 <sem_init>:
#include "semaphore.h"
#include "user.h"

// Initializes the semaphore
void sem_init(struct Semaphore* s, int value){
    1b88:	55                   	push   %ebp
    1b89:	89 e5                	mov    %esp,%ebp
    1b8b:	83 ec 18             	sub    $0x18,%esp
    s->val = value;
    1b8e:	8b 45 08             	mov    0x8(%ebp),%eax
    1b91:	8b 55 0c             	mov    0xc(%ebp),%edx
    1b94:	89 10                	mov    %edx,(%eax)
    lock_init(&s->lock);
    1b96:	8b 45 08             	mov    0x8(%ebp),%eax
    1b99:	83 c0 04             	add    $0x4,%eax
    1b9c:	89 04 24             	mov    %eax,(%esp)
    1b9f:	e8 2e fd ff ff       	call   18d2 <lock_init>
    init_q(&s->q);
    1ba4:	8b 45 08             	mov    0x8(%ebp),%eax
    1ba7:	83 c0 08             	add    $0x8,%eax
    1baa:	89 04 24             	mov    %eax,(%esp)
    1bad:	e8 62 fe ff ff       	call   1a14 <init_q>
}
    1bb2:	c9                   	leave  
    1bb3:	c3                   	ret    

00001bb4 <sem_acquire>:

// Decrements the semaphore
void sem_acquire(struct Semaphore* s){
    1bb4:	55                   	push   %ebp
    1bb5:	89 e5                	mov    %esp,%ebp
    1bb7:	83 ec 28             	sub    $0x28,%esp
    lock_acquire(&s->lock);
    1bba:	8b 45 08             	mov    0x8(%ebp),%eax
    1bbd:	83 c0 04             	add    $0x4,%eax
    1bc0:	89 04 24             	mov    %eax,(%esp)
    1bc3:	e8 18 fd ff ff       	call   18e0 <lock_acquire>

    if(s->val == 0){
    1bc8:	8b 45 08             	mov    0x8(%ebp),%eax
    1bcb:	8b 00                	mov    (%eax),%eax
    1bcd:	85 c0                	test   %eax,%eax
    1bcf:	75 32                	jne    1c03 <sem_acquire+0x4f>
        int pid;
        pid = getpid();
    1bd1:	e8 f2 f7 ff ff       	call   13c8 <getpid>
    1bd6:	89 45 f4             	mov    %eax,-0xc(%ebp)
        add_q(&s->q, pid);
    1bd9:	8b 45 08             	mov    0x8(%ebp),%eax
    1bdc:	8d 50 08             	lea    0x8(%eax),%edx
    1bdf:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1be2:	89 44 24 04          	mov    %eax,0x4(%esp)
    1be6:	89 14 24             	mov    %edx,(%esp)
    1be9:	e8 48 fe ff ff       	call   1a36 <add_q>
        lock_release(&s->lock);
    1bee:	8b 45 08             	mov    0x8(%ebp),%eax
    1bf1:	83 c0 04             	add    $0x4,%eax
    1bf4:	89 04 24             	mov    %eax,(%esp)
    1bf7:	e8 04 fd ff ff       	call   1900 <lock_release>
        tsleep();
    1bfc:	e8 f7 f7 ff ff       	call   13f8 <tsleep>
    1c01:	eb 1b                	jmp    1c1e <sem_acquire+0x6a>
    }
    else{
        s->val--;
    1c03:	8b 45 08             	mov    0x8(%ebp),%eax
    1c06:	8b 00                	mov    (%eax),%eax
    1c08:	8d 50 ff             	lea    -0x1(%eax),%edx
    1c0b:	8b 45 08             	mov    0x8(%ebp),%eax
    1c0e:	89 10                	mov    %edx,(%eax)
        lock_release(&s->lock);
    1c10:	8b 45 08             	mov    0x8(%ebp),%eax
    1c13:	83 c0 04             	add    $0x4,%eax
    1c16:	89 04 24             	mov    %eax,(%esp)
    1c19:	e8 e2 fc ff ff       	call   1900 <lock_release>
    }
}
    1c1e:	c9                   	leave  
    1c1f:	c3                   	ret    

00001c20 <sem_signal>:

// Increments the semaphore
void sem_signal(struct Semaphore* s){
    1c20:	55                   	push   %ebp
    1c21:	89 e5                	mov    %esp,%ebp
    1c23:	83 ec 18             	sub    $0x18,%esp
    lock_acquire(&s->lock);
    1c26:	8b 45 08             	mov    0x8(%ebp),%eax
    1c29:	83 c0 04             	add    $0x4,%eax
    1c2c:	89 04 24             	mov    %eax,(%esp)
    1c2f:	e8 ac fc ff ff       	call   18e0 <lock_acquire>

    if(!empty_q(&s->q)){
    1c34:	8b 45 08             	mov    0x8(%ebp),%eax
    1c37:	83 c0 08             	add    $0x8,%eax
    1c3a:	89 04 24             	mov    %eax,(%esp)
    1c3d:	e8 54 fe ff ff       	call   1a96 <empty_q>
    1c42:	85 c0                	test   %eax,%eax
    1c44:	75 18                	jne    1c5e <sem_signal+0x3e>
        twakeup(pop_q(&s->q));
    1c46:	8b 45 08             	mov    0x8(%ebp),%eax
    1c49:	83 c0 08             	add    $0x8,%eax
    1c4c:	89 04 24             	mov    %eax,(%esp)
    1c4f:	e8 5c fe ff ff       	call   1ab0 <pop_q>
    1c54:	89 04 24             	mov    %eax,(%esp)
    1c57:	e8 a4 f7 ff ff       	call   1400 <twakeup>
    1c5c:	eb 0d                	jmp    1c6b <sem_signal+0x4b>
    }
    else{
        s->val++;
    1c5e:	8b 45 08             	mov    0x8(%ebp),%eax
    1c61:	8b 00                	mov    (%eax),%eax
    1c63:	8d 50 01             	lea    0x1(%eax),%edx
    1c66:	8b 45 08             	mov    0x8(%ebp),%eax
    1c69:	89 10                	mov    %edx,(%eax)
    }

    lock_release(&s->lock);
    1c6b:	8b 45 08             	mov    0x8(%ebp),%eax
    1c6e:	83 c0 04             	add    $0x4,%eax
    1c71:	89 04 24             	mov    %eax,(%esp)
    1c74:	e8 87 fc ff ff       	call   1900 <lock_release>
}
    1c79:	c9                   	leave  
    1c7a:	c3                   	ret    

00001c7b <sem_dom_acquire>:

void sem_dom_acquire(struct Semaphore* s){
    1c7b:	55                   	push   %ebp
    1c7c:	89 e5                	mov    %esp,%ebp
    1c7e:	83 ec 18             	sub    $0x18,%esp
    lock_acquire(&s->lock);
    1c81:	8b 45 08             	mov    0x8(%ebp),%eax
    1c84:	83 c0 04             	add    $0x4,%eax
    1c87:	89 04 24             	mov    %eax,(%esp)
    1c8a:	e8 51 fc ff ff       	call   18e0 <lock_acquire>

    if(s->val > 0){
    1c8f:	8b 45 08             	mov    0x8(%ebp),%eax
    1c92:	8b 00                	mov    (%eax),%eax
    1c94:	85 c0                	test   %eax,%eax
    1c96:	7e 1d                	jle    1cb5 <sem_dom_acquire+0x3a>
        s->val--;
    1c98:	8b 45 08             	mov    0x8(%ebp),%eax
    1c9b:	8b 00                	mov    (%eax),%eax
    1c9d:	8d 50 ff             	lea    -0x1(%eax),%edx
    1ca0:	8b 45 08             	mov    0x8(%ebp),%eax
    1ca3:	89 10                	mov    %edx,(%eax)
        lock_release(&s->lock);
    1ca5:	8b 45 08             	mov    0x8(%ebp),%eax
    1ca8:	83 c0 04             	add    $0x4,%eax
    1cab:	89 04 24             	mov    %eax,(%esp)
    1cae:	e8 4d fc ff ff       	call   1900 <lock_release>
        return;
    1cb3:	eb 2a                	jmp    1cdf <sem_dom_acquire+0x64>
    }

    dominant(&s->q,getpid());
    1cb5:	e8 0e f7 ff ff       	call   13c8 <getpid>
    1cba:	8b 55 08             	mov    0x8(%ebp),%edx
    1cbd:	83 c2 08             	add    $0x8,%edx
    1cc0:	89 44 24 04          	mov    %eax,0x4(%esp)
    1cc4:	89 14 24             	mov    %edx,(%esp)
    1cc7:	e8 5d fe ff ff       	call   1b29 <dominant>
    lock_release(&s->lock);
    1ccc:	8b 45 08             	mov    0x8(%ebp),%eax
    1ccf:	83 c0 04             	add    $0x4,%eax
    1cd2:	89 04 24             	mov    %eax,(%esp)
    1cd5:	e8 26 fc ff ff       	call   1900 <lock_release>
    tsleep();
    1cda:	e8 19 f7 ff ff       	call   13f8 <tsleep>
}
    1cdf:	c9                   	leave  
    1ce0:	c3                   	ret    
