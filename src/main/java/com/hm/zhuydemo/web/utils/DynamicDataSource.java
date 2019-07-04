package com.hm.zhuydemo.web.utils;

import org.springframework.jdbc.datasource.lookup.AbstractRoutingDataSource;

import com.hm.zhuydemo.web.pagehelper.DynamicDataSourceHolder;

public class DynamicDataSource extends AbstractRoutingDataSource {
 
    @Override
    protected Object determineCurrentLookupKey() {
        // 从自定义的位置获取数据源标识
        return DynamicDataSourceHolder.getDataSource();
    }
 
}