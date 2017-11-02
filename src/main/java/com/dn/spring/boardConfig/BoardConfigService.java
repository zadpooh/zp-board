package com.dn.spring.boardConfig;

import com.dn.spring.board.BoardMapper;
import com.dn.spring.board.domain.Board;
import com.dn.spring.board.support.BoardParam;
import com.dn.spring.boardConfig.domain.BoardConfig;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class BoardConfigService {

	@Autowired
	private BoardConfigMapper boardConfigMapper;
	
	/**
	 * 게시판 목록
	 * @return ArrayList
	 */
	public ArrayList<BoardConfig> boardConifgList(){
		return boardConfigMapper.boardConifgList();
	}
	
}
