package com.standout.woopang.order.config;

import com.standout.woopang.mypage.dto.MyPageDTO;
import com.standout.woopang.mypage.vo.MyPageVO;
import com.standout.woopang.order.dto.OrderDTO;
import com.standout.woopang.order.vo.OrderVO;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;


    @Service
    public class OrderConvert {
        @Autowired
        ModelMapper modelMapper;
        public List<OrderDTO> convertList(List<OrderVO> myPageList) {

            return myPageList.stream()
                    .map(orderList -> modelMapper.map(orderList, OrderDTO.class))
                    .collect(Collectors.toList());

    }
}
