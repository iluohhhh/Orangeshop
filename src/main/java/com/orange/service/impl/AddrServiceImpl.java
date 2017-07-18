package com.orange.service.impl;

import com.orange.bean.user.Addr;
import com.orange.dao.AddrDao;
import com.orange.service.AddrService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;


@Service
public class AddrServiceImpl implements AddrService {

    @Resource
    private AddrDao addrDao;
    @Override
    public List<Addr> getAddrList(Addr addrQuery) {
        return addrDao.getAddrList(addrQuery);
    }
}
