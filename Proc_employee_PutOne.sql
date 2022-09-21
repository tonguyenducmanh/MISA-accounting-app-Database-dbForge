USE `misa.web08.gpbl.tnmanh`;

DROP PROCEDURE IF EXISTS Proc_employee_PutOne;

DELIMITER $$

CREATE
DEFINER = 'root'@'localhost'
PROCEDURE Proc_employee_PutOne (IN v_EmployeeID char(36), -- Mã nhân viên đang sửa
IN v_EmployeeCode varchar(20), IN v_FullName varchar(100), -- tên nhân viên
IN v_DateOfBirth datetime, -- ngày sinh nhân viên
IN v_Gender tinyint, -- giới tính nhân viên
IN v_EmployeeType tinyint, -- loại nhân viên, là khách hàng hay là nhà cung cấp
IN v_IdentityCard varchar(25), -- căn cước công dân/ chứng minh thư nhân viên
IN v_IdentityDate datetime, -- ngày cấp căn cước công dân / chứng minh thư
IN v_IdentityPlace varchar(255), -- nơi cấp căn cước công dân / chứng minh thư
IN v_Address varchar(255), -- địa chỉ nhân viên
IN v_PhoneNumberRelative varchar(50), -- số điện thoại cá nhân
IN v_PhoneNumberFix varchar(50), -- số điện thoại cố định
IN v_Email varchar(100), -- email nhân viên
IN v_BankAccount varchar(25), -- tài khoản ngân hàng
IN v_BankName varchar(255), -- tên ngân hàng
IN v_BankBranch varchar(255), -- chi nhánh ngân hàng
IN v_DepartmentID char(36), -- id đơn vị
IN v_DepartmentName varchar(255), -- tên đơn vị
IN v_PositionID char(36), -- id chức danh
IN v_PositionName varchar(255), -- tên chức danh    
IN v_ModifiedDate datetime, -- ngày sửa nhân viên gần nhất
IN v_ModifiedBy varchar(100))
COMMENT '
  -- Author: TNMANH
  -- Created date: 15/09/2022
  -- Description: Sủa 1 nhân viên có sẵn trong bảng employee
  -- Modified by:
  -- Code chạy thử Call Proc_employee_PutOne("...");                   
  '
BEGIN
  UPDATE employee e
  SET EmployeeCode = v_EmployeeCode,
      FullName = v_FullName,
      DateOfBirth = v_DateOfBirth,
      Gender = v_Gender,
      EmployeeType = v_EmployeeType,
      IdentityCard = v_IdentityCard,
      IdentityDate = v_IdentityDate,
      IdentityPlace = v_IdentityDate,
      Address = v_Address,
      PhoneNumberRelative = v_PhoneNumberRelative,
      PhoneNumberFix = v_PhoneNumberFix,
      Email = v_Email,
      BankAccount = v_BankAccount,
      BankName = v_BankName,
      BankBranch = v_BankBranch,
      DepartmentID = v_DepartmentID,
      DepartmentName = v_DepartmentName,
      PositionID = v_PositionID,
      PositionName = v_PositionName,
      ModifiedDate = v_ModifiedDate,
      ModifiedBy = v_ModifiedBy
  WHERE EmployeeID = v_EmployeeID;
END
$$

DELIMITER ;