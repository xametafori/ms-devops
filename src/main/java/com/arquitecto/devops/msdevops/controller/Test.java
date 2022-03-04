package com.arquitecto.devops.msdevops.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class Test {

    @GetMapping("/test")
    public String TestFirstJob() {
        return "Hola Mundo Azure DevOps";
    }
}
