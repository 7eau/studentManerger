/**
 * Created by chenkexuan on 2017/4/27.
 */

/**
 * edited and modified by dengxionghui on 2018/6/21
 */

$(document).ready(function(){
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

        $("#update").click(function(){
            var pubkey = $("#pubkey").val();
            var adminName = $("#adminName").val();
            var adminUserName = $("#adminUserName").val();
            var adminId= $("#adminId").val();
            var adminOldPassword = $.trim($("#currentPassword").val());
            var adminNewPassword = $.trim($("#newPassword").val());
            var adminConfirmPassword = $.trim($("#confirmPassword").val());
            var role = 'manager';

            if(adminOldPassword==='' || adminNewPassword==='' || adminConfirmPassword==='')
            {
                $.messager.alert({
                    title:"提示",
                    icon:"error",
                    msg:"密码不能为空！"
                    });
                $("#reset").click();
                return;
            }

            if (adminNewPassword != adminConfirmPassword) {
                $.messager.alert({
                    title:"提示",
                    icon:"error",
                    msg:"两次输入的密码不一致!"
                });
                $("#reset").click();
                return;
            }

            adminOldPassword = encodePwd(pubkey, adminOldPassword);
            $("#currentPassword").val(adminOldPassword);
            adminNewPassword = encodePwd(pubkey, adminNewPassword);
            $("#newPassword").val(adminNewPassword);


            if(checkOldPassword(adminUserName,adminOldPassword,role)===false)
            {
                $.messager.alert({
                    title:"提示",
                    icon:"error",
                    msg:"旧密码错误！"
                });
                $("#reset").click();
                return;
            }

            $.ajax({
                async:false,
                url:"/stu/user/updateAdminPassword.do",
                type:"POST",
                data:{
                    adminId:adminId,
                    newPassword:adminNewPassword,
                    role:role
                },
                success:function(result){
                    if(result.code){
                        $.messager.confirm("提示",result.msg,function(r){
                            if(r){
                                window.parent.$("#msgwindow").dialog('close');
                            }else{
                                window.parent.$("#msgwindow").dialog('close');
                            }
                        });
                    }else{
                        $.messager.confirm("提示",result.msg,function(r){
                            if(r){
                                // window.location.href='/login.jsp';
                                window.parent.$("#msgwindow").dialog('destroy');
                            }
                        });
                    }
                }
            });
        });
        $("#reset").click(function (){
           $("#currentPassword").val("");
           $("#newPassword").val("");
           $("#confirmPassword").val("");
        });
};

var checkOldPassword=function (adminName,adminPassword,role) {

    var check=undefined;

    $.ajax({
        async:false,    //登陆时关闭异步
        url:"/admin/checkAdminPwd.do",
        type:"POST",
        data:{
            username:adminName,
            password:adminPassword
        },
        success:function(result){
            if(result.code){
                check=true;
            }else{
                check=false;
            }
        }
    });

    return check;
}

var encodePwd = function(pubkey, password) {
    // 加密
    var encrypt = new JSEncrypt();
    encrypt.setPublicKey(pubkey);
    var encryped = encrypt.encrypt(password);
    return encryped;
}
