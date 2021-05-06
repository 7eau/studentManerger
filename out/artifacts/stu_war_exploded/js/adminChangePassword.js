/**
 * Created by chenkexuan on 2017/4/27.
 */

/**
 * edited and modified by dengxionghui on 2018/6/21
 */

$(document).ready(function(){
    initClick();
});


var initClick = function(){

        $("#update").click(function(){
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
                                window.parent.$("#msgwindow").dialog('destroy');
                            }else{
                                window.parent.$("#msgwindow").dialog('destroy');
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
