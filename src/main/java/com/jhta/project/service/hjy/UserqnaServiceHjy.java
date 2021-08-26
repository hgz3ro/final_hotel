package com.jhta.project.service.hjy;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.mybatis.mapper.hjy.UserqnaMapperHjy;
import com.jhta.project.vo.hjy.UserqnaVo;

@Service
public class UserqnaServiceHjy {
	@Autowired UserqnaMapperHjy mapper;
	public List<UserqnaVo> qnalist(HashMap<String, Object> map) {
		return mapper.qnalist(map);
	};
	public int qnacount(HashMap<String, Object> map) {
		return mapper.qnacount(map);
	};
	public UserqnaVo qnaDetail(int qid){
		return mapper.qnaDetail(qid);
	};
}
