package com.orange.dao;

import java.util.List;

import com.orange.bean.user.Addr;

public interface AddrDao {

	/**
	 * 添加
	 * @param addr
	 */
	public Integer addAddr(Addr addr);


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
	public Integer updateAddrByKey(Addr addr);

	/**
	 * 分页查询
	 * @param addrQuery
	 */
	public List<Addr> getAddrListWithPage(Addr addrQuery);

	/**
	 * 集合查询
	 * @param addrQuery
	 */
	public List<Addr> getAddrList(Addr addrQuery);
	
	/**
	 * 总条数
	 * @param addrQuery
	 */
	public int getAddrListCount(Addr addrQuery);
}
