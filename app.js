const http=require("http");
const url=require("url");
const qs=require("querystring");
const express=require("express");
const mysql=require("mysql");
const multer=require("multer");
var pool=mysql.createPool({
    host: "172.16.0.10 ", 
    user: "root", 
    password: "TLS84813680",
    database: "dbuser",
    port: 3306,
    connectionLimit:25
});
var app=express();
var server=http.createServer(app);
server.listen(8081);
app.get("/",(req,res)=>{
    res.sendFile(__dirname+"/public/login.html");
});
app.use(express.static("public"));
//注册查询账号是否重复
app.post("/register-search",(req,res)=>{
    req.on("data",(data)=>{        
        var obj=qs.parse(data.toString());
        var u=obj.uname;
        pool.getConnection((err,conn)=>{
            var sql="SELECT * FROM user WHERE uname=?";
            conn.query(sql,[u],(err,result)=>{
                if(err) throw err;
                if(result.length>0){
                    res.json({code:-1,msg:"账号已存在"})
                }else{
                    res.json({code:1,msg:"账号可用"})
                }
                conn.release();
            })
        })
    })
});
//注册成功,用户信息储存
app.post("/register",(req,res)=>{
    req.on("data",(data)=>{
        console.log("register request success");
        var obj=qs.parse(data.toString());
        var uname=obj.uname,
            upwd=obj.password,
            ulcon=obj.lcon,
            unick=obj.nick,
            usign="";            
        pool.getConnection((err,conn)=>{            
            var sql="INSERT INTO user VALUES(null,?,?,?,?,?)";
            conn.query(sql,[uname,upwd,ulcon,unick,usign],(err,result)=>{
                if(err) throw err;
                if(result.affectedRows>0){
                    res.json({code:1,msg:"注册成功"})
                }else{
                    res.json({code:-1,msg:"注册失败"})
                }
                conn.release();
            })
        })
    })
});
//建立聊天记录表
app.post("/createTable",(req,res)=>{
    req.on("data",(data)=>{
        var obj=qs.parse(data.toString());
        var uname=obj.uname;
        pool.getConnection((err,conn)=>{
            var sql="CREATE TABLE ch"+uname+"(" +
                "cid INT PRIMARY KEY AUTO_INCREMENT," +
                "uid1 INT," +
                "uid2 INT," +
                "content VARCHAR(10000)," +
                "time VARCHAR(50)," +
                "pubtime DATETIME," +
                "nick VARCHAR(50)," +
                "lcon VARCHAR(20)," +
                "isLeft VARCHAR(10))";
            conn.query(sql,(err,result)=>{
                if(err) throw err;
            })
        })
    })
});
//登录验证
app.post("/login",(req,res)=>{
    req.on("data",(data)=>{
        console.log("login request success");
        var obj=qs.parse(data.toString());
        var u=obj.uname,
            p=obj.upwd;
        pool.getConnection((err,conn)=>{
            var sql="SELECT * FROM user WHERE uname=? AND upwd=?";
            conn.query(sql,[u,p],(err,result)=>{
                if(err) throw err;
                if(result.length<1){
                    res.json({code:-1,msg:"登录失败"})
                }else{
                    res.json({code:1,msg:"登录成功",uid:result[0].uid,uname:result[0].uname,ulcon:result[0].ulcon,unick:result[0].unick})
                }
                conn.release();
            })
        })
    })
});
//获取好友列表
app.get("/contacts",(req,res)=>{
    var tid=req.query.uid;
    pool.getConnection((err,conn)=>{
        var sql="SELECT u.usign,c.Icon,c.nick,c.uname,c.uid,c.sign FROM user u,contacts c WHERE u.uid=c.tid AND tid=?";
        conn.query(sql,[tid],(err,result)=>{
            if(err) throw err;
            if(result.length>0){
                res.json(result);
            }
            conn.release();
        })
    })
});
//更新签名
app.post("/updateSign",(req,res)=>{
   req.on("data",(data)=>{
       var obj=qs.parse(data.toString());
       var sign=obj.sign;
       var uid=obj.uid;
       pool.getConnection((err,conn)=>{
           var sql="UPDATE user u,contacts c SET u.usign=?,c.sign=? WHERE u.uid= c.uid AND u.uid=?";
           conn.query(sql,[sign,sign,uid],(err,result)=>{
               if(err) throw err;
               if(result.affectedRows>0){
                   res.json({"code":1,"msg":"更新成功"})
               }else{
                   res.json({"code":-1,"msg":"更新失败"})
               }
               conn.release();
           })
       })
   })
});
//删除好友
app.post("/deleteFriend",(req,res)=>{
    req.on("data",(data)=>{
        var obj=qs.parse(data.toString()),
            tid=obj.tid,
            uid=obj.uid;
        pool.getConnection((err,conn)=>{
            var sql="DELETE FROM contacts WHERE tid=? AND uid=?";
            conn.query(sql,[tid,uid],(err,result)=>{
                if(err) throw err;
                if(result.affectedRows>0){
                    res.json({"code":1,"msg":"删除成功"})
                }else{
                    res.json({"code":-1,"msg":"删除失败"})
                }
                conn.release();
            })
        })
    })
});
//查询个人信息
app.get("/searchUser",(req,res)=>{
    var uid=req.query.uid;
    console.log(uid);
    pool.getConnection((err,conn)=>{
        var sql="SELECT * FROM user WHERE uid=?";
        conn.query(sql,[uid],(err,result)=>{
            if(err) throw err;
            res.json(result);
            conn.release();
        })
    })
});
//添加好友储存数据库
app.post("/addContacts",(req,res)=>{
    req.on("data",(data)=>{
        var obj=qs.parse(data.toString());
        console.log(obj);
        var tid=obj.tid,
            sign=obj.sign,
            nick=obj.nick,
            lcon=obj.lcon,
            uname=obj.uname,
            uid=obj.uid;
        pool.getConnection((err,conn)=>{
            var sql="INSERT INTO contacts VALUES(null,?,?,?,?,?,?)";
            conn.query(sql,[uid,uname,lcon,nick,sign,tid],(err,result)=>{
                if(err) throw err;
                if(result.affectedRows>0){
                    res.json({"code":1})
                }else{
                    res.json({"code":-1})
                }
            })
        })
    })
});
var str="ch";
//聊天记录加载
app.get("/chatHistoryLoad",(req,res)=>{
    var uname=req.query.uname;
    var userList=str+uname;
    var uid1=req.query.uid1;
    pool.getConnection((err,conn1)=>{
        var sql="SELECT * FROM "+userList+" WHERE uid1=? ORDER BY pubtime DESC LIMIT 0,10";
        conn1.query(sql,[uid1],(err,result1)=>{
            if(err) throw err;
            res.json(result1);
            conn1.release();
        })
    });
});
//文件上传
var storage = multer.diskStorage({
    destination: function (req, file, cb){
        cb(null, './public/upload')
    },
    filename: function (req, file, cb){
        cb(null, file.originalname)
    }
});
var upload = multer({
    storage: storage
});
app.post('/upload', upload.single('file'), function (req, res, next) {
    var url = 'http://' + req.headers.host + '/upload/' + req.file.originalname;
    res.json({
        code : 1,
        data : url
    });
    res.end();
});
var io=require("socket.io").listen(server);
var usocket = {},user = [];
io.on('connection', (socket) =>{
    socket.on('new user', (uname,nick,uid,lcon) => {
        if(uid in usocket){
            delete(usocket[socket.uid]);
            for(var i=0;i<user.length;i++){
                if(parseInt(user[i].uid)==uid){
                    user.splice(i,1);
                    break;
                }
            }
        }
        socket.uid = uid;
        usocket[uid] = socket;
        var obj={uname:uname,nick:nick,uid:uid,lcon:lcon};
        user.push(obj);
        socket.emit('login',JSON.stringify(user));

    });
    socket.on('send private message', function(msg,ruid,suid,showTime,rname){
        if(ruid in usocket) {
            var nick="",
                lcon="",
                uname="";
            for(var i=0;i<user.length;i++){
                if(user[i].uid==suid){
                    nick=user[i].nick;
                    lcon=user[i].lcon;
                    uname=user[i].uname;
                    break;
                }
            }
            usocket[ruid].emit('receive private message', {msg:msg,nick:nick,lcon:lcon,uid:suid,rname:uname,time:showTime});
        }
        var userList=str+uname;
        pool.getConnection((err,conn)=>{
            if(err) throw err;
            var sql="INSERT INTO "+userList+" VALUES(null,?,?,?,?,now(),?,?,?)";
            conn.query(sql,[ruid,suid,msg,showTime,nick,lcon,true],(err,result)=>{
                conn.release();
            })
        });
        var friendList=str+rname;
        pool.getConnection((err,conn)=>{
            if(err) throw err;
            var sql="INSERT INTO "+friendList+" VALUES(null,?,?,?,?,now(),?,?,?)";
            conn.query(sql,[suid,ruid,msg,showTime,nick,lcon,false],(err,result)=>{
                conn.release();
            })
        })
    });
    socket.on('addFriend',function(remark,ruid,nick,uname,suid){
        usocket[ruid].emit('receive addFriend',{remark:remark,nick:nick,uname:uname,suid:suid});
    });
    socket.on('agree add friend msgBack',function(nick,suid,ruid,isAgree){
        usocket[ruid].emit('receive agree add friend msgBack',{nick:nick,ruid:ruid,suid:suid,isAgree:isAgree});
    });
    socket.on('disconnect', function(){
        //移除

            if(socket.uid in usocket){
                delete(usocket[socket.uid]);
                //user.splice(user.indexOf(socket.uid, 1));
            }
            for(var i=0;i<user.length;i++){
                if(socket.uid==user[i].uid){
                    user.splice(i,1);
                    break;
                }
            }
            socket.broadcast.emit('user left',socket.username)
    })

});
