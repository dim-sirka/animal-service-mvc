package com.dimsirka.animalservice.security;


import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

@Component
@Slf4j
public class TokenFilter implements Filter {

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest httpServletRequest = (HttpServletRequest) servletRequest;
        String token = httpServletRequest.getHeader("Authorization");

        if (null != token && token.substring(7) != null) {
            TokenAuthentication tokenAuthentication = new TokenAuthentication(token.substring(7));
            SecurityContextHolder.getContext().setAuthentication(tokenAuthentication);
        }

        try {
            filterChain.doFilter(servletRequest, servletResponse);
        } catch (AuthenticationException ex) {
            SecurityContextHolder.clearContext();
            log.error("Bad credentials for admin with token: <{}>", token);
        }

    }
}
