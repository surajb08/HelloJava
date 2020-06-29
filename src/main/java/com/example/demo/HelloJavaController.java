package com.example.demo;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@EnableAutoConfiguration
public class HelloJavaController {
	@RequestMapping("/")
	@ResponseBody
	public String Hello() {
		return "Hello Java from World!";
	}
	
	@RequestMapping("/time")
	@ResponseBody
	public String Time() {
		Date date = Calendar.getInstance().getTime();
		DateFormat dateFormat = new SimpleDateFormat("MMMM dd, yyyy hh:mm:ss:SSS a z Z");
		String strDate = dateFormat.format(date);
		return strDate;
	}
}
