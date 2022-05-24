package com.ahoo.airbnb;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class GitActionTestController {

	@GetMapping("/")
	public String hello() {
		System.out.println("테슷흐~~~");
		return "hello";
	}
}
