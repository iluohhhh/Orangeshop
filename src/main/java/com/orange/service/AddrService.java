package com.orange.service;

import com.orange.bean.user.Addr;

import java.util.List;

/**

 * @Description:
 
 */
public interface AddrService {

    /**
     * 集合查询
     * @param addrQuery
     */
    public List<Addr> getAddrList(Addr addrQuery);
}
