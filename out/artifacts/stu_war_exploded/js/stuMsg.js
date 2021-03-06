/**
 * Created by chenkexuan on 2017/4/27.
 */

/**
 * edited by dengxionghui on 2018/6/21
 */
$(document).ready(function(){
    initMsg();
    initClick();
});
var initMsg = function(){
    var stuId = $("#userId").val();
    $.ajax({
        url:"/stu/student/getStuMsg.do",
        type:"POST",
        data:{
            stuId:stuId
        },
        success:function(result){
            $("#idcard").val(result.data.idcard);
            $("input[name='sex']").each(function(){
                if($(this).val()==result.data.sex){
                    $(this).attr("checked","checked");
                }
            });
            $("#phone").val(result.data.phone);
            $("#qq").val(result.data.qq);
            $("#email").val(result.data.email);
            $("#address").val(result.data.address);
            if(result.data.reset==='0'){
                $("#resetPassword").css("display","block");
                $("#username").val(result.data.username);
            }else{
                $("#resetPassword").css("display","none");
            }
            var classes = result.data.level + "级 " + result.data.majorName + " " + result.data.number + "班";
            $("#classes").val(classes);
        }
    });
};

var initClick = function(){
    $("#subUpdateBtn").click(function(){
        var stuId = $("#userId").val();
        var idcard = $("#idcard").val();
        var sex = $("input[name='sex']:checked").val();
        var phone = $("#phone").val();
        var qq =  $("#qq").val();
        var email = $("#email").val();
        var address = $("#address").val();
        $.ajax({
            url:"/stu/student/updateMsg.do",
            type:"POST",
            data:{
                stuId:stuId,
                idcard:idcard,
                sex:sex,
                phone:phone,
                qq:qq,
                email:email,
                address:address
            },
            success:function(result){
                $.messager.confirm("提示信息",result.msg,function(r){
                    if(r){
                       window.location.reload();
                    }else{
                        window.location.reload();
                    }
                });
            }
        });
    });


    $("#resetPasswordBtn").click(function(){
        var stuId = $("#userId").val();
        var username = $("#username").val();
        var password = $("#password").val();
        var repassword = $("#repassword").val();
        $.ajax({
            url:"/stu/student/resetAccount.do",
            type:"POST",
            data:{
                stuId:stuId,
                username:username,
                password:password,
                repassword:repassword,
            },
            success:function(result){
                if(result.code){
                    $.messager.confirm("提示消息",result.msg,function(r){
                        if(r){
                            window.location.reload();
                        }else{
                            window.location.reload();
                        }
                    });
                }else{
                    $.messager.alert("提示消息",result.msg);
                }
            }
        });
    });

    // 修改密码窗格
    $("#changePassword").click(function (){
        // $.messager.alert("提示", "点击了按钮！");
        showMessageDialog('studentChangePassword.jsp', '修改密码', 800, 400, true);
    })

    //url：窗口调用地址，title：窗口标题，width：宽度，height：高度，shadow：是否显示背景阴影罩层
    function showMessageDialog(url, title, width, height, shadow) {
        var content = '<iframe src="' + url + '" width="100%" height="100%" frameborder="0" scrolling="no"></iframe>';
        var boarddiv = '<div id="msgwindow" title="' + title + '" style="overflow: hidden"></div>'//style="overflow:hidden;"可以去掉滚动条
        $(document.body).append(boarddiv);
        var win = $('#msgwindow').dialog({
            content: content,
            width: width,
            height: height,
            modal: shadow,
            title: title,
            onClose: function () {
                $(this).dialog('destroy');//后面可以关闭后的事件
                window.location.reload();
            }
        });
        win.dialog('open');
    }
};
