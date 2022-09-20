USE `misa.web08.gpbl.tnmanh`;

DROP PROCEDURE IF EXISTS Proc_department_GetAll;

DELIMITER $$

CREATE
DEFINER = 'root'@'localhost'
PROCEDURE Proc_department_GetAll ()
COMMENT '
  -- Author: TNMANH
  -- Created date: 15/09/2022
  -- Description: Lấy toàn bộ danh sách bản ghi trong department
  -- Modified by:
  -- Code chạy thử Call Proc_department_GetAll();
  '
BEGIN
  SELECT
    DepartmentID,
    DepartmentCode,
    DepartmentName,
    Description
  FROM department;
END
$$

DELIMITER ;