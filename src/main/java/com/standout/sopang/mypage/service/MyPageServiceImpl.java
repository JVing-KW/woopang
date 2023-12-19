package com.standout.sopang.mypage.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.standout.sopang.member.dto.MemberDTO;
import com.standout.sopang.order.config.OrderConvert;
import com.standout.sopang.order.dto.OrderDTO;
import lombok.extern.log4j.Log4j2;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.standout.sopang.member.vo.MemberVO;
import com.standout.sopang.mypage.dao.MyPageDAO;
import com.standout.sopang.order.vo.OrderVO;
@Log4j2
@Service("myPageService")
@Transactional(propagation=Propagation.REQUIRED)
public class MyPageServiceImpl  implements MyPageService{
	@Autowired
	private MyPageDAO myPageDAO;

	@Autowired
	OrderConvert convertDTO;
	@Autowired
	ModelMapper modelMapper;

	@Autowired
	MemberDTO memberDTO;


	// Map<String, String> dateMap,
	//�ֹ����
	public List<OrderDTO> listMyOrderHistory(Map dateMap) throws Exception{
		List<OrderVO> myOrderHistoryList = myPageDAO.selectMyOrderHistoryList(dateMap);
		List<OrderDTO>  myOrderHistoryDTOList	= convertDTO.convertList(myOrderHistoryList);
		log.info("MyPageService"+myOrderHistoryDTOList.toString());
		return myOrderHistoryDTOList;
	}


	public List<OrderDTO> listMyOrderGoods(String member_id) throws Exception{
		List<OrderVO> myOrderList =	myPageDAO.selectMyOrderGoodsList(member_id);
		List<OrderDTO>  myOrderDTOList =	convertDTO.convertList(myOrderList);
		return myOrderDTOList;
	}

	//�ֹ����
	public void cancelOrder(String order_id) throws Exception{
		myPageDAO.updateMyOrderCancel(order_id);
	}
	
	//��ǰ
	public void returnOrder(String order_id) throws Exception{
		myPageDAO.updateMyOrderReturn(order_id);
	}
	
	//��ȯ
	public void exchangeOrder(String order_id) throws Exception{
		myPageDAO.updateMyOrderExchange(order_id);
	}
	
	//������
	public MemberDTO myDetailInfo(String member_id) throws Exception{
		return modelMapper.map(myPageDAO.selectMyDetailInfo(member_id),MemberDTO.class);
	}
	
	//�� ���� ����
	public MemberDTO modifyMyInfo(Map memberMap) throws Exception{
		 String member_id=(String)memberMap.get("member_id");
		 myPageDAO.updateMyInfo(memberMap);
		 return modelMapper.map(myPageDAO.selectMyDetailInfo(member_id),MemberDTO.class);
	}
	
	//ȸ��Ż��
	public void deleteMember(String member_id) throws Exception{
		myPageDAO.deleteMember(member_id);
	}
	
}
