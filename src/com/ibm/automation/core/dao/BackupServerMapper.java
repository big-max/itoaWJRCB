package com.ibm.automation.core.dao;

import java.util.List;

import com.ibm.automation.domain.BackupServer;

/**
 * 用于处理backup server相关的Query/Add/Update/Delete操作
 * @author HeGe
 *
 */

public interface BackupServerMapper {
	
    int deleteByPrimaryKey(Integer id);

    int insert(BackupServer record);

    int insertSelective(BackupServer record);

    BackupServer selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(BackupServer record);

    int updateByPrimaryKey(BackupServer record);
    
    List<BackupServer> selectAll();
}
