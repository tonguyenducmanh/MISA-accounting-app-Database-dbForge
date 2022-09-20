USE `misa.web08.gpbl.tnmanh`;

DROP PROCEDURE IF EXISTS Proc_employee_GetAll;

DELIMITER $$

CREATE
DEFINER = 'root'@'localhost'
PROCEDURE Proc_employee_GetAll ()
COMMENT '
  -- Author: TNMANH
  -- Created date: 15/09/2022
  -- Description: Lấy toàn bộ danh sách bản ghi trong employee
  -- Modified by:
  -- Code chạy thử Call `Proc_employee_GetAll`();
  '
BEGIN
  SELECT
    EmployeeID,
    EmployeeCode,
    FullName,
    Gender,
    EmployeeType,
    DateOfBirth,
    IdentityCard,
    IdentityPlace,
    Address,
    PhoneNumberRelative,
    PhoneNumberFix,
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
$$

DELIMITER ;