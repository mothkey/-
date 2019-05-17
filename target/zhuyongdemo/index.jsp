
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>boot strap webapp</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- Bootstrap css-->
        <link href="assets/css/bootstrap.min.css" rel="stylesheet" media="screen">
        <!-- jq -->
        <script src="http://code.jquery.com/jquery.js"></script>
        <!-- Bootstrap js-->
        <script src="assets/js/bootstrap.min.js"></script>


        <link href="assets/css/bootstrap.css" rel="stylesheet"/>

        <!--引入tree 组件-->
        <script src="assets/js/bootstrap-treeview.min.js"></script>

        <!-- bootstrap table-->
        <script src="assets/js/bootstrap-table.js"></script>
        <link href="assets/css/fresh-bootstrap-table.css" rel="stylesheet" />




    </head>
    <body>
        <div class="panel-body">
            <div class="row">
                <div class="col-sm-3">
                    <!--class tree-->
                    <div id="tree" style="margin-top: 15px" ></div>
                </div>
                <div class="col-sm-9">
                    <div class="panel-body" style="padding-bottom:0px;">
                        <div class="panel panel-default">
                            <div class="panel-heading">查询条件</div>
                            <div class="panel-body">
                                <form id="formSearch" class="form-horizontal">
                                    <div class="form-group" style="margin-top:15px">
                                        <label class="control-label col-sm-1" for="className">班级名称</label>
                                        <div class="col-sm-3">
                                            <input type="text" class="form-control" id="className">
                                        </div>
                                        <label class="control-label col-sm-1" for="name">姓名</label>
                                        <div class="col-sm-3">
                                            <input type="text" class="form-control" id="name">
                                        </div>
                                        <div class="col-sm-3" style="text-align:left;">
                                            <button type="button" style="margin-left:50px" id="btn_query" class="btn btn-primary">查询</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>

                        <div id="toolbar" class="btn-group">
                            <button id="btn_add" type="button" data-toggle="modal" data-target="#addModal" class="btn btn-default">
                                <span class="glyphicon glyphicon-plus"  aria-hidden="true"></span>新增
                            </button>
                            <button id="btn_edit" type="button" data-toggle="modal" data-target="#editModal" class="btn btn-default">
                                <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>修改
                            </button>
                            <button id="btn_delete" type="button" data-toggle="modal" data-target="#delModal" class="btn btn-default">
                                <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
                            </button>
                            <input id="classId" hidden="hidden"/>
                        </div>
                        <table id="tb_departments"></table>
                    </div>
                </div>
            </div>

            <!--add page-->
            <!-- 模态框（Modal） -->
            <div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="addModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title" id="addModalLabel">新增学生</h4>
                        </div>
                        <div class="modal-body">
                            <form role="form">
                                <div class="form-group">
                                    <label for="addClassName">班级名称</label>
                                    <input type="text" class="form-control" id="addClassName"
                                           readonly="readonly" value="软件1402">
                                </div>
                                <div class="form-group">
                                    <label for="name">姓名</label>
                                    <input type="text" class="form-control" id="addName"
                                           placeholder="请输入名称">
                                </div>
                                <div class="form-group">
                                    <label for="name">年龄</label>
                                    <input type="text" class="form-control" id="addAge"
                                           placeholder="请输入名称">
                                </div>
                                <div class="form-group">
                                    <label for="name">编码</label>
                                    <input type="text" class="form-control" id="addCode"
                                           placeholder="请输入名称">
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                            <button type="button" class="btn btn-primary" id="submit">提交</button>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal -->
            </div>

            <!--del page-->
            <!-- 模态框（Modal） -->
            <div class="modal fade" id="delModal" tabindex="-1" role="dialog" aria-labelledby="delModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title" id="delModalLabel">新增学生</h4>
                        </div>
                        <div class="modal-body">
                             确定要删除所选记录？
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                            <button type="button" class="btn btn-primary" id="delete">确定</button>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal -->
            </div>
            <div class="alert alert-danger alert-dismissable" id="alert">
                <button type="button" class="close" data-dismiss="alert"
                        aria-hidden="true">
                    &times;
                </button>
                错误！请进行一些更改。
            </div>
            <!--eidt page-->
            <!-- 模态框（Modal） -->
            <div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="editModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title" id="editModalLabel">新增学生</h4>
                        </div>
                        <div class="modal-body">
                            <form role="form">
                                <div class="form-group">
                                    <label for="name">班级名称</label>
                                    <input type="text" class="form-control" id="editClassName"
                                           placeholder="请输入名称">
                                </div>
                                <div class="form-group">
                                    <label for="name">姓名</label>
                                    <input type="text" class="form-control" id="editStuName"
                                           placeholder="请输入名称">
                                </div>
                                <div class="form-group">
                                    <label for="name">年龄</label>
                                    <input type="text" class="form-control" id="editAge"
                                           placeholder="请输入名称">
                                </div>
                                <div class="form-group">
                                    <label for="name">编码</label>
                                    <input type="text" class="form-control" id="editCode"
                                           placeholder="请输入名称">
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                            <button type="button" class="btn btn-primary">提交</button>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal -->
            </div>
        </div>
        <script>
            //全局path
            path = "/zhuyongdemo_war_exploded/stu";
            //獲取treedata
            var treeData = null;
            function  getTree() {
                //获取树结构数据
                var pamas = {'id':""};
                $.ajax({
                    url: path + "/getTree",
                    type: 'post',
                    async: false,
                    dataType: 'json',
                    data: ""
                }).done(function(res) {
                    console.log(res);
                    if(res.state == 200) {
                        treeData = res.data;
                        console.log(treeData);
                    }else{
                        console.info(res);
                    }
                });
                return treeData;
            }
            $("#tree").treeview({data:getTree()})

            $("#tree").on("nodeSelected",function (event,data) {
                console.info(data);
                //点击树节点 刷新表格
                $("#classId").val(data.id);
                $("#addClassName").val(data.text);
                $("#tb_departments").bootstrapTable('refresh');
            });

            $(function () {
                //1.初始化Table
                var oTable = new TableInit();
                oTable.Init();

                //2.初始化Button的点击事件
                var oButtonInit = new ButtonInit();
                oButtonInit.Init();

                //初始化提示框
                var oMsgBoxInit = new MsgBoxInit();
                oMsgBoxInit.Init();
            });

            var MsgBoxInit = function (){
                var oMsgBoxInit = new Object();
                oMsgBoxInit.Init = function () {
                    $("#alert").hide();
                };
                return oMsgBoxInit;
            }

            var TableInit = function () {
                var oTableInit = new Object();
                //初始化Table
                oTableInit.Init = function () {
                    $('#tb_departments').bootstrapTable({
                        url: path+'/getStuList',         //请求后台的URL（*）
                        method:'post',                      //请求方式（*）
                        contentType:'application/x-www-form-urlencoded; charset=UTF-8',
                        toolbar: '#toolbar',                //工具按钮用哪个容器
                        striped: true,                      //是否显示行间隔色
                        cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
                        pagination: true,                   //是否显示分页（*）
                        sortable: false,                     //是否启用排序
                        sortOrder: "asc",                   //排序方式
                        queryParams: oTableInit.queryParams,//传递参数（*）
                        sidePagination: "server",           //分页方式：client客户端分页，server服务端分页（*）
                        pageNumber:1,                       //初始化加载第一页，默认第一页
                        pageSize: 10,                       //每页的记录行数（*）
                        pageList: [10, 25, 50, 100],        //可供选择的每页的行数（*）
                        search: true,                       //是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
                        strictSearch: false,
                        showColumns: true,                  //是否显示所有的列
                        showRefresh: true,                  //是否显示刷新按钮
                        minimumCountColumns: 2,             //最少允许的列数
                        clickToSelect: true,                //是否启用点击选中行
                        height: 500,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
                        uniqueId: "ID",                     //每一行的唯一标识，一般为主键列
                        showToggle:true,                    //是否显示详细视图和列表视图的切换按钮
                        cardView: false,                    //是否显示详细视图
                        detailView: false,                   //是否显示父子表
                        columns: [{
                            checkbox: true
                        }, {
                                field:'id',
                                hied:true
                            },{
                            field: 'name',
                            title: '姓名'
                        }, {
                            field:'age',
                            title:'年龄'
                        },{
                            field:'code',
                            title:'编码'
                        },
                            {
                            field: 'facultName',
                            title: '学院'
                        }, {
                            field: 'className',
                            title: '班级'
                        }]
                    });
                };

                //得到查询的参数
                oTableInit.queryParams = function (params) {
                    var temp = {   //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
                        limit: params.limit,   //页面大小
                        offset: params.offset,  //页码
                        className: $("#className").val(),
                        name: $("#name").val(),
                        classId:$("#classId").val()
                    };
                    return temp;
                };
                return oTableInit;
            };


            var ButtonInit = function (){
                var oInit = new Object();
                var postdata = {};

                oInit.Init = function () {
                    //初始化页面上面的按钮事件

                    //查询
                    $("#btn_query").click(function () { //每次查询重新初始化数据
                        console.info("qurey");
                        $("#tb_departments").bootstrapTable('refresh');
                    });

                    //新增
                    $("#btn_add").click(function () {
                        console.info("add");
                    });

                    //保存新增
                    $("#submit").click(function () {
                        console.info("save...");
                        //get form value
                        var pamas = {
                            'name' : $("#addName").val(),
                            'pid' : $("#classId").val(),
                            'age' : $("#addAge").val(),
                            'code' : $("#addCode").val()
                        }
                        console.info(pamas)
                        $.ajax({
                            url : path+"/saveStu",
                            data:JSON.stringify(pamas),
                            contentType: "application/json",
                            dataType:"json",//预期服务器响应类型 支持类型有 xml json text html script
                            type : "post",
                            cache : false,
                            success : function(data){
                                //关闭弹窗
                                $("#addModal").modal('hide');
                                //刷新列表
                                $("#tb_departments").bootstrapTable('refresh')
                                if (data > 0) {
                                    console.info("success");
                                } else {
                                    console.info("fault")
                                }
                            },
                            error:function (data){
                                //关闭弹窗
                                $("#addModal").modal('hide');
                                //刷新列表
                                $("#tb_departments").bootstrapTable('refresh')
                            }
                        });
                    });

                    //修改
                    $("#edit").click(function () {
                        console.info("edit");
                        var list = $("#tb_departments").bootstrapTable('getSelection');
                        if(list.length > 1){
                            var pamas = {'id':""};
                            $.ajax({
                                url: path + "/getTree",
                                type: 'post',
                                async: false,
                                dataType: 'json',
                                data: ""
                            }).done(function(res) {
                                console.log(res);
                                if(res.state == 200) {
                                    treeData = res.data;
                                    console.log(treeData);
                                }else{
                                    console.info(res);
                                }
                            });
                        }else{

                        }
                    });

                    //删除
                    $("#delete").click(function () {
                        console.info("delete");
                        var list = $("#tb_departments").bootstrapTable('getSelections');
                        console.info(list,5558)
                        if(list.length > 0){
                            var pamas = {'id':list[0].id};
                            $.ajax({
                                url : path + "/delStu",
                                data:JSON.stringify(pamas),
                                contentType: "application/json",
                                dataType:"json",//预期服务器响应类型 支持类型有 xml json text html script
                                type : "post",
                                cache : false,
                                success : function(data){
                                    //关闭弹窗
                                    $("#delModal").modal('hide');
                                    //刷新列表
                                    $("#tb_departments").bootstrapTable('refresh')
                                    if (data > 0) {
                                        console.info("success");
                                    } else {
                                        console.info("fault")
                                    }
                                },
                                error:function (data){
                                    //关闭弹窗
                                    $("#addModal").modal('hide');
                                    //刷新列表
                                    $("#tb_departments").bootstrapTable('refresh')
                                }
                            });
                        }else{
                            $("#delModal").modal('hide');
                            $("#alert").show();
                        }
                    });

                };

                return oInit;
            };
        </script>
    </body>
</html>
