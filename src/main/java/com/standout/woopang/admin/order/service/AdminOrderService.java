package com.standout.woopang.admin.order.service;

import java.util.List;
import java.util.Map;

import com.standout.woopang.order.dto.OrderDTO;
import com.standout.woopang.order.vo.OrderVO;

public interface AdminOrderService {
	

	public List<OrderDTO> listNewOrder(Map condMap) throws Exception;


	public void modifyDeliveryState(Map deliveryMap) throws Exception;
}
