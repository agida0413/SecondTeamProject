package com.sist.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminController {

@GetMapping("adminPage/adminMain.do")   
   public String adminMain(Model model) {
   
   model.addAttribute("cate","adminA");
   
   return"adminPage";
   }
}