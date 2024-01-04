package com.standout.woopang.mypage.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.standout.woopang.member.dto.MemberDTO;
import com.standout.woopang.member.vo.MemberVO;
import com.standout.woopang.order.dto.OrderDTO;
import com.standout.woopang.order.vo.OrderVO;

public interface MyPageService{


	public List<OrderDTO> listMyOrderHistory(Map dateMap) throws Exception;


	public void cancelOrder(String order_id) throws Exception;


	public void returnOrder(String order_id) throws Exception;
	

	public void exchangeOrder(String order_id) throws Exception;


	public MemberDTO myDetailInfo(String member_id) throws Exception;
	

	public MemberDTO modifyMyInfo(Map memberMap) throws Exception;
	

	public void  deleteMember(String member_id) throws Exception;
	
	
	

}
