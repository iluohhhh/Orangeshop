package com.orange.service.impl;

import com.orange.bean.order.Detail;
import com.orange.dao.DetailDao;
import com.orange.service.DetailService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**

 * @Description: 订单详情项

 */
@Service
@Transactional
public class DetailServiceImpl implements DetailService{
    @Resource
    private DetailDao detailDao;

    /**
     * 插入数据库
     *
     * @return
     */
    public Integer addDetail(Detail detail) {
        return detailDao.addDetail(detail);
    }

    /**
     * 根据主键查找
     */
    @Transactional(readOnly = true)
    public Detail getDetailByKey(Integer id) {
        return detailDao.getDetailByKey(id);
    }



    /**
     * 根据主键更新
     *
     * @return
     */
    public Integer updateDetailByKey(Detail detail) {
        return detailDao.updateDetailByKey(detail);
    }


    @Transactional(readOnly = true)
    public List<Detail> getDetailList(Detail detailQuery) {
        return detailDao.getDetailList(detailQuery);
    }
}
