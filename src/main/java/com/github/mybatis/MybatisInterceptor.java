package com.github.mybatis;

import java.util.Date;
import java.util.Properties;

import org.apache.ibatis.executor.Executor;
import org.apache.ibatis.mapping.MappedStatement;
import org.apache.ibatis.mapping.SqlCommandType;
import org.apache.ibatis.plugin.Interceptor;
import org.apache.ibatis.plugin.Intercepts;
import org.apache.ibatis.plugin.Invocation;
import org.apache.ibatis.plugin.Plugin;
import org.apache.ibatis.plugin.Signature;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.github.po.BaseEntity;


@Intercepts({@Signature(type = Executor.class, method = "update", args = {MappedStatement.class, Object.class }) })
public class MybatisInterceptor implements Interceptor {

	Logger logger = LoggerFactory.getLogger(MybatisInterceptor.class);
	@Override
	public Object intercept(Invocation invocation) throws Throwable {
		Object[] args = invocation.getArgs();
		MappedStatement ms = (MappedStatement) args[0];
		SqlCommandType sqlCommandType = ms.getSqlCommandType();
        Object parameter = args[1];
        
        if(sqlCommandType.equals(SqlCommandType.UPDATE)){
        	BaseEntity entity = (BaseEntity)parameter;
        	entity.setUpdatedOn(new Date());
        	entity.setUpdatedBy(12234L);
        	
        } else if(sqlCommandType.equals(SqlCommandType.INSERT)){
        	BaseEntity entity = (BaseEntity)parameter;
        	entity.setUpdatedOn(new Date());
        	entity.setUpdatedBy(12234L);
        	entity.setCreatedOn(new Date());
        	entity.setCreatedBy(12234L);
        } else if(sqlCommandType.equals(SqlCommandType.DELETE)){
        	
        }
        
		Executor executor = (Executor) invocation.getTarget();
		

		
		return executor.update(ms, parameter);
	}

	@Override
	public Object plugin(Object arg0) {
		return Plugin.wrap(arg0, this);
	}

	@Override
	public void setProperties(Properties arg0) {
		// TODO Auto-generated method stub
		
	}

}
