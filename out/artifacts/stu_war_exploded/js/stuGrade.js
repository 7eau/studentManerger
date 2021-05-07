/**
 * Created by chenkexuan on 2017/4/27.
 */

/**
 * edited by dengxionghui on 2018/6/21
 */
$(document).ready(function(){
    initDataGrid();
    initJD();
});
var initDataGrid = function(){
    var stuId = $("#userId").val();
    $("#studentGradeBox").datagrid({
        url:"/stu/grade/getGrade.do",
        width:'auto',   //表格宽度
        height:'500px',
        columns:[[
            {field:'id',title:'编号',width:'auto',hidden:'true'},
            {field:'name',title:'课程名称',width:'200',align : 'center'},
            {field:'courseType',title:'课程类型',width:'200',align : 'center'},
            {field:'courseScore',title:'学分',width:'100',align : 'center'},
            {field:'score',title:'得分',width:'100',align : 'center',
                formatter:function(value, row, index) {
                    if (row.score == undefined || row.score == "") {
                        var str = '暂无';
                        return str;
                    }else{
                        var str = row.score;
                        return str;
                    }
                }
            }
        ]],
        border:false,
        pagination:true,
        pageList:[18,25,30,40,50],
        pageSize:18,
        striped:true,
        nowrap:true,
        autoRowHeight:true,
        checkOnSelect:true,
        fitColumns:true,
        loadMsg:'怕是等一下哦',
        toolbar:"#toolBar",
        queryParams:{
            stuId:stuId
        }
    });
};
var initJD = function(){
    var stuId = $("#userId").val();
    $.ajax({
        url:"/stu/grade/getJD.do",
        type:"POST",
        data:{
            stuId:stuId
        },
        success:function(result){
            if(result.code){
                if(result.score!=undefined) {
                    $("#MsgBtn").html("绩点：" + result.score);
                }
                else
                {
                    $("#MsgBtn").html("绩点：还没有成绩!");
                }
            }else{
                $("#MsgBtn").html("绩点："+result.msg);
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