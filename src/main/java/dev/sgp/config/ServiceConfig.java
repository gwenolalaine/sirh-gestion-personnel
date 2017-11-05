package dev.sgp.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

import dev.sgp.spring.DataSourceMySQLConfig;
import dev.sgp.spring.JpaConfig;

@Configuration
@ComponentScan("dev.sgp.entite, dev.sgp.util.Constantes")
@Import({JpaConfig.class, DataSourceMySQLConfig.class})
@EnableJpaRepositories("dev.sgp.repository")
public class ServiceConfig {

}
