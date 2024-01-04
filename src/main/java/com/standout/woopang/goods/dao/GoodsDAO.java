package com.standout.woopang.goods.dao;

import java.util.List;
import java.util.Map;

import com.standout.woopang.goods.dto.GoodsDTO;
import org.springframework.dao.DataAccessException;

import com.standout.woopang.goods.vo.GoodsVO;
import com.standout.woopang.goods.vo.ImageFileVO;

public interface GoodsDAO {
	//메인페이지 - 지정 status별
	public List<GoodsVO> selectGoodsList(String goodsStatus ) throws DataAccessException;
	
	//header 카테고리별
	public List<GoodsVO> selectMenusList(String goodsSort ) throws DataAccessException;
	
	//리스트페이지
	public List<GoodsVO> selectGoodsByMenuGoods(String menuGoods) throws DataAccessException;
	
	//추천키워드
	public List<String> selectKeywordSearch(String keyword) throws DataAccessException;
	
	//검색
	public List<GoodsVO> selectGoodsBySearchWord(Map<String, String> map) throws DataAccessException;
	
	//상품상세
	public GoodsVO selectGoodsDetail(String goods_id) throws DataAccessException;
	public List<ImageFileVO> selectGoodsDetailImage(String goods_id) throws DataAccessException;
}
