package com.orange.dao.product;

import com.orange.bean.product.Type;

import java.util.List;


public interface TypeDao {


	/**
	 * 集合查询
	 * @param type
	 */
	List<Type> getTypeList(Type type);

	int getCount(Type type);

	List<Type> getTypeListByPage(Type type);

	void save(Type type);

	/**
	 * 根据id删除
	 * @param id
	 */
	void delete(Integer id);

}
