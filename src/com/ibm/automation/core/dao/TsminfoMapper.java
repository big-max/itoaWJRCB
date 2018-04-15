package com.ibm.automation.core.dao;

import java.util.List;
import java.util.Map;

import com.ibm.automation.domain.Tsminfo;

public interface TsminfoMapper {
    int deleteByPrimaryKey(Integer tsmId);

    int insert(Tsminfo record);

    int insertSelective(Tsminfo record);

    Tsminfo selectByPrimaryKey(Integer tsmId);
    
    int updateByPrimaryKeySelective(Tsminfo record);

    int updateByPrimaryKey(Tsminfo record);
    
    List<Tsminfo> selectPage(Map<String,Integer> map);
    
    Integer selectCount();
}