/*$(function () {
        $('#username').editable({
            type: "text",                //编辑框的类型。支持text|textarea|select|date|checklist等
            title: "用户名",              //编辑框的标题
            disabled: false,             //是否禁用编辑
            emptytext: "空文本",          //空值的默认文本
            mode: "inline",              //编辑框的模式：支持popup和inline两种模式，默认是popup
            validate: function (value) { //字段验证
                if (!$.trim(value)) {
                    return '不能为空';
                }
            }
        });

    });*/

//绑定模态框按钮的点击事件
$(function () {
	$(document).on("click","._edit",function(){
		//1.初始化Table
	    var oTable = new TableInit();
	    oTable.Init();

	    //2.初始化Button的点击事件
	    var oButtonInit = new ButtonInit();
	    oButtonInit.Init();
/*	    alert($(this).attr("id"));*/
	});
	
});

var TableInit = function () {
    var oTableInit = new Object();
    //初始化Table
    oTableInit.Init = function () {
        $('#dag_expect_info').bootstrapTable({
            url: 'http://localhost:8080/itoa/getDag_expect_time.do',         //请求后台的URL（*）
            method: 'get',                      //请求方式（*）
            striped: true,                      //是否显示行间隔色
            cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
            pagination: true,                   //是否显示分页（*）
            sortable: false,                     //是否启用排序
            sortOrder: "asc",                   //排序方式
            queryParams: function (param) {
                return {};
            },                                  //传递参数（*）
            sidePagination: "client",           //分页方式：client客户端分页，server服务端分页（*）
            pageNumber:1,                       //初始化加载第一页，默认第一页
            pageSize: 10,                       //每页的记录行数（*）
            pageList: [10, 25, 50, 100],        //可供选择的每页的行数（*）
            search: false,                       //是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
            strictSearch: true,
            showColumns: false,                  //是否显示所有的列
            showRefresh: true,                  //是否显示刷新按钮
            minimumCountColumns: 2,             //最少允许的列数
            clickToSelect: true,                //是否启用点击选中行
            height: 500,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
            showToggle:true,                    //是否显示详细视图和列表视图的切换按钮
            cardView: false,                    //是否显示详细视图
            detailView: false,                   //是否显示父子表
            showPaginationSwitch: true,          //是否显示 数据条数选择框
            columns: [{
                field: 'task_name',
                title: '任务名称',
            }, {
                field: 'expected_starttime',
                title: '预计开始时间',
                editable: {
                    type: 'text',
                    title: '预计开始时间',
                    validate: function (v) {
                        if (!v) return '名称不能为空';
                    }
                }
            }, {
                field: 'expected_duration',
                title: '预计持续时间',
                editable: {
                    type: 'text',
                    title: '预计持续时间',
                    validate: function (v) {
                        if (!v) return '预计持续时间不能为空';
                    }
                }
            }],
            onEditableSave: function (field, row, oldValue, $el) {
            	$('#dag_expect_info').bootstrapTable("resetView");
                $.ajax({
                    type: "post",
                    url: "http://localhost:8080/itoa/save.do",
                    data: row,
                    dataType: 'JSON',
                    success: function (data, status) {
                        if (status == "success") {
                            alert('提交数据成功');
                        }
                    },
                    error: function () {
                        alert('编辑失败');
                    },
                    complete: function () {

                    }

                });
            }
        });
    };
/*    $('#dag_expect_info').on('load-success.bs.table',function(data){
        alert("load success");
     });*/
    //得到查询的参数
    oTableInit.queryParams = function (params) {
        var temp = {   //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
            limit: params.limit,   //页面大小
            offset: params.offset,  //页码
            departmentname: $("#dag_expect_info").val(),
            statu: 'true'
        };
        return temp;
    };
    return oTableInit;
};


var ButtonInit = function () {
    var oInit = new Object();
    var postdata = {};

    oInit.Init = function () {
        //初始化页面上面的按钮事件
    };

    return oInit;
};