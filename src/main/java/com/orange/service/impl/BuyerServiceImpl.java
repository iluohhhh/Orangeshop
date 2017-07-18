package com.orange.service.impl;

import com.orange.bean.user.Buyer;
import com.orange.dao.BuyerDao;
import com.orange.service.BuyerService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;


@Service
@Transactional
public class BuyerServiceImpl implements BuyerService {
    @Resource
    private BuyerDao buyerDao;

    /**
     * 根据购买者的账号及密码查询
     * @param userName
     * @param password
     * @return
     */
    public Buyer getBuyerByUserNameAndPassword(String userName, String password) {
        Buyer buyerQuery = new Buyer();
        buyerQuery.setUsername(userName);
        buyerQuery.setPassword(password);

        List<Buyer> buyerList = buyerDao.getBuyerList(buyerQuery);
        if(null != buyerList && buyerList.size() >0){
            return buyerList.get(0);
        }
        return null;
    }

    @Override
    public void addBuyer(Buyer buyer) {
        if(buyer != null){
            buyerDao.addBuyer(buyer);
        }
    }
}
