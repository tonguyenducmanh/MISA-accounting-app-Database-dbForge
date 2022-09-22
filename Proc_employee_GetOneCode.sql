USE `misa.web08.gpbl.tnmanh`;

DROP PROCEDURE IF EXISTS Proc_employee_GetOneCode;

DELIMITER $$

CREATE
DEFINER = 'root'@'localhost'
PROCEDURE Proc_employee_GetOneCode (IN v_EmployeeCode char(36) -- Mã nhân viên để kiểm tra xem có trùng không
)
COMMENT '
  -- Author: TNMANH
  -- Created date: 15/09/2022
  -- Description: Kiểm tra xem mã nhân viên đã trùng hay chưa
  -- Modified by:
  -- Code chạy thử Call Proc_employee_GetOneCode("NV001");
  '
BEGIN
  SELECT
    e.EmployeeID,
    e.EmployeeCode,
    e.FullName
  FROM employee e
  WHERE e.EmployeeCode = v_EmployeeCode;
END
$$

DELIMITER ;