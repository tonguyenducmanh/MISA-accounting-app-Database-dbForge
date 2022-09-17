CREATE DEFINER=`root`@`localhost` PROCEDURE `misa.web08.gpbl.tnmanh`.Proc_employee_SelectAll()
    COMMENT '
  -- Author: TNMANH
  -- Created date: 15/09/2022
  -- Description: Lấy toàn bộ danh sách bản ghi trong employee
  -- Modified by:
  -- Code chạy thử Call Proc_employee_SelectAll();
  '
BEGIN
  SELECT
    EmployeeID,
    EmployeeCode,
    FullName,
    EmployeeGender,
    EmployeeType,
    DateOfBirth,
    IdentityCard,
    IdentityPlace,
    Address,
    PNumRelative,
    PNumFix,
    Email,
    PositionID,
    DepartmentID,
    PositionName,
    DepartmentName,
    BankAccount,
    BankName,
    BankBranch
  FROM employee;
END