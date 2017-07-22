package com.orange.dao;

import com.orange.bean.user.Buyer;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;


public interface BuyerDao {

    @Update("update tb_user set password=#{password} where username=#{username}")
    static void updateUserPassword(@Param("username") String username, @Param("password") String password) {
        // TODO Auto-generated method stub
    }

	/**
	 * 添加
	 * @param buyer
	 */
	Integer addBuyer(Buyer buyer);

	/**
	 * 根据主键批量查找
	 * @param
	 */
	 List<Buyer> getBuyersByKeys(List<String> idList);

	/**
	 * 根据主键删除
	 * @param
	 */
	 Integer deleteByKey(String id);

	/**
	 * 根据主键批量删除
	 * @param
	 */
    void deleteByKeys(List<String> idList);

	/**
	 * 根据主键更新
	 * @param
	 */
	 Integer updateBuyerByKey(Buyer buyer);

	/**
	 * 分页查询
	 * @param buyerQuery
	 */
	List<Buyer> getBuyerListWithPage(Buyer buyerQuery);

	/**
	 * 集合查询
	 * @param buyerQuery
	 */
	 List<Buyer> getBuyerList(Buyer buyerQuery);
	
	/**
	 * 总条数
	 * @param buyerQuery
	 */
	public int getBuyerListCount(Buyer buyerQuery);

}
