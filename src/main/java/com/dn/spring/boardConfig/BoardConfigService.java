package com.dn.spring.boardConfig;

import com.dn.spring.board.BoardMapper;
import com.dn.spring.board.domain.Board;
import com.dn.spring.board.support.BoardParam;
import com.dn.spring.boardConfig.domain.BoardConfig;
import com.dn.spring.boardConfig.domain.BoardConfigMetaData;
import com.dn.spring.user.domain.UserInfo;
import com.google.gson.Gson;
import org.json.JSONObject;
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

		Gson gson = new Gson();

		ArrayList<BoardConfig> boardConfigList = new ArrayList<BoardConfig>();

		for(BoardConfig boardConfig : boardConfigMapper.boardConifgList()){

			JSONObject jsonObject = new JSONObject(boardConfig.getBoardConfigMetaData().toString());
			BoardConfigMetaData BoardConfigMetaData = gson.fromJson(jsonObject.toString(), BoardConfigMetaData.class);
			boardConfig.setBoardConfigMetaDataJson(BoardConfigMetaData);
			boardConfigList.add(boardConfig);
		}

		return boardConfigList;
	}
	
}
