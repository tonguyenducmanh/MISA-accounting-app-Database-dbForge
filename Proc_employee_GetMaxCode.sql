USE `misa.web08.gpbl.tnmanh`;

DROP PROCEDURE IF EXISTS Proc_employee_GetMaxCode;

DELIMITER $$

CREATE
DEFINER = 'root'@'localhost'
PROCEDURE Proc_employee_GetMaxCode ()
COMMENT '
  -- Author: TNMANH
  -- Created date: 15/09/2022
  -- Description: Lấy bản ghi có mã nhân viên lớn nhất trong bảng employee
  -- Modified by:
  -- Code chạy thử Call `Proc_employee_GetMaxCode`();
  '
BEGIN
  SELECT
    MAX(EmployeeCode)
  FROM employee;
END
$$

DELIMITER ;