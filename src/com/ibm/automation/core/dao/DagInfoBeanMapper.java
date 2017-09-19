package com.ibm.automation.core.dao;

import com.ibm.automation.domain.DagInfoBean;

public interface DagInfoBeanMapper {
    int deleteByPrimaryKey(String dagId);

    int insert(DagInfoBean record);

    int insertSelective(DagInfoBean record);

    DagInfoBean selectByPrimaryKey(String dagId);

    int updateByPrimaryKeySelective(DagInfoBean record);

    int updateByPrimaryKey(DagInfoBean record);
}