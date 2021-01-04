package com.dimsirka.animalservice.configs;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.view.freemarker.FreeMarkerConfigurer;

import static java.util.Collections.singletonList;

@Component
public class FreeMarkerConfig {

    @Autowired
    void configure(FreeMarkerConfigurer freeMarkerConfigurer) {
        freeMarkerConfigurer.getTaglibFactory().setClasspathTlds(singletonList("/META-INF/security.tld"));
    }
}
