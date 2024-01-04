package com.standout.woopang.config;


import com.standout.woopang.cart.dto.CartDTO;
import com.standout.woopang.cart.vo.CartVO;
import com.standout.woopang.goods.dto.GoodsDTO;
import com.standout.woopang.goods.dto.ImageFileDTO;
import com.standout.woopang.goods.vo.GoodsVO;
import com.standout.woopang.goods.vo.ImageFileVO;
import com.standout.woopang.member.dto.MemberDTO;
import com.standout.woopang.member.vo.MemberVO;
import com.standout.woopang.order.dto.OrderDTO;
import com.standout.woopang.order.vo.OrderVO;
import org.modelmapper.ModelMapper;
import org.modelmapper.internal.bytebuddy.asm.Advice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class ConvertList {

    @Autowired
    ModelMapper modelMapper;

    public List<GoodsDTO> goodsConvertDTO(List<GoodsVO> goodsList ) {

        return goodsList.stream()
                .map(goods -> modelMapper.map(goods, GoodsDTO.class))
                .collect(Collectors.toList());
    }

    public List<ImageFileDTO> imgageConvertDTO(List<ImageFileVO> imageList ) {

        return imageList.stream()
                .map(image -> modelMapper.map(image, ImageFileDTO.class))
                .collect(Collectors.toList());
    }
    public List<CartDTO> cartConvertDTO(List<CartVO> goodsList ) {

        return goodsList.stream()
                .map(cart -> modelMapper.map(cart, CartDTO.class))
                .collect(Collectors.toList());
    }
    public ArrayList<MemberDTO> memberConvertDTO(List<MemberVO> memberList ) {

        return memberList.stream()
                .map(member -> modelMapper.map(member, MemberDTO.class))
                .collect(Collectors.toCollection(ArrayList::new));
    }
    public List<OrderDTO> orderConverDTO(List<OrderVO> myPageList) {

        return myPageList.stream()
                .map(order -> modelMapper.map(order, OrderDTO.class))
                .collect(Collectors.toList());

    }
    //=== vo ================
    public List<ImageFileVO> imageConvertVO(List<ImageFileDTO> imageFileList){

        return  imageFileList.stream()
                .map(image->modelMapper.map(image,ImageFileVO.class))
                .collect(Collectors.toList());
    }


}
