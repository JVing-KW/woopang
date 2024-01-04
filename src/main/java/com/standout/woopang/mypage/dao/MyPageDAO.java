package com.standout.woopang.mypage.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.standout.woopang.member.vo.MemberVO;
import com.standout.woopang.order.vo.OrderVO;

public interface MyPageDAO {


	public List<OrderVO> selectMyOrderHistoryList(Map dateMap) throws DataAccessException;


	public void updateMyOrderCancel(String order_id) throws DataAccessException;
	

	public void updateMyOrderReturn(String order_id) throws DataAccessException;
	

	public void updateMyOrderExchange(String order_id) throws DataAccessException;
	

	public MemberVO selectMyDetailInfo(String member_id) throws DataAccessException;
	

	public void updateMyInfo(Map memberMap) throws DataAccessException;
	

	public void deleteMember(String member_id) throws DataAccessException;
	
}
