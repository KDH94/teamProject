package com.example.test1.mapper;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.test1.model.Product;

@Mapper
public interface AdminMapper {
	List<Product> selectProductList(HashMap<String, Object> map); //제품 리스트
}

