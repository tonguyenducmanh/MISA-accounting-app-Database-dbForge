CREATE DEFINER=`root`@`localhost` PROCEDURE `misa.web08.gpbl.tnmanh`.Proc_department_SelectAll()
    COMMENT '
  -- Author: TNMANH
  -- Created date: 15/09/2022
  -- Description: Lấy toàn bộ danh sách bản ghi trong department
  -- Modified by:
  -- Code chạy thử Call Proc_department_SelectAll();
  '
BEGIN
  SELECT
    DepartmentID,
    DepartmentCode,
    DepartmentName,
    Description
  FROM department;
END