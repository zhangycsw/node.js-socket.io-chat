//bug1:559行ajax请求数据，点接搜索内容抓不到聊天记录
//待开发：游戏区域，多人聊天
+function(){
    window.onload=function(){
        var bzchat=new BzChat();
        bzchat.init();
    };
    function BzChat (){
        this.socket=null;
        this.uname=sessionStorage['uname'];
        this.lcon=sessionStorage['ulcon'];
        this.uid=sessionStorage['uid'];
        this.nick=sessionStorage['unick'];
        this.sign="";
        this.elem={};
        this.btn={};
        this.lastTimer=[0];
        this.showTime=0;
        this.receviceMsgUid=0;
        this.isPlay=true;
        this.onlineUser=[];
        this.dataBufferUid=[];
    }
    BzChat.prototype={
        init:function(){
            this.elem.main=$(" #main");
            this.elem.lcon=$(".avatar img ");
            this.elem.nick=$(" .userName ");
            this.elem.contacts=$(" .view-contact .contact-items");
            this.elem.chatName=$(" .chat-name");
            this.elem.chatNum=$(".chat-name .num");
            this.elem.panel=$(" .panel");
            this.elem.tab=$(".panel .tab");
            this.elem.tabMsg=$(".tab .msg");
            this.elem.demoInner=$(" .demo-inner");
            this.elem.view=$(" .view");
            this.elem.headerNav=$(" .header-nav");
            this.elem.viewMsg=$(" .view-msg");
            this.elem.signature=$(" #signature");
            this.elem.chatPop=$(" #chat-pop");
            this.elem.userInfoPOP=$(" #userInfo-pop .info-pop");
            this.elem.chatList=$(" .personList");
            this.elem.select=$(" .search .select");
            this.elem.subItem=$(" .subItem");
            this.elem.audio=$(" #audio");
            this.elem.dataBuffer=$(" #dataBuffer");
            this.elem.aboutFriend=$(" #addFriend");
            this.btn.exit=$(" .exit");
            this.btn.chat=$(" .chat");
            this.btn.send=$(" #send");
            this.btn.chatPopBtn=$("#chatPop-btn");
            //绑定事件
            this.addEvent();

        },
        addEvent:function(){
            var _this=this;
            //连接服务器
            this.connectionServer();
            //登录成功加载好友数据
            this.drawMain(_this);
            //点击用户头像
            this.userLcon(_this);
            //联系人点击弹出详细信息
            this.elem.contacts.on("click",".contact-item",function(e) {
                var that=$(this);
                var isFriend=true;
                var uid=$(this).find("input").data("uid");
                var nick=$(this).find(".nickname").html();
                var rname=$(this).find("input").val();
                if($(this).find(".redCircle").hasClass("active")){
                    $(this).find(".redCircle").removeClass("active");
                }
                if(_this.onlineUser.indexOf(uid)==-1){
                    _this.onlineUser.push(uid);
                    _this.userDetail(that,_this,isFriend);
                    _this.chatHistoryLoad(uid,_this);
                }else{
                    //_this.btn.send.off("click");
                    _this.elem.demoInner.empty();
                    _this.elem.chatName.html(nick);
                    _this.enterOnKeyDown(uid,_this,rname);
                    $(".redact .face").off("click").click(function() {
                        _this.sendFace();
                    });
                    _this.bufferDataFetch(uid);
                    _this.demoInnerScroll();
                    _this.sendEmoji(uid,_this,rname);
                }
            });
            //查看详情发起聊天
            this.elem.demoInner.on("click",".detail-btn",function(e){
                var $father=$(e.target).parent().parent(),
                    nick=$father.find(".d-n-name").html(),
                    uid=$(this).data("uid"),
                    rname=$father.find(".account").html().split(":")[1];
               if(_this.onlineUser.indexOf(uid)==-1){
                   _this.onlineUser.push(uid);
               }
                $(".redact .face").off("click").click(function() {
                    _this.sendFace();
                });
                _this.elem.demoInner.empty();
                _this.bufferDataFetch(uid);
                _this.elem.chatName.html(nick);
                _this.sendMsg("info-left",uid,_this,rname);
                //绑定enter键
                _this.enterOnKeyDown(uid,_this,rname);
                _this.sendEmoji(uid,_this,rname);
                _this.fileUpload("info-left",uid,_this,rname);
                _this.demoInnerScroll();
            });
            //接收私人消息
            this.socket.on('receive private message', function (data) {
                _this.btn.send.off();
                $("#face-pop").off();
                var isLeft="info-right";
                var isAppend=true;
                var str=_this.elem.chatName.html();
                if(_this.onlineUser.indexOf(data.uid)==-1){
                    _this.onlineUser.push(data.uid);
                    _this.chatHistoryLoad(data.uid,_this);
                    _this.msgTipRedCircle(data.uid);
                 var   html = _this.showMsgMainHtml(data.uid, isLeft, data.time, data.msg, data.nick, data.lcon);
                    _this.msgToDataBuffer(data.uid, html,isPrepend);
                }else {
                    var isPrepend=false;
                    if (str.indexOf(data.nick) == -1) {
                        html = _this.showMsgMainHtml(data.uid, isLeft, data.time, data.msg, data.nick, data.lcon);
                        _this.msgToDataBuffer(data.uid, html,isPrepend);
                        _this.msgTipRedCircle(data.uid);
                    } else {
                        _this.showMsg(data.uid, isLeft, data.time, data.msg, data.nick, data.lcon, isAppend);
                    }
                }
                _this.msgAudio(_this.isPlay);
                _this.sendEmoji(data.uid,_this,data.rname);
                isLeft="info-left";
                _this.sendMsg(isLeft,data.uid,_this,data.rname);
                _this.fileUpload(isLeft,data.uid,_this,data.rname);
            });
            //更新签名
            this.updateSign(_this);
            //头部nav和tab 点击切换
            this.headerTab(_this);
            //发起群聊
            this.allChat(_this);
            //搜索框搜索好友
            this.search(_this);
            //消息区图片点击查看
            this.picCheck();
            //关闭声音
            $(" #main .voice").click(function(){
                $(this).toggleClass("isPlay");
                if(_this.isPlay==true){
                    _this.isPlay=false;
                }else{
                    _this.isPlay=true;
                }
            });
            //添加好友右键弹出框
            this.elem.viewMsg.on("contextmenu",".contact-item",function() {
                var that=$(this);
                var uid=that.find("input").data("uid");
                if(event.button==2){
                    event.preventDefault();
                    var uids=$(".view-contact input");
                   if(uids.length!==0){
                    for(var i=0;i<uids.length;i++){
                        if(uid!==$(uids[i]).data("uid")&&uid!==parseInt(_this.uid)){
                            _this.mouseRightDown(false,true);
                        }else{
                            _this.mouseRightDown(false,false);
                            break;
                        }
                    }
                   }else{
                       if(uid!=parseInt(_this.uid)) {
                           _this.mouseRightDown(false,true);
                       }else{
                           _this.mouseRightDown(false,false);
                       }
                   }
                    $("#friend-pop").show();
                }
                _this.elem.aboutFriend.off("click");
                _this.elem.aboutFriend.click(function(){
                    var nick=$.trim(that.find(".nickname").html());
                    _this.addFriend(nick,uid);
                    $("#friend-pop").hide();
                });
                $("#checkUserDetail").click(function(){
                    _this.userDetail(that,_this,false);
                    $(" #friend-pop .friend").hide();
                })
            });
            //添加好友消息接收
            this.socket.on('receive addFriend',function(data){
                $("#aboutFriend").show();
                $(".operateTitle").html("添加好友");
                $(".operateInfo").html("<span class='nickname'>"+data.nick+"</span> <span class='nickname'>"+data.uname+"</span>要添加您为好友");
                $(".remarks").show().val(data.remark);
                $(".agree").off("click");
                $(".agree ").click(function(){
                    var isAgree=true;
                    $("#aboutFriend").hide();
                    _this.addFriendMsgBack(_this.nick,data.suid,isAgree);
                    _this.addFriendSuccess(data.suid,_this);
                    _this.loadContactsList(_this);
                });
                $(".cancel").off("click");
                $(".cancel ").click(function(){
                     var isAgree=false;
                    _this.addFriendMsgBack(_this.nick,data.suid,isAgree);
                    $("#aboutFriend").hide();
                })
            });
            //添加好友返回信息
            this.socket.on('receive agree add friend msgBack',function(data){
               if(data.isAgree){
                   $("#aboutFriend").show();
                   $(".operateInfo").html("<span class='nickname'>"+data.nick+"</span>同意添加您为好友");
                   $(".remarks").hide();
                   $(".agree").off("click").click(function(){
                       $("#aboutFriend").hide();
                       _this.addFriendSuccess(data.suid,_this);
                   });
                   $(".cancel").off("click").click(function(){
                       $("#aboutFriend").hide();
                   });

               }else{
                   $("#aboutFriend").show();
                   $(".operateInfo").html("<span class='nickname'>"+data.nick+"</span>拒绝添加您为好友");
                   $(".remarks").hide();
                   $(".agree").off("click").click(function(){
                       $("#aboutFriend").hide();
                   });
                   $(".cancel").off("click").click(function(){
                       $("#aboutFriend").hide();
                   });
               }
            });
            //删除好友弹出框
            this.elem.contacts.parent().on("contextmenu",".contact-item",function(){
                var that=$(this);
                if(event.button==2){
                    event.preventDefault();
                    _this.mouseRightDown(true);
                    $("#friend-pop").show();
                    $("#friend-pop").find("#addFriend").show();
                }
               _this.elem.aboutFriend.off("click");
               _this.elem.aboutFriend.click(function(){
                    var uid=that.find("input").data("uid");
                    var nick=$.trim(that.find(".nickname").html());
                    _this.deleteFriend(nick,uid,_this,that);
                   $("#friend-pop").hide();
               })
            });
            //背景切换
            this.bgTurn();
            //退出程序
            this.exit();
        },
        drawMain:function(_this){
            this.elem.lcon.attr("src","img/"+this.lcon+".jpg");
            this.elem.nick.html(this.nick);
            this.elem.userInfoPOP.find(".nickname").html(this.nick);
            $(".info-account").html(this.uname);
            this.loadContactsList(_this);
        },
        loadContactsList:function(_this){
            $.ajax({
                type:"GET",
                url:"/contacts",
                data:{uid:this.uid},
                success:function(data){
                    var html="";
                    var html2="";
                    _this.elem.signature.val(data[0].usign);
                    sessionStorage['personNum']=data.length;
                    for(var i=0;i<data.length;i++){
                        var obj=data[i];
                        html+=`
                         <div class="contact-item float-clear">
                            <div class="user-avatar">
                                <img src="img/${obj.lcon}.jpg">
                                 <i class="redCircle"></i>
                            </div>
                            <div class="user-name">
                                <h4 class="nickname">
                                    ${obj.nick}
                                </h4>
                                <h4 class="user-sign">${obj.sign}</h4>
                                <input type="hidden" value="${obj.uname}" data-uid="${obj.uid}">
                            </div>
                        </div>
                   `;
                        html2+=`
                        <li>
                          <div class="checked-btn">
                            <i data-uid=${obj.uid}></i>
                          </div>
                          <div class="checked-avatar">
                              <img src="img/${obj.lcon}.jpg">
                          </div>
                          <div class="checked-nick">
                                <h4>${obj.nick}</h4>
                          </div>
                       </li>
                    `;
                    }
                    _this.elem.contacts.html(html);
                    _this.elem.chatList.html(html2);
                    $(".content-scroll").css("height",data.length*66)
                }
            });
        },
        userLcon:function(_this){
            this.elem.panel.on("click",".avatar",function(e){
                e.stopPropagation();
                if(_this.elem.userInfoPOP.hasClass("sca")){
                    _this.elem.userInfoPOP.removeClass("sca");
                    _this.elem.userInfoPOP.hide();
                }else{
                    _this.elem.userInfoPOP.show();
                    setTimeout(function(){
                        _this.elem.userInfoPOP.addClass("sca")
                    },10)
                }
            });
        },
        userDetail:function(dom,_this,isFriend){
            var src=dom.find("img").attr("src"),
                nick=dom.find(".nickname").html(),
                account=dom.find("input").val(),
                uid=dom.find("input").data("uid");
            if(isFriend){
                var sign=dom.find(".user-sign").html(),
                    btn="detail-btn",
                    btnHtml="发消息";
            }else{
                sign="私密";
                btn="addFriendD";
                btnHtml="";
            }
            var html=`
               <div id="detail">
                            <div class="avatar">
                                <img src="${src}">
                            </div>
                            <div class="detail-nick">
                                <h4 class="d-n-name">${nick}</h4>
                            </div>
                            <div class="detail-info">
                                <h4 class="account">账号:${account}</h4>
                                <h4 class="location">签名:${sign}</h4>
                            </div>
                            <div class="text-center">
                                <button type="button" class="${btn}" data-uid="${uid}">${btnHtml}</button>
                            </div>
                        </div>
            `;
            _this.elem.chatName.html("详细信息");
            _this.elem.demoInner.html(html);
        },
        updateSign:function(_this){
            var oldSign="",
                newSign="";
            this.elem.signature.focus(function(){
                oldSign=$(this).val();
                $(this).addClass("active");
            });
            this.elem.signature.blur(function(){
                newSign=$(this).val();
                var that=$(this);
                if(newSign!==""&&newSign!==oldSign){
                    $.ajax({
                        type:"POST",
                        url:"updateSign",
                        data:{sign:newSign,uid:_this.uid},
                        success:function(data){
                            if(data.code>0){
                                that.removeClass("active");
                                alert("签名"+data.msg);
                            }
                        }
                    })
                }
            });
        },
        headerTab:function(_this){
            this.elem.headerNav.click(function(e){
                e.stopPropagation();
                $(this).next().toggleClass("show");
            });
            this.elem.main.click(function(){
                _this.elem.headerNav.next().removeClass("show");
                _this.elem.userInfoPOP.hide();
                $(" #friend-pop .friend").hide();
            });
            //头部tab
            this.elem.tab.on("click","i",function(e){
                $(".tab i").removeClass("active");
                var str="view-"+$(e.target).attr("class");
                $(".view").find("."+str+"").show().siblings().hide();
                $(e.target).addClass("active");
            });
        },
        allChat:function(_this){
            this.btn.chat.click(function(e){
                _this.elem.chatPop.show();
            });
            //发起聊天弹出框选择
            var personListArr=[];
            $(".personList").on("click","li",function(e){
                var uid=$(e.target).find(".checked-btn i").data("uid");
                if(!$(e.target).hasClass("active")){
                    $(e.target).addClass("active");
                    personListArr.push(uid);
                    _this.btn.chatPopBtn.addClass("active").html("确认("+personListArr.length+")")
                }else{
                    $(e.target).removeClass("active");
                    for(var i=0;i<personListArr.length;i++){
                        if(personListArr[i]==uid){
                            personListArr.removeByValue(uid);
                            break;
                        }
                    }
                    _this.btn.chatPopBtn.html("确认("+personListArr.length+")");
                    if(personListArr.length==0){
                        _this.btn.chatPopBtn.removeClass("active");
                        _this.btn.chatPopBtn.html("确认");
                    }
                }
            });
            //聊天弹出框搜索内容点击
            this.elem.chatPop.on("click",".contact-item",function(){
                var uid=$(this).find(".nickname").data("uid");
                        if(uid){
                    if(personListArr.indexOf(uid)==-1){
                        personListArr.push(uid);
                        $(this).remove();
                        $(_this.elem.select[1]).val("");
                        var items=_this.elem.chatPop.find(".checked-btn i");
                        items.each(function(){
                            if($(this).data("uid")==uid){
                                $(this).parent().parent().addClass("active");
                            }
                        });
                        _this.btn.chatPopBtn.html("确认("+personListArr.length+")").addClass("active");
                    }else{
                        $(this).remove();
                        $(_this.elem.select[1]).val("");
                    }
                }else{
                    $(this).remove();
                    $(_this.elem.select[1]).val("");
                }
            });
            //定义数组删除指定数据
            Array.prototype.removeByValue = function(val) {
                for(var i=0; i<this.length; i++) {
                    if(this[i] == val) {
                        this.splice(i, 1);
                        break;
                    }
                }
            };
            //发起聊天弹出框关闭
            $(" .chatPop-close").click(function(){
                _this.elem.chatPop.hide();
                _this.elem.chatPop.find("li").removeClass("active");
                _this.btn.chatPopBtn.removeClass("active").html("确认");
                personListArr.length=0;
            });
        },
        search:function(_this){
            var divs= this.elem.select;
            for(var i=0;i<divs.length;i++){
                divs[i].onfocus=function(){
                    $(this).next().show();
                };
                divs[i].onkeyup=function(){
                    var kw=this.value;
                    var _this=this;
                    var divs=$(".view .nickname"),
                        html="";
                    var arr=[];
                    if(kw.indexOf(" ")==-1){
                        for(var i=0;i<divs.length;i++){
                            var t=$(divs[i]).html().indexOf(kw);
                            if(t>0){
                                var nick=$(divs[i]).html(),
                                    avatar=$(divs[i]).parent().prev().children().attr("src"),
                                    uid=$(divs[i]).next().next().data("uid"),
                                    uname=$(divs[i]).parent().find("input").val();
                                var obj={};
                                obj.nick=nick;obj.avatar=avatar;obj.uid=uid;obj.uname=uname;
                                arr.push(obj);
                            }
                        }
                        if(arr.length==0){
                            html=`<div class="contact-item float-clear">
                                <div class="user-avatar">
                                    <img src="">
                                </div>
                                <div class="user-name">
                                    <h4 class="nickname">
                                       找不到匹配的结果
                                    </h4>
                                </div>
                            </div>`;
                        }else{
                            var tmp=[];
                            for(var i=0;i<arr.length;i++){
                                if(i==0){
                                    tmp.push(arr[0])
                                }else{
                                    for(var c=0;c<tmp.length;c++){
                                        if(tmp[c].uid!==arr[i].uid){
                                            tmp.push(arr[i]);
                                        }
                                    }
                                }
                            }
                            for(var i=0;i<tmp.length;i++){
                                html+= html+=`
                             <div class="contact-item float-clear">
                                <div class="user-avatar">
                                    <img src="${arr[i].avatar}">
                                </div>
                                <div class="user-name">
                                    <h4 class="nickname" data-uid="${arr[i].uid}">
                                       ${arr[i].nick}
                                    </h4>
                                    <input type="hidden" value="${arr[i].uname}">
                                </div>
                            </div>
                       `;
                            }
                        }
                        $(_this).next().html(html);
                    }
                };
            }
            //头部搜索框失去焦点
            this.elem.select[0].onblur=function(){
                var _this=$(this);
                setTimeout(function(){
                    _this.next().hide().html("");
                    _this.val("");
                },300)
            };
            //头部搜索框点击开始新的会话
            $(".panel").off("click",".contact-item").on("click",".contact-item",function(){
                _this.elem.subItem.hide().html("");
                var uid=$(this).find(".nickname").data("uid"),
                    rname=$(this).find("input").attr("value");
                _this.elem.select.val("");
                _this.chatHistoryLoad(uid,_this);
                if(uid){
                    if(_this.onlineUser.indexOf(uid)==-1){
                        _this.onlineUser.push(uid);
                    }
                    _this.elem.chatName.html($(this).find(".nickname").html());
                    _this.elem.demoInner.empty();
                    //_this.bufferDataFetch(uid);
                    _this.demoInnerScroll();
                    //绑定enter键
                    _this.enterOnKeyDown(uid,_this,rname);
                    _this.sendEmoji(uid,_this,rname);
                }
            });
        },
        exit:function(){
            this.btn.exit.click(function(){
                sessionStorage.clear();
                location.href="login.html";
            })
        },
        connectionServer:function(){
            var _this=this;
            var sign=$("#signature").val();
            this.socket = io.connect();
            this.socket.emit("new user",(this.uname),(this.nick),this.uid,this.lcon);
            this.socket.on("login",(msg)=>{
                var onLineUserList=JSON.parse(msg);
                var html="";
                for(var i=0;i<onLineUserList.length;i++){
                    var obj=onLineUserList[i];
                    html +=`
                    <div class="contact-item float-clear">
                            <div class="user-avatar">
                                <img src="img/${obj.lcon}.jpg">
                            </div>
                            <div class="user-name">
                                <h4 class="nickname">
                                   ${obj.nick}
                                </h4>
                                <h4 class="user-state">在线</h4>
                                <input type="hidden" value="${obj.uname}" data-uid="${obj.uid}">
                            </div>
                        </div>
                `;
                }
                this.elem.viewMsg.html(html);
            });
        },
        sendMsg:function(isLeft,uid,_this,rname){
            $("#send").off().click(function(){
                var msg=null;
                _this.sendMsgTxt(isLeft,uid,_this,msg,rname);
            });
        },
        sendMsgTxt:function(isLeft,uid,_this,msg,rname){
            var isAppend=true;
            var showTime=this.getTime();
            if(msg==null){
                if($(" #userTxt  ").val()!==""&&$(" #userTxt ").val()!==" "){
                    this.socket.emit('send private message', $("#userTxt").val(),uid,parseInt(this.uid),showTime,rname);
                    this.showMsg(uid,isLeft,showTime,$(" #userTxt").val(),this.nick,this.lcon,isAppend);
                }
            }else{
                this.socket.emit('send private message',msg,uid,parseInt(this.uid),showTime,rname);
                this.showMsg(uid,isLeft,showTime,msg,this.nick,this.lcon,isAppend);
            }
            $("#userTxt").val("");
        },
        getTime:function(){
            var nowTime=new Date().getTime();
            this.lastTimer.push(nowTime);
            if(nowTime-this.lastTimer[0]>50000){
                nowTime=new Date(nowTime).toLocaleTimeString();
                this.showTime=nowTime;
                this.lastTimer.length=0;
            }else{
                this.showTime="null";
            }
            return  this.showTime;
        },
        showMsg:function(uid,isLeft,showTime,msg,nick,lcon,isAppend){
           var html=this.showMsgMainHtml(uid,isLeft,showTime,msg,nick,lcon);
            if(isAppend){
                $(".demo-inner").append(html);
            }else{
                $(".demo-inner").html(html)
            }
            this.msgToDataBuffer(uid,html,false);
            this.demoInnerScroll();
        },
        showMsgMainHtml:function(uid,isLeft,showTime,msg,nick,lcon){
            var html="";
            if(showTime=="null"){
                showTime=" ";
            }
            html=`
                  <div class="items float-clear">
                            <div class="timer">
                                <div class="msg-timer">
                                    ${showTime}
                                </div>
                            </div>
                            <div class="userInfo">
                                <div id="${isLeft}">
                                    <div class="user-lcon">
                                        <img src="img/${lcon}.jpg">
                                    </div>
                                    <div class="userMsg">
                                        <div class="username">
                                           ${nick}
                                        </div>
                                        <div class="usertxt">
                                            ${msg}
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
            `;
            return html;
        },
        msgToDataBuffer:function(uid,html,isPrepend){
            if(this.dataBufferUid.indexOf(uid)==-1){
                this.dataBufferUid.push(uid);
                var htmlBuffer=`<div class="itemSub${uid}">`;
                htmlBuffer+=html+`</div>`;
                if(isPrepend){
                    this.elem.dataBuffer.prepend(htmlBuffer);
                }else{
                    this.elem.dataBuffer.append(htmlBuffer);
                }
            }else{
              if(isPrepend){
                  this.elem.dataBuffer.find(".itemSub"+uid+"").prepend(html);
              }else{
                  this.elem.dataBuffer.find(".itemSub"+uid+"").append(html);
              }
            }
        },
        enterOnKeyDown:function(uid,_this,rname){
            $(window).off("onkeydown");
            $("#userTxt").focus(function(){
                window.onkeydown=function play(){
                    if(event.keyCode==13){
                        var isLeft="info-left";
                        event.returnValue = false;
                        var msg=null;
                        _this.sendMsgTxt(isLeft,uid,_this,msg,rname);
                    }
                };

            })
        },
        msgAudio:function(isPlay){
            if(isPlay){
                this.elem.audio[0].play();
            }
        },
        sendFace:function(){
            if ($(" #face-pop").hasClass("show")) {
                $("#face-pop").hide().removeClass("show");
            } else {
                $("#face-pop").show();
                setTimeout(function () {
                    $("#face-pop").addClass("show");
                },100)
            }
        },
        sendEmoji:function(uid,_this,rname){
            $(" #face-pop img").off();
            $(" #face-pop").off().on("click","img",function(){
                var str=$(this).attr("class");
                var msg=`
            <img src="img/${str}.gif">
          `,
                    isLeft="info-left",
                    showTime=_this.getTime(),
                    isAppend=true;
                _this.sendMsgTxt(isLeft,uid,_this,msg,rname);
                $("#face-pop").hide();
            })
        },
        bgTurn:function(){
            var i=parseInt(Math.random()*3+2);
            turn(i);
            $(".skin").on("click","a i",function(e){
                var str=$(e.target).attr("class");
                if(str==='prev'){
                    i++;
                    if(i==6){
                        i=1;
                    }
                    turn(i);
                }else{
                    if(i!==1){
                    i--;
                    if(i==1){
                        i=6;
                    }}
                    turn(i);
                }
            });
            function turn(i){
                var src="img/"+i+".jpg";
                $(" #bg-pic img").attr("src",src);
            }
        },
        mouseRightDown:function(isFriend,isMyFriend){
            var e = event || window.event;
            var scrollX = document.documentElement.scrollLeft || document.body.scrollLeft;
            var scrollY = document.documentElement.scrollTop || document.body.scrollTop;
            var x = e.pageX || e.clientX + scrollX;
            var y = e.pageY || e.clientY + scrollY;
           if(isFriend){
               $(" #friend-pop .friend").show().css({
                   top:y,
                   left:x
               }).find("#addFriend").show().html("删除好友").parent().show();
               $(" #friend-pop .friend ").find("#checkUserDetail").parent().hide();
           }else{
               if(isMyFriend){
                   $(" #friend-pop .friend").show().css({
                       top:y,
                       left:x
                   }).find("#addFriend").show().html("添加好友").parent().show();
                   $(" #friend-pop .friend ").find("#checkUserDetail").parent().show();
               }else{
                   $(" #friend-pop .friend").show().css({
                       top:y,
                       left:x
                   }).find("#addFriend").parent().hide();
                   $(" #friend-pop .friend ").find("#checkUserDetail").parent().show();
               }
           }
        },
        msgTipRedCircle:function(uid){
            var inputs=$(".view-contact").find("input");
            var $this;
            for(var i=0;i<inputs.length;i++){
                if($(inputs[i]).data("uid")==uid){
                   $this=$(inputs[i]);
                    break;
                }
            }
           $this.parent().prev().find(".redCircle").addClass("active");
        },
        bufferDataFetch:function(uid){
            var html=this.elem.dataBuffer.find(".itemSub"+uid+"").html();
            this.elem.demoInner.html(html);
        },
        addFriend:function(nick,uid){
            $("#aboutFriend").show();
            $(".operateTitle").html("添加好友");
            $(".operateInfo").html("您确定要添加好友 <span class='nickname'>"+nick+"</span> 吗？");
            $(".remark").show();
            $(".remarks").show();
            $(".agree").off("click");
            var _this=this;
            $(".agree ").click(function(){
                var   remark=$(".remarks").val();
                _this.agreeAddFriend(remark,uid);
                $("#aboutFriend").hide();
            });
            this.cancelDeleteFriend();
        },
        addFriendSuccess:function(suid,_this){
            $.ajax({
                type:"GET",
                url:"searchUser",
                data:{uid:suid},
                success:function(data){
                    var obj=data[0];
                    $.ajax({
                        type:"POST",
                        url:"addContacts",
                        data:{tid:_this.uid,sign:obj.usign,nick:obj.unick,lcon:obj.ulcon,uname:obj.uname,uid:obj.uid},
                        success:function(data){
                            _this.loadContactsList(_this);
                        }
                    })
                }
            })
        },
        addFriendMsgBack:function(nick,suid,isAgree){
            this.socket.emit("agree add friend msgBack",nick,this.uid,suid,isAgree)
        },
        chatHistoryLoad:function(uid,_this){
            $.ajax({
                type:"GET",
                url:"chatHistoryLoad",
                data:{uid1:uid,uname:this.uname},
                success:function(data){
                    for(var i=0;i<data.length;i++){
                        var obj=data[i];
                        if(obj.isLeft==1){
                           var  isLeft="info-left";
                        }else{
                            isLeft="info-right";
                        }
                        var html=  _this.showMsgMainHtml(obj.uid1,isLeft,obj.time,obj.content,obj.nick,obj.lcon);
                        _this.msgToDataBuffer(obj.uid1,html,true);
                    }
                }
            });

        },
        demoInnerScroll:function(){
            $(".demo-inner")[0].scrollTop=$(" .demo-inner ")[0].scrollHeight;
        },
        deleteFriend:function(nick,uid,_this,that){
            $("#aboutFriend").show();
            $(".operateTitle").html("删除好友");
            $(".operateInfo").html("您确定要删除好友 <span class='nickname'>"+nick+"</span> 吗？");
            $(".remark").hide();
           this.agreeDeleteFriend(uid,_this,that);
           this.cancelDeleteFriend();
        },
        agreeDeleteFriend:function(uid,_this,that){
            $(" .confirm .agree").off("click");
            $(".confirm .agree").click(function(){
                $.ajax({
                    type:"POST",
                    url:"/deleteFriend",
                    data:{tid:_this.uid,uid:uid},
                    success:function(data){
                        if(data.code>0){
                            $("#aboutFriend").hide();
                            that.remove();
                            _this.loadContactsList(_this);
                        }
                    }
                })
            })
        },
        cancelDeleteFriend:function(){
            $(" #aboutFriend .cancel").click(function(){
                $("#aboutFriend").hide();
            })
        },
        agreeAddFriend:function(remark,uid){
            this.socket.emit("addFriend",remark,uid,this.nick,this.uname,this.uid);
        },
        fileUpload:function(isLeft,uid,_this,rname){
            var file=$("#file")[0];$(file).off();
            file.onchange=function(){
                var formData=new FormData();
                formData.append('file',file.files[0]);
                var src=file.files[0].name,
                    formart=src.split(".")[1];
                if(formart=="jpg"||formart=="png"||formart=="jpeg"||formart=="gif"||formart=="docx"||formart=="txt"||formart=="ppt"||formart=="xlsx"||formart=="zip"||formart=="rar"||formart=="doc"){
                    $.ajax({
                        url: '/upload',
                        type: 'POST',
                        data: formData,
                        cache: false,
                        contentType: false,
                        processData: false,
                        success: function(data){
                            if(data.code>0){
                                var src=data.data;
                                if(formart=="docx"||formart=="txt"||formart=="doc"){
                                    var className="docx";
                                    var msg=`<a href="${src}"><i class="${className}"></i></a>`;
                                }else if(formart=="ppt"){
                                        className="ppt";
                                    msg=`<a href="${src}"><i class="${className}"></i></a>`;
                                }else if(formart=="xlsx"){
                                        className="xlsx";
                                    msg=`<a href="${src}"><i class="${className}"></i></a>`;
                                }else if(formart=="zip"||formart=="rar"){
                                        className="zip";
                                    msg=`<a href="${src}"><i class="${className}"></i></a>`;
                                }else{
                                    msg=`<a href="javascript:;" class="picCheck"><img src="${src}"></a>`;
                                }
                                _this.sendMsgTxt(isLeft,uid,_this,msg,rname);
                                _this.demoInnerScroll();
                            }
                        },
                        error: function(){
                            $("#result").html("与服务器通信发生错误");
                        }
                    });
                }else{
                    alert("文件格式不支持上传")
                }

            }

        },
        picCheck:function(){
            this.elem.demoInner.on("click",".picCheck img",function(){
                var src=$(this).attr("src");
                $("#picCheck ").show();
                $(" #picCheck ").find("img").attr("src",src);
                $("#picCheck").find(".picClose").click(function(){
                    $("#picCheck ").hide();
                    $("#picCheck").find("img").attr("src","");
                })
            })
        }
    };

}();