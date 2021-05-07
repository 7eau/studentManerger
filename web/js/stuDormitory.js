/**
 * Created by chenkexuan on 2017/4/27.
 */

/**
 * edited by dengxionghui on 2018/6/21
 */
$(document).ready(function(){
    initMsg();
});
var initMsg = function(){
    var stuId = $("#userId").val();
    $.ajax({
        url:"/stu/dormitory/getStuDormitoryInfo.do",
        type:"POST",
        data:{
            stuId:stuId
        },
        success:function(result){
            if(result.data!=undefined) {
                $("#zone").val(result.data.zone_name);
                $("#building").val(result.data.building);
                $("#room").val(result.data.room);
            }
            else
            {
                $.messager.alert("提示消息", "该学生目前没有住宿信息！")
                // alert("该学生目前没有住宿信息！");
                $("#zone").val("没有住宿信息!");
                $("#building").val("没有住宿信息!");
                $("#room").val("没有住宿信息!");
            }
        }
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

