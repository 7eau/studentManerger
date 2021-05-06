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
//初始化datagrid
var initDataGrid = function(){
    var tid = $("#tid").val();
    $("#content").datagrid({
        url:"/teacher/getStudentScore.do",
        width:'auto',   //表格宽度
        height:'500px',
        columns:[[
            {field: 'id', title: 'stu_course表ID', width: 'auto', hidden: 'true'},
            {field: 'courseName', title: '课程名称', width: '100', align: 'center'},
            {field: 'studentName', title: '学生名称', width: '200', align: 'center'},
            {field: 'level', title: '学年', width: 'auto', hidden: 'true'},
            {field: 'majorName', title: '专业', width: '200', align: 'center'},
            {field: 'number', title: '班级', width: '200', align: 'center',
                formatter:function(value, row, index) {
                    var str = row.level + '级' + row.majorName + '(' + row.number + ')班';
                    return str;
                }},
            {field: 'score', title: '分数', width: '100', align: 'center',
                formatter:function(value, row, index){
                    var str = '';
                    if (value==undefined || value=="") {
                        str += '成绩未录入';
                    } else {
                        str += value + '分';
                    }
                    return str;
                }},
            {field:'studentId',title:'学生ID',width:'auto',hidden:'true'},
            {field: 'courseId', title: '课程ID', width: 'auto', hidden: 'true'},
            {field:'opt',title:'操作',width:'100',align:'center',
                formatter:function(value, row, index){
                    var str = '<a href="javascript:void(0)" onclick="updateStudentScore(\''+row.id+'\', \''+row.score+'\', \''+row.studentName+'\')" name="updateStudentScore" class="easyui-linkbutton" ></a>';
                    return str;
            }}
        ]],
        onLoadSuccess:function(data){
            $("a[name='updateStudentScore']").linkbutton({text:'更新成绩',plain:true,iconCls:'icon-edit'});
        },
        singleSelect:true,
        border:false,
        pagination:true,
        pageList:[18,25,30,40,50],
        pageSize:18,
        striped:true,
        nowrap:true,
        autoRowHeight:true,
        fitColumns:true,
        loadMsg:'怕是等一下哦',
        toolbar:"#toolBar",
        queryParams:{
            tid:tid
        }
    });
};
var initClick = function(){
    //搜索按钮点击事件
    $("#searchBarBtn").click(function(){
        var keywords = $("#searchBarText").val();
        $("#content").datagrid("reload",{keywords:keywords});
    });

    //学生成绩更新按钮
    $("#subGrade").click(function(){
        var id = $('#id').val();
        var score = $('#grade').val();

        if(score<0 ||score >100)
        {
            $.messager.alert({
                title:"提示消息",
                icon:"error",
                msg:"输入的分数不合法！"
            });
            return;
        }

        $.ajax({
            url:"/teacher/updateStudentScore.do",
            type:"POST",
            data:{
                id:id,
                score:score
            },
            success:function(result){
                if(result.code){
                    $.messager.alert("提示消息",result.msg);
                    $("#jj").dialog("close");
                    $("#content").datagrid("reload");
                }else{
                    $.messager.alert("提示消息",result.msg);
                }
            },
            error:function(){
                $.messager.alert("系统出错了");
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
// 更新学生成绩
var updateStudentScore = function (id, score, studentName) {
    $("#jj").dialog({
        title:"录入成绩-----"+stuName,
        width:400,
        height:200
    });
    if (score<0 ||score >100) {
        $('#grade').val("");
    } else {
        $('#grade').val(score);
    }
    $('#id').val(id);
    $('#stuName').val(studentName);
}