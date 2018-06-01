package com.undancer.app.web

import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController

@RestController
@RequestMapping(path = ["/"])
class HomeController {

    @GetMapping
    fun home(): String {
        return "home"
    }
}