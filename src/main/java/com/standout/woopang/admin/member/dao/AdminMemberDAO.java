package com.standout.woopang.admin.member.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.standout.woopang.member.vo.MemberVO;

public interface AdminMemberDAO {

	public ArrayList<MemberVO> listMember(HashMap condMap) throws DataAccessException;
}
