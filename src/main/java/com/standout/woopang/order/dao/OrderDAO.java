package com.standout.woopang.order.dao;

import java.util.ArrayList;
import java.util.List;

import com.standout.woopang.order.dto.OrderDTO;
import org.springframework.dao.DataAccessException;

import com.standout.woopang.order.vo.OrderVO;

public interface OrderDAO {
	
	//주문하기
	public void insertNewOrder(List<OrderVO> myOrderList) throws DataAccessException;

	//주문완료시 장바구니에서 상품 제거
	public void removeGoodsFromCart(List<OrderVO> myOrderList)throws DataAccessException;


	public int selectOrderID()throws DataAccessException;
}
