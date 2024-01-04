package com.standout.woopang.cart.config;


import com.standout.woopang.cart.dao.CartDAO;
import com.standout.woopang.cart.dto.CartDTO;
import com.standout.woopang.cart.vo.CartVO;
import com.standout.woopang.goods.dto.GoodsDTO;
import com.standout.woopang.goods.vo.GoodsVO;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import java.util.List;
import java.util.stream.Collectors;
@Service
public class CartConvert {

    @Autowired
    ModelMapper modelMapper;


    public List<CartDTO> convertDTO(List<CartVO> goodsList ) {

        return goodsList.stream()
                .map(cart -> modelMapper.map(cart, CartDTO.class))
                .collect(Collectors.toList());
    }

}
