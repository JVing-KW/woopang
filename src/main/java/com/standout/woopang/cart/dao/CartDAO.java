package com.standout.woopang.cart.dao;

import java.util.List;

import com.standout.woopang.cart.dto.CartDTO;
import org.springframework.dao.DataAccessException;

import com.standout.woopang.cart.vo.CartVO;
import com.standout.woopang.goods.vo.GoodsVO;

public interface CartDAO {

	public List<CartVO> selectCartList(CartDTO cartDTO) throws DataAccessException;
	public List<GoodsVO> selectGoodsList(List<CartDTO> cartList) throws DataAccessException;


	public boolean selectCountInCart(CartDTO cartDTO) throws DataAccessException;
	public void insertGoodsInCart(CartDTO cartDTO) throws DataAccessException;


	public void deleteCartGoods(int cart_id) throws DataAccessException;


	public void updateCartGoodsQty(CartDTO cartDTO) throws DataAccessException;

}