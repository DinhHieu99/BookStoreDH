package com.bookstore.config;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.orm.jpa.JpaTransactionManager;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.orm.jpa.vendor.HibernateJpaVendorAdapter;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import javax.persistence.EntityManagerFactory;
import javax.sql.DataSource;
import java.util.Properties;

//đánh dấu để spring-boot biết file này dùng để cấu hình.
@Configuration

//bật tính năng quản lí transaction của spring container.
//transaction có 2 loại là resource-local và jta.
//đối với resourece-local thì developer phải manual transaction.
@EnableTransactionManagement

//hướng dẫn springboot biết nơi chứa các Repository
@EnableJpaRepositories(basePackages = { "com.bookstore" })

//trỏ tới cấu hình connection tới mysql. và được sử dụng bởi Environment.
@PropertySource({ "classpath:datasource.properties" })
public class HibernateConfig {
	// các thông tin từ application.properties và
	// @PropertySource được đọc và store trong này.
	@Autowired
	private Environment env;

	/**
	 * nằm giữa database(mysql) và project. bao gồm connection-pool. Hikari là một
	 * connection pool.
	 * 
	 * @return
	 */
	@Bean(destroyMethod = "close")
	protected DataSource dataSource() {
		HikariConfig dataSourceConfig = new HikariConfig();
		dataSourceConfig.setDriverClassName(env.getRequiredProperty("db.driver"));
		dataSourceConfig.setJdbcUrl(env.getRequiredProperty("db.url"));
		dataSourceConfig.setUsername(env.getRequiredProperty("db.username"));
		dataSourceConfig.setPassword(env.getRequiredProperty("db.password"));
		return new HikariDataSource(dataSourceConfig);
	}

	/**
	 * tạo EntityManagerFactory. Dùng để tạo EntiyManager.
	 * 
	 * @return
	 */
	@Bean
	protected LocalContainerEntityManagerFactoryBean entityManagerFactory() {
		LocalContainerEntityManagerFactoryBean entityManagerFactoryBean = new LocalContainerEntityManagerFactoryBean();
		entityManagerFactoryBean.setDataSource(dataSource());
		entityManagerFactoryBean.setJpaVendorAdapter(new HibernateJpaVendorAdapter());
		// package chứa các entities.
		entityManagerFactoryBean.setPackagesToScan("com.bookstore");
		entityManagerFactoryBean.setJpaProperties(additionalProperties());

		return entityManagerFactoryBean;
	}

	/**
	 * vì bật tính năng @EnableTransactionManagement nên cần tạo TransactionManager
	 * để spring contatiner sử dụng.
	 * 
	 * @param entityManagerFactory
	 * @return
	 */
	@Bean
	protected JpaTransactionManager transactionManager(final EntityManagerFactory entityManagerFactory) {
		JpaTransactionManager transactionManager = new JpaTransactionManager();
		transactionManager.setEntityManagerFactory(entityManagerFactory);
		return transactionManager;
	}
	
	Properties additionalProperties() {
		Properties jpaProperties = new Properties();
		//Định cấu hình phương ngữ cơ sở dữ liệu được sử dụng. Điều này cho phép Hibernate tạo SQL được tối ưu hóa cho cơ sở dữ liệu được sử dụng.
      jpaProperties.put("hibernate.dialect", env.getRequiredProperty("hibernate.dialect"));
      //Chỉ định hành động được gọi đến cơ sở dữ liệu khi Hibernate SessionFactory được tạo hoặc đóng.
      jpaProperties.put("hibernate.hbm2ddl.auto", env.getRequiredProperty("hibernate.hbm2ddl.auto"));
      //Định cấu hình chiến lược đặt tên được sử dụng khi Hibernate tạo các đối tượng cơ sở dữ liệu và các thành phần lược đồ mới
      jpaProperties.put("hibernate.ejb.naming_strategy", env.getRequiredProperty("hibernate.ejb.naming_strategy"));
      //Nếu giá trị của thuộc tính này là true, Hibernate ghi tất cả các câu lệnh SQL vào bàn điều khiển.
      jpaProperties.put("hibernate.show_sql", env.getRequiredProperty("hibernate.show_sql"));
      //Nếu giá trị của thuộc tính này là true, Hibernate sẽ định dạng SQL được ghi vào bàn điều khiển.
      jpaProperties.put("hibernate.format_sql", env.getRequiredProperty("hibernate.format_sql"));
      return jpaProperties;
		
	}
}