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
    var tid = $("#tid").val();
    $.ajax({
        url:"/teacher/getTeacherMsg.do",
        type:"POST",
        data:{
            tid:tid
        },
        success:function(result){
            $("#name").val(result.data.name);
            $("input[name='sex']").each(function(){
                if($(this).val()==result.data.sex){
                    $(this).attr("checked","checked");
                }
            });
            $("#phone").val(result.data.phone);
            $("#email").val(result.data.email);
            $("#adName").html('欢迎您：'+result.data.name+'<span class=\"caret\"></span>');
        }
    });
};

var initClick = function(){
    $("#subUpdateBtn").click(function(){
        var tid = $("#tid").val();
        var name = $("#name").val();
        var sex = $("input[name='sex']:checked").val();
        var phone = $("#phone").val();
        var email = $("#email").val();
        $.ajax({
            url:"/teacher/getTeacherMsg.do",
            type:"POST",
            data:{
                id:tid,
                name:name,
                sex:sex,
                phone:phone,
                email:email
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
    // 修改密码窗格
    $("#changePassword").click(function (){
        // $.messager.alert("提示", "点击了按钮！");
        showMessageDialog('adminChangePassword.jsp', '修改密码', 800, 400, true);
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
            }
        });
        win.dialog('open');
    }
};
