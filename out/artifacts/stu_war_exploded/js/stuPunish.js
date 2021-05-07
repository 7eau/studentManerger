/**
 * Created by chenkexuan on 2017/4/27.
 */

/**
 * edited by dengxionghui on 2018/6/21
 */

$(document).ready(function(){
    initDataGrid();
});
var initDataGrid = function(){
    var stuId = $("#userId").val();
    $("#studentPunishGrid").datagrid({
        url:"/stu/rewardpunish/getPunish.do",
        width:'auto',   //表格宽度
        height:'500px',
        columns:[[
            {field:'id',title:'编号',width:'auto',hidden:'true'},
            {field:'content',title:'处罚原因',width:'400',align : 'center'},
            {field:'time',title:'时间',width:'200',align : 'center',
                formatter:function(value, row, index) {
                    if (row.time == undefined || row.time == "") {
                        var str = '暂无时间记录';
                        return str;
                    }else{
                        var str = row.time;
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
};