package com.orange.dao.product;

import com.orange.bean.product.Sku;

import java.util.List;


public interface SkuDao {

	/**
	 * 添加
	 * @param sku
	 */
	public Integer addSku(Sku sku);

	/**
	 * 根据主键查找
	 * @param id
	 */
	public Sku getSkuByKey(Integer id);


	/**
	 * 根据主键更新
	 * @param sku
	 */
	public Integer updateSkuByKey(Sku sku);

	/**
	 * 分页查询
	 * @param skuQuery
	 */
	public List<Sku> getSkuListWithPage(Sku skuQuery);
	/**
	 * 总条数
	 * @param skuQuery
	 */
	public int getSkuListCount(Sku skuQuery);
	/**
	 * 库存大于>0
	 */
	 List<Sku> getStock(Integer productId);


}
