package com.HAH.book.configuration;

import javax.sql.DataSource;

import org.apache.commons.dbcp.BasicDataSource;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.annotation.Scope;
import org.springframework.context.support.PropertySourcesPlaceholderConfigurer;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;

@Configuration
@ComponentScan("com.HAH.book.root")
@PropertySource("classpath:database.properties")
public class RootConfig {

	@Value("${ds.url}")
	private String url;
	@Value("${ds.username}")
	private String username;
	@Value("${ds.password}")
	private String password;

	@Bean
	public static PropertySourcesPlaceholderConfigurer propertySourcesPlaceholderConfigurer() {
		return new PropertySourcesPlaceholderConfigurer();
	}

	@Bean
	public DataSource dataSource() {
		var ds = new BasicDataSource();
		ds.setUrl(url);
		ds.setUsername(username);
		ds.setPassword(password);
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
