USE `misa.web08.gpbl.tnmanh`;

DROP PROCEDURE IF EXISTS Proc_employee_GetOne;

DELIMITER $$

CREATE
DEFINER = 'root'@'localhost'
PROCEDURE Proc_employee_GetOne (IN v_id char(36) -- Id dùng để lấy thông tin chi tiết của 1 người
)
COMMENT '
  -- Author: TNMANH
  -- Created date: 15/09/2022
  -- Description: Lấy chi tiết 1 bản ghi trong bảng employee theo id
  -- Modified by:
  -- Code chạy thử Call Proc_employee_GetOne("112e1109-11e5-17aa-8777-d9ebc53aac3d");
  '
BEGIN
  SELECT
    e.EmployeeID,
    e.EmployeeCode,
    e.FullName,
    e.Gender,
    e.EmployeeType,
    e.DateOfBirth,
    e.IdentityCard,
    e.IdentityPlace,
    e.Address,
    e.PhoneNumberRelative,
    e.PhoneNumberFix,
    e.Email,
    e.PositionID,
    e.DepartmentID,
    e.PositionName,
    e.DepartmentName,
    e.BankAccount,
    e.BankName,
    e.BankBranch
  FROM employee e
  WHERE e.EmployeeId = v_id;
END
$$

DELIMITER ;