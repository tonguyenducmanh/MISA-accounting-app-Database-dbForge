CREATE DEFINER=`root`@`localhost` PROCEDURE `misa.web08.gpbl.tnmanh`.Proc_employee_DeleteOne(
IN v_Id char(36) -- id của employee muốn xóa
)
    COMMENT '
  -- Author: TNMANH
  -- Created date: 15/09/2022
  -- Description: Xóa 1 bản ghi trong bảng employee theo id
  -- Modified by:
  -- Code chạy thử Call Proc_employee_DeleteOne(11131abd-1b99-688b-96f6-423b4e874d0f);
  '
BEGIN
  SET @deleteQuery = CONCAT('DELETE FROM employee WHERE EmployeeID = ''', v_Id, '''');
  -- @deleteQuery là 1 biến có kiểu dữ liệu là string
  PREPARE deleteQuery FROM @deleteQuery;
  EXECUTE deleteQuery;
  DEALLOCATE PREPARE deleteQuery;
END