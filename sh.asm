
_sh:     file format elf32-i386


Disassembly of section .text:

00001000 <runcmd>:
struct cmd *parsecmd(char*);

// Execute cmd.  Never returns.
void
runcmd(struct cmd *cmd)
{
    1000:	55                   	push   %ebp
    1001:	89 e5                	mov    %esp,%ebp
    1003:	83 ec 38             	sub    $0x38,%esp
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
    1006:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    100a:	75 05                	jne    1011 <runcmd+0x11>
    exit();
    100c:	e8 53 0f 00 00       	call   1f64 <exit>
  
  switch(cmd->type){
    1011:	8b 45 08             	mov    0x8(%ebp),%eax
    1014:	8b 00                	mov    (%eax),%eax
    1016:	83 f8 05             	cmp    $0x5,%eax
    1019:	77 09                	ja     1024 <runcmd+0x24>
    101b:	8b 04 85 2c 29 00 00 	mov    0x292c(,%eax,4),%eax
    1022:	ff e0                	jmp    *%eax
  default:
    panic("runcmd");
    1024:	c7 04 24 00 29 00 00 	movl   $0x2900,(%esp)
    102b:	e8 27 03 00 00       	call   1357 <panic>

  case EXEC:
    ecmd = (struct execcmd*)cmd;
    1030:	8b 45 08             	mov    0x8(%ebp),%eax
    1033:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(ecmd->argv[0] == 0)
    1036:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1039:	8b 40 04             	mov    0x4(%eax),%eax
    103c:	85 c0                	test   %eax,%eax
    103e:	75 05                	jne    1045 <runcmd+0x45>
      exit();
    1040:	e8 1f 0f 00 00       	call   1f64 <exit>
    exec(ecmd->argv[0], ecmd->argv);
    1045:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1048:	8d 50 04             	lea    0x4(%eax),%edx
    104b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    104e:	8b 40 04             	mov    0x4(%eax),%eax
    1051:	89 54 24 04          	mov    %edx,0x4(%esp)
    1055:	89 04 24             	mov    %eax,(%esp)
    1058:	e8 3f 0f 00 00       	call   1f9c <exec>
    printf(2, "exec %s failed\n", ecmd->argv[0]);
    105d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1060:	8b 40 04             	mov    0x4(%eax),%eax
    1063:	89 44 24 08          	mov    %eax,0x8(%esp)
    1067:	c7 44 24 04 07 29 00 	movl   $0x2907,0x4(%esp)
    106e:	00 
    106f:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
    1076:	e8 89 10 00 00       	call   2104 <printf>
    break;
    107b:	e9 86 01 00 00       	jmp    1206 <runcmd+0x206>

  case REDIR:
    rcmd = (struct redircmd*)cmd;
    1080:	8b 45 08             	mov    0x8(%ebp),%eax
    1083:	89 45 f0             	mov    %eax,-0x10(%ebp)
    close(rcmd->fd);
    1086:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1089:	8b 40 14             	mov    0x14(%eax),%eax
    108c:	89 04 24             	mov    %eax,(%esp)
    108f:	e8 f8 0e 00 00       	call   1f8c <close>
    if(open(rcmd->file, rcmd->mode) < 0){
    1094:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1097:	8b 50 10             	mov    0x10(%eax),%edx
    109a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    109d:	8b 40 08             	mov    0x8(%eax),%eax
    10a0:	89 54 24 04          	mov    %edx,0x4(%esp)
    10a4:	89 04 24             	mov    %eax,(%esp)
    10a7:	e8 f8 0e 00 00       	call   1fa4 <open>
    10ac:	85 c0                	test   %eax,%eax
    10ae:	79 23                	jns    10d3 <runcmd+0xd3>
      printf(2, "open %s failed\n", rcmd->file);
    10b0:	8b 45 f0             	mov    -0x10(%ebp),%eax
    10b3:	8b 40 08             	mov    0x8(%eax),%eax
    10b6:	89 44 24 08          	mov    %eax,0x8(%esp)
    10ba:	c7 44 24 04 17 29 00 	movl   $0x2917,0x4(%esp)
    10c1:	00 
    10c2:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
    10c9:	e8 36 10 00 00       	call   2104 <printf>
      exit();
    10ce:	e8 91 0e 00 00       	call   1f64 <exit>
    }
    runcmd(rcmd->cmd);
    10d3:	8b 45 f0             	mov    -0x10(%ebp),%eax
    10d6:	8b 40 04             	mov    0x4(%eax),%eax
    10d9:	89 04 24             	mov    %eax,(%esp)
    10dc:	e8 1f ff ff ff       	call   1000 <runcmd>
    break;
    10e1:	e9 20 01 00 00       	jmp    1206 <runcmd+0x206>

  case LIST:
    lcmd = (struct listcmd*)cmd;
    10e6:	8b 45 08             	mov    0x8(%ebp),%eax
    10e9:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(fork1() == 0)
    10ec:	e8 8c 02 00 00       	call   137d <fork1>
    10f1:	85 c0                	test   %eax,%eax
    10f3:	75 0e                	jne    1103 <runcmd+0x103>
      runcmd(lcmd->left);
    10f5:	8b 45 ec             	mov    -0x14(%ebp),%eax
    10f8:	8b 40 04             	mov    0x4(%eax),%eax
    10fb:	89 04 24             	mov    %eax,(%esp)
    10fe:	e8 fd fe ff ff       	call   1000 <runcmd>
    wait();
    1103:	e8 64 0e 00 00       	call   1f6c <wait>
    runcmd(lcmd->right);
    1108:	8b 45 ec             	mov    -0x14(%ebp),%eax
    110b:	8b 40 08             	mov    0x8(%eax),%eax
    110e:	89 04 24             	mov    %eax,(%esp)
    1111:	e8 ea fe ff ff       	call   1000 <runcmd>
    break;
    1116:	e9 eb 00 00 00       	jmp    1206 <runcmd+0x206>

  case PIPE:
    pcmd = (struct pipecmd*)cmd;
    111b:	8b 45 08             	mov    0x8(%ebp),%eax
    111e:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(pipe(p) < 0)
    1121:	8d 45 dc             	lea    -0x24(%ebp),%eax
    1124:	89 04 24             	mov    %eax,(%esp)
    1127:	e8 48 0e 00 00       	call   1f74 <pipe>
    112c:	85 c0                	test   %eax,%eax
    112e:	79 0c                	jns    113c <runcmd+0x13c>
      panic("pipe");
    1130:	c7 04 24 27 29 00 00 	movl   $0x2927,(%esp)
    1137:	e8 1b 02 00 00       	call   1357 <panic>
    if(fork1() == 0){
    113c:	e8 3c 02 00 00       	call   137d <fork1>
    1141:	85 c0                	test   %eax,%eax
    1143:	75 3b                	jne    1180 <runcmd+0x180>
      close(1);
    1145:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    114c:	e8 3b 0e 00 00       	call   1f8c <close>
      dup(p[1]);
    1151:	8b 45 e0             	mov    -0x20(%ebp),%eax
    1154:	89 04 24             	mov    %eax,(%esp)
    1157:	e8 80 0e 00 00       	call   1fdc <dup>
      close(p[0]);
    115c:	8b 45 dc             	mov    -0x24(%ebp),%eax
    115f:	89 04 24             	mov    %eax,(%esp)
    1162:	e8 25 0e 00 00       	call   1f8c <close>
      close(p[1]);
    1167:	8b 45 e0             	mov    -0x20(%ebp),%eax
    116a:	89 04 24             	mov    %eax,(%esp)
    116d:	e8 1a 0e 00 00       	call   1f8c <close>
      runcmd(pcmd->left);
    1172:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1175:	8b 40 04             	mov    0x4(%eax),%eax
    1178:	89 04 24             	mov    %eax,(%esp)
    117b:	e8 80 fe ff ff       	call   1000 <runcmd>
    }
    if(fork1() == 0){
    1180:	e8 f8 01 00 00       	call   137d <fork1>
    1185:	85 c0                	test   %eax,%eax
    1187:	75 3b                	jne    11c4 <runcmd+0x1c4>
      close(0);
    1189:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1190:	e8 f7 0d 00 00       	call   1f8c <close>
      dup(p[0]);
    1195:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1198:	89 04 24             	mov    %eax,(%esp)
    119b:	e8 3c 0e 00 00       	call   1fdc <dup>
      close(p[0]);
    11a0:	8b 45 dc             	mov    -0x24(%ebp),%eax
    11a3:	89 04 24             	mov    %eax,(%esp)
    11a6:	e8 e1 0d 00 00       	call   1f8c <close>
      close(p[1]);
    11ab:	8b 45 e0             	mov    -0x20(%ebp),%eax
    11ae:	89 04 24             	mov    %eax,(%esp)
    11b1:	e8 d6 0d 00 00       	call   1f8c <close>
      runcmd(pcmd->right);
    11b6:	8b 45 e8             	mov    -0x18(%ebp),%eax
    11b9:	8b 40 08             	mov    0x8(%eax),%eax
    11bc:	89 04 24             	mov    %eax,(%esp)
    11bf:	e8 3c fe ff ff       	call   1000 <runcmd>
    }
    close(p[0]);
    11c4:	8b 45 dc             	mov    -0x24(%ebp),%eax
    11c7:	89 04 24             	mov    %eax,(%esp)
    11ca:	e8 bd 0d 00 00       	call   1f8c <close>
    close(p[1]);
    11cf:	8b 45 e0             	mov    -0x20(%ebp),%eax
    11d2:	89 04 24             	mov    %eax,(%esp)
    11d5:	e8 b2 0d 00 00       	call   1f8c <close>
    wait();
    11da:	e8 8d 0d 00 00       	call   1f6c <wait>
    wait();
    11df:	e8 88 0d 00 00       	call   1f6c <wait>
    break;
    11e4:	eb 20                	jmp    1206 <runcmd+0x206>
    
  case BACK:
    bcmd = (struct backcmd*)cmd;
    11e6:	8b 45 08             	mov    0x8(%ebp),%eax
    11e9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(fork1() == 0)
    11ec:	e8 8c 01 00 00       	call   137d <fork1>
    11f1:	85 c0                	test   %eax,%eax
    11f3:	75 10                	jne    1205 <runcmd+0x205>
      runcmd(bcmd->cmd);
    11f5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    11f8:	8b 40 04             	mov    0x4(%eax),%eax
    11fb:	89 04 24             	mov    %eax,(%esp)
    11fe:	e8 fd fd ff ff       	call   1000 <runcmd>
    break;
    1203:	eb 00                	jmp    1205 <runcmd+0x205>
    1205:	90                   	nop
  }
  exit();
    1206:	e8 59 0d 00 00       	call   1f64 <exit>

0000120b <getcmd>:
}

int
getcmd(char *buf, int nbuf)
{
    120b:	55                   	push   %ebp
    120c:	89 e5                	mov    %esp,%ebp
    120e:	83 ec 18             	sub    $0x18,%esp
  printf(2, "$ ");
    1211:	c7 44 24 04 44 29 00 	movl   $0x2944,0x4(%esp)
    1218:	00 
    1219:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
    1220:	e8 df 0e 00 00       	call   2104 <printf>
  memset(buf, 0, nbuf);
    1225:	8b 45 0c             	mov    0xc(%ebp),%eax
    1228:	89 44 24 08          	mov    %eax,0x8(%esp)
    122c:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1233:	00 
    1234:	8b 45 08             	mov    0x8(%ebp),%eax
    1237:	89 04 24             	mov    %eax,(%esp)
    123a:	e8 78 0b 00 00       	call   1db7 <memset>
  gets(buf, nbuf);
    123f:	8b 45 0c             	mov    0xc(%ebp),%eax
    1242:	89 44 24 04          	mov    %eax,0x4(%esp)
    1246:	8b 45 08             	mov    0x8(%ebp),%eax
    1249:	89 04 24             	mov    %eax,(%esp)
    124c:	e8 bd 0b 00 00       	call   1e0e <gets>
  if(buf[0] == 0) // EOF
    1251:	8b 45 08             	mov    0x8(%ebp),%eax
    1254:	0f b6 00             	movzbl (%eax),%eax
    1257:	84 c0                	test   %al,%al
    1259:	75 07                	jne    1262 <getcmd+0x57>
    return -1;
    125b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    1260:	eb 05                	jmp    1267 <getcmd+0x5c>
  return 0;
    1262:	b8 00 00 00 00       	mov    $0x0,%eax
}
    1267:	c9                   	leave  
    1268:	c3                   	ret    

00001269 <main>:

int
main(void)
{
    1269:	55                   	push   %ebp
    126a:	89 e5                	mov    %esp,%ebp
    126c:	83 e4 f0             	and    $0xfffffff0,%esp
    126f:	83 ec 20             	sub    $0x20,%esp
  static char buf[100];
  int fd;
  
  // Assumes three file descriptors open.
  while((fd = open("console", O_RDWR)) >= 0){
    1272:	eb 15                	jmp    1289 <main+0x20>
    if(fd >= 3){
    1274:	83 7c 24 1c 02       	cmpl   $0x2,0x1c(%esp)
    1279:	7e 0e                	jle    1289 <main+0x20>
      close(fd);
    127b:	8b 44 24 1c          	mov    0x1c(%esp),%eax
    127f:	89 04 24             	mov    %eax,(%esp)
    1282:	e8 05 0d 00 00       	call   1f8c <close>
      break;
    1287:	eb 1f                	jmp    12a8 <main+0x3f>
{
  static char buf[100];
  int fd;
  
  // Assumes three file descriptors open.
  while((fd = open("console", O_RDWR)) >= 0){
    1289:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    1290:	00 
    1291:	c7 04 24 47 29 00 00 	movl   $0x2947,(%esp)
    1298:	e8 07 0d 00 00       	call   1fa4 <open>
    129d:	89 44 24 1c          	mov    %eax,0x1c(%esp)
    12a1:	83 7c 24 1c 00       	cmpl   $0x0,0x1c(%esp)
    12a6:	79 cc                	jns    1274 <main+0xb>
      break;
    }
  }
  
  // Read and run input commands.
  while(getcmd(buf, sizeof(buf)) >= 0){
    12a8:	e9 89 00 00 00       	jmp    1336 <main+0xcd>
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
    12ad:	0f b6 05 c0 30 00 00 	movzbl 0x30c0,%eax
    12b4:	3c 63                	cmp    $0x63,%al
    12b6:	75 5c                	jne    1314 <main+0xab>
    12b8:	0f b6 05 c1 30 00 00 	movzbl 0x30c1,%eax
    12bf:	3c 64                	cmp    $0x64,%al
    12c1:	75 51                	jne    1314 <main+0xab>
    12c3:	0f b6 05 c2 30 00 00 	movzbl 0x30c2,%eax
    12ca:	3c 20                	cmp    $0x20,%al
    12cc:	75 46                	jne    1314 <main+0xab>
      // Clumsy but will have to do for now.
      // Chdir has no effect on the parent if run in the child.
      buf[strlen(buf)-1] = 0;  // chop \n
    12ce:	c7 04 24 c0 30 00 00 	movl   $0x30c0,(%esp)
    12d5:	e8 b6 0a 00 00       	call   1d90 <strlen>
    12da:	83 e8 01             	sub    $0x1,%eax
    12dd:	c6 80 c0 30 00 00 00 	movb   $0x0,0x30c0(%eax)
      if(chdir(buf+3) < 0)
    12e4:	c7 04 24 c3 30 00 00 	movl   $0x30c3,(%esp)
    12eb:	e8 e4 0c 00 00       	call   1fd4 <chdir>
    12f0:	85 c0                	test   %eax,%eax
    12f2:	79 1e                	jns    1312 <main+0xa9>
        printf(2, "cannot cd %s\n", buf+3);
    12f4:	c7 44 24 08 c3 30 00 	movl   $0x30c3,0x8(%esp)
    12fb:	00 
    12fc:	c7 44 24 04 4f 29 00 	movl   $0x294f,0x4(%esp)
    1303:	00 
    1304:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
    130b:	e8 f4 0d 00 00       	call   2104 <printf>
      continue;
    1310:	eb 24                	jmp    1336 <main+0xcd>
    1312:	eb 22                	jmp    1336 <main+0xcd>
    }
    if(fork1() == 0)
    1314:	e8 64 00 00 00       	call   137d <fork1>
    1319:	85 c0                	test   %eax,%eax
    131b:	75 14                	jne    1331 <main+0xc8>
      runcmd(parsecmd(buf));
    131d:	c7 04 24 c0 30 00 00 	movl   $0x30c0,(%esp)
    1324:	e8 c9 03 00 00       	call   16f2 <parsecmd>
    1329:	89 04 24             	mov    %eax,(%esp)
    132c:	e8 cf fc ff ff       	call   1000 <runcmd>
    wait();
    1331:	e8 36 0c 00 00       	call   1f6c <wait>
      break;
    }
  }
  
  // Read and run input commands.
  while(getcmd(buf, sizeof(buf)) >= 0){
    1336:	c7 44 24 04 64 00 00 	movl   $0x64,0x4(%esp)
    133d:	00 
    133e:	c7 04 24 c0 30 00 00 	movl   $0x30c0,(%esp)
    1345:	e8 c1 fe ff ff       	call   120b <getcmd>
    134a:	85 c0                	test   %eax,%eax
    134c:	0f 89 5b ff ff ff    	jns    12ad <main+0x44>
    }
    if(fork1() == 0)
      runcmd(parsecmd(buf));
    wait();
  }
  exit();
    1352:	e8 0d 0c 00 00       	call   1f64 <exit>

00001357 <panic>:
}

void
panic(char *s)
{
    1357:	55                   	push   %ebp
    1358:	89 e5                	mov    %esp,%ebp
    135a:	83 ec 18             	sub    $0x18,%esp
  printf(2, "%s\n", s);
    135d:	8b 45 08             	mov    0x8(%ebp),%eax
    1360:	89 44 24 08          	mov    %eax,0x8(%esp)
    1364:	c7 44 24 04 5d 29 00 	movl   $0x295d,0x4(%esp)
    136b:	00 
    136c:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
    1373:	e8 8c 0d 00 00       	call   2104 <printf>
  exit();
    1378:	e8 e7 0b 00 00       	call   1f64 <exit>

0000137d <fork1>:
}

int
fork1(void)
{
    137d:	55                   	push   %ebp
    137e:	89 e5                	mov    %esp,%ebp
    1380:	83 ec 28             	sub    $0x28,%esp
  int pid;
  
  pid = fork();
    1383:	e8 d4 0b 00 00       	call   1f5c <fork>
    1388:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(pid == -1)
    138b:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
    138f:	75 0c                	jne    139d <fork1+0x20>
    panic("fork");
    1391:	c7 04 24 61 29 00 00 	movl   $0x2961,(%esp)
    1398:	e8 ba ff ff ff       	call   1357 <panic>
  return pid;
    139d:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    13a0:	c9                   	leave  
    13a1:	c3                   	ret    

000013a2 <execcmd>:
//PAGEBREAK!
// Constructors

struct cmd*
execcmd(void)
{
    13a2:	55                   	push   %ebp
    13a3:	89 e5                	mov    %esp,%ebp
    13a5:	83 ec 28             	sub    $0x28,%esp
  struct execcmd *cmd;

  cmd = malloc(sizeof(*cmd));
    13a8:	c7 04 24 54 00 00 00 	movl   $0x54,(%esp)
    13af:	e8 3d 10 00 00       	call   23f1 <malloc>
    13b4:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
    13b7:	c7 44 24 08 54 00 00 	movl   $0x54,0x8(%esp)
    13be:	00 
    13bf:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    13c6:	00 
    13c7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    13ca:	89 04 24             	mov    %eax,(%esp)
    13cd:	e8 e5 09 00 00       	call   1db7 <memset>
  cmd->type = EXEC;
    13d2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    13d5:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  return (struct cmd*)cmd;
    13db:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    13de:	c9                   	leave  
    13df:	c3                   	ret    

000013e0 <redircmd>:

struct cmd*
redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd)
{
    13e0:	55                   	push   %ebp
    13e1:	89 e5                	mov    %esp,%ebp
    13e3:	83 ec 28             	sub    $0x28,%esp
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
    13e6:	c7 04 24 18 00 00 00 	movl   $0x18,(%esp)
    13ed:	e8 ff 0f 00 00       	call   23f1 <malloc>
    13f2:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
    13f5:	c7 44 24 08 18 00 00 	movl   $0x18,0x8(%esp)
    13fc:	00 
    13fd:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1404:	00 
    1405:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1408:	89 04 24             	mov    %eax,(%esp)
    140b:	e8 a7 09 00 00       	call   1db7 <memset>
  cmd->type = REDIR;
    1410:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1413:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
  cmd->cmd = subcmd;
    1419:	8b 45 f4             	mov    -0xc(%ebp),%eax
    141c:	8b 55 08             	mov    0x8(%ebp),%edx
    141f:	89 50 04             	mov    %edx,0x4(%eax)
  cmd->file = file;
    1422:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1425:	8b 55 0c             	mov    0xc(%ebp),%edx
    1428:	89 50 08             	mov    %edx,0x8(%eax)
  cmd->efile = efile;
    142b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    142e:	8b 55 10             	mov    0x10(%ebp),%edx
    1431:	89 50 0c             	mov    %edx,0xc(%eax)
  cmd->mode = mode;
    1434:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1437:	8b 55 14             	mov    0x14(%ebp),%edx
    143a:	89 50 10             	mov    %edx,0x10(%eax)
  cmd->fd = fd;
    143d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1440:	8b 55 18             	mov    0x18(%ebp),%edx
    1443:	89 50 14             	mov    %edx,0x14(%eax)
  return (struct cmd*)cmd;
    1446:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    1449:	c9                   	leave  
    144a:	c3                   	ret    

0000144b <pipecmd>:

struct cmd*
pipecmd(struct cmd *left, struct cmd *right)
{
    144b:	55                   	push   %ebp
    144c:	89 e5                	mov    %esp,%ebp
    144e:	83 ec 28             	sub    $0x28,%esp
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
    1451:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
    1458:	e8 94 0f 00 00       	call   23f1 <malloc>
    145d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
    1460:	c7 44 24 08 0c 00 00 	movl   $0xc,0x8(%esp)
    1467:	00 
    1468:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    146f:	00 
    1470:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1473:	89 04 24             	mov    %eax,(%esp)
    1476:	e8 3c 09 00 00       	call   1db7 <memset>
  cmd->type = PIPE;
    147b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    147e:	c7 00 03 00 00 00    	movl   $0x3,(%eax)
  cmd->left = left;
    1484:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1487:	8b 55 08             	mov    0x8(%ebp),%edx
    148a:	89 50 04             	mov    %edx,0x4(%eax)
  cmd->right = right;
    148d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1490:	8b 55 0c             	mov    0xc(%ebp),%edx
    1493:	89 50 08             	mov    %edx,0x8(%eax)
  return (struct cmd*)cmd;
    1496:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    1499:	c9                   	leave  
    149a:	c3                   	ret    

0000149b <listcmd>:

struct cmd*
listcmd(struct cmd *left, struct cmd *right)
{
    149b:	55                   	push   %ebp
    149c:	89 e5                	mov    %esp,%ebp
    149e:	83 ec 28             	sub    $0x28,%esp
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
    14a1:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
    14a8:	e8 44 0f 00 00       	call   23f1 <malloc>
    14ad:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
    14b0:	c7 44 24 08 0c 00 00 	movl   $0xc,0x8(%esp)
    14b7:	00 
    14b8:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    14bf:	00 
    14c0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    14c3:	89 04 24             	mov    %eax,(%esp)
    14c6:	e8 ec 08 00 00       	call   1db7 <memset>
  cmd->type = LIST;
    14cb:	8b 45 f4             	mov    -0xc(%ebp),%eax
    14ce:	c7 00 04 00 00 00    	movl   $0x4,(%eax)
  cmd->left = left;
    14d4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    14d7:	8b 55 08             	mov    0x8(%ebp),%edx
    14da:	89 50 04             	mov    %edx,0x4(%eax)
  cmd->right = right;
    14dd:	8b 45 f4             	mov    -0xc(%ebp),%eax
    14e0:	8b 55 0c             	mov    0xc(%ebp),%edx
    14e3:	89 50 08             	mov    %edx,0x8(%eax)
  return (struct cmd*)cmd;
    14e6:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    14e9:	c9                   	leave  
    14ea:	c3                   	ret    

000014eb <backcmd>:

struct cmd*
backcmd(struct cmd *subcmd)
{
    14eb:	55                   	push   %ebp
    14ec:	89 e5                	mov    %esp,%ebp
    14ee:	83 ec 28             	sub    $0x28,%esp
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
    14f1:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
    14f8:	e8 f4 0e 00 00       	call   23f1 <malloc>
    14fd:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
    1500:	c7 44 24 08 08 00 00 	movl   $0x8,0x8(%esp)
    1507:	00 
    1508:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    150f:	00 
    1510:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1513:	89 04 24             	mov    %eax,(%esp)
    1516:	e8 9c 08 00 00       	call   1db7 <memset>
  cmd->type = BACK;
    151b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    151e:	c7 00 05 00 00 00    	movl   $0x5,(%eax)
  cmd->cmd = subcmd;
    1524:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1527:	8b 55 08             	mov    0x8(%ebp),%edx
    152a:	89 50 04             	mov    %edx,0x4(%eax)
  return (struct cmd*)cmd;
    152d:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    1530:	c9                   	leave  
    1531:	c3                   	ret    

00001532 <gettoken>:
char whitespace[] = " \t\r\n\v";
char symbols[] = "<|>&;()";

int
gettoken(char **ps, char *es, char **q, char **eq)
{
    1532:	55                   	push   %ebp
    1533:	89 e5                	mov    %esp,%ebp
    1535:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int ret;
  
  s = *ps;
    1538:	8b 45 08             	mov    0x8(%ebp),%eax
    153b:	8b 00                	mov    (%eax),%eax
    153d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  while(s < es && strchr(whitespace, *s))
    1540:	eb 04                	jmp    1546 <gettoken+0x14>
    s++;
    1542:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
{
  char *s;
  int ret;
  
  s = *ps;
  while(s < es && strchr(whitespace, *s))
    1546:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1549:	3b 45 0c             	cmp    0xc(%ebp),%eax
    154c:	73 1d                	jae    156b <gettoken+0x39>
    154e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1551:	0f b6 00             	movzbl (%eax),%eax
    1554:	0f be c0             	movsbl %al,%eax
    1557:	89 44 24 04          	mov    %eax,0x4(%esp)
    155b:	c7 04 24 84 30 00 00 	movl   $0x3084,(%esp)
    1562:	e8 74 08 00 00       	call   1ddb <strchr>
    1567:	85 c0                	test   %eax,%eax
    1569:	75 d7                	jne    1542 <gettoken+0x10>
    s++;
  if(q)
    156b:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
    156f:	74 08                	je     1579 <gettoken+0x47>
    *q = s;
    1571:	8b 45 10             	mov    0x10(%ebp),%eax
    1574:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1577:	89 10                	mov    %edx,(%eax)
  ret = *s;
    1579:	8b 45 f4             	mov    -0xc(%ebp),%eax
    157c:	0f b6 00             	movzbl (%eax),%eax
    157f:	0f be c0             	movsbl %al,%eax
    1582:	89 45 f0             	mov    %eax,-0x10(%ebp)
  switch(*s){
    1585:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1588:	0f b6 00             	movzbl (%eax),%eax
    158b:	0f be c0             	movsbl %al,%eax
    158e:	83 f8 29             	cmp    $0x29,%eax
    1591:	7f 14                	jg     15a7 <gettoken+0x75>
    1593:	83 f8 28             	cmp    $0x28,%eax
    1596:	7d 28                	jge    15c0 <gettoken+0x8e>
    1598:	85 c0                	test   %eax,%eax
    159a:	0f 84 94 00 00 00    	je     1634 <gettoken+0x102>
    15a0:	83 f8 26             	cmp    $0x26,%eax
    15a3:	74 1b                	je     15c0 <gettoken+0x8e>
    15a5:	eb 3c                	jmp    15e3 <gettoken+0xb1>
    15a7:	83 f8 3e             	cmp    $0x3e,%eax
    15aa:	74 1a                	je     15c6 <gettoken+0x94>
    15ac:	83 f8 3e             	cmp    $0x3e,%eax
    15af:	7f 0a                	jg     15bb <gettoken+0x89>
    15b1:	83 e8 3b             	sub    $0x3b,%eax
    15b4:	83 f8 01             	cmp    $0x1,%eax
    15b7:	77 2a                	ja     15e3 <gettoken+0xb1>
    15b9:	eb 05                	jmp    15c0 <gettoken+0x8e>
    15bb:	83 f8 7c             	cmp    $0x7c,%eax
    15be:	75 23                	jne    15e3 <gettoken+0xb1>
  case '(':
  case ')':
  case ';':
  case '&':
  case '<':
    s++;
    15c0:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    break;
    15c4:	eb 6f                	jmp    1635 <gettoken+0x103>
  case '>':
    s++;
    15c6:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    if(*s == '>'){
    15ca:	8b 45 f4             	mov    -0xc(%ebp),%eax
    15cd:	0f b6 00             	movzbl (%eax),%eax
    15d0:	3c 3e                	cmp    $0x3e,%al
    15d2:	75 0d                	jne    15e1 <gettoken+0xaf>
      ret = '+';
    15d4:	c7 45 f0 2b 00 00 00 	movl   $0x2b,-0x10(%ebp)
      s++;
    15db:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    }
    break;
    15df:	eb 54                	jmp    1635 <gettoken+0x103>
    15e1:	eb 52                	jmp    1635 <gettoken+0x103>
  default:
    ret = 'a';
    15e3:	c7 45 f0 61 00 00 00 	movl   $0x61,-0x10(%ebp)
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
    15ea:	eb 04                	jmp    15f0 <gettoken+0xbe>
      s++;
    15ec:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      s++;
    }
    break;
  default:
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
    15f0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    15f3:	3b 45 0c             	cmp    0xc(%ebp),%eax
    15f6:	73 3a                	jae    1632 <gettoken+0x100>
    15f8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    15fb:	0f b6 00             	movzbl (%eax),%eax
    15fe:	0f be c0             	movsbl %al,%eax
    1601:	89 44 24 04          	mov    %eax,0x4(%esp)
    1605:	c7 04 24 84 30 00 00 	movl   $0x3084,(%esp)
    160c:	e8 ca 07 00 00       	call   1ddb <strchr>
    1611:	85 c0                	test   %eax,%eax
    1613:	75 1d                	jne    1632 <gettoken+0x100>
    1615:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1618:	0f b6 00             	movzbl (%eax),%eax
    161b:	0f be c0             	movsbl %al,%eax
    161e:	89 44 24 04          	mov    %eax,0x4(%esp)
    1622:	c7 04 24 8a 30 00 00 	movl   $0x308a,(%esp)
    1629:	e8 ad 07 00 00       	call   1ddb <strchr>
    162e:	85 c0                	test   %eax,%eax
    1630:	74 ba                	je     15ec <gettoken+0xba>
      s++;
    break;
    1632:	eb 01                	jmp    1635 <gettoken+0x103>
  if(q)
    *q = s;
  ret = *s;
  switch(*s){
  case 0:
    break;
    1634:	90                   	nop
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
      s++;
    break;
  }
  if(eq)
    1635:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
    1639:	74 0a                	je     1645 <gettoken+0x113>
    *eq = s;
    163b:	8b 45 14             	mov    0x14(%ebp),%eax
    163e:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1641:	89 10                	mov    %edx,(%eax)
  
  while(s < es && strchr(whitespace, *s))
    1643:	eb 06                	jmp    164b <gettoken+0x119>
    1645:	eb 04                	jmp    164b <gettoken+0x119>
    s++;
    1647:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    break;
  }
  if(eq)
    *eq = s;
  
  while(s < es && strchr(whitespace, *s))
    164b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    164e:	3b 45 0c             	cmp    0xc(%ebp),%eax
    1651:	73 1d                	jae    1670 <gettoken+0x13e>
    1653:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1656:	0f b6 00             	movzbl (%eax),%eax
    1659:	0f be c0             	movsbl %al,%eax
    165c:	89 44 24 04          	mov    %eax,0x4(%esp)
    1660:	c7 04 24 84 30 00 00 	movl   $0x3084,(%esp)
    1667:	e8 6f 07 00 00       	call   1ddb <strchr>
    166c:	85 c0                	test   %eax,%eax
    166e:	75 d7                	jne    1647 <gettoken+0x115>
    s++;
  *ps = s;
    1670:	8b 45 08             	mov    0x8(%ebp),%eax
    1673:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1676:	89 10                	mov    %edx,(%eax)
  return ret;
    1678:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
    167b:	c9                   	leave  
    167c:	c3                   	ret    

0000167d <peek>:

int
peek(char **ps, char *es, char *toks)
{
    167d:	55                   	push   %ebp
    167e:	89 e5                	mov    %esp,%ebp
    1680:	83 ec 28             	sub    $0x28,%esp
  char *s;
  
  s = *ps;
    1683:	8b 45 08             	mov    0x8(%ebp),%eax
    1686:	8b 00                	mov    (%eax),%eax
    1688:	89 45 f4             	mov    %eax,-0xc(%ebp)
  while(s < es && strchr(whitespace, *s))
    168b:	eb 04                	jmp    1691 <peek+0x14>
    s++;
    168d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
peek(char **ps, char *es, char *toks)
{
  char *s;
  
  s = *ps;
  while(s < es && strchr(whitespace, *s))
    1691:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1694:	3b 45 0c             	cmp    0xc(%ebp),%eax
    1697:	73 1d                	jae    16b6 <peek+0x39>
    1699:	8b 45 f4             	mov    -0xc(%ebp),%eax
    169c:	0f b6 00             	movzbl (%eax),%eax
    169f:	0f be c0             	movsbl %al,%eax
    16a2:	89 44 24 04          	mov    %eax,0x4(%esp)
    16a6:	c7 04 24 84 30 00 00 	movl   $0x3084,(%esp)
    16ad:	e8 29 07 00 00       	call   1ddb <strchr>
    16b2:	85 c0                	test   %eax,%eax
    16b4:	75 d7                	jne    168d <peek+0x10>
    s++;
  *ps = s;
    16b6:	8b 45 08             	mov    0x8(%ebp),%eax
    16b9:	8b 55 f4             	mov    -0xc(%ebp),%edx
    16bc:	89 10                	mov    %edx,(%eax)
  return *s && strchr(toks, *s);
    16be:	8b 45 f4             	mov    -0xc(%ebp),%eax
    16c1:	0f b6 00             	movzbl (%eax),%eax
    16c4:	84 c0                	test   %al,%al
    16c6:	74 23                	je     16eb <peek+0x6e>
    16c8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    16cb:	0f b6 00             	movzbl (%eax),%eax
    16ce:	0f be c0             	movsbl %al,%eax
    16d1:	89 44 24 04          	mov    %eax,0x4(%esp)
    16d5:	8b 45 10             	mov    0x10(%ebp),%eax
    16d8:	89 04 24             	mov    %eax,(%esp)
    16db:	e8 fb 06 00 00       	call   1ddb <strchr>
    16e0:	85 c0                	test   %eax,%eax
    16e2:	74 07                	je     16eb <peek+0x6e>
    16e4:	b8 01 00 00 00       	mov    $0x1,%eax
    16e9:	eb 05                	jmp    16f0 <peek+0x73>
    16eb:	b8 00 00 00 00       	mov    $0x0,%eax
}
    16f0:	c9                   	leave  
    16f1:	c3                   	ret    

000016f2 <parsecmd>:
struct cmd *parseexec(char**, char*);
struct cmd *nulterminate(struct cmd*);

struct cmd*
parsecmd(char *s)
{
    16f2:	55                   	push   %ebp
    16f3:	89 e5                	mov    %esp,%ebp
    16f5:	53                   	push   %ebx
    16f6:	83 ec 24             	sub    $0x24,%esp
  char *es;
  struct cmd *cmd;

  es = s + strlen(s);
    16f9:	8b 5d 08             	mov    0x8(%ebp),%ebx
    16fc:	8b 45 08             	mov    0x8(%ebp),%eax
    16ff:	89 04 24             	mov    %eax,(%esp)
    1702:	e8 89 06 00 00       	call   1d90 <strlen>
    1707:	01 d8                	add    %ebx,%eax
    1709:	89 45 f4             	mov    %eax,-0xc(%ebp)
  cmd = parseline(&s, es);
    170c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    170f:	89 44 24 04          	mov    %eax,0x4(%esp)
    1713:	8d 45 08             	lea    0x8(%ebp),%eax
    1716:	89 04 24             	mov    %eax,(%esp)
    1719:	e8 60 00 00 00       	call   177e <parseline>
    171e:	89 45 f0             	mov    %eax,-0x10(%ebp)
  peek(&s, es, "");
    1721:	c7 44 24 08 66 29 00 	movl   $0x2966,0x8(%esp)
    1728:	00 
    1729:	8b 45 f4             	mov    -0xc(%ebp),%eax
    172c:	89 44 24 04          	mov    %eax,0x4(%esp)
    1730:	8d 45 08             	lea    0x8(%ebp),%eax
    1733:	89 04 24             	mov    %eax,(%esp)
    1736:	e8 42 ff ff ff       	call   167d <peek>
  if(s != es){
    173b:	8b 45 08             	mov    0x8(%ebp),%eax
    173e:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    1741:	74 27                	je     176a <parsecmd+0x78>
    printf(2, "leftovers: %s\n", s);
    1743:	8b 45 08             	mov    0x8(%ebp),%eax
    1746:	89 44 24 08          	mov    %eax,0x8(%esp)
    174a:	c7 44 24 04 67 29 00 	movl   $0x2967,0x4(%esp)
    1751:	00 
    1752:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
    1759:	e8 a6 09 00 00       	call   2104 <printf>
    panic("syntax");
    175e:	c7 04 24 76 29 00 00 	movl   $0x2976,(%esp)
    1765:	e8 ed fb ff ff       	call   1357 <panic>
  }
  nulterminate(cmd);
    176a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    176d:	89 04 24             	mov    %eax,(%esp)
    1770:	e8 a3 04 00 00       	call   1c18 <nulterminate>
  return cmd;
    1775:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
    1778:	83 c4 24             	add    $0x24,%esp
    177b:	5b                   	pop    %ebx
    177c:	5d                   	pop    %ebp
    177d:	c3                   	ret    

0000177e <parseline>:

struct cmd*
parseline(char **ps, char *es)
{
    177e:	55                   	push   %ebp
    177f:	89 e5                	mov    %esp,%ebp
    1781:	83 ec 28             	sub    $0x28,%esp
  struct cmd *cmd;

  cmd = parsepipe(ps, es);
    1784:	8b 45 0c             	mov    0xc(%ebp),%eax
    1787:	89 44 24 04          	mov    %eax,0x4(%esp)
    178b:	8b 45 08             	mov    0x8(%ebp),%eax
    178e:	89 04 24             	mov    %eax,(%esp)
    1791:	e8 bc 00 00 00       	call   1852 <parsepipe>
    1796:	89 45 f4             	mov    %eax,-0xc(%ebp)
  while(peek(ps, es, "&")){
    1799:	eb 30                	jmp    17cb <parseline+0x4d>
    gettoken(ps, es, 0, 0);
    179b:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    17a2:	00 
    17a3:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    17aa:	00 
    17ab:	8b 45 0c             	mov    0xc(%ebp),%eax
    17ae:	89 44 24 04          	mov    %eax,0x4(%esp)
    17b2:	8b 45 08             	mov    0x8(%ebp),%eax
    17b5:	89 04 24             	mov    %eax,(%esp)
    17b8:	e8 75 fd ff ff       	call   1532 <gettoken>
    cmd = backcmd(cmd);
    17bd:	8b 45 f4             	mov    -0xc(%ebp),%eax
    17c0:	89 04 24             	mov    %eax,(%esp)
    17c3:	e8 23 fd ff ff       	call   14eb <backcmd>
    17c8:	89 45 f4             	mov    %eax,-0xc(%ebp)
parseline(char **ps, char *es)
{
  struct cmd *cmd;

  cmd = parsepipe(ps, es);
  while(peek(ps, es, "&")){
    17cb:	c7 44 24 08 7d 29 00 	movl   $0x297d,0x8(%esp)
    17d2:	00 
    17d3:	8b 45 0c             	mov    0xc(%ebp),%eax
    17d6:	89 44 24 04          	mov    %eax,0x4(%esp)
    17da:	8b 45 08             	mov    0x8(%ebp),%eax
    17dd:	89 04 24             	mov    %eax,(%esp)
    17e0:	e8 98 fe ff ff       	call   167d <peek>
    17e5:	85 c0                	test   %eax,%eax
    17e7:	75 b2                	jne    179b <parseline+0x1d>
    gettoken(ps, es, 0, 0);
    cmd = backcmd(cmd);
  }
  if(peek(ps, es, ";")){
    17e9:	c7 44 24 08 7f 29 00 	movl   $0x297f,0x8(%esp)
    17f0:	00 
    17f1:	8b 45 0c             	mov    0xc(%ebp),%eax
    17f4:	89 44 24 04          	mov    %eax,0x4(%esp)
    17f8:	8b 45 08             	mov    0x8(%ebp),%eax
    17fb:	89 04 24             	mov    %eax,(%esp)
    17fe:	e8 7a fe ff ff       	call   167d <peek>
    1803:	85 c0                	test   %eax,%eax
    1805:	74 46                	je     184d <parseline+0xcf>
    gettoken(ps, es, 0, 0);
    1807:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    180e:	00 
    180f:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    1816:	00 
    1817:	8b 45 0c             	mov    0xc(%ebp),%eax
    181a:	89 44 24 04          	mov    %eax,0x4(%esp)
    181e:	8b 45 08             	mov    0x8(%ebp),%eax
    1821:	89 04 24             	mov    %eax,(%esp)
    1824:	e8 09 fd ff ff       	call   1532 <gettoken>
    cmd = listcmd(cmd, parseline(ps, es));
    1829:	8b 45 0c             	mov    0xc(%ebp),%eax
    182c:	89 44 24 04          	mov    %eax,0x4(%esp)
    1830:	8b 45 08             	mov    0x8(%ebp),%eax
    1833:	89 04 24             	mov    %eax,(%esp)
    1836:	e8 43 ff ff ff       	call   177e <parseline>
    183b:	89 44 24 04          	mov    %eax,0x4(%esp)
    183f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1842:	89 04 24             	mov    %eax,(%esp)
    1845:	e8 51 fc ff ff       	call   149b <listcmd>
    184a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
  return cmd;
    184d:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    1850:	c9                   	leave  
    1851:	c3                   	ret    

00001852 <parsepipe>:

struct cmd*
parsepipe(char **ps, char *es)
{
    1852:	55                   	push   %ebp
    1853:	89 e5                	mov    %esp,%ebp
    1855:	83 ec 28             	sub    $0x28,%esp
  struct cmd *cmd;

  cmd = parseexec(ps, es);
    1858:	8b 45 0c             	mov    0xc(%ebp),%eax
    185b:	89 44 24 04          	mov    %eax,0x4(%esp)
    185f:	8b 45 08             	mov    0x8(%ebp),%eax
    1862:	89 04 24             	mov    %eax,(%esp)
    1865:	e8 68 02 00 00       	call   1ad2 <parseexec>
    186a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(peek(ps, es, "|")){
    186d:	c7 44 24 08 81 29 00 	movl   $0x2981,0x8(%esp)
    1874:	00 
    1875:	8b 45 0c             	mov    0xc(%ebp),%eax
    1878:	89 44 24 04          	mov    %eax,0x4(%esp)
    187c:	8b 45 08             	mov    0x8(%ebp),%eax
    187f:	89 04 24             	mov    %eax,(%esp)
    1882:	e8 f6 fd ff ff       	call   167d <peek>
    1887:	85 c0                	test   %eax,%eax
    1889:	74 46                	je     18d1 <parsepipe+0x7f>
    gettoken(ps, es, 0, 0);
    188b:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    1892:	00 
    1893:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    189a:	00 
    189b:	8b 45 0c             	mov    0xc(%ebp),%eax
    189e:	89 44 24 04          	mov    %eax,0x4(%esp)
    18a2:	8b 45 08             	mov    0x8(%ebp),%eax
    18a5:	89 04 24             	mov    %eax,(%esp)
    18a8:	e8 85 fc ff ff       	call   1532 <gettoken>
    cmd = pipecmd(cmd, parsepipe(ps, es));
    18ad:	8b 45 0c             	mov    0xc(%ebp),%eax
    18b0:	89 44 24 04          	mov    %eax,0x4(%esp)
    18b4:	8b 45 08             	mov    0x8(%ebp),%eax
    18b7:	89 04 24             	mov    %eax,(%esp)
    18ba:	e8 93 ff ff ff       	call   1852 <parsepipe>
    18bf:	89 44 24 04          	mov    %eax,0x4(%esp)
    18c3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    18c6:	89 04 24             	mov    %eax,(%esp)
    18c9:	e8 7d fb ff ff       	call   144b <pipecmd>
    18ce:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
  return cmd;
    18d1:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    18d4:	c9                   	leave  
    18d5:	c3                   	ret    

000018d6 <parseredirs>:

struct cmd*
parseredirs(struct cmd *cmd, char **ps, char *es)
{
    18d6:	55                   	push   %ebp
    18d7:	89 e5                	mov    %esp,%ebp
    18d9:	83 ec 38             	sub    $0x38,%esp
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
    18dc:	e9 f6 00 00 00       	jmp    19d7 <parseredirs+0x101>
    tok = gettoken(ps, es, 0, 0);
    18e1:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    18e8:	00 
    18e9:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    18f0:	00 
    18f1:	8b 45 10             	mov    0x10(%ebp),%eax
    18f4:	89 44 24 04          	mov    %eax,0x4(%esp)
    18f8:	8b 45 0c             	mov    0xc(%ebp),%eax
    18fb:	89 04 24             	mov    %eax,(%esp)
    18fe:	e8 2f fc ff ff       	call   1532 <gettoken>
    1903:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(gettoken(ps, es, &q, &eq) != 'a')
    1906:	8d 45 ec             	lea    -0x14(%ebp),%eax
    1909:	89 44 24 0c          	mov    %eax,0xc(%esp)
    190d:	8d 45 f0             	lea    -0x10(%ebp),%eax
    1910:	89 44 24 08          	mov    %eax,0x8(%esp)
    1914:	8b 45 10             	mov    0x10(%ebp),%eax
    1917:	89 44 24 04          	mov    %eax,0x4(%esp)
    191b:	8b 45 0c             	mov    0xc(%ebp),%eax
    191e:	89 04 24             	mov    %eax,(%esp)
    1921:	e8 0c fc ff ff       	call   1532 <gettoken>
    1926:	83 f8 61             	cmp    $0x61,%eax
    1929:	74 0c                	je     1937 <parseredirs+0x61>
      panic("missing file for redirection");
    192b:	c7 04 24 83 29 00 00 	movl   $0x2983,(%esp)
    1932:	e8 20 fa ff ff       	call   1357 <panic>
    switch(tok){
    1937:	8b 45 f4             	mov    -0xc(%ebp),%eax
    193a:	83 f8 3c             	cmp    $0x3c,%eax
    193d:	74 0f                	je     194e <parseredirs+0x78>
    193f:	83 f8 3e             	cmp    $0x3e,%eax
    1942:	74 38                	je     197c <parseredirs+0xa6>
    1944:	83 f8 2b             	cmp    $0x2b,%eax
    1947:	74 61                	je     19aa <parseredirs+0xd4>
    1949:	e9 89 00 00 00       	jmp    19d7 <parseredirs+0x101>
    case '<':
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
    194e:	8b 55 ec             	mov    -0x14(%ebp),%edx
    1951:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1954:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
    195b:	00 
    195c:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    1963:	00 
    1964:	89 54 24 08          	mov    %edx,0x8(%esp)
    1968:	89 44 24 04          	mov    %eax,0x4(%esp)
    196c:	8b 45 08             	mov    0x8(%ebp),%eax
    196f:	89 04 24             	mov    %eax,(%esp)
    1972:	e8 69 fa ff ff       	call   13e0 <redircmd>
    1977:	89 45 08             	mov    %eax,0x8(%ebp)
      break;
    197a:	eb 5b                	jmp    19d7 <parseredirs+0x101>
    case '>':
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
    197c:	8b 55 ec             	mov    -0x14(%ebp),%edx
    197f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1982:	c7 44 24 10 01 00 00 	movl   $0x1,0x10(%esp)
    1989:	00 
    198a:	c7 44 24 0c 01 02 00 	movl   $0x201,0xc(%esp)
    1991:	00 
    1992:	89 54 24 08          	mov    %edx,0x8(%esp)
    1996:	89 44 24 04          	mov    %eax,0x4(%esp)
    199a:	8b 45 08             	mov    0x8(%ebp),%eax
    199d:	89 04 24             	mov    %eax,(%esp)
    19a0:	e8 3b fa ff ff       	call   13e0 <redircmd>
    19a5:	89 45 08             	mov    %eax,0x8(%ebp)
      break;
    19a8:	eb 2d                	jmp    19d7 <parseredirs+0x101>
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
    19aa:	8b 55 ec             	mov    -0x14(%ebp),%edx
    19ad:	8b 45 f0             	mov    -0x10(%ebp),%eax
    19b0:	c7 44 24 10 01 00 00 	movl   $0x1,0x10(%esp)
    19b7:	00 
    19b8:	c7 44 24 0c 01 02 00 	movl   $0x201,0xc(%esp)
    19bf:	00 
    19c0:	89 54 24 08          	mov    %edx,0x8(%esp)
    19c4:	89 44 24 04          	mov    %eax,0x4(%esp)
    19c8:	8b 45 08             	mov    0x8(%ebp),%eax
    19cb:	89 04 24             	mov    %eax,(%esp)
    19ce:	e8 0d fa ff ff       	call   13e0 <redircmd>
    19d3:	89 45 08             	mov    %eax,0x8(%ebp)
      break;
    19d6:	90                   	nop
parseredirs(struct cmd *cmd, char **ps, char *es)
{
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
    19d7:	c7 44 24 08 a0 29 00 	movl   $0x29a0,0x8(%esp)
    19de:	00 
    19df:	8b 45 10             	mov    0x10(%ebp),%eax
    19e2:	89 44 24 04          	mov    %eax,0x4(%esp)
    19e6:	8b 45 0c             	mov    0xc(%ebp),%eax
    19e9:	89 04 24             	mov    %eax,(%esp)
    19ec:	e8 8c fc ff ff       	call   167d <peek>
    19f1:	85 c0                	test   %eax,%eax
    19f3:	0f 85 e8 fe ff ff    	jne    18e1 <parseredirs+0xb>
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
      break;
    }
  }
  return cmd;
    19f9:	8b 45 08             	mov    0x8(%ebp),%eax
}
    19fc:	c9                   	leave  
    19fd:	c3                   	ret    

000019fe <parseblock>:

struct cmd*
parseblock(char **ps, char *es)
{
    19fe:	55                   	push   %ebp
    19ff:	89 e5                	mov    %esp,%ebp
    1a01:	83 ec 28             	sub    $0x28,%esp
  struct cmd *cmd;

  if(!peek(ps, es, "("))
    1a04:	c7 44 24 08 a3 29 00 	movl   $0x29a3,0x8(%esp)
    1a0b:	00 
    1a0c:	8b 45 0c             	mov    0xc(%ebp),%eax
    1a0f:	89 44 24 04          	mov    %eax,0x4(%esp)
    1a13:	8b 45 08             	mov    0x8(%ebp),%eax
    1a16:	89 04 24             	mov    %eax,(%esp)
    1a19:	e8 5f fc ff ff       	call   167d <peek>
    1a1e:	85 c0                	test   %eax,%eax
    1a20:	75 0c                	jne    1a2e <parseblock+0x30>
    panic("parseblock");
    1a22:	c7 04 24 a5 29 00 00 	movl   $0x29a5,(%esp)
    1a29:	e8 29 f9 ff ff       	call   1357 <panic>
  gettoken(ps, es, 0, 0);
    1a2e:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    1a35:	00 
    1a36:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    1a3d:	00 
    1a3e:	8b 45 0c             	mov    0xc(%ebp),%eax
    1a41:	89 44 24 04          	mov    %eax,0x4(%esp)
    1a45:	8b 45 08             	mov    0x8(%ebp),%eax
    1a48:	89 04 24             	mov    %eax,(%esp)
    1a4b:	e8 e2 fa ff ff       	call   1532 <gettoken>
  cmd = parseline(ps, es);
    1a50:	8b 45 0c             	mov    0xc(%ebp),%eax
    1a53:	89 44 24 04          	mov    %eax,0x4(%esp)
    1a57:	8b 45 08             	mov    0x8(%ebp),%eax
    1a5a:	89 04 24             	mov    %eax,(%esp)
    1a5d:	e8 1c fd ff ff       	call   177e <parseline>
    1a62:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(!peek(ps, es, ")"))
    1a65:	c7 44 24 08 b0 29 00 	movl   $0x29b0,0x8(%esp)
    1a6c:	00 
    1a6d:	8b 45 0c             	mov    0xc(%ebp),%eax
    1a70:	89 44 24 04          	mov    %eax,0x4(%esp)
    1a74:	8b 45 08             	mov    0x8(%ebp),%eax
    1a77:	89 04 24             	mov    %eax,(%esp)
    1a7a:	e8 fe fb ff ff       	call   167d <peek>
    1a7f:	85 c0                	test   %eax,%eax
    1a81:	75 0c                	jne    1a8f <parseblock+0x91>
    panic("syntax - missing )");
    1a83:	c7 04 24 b2 29 00 00 	movl   $0x29b2,(%esp)
    1a8a:	e8 c8 f8 ff ff       	call   1357 <panic>
  gettoken(ps, es, 0, 0);
    1a8f:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    1a96:	00 
    1a97:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    1a9e:	00 
    1a9f:	8b 45 0c             	mov    0xc(%ebp),%eax
    1aa2:	89 44 24 04          	mov    %eax,0x4(%esp)
    1aa6:	8b 45 08             	mov    0x8(%ebp),%eax
    1aa9:	89 04 24             	mov    %eax,(%esp)
    1aac:	e8 81 fa ff ff       	call   1532 <gettoken>
  cmd = parseredirs(cmd, ps, es);
    1ab1:	8b 45 0c             	mov    0xc(%ebp),%eax
    1ab4:	89 44 24 08          	mov    %eax,0x8(%esp)
    1ab8:	8b 45 08             	mov    0x8(%ebp),%eax
    1abb:	89 44 24 04          	mov    %eax,0x4(%esp)
    1abf:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1ac2:	89 04 24             	mov    %eax,(%esp)
    1ac5:	e8 0c fe ff ff       	call   18d6 <parseredirs>
    1aca:	89 45 f4             	mov    %eax,-0xc(%ebp)
  return cmd;
    1acd:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    1ad0:	c9                   	leave  
    1ad1:	c3                   	ret    

00001ad2 <parseexec>:

struct cmd*
parseexec(char **ps, char *es)
{
    1ad2:	55                   	push   %ebp
    1ad3:	89 e5                	mov    %esp,%ebp
    1ad5:	83 ec 38             	sub    $0x38,%esp
  char *q, *eq;
  int tok, argc;
  struct execcmd *cmd;
  struct cmd *ret;
  
  if(peek(ps, es, "("))
    1ad8:	c7 44 24 08 a3 29 00 	movl   $0x29a3,0x8(%esp)
    1adf:	00 
    1ae0:	8b 45 0c             	mov    0xc(%ebp),%eax
    1ae3:	89 44 24 04          	mov    %eax,0x4(%esp)
    1ae7:	8b 45 08             	mov    0x8(%ebp),%eax
    1aea:	89 04 24             	mov    %eax,(%esp)
    1aed:	e8 8b fb ff ff       	call   167d <peek>
    1af2:	85 c0                	test   %eax,%eax
    1af4:	74 17                	je     1b0d <parseexec+0x3b>
    return parseblock(ps, es);
    1af6:	8b 45 0c             	mov    0xc(%ebp),%eax
    1af9:	89 44 24 04          	mov    %eax,0x4(%esp)
    1afd:	8b 45 08             	mov    0x8(%ebp),%eax
    1b00:	89 04 24             	mov    %eax,(%esp)
    1b03:	e8 f6 fe ff ff       	call   19fe <parseblock>
    1b08:	e9 09 01 00 00       	jmp    1c16 <parseexec+0x144>

  ret = execcmd();
    1b0d:	e8 90 f8 ff ff       	call   13a2 <execcmd>
    1b12:	89 45 f0             	mov    %eax,-0x10(%ebp)
  cmd = (struct execcmd*)ret;
    1b15:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1b18:	89 45 ec             	mov    %eax,-0x14(%ebp)

  argc = 0;
    1b1b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  ret = parseredirs(ret, ps, es);
    1b22:	8b 45 0c             	mov    0xc(%ebp),%eax
    1b25:	89 44 24 08          	mov    %eax,0x8(%esp)
    1b29:	8b 45 08             	mov    0x8(%ebp),%eax
    1b2c:	89 44 24 04          	mov    %eax,0x4(%esp)
    1b30:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1b33:	89 04 24             	mov    %eax,(%esp)
    1b36:	e8 9b fd ff ff       	call   18d6 <parseredirs>
    1b3b:	89 45 f0             	mov    %eax,-0x10(%ebp)
  while(!peek(ps, es, "|)&;")){
    1b3e:	e9 8f 00 00 00       	jmp    1bd2 <parseexec+0x100>
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
    1b43:	8d 45 e0             	lea    -0x20(%ebp),%eax
    1b46:	89 44 24 0c          	mov    %eax,0xc(%esp)
    1b4a:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    1b4d:	89 44 24 08          	mov    %eax,0x8(%esp)
    1b51:	8b 45 0c             	mov    0xc(%ebp),%eax
    1b54:	89 44 24 04          	mov    %eax,0x4(%esp)
    1b58:	8b 45 08             	mov    0x8(%ebp),%eax
    1b5b:	89 04 24             	mov    %eax,(%esp)
    1b5e:	e8 cf f9 ff ff       	call   1532 <gettoken>
    1b63:	89 45 e8             	mov    %eax,-0x18(%ebp)
    1b66:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    1b6a:	75 05                	jne    1b71 <parseexec+0x9f>
      break;
    1b6c:	e9 83 00 00 00       	jmp    1bf4 <parseexec+0x122>
    if(tok != 'a')
    1b71:	83 7d e8 61          	cmpl   $0x61,-0x18(%ebp)
    1b75:	74 0c                	je     1b83 <parseexec+0xb1>
      panic("syntax");
    1b77:	c7 04 24 76 29 00 00 	movl   $0x2976,(%esp)
    1b7e:	e8 d4 f7 ff ff       	call   1357 <panic>
    cmd->argv[argc] = q;
    1b83:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    1b86:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1b89:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1b8c:	89 4c 90 04          	mov    %ecx,0x4(%eax,%edx,4)
    cmd->eargv[argc] = eq;
    1b90:	8b 55 e0             	mov    -0x20(%ebp),%edx
    1b93:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1b96:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    1b99:	83 c1 08             	add    $0x8,%ecx
    1b9c:	89 54 88 0c          	mov    %edx,0xc(%eax,%ecx,4)
    argc++;
    1ba0:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    if(argc >= MAXARGS)
    1ba4:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
    1ba8:	7e 0c                	jle    1bb6 <parseexec+0xe4>
      panic("too many args");
    1baa:	c7 04 24 c5 29 00 00 	movl   $0x29c5,(%esp)
    1bb1:	e8 a1 f7 ff ff       	call   1357 <panic>
    ret = parseredirs(ret, ps, es);
    1bb6:	8b 45 0c             	mov    0xc(%ebp),%eax
    1bb9:	89 44 24 08          	mov    %eax,0x8(%esp)
    1bbd:	8b 45 08             	mov    0x8(%ebp),%eax
    1bc0:	89 44 24 04          	mov    %eax,0x4(%esp)
    1bc4:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1bc7:	89 04 24             	mov    %eax,(%esp)
    1bca:	e8 07 fd ff ff       	call   18d6 <parseredirs>
    1bcf:	89 45 f0             	mov    %eax,-0x10(%ebp)
  ret = execcmd();
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
  while(!peek(ps, es, "|)&;")){
    1bd2:	c7 44 24 08 d3 29 00 	movl   $0x29d3,0x8(%esp)
    1bd9:	00 
    1bda:	8b 45 0c             	mov    0xc(%ebp),%eax
    1bdd:	89 44 24 04          	mov    %eax,0x4(%esp)
    1be1:	8b 45 08             	mov    0x8(%ebp),%eax
    1be4:	89 04 24             	mov    %eax,(%esp)
    1be7:	e8 91 fa ff ff       	call   167d <peek>
    1bec:	85 c0                	test   %eax,%eax
    1bee:	0f 84 4f ff ff ff    	je     1b43 <parseexec+0x71>
    argc++;
    if(argc >= MAXARGS)
      panic("too many args");
    ret = parseredirs(ret, ps, es);
  }
  cmd->argv[argc] = 0;
    1bf4:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1bf7:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1bfa:	c7 44 90 04 00 00 00 	movl   $0x0,0x4(%eax,%edx,4)
    1c01:	00 
  cmd->eargv[argc] = 0;
    1c02:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1c05:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1c08:	83 c2 08             	add    $0x8,%edx
    1c0b:	c7 44 90 0c 00 00 00 	movl   $0x0,0xc(%eax,%edx,4)
    1c12:	00 
  return ret;
    1c13:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
    1c16:	c9                   	leave  
    1c17:	c3                   	ret    

00001c18 <nulterminate>:

// NUL-terminate all the counted strings.
struct cmd*
nulterminate(struct cmd *cmd)
{
    1c18:	55                   	push   %ebp
    1c19:	89 e5                	mov    %esp,%ebp
    1c1b:	83 ec 38             	sub    $0x38,%esp
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
    1c1e:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    1c22:	75 0a                	jne    1c2e <nulterminate+0x16>
    return 0;
    1c24:	b8 00 00 00 00       	mov    $0x0,%eax
    1c29:	e9 c9 00 00 00       	jmp    1cf7 <nulterminate+0xdf>
  
  switch(cmd->type){
    1c2e:	8b 45 08             	mov    0x8(%ebp),%eax
    1c31:	8b 00                	mov    (%eax),%eax
    1c33:	83 f8 05             	cmp    $0x5,%eax
    1c36:	0f 87 b8 00 00 00    	ja     1cf4 <nulterminate+0xdc>
    1c3c:	8b 04 85 d8 29 00 00 	mov    0x29d8(,%eax,4),%eax
    1c43:	ff e0                	jmp    *%eax
  case EXEC:
    ecmd = (struct execcmd*)cmd;
    1c45:	8b 45 08             	mov    0x8(%ebp),%eax
    1c48:	89 45 f0             	mov    %eax,-0x10(%ebp)
    for(i=0; ecmd->argv[i]; i++)
    1c4b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    1c52:	eb 14                	jmp    1c68 <nulterminate+0x50>
      *ecmd->eargv[i] = 0;
    1c54:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1c57:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1c5a:	83 c2 08             	add    $0x8,%edx
    1c5d:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
    1c61:	c6 00 00             	movb   $0x0,(%eax)
    return 0;
  
  switch(cmd->type){
  case EXEC:
    ecmd = (struct execcmd*)cmd;
    for(i=0; ecmd->argv[i]; i++)
    1c64:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    1c68:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1c6b:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1c6e:	8b 44 90 04          	mov    0x4(%eax,%edx,4),%eax
    1c72:	85 c0                	test   %eax,%eax
    1c74:	75 de                	jne    1c54 <nulterminate+0x3c>
      *ecmd->eargv[i] = 0;
    break;
    1c76:	eb 7c                	jmp    1cf4 <nulterminate+0xdc>

  case REDIR:
    rcmd = (struct redircmd*)cmd;
    1c78:	8b 45 08             	mov    0x8(%ebp),%eax
    1c7b:	89 45 ec             	mov    %eax,-0x14(%ebp)
    nulterminate(rcmd->cmd);
    1c7e:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1c81:	8b 40 04             	mov    0x4(%eax),%eax
    1c84:	89 04 24             	mov    %eax,(%esp)
    1c87:	e8 8c ff ff ff       	call   1c18 <nulterminate>
    *rcmd->efile = 0;
    1c8c:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1c8f:	8b 40 0c             	mov    0xc(%eax),%eax
    1c92:	c6 00 00             	movb   $0x0,(%eax)
    break;
    1c95:	eb 5d                	jmp    1cf4 <nulterminate+0xdc>

  case PIPE:
    pcmd = (struct pipecmd*)cmd;
    1c97:	8b 45 08             	mov    0x8(%ebp),%eax
    1c9a:	89 45 e8             	mov    %eax,-0x18(%ebp)
    nulterminate(pcmd->left);
    1c9d:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1ca0:	8b 40 04             	mov    0x4(%eax),%eax
    1ca3:	89 04 24             	mov    %eax,(%esp)
    1ca6:	e8 6d ff ff ff       	call   1c18 <nulterminate>
    nulterminate(pcmd->right);
    1cab:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1cae:	8b 40 08             	mov    0x8(%eax),%eax
    1cb1:	89 04 24             	mov    %eax,(%esp)
    1cb4:	e8 5f ff ff ff       	call   1c18 <nulterminate>
    break;
    1cb9:	eb 39                	jmp    1cf4 <nulterminate+0xdc>
    
  case LIST:
    lcmd = (struct listcmd*)cmd;
    1cbb:	8b 45 08             	mov    0x8(%ebp),%eax
    1cbe:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    nulterminate(lcmd->left);
    1cc1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1cc4:	8b 40 04             	mov    0x4(%eax),%eax
    1cc7:	89 04 24             	mov    %eax,(%esp)
    1cca:	e8 49 ff ff ff       	call   1c18 <nulterminate>
    nulterminate(lcmd->right);
    1ccf:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1cd2:	8b 40 08             	mov    0x8(%eax),%eax
    1cd5:	89 04 24             	mov    %eax,(%esp)
    1cd8:	e8 3b ff ff ff       	call   1c18 <nulterminate>
    break;
    1cdd:	eb 15                	jmp    1cf4 <nulterminate+0xdc>

  case BACK:
    bcmd = (struct backcmd*)cmd;
    1cdf:	8b 45 08             	mov    0x8(%ebp),%eax
    1ce2:	89 45 e0             	mov    %eax,-0x20(%ebp)
    nulterminate(bcmd->cmd);
    1ce5:	8b 45 e0             	mov    -0x20(%ebp),%eax
    1ce8:	8b 40 04             	mov    0x4(%eax),%eax
    1ceb:	89 04 24             	mov    %eax,(%esp)
    1cee:	e8 25 ff ff ff       	call   1c18 <nulterminate>
    break;
    1cf3:	90                   	nop
  }
  return cmd;
    1cf4:	8b 45 08             	mov    0x8(%ebp),%eax
}
    1cf7:	c9                   	leave  
    1cf8:	c3                   	ret    
    1cf9:	66 90                	xchg   %ax,%ax
    1cfb:	90                   	nop

00001cfc <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
    1cfc:	55                   	push   %ebp
    1cfd:	89 e5                	mov    %esp,%ebp
    1cff:	57                   	push   %edi
    1d00:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
    1d01:	8b 4d 08             	mov    0x8(%ebp),%ecx
    1d04:	8b 55 10             	mov    0x10(%ebp),%edx
    1d07:	8b 45 0c             	mov    0xc(%ebp),%eax
    1d0a:	89 cb                	mov    %ecx,%ebx
    1d0c:	89 df                	mov    %ebx,%edi
    1d0e:	89 d1                	mov    %edx,%ecx
    1d10:	fc                   	cld    
    1d11:	f3 aa                	rep stos %al,%es:(%edi)
    1d13:	89 ca                	mov    %ecx,%edx
    1d15:	89 fb                	mov    %edi,%ebx
    1d17:	89 5d 08             	mov    %ebx,0x8(%ebp)
    1d1a:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
    1d1d:	5b                   	pop    %ebx
    1d1e:	5f                   	pop    %edi
    1d1f:	5d                   	pop    %ebp
    1d20:	c3                   	ret    

00001d21 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
    1d21:	55                   	push   %ebp
    1d22:	89 e5                	mov    %esp,%ebp
    1d24:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
    1d27:	8b 45 08             	mov    0x8(%ebp),%eax
    1d2a:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
    1d2d:	90                   	nop
    1d2e:	8b 45 08             	mov    0x8(%ebp),%eax
    1d31:	8d 50 01             	lea    0x1(%eax),%edx
    1d34:	89 55 08             	mov    %edx,0x8(%ebp)
    1d37:	8b 55 0c             	mov    0xc(%ebp),%edx
    1d3a:	8d 4a 01             	lea    0x1(%edx),%ecx
    1d3d:	89 4d 0c             	mov    %ecx,0xc(%ebp)
    1d40:	0f b6 12             	movzbl (%edx),%edx
    1d43:	88 10                	mov    %dl,(%eax)
    1d45:	0f b6 00             	movzbl (%eax),%eax
    1d48:	84 c0                	test   %al,%al
    1d4a:	75 e2                	jne    1d2e <strcpy+0xd>
    ;
  return os;
    1d4c:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    1d4f:	c9                   	leave  
    1d50:	c3                   	ret    

00001d51 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    1d51:	55                   	push   %ebp
    1d52:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
    1d54:	eb 08                	jmp    1d5e <strcmp+0xd>
    p++, q++;
    1d56:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    1d5a:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    1d5e:	8b 45 08             	mov    0x8(%ebp),%eax
    1d61:	0f b6 00             	movzbl (%eax),%eax
    1d64:	84 c0                	test   %al,%al
    1d66:	74 10                	je     1d78 <strcmp+0x27>
    1d68:	8b 45 08             	mov    0x8(%ebp),%eax
    1d6b:	0f b6 10             	movzbl (%eax),%edx
    1d6e:	8b 45 0c             	mov    0xc(%ebp),%eax
    1d71:	0f b6 00             	movzbl (%eax),%eax
    1d74:	38 c2                	cmp    %al,%dl
    1d76:	74 de                	je     1d56 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
    1d78:	8b 45 08             	mov    0x8(%ebp),%eax
    1d7b:	0f b6 00             	movzbl (%eax),%eax
    1d7e:	0f b6 d0             	movzbl %al,%edx
    1d81:	8b 45 0c             	mov    0xc(%ebp),%eax
    1d84:	0f b6 00             	movzbl (%eax),%eax
    1d87:	0f b6 c0             	movzbl %al,%eax
    1d8a:	29 c2                	sub    %eax,%edx
    1d8c:	89 d0                	mov    %edx,%eax
}
    1d8e:	5d                   	pop    %ebp
    1d8f:	c3                   	ret    

00001d90 <strlen>:

uint
strlen(char *s)
{
    1d90:	55                   	push   %ebp
    1d91:	89 e5                	mov    %esp,%ebp
    1d93:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
    1d96:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    1d9d:	eb 04                	jmp    1da3 <strlen+0x13>
    1d9f:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    1da3:	8b 55 fc             	mov    -0x4(%ebp),%edx
    1da6:	8b 45 08             	mov    0x8(%ebp),%eax
    1da9:	01 d0                	add    %edx,%eax
    1dab:	0f b6 00             	movzbl (%eax),%eax
    1dae:	84 c0                	test   %al,%al
    1db0:	75 ed                	jne    1d9f <strlen+0xf>
    ;
  return n;
    1db2:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    1db5:	c9                   	leave  
    1db6:	c3                   	ret    

00001db7 <memset>:

void*
memset(void *dst, int c, uint n)
{
    1db7:	55                   	push   %ebp
    1db8:	89 e5                	mov    %esp,%ebp
    1dba:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
    1dbd:	8b 45 10             	mov    0x10(%ebp),%eax
    1dc0:	89 44 24 08          	mov    %eax,0x8(%esp)
    1dc4:	8b 45 0c             	mov    0xc(%ebp),%eax
    1dc7:	89 44 24 04          	mov    %eax,0x4(%esp)
    1dcb:	8b 45 08             	mov    0x8(%ebp),%eax
    1dce:	89 04 24             	mov    %eax,(%esp)
    1dd1:	e8 26 ff ff ff       	call   1cfc <stosb>
  return dst;
    1dd6:	8b 45 08             	mov    0x8(%ebp),%eax
}
    1dd9:	c9                   	leave  
    1dda:	c3                   	ret    

00001ddb <strchr>:

char*
strchr(const char *s, char c)
{
    1ddb:	55                   	push   %ebp
    1ddc:	89 e5                	mov    %esp,%ebp
    1dde:	83 ec 04             	sub    $0x4,%esp
    1de1:	8b 45 0c             	mov    0xc(%ebp),%eax
    1de4:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
    1de7:	eb 14                	jmp    1dfd <strchr+0x22>
    if(*s == c)
    1de9:	8b 45 08             	mov    0x8(%ebp),%eax
    1dec:	0f b6 00             	movzbl (%eax),%eax
    1def:	3a 45 fc             	cmp    -0x4(%ebp),%al
    1df2:	75 05                	jne    1df9 <strchr+0x1e>
      return (char*)s;
    1df4:	8b 45 08             	mov    0x8(%ebp),%eax
    1df7:	eb 13                	jmp    1e0c <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
    1df9:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    1dfd:	8b 45 08             	mov    0x8(%ebp),%eax
    1e00:	0f b6 00             	movzbl (%eax),%eax
    1e03:	84 c0                	test   %al,%al
    1e05:	75 e2                	jne    1de9 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
    1e07:	b8 00 00 00 00       	mov    $0x0,%eax
}
    1e0c:	c9                   	leave  
    1e0d:	c3                   	ret    

00001e0e <gets>:

char*
gets(char *buf, int max)
{
    1e0e:	55                   	push   %ebp
    1e0f:	89 e5                	mov    %esp,%ebp
    1e11:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1e14:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    1e1b:	eb 4c                	jmp    1e69 <gets+0x5b>
    cc = read(0, &c, 1);
    1e1d:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    1e24:	00 
    1e25:	8d 45 ef             	lea    -0x11(%ebp),%eax
    1e28:	89 44 24 04          	mov    %eax,0x4(%esp)
    1e2c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1e33:	e8 44 01 00 00       	call   1f7c <read>
    1e38:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
    1e3b:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1e3f:	7f 02                	jg     1e43 <gets+0x35>
      break;
    1e41:	eb 31                	jmp    1e74 <gets+0x66>
    buf[i++] = c;
    1e43:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1e46:	8d 50 01             	lea    0x1(%eax),%edx
    1e49:	89 55 f4             	mov    %edx,-0xc(%ebp)
    1e4c:	89 c2                	mov    %eax,%edx
    1e4e:	8b 45 08             	mov    0x8(%ebp),%eax
    1e51:	01 c2                	add    %eax,%edx
    1e53:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    1e57:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
    1e59:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    1e5d:	3c 0a                	cmp    $0xa,%al
    1e5f:	74 13                	je     1e74 <gets+0x66>
    1e61:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    1e65:	3c 0d                	cmp    $0xd,%al
    1e67:	74 0b                	je     1e74 <gets+0x66>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1e69:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1e6c:	83 c0 01             	add    $0x1,%eax
    1e6f:	3b 45 0c             	cmp    0xc(%ebp),%eax
    1e72:	7c a9                	jl     1e1d <gets+0xf>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    1e74:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1e77:	8b 45 08             	mov    0x8(%ebp),%eax
    1e7a:	01 d0                	add    %edx,%eax
    1e7c:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
    1e7f:	8b 45 08             	mov    0x8(%ebp),%eax
}
    1e82:	c9                   	leave  
    1e83:	c3                   	ret    

00001e84 <stat>:

int
stat(char *n, struct stat *st)
{
    1e84:	55                   	push   %ebp
    1e85:	89 e5                	mov    %esp,%ebp
    1e87:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    1e8a:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1e91:	00 
    1e92:	8b 45 08             	mov    0x8(%ebp),%eax
    1e95:	89 04 24             	mov    %eax,(%esp)
    1e98:	e8 07 01 00 00       	call   1fa4 <open>
    1e9d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
    1ea0:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1ea4:	79 07                	jns    1ead <stat+0x29>
    return -1;
    1ea6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    1eab:	eb 23                	jmp    1ed0 <stat+0x4c>
  r = fstat(fd, st);
    1ead:	8b 45 0c             	mov    0xc(%ebp),%eax
    1eb0:	89 44 24 04          	mov    %eax,0x4(%esp)
    1eb4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1eb7:	89 04 24             	mov    %eax,(%esp)
    1eba:	e8 fd 00 00 00       	call   1fbc <fstat>
    1ebf:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
    1ec2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1ec5:	89 04 24             	mov    %eax,(%esp)
    1ec8:	e8 bf 00 00 00       	call   1f8c <close>
  return r;
    1ecd:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
    1ed0:	c9                   	leave  
    1ed1:	c3                   	ret    

00001ed2 <atoi>:

int
atoi(const char *s)
{
    1ed2:	55                   	push   %ebp
    1ed3:	89 e5                	mov    %esp,%ebp
    1ed5:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
    1ed8:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
    1edf:	eb 25                	jmp    1f06 <atoi+0x34>
    n = n*10 + *s++ - '0';
    1ee1:	8b 55 fc             	mov    -0x4(%ebp),%edx
    1ee4:	89 d0                	mov    %edx,%eax
    1ee6:	c1 e0 02             	shl    $0x2,%eax
    1ee9:	01 d0                	add    %edx,%eax
    1eeb:	01 c0                	add    %eax,%eax
    1eed:	89 c1                	mov    %eax,%ecx
    1eef:	8b 45 08             	mov    0x8(%ebp),%eax
    1ef2:	8d 50 01             	lea    0x1(%eax),%edx
    1ef5:	89 55 08             	mov    %edx,0x8(%ebp)
    1ef8:	0f b6 00             	movzbl (%eax),%eax
    1efb:	0f be c0             	movsbl %al,%eax
    1efe:	01 c8                	add    %ecx,%eax
    1f00:	83 e8 30             	sub    $0x30,%eax
    1f03:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    1f06:	8b 45 08             	mov    0x8(%ebp),%eax
    1f09:	0f b6 00             	movzbl (%eax),%eax
    1f0c:	3c 2f                	cmp    $0x2f,%al
    1f0e:	7e 0a                	jle    1f1a <atoi+0x48>
    1f10:	8b 45 08             	mov    0x8(%ebp),%eax
    1f13:	0f b6 00             	movzbl (%eax),%eax
    1f16:	3c 39                	cmp    $0x39,%al
    1f18:	7e c7                	jle    1ee1 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
    1f1a:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    1f1d:	c9                   	leave  
    1f1e:	c3                   	ret    

00001f1f <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    1f1f:	55                   	push   %ebp
    1f20:	89 e5                	mov    %esp,%ebp
    1f22:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
    1f25:	8b 45 08             	mov    0x8(%ebp),%eax
    1f28:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
    1f2b:	8b 45 0c             	mov    0xc(%ebp),%eax
    1f2e:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
    1f31:	eb 17                	jmp    1f4a <memmove+0x2b>
    *dst++ = *src++;
    1f33:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1f36:	8d 50 01             	lea    0x1(%eax),%edx
    1f39:	89 55 fc             	mov    %edx,-0x4(%ebp)
    1f3c:	8b 55 f8             	mov    -0x8(%ebp),%edx
    1f3f:	8d 4a 01             	lea    0x1(%edx),%ecx
    1f42:	89 4d f8             	mov    %ecx,-0x8(%ebp)
    1f45:	0f b6 12             	movzbl (%edx),%edx
    1f48:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    1f4a:	8b 45 10             	mov    0x10(%ebp),%eax
    1f4d:	8d 50 ff             	lea    -0x1(%eax),%edx
    1f50:	89 55 10             	mov    %edx,0x10(%ebp)
    1f53:	85 c0                	test   %eax,%eax
    1f55:	7f dc                	jg     1f33 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
    1f57:	8b 45 08             	mov    0x8(%ebp),%eax
}
    1f5a:	c9                   	leave  
    1f5b:	c3                   	ret    

00001f5c <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    1f5c:	b8 01 00 00 00       	mov    $0x1,%eax
    1f61:	cd 40                	int    $0x40
    1f63:	c3                   	ret    

00001f64 <exit>:
SYSCALL(exit)
    1f64:	b8 02 00 00 00       	mov    $0x2,%eax
    1f69:	cd 40                	int    $0x40
    1f6b:	c3                   	ret    

00001f6c <wait>:
SYSCALL(wait)
    1f6c:	b8 03 00 00 00       	mov    $0x3,%eax
    1f71:	cd 40                	int    $0x40
    1f73:	c3                   	ret    

00001f74 <pipe>:
SYSCALL(pipe)
    1f74:	b8 04 00 00 00       	mov    $0x4,%eax
    1f79:	cd 40                	int    $0x40
    1f7b:	c3                   	ret    

00001f7c <read>:
SYSCALL(read)
    1f7c:	b8 05 00 00 00       	mov    $0x5,%eax
    1f81:	cd 40                	int    $0x40
    1f83:	c3                   	ret    

00001f84 <write>:
SYSCALL(write)
    1f84:	b8 10 00 00 00       	mov    $0x10,%eax
    1f89:	cd 40                	int    $0x40
    1f8b:	c3                   	ret    

00001f8c <close>:
SYSCALL(close)
    1f8c:	b8 15 00 00 00       	mov    $0x15,%eax
    1f91:	cd 40                	int    $0x40
    1f93:	c3                   	ret    

00001f94 <kill>:
SYSCALL(kill)
    1f94:	b8 06 00 00 00       	mov    $0x6,%eax
    1f99:	cd 40                	int    $0x40
    1f9b:	c3                   	ret    

00001f9c <exec>:
SYSCALL(exec)
    1f9c:	b8 07 00 00 00       	mov    $0x7,%eax
    1fa1:	cd 40                	int    $0x40
    1fa3:	c3                   	ret    

00001fa4 <open>:
SYSCALL(open)
    1fa4:	b8 0f 00 00 00       	mov    $0xf,%eax
    1fa9:	cd 40                	int    $0x40
    1fab:	c3                   	ret    

00001fac <mknod>:
SYSCALL(mknod)
    1fac:	b8 11 00 00 00       	mov    $0x11,%eax
    1fb1:	cd 40                	int    $0x40
    1fb3:	c3                   	ret    

00001fb4 <unlink>:
SYSCALL(unlink)
    1fb4:	b8 12 00 00 00       	mov    $0x12,%eax
    1fb9:	cd 40                	int    $0x40
    1fbb:	c3                   	ret    

00001fbc <fstat>:
SYSCALL(fstat)
    1fbc:	b8 08 00 00 00       	mov    $0x8,%eax
    1fc1:	cd 40                	int    $0x40
    1fc3:	c3                   	ret    

00001fc4 <link>:
SYSCALL(link)
    1fc4:	b8 13 00 00 00       	mov    $0x13,%eax
    1fc9:	cd 40                	int    $0x40
    1fcb:	c3                   	ret    

00001fcc <mkdir>:
SYSCALL(mkdir)
    1fcc:	b8 14 00 00 00       	mov    $0x14,%eax
    1fd1:	cd 40                	int    $0x40
    1fd3:	c3                   	ret    

00001fd4 <chdir>:
SYSCALL(chdir)
    1fd4:	b8 09 00 00 00       	mov    $0x9,%eax
    1fd9:	cd 40                	int    $0x40
    1fdb:	c3                   	ret    

00001fdc <dup>:
SYSCALL(dup)
    1fdc:	b8 0a 00 00 00       	mov    $0xa,%eax
    1fe1:	cd 40                	int    $0x40
    1fe3:	c3                   	ret    

00001fe4 <getpid>:
SYSCALL(getpid)
    1fe4:	b8 0b 00 00 00       	mov    $0xb,%eax
    1fe9:	cd 40                	int    $0x40
    1feb:	c3                   	ret    

00001fec <sbrk>:
SYSCALL(sbrk)
    1fec:	b8 0c 00 00 00       	mov    $0xc,%eax
    1ff1:	cd 40                	int    $0x40
    1ff3:	c3                   	ret    

00001ff4 <sleep>:
SYSCALL(sleep)
    1ff4:	b8 0d 00 00 00       	mov    $0xd,%eax
    1ff9:	cd 40                	int    $0x40
    1ffb:	c3                   	ret    

00001ffc <uptime>:
SYSCALL(uptime)
    1ffc:	b8 0e 00 00 00       	mov    $0xe,%eax
    2001:	cd 40                	int    $0x40
    2003:	c3                   	ret    

00002004 <clone>:
SYSCALL(clone)
    2004:	b8 16 00 00 00       	mov    $0x16,%eax
    2009:	cd 40                	int    $0x40
    200b:	c3                   	ret    

0000200c <texit>:
SYSCALL(texit)
    200c:	b8 17 00 00 00       	mov    $0x17,%eax
    2011:	cd 40                	int    $0x40
    2013:	c3                   	ret    

00002014 <tsleep>:
SYSCALL(tsleep)
    2014:	b8 18 00 00 00       	mov    $0x18,%eax
    2019:	cd 40                	int    $0x40
    201b:	c3                   	ret    

0000201c <twakeup>:
SYSCALL(twakeup)
    201c:	b8 19 00 00 00       	mov    $0x19,%eax
    2021:	cd 40                	int    $0x40
    2023:	c3                   	ret    

00002024 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
    2024:	55                   	push   %ebp
    2025:	89 e5                	mov    %esp,%ebp
    2027:	83 ec 18             	sub    $0x18,%esp
    202a:	8b 45 0c             	mov    0xc(%ebp),%eax
    202d:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
    2030:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    2037:	00 
    2038:	8d 45 f4             	lea    -0xc(%ebp),%eax
    203b:	89 44 24 04          	mov    %eax,0x4(%esp)
    203f:	8b 45 08             	mov    0x8(%ebp),%eax
    2042:	89 04 24             	mov    %eax,(%esp)
    2045:	e8 3a ff ff ff       	call   1f84 <write>
}
    204a:	c9                   	leave  
    204b:	c3                   	ret    

0000204c <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
    204c:	55                   	push   %ebp
    204d:	89 e5                	mov    %esp,%ebp
    204f:	56                   	push   %esi
    2050:	53                   	push   %ebx
    2051:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    2054:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
    205b:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
    205f:	74 17                	je     2078 <printint+0x2c>
    2061:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    2065:	79 11                	jns    2078 <printint+0x2c>
    neg = 1;
    2067:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
    206e:	8b 45 0c             	mov    0xc(%ebp),%eax
    2071:	f7 d8                	neg    %eax
    2073:	89 45 ec             	mov    %eax,-0x14(%ebp)
    2076:	eb 06                	jmp    207e <printint+0x32>
  } else {
    x = xx;
    2078:	8b 45 0c             	mov    0xc(%ebp),%eax
    207b:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
    207e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
    2085:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    2088:	8d 41 01             	lea    0x1(%ecx),%eax
    208b:	89 45 f4             	mov    %eax,-0xc(%ebp)
    208e:	8b 5d 10             	mov    0x10(%ebp),%ebx
    2091:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2094:	ba 00 00 00 00       	mov    $0x0,%edx
    2099:	f7 f3                	div    %ebx
    209b:	89 d0                	mov    %edx,%eax
    209d:	0f b6 80 94 30 00 00 	movzbl 0x3094(%eax),%eax
    20a4:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
    20a8:	8b 75 10             	mov    0x10(%ebp),%esi
    20ab:	8b 45 ec             	mov    -0x14(%ebp),%eax
    20ae:	ba 00 00 00 00       	mov    $0x0,%edx
    20b3:	f7 f6                	div    %esi
    20b5:	89 45 ec             	mov    %eax,-0x14(%ebp)
    20b8:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    20bc:	75 c7                	jne    2085 <printint+0x39>
  if(neg)
    20be:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    20c2:	74 10                	je     20d4 <printint+0x88>
    buf[i++] = '-';
    20c4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    20c7:	8d 50 01             	lea    0x1(%eax),%edx
    20ca:	89 55 f4             	mov    %edx,-0xc(%ebp)
    20cd:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
    20d2:	eb 1f                	jmp    20f3 <printint+0xa7>
    20d4:	eb 1d                	jmp    20f3 <printint+0xa7>
    putc(fd, buf[i]);
    20d6:	8d 55 dc             	lea    -0x24(%ebp),%edx
    20d9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    20dc:	01 d0                	add    %edx,%eax
    20de:	0f b6 00             	movzbl (%eax),%eax
    20e1:	0f be c0             	movsbl %al,%eax
    20e4:	89 44 24 04          	mov    %eax,0x4(%esp)
    20e8:	8b 45 08             	mov    0x8(%ebp),%eax
    20eb:	89 04 24             	mov    %eax,(%esp)
    20ee:	e8 31 ff ff ff       	call   2024 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    20f3:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    20f7:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    20fb:	79 d9                	jns    20d6 <printint+0x8a>
    putc(fd, buf[i]);
}
    20fd:	83 c4 30             	add    $0x30,%esp
    2100:	5b                   	pop    %ebx
    2101:	5e                   	pop    %esi
    2102:	5d                   	pop    %ebp
    2103:	c3                   	ret    

00002104 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    2104:	55                   	push   %ebp
    2105:	89 e5                	mov    %esp,%ebp
    2107:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
    210a:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
    2111:	8d 45 0c             	lea    0xc(%ebp),%eax
    2114:	83 c0 04             	add    $0x4,%eax
    2117:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
    211a:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    2121:	e9 7c 01 00 00       	jmp    22a2 <printf+0x19e>
    c = fmt[i] & 0xff;
    2126:	8b 55 0c             	mov    0xc(%ebp),%edx
    2129:	8b 45 f0             	mov    -0x10(%ebp),%eax
    212c:	01 d0                	add    %edx,%eax
    212e:	0f b6 00             	movzbl (%eax),%eax
    2131:	0f be c0             	movsbl %al,%eax
    2134:	25 ff 00 00 00       	and    $0xff,%eax
    2139:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
    213c:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    2140:	75 2c                	jne    216e <printf+0x6a>
      if(c == '%'){
    2142:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    2146:	75 0c                	jne    2154 <printf+0x50>
        state = '%';
    2148:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
    214f:	e9 4a 01 00 00       	jmp    229e <printf+0x19a>
      } else {
        putc(fd, c);
    2154:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2157:	0f be c0             	movsbl %al,%eax
    215a:	89 44 24 04          	mov    %eax,0x4(%esp)
    215e:	8b 45 08             	mov    0x8(%ebp),%eax
    2161:	89 04 24             	mov    %eax,(%esp)
    2164:	e8 bb fe ff ff       	call   2024 <putc>
    2169:	e9 30 01 00 00       	jmp    229e <printf+0x19a>
      }
    } else if(state == '%'){
    216e:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
    2172:	0f 85 26 01 00 00    	jne    229e <printf+0x19a>
      if(c == 'd'){
    2178:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
    217c:	75 2d                	jne    21ab <printf+0xa7>
        printint(fd, *ap, 10, 1);
    217e:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2181:	8b 00                	mov    (%eax),%eax
    2183:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    218a:	00 
    218b:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
    2192:	00 
    2193:	89 44 24 04          	mov    %eax,0x4(%esp)
    2197:	8b 45 08             	mov    0x8(%ebp),%eax
    219a:	89 04 24             	mov    %eax,(%esp)
    219d:	e8 aa fe ff ff       	call   204c <printint>
        ap++;
    21a2:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    21a6:	e9 ec 00 00 00       	jmp    2297 <printf+0x193>
      } else if(c == 'x' || c == 'p'){
    21ab:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
    21af:	74 06                	je     21b7 <printf+0xb3>
    21b1:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
    21b5:	75 2d                	jne    21e4 <printf+0xe0>
        printint(fd, *ap, 16, 0);
    21b7:	8b 45 e8             	mov    -0x18(%ebp),%eax
    21ba:	8b 00                	mov    (%eax),%eax
    21bc:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    21c3:	00 
    21c4:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
    21cb:	00 
    21cc:	89 44 24 04          	mov    %eax,0x4(%esp)
    21d0:	8b 45 08             	mov    0x8(%ebp),%eax
    21d3:	89 04 24             	mov    %eax,(%esp)
    21d6:	e8 71 fe ff ff       	call   204c <printint>
        ap++;
    21db:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    21df:	e9 b3 00 00 00       	jmp    2297 <printf+0x193>
      } else if(c == 's'){
    21e4:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
    21e8:	75 45                	jne    222f <printf+0x12b>
        s = (char*)*ap;
    21ea:	8b 45 e8             	mov    -0x18(%ebp),%eax
    21ed:	8b 00                	mov    (%eax),%eax
    21ef:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
    21f2:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
    21f6:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    21fa:	75 09                	jne    2205 <printf+0x101>
          s = "(null)";
    21fc:	c7 45 f4 f0 29 00 00 	movl   $0x29f0,-0xc(%ebp)
        while(*s != 0){
    2203:	eb 1e                	jmp    2223 <printf+0x11f>
    2205:	eb 1c                	jmp    2223 <printf+0x11f>
          putc(fd, *s);
    2207:	8b 45 f4             	mov    -0xc(%ebp),%eax
    220a:	0f b6 00             	movzbl (%eax),%eax
    220d:	0f be c0             	movsbl %al,%eax
    2210:	89 44 24 04          	mov    %eax,0x4(%esp)
    2214:	8b 45 08             	mov    0x8(%ebp),%eax
    2217:	89 04 24             	mov    %eax,(%esp)
    221a:	e8 05 fe ff ff       	call   2024 <putc>
          s++;
    221f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    2223:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2226:	0f b6 00             	movzbl (%eax),%eax
    2229:	84 c0                	test   %al,%al
    222b:	75 da                	jne    2207 <printf+0x103>
    222d:	eb 68                	jmp    2297 <printf+0x193>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    222f:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
    2233:	75 1d                	jne    2252 <printf+0x14e>
        putc(fd, *ap);
    2235:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2238:	8b 00                	mov    (%eax),%eax
    223a:	0f be c0             	movsbl %al,%eax
    223d:	89 44 24 04          	mov    %eax,0x4(%esp)
    2241:	8b 45 08             	mov    0x8(%ebp),%eax
    2244:	89 04 24             	mov    %eax,(%esp)
    2247:	e8 d8 fd ff ff       	call   2024 <putc>
        ap++;
    224c:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    2250:	eb 45                	jmp    2297 <printf+0x193>
      } else if(c == '%'){
    2252:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    2256:	75 17                	jne    226f <printf+0x16b>
        putc(fd, c);
    2258:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    225b:	0f be c0             	movsbl %al,%eax
    225e:	89 44 24 04          	mov    %eax,0x4(%esp)
    2262:	8b 45 08             	mov    0x8(%ebp),%eax
    2265:	89 04 24             	mov    %eax,(%esp)
    2268:	e8 b7 fd ff ff       	call   2024 <putc>
    226d:	eb 28                	jmp    2297 <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
    226f:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
    2276:	00 
    2277:	8b 45 08             	mov    0x8(%ebp),%eax
    227a:	89 04 24             	mov    %eax,(%esp)
    227d:	e8 a2 fd ff ff       	call   2024 <putc>
        putc(fd, c);
    2282:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2285:	0f be c0             	movsbl %al,%eax
    2288:	89 44 24 04          	mov    %eax,0x4(%esp)
    228c:	8b 45 08             	mov    0x8(%ebp),%eax
    228f:	89 04 24             	mov    %eax,(%esp)
    2292:	e8 8d fd ff ff       	call   2024 <putc>
      }
      state = 0;
    2297:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    229e:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    22a2:	8b 55 0c             	mov    0xc(%ebp),%edx
    22a5:	8b 45 f0             	mov    -0x10(%ebp),%eax
    22a8:	01 d0                	add    %edx,%eax
    22aa:	0f b6 00             	movzbl (%eax),%eax
    22ad:	84 c0                	test   %al,%al
    22af:	0f 85 71 fe ff ff    	jne    2126 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    22b5:	c9                   	leave  
    22b6:	c3                   	ret    
    22b7:	90                   	nop

000022b8 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    22b8:	55                   	push   %ebp
    22b9:	89 e5                	mov    %esp,%ebp
    22bb:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
    22be:	8b 45 08             	mov    0x8(%ebp),%eax
    22c1:	83 e8 08             	sub    $0x8,%eax
    22c4:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    22c7:	a1 2c 31 00 00       	mov    0x312c,%eax
    22cc:	89 45 fc             	mov    %eax,-0x4(%ebp)
    22cf:	eb 24                	jmp    22f5 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    22d1:	8b 45 fc             	mov    -0x4(%ebp),%eax
    22d4:	8b 00                	mov    (%eax),%eax
    22d6:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    22d9:	77 12                	ja     22ed <free+0x35>
    22db:	8b 45 f8             	mov    -0x8(%ebp),%eax
    22de:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    22e1:	77 24                	ja     2307 <free+0x4f>
    22e3:	8b 45 fc             	mov    -0x4(%ebp),%eax
    22e6:	8b 00                	mov    (%eax),%eax
    22e8:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    22eb:	77 1a                	ja     2307 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    22ed:	8b 45 fc             	mov    -0x4(%ebp),%eax
    22f0:	8b 00                	mov    (%eax),%eax
    22f2:	89 45 fc             	mov    %eax,-0x4(%ebp)
    22f5:	8b 45 f8             	mov    -0x8(%ebp),%eax
    22f8:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    22fb:	76 d4                	jbe    22d1 <free+0x19>
    22fd:	8b 45 fc             	mov    -0x4(%ebp),%eax
    2300:	8b 00                	mov    (%eax),%eax
    2302:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    2305:	76 ca                	jbe    22d1 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    2307:	8b 45 f8             	mov    -0x8(%ebp),%eax
    230a:	8b 40 04             	mov    0x4(%eax),%eax
    230d:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    2314:	8b 45 f8             	mov    -0x8(%ebp),%eax
    2317:	01 c2                	add    %eax,%edx
    2319:	8b 45 fc             	mov    -0x4(%ebp),%eax
    231c:	8b 00                	mov    (%eax),%eax
    231e:	39 c2                	cmp    %eax,%edx
    2320:	75 24                	jne    2346 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
    2322:	8b 45 f8             	mov    -0x8(%ebp),%eax
    2325:	8b 50 04             	mov    0x4(%eax),%edx
    2328:	8b 45 fc             	mov    -0x4(%ebp),%eax
    232b:	8b 00                	mov    (%eax),%eax
    232d:	8b 40 04             	mov    0x4(%eax),%eax
    2330:	01 c2                	add    %eax,%edx
    2332:	8b 45 f8             	mov    -0x8(%ebp),%eax
    2335:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
    2338:	8b 45 fc             	mov    -0x4(%ebp),%eax
    233b:	8b 00                	mov    (%eax),%eax
    233d:	8b 10                	mov    (%eax),%edx
    233f:	8b 45 f8             	mov    -0x8(%ebp),%eax
    2342:	89 10                	mov    %edx,(%eax)
    2344:	eb 0a                	jmp    2350 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
    2346:	8b 45 fc             	mov    -0x4(%ebp),%eax
    2349:	8b 10                	mov    (%eax),%edx
    234b:	8b 45 f8             	mov    -0x8(%ebp),%eax
    234e:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
    2350:	8b 45 fc             	mov    -0x4(%ebp),%eax
    2353:	8b 40 04             	mov    0x4(%eax),%eax
    2356:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    235d:	8b 45 fc             	mov    -0x4(%ebp),%eax
    2360:	01 d0                	add    %edx,%eax
    2362:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    2365:	75 20                	jne    2387 <free+0xcf>
    p->s.size += bp->s.size;
    2367:	8b 45 fc             	mov    -0x4(%ebp),%eax
    236a:	8b 50 04             	mov    0x4(%eax),%edx
    236d:	8b 45 f8             	mov    -0x8(%ebp),%eax
    2370:	8b 40 04             	mov    0x4(%eax),%eax
    2373:	01 c2                	add    %eax,%edx
    2375:	8b 45 fc             	mov    -0x4(%ebp),%eax
    2378:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    237b:	8b 45 f8             	mov    -0x8(%ebp),%eax
    237e:	8b 10                	mov    (%eax),%edx
    2380:	8b 45 fc             	mov    -0x4(%ebp),%eax
    2383:	89 10                	mov    %edx,(%eax)
    2385:	eb 08                	jmp    238f <free+0xd7>
  } else
    p->s.ptr = bp;
    2387:	8b 45 fc             	mov    -0x4(%ebp),%eax
    238a:	8b 55 f8             	mov    -0x8(%ebp),%edx
    238d:	89 10                	mov    %edx,(%eax)
  freep = p;
    238f:	8b 45 fc             	mov    -0x4(%ebp),%eax
    2392:	a3 2c 31 00 00       	mov    %eax,0x312c
}
    2397:	c9                   	leave  
    2398:	c3                   	ret    

00002399 <morecore>:

static Header*
morecore(uint nu)
{
    2399:	55                   	push   %ebp
    239a:	89 e5                	mov    %esp,%ebp
    239c:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
    239f:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
    23a6:	77 07                	ja     23af <morecore+0x16>
    nu = 4096;
    23a8:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
    23af:	8b 45 08             	mov    0x8(%ebp),%eax
    23b2:	c1 e0 03             	shl    $0x3,%eax
    23b5:	89 04 24             	mov    %eax,(%esp)
    23b8:	e8 2f fc ff ff       	call   1fec <sbrk>
    23bd:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
    23c0:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
    23c4:	75 07                	jne    23cd <morecore+0x34>
    return 0;
    23c6:	b8 00 00 00 00       	mov    $0x0,%eax
    23cb:	eb 22                	jmp    23ef <morecore+0x56>
  hp = (Header*)p;
    23cd:	8b 45 f4             	mov    -0xc(%ebp),%eax
    23d0:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
    23d3:	8b 45 f0             	mov    -0x10(%ebp),%eax
    23d6:	8b 55 08             	mov    0x8(%ebp),%edx
    23d9:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
    23dc:	8b 45 f0             	mov    -0x10(%ebp),%eax
    23df:	83 c0 08             	add    $0x8,%eax
    23e2:	89 04 24             	mov    %eax,(%esp)
    23e5:	e8 ce fe ff ff       	call   22b8 <free>
  return freep;
    23ea:	a1 2c 31 00 00       	mov    0x312c,%eax
}
    23ef:	c9                   	leave  
    23f0:	c3                   	ret    

000023f1 <malloc>:

void*
malloc(uint nbytes)
{
    23f1:	55                   	push   %ebp
    23f2:	89 e5                	mov    %esp,%ebp
    23f4:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    23f7:	8b 45 08             	mov    0x8(%ebp),%eax
    23fa:	83 c0 07             	add    $0x7,%eax
    23fd:	c1 e8 03             	shr    $0x3,%eax
    2400:	83 c0 01             	add    $0x1,%eax
    2403:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
    2406:	a1 2c 31 00 00       	mov    0x312c,%eax
    240b:	89 45 f0             	mov    %eax,-0x10(%ebp)
    240e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    2412:	75 23                	jne    2437 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
    2414:	c7 45 f0 24 31 00 00 	movl   $0x3124,-0x10(%ebp)
    241b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    241e:	a3 2c 31 00 00       	mov    %eax,0x312c
    2423:	a1 2c 31 00 00       	mov    0x312c,%eax
    2428:	a3 24 31 00 00       	mov    %eax,0x3124
    base.s.size = 0;
    242d:	c7 05 28 31 00 00 00 	movl   $0x0,0x3128
    2434:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    2437:	8b 45 f0             	mov    -0x10(%ebp),%eax
    243a:	8b 00                	mov    (%eax),%eax
    243c:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
    243f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2442:	8b 40 04             	mov    0x4(%eax),%eax
    2445:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    2448:	72 4d                	jb     2497 <malloc+0xa6>
      if(p->s.size == nunits)
    244a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    244d:	8b 40 04             	mov    0x4(%eax),%eax
    2450:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    2453:	75 0c                	jne    2461 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
    2455:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2458:	8b 10                	mov    (%eax),%edx
    245a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    245d:	89 10                	mov    %edx,(%eax)
    245f:	eb 26                	jmp    2487 <malloc+0x96>
      else {
        p->s.size -= nunits;
    2461:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2464:	8b 40 04             	mov    0x4(%eax),%eax
    2467:	2b 45 ec             	sub    -0x14(%ebp),%eax
    246a:	89 c2                	mov    %eax,%edx
    246c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    246f:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
    2472:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2475:	8b 40 04             	mov    0x4(%eax),%eax
    2478:	c1 e0 03             	shl    $0x3,%eax
    247b:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
    247e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2481:	8b 55 ec             	mov    -0x14(%ebp),%edx
    2484:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
    2487:	8b 45 f0             	mov    -0x10(%ebp),%eax
    248a:	a3 2c 31 00 00       	mov    %eax,0x312c
      return (void*)(p + 1);
    248f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2492:	83 c0 08             	add    $0x8,%eax
    2495:	eb 38                	jmp    24cf <malloc+0xde>
    }
    if(p == freep)
    2497:	a1 2c 31 00 00       	mov    0x312c,%eax
    249c:	39 45 f4             	cmp    %eax,-0xc(%ebp)
    249f:	75 1b                	jne    24bc <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
    24a1:	8b 45 ec             	mov    -0x14(%ebp),%eax
    24a4:	89 04 24             	mov    %eax,(%esp)
    24a7:	e8 ed fe ff ff       	call   2399 <morecore>
    24ac:	89 45 f4             	mov    %eax,-0xc(%ebp)
    24af:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    24b3:	75 07                	jne    24bc <malloc+0xcb>
        return 0;
    24b5:	b8 00 00 00 00       	mov    $0x0,%eax
    24ba:	eb 13                	jmp    24cf <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    24bc:	8b 45 f4             	mov    -0xc(%ebp),%eax
    24bf:	89 45 f0             	mov    %eax,-0x10(%ebp)
    24c2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    24c5:	8b 00                	mov    (%eax),%eax
    24c7:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
    24ca:	e9 70 ff ff ff       	jmp    243f <malloc+0x4e>
}
    24cf:	c9                   	leave  
    24d0:	c3                   	ret    
    24d1:	66 90                	xchg   %ax,%ax
    24d3:	90                   	nop

000024d4 <xchg>:
  asm volatile("sti");
}

static inline uint
xchg(volatile uint *addr, uint newval)
{
    24d4:	55                   	push   %ebp
    24d5:	89 e5                	mov    %esp,%ebp
    24d7:	83 ec 10             	sub    $0x10,%esp
  uint result;
  
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
    24da:	8b 55 08             	mov    0x8(%ebp),%edx
    24dd:	8b 45 0c             	mov    0xc(%ebp),%eax
    24e0:	8b 4d 08             	mov    0x8(%ebp),%ecx
    24e3:	f0 87 02             	lock xchg %eax,(%edx)
    24e6:	89 45 fc             	mov    %eax,-0x4(%ebp)
               "+m" (*addr), "=a" (result) :
               "1" (newval) :
               "cc");
  return result;
    24e9:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    24ec:	c9                   	leave  
    24ed:	c3                   	ret    

000024ee <lock_init>:
#include "x86.h"
#include "proc.h"

unsigned long rands = 1;

void lock_init(lock_t *lock){
    24ee:	55                   	push   %ebp
    24ef:	89 e5                	mov    %esp,%ebp
    lock->locked = 0;
    24f1:	8b 45 08             	mov    0x8(%ebp),%eax
    24f4:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
    24fa:	5d                   	pop    %ebp
    24fb:	c3                   	ret    

000024fc <lock_acquire>:
void lock_acquire(lock_t *lock){
    24fc:	55                   	push   %ebp
    24fd:	89 e5                	mov    %esp,%ebp
    24ff:	83 ec 08             	sub    $0x8,%esp
    while(xchg(&lock->locked,1) != 0);
    2502:	90                   	nop
    2503:	8b 45 08             	mov    0x8(%ebp),%eax
    2506:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
    250d:	00 
    250e:	89 04 24             	mov    %eax,(%esp)
    2511:	e8 be ff ff ff       	call   24d4 <xchg>
    2516:	85 c0                	test   %eax,%eax
    2518:	75 e9                	jne    2503 <lock_acquire+0x7>
}
    251a:	c9                   	leave  
    251b:	c3                   	ret    

0000251c <lock_release>:
void lock_release(lock_t *lock){
    251c:	55                   	push   %ebp
    251d:	89 e5                	mov    %esp,%ebp
    251f:	83 ec 08             	sub    $0x8,%esp
    xchg(&lock->locked,0);
    2522:	8b 45 08             	mov    0x8(%ebp),%eax
    2525:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    252c:	00 
    252d:	89 04 24             	mov    %eax,(%esp)
    2530:	e8 9f ff ff ff       	call   24d4 <xchg>
}
    2535:	c9                   	leave  
    2536:	c3                   	ret    

00002537 <thread_create>:


void *thread_create(void(*start_routine)(void*), void *arg){
    2537:	55                   	push   %ebp
    2538:	89 e5                	mov    %esp,%ebp
    253a:	83 ec 28             	sub    $0x28,%esp
    int tid;
    void * stack = malloc(2 * 4096);
    253d:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
    2544:	e8 a8 fe ff ff       	call   23f1 <malloc>
    2549:	89 45 f4             	mov    %eax,-0xc(%ebp)
    void *garbage_stack = stack; 
    254c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    254f:	89 45 f0             	mov    %eax,-0x10(%ebp)
   // printf(1,"start routine addr : %d\n",(uint)start_routine);


    if((uint)stack % 4096){
    2552:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2555:	25 ff 0f 00 00       	and    $0xfff,%eax
    255a:	85 c0                	test   %eax,%eax
    255c:	74 14                	je     2572 <thread_create+0x3b>
        stack = stack + (4096 - (uint)stack % 4096);
    255e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2561:	25 ff 0f 00 00       	and    $0xfff,%eax
    2566:	89 c2                	mov    %eax,%edx
    2568:	b8 00 10 00 00       	mov    $0x1000,%eax
    256d:	29 d0                	sub    %edx,%eax
    256f:	01 45 f4             	add    %eax,-0xc(%ebp)
    }
    if (stack == 0){
    2572:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    2576:	75 1b                	jne    2593 <thread_create+0x5c>

        printf(1,"malloc fail \n");
    2578:	c7 44 24 04 f7 29 00 	movl   $0x29f7,0x4(%esp)
    257f:	00 
    2580:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2587:	e8 78 fb ff ff       	call   2104 <printf>
        return 0;
    258c:	b8 00 00 00 00       	mov    $0x0,%eax
    2591:	eb 6f                	jmp    2602 <thread_create+0xcb>
    }

    tid = clone((uint)stack,PSIZE,(uint)start_routine,(int)arg);
    2593:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    2596:	8b 55 08             	mov    0x8(%ebp),%edx
    2599:	8b 45 f4             	mov    -0xc(%ebp),%eax
    259c:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
    25a0:	89 54 24 08          	mov    %edx,0x8(%esp)
    25a4:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
    25ab:	00 
    25ac:	89 04 24             	mov    %eax,(%esp)
    25af:	e8 50 fa ff ff       	call   2004 <clone>
    25b4:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(tid < 0){
    25b7:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    25bb:	79 1b                	jns    25d8 <thread_create+0xa1>
        printf(1,"clone fails\n");
    25bd:	c7 44 24 04 05 2a 00 	movl   $0x2a05,0x4(%esp)
    25c4:	00 
    25c5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    25cc:	e8 33 fb ff ff       	call   2104 <printf>
        return 0;
    25d1:	b8 00 00 00 00       	mov    $0x0,%eax
    25d6:	eb 2a                	jmp    2602 <thread_create+0xcb>
    }
    if(tid > 0){
    25d8:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    25dc:	7e 05                	jle    25e3 <thread_create+0xac>
        //store threads on thread table
        return garbage_stack;
    25de:	8b 45 f0             	mov    -0x10(%ebp),%eax
    25e1:	eb 1f                	jmp    2602 <thread_create+0xcb>
    }
    if(tid == 0){
    25e3:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    25e7:	75 14                	jne    25fd <thread_create+0xc6>
        printf(1,"tid = 0 return \n");
    25e9:	c7 44 24 04 12 2a 00 	movl   $0x2a12,0x4(%esp)
    25f0:	00 
    25f1:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    25f8:	e8 07 fb ff ff       	call   2104 <printf>
    }
//    wait();
//    free(garbage_stack);

    return 0;
    25fd:	b8 00 00 00 00       	mov    $0x0,%eax
}
    2602:	c9                   	leave  
    2603:	c3                   	ret    

00002604 <random>:

// generate 0 -> max random number exclude max.
int random(int max){
    2604:	55                   	push   %ebp
    2605:	89 e5                	mov    %esp,%ebp
    rands = rands * 1664525 + 1013904233;
    2607:	a1 a8 30 00 00       	mov    0x30a8,%eax
    260c:	69 c0 0d 66 19 00    	imul   $0x19660d,%eax,%eax
    2612:	05 69 f3 6e 3c       	add    $0x3c6ef369,%eax
    2617:	a3 a8 30 00 00       	mov    %eax,0x30a8
    return (int)(rands % max);
    261c:	a1 a8 30 00 00       	mov    0x30a8,%eax
    2621:	8b 4d 08             	mov    0x8(%ebp),%ecx
    2624:	ba 00 00 00 00       	mov    $0x0,%edx
    2629:	f7 f1                	div    %ecx
    262b:	89 d0                	mov    %edx,%eax
}
    262d:	5d                   	pop    %ebp
    262e:	c3                   	ret    
    262f:	90                   	nop

00002630 <init_q>:
#include "queue.h"
#include "types.h"
#include "user.h"

void init_q(struct queue *q){
    2630:	55                   	push   %ebp
    2631:	89 e5                	mov    %esp,%ebp
    q->size = 0;
    2633:	8b 45 08             	mov    0x8(%ebp),%eax
    2636:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    q->head = 0;
    263c:	8b 45 08             	mov    0x8(%ebp),%eax
    263f:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    q->tail = 0;
    2646:	8b 45 08             	mov    0x8(%ebp),%eax
    2649:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
}
    2650:	5d                   	pop    %ebp
    2651:	c3                   	ret    

00002652 <add_q>:

void add_q(struct queue *q, int v){
    2652:	55                   	push   %ebp
    2653:	89 e5                	mov    %esp,%ebp
    2655:	83 ec 28             	sub    $0x28,%esp
    struct node * n = malloc(sizeof(struct node));
    2658:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
    265f:	e8 8d fd ff ff       	call   23f1 <malloc>
    2664:	89 45 f4             	mov    %eax,-0xc(%ebp)
    n->next = 0;
    2667:	8b 45 f4             	mov    -0xc(%ebp),%eax
    266a:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    n->value = v;
    2671:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2674:	8b 55 0c             	mov    0xc(%ebp),%edx
    2677:	89 10                	mov    %edx,(%eax)
    if(q->head == 0){
    2679:	8b 45 08             	mov    0x8(%ebp),%eax
    267c:	8b 40 04             	mov    0x4(%eax),%eax
    267f:	85 c0                	test   %eax,%eax
    2681:	75 0b                	jne    268e <add_q+0x3c>
        q->head = n;
    2683:	8b 45 08             	mov    0x8(%ebp),%eax
    2686:	8b 55 f4             	mov    -0xc(%ebp),%edx
    2689:	89 50 04             	mov    %edx,0x4(%eax)
    268c:	eb 0c                	jmp    269a <add_q+0x48>
    }else{
        q->tail->next = n;
    268e:	8b 45 08             	mov    0x8(%ebp),%eax
    2691:	8b 40 08             	mov    0x8(%eax),%eax
    2694:	8b 55 f4             	mov    -0xc(%ebp),%edx
    2697:	89 50 04             	mov    %edx,0x4(%eax)
    }
    q->tail = n;
    269a:	8b 45 08             	mov    0x8(%ebp),%eax
    269d:	8b 55 f4             	mov    -0xc(%ebp),%edx
    26a0:	89 50 08             	mov    %edx,0x8(%eax)
    q->size++;
    26a3:	8b 45 08             	mov    0x8(%ebp),%eax
    26a6:	8b 00                	mov    (%eax),%eax
    26a8:	8d 50 01             	lea    0x1(%eax),%edx
    26ab:	8b 45 08             	mov    0x8(%ebp),%eax
    26ae:	89 10                	mov    %edx,(%eax)
}
    26b0:	c9                   	leave  
    26b1:	c3                   	ret    

000026b2 <empty_q>:

int empty_q(struct queue *q){
    26b2:	55                   	push   %ebp
    26b3:	89 e5                	mov    %esp,%ebp
    if(q->size == 0)
    26b5:	8b 45 08             	mov    0x8(%ebp),%eax
    26b8:	8b 00                	mov    (%eax),%eax
    26ba:	85 c0                	test   %eax,%eax
    26bc:	75 07                	jne    26c5 <empty_q+0x13>
        return 1;
    26be:	b8 01 00 00 00       	mov    $0x1,%eax
    26c3:	eb 05                	jmp    26ca <empty_q+0x18>
    else
        return 0;
    26c5:	b8 00 00 00 00       	mov    $0x0,%eax
} 
    26ca:	5d                   	pop    %ebp
    26cb:	c3                   	ret    

000026cc <pop_q>:
int pop_q(struct queue *q){
    26cc:	55                   	push   %ebp
    26cd:	89 e5                	mov    %esp,%ebp
    26cf:	83 ec 28             	sub    $0x28,%esp
    int val;
    struct node *destroy;
    if(!empty_q(q)){
    26d2:	8b 45 08             	mov    0x8(%ebp),%eax
    26d5:	89 04 24             	mov    %eax,(%esp)
    26d8:	e8 d5 ff ff ff       	call   26b2 <empty_q>
    26dd:	85 c0                	test   %eax,%eax
    26df:	75 5d                	jne    273e <pop_q+0x72>
       val = q->head->value; 
    26e1:	8b 45 08             	mov    0x8(%ebp),%eax
    26e4:	8b 40 04             	mov    0x4(%eax),%eax
    26e7:	8b 00                	mov    (%eax),%eax
    26e9:	89 45 f4             	mov    %eax,-0xc(%ebp)
       destroy = q->head;
    26ec:	8b 45 08             	mov    0x8(%ebp),%eax
    26ef:	8b 40 04             	mov    0x4(%eax),%eax
    26f2:	89 45 f0             	mov    %eax,-0x10(%ebp)
       q->head = q->head->next;
    26f5:	8b 45 08             	mov    0x8(%ebp),%eax
    26f8:	8b 40 04             	mov    0x4(%eax),%eax
    26fb:	8b 50 04             	mov    0x4(%eax),%edx
    26fe:	8b 45 08             	mov    0x8(%ebp),%eax
    2701:	89 50 04             	mov    %edx,0x4(%eax)
       free(destroy);
    2704:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2707:	89 04 24             	mov    %eax,(%esp)
    270a:	e8 a9 fb ff ff       	call   22b8 <free>
       q->size--;
    270f:	8b 45 08             	mov    0x8(%ebp),%eax
    2712:	8b 00                	mov    (%eax),%eax
    2714:	8d 50 ff             	lea    -0x1(%eax),%edx
    2717:	8b 45 08             	mov    0x8(%ebp),%eax
    271a:	89 10                	mov    %edx,(%eax)
       if(q->size == 0){
    271c:	8b 45 08             	mov    0x8(%ebp),%eax
    271f:	8b 00                	mov    (%eax),%eax
    2721:	85 c0                	test   %eax,%eax
    2723:	75 14                	jne    2739 <pop_q+0x6d>
            q->head = 0;
    2725:	8b 45 08             	mov    0x8(%ebp),%eax
    2728:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
            q->tail = 0;
    272f:	8b 45 08             	mov    0x8(%ebp),%eax
    2732:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
       }
       return val;
    2739:	8b 45 f4             	mov    -0xc(%ebp),%eax
    273c:	eb 05                	jmp    2743 <pop_q+0x77>
    }
    return -1;
    273e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
    2743:	c9                   	leave  
    2744:	c3                   	ret    

00002745 <dominant>:

void dominant(struct queue* q, int i){
    2745:	55                   	push   %ebp
    2746:	89 e5                	mov    %esp,%ebp
    2748:	83 ec 28             	sub    $0x28,%esp
    struct node * n = malloc(sizeof(struct node));
    274b:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
    2752:	e8 9a fc ff ff       	call   23f1 <malloc>
    2757:	89 45 f4             	mov    %eax,-0xc(%ebp)
    n->value = i;
    275a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    275d:	8b 55 0c             	mov    0xc(%ebp),%edx
    2760:	89 10                	mov    %edx,(%eax)

    if(q->head == 0){
    2762:	8b 45 08             	mov    0x8(%ebp),%eax
    2765:	8b 40 04             	mov    0x4(%eax),%eax
    2768:	85 c0                	test   %eax,%eax
    276a:	75 14                	jne    2780 <dominant+0x3b>
        q->head = n;
    276c:	8b 45 08             	mov    0x8(%ebp),%eax
    276f:	8b 55 f4             	mov    -0xc(%ebp),%edx
    2772:	89 50 04             	mov    %edx,0x4(%eax)
        q->tail = n;
    2775:	8b 45 08             	mov    0x8(%ebp),%eax
    2778:	8b 55 f4             	mov    -0xc(%ebp),%edx
    277b:	89 50 08             	mov    %edx,0x8(%eax)
    277e:	eb 15                	jmp    2795 <dominant+0x50>
    }
    else{
        n->next = q->head;
    2780:	8b 45 08             	mov    0x8(%ebp),%eax
    2783:	8b 50 04             	mov    0x4(%eax),%edx
    2786:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2789:	89 50 04             	mov    %edx,0x4(%eax)
        q->head = n;
    278c:	8b 45 08             	mov    0x8(%ebp),%eax
    278f:	8b 55 f4             	mov    -0xc(%ebp),%edx
    2792:	89 50 04             	mov    %edx,0x4(%eax)
    }
    q->size++;
    2795:	8b 45 08             	mov    0x8(%ebp),%eax
    2798:	8b 00                	mov    (%eax),%eax
    279a:	8d 50 01             	lea    0x1(%eax),%edx
    279d:	8b 45 08             	mov    0x8(%ebp),%eax
    27a0:	89 10                	mov    %edx,(%eax)
}
    27a2:	c9                   	leave  
    27a3:	c3                   	ret    

000027a4 <sem_init>:
#include "semaphore.h"
#include "user.h"

// Initializes the semaphore
void sem_init(struct Semaphore* s, int value){
    27a4:	55                   	push   %ebp
    27a5:	89 e5                	mov    %esp,%ebp
    27a7:	83 ec 18             	sub    $0x18,%esp
    s->val = value;
    27aa:	8b 45 08             	mov    0x8(%ebp),%eax
    27ad:	8b 55 0c             	mov    0xc(%ebp),%edx
    27b0:	89 10                	mov    %edx,(%eax)
    lock_init(&s->lock);
    27b2:	8b 45 08             	mov    0x8(%ebp),%eax
    27b5:	83 c0 04             	add    $0x4,%eax
    27b8:	89 04 24             	mov    %eax,(%esp)
    27bb:	e8 2e fd ff ff       	call   24ee <lock_init>
    init_q(&s->q);
    27c0:	8b 45 08             	mov    0x8(%ebp),%eax
    27c3:	83 c0 08             	add    $0x8,%eax
    27c6:	89 04 24             	mov    %eax,(%esp)
    27c9:	e8 62 fe ff ff       	call   2630 <init_q>
}
    27ce:	c9                   	leave  
    27cf:	c3                   	ret    

000027d0 <sem_acquire>:

// Decrements the semaphore
void sem_acquire(struct Semaphore* s){
    27d0:	55                   	push   %ebp
    27d1:	89 e5                	mov    %esp,%ebp
    27d3:	83 ec 28             	sub    $0x28,%esp
    lock_acquire(&s->lock);
    27d6:	8b 45 08             	mov    0x8(%ebp),%eax
    27d9:	83 c0 04             	add    $0x4,%eax
    27dc:	89 04 24             	mov    %eax,(%esp)
    27df:	e8 18 fd ff ff       	call   24fc <lock_acquire>

    if(s->val == 0){
    27e4:	8b 45 08             	mov    0x8(%ebp),%eax
    27e7:	8b 00                	mov    (%eax),%eax
    27e9:	85 c0                	test   %eax,%eax
    27eb:	75 32                	jne    281f <sem_acquire+0x4f>
        int pid;
        pid = getpid();
    27ed:	e8 f2 f7 ff ff       	call   1fe4 <getpid>
    27f2:	89 45 f4             	mov    %eax,-0xc(%ebp)
        add_q(&s->q, pid);
    27f5:	8b 45 08             	mov    0x8(%ebp),%eax
    27f8:	8d 50 08             	lea    0x8(%eax),%edx
    27fb:	8b 45 f4             	mov    -0xc(%ebp),%eax
    27fe:	89 44 24 04          	mov    %eax,0x4(%esp)
    2802:	89 14 24             	mov    %edx,(%esp)
    2805:	e8 48 fe ff ff       	call   2652 <add_q>
        lock_release(&s->lock);
    280a:	8b 45 08             	mov    0x8(%ebp),%eax
    280d:	83 c0 04             	add    $0x4,%eax
    2810:	89 04 24             	mov    %eax,(%esp)
    2813:	e8 04 fd ff ff       	call   251c <lock_release>
        tsleep();
    2818:	e8 f7 f7 ff ff       	call   2014 <tsleep>
    281d:	eb 1b                	jmp    283a <sem_acquire+0x6a>
    }
    else{
        s->val--;
    281f:	8b 45 08             	mov    0x8(%ebp),%eax
    2822:	8b 00                	mov    (%eax),%eax
    2824:	8d 50 ff             	lea    -0x1(%eax),%edx
    2827:	8b 45 08             	mov    0x8(%ebp),%eax
    282a:	89 10                	mov    %edx,(%eax)
        lock_release(&s->lock);
    282c:	8b 45 08             	mov    0x8(%ebp),%eax
    282f:	83 c0 04             	add    $0x4,%eax
    2832:	89 04 24             	mov    %eax,(%esp)
    2835:	e8 e2 fc ff ff       	call   251c <lock_release>
    }
}
    283a:	c9                   	leave  
    283b:	c3                   	ret    

0000283c <sem_signal>:

// Increments the semaphore
void sem_signal(struct Semaphore* s){
    283c:	55                   	push   %ebp
    283d:	89 e5                	mov    %esp,%ebp
    283f:	83 ec 18             	sub    $0x18,%esp
    lock_acquire(&s->lock);
    2842:	8b 45 08             	mov    0x8(%ebp),%eax
    2845:	83 c0 04             	add    $0x4,%eax
    2848:	89 04 24             	mov    %eax,(%esp)
    284b:	e8 ac fc ff ff       	call   24fc <lock_acquire>

    if(!empty_q(&s->q)){
    2850:	8b 45 08             	mov    0x8(%ebp),%eax
    2853:	83 c0 08             	add    $0x8,%eax
    2856:	89 04 24             	mov    %eax,(%esp)
    2859:	e8 54 fe ff ff       	call   26b2 <empty_q>
    285e:	85 c0                	test   %eax,%eax
    2860:	75 18                	jne    287a <sem_signal+0x3e>
        twakeup(pop_q(&s->q));
    2862:	8b 45 08             	mov    0x8(%ebp),%eax
    2865:	83 c0 08             	add    $0x8,%eax
    2868:	89 04 24             	mov    %eax,(%esp)
    286b:	e8 5c fe ff ff       	call   26cc <pop_q>
    2870:	89 04 24             	mov    %eax,(%esp)
    2873:	e8 a4 f7 ff ff       	call   201c <twakeup>
    2878:	eb 0d                	jmp    2887 <sem_signal+0x4b>
    }
    else{
        s->val++;
    287a:	8b 45 08             	mov    0x8(%ebp),%eax
    287d:	8b 00                	mov    (%eax),%eax
    287f:	8d 50 01             	lea    0x1(%eax),%edx
    2882:	8b 45 08             	mov    0x8(%ebp),%eax
    2885:	89 10                	mov    %edx,(%eax)
    }

    lock_release(&s->lock);
    2887:	8b 45 08             	mov    0x8(%ebp),%eax
    288a:	83 c0 04             	add    $0x4,%eax
    288d:	89 04 24             	mov    %eax,(%esp)
    2890:	e8 87 fc ff ff       	call   251c <lock_release>
}
    2895:	c9                   	leave  
    2896:	c3                   	ret    

00002897 <sem_dom_acquire>:

void sem_dom_acquire(struct Semaphore* s){
    2897:	55                   	push   %ebp
    2898:	89 e5                	mov    %esp,%ebp
    289a:	83 ec 18             	sub    $0x18,%esp
    lock_acquire(&s->lock);
    289d:	8b 45 08             	mov    0x8(%ebp),%eax
    28a0:	83 c0 04             	add    $0x4,%eax
    28a3:	89 04 24             	mov    %eax,(%esp)
    28a6:	e8 51 fc ff ff       	call   24fc <lock_acquire>

    if(s->val > 0){
    28ab:	8b 45 08             	mov    0x8(%ebp),%eax
    28ae:	8b 00                	mov    (%eax),%eax
    28b0:	85 c0                	test   %eax,%eax
    28b2:	7e 1d                	jle    28d1 <sem_dom_acquire+0x3a>
        s->val--;
    28b4:	8b 45 08             	mov    0x8(%ebp),%eax
    28b7:	8b 00                	mov    (%eax),%eax
    28b9:	8d 50 ff             	lea    -0x1(%eax),%edx
    28bc:	8b 45 08             	mov    0x8(%ebp),%eax
    28bf:	89 10                	mov    %edx,(%eax)
        lock_release(&s->lock);
    28c1:	8b 45 08             	mov    0x8(%ebp),%eax
    28c4:	83 c0 04             	add    $0x4,%eax
    28c7:	89 04 24             	mov    %eax,(%esp)
    28ca:	e8 4d fc ff ff       	call   251c <lock_release>
        return;
    28cf:	eb 2a                	jmp    28fb <sem_dom_acquire+0x64>
    }

    dominant(&s->q,getpid());
    28d1:	e8 0e f7 ff ff       	call   1fe4 <getpid>
    28d6:	8b 55 08             	mov    0x8(%ebp),%edx
    28d9:	83 c2 08             	add    $0x8,%edx
    28dc:	89 44 24 04          	mov    %eax,0x4(%esp)
    28e0:	89 14 24             	mov    %edx,(%esp)
    28e3:	e8 5d fe ff ff       	call   2745 <dominant>
    lock_release(&s->lock);
    28e8:	8b 45 08             	mov    0x8(%ebp),%eax
    28eb:	83 c0 04             	add    $0x4,%eax
    28ee:	89 04 24             	mov    %eax,(%esp)
    28f1:	e8 26 fc ff ff       	call   251c <lock_release>
    tsleep();
    28f6:	e8 19 f7 ff ff       	call   2014 <tsleep>
}
    28fb:	c9                   	leave  
    28fc:	c3                   	ret    
