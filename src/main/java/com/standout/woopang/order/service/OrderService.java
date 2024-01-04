package com.standout.woopang.order.service;

import java.util.List;
import java.util.Map;

import com.standout.woopang.order.dto.OrderDTO;
import com.standout.woopang.order.vo.OrderVO;

public interface OrderService {

	//주문하기 - 결제완료후 주문 table에 insert 된다
	public void addNewOrder(List<OrderDTO> myOrderList) throws Exception;
}
