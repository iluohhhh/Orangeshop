package com.orange.dao.product;

import com.orange.bean.product.ClassiFy;

import java.util.List;

/**

 * @Description
 
 */
public interface ClassiFyDao {

    void save(ClassiFy classiFy);

    List<ClassiFy> getClassByPage(ClassiFy classiFy);

    int getCount(ClassiFy classiFy);
}
