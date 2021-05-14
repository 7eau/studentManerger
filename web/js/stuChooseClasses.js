/**
 * Created by chenkexuan on 2017/4/27.
 */

/**
 * edited by dengxionghui on 2018/6/21
 */
$(document).ready(function(){
    initDataGrid();
    initMsg();
    initClick();
});
//初始化datagrid
var initDataGrid = function(){
    var stuId = $("#userId").val();
    $("#studentCourseBox").datagrid({
        url:"/stu/stuCourse/getAllCourse.do",
        width:'auto',   //表格宽度
        height:'500px',
        columns:[[
            {field:'id',title:'编号',width:'auto',hidden:'true'},
            {field:'flag',title:'标记',width:'auto',hidden:'true'},
            {field:'name',title:'课程名称',width:'200',align : 'center'},
            {field:'teacher',title:'授课教师',width:'200',align : 'center'},
            {field:'courseType',title:'课程类型',width:'200',align : 'center'},
            {field:'score',title:'学分',width:'100',align : 'center'},
            {field:'opt',title:'操作',width:'200',align:'center',
                formatter:function(value, row, index) {
                    if (row.flag == undefined || row.flag == "") {
                        var str = '<a href="javascript:;" onclick="getCourse(\'' + row.id + '\')" name="getCourse" class="easyui-linkbutton" ></a>';
                        return str;
                    }else{
                        var str = '已选';
                        return str;
                    }
                }
            }
        ]],
        onLoadSuccess:function(data){
            $("a[name='getCourse']").linkbutton({text:'选课',plain:true,iconCls:'icon-edit'});
        },
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
            keywords:"",
            stuId:stuId
        }
    });
};
//初始化信息
var initMsg = function(){
    $.ajax({
        url:"/stu/stuCourse/getMsg.do",
        type:"POST",
        success:function(result){
            $("#MsgBtn").html(result.msg);
        }
    });
};
//初始化点击事件
var initClick = function(){
    var stuId = $("#userId").val();
    $("#removeKeywords").click(function(){
        $("#studentCourseBox").datagrid("load",{keywords:"",stuId:stuId});
    });
    $("#searchBarBtn").click(function(){
        var keywords = $("#searchBarText").val();
        $("#studentCourseBox").datagrid("load",{keywords:keywords,stuId:stuId});
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
//学生选课
var getCourse =function(courseId){
    var stuId = $("#userId").val();
    $.ajax({
        url:"/stu/stuCourse/getCourse.do",
        type:"POST",
        data:{
            stuId:stuId,
            courseId:courseId
        },
        success:function(result){
            $.messager.alert("提示消息",result.msg);
            $("#studentCourseBox").datagrid("load",{keywords:"",stuId:stuId});
        },
        error:function(){
            $.messager.alert("提示消息","服务器错误!");
        }
    });
};