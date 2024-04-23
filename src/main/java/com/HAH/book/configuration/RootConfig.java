package com.HAH.book.configuration;

import javax.sql.DataSource;

import org.apache.commons.dbcp.BasicDataSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Scope;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;

@Configuration
@ComponentScan("com.HAH.book.root")
public class RootConfig {

	@Bean
	public DataSource dataSource() {
		var ds = new BasicDataSource();
		ds.setUrl("${ds.url");
		ds.setUsername("${ds.username}");
		ds.setPassword("${ds.password}");
		return ds;
	}
	
	@Bean
	public NamedParameterJdbcTemplate jdbcTemplate(DataSource ds) {
		return new NamedParameterJdbcTemplate(ds);
	}
	
	@Bean
	@Scope("prototype")
	public SimpleJdbcInsert jdbcInsert(DataSource ds) {
		return new SimpleJdbcInsert(ds);
	}
}
