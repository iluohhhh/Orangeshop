package com.orange.dao.product;

import com.orange.bean.product.Img;

import java.util.List;


public interface ImgDao {

	/**
	 * 添加
	 * @param img
	 */
	public Integer addImg(Img img);

	/**
	 * 根据主键查找
	 * @param
	 */
	public Img getImgByKey(Integer id);


	/**
	 * 分页查询
	 * @param imgQuery
	 */
	public List<Img> getImgListWithPage(Img imgQuery);

	/**
	 * 集合查询
	 * @param imgQuery
	 */
	public List<Img> getImgList(Img imgQuery);
	
	/**
	 * 总条数
	 * @param imgQuery
	 */
	public int getImgListCount(Img imgQuery);

	/**
	 * 根据商品id查询
	 *
	 */
	List<Img> getImgByProductId(Integer productId);
}
