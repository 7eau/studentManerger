/**
 * Created by chenkexuan on 2017/4/27.
 */

/**
 * edited and modified by dengxionghui on 2018/6/21
 */

$(document).ready(function(){
    $('#signup').attr('disabled',"true");
    readyForLogin();
    initClick();
});

// 获取RAS公钥
var readyForLogin = function () {
    $.ajax({
        async:true,    //登陆时关闭异步，否则登陆成功提示不成功
        url:"/stu/user/getRSAKey.do",
        type:"GET",
        data:{
            code:Math.random()
        },
        success:function(result) {
            if(result.code) {
                //获取成功
                $("#pubkey").val(result.pubkey);
            } else {
                //获取失败
                console.log("【login.js/readyForLogin()】获取公钥失败");
            }
        }
    });
}


var initClick = function(){


    $("#login").click(function(){
        let pubkey = $("#pubkey").val();
        var username = $("#username").val();
        var password = $("#password").val();
        var role = $("input[name='role']:checked").val();
        var checkCode = $("#checkCode").val();


        if(username==='') {
            $.messager.alert({
                title:"提示",
                icon:"error",
                msg:"请填写用户名！"
            });
            return
        } else if(username.length<2) {
            $.messager.alert({
                title:"提示",
                icon:"error",
                msg:"用户名长度不能小于2！"
            });
            return
        } else if(username.length>12) {
            $.messager.alert({
                title:"提示",
                icon:"error",
                msg:"用户名长度不能大于12！"
            });
            return
        }

        if(password==='')
        {
            $.messager.alert({
                title:"提示",
                icon:"error",
                msg:"请填写密码！"
            });
            return
        }

        password = encodePwd(pubkey);

        $.ajax({
            async:false,    //登陆时关闭异步，否则登陆成功提示不成功
            url:"/stu/user/userLogin.do",
            type:"POST",
            data:{
                username:username,
                password:password,
                role:role,
                checkCode:checkCode
            },
            success:function(result) {
                if(result.code) {
                    //登陆成功
                    window.location.href=result.url;
                } else {
                    $.messager.alert("提示消息",result.msg);
                    $("#password").val("");
                    $("#checkCode").val("");
                    $("#checkImg").click();
                }
            }
        });
    });

    $("#signup").click(function() {
        window.location.href='/signup.jsp';
    });

    $("#checkImg").click(function () {
        this.src = "/stu/user/checkCode.do?q=" + Math.random();
    });

    $("#reset").click(function () {
        $("#username").val("");
        $("#password").val("");
        $("#checkCode").val("");
        $("#checkImg").click();
    })


    var encodePwd = function(pubkey) {
        // 获取密码
        var password = $("#password").val();
        // 加密
        var encrypt = new JSEncrypt();
        encrypt.setPublicKey(pubkey);
        var encryped = encrypt.encrypt(password);
        // 修改input框的密码
        $("#password").val(encryped);
        return encryped;
    }
};
