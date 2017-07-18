package com.orange.dao.product;

import com.orange.bean.product.Feature;

import java.util.List;


public interface FeatureDao {

	/**
	 * 添加
	 * @param feature
	 */
	public Integer addFeature(Feature feature);

	/**
	 * 根据主键查找
	 * @param
	 */
	public Feature getFeatureByKey(Integer id);

	/**
	 * 根据主键批量查找
	 * @param
	 */
	public List<Feature> getFeaturesByKeys(List<Integer> idList);

	/**
	 * 根据主键删除
	 * @param
	 */
	public Integer deleteByKey(Integer id);

	/**
	 * 根据主键批量删除
	 * @param
	 */
	public Integer deleteByKeys(List<Integer> idList);

	/**
	 * 根据主键更新
	 * @param
	 */
	public Integer updateFeatureByKey(Feature feature);

	/**
	 * 分页查询
	 * @param featureQuery
	 */
	public List<Feature> getFeatureListWithPage(Feature featureQuery);

	/**
	 * 集合查询
	 * @param featureQuery
	 */
	public List<Feature> getFeatureList(Feature featureQuery);
	
	/**
	 * 总条数
	 * @param featureQuery
	 */
	public int getFeatureListCount(Feature featureQuery);
}
