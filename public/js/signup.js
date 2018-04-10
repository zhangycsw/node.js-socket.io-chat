+function(){
    var flag = {
        "uname":false,
        "nickname":false,
        "password":false,
        "checkbox":false
    };
//成功函数
    function success(dom){
        dom.removeClass("active");
        dom.next().html('<i class="success lf"></i>');
    }
//失败函数
    function fail(dom){
        dom.addClass("active");
        dom.next().html('<i class="fail lf"></i>账号格式不正确');
    }
//不能为空
    function isEmpty(dom){
        dom.addClass("active");
        dom.next().html('<i class="fail lf"></i>不能为空');
    }
//长度不能小于四位
    function four(dom){
        dom.addClass("active");
        dom.next().html('<i class="fail lf"></i>长度不能少于四位');
    }
//长度不能大于四位
    function tw(dom){
        dom.addClass("active");
        dom.next().html('<i class="fail lf"></i>长度不能大于三十位');
    }
    $("#nickName").focus(function(){
        $(this).removeClass("active");
        $(this).next().html("昵称不能出现特殊字符");
        $(this).next().removeClass("animate");
    });
    $("#nickName ").blur(function(){
        var nick=$(this).val();
        $(this).next().addClass("animate");
        if(nick.length<1){
            isEmpty($(this));
        }else if(nick.length<2){
            four($(this));
        }else if(nick.length>15){
            tw($(this));
        }else{
            $(this).removeClass("active");
            success($(this));
            flag.nickname=true;
        }
    });
    $(" #userName").focus(function(){
        $(this).next().html("帐号须由字母开头或者手机号");
        $(this).next().removeClass("animate");
    });
    $("#userName").blur(function (){
        var uname = $(this).val();
        var reg=/^[a-zA-Z][a-zA-Z0-9_]{4,15}$/;
        var $this=$(this);
        $(this).next().addClass("animate");
        if(uname.length<1){
            isEmpty($(this));
        }else if(uname.length<4){
            four($(this));
        }else if(uname.length>30){
            tw($(this));
        }else{
            if (reg.test(uname)) {
                $.ajax({
                    type:"POST",
                    url:"register-search",
                    data:{uname:uname},
                    success:function(data){
                        if(data.code>0){
                            $this.next().html("<i class='success'></i>"+data.msg);
                            $("#userName").addClass("success");
                        }else{
                            $this.next().html(`<i class="fail"></i>${data.msg}`);
                        }
                    }
                });
            }else{
                fail($(this));
            }
        }
    });
// 密码校验
    $(" #userPwd").focus(function(){
        $(this).next().html("必须为字母加数字且长度不小于8位");
        $(this).next().removeClass("animate");
    });
    $("#userPwd").blur(function(){
        var password=$(this).val();
        var reg=/^(?![^a-zA-Z]+$)(?!\D+$)/;
        $(this).next().addClass("animate");
        if(password.length<1){
            isEmpty($(this));
        }else if(password.length<4){
            four($(this));
        }else if(password.length>20){
            tw($(this));
        }else{
            if(!reg.test(password)){
                $(this).addClass("active");
                $(this).next().html('<i class="fail lf"></i>密码必须包含数字和字母');
            }else{
                $(this).removeClass("active");
                success($(this));
                flag.password=true;
                if($("#userName").hasClass("success")){
                    flag.uname=true;
                }
                obj.upwd=true;
            }
        }
    });
//头像选取
    var arr=["lcon1"];
    $(".lcon").on("click","img",e=>{
        arr.length=0;
        $(e.target).parent().addClass("active").siblings().removeClass("active");
        var str=$(e.target).data("role");
        arr.push(str);
    });
//点击错误提示清除
    $(".main").on("click","i",function(e){
        $(e.target).parent().prev().removeClass("active");
        $(e.target).parent().empty();
    });
//注册表单提交
    $("#submit").click(function (){
        var ok = flag.uname&&flag.nickname&&flag.password;
        var $this=$(this);
        if(ok==true){
            var nick=$("#nickName").val();
            var uname=$("#userName").val();
            var password=$("#userPwd").val();
            var lcon=arr[0];
            $.ajax({
                type:"POST",
                url:"register",
                data:{nick:nick,password:password,uname:uname,lcon:lcon},
                success:function(data){
                    if(data.code>0){
                        $.ajax({
                            type:"POST",
                            url:"/createTable",
                            data:{uname:uname},
                            success:function(data){
                                console.log(data)
                            }
                        });
                        var n=3;
                        var timer=setInterval(function(){
                            if(n>0){
                                n--;
                                $this.html("注册成功"+n+"秒后跳转登录");
                            }else{
                                location.href="login.html";
                            }
                        },1000);
                    }else{
                        alert("注册失败，请检查您的网络连接");
                    }
                }
            })
        }else{
            alert("请正确填写信息");
        }
    });


//登录
    var obj={
        "username":false,
        "upwd":false
    };
    $(" #username").focus(function(){
        $(this).next().html("帐号须由字母开头或者手机号");
        $(this).next().removeClass("animate");
    });
    $("#username").blur(function(){
        var uname = $(this).val();
        var reg=/^[a-zA-Z][a-zA-Z0-9_]{4,15}$/;
        var $this=$(this);
        $(this).next().addClass("animate");
        if(uname.length<1){
            isEmpty($(this));
        }else if(uname.length<4){
            four($(this));
        }else if(uname.length>30){
            tw($(this));
        }else{
            if (reg.test(uname)) {
                success($(this));
                obj.username=true;
            }else{
                fail($(this));
            }
        }
    });
// 登录表单提交
    $("#login").click(function(){
        var uname=$("#username").val();
        var upwd=$("#userPwd").val();
        console.log(uname,upwd);
        if(obj.upwd&&obj.username){
            $.ajax({
                type:"POST",
                url:"login",
                data:{uname:uname,upwd:upwd},
                success:function(data){
                    if(data.code>0){
                        sessionStorage['uid']=data.uid;
                        sessionStorage['ulcon']=data.ulcon;
                        sessionStorage['uname']=data.uname;
                        sessionStorage['unick']=data.unick;
                        location.href="index.html";
                        if($("#chb").is(":checked")){
                            localStorage.setItem('uname',data.uname);
                        }
                    }else{
                        $("#login-msg").html("<i class='fail'></i>账号或者密码错误")
                    }
                }
            })
        }

    });
}();