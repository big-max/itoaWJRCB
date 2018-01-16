package com.ibm.automation.core.dao;

import java.util.List;

import com.fasterxml.jackson.databind.node.ArrayNode;
import com.ibm.automation.domain.TaskTelsBean;

public interface TaskTelsBeanMapper {
	List<TaskTelsBean> selectAllTaskTels();// 获取所有的员工电话号码

	List<TaskTelsBean> selectTelsByTaskID(String task_id);//// 查找所有的发送员工的电话号码
    
	//int deleteTaskTelsByID(int id);// 根据数字ID删除员工工号的电话号码

	//int modifyTaskTels(int id);// 根据数字id 修改task_id 对应的员工号码
	
	int addTaskTels(List<TaskTelsBean> lttb); //插入多条记录
	
	int deleteTaskTelsByID(int[] ids);//删除多条记录
	
	ArrayNode getAllRZTasks();//获取所有的日志任务列表
}
