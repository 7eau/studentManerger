/**
 * Created by chenkexuan on 2017/4/27.
 */

/**
 * edited by dengxionghui on 2018/6/21
 */
$(document).ready(function(){
    initDataGrid();
    initClick();
});

var initClick = function () {
    $("#AFLBtn").click(function(){
        $("#dd").dialog({
            title:"请假信息填写",
            width:400,
            height:'auto'
        });
    });

    $("#subAddAFLBtn").click(function(){

        var stuId = $("#userId").val();
        var reason = $("#afl-reason").val();
        var start_time = $("#afl-start-time").val();
        var end_time = $("#afl-end-time").val();

        if(reason==undefined)
        {
            alert("请填写理由");
            return;
        }

        $.ajax({
            url:"/stu/askforleave/addStuAFL.do",
            type:"POST",
            data:{
                stuId:stuId,
                reason:reason,
                start_time:start_time,
                end_time:end_time
            },
            success:function(){
                $.messager.confirm("提示","添加请假信息成功!",function(r){
                    if(r){
                        $("#dd").dialog('close');
                        $("#studentAFLContent").datagrid("load");
                    }else{
                        $("#dd").dialog('close');
                        $("#studentAFLContent").datagrid("load");
                    }
                });
            },
            error:function(){
                $.messager.alert({
                    title:"提示消息",
                    icon:"error",
                    msg:"添加请假信息失败！"
                });
            }
        });
    });
    // 修改密码窗格
    $("#changePassword").click(function (){
        // $.messager.alert("提示", "点击了按钮！");
        showMessageDialog('studentChangePassword.jsp', '修改密码', 800, 400, true);
    });

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
    };
}

var initDataGrid = function(){
    var stuId = $("#userId").val();
    $("#studentAFLContent").datagrid({
        url:"/stu/askforleave/getStuAFL.do",
        width:'auto',   //表格宽度
        height:'500px',
        columns:[[
            {field:'id',title:'编号',width:'auto',hidden:'true'},
            {field:'reason',title:'请假原因',width:'400',align : 'center'},
            {field:'start_time',title:'开始时间',width:'100',align : 'center'},
            {field:'end_time',title:'结束时间',width:'100',align : 'center'},
            {field:'approve',title:'批准状态',width:'100',align : 'center',
                formatter:function(value, row, index) {
                    if (row.approve == undefined || row.approve == '0') {
                        var str = '<font style="color:gold;">待批准</font>';
                        return str;
                    }else if(row.approve=='1'){
                        var str ='<font style="color:green;">已批准</font>';
                        return str;
                    }
                    else{
                        var str ='<font style="color:red;">已拒绝</font>';
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