package com.standout.woopang.admin.goods.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.standout.woopang.goods.dto.GoodsDTO;
import com.standout.woopang.goods.dto.ImageFileDTO;
import com.standout.woopang.goods.vo.GoodsVO;
import com.standout.woopang.goods.vo.ImageFileVO;
import com.standout.woopang.order.vo.OrderVO;

public interface AdminGoodsService {
	// 상품관리
	public List<GoodsDTO> listNewGoods(Map condMap) throws Exception;

	//상품추가
	public int addNewGoods(Map newGoodsMap) throws Exception;
	public void addNewGoodsImage(List<ImageFileDTO> imageFileList) throws Exception;

	//상품삭제
	public void deleteGoods(String goods_id) throws Exception;

	//상품수정
	public void modifyGoods(String goods_id, Map newGoodsMap) throws Exception;

}
