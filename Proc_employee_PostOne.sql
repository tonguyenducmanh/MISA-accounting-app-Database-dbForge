USE `misa.web08.gpbl.tnmanh`;

DROP PROCEDURE IF EXISTS Proc_employee_PostOne;

DELIMITER $$

CREATE
DEFINER = 'root'@'localhost'
PROCEDURE Proc_employee_PostOne (-- ID nhân viên
IN v_EmployeeCode varchar(20), -- ID nhân viên
IN v_FullName varchar(100), -- tên nhân viên
IN v_DateOfBirth datetime, -- ngày sinh nhân viên
IN v_Gender tinyint, -- giới tính nhân viên
IN v_EmployeeType tinyint, -- loại nhân viên là khách hàng hay là nhà cung cấp
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
IN v_CreatedDate datetime, -- ngày tạo nhân viên
IN v_CreatedBy varchar(100), -- người tạo nhân viên
IN v_ModifiedDate datetime, -- ngày sửa nhân viên gần nhất
IN v_ModifiedBy varchar(100))
COMMENT '
  -- Author: TNMANH
  -- Created date: 15/09/2022
  -- Description: Thêm 1 nhân viên mới vào trong bảng employee
  -- Modified by:
  -- Code chạy thử Call Proc_employee_PostOne("...");                      
  '
BEGIN
  INSERT employee (EmployeeID, EmployeeCode, FullName, DateOfBirth, Gender, EmployeeType, IdentityCard, IdentityDate, IdentityPlace, Address, PhoneNumberRelative, PhoneNumberFix, Email, BankAccount, BankName, BankBranch, DepartmentID, DepartmentName, PositionID, PositionName, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy)
    VALUES (UUID(), v_EmployeeCode, v_FullName, v_DateOfBirth, v_Gender, v_EmployeeType, v_IdentityCard, v_IdentityDate, v_IdentityPlace, v_Address, v_PhoneNumberRelative, v_PhoneNumberFix, v_Email, v_BankAccount, v_BankName, v_BankBranch, v_DepartmentID, v_DepartmentName, v_PositionID, v_PositionName, v_CreatedDate, v_CreatedBy, v_ModifiedDate, v_ModifiedBy);

END
$$

DELIMITER ;