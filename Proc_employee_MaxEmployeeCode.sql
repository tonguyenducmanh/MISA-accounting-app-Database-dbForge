CREATE 
	DEFINER = 'root'@'localhost'
PROCEDURE `misa.web08.gpbl.tnmanh`.Proc_employee_MaxEmployeeCode()
COMMENT '
  -- Author: TNMANH
  -- Created date: 15/09/2022
  -- Description: Lấy bản ghi có mã nhân viên lớn nhất trong bảng employee
  -- Modified by:
  -- Code chạy thử Call Proc_employee_MaxEmployeeCode();
  '
BEGIN
  SELECT
    MAX(EmployeeCode)
  FROM employee;
END