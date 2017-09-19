package com.ibm.automation.core.dao;


import java.util.List;

import com.ibm.automation.domain.DagDomainBean;

public interface DagDomainBeanMapper {
    //int insert(DagDomainBean record);
    
  //  int insertSelective(DagDomainBean record);
    List<DagDomainBean> selectAllDagDomain();
    DagDomainBean selectDagByID(String id );
}