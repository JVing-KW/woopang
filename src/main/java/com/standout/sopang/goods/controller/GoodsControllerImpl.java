package com.standout.sopang.goods.controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.standout.sopang.goods.dto.GoodsDTO;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.standout.sopang.common.base.BaseController;
import com.standout.sopang.goods.service.GoodsService;
import com.standout.sopang.goods.vo.GoodsVO;

import net.sf.json.JSONObject;

@Log4j2
@Controller("goodsController")
@RequestMapping(value="/goods")
public class GoodsControllerImpl extends BaseController   implements GoodsController {
	@Autowired
	private GoodsService goodsService;
	
	//����Ʈ������

	@Override
	@RequestMapping(value="menuGoods" ,method = RequestMethod.GET)
	public String menuGoods(String menuGoods, Model model,
							HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		List<GoodsDTO> goodsList=goodsService.menuGoods(menuGoods);
		//������ �����Ϳ� ī�װ����� �����Ͽ� return.
		model.addAttribute("goodsList", goodsList);
		model.addAttribute("menuGoods", menuGoods);
		return "/goods/menuGoods";
	}



	@Override
	@RequestMapping(value="/keywordSearch",method = RequestMethod.GET,produces = "application/text; charset=utf8")
	public String keywordSearch(String keyword, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		response.setCharacterEncoding("utf-8");

		if(keyword == null || keyword.equals(""))
			return null ;
		keyword = keyword.toUpperCase();
		List<String> keywordList =goodsService.keywordSearch(keyword);

		JSONObject jsonObject = new JSONObject();
		jsonObject.put("keyword", keywordList);
		String jsonInfo = jsonObject.toString();

		log.info(jsonInfo);
		log.info(jsonInfo.toString());

		return jsonInfo;
	}


	@Override
	@RequestMapping(value="/searchGoods" ,method = RequestMethod.GET)
	public String searchGoods(String searchWord,Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		List<GoodsDTO> goodsList=goodsService.searchGoods(searchWord);
		model.addAttribute("goodsList",goodsList);
		log.info(searchWord);
		log.info(goodsList.toString());
		return "/goods/searchGoods";
	}


	@Override
	@RequestMapping(value="/goodsDetail" ,method = RequestMethod.GET)
	public String goodsDetail(@RequestParam("goods_id") String goods_id, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session=request.getSession();
		//검색된 굿즈 아이디를 이용해  이미지와 파이을 맵 형태로 저장 후 보내준다.
		Map goodsMap=goodsService.goodsDetail(goods_id);
		model.addAttribute("goodsMap", goodsMap);
		log.info("goodsMap"+goodsMap);

		GoodsDTO goodsDTO=(GoodsDTO)goodsMap.get("goodsDTO");
		addGoodsInQuick(goods_id,goodsDTO,session);
	return "/goods/goodsDetail";
	}


	
	
	
	//���޴�
	private void addGoodsInQuick(String goods_id,GoodsDTO goodsDTO,HttpSession session){
		//�ߺ�üũ�� ���� ���� �ʱ�ȭ
		boolean already_existed=false;
		
		//���� ���޴� ����Ʈ quickGoodsList �Ҵ�
		List<GoodsDTO> quickGoodsList;
		quickGoodsList=(ArrayList<GoodsDTO>)session.getAttribute("quickGoodsList");
		
		//���޴��� ����Ʈ�� ������
		if(quickGoodsList!=null){
			
			//���޴� ����Ʈ���� 3���� ����Ʈ�� ǥ���Ұ���.
			if(quickGoodsList.size() < 3){
				for(int i=0; i<quickGoodsList.size();i++){
					String _goodsBean=String.valueOf(quickGoodsList.get(i).getGoods_id());
					//��ǰid, goods_id�� �����ϴٸ� already_existed=true, �ڵ�����.
					if(goods_id.equals(_goodsBean)){
						already_existed=true;
						break;
					}
				}
				//already_existed�� false, �ߺ������ʴ� ���ο� ��ǰ�� ��� add
				if(already_existed==false){
					quickGoodsList.add(goodsDTO);
				}

			//���޴� ����Ʈ�� 3���� �Ѿ�� �ɰ��
			}else {
				//ù���� ��ǰ�� ���ְ� ���ο� ��ǰ�� �߰�.
				quickGoodsList.remove(0);
				quickGoodsList.add(goodsDTO);
			}
		
		
		//���޴��� ����Ʈ�� ���� ��� �� ArrayList���� �� �߰� add
		}else{
			quickGoodsList =new ArrayList<GoodsDTO>();
			quickGoodsList.add(goodsDTO);
		}
		
		//�� �۾��� �Ϸ� �� �� ���ǿ� ����.
		session.setAttribute("quickGoodsList",quickGoodsList);
		session.setAttribute("quickGoodsListNum", quickGoodsList.size());
	}
	
}
