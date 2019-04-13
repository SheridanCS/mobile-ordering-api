package com.sheridancs.grub2go.security.configuration;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.oauth2.config.annotation.web.configuration.EnableResourceServer;
import org.springframework.security.oauth2.config.annotation.web.configuration.ResourceServerConfigurerAdapter;
import org.springframework.security.oauth2.config.annotation.web.configurers.ResourceServerSecurityConfigurer;
import org.springframework.security.oauth2.provider.token.ResourceServerTokenServices;
import org.springframework.security.oauth2.provider.token.store.JwtAccessTokenConverter;

@Configuration
@EnableResourceServer
public class ResourceServerConfiguration extends ResourceServerConfigurerAdapter {
    private ResourceServerTokenServices tokenServices;
    private JwtAccessTokenConverter accessTokenConverter;

    @Autowired
    public ResourceServerConfiguration(ResourceServerTokenServices tokenServices, JwtAccessTokenConverter accessTokenConverter) {
        this.tokenServices = tokenServices;
        this.accessTokenConverter = accessTokenConverter;
    }

    @Override
    public void configure(ResourceServerSecurityConfigurer resources) throws Exception {
        resources.tokenServices(tokenServices);
    }

    @Override
    public void configure(HttpSecurity http) throws Exception {
        http.requestMatchers()
            .and()
            .authorizeRequests()
            .antMatchers("/actuator/**", "/api-docs/**","/oauth/**").permitAll()
            .antMatchers("/api/files/*").permitAll()
            .antMatchers("/api/orders/*", "/api/restaurants/*", "/api/users/*").authenticated();
    }
}
