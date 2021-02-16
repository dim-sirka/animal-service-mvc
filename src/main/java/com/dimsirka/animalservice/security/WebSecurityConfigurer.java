package com.dimsirka.animalservice.security;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class WebSecurityConfigurer extends WebSecurityConfigurerAdapter {

    private WebAuthenticationFilter webAuthenticationFilter;

    @Autowired
    public WebSecurityConfigurer(WebAuthenticationFilter webAuthenticationFilter) {
        this.webAuthenticationFilter = webAuthenticationFilter;
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
                .formLogin().permitAll()
                .and()
                .authorizeRequests()
                .antMatchers("/admin/**")
                .authenticated()
                .and()
                .authorizeRequests()
                .antMatchers("/**")
                .permitAll();

        http.addFilterBefore(webAuthenticationFilter, UsernamePasswordAuthenticationFilter.class);
    }
}
