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
    $("#content").datagrid({
        url:"/stu/aflManager/getAllStuAFL.do",
        width:'auto',   //表格宽度
        height:'500px',
        columns:[[
            {field:'id',title:'编号',width:'auto',hidden:'true'},
            {field:'student_id',title:'学生编号',width:'auto',hidden:'true'},
            {field:'username',title:'学号',width:'100',align : 'center'},
            {field:'name',title:'学生名',width:'100',align : 'center'},
            {field:'reason',title:'请假理由',width:'200',align : 'center'},
            {field:'start_time',title:'开始时间',width:'150',align : 'center'},
            {field:'end_time',title:'结束时间',width:'150',align : 'center'},
            {field:'approve',title:'批准状态',width:'150',align : 'center',
                formatter:function(value, row, index){
                    if(row.approve=='0')
                    {
                        var str = '<font style="color:gold;">待批准</font>';
                    }
                    else if(row.approve=='1')
                    {
                        var str ='<font style="color:green;">已批准</font>';
                    }
                    else if(row.approve=='2') {
                        var str = '<font style="color:red;">已拒绝</font>';
                    }
                    return str; },
            },
            {field:'approve_time',title:'批准时间',width:'150',align : 'center',
                formatter:function(value, row, index){
                    if(row.approve_time==undefined)
                    {
                        str='时间未知'
                    }
                    return str; },
            },
            {field:'opt',title:'操作',width:'100',align:'center',
                formatter:function(value, row, index){
                    var str = '<a href="javascript:void(0)" onclick="approveStuAFL(\''+row.id+'\',\''+row.student_id+'\',\''+row.approve+'\')" name="approveAFL" class="easyui-linkbutton" ></a>';
                    str+='<a href="javascript:void(0)" onclick="delStuAFL(\''+row.id+'\',\''+row.student_id+'\',\''+row.approve+'\')" name="delAFL" class="easyui-linkbutton" ></a>';
                    return str; },
            }
        ]],
        onLoadSuccess:function(data){
            $("a[name='approveAFL']").linkbutton({text:'批准',plain:true,iconCls:'icon-ok'});
            $("a[name='delAFL']").linkbutton({text:'拒绝',plain:true,iconCls:'icon-cancel'});
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
            username:"",
            keywords:""
        }
    });
};

var approveStuAFL=function(aflId,stuId,approve)
{
    if(approve=='1')
    {
        $.messager.alert({
            title:"提示",
            icon:"error",
            msg:"批准过不用再批准了！"
        });
        return;
    }

    $("#aflstuId").val(stuId);
    $("#aflId").val(aflId);

    $("#approveStuAFLBox").dialog({
        title:"同意请假",
        width:200,
        height:250
    })


}

//删除学生请假信息
var delStuAFL = function(aflId,stuId,approve){

    if(approve=='1')
    {
        $.messager.alert({
            title:"提示",
            icon:"error",
            msg:"您已经批准过了！"
        });
        return;
    }


    $.messager.confirm("确认信息","您确定要拒绝这条学生请假信息吗？",function(r){
        if(r){
            $.ajax({
                url:"/stu/aflManager/delStuAFL.do",
                type:"POST",
                data:{
                    stuId:stuId,
                    aflId:aflId
                },
                success:function(data){
                    if(data.code){
                        $.messager.confirm("提示",data.msg,function(r){
                            if(r){
                                $("#content").datagrid("load");
                            }else{
                                $("#content").datagrid("load");
                            }
                        });
                    }else{
                        $.messager.confirm("提示",data.msg,function(r){
                            if(r){
                                //DO NOTING
                            }
                        });
                    }
                },
                error:function(){
                    $.messager.alert({
                        title:"提示",
                        icon:"error",
                        msg:"拒绝失败！"
                    });
                }
            });
        }
    });
};

var initClick = function(){
    //取消批准
    $("#cancelApproveStuAFL").click(function () {
        $("#approveStuAFLBox").dialog("close");
    })

    //批准请假
    $("#subApproveStuAFL").click(function(){
        var stuId = $("#aflstuId").val();
        var aflId = $("#aflId").val();

        $.ajax({
            url:"/stu/aflManager/approveStuAFL.do",
            type:"POST",
            data:{
                stuId:stuId,
                aflId:aflId
            },
            success:function(data){
                if(data.code){
                    $.messager.confirm("提示",data.msg,function(r){
                        if(r){
                            $("#approveStuAFLBox").dialog("close");
                            $("#content").datagrid("load");
                        }else{
                            $("#approveStuAFLBox").dialog("close");
                            $("#content").datagrid("load");
                        }
                    });
                }else{
                    $.messager.confirm("提示",data.msg,function(r){
                        if(r){
                            //DO NOTING
                        }
                    });
                }
            },
            error:function(){
                $.messager.alert({
                    title:"提示",
                    icon:"error",
                    msg:"提交请求失败！"
                });
            }
        });
    });

    //搜索按钮点击事件
    $("#searchBarBtn").click(function(){
        var keywords = $("#searchBarText").val();
        $("#content").datagrid("reload",{username:"",keywords:keywords});
    });

    $("#searchBarBtnByUsername").click(function (){
        var keywords = $("#searchBarText").val();
        $("#content").datagrid("reload",{username:keywords,keywords:""});
    })
    $("#clearSearch").click(function (){
        $("#content").datagrid("reload",{username:"",keywords:""});
    })
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
                window.location.reload();
            }
        });
        win.dialog('open');
    }
};