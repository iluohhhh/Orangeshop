package com.orange.service.impl;

import com.orange.bean.user.Employee;
import com.orange.dao.EmployeeDao;
import com.orange.service.user.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class EmployeeServiceImpl implements EmployeeService {
    @Autowired
    private EmployeeDao employeeDao;
    @Override
    public Employee getEmployee(Employee employee) {
        return employeeDao.getEmployee(employee);
    }
}
