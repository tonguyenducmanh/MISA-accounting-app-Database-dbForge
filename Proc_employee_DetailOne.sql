CREATE DEFINER=`root`@`localhost` PROCEDURE `misa.web08.gpbl.tnmanh`.Proc_employee_DetailOne(
IN v_id char(36) -- Id dùng để lấy thông tin chi tiết của 1 người
)
    COMMENT '
  -- Author: TNMANH
  -- Created date: 15/09/2022
  -- Description: Lấy chi tiết 1 bản ghi trong bảng employee theo id
  -- Modified by:
  -- Code chạy thử Call Proc_employee_DetailOne(11131abd-1b99-688b-96f6-423b4e874d0f);
  '
BEGIN
  SET @getOneQuery = CONCAT('
  SELECT e.EmployeeID,
  e.EmployeeCode, 
  e.FullName, 
  e.EmployeeGender, 
  e.DateOfBirth, 
  e.IdentityCard, 
  e.IdentityPlace, 
  e.Address, 
  e.PNumRelative, 
  e.PNumFix , 
  e.Email,
  e.PositionID,
  e.DepartmentID,
  e.PositionName, 
  e.DepartmentName, 
  e.BankAccount, 
  e.BankName,
  e.BankBranch
  FROM employee e WHERE e.EmployeeId = ''', 
  v_id, '''');
  PREPARE getOneQuery FROM @getOneQuery;
  EXECUTE getOneQuery;
  DEALLOCATE PREPARE getOneQuery;
END