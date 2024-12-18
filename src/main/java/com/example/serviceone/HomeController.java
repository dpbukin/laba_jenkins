package com.example.serviceone;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

@RestController
@RequestMapping("/home")
public class HomeController {

    private final RestTemplate restTemplate = new RestTemplate();

    @GetMapping("/test")
    public String test() {
        return "Single works!";
    }

    @GetMapping("/test2")
    public String test2() {
        return "Single works2!";
    }

}