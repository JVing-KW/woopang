package com.standout.sopang.goods.service;

import com.standout.sopang.config.ConvertList;
import com.standout.sopang.goods.dao.GoodsDAO;
import com.standout.sopang.goods.dto.GoodsDTO;
import com.standout.sopang.goods.dto.ImageFileDTO;
import com.standout.sopang.goods.vo.GoodsVO;
import com.standout.sopang.goods.vo.ImageFileVO;
import lombok.RequiredArgsConstructor;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


@RequiredArgsConstructor
@Service("goodsService")
@Transactional(propagation = Propagation.REQUIRED)
public class GoodsServiceImpl implements GoodsService {


	@Autowired
	private GoodsDAO goodsDAO;
	@Autowired
	private ModelMapper modelMapper;
	@Autowired
	ConvertList convertList;
	List<GoodsDTO> dtoList;
	List<ImageFileDTO> imageListDto;


	public Map<String, List<GoodsDTO>> listGoods() throws Exception {
		Map<String, List <GoodsDTO>> goodsMap = new HashMap<String, List<GoodsDTO>>();

		//bestseller ����
		List<GoodsVO> goodsList = goodsDAO.selectGoodsList("bestseller");
		dtoList =convertList.goodsConvertDTO(goodsList);
		goodsMap.put("bestseller", dtoList);

		//������ ��ǰ ����
		goodsList = goodsDAO.selectMenusList("cate_digital");
		dtoList =convertList.goodsConvertDTO(goodsList);
		goodsMap.put("cate_digital", dtoList);

		//���� ��ǰ ����
		goodsList = goodsDAO.selectMenusList("cate_book");
		dtoList =convertList.goodsConvertDTO(goodsList);
		goodsMap.put("cate_book", dtoList);

		//�ǰ���ɽ�ǰ ��ǰ ����
		goodsList = goodsDAO.selectMenusList("cate_health");
		dtoList =convertList.goodsConvertDTO(goodsList);
		goodsMap.put("cate_health", dtoList);

		//��Ȱ��ǰ ��ǰ ����
		goodsList = goodsDAO.selectMenusList("cate_daily");
		dtoList =convertList.goodsConvertDTO(goodsList);
		goodsMap.put("cate_daily", dtoList);


		return goodsMap;
	}


	//header ī�װ���
	@Override
	public List<GoodsDTO> menuGoods(String menuGoods) throws Exception {

		List<GoodsVO> goodsList = goodsDAO.selectGoodsByMenuGoods(menuGoods);
		dtoList =convertList.goodsConvertDTO(goodsList);
		return dtoList;
	}

	//��õŰ����
	@Override
	public List<String> keywordSearch(String keyword) throws Exception {
		List<String> list = goodsDAO.selectKeywordSearch(keyword);
		return list;
	}

	//�˻�
	@Override
	public List<GoodsDTO> searchGoods(String searchWord) throws Exception {
		List goodsList = goodsDAO.selectGoodsBySearchWord(searchWord);
		dtoList =convertList.goodsConvertDTO(goodsList);

		return dtoList;
	}

	//��ǰ��
	public Map goodsDetail(String _goods_id) throws Exception {
		Map goodsMap = new HashMap();

		GoodsVO goodsVO = goodsDAO.selectGoodsDetail(_goods_id);
		GoodsDTO goodsDTO =modelMapper.map(goodsVO,GoodsDTO.class);
		goodsMap.put("goodsDTO", goodsDTO);

		List<ImageFileVO> imageList = goodsDAO.selectGoodsDetailImage(_goods_id);
		imageListDto =convertList.imgageConvertDTO(imageList);
		goodsMap.put("imageList", imageListDto);

		return goodsMap;
	}

}
