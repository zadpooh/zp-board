package com.dn.spring.boardConfig;

import com.dn.spring.boardConfig.domain.BoardConfig;
import org.apache.ibatis.annotations.Mapper;

import java.util.ArrayList;

@Mapper
public interface BoardConfigMapper {
	
	public ArrayList<BoardConfig> boardConifgList();
	

}
