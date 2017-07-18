package com.orange.dao.product;

import com.orange.bean.product.Color;

import java.util.List;


public interface ColorDao {

	/**
	 * 添加
	 * @param color
	 */
	public Integer addColor(Color color);

	/**
	 * 根据主键查找
	 * @param id
	 */
	public Color getColorByKey(Integer id);

	/**
	 * 根据主键批量查找
	 * @param colorQuery
	 */
	public List<Color> getColorsByKeys(List<Integer> idList);

	/**
	 * 根据主键删除
	 * @param colorQuery
	 */
	public Integer deleteByKey(Integer id);

	/**
	 * 根据主键批量删除
	 * @param colorQuery
	 */
	public Integer deleteByKeys(List<Integer> idList);

	/**
	 * 根据主键更新
	 * @param colorQuery
	 */
	public Integer updateColorByKey(Color color);

	/**
	 * 分页查询
	 * @param colorQuery
	 */
	public List<Color> getColorListWithPage(Color colorQuery);

	/**
	 * 集合查询
	 * @param colorQuery
	 */
	public List<Color> getColorList(Color colorQuery);
	
	/**
	 * 总条数
	 * @param colorQuery
	 */
	public int getColorListCount(Color colorQuery);
}
