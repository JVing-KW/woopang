package com.standout.woopang.admin.member.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.standout.woopang.goods.vo.GoodsVO;
import com.standout.woopang.member.dto.MemberDTO;
import com.standout.woopang.member.vo.MemberVO;
import com.standout.woopang.order.vo.OrderVO;

public interface AdminMemberService {
	// 회원관리
	public ArrayList<MemberDTO> listMember(HashMap condMap) throws Exception;
}
