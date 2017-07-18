package com.orange.dao;

import com.orange.bean.user.Employee;
import org.junit.Test;

import javax.annotation.Resource;


public class EmployeeDaoTest extends SpringTestCase {
    @Resource
    private EmployeeDao employeeDao;
    @Test
    public void getEmployeeByKeyTest(){
        Employee employee = new Employee();
        employee.setUsername("admin");
        employee.setPassword("123456");
        Employee result = employeeDao.getEmployee(employee);
        System.out.println(result.toString());
    }
}
