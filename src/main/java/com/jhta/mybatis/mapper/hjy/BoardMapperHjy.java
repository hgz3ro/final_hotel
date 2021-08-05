package com.jhta.mybatis.mapper.hjy;

import java.util.HashMap;
import java.util.List;

import com.jhta.project.vo.hjy.BoardVo;

public interface BoardMapperHjy {
	public int count(HashMap<String, Object> map);
	public List<BoardVo> list(HashMap<String, Object> map);
	public BoardVo detail(int bid);
	public BoardVo prev(int bid);
	public BoardVo next(int bid);
}
