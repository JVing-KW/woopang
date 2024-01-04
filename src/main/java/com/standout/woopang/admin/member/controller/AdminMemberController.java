package com.standout.woopang.admin.member.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.standout.woopang.member.vo.MemberVO;

public interface AdminMemberController {

	public String adminGoodsMain(@RequestParam Map<String, String> dateMap, HttpServletRequest request,
								 HttpServletResponse response, Model model) throws Exception;
}
