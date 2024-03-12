package com.example.test1.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.test1.mapper.BoardMapper;
import com.example.test1.model.Board;

import com.example.test1.model.BoardFile;
import com.example.test1.model.Comment;

@Service
public class BoardServiceimpl implements BoardService{
	@Autowired
	BoardMapper boardMapper;


	@Override
	public HashMap<String, Object> searchBoardList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> board = new HashMap<String, Object>();
		try {
			List<Board> list= boardMapper.selectBoardList(map);
			board.put("list", list);
			board.put("result", "success");
		} catch (Exception e) {
			// TODO: handle exception
			board.put("result", "fail");
		}
		return board;
	
	}
	
	
	/*
	 * @Override public HashMap<String, Object> searchBoardInfo(HashMap<String,
	 * Object> map) { // TODO Auto-generated method stub HashMap<String, Object>
	 * resultMap = new HashMap<String, Object>(); //String str = (String)
	 * map.get("str");
	 * 
	 * Board board = boardMapper.selectBoardInfo(map);// 게시글 상세 조회 //List<BoardFile>
	 * fileList = boardMapper.boardFileList(map);//파일 목록 //List<Comment> commentList
	 * = boardMapper.selectCommentInfo(map);//댓글 목록 조회
	 * 
	 * resultMap.put("list", board); //resultMap.put("fileList", fileList);
	 * //resultMap.put("commentList", commentList);//댓글 목록 조회 //
	 * resultMap.put("pCommentList", pCommentList); //대댓글 작성해보기
	 * resultMap.put("result", "success"); return resultMap;
	 * 
	 * }
	 */

	@Override
	public HashMap<String, Object> writeBoardList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			boardMapper.writeBoard(map);
		//	boardMapper.insertBoardFile(map);
			resultMap.put("boardNo", map.get("BOARDNO"));
			resultMap.put("result", "success");
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			resultMap.put("result", "fail");
		}
		return resultMap;
	}

	@Override
	public HashMap<String, Object> inBoardFile(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public HashMap<String, Object> removeBoard(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			boardMapper.deleteBoard(map);
			resultMap.put("result", "success");
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());//try catch 사용할때 필수로 넣기 에러봐야되니깐
			resultMap.put("result", "fail");
		}
		return resultMap;
	}

	@Override
	public HashMap<String, Object> searchBoardInfo(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		boardMapper.updateHit(map); // 조회수 증가
		
		try {
			Board board = boardMapper.selectBoardInfo(map);// 게시글 상세 조회
			resultMap.put("info", board);
			resultMap.put("result", "success");
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			resultMap.put("result", "fail");
		}
		return resultMap;
	}

	@Override
	public HashMap<String, Object> editBoard(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			boardMapper.boardEdit(map);
			resultMap.put("result", "success");
		} catch (Exception e) {
			// TODO: handle exception
			resultMap.put("result", "fail");
		}
		return resultMap;
	}

	//고객 문의 리스트
	@Override
	public HashMap<String, Object> searchCustomerInquiryList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			List<Board> list = boardMapper.selectCustomerInquiryList(map);
			
			resultMap.put("list", list);
			resultMap.put("result","success");
		} catch (Exception e) {
			// TODO: handle 
			System.out.println(e.getMessage());
			resultMap.put("result","fail");
		}
		return resultMap;
	}
	
	//문의 등록
	@Override
	public HashMap<String, Object> addCustomerInquiry(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			boardMapper.insertCustomerInquiry(map);
			
			resultMap.put("result","success");
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			resultMap.put("result","fail");
		}
		return resultMap;
	}
	
	//등록한 문의 조회
	@Override
	public HashMap<String, Object> searchInquiryInfo(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			Board board = boardMapper.selectInquiryInfo(map);
			resultMap.put("info", board);
			resultMap.put("result","success");
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			resultMap.put("result","fail");
		}
		return resultMap;
	}
	
	//등록한 문의 삭제
	@Override
	public HashMap<String, Object> removeInquiry(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			boardMapper.deleteInquiry(map);
			resultMap.put("result","success");
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			resultMap.put("result","fail");
		}
		return resultMap;
	}
	
	//등록한 문의 수정
	@Override
	public HashMap<String, Object> editInquiry(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			boardMapper.updateInquiry(map);
			resultMap.put("result","success");
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			resultMap.put("result","fail");
		}
		return resultMap;
	}


	@Override
	public HashMap<String, Object> addBoardFile(HashMap<String, Object> map) {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		try {
			boardMapper.insertBoardFile(map);
			resultMap.put("result", "success");

		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			resultMap.put("result", "fail");
		}
		return resultMap;
	}

	@Override
	public HashMap<String, Object> addBoardContentsFile(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		try {
			boardMapper.insertBoardContentsFile(map);
			resultMap.put("result", "success");

		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			resultMap.put("result", "fail");
		}
		return resultMap;

	}

	@Override
	public HashMap<String, Object> removefile(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			boardMapper.fileDelete(map);
			resultMap.put("result", "success");
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			resultMap.put("result", "fail");
		}
		
		return resultMap;
	}
	
	
	
	
}
