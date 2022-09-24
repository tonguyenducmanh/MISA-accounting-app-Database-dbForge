﻿--
-- Script was generated by Devart dbForge Studio 2022 for MySQL, Version 9.1.8.0
-- Product home page: http://www.devart.com/dbforge/mysql/studio
-- Script date 24/09/2022 10:32:05 SA
-- Server version: 8.0.30
-- Client version: 4.1
--

-- 
-- Disable foreign keys
-- 
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

-- 
-- Set SQL mode
-- 
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 
-- Set character set the client will use to send SQL statements to the server
--
SET NAMES 'utf8';

--
-- Set default database
--
USE `misa.web08.gpbl.tnmanh`;

--
-- Drop procedure `Proc_employee_GetPaging`
--
DROP PROCEDURE IF EXISTS Proc_employee_GetPaging;

--
-- Drop procedure `Proc_employee_DeleteOneRecord`
--
DROP PROCEDURE IF EXISTS Proc_employee_DeleteOneRecord;

--
-- Drop procedure `Proc_employee_GetAll`
--
DROP PROCEDURE IF EXISTS Proc_employee_GetAll;

--
-- Drop procedure `Proc_employee_GetByID`
--
DROP PROCEDURE IF EXISTS Proc_employee_GetByID;

--
-- Drop procedure `Proc_employee_GetDuplicateCode`
--
DROP PROCEDURE IF EXISTS Proc_employee_GetDuplicateCode;

--
-- Drop procedure `Proc_employee_GetMaxCode`
--
DROP PROCEDURE IF EXISTS Proc_employee_GetMaxCode;

--
-- Drop procedure `Proc_employee_PostOneRecord`
--
DROP PROCEDURE IF EXISTS Proc_employee_PostOneRecord;

--
-- Drop procedure `Proc_employee_PutOneRecord`
--
DROP PROCEDURE IF EXISTS Proc_employee_PutOneRecord;

--
-- Drop table `employee`
--
DROP TABLE IF EXISTS employee;

--
-- Drop procedure `Proc_positions_GetAll`
--
DROP PROCEDURE IF EXISTS Proc_positions_GetAll;

--
-- Drop table `positions`
--
DROP TABLE IF EXISTS positions;

--
-- Drop procedure `Proc_department_GetAll`
--
DROP PROCEDURE IF EXISTS Proc_department_GetAll;

--
-- Drop table `department`
--
DROP TABLE IF EXISTS department;

--
-- Set default database
--
USE `misa.web08.gpbl.tnmanh`;

--
-- Create table `department`
--
CREATE TABLE department (
  DepartmentID char(36) NOT NULL COMMENT 'ID đơn vị phòng ban',
  DepartmentCode varchar(20) NOT NULL COMMENT 'Mã đơn vị phòng ban',
  DepartmentName varchar(255) NOT NULL COMMENT 'Tên đơn vị phòng ban',
  Description varchar(255) DEFAULT NULL COMMENT 'Giới thiệu về đơn vị, phòng ban',
  CreatedDate datetime DEFAULT NULL COMMENT 'Ngày tạo',
  CreatedBy varchar(100) DEFAULT NULL COMMENT 'Tạo bởi người dùng',
  ModifiedDate datetime DEFAULT NULL COMMENT 'Ngày chỉnh sửa gần nhất',
  ModifiedBy varchar(100) DEFAULT NULL COMMENT 'Người chỉnh sửa gần nhất',
  PRIMARY KEY (DepartmentID)
)
ENGINE = INNODB,
AVG_ROW_LENGTH = 3276,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_0900_ai_ci,
COMMENT = 'Bảng đơn vị phòng ban';

--
-- Create index `IX_Department_DepartmentCode` on table `department`
--
ALTER TABLE department
ADD UNIQUE INDEX IX_Department_DepartmentCode (DepartmentCode);

--
-- Create index `IX_Department_DepartmentName` on table `department`
--
ALTER TABLE department
ADD UNIQUE INDEX IX_Department_DepartmentName (DepartmentName);

DELIMITER $$

--
-- Create procedure `Proc_department_GetAll`
--
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

--
-- Create table `positions`
--
CREATE TABLE positions (
  PositionID char(36) NOT NULL COMMENT 'ID chức vụ',
  PositionCode varchar(20) NOT NULL COMMENT 'Mã chức vụ',
  PositionName varchar(255) NOT NULL COMMENT 'Tên chức danh',
  Description varchar(255) DEFAULT NULL COMMENT 'Giới thiệu về chức danh',
  CreatedDate datetime DEFAULT NULL COMMENT 'Ngày tạo',
  CreatedBy varchar(100) DEFAULT NULL COMMENT 'Tạo bởi người dùng',
  ModifiedDate datetime DEFAULT NULL COMMENT 'Ngày chỉnh sửa gần nhất',
  ModifiedBy varchar(100) DEFAULT NULL COMMENT 'Người chỉnh sửa gần nhất',
  PRIMARY KEY (PositionID)
)
ENGINE = INNODB,
AVG_ROW_LENGTH = 1820,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_0900_ai_ci,
COMMENT = 'Bảng chức vụ';

--
-- Create index `IX_Positions_PositionCode` on table `positions`
--
ALTER TABLE positions
ADD UNIQUE INDEX IX_Positions_PositionCode (PositionCode);

--
-- Create index `IX_Positions_PositionName` on table `positions`
--
ALTER TABLE positions
ADD UNIQUE INDEX IX_Positions_PositionName (PositionName);

DELIMITER $$

--
-- Create procedure `Proc_positions_GetAll`
--
CREATE
DEFINER = 'root'@'localhost'
PROCEDURE Proc_positions_GetAll ()
COMMENT '
  -- Author: TNMANH
  -- Created date: 15/09/2022
  -- Description: Lấy toàn bộ danh sách bản ghi trong positions
  -- Modified by:
  -- Code chạy thử Call `Proc_positions_GetAll`();
  '
BEGIN
  SELECT
    PositionID,
    PositionCode,
    PositionName,
    Description
  FROM positions;
END
$$

DELIMITER ;

--
-- Create table `employee`
--
CREATE TABLE employee (
  EmployeeID char(36) NOT NULL COMMENT 'Id nhân viên',
  EmployeeCode varchar(20) NOT NULL COMMENT 'Mã nhân viên',
  FullName varchar(100) NOT NULL COMMENT 'Tên nhân viên',
  DateOfBirth datetime DEFAULT NULL COMMENT 'Ngày sinh của nhân viên',
  Gender tinyint DEFAULT NULL COMMENT 'Giới tính nhân viên',
  EmployeeType tinyint NOT NULL COMMENT 'Loại nhân viên, là khách hàng hay là nhà cung cấp',
  IdentityCard varchar(25) DEFAULT NULL COMMENT 'Căn cước công dân/ chứng minh thư nhân viên',
  IdentityDate datetime DEFAULT NULL COMMENT 'Ngày cấp căn cước công đan/ chứng minh thư',
  IdentityPlace varchar(255) DEFAULT NULL COMMENT 'Nơi cấp  căn cước công dân/ chứng minh thư nhân viên',
  Address varchar(255) DEFAULT NULL COMMENT 'Địa chỉ của nhân viên',
  MobilePhone varchar(50) DEFAULT NULL COMMENT 'Số điện thoại cá nhân',
  Telephone varchar(50) DEFAULT NULL COMMENT 'Số điện thoại cố định',
  Email varchar(100) DEFAULT NULL COMMENT 'Địa chỉ email',
  BankAccount varchar(25) DEFAULT NULL COMMENT 'Số tài khoản ngân hàng',
  BankName varchar(255) DEFAULT NULL COMMENT 'Tên ngân hàng',
  BankBranch varchar(255) DEFAULT NULL COMMENT 'Tên chi nhánh ngân hàng',
  DepartmentID char(36) NOT NULL COMMENT 'Mã đơn vị',
  DepartmentName varchar(255) NOT NULL COMMENT 'Tên đơn vị',
  PositionID char(36) DEFAULT NULL COMMENT 'Mã chức danh',
  PositionName varchar(255) DEFAULT NULL COMMENT 'Tên chức danh',
  CreatedDate datetime DEFAULT NULL COMMENT 'Ngày tạo',
  CreatedBy varchar(100) DEFAULT NULL COMMENT 'Tạo bởi người dùng',
  ModifiedDate datetime DEFAULT NULL COMMENT 'Ngày sửa gần đây nhất',
  ModifiedBy varchar(100) DEFAULT NULL COMMENT 'Người sửa gần đây nhất',
  PRIMARY KEY (EmployeeID)
)
ENGINE = INNODB,
AVG_ROW_LENGTH = 1045,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_0900_ai_ci,
COMMENT = 'Bảng nhân viên';

--
-- Create index `IX_Employee_EmployeeID` on table `employee`
--
ALTER TABLE employee
ADD UNIQUE INDEX IX_Employee_EmployeeID (EmployeeID);

--
-- Create index `EmployeeCode` on table `employee`
--
ALTER TABLE employee
ADD UNIQUE INDEX EmployeeCode (EmployeeCode);

--
-- Create index `IX_Employee_FullName` on table `employee`
--
ALTER TABLE employee
ADD INDEX IX_Employee_FullName (FullName);

--
-- Create index `IX_Employee_PhoneNumberRelative` on table `employee`
--
ALTER TABLE employee
ADD INDEX IX_Employee_PhoneNumberRelative (MobilePhone);

--
-- Create index `IX_Employee_PhoneNumberFix` on table `employee`
--
ALTER TABLE employee
ADD INDEX IX_Employee_PhoneNumberFix (Telephone);

--
-- Create foreign key
--
ALTER TABLE employee
ADD CONSTRAINT FK_Employee_Department_DepartmentID FOREIGN KEY (DepartmentID)
REFERENCES department (DepartmentID);

--
-- Create foreign key
--
ALTER TABLE employee
ADD CONSTRAINT FK_Employee_Positions_PositionID FOREIGN KEY (PositionID)
REFERENCES positions (PositionID);

DELIMITER $$

--
-- Create procedure `Proc_employee_PutOneRecord`
--
CREATE
DEFINER = 'root'@'localhost'
PROCEDURE Proc_employee_PutOneRecord (IN v_EmployeeID char(36), -- Mã nhân viên đang sửa
IN v_EmployeeCode varchar(20), -- Mã nhân viên đang sửa
IN v_FullName varchar(100), -- tên nhân viên
IN v_DateOfBirth datetime, -- ngày sinh nhân viên
IN v_Gender tinyint, -- giới tính nhân viên
IN v_EmployeeType tinyint, -- loại nhân viên, là khách hàng hay là nhà cung cấp
IN v_IdentityCard varchar(25), -- căn cước công dân/ chứng minh thư nhân viên
IN v_IdentityDate datetime, -- ngày cấp căn cước công dân / chứng minh thư
IN v_IdentityPlace varchar(255), -- nơi cấp căn cước công dân / chứng minh thư
IN v_Address varchar(255), -- địa chỉ nhân viên
IN v_MobilePhone varchar(50), -- số điện thoại cá nhân
IN v_Telephone varchar(50), -- số điện thoại cố định
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
  -- Code chạy thử Call Proc_employee_PutOneRecord("...");                   
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
      MobilePhone = v_MobilePhone,
      Telephone = v_Telephone,
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

--
-- Create procedure `Proc_employee_PostOneRecord`
--
CREATE
DEFINER = 'root'@'localhost'
PROCEDURE Proc_employee_PostOneRecord (IN v_EmployeeID char(36), -- ID nhân viên
IN v_EmployeeCode varchar(20), -- mã nhân viên
IN v_FullName varchar(100), -- tên nhân viên
IN v_DateOfBirth datetime, -- ngày sinh nhân viên
IN v_Gender tinyint, -- giới tính nhân viên
IN v_EmployeeType tinyint, -- loại nhân viên là khách hàng hay là nhà cung cấp
IN v_IdentityCard varchar(25), -- căn cước công dân/ chứng minh thư nhân viên
IN v_IdentityDate datetime, -- ngày cấp căn cước công dân / chứng minh thư
IN v_IdentityPlace varchar(255), -- nơi cấp căn cước công dân / chứng minh thư
IN v_Address varchar(255), -- địa chỉ nhân viên
IN v_MobilePhone varchar(50), -- số điện thoại cá nhân
IN v_Telephone varchar(50), -- số điện thoại cố định
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
  -- Code chạy thử Call Proc_employee_PostOneRecord("...");                      
  '
BEGIN
  INSERT employee (EmployeeID, EmployeeCode, FullName, DateOfBirth, Gender, EmployeeType, IdentityCard, IdentityDate, IdentityPlace, Address, MobilePhone, Telephone, Email, BankAccount, BankName, BankBranch, DepartmentID, DepartmentName, PositionID, PositionName, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy)
    VALUES (v_EmployeeID, v_EmployeeCode, v_FullName, v_DateOfBirth, v_Gender, v_EmployeeType, v_IdentityCard, v_IdentityDate, v_IdentityPlace, v_Address, v_MobilePhone, v_Telephone, v_Email, v_BankAccount, v_BankName, v_BankBranch, v_DepartmentID, v_DepartmentName, v_PositionID, v_PositionName, v_CreatedDate, v_CreatedBy, v_ModifiedDate, v_ModifiedBy);

END
$$

--
-- Create procedure `Proc_employee_GetMaxCode`
--
CREATE
DEFINER = 'root'@'localhost'
PROCEDURE Proc_employee_GetMaxCode ()
COMMENT '
  -- Author: TNMANH
  -- Created date: 15/09/2022
  -- Description: Lấy bản ghi có mã nhân viên lớn nhất trong bảng employee
  -- Modified by:
  -- Code chạy thử Call `Proc_employee_GetMaxCode`();
  '
BEGIN
  SELECT
    MAX(EmployeeCode)
  FROM employee;
END
$$

--
-- Create procedure `Proc_employee_GetDuplicateCode`
--
CREATE
DEFINER = 'root'@'localhost'
PROCEDURE Proc_employee_GetDuplicateCode (IN v_EmployeeCode char(36) -- Mã nhân viên để kiểm tra xem có trùng không
)
COMMENT '
  -- Author: TNMANH
  -- Created date: 15/09/2022
  -- Description: Kiểm tra xem mã nhân viên đã trùng hay chưa
  -- Modified by:
  -- Code chạy thử Call Proc_employee_GetDuplicateCode("NV001");
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

--
-- Create procedure `Proc_employee_GetByID`
--
CREATE
DEFINER = 'root'@'localhost'
PROCEDURE Proc_employee_GetByID (IN v_id char(36) -- Id dùng để lấy thông tin chi tiết của 1 người
)
COMMENT '
  -- Author: TNMANH
  -- Created date: 15/09/2022
  -- Description: Lấy chi tiết 1 bản ghi trong bảng employee theo id
  -- Modified by:
  -- Code chạy thử Call Proc_employee_GetByID("112e1109-11e5-17aa-8777-d9ebc53aac3d");
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
    e.MobilePhone,
    e.Telephone,
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

--
-- Create procedure `Proc_employee_GetAll`
--
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
    MobilePhone,
    Telephone,
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

--
-- Create procedure `Proc_employee_DeleteOneRecord`
--
CREATE
DEFINER = 'root'@'localhost'
PROCEDURE Proc_employee_DeleteOneRecord (IN v_Id char(36) -- id của employee muốn xóa
)
COMMENT '
  -- Author: TNMANH
  -- Created date: 15/09/2022
  -- Description: Xóa 1 bản ghi trong bảng employee theo id
  -- Modified by:
  -- Code chạy thử CALL Proc_employee_DeleteOneRecord("11131abd-1b99-688b-96f6-423b4e874d0f");
  '
BEGIN
  DELETE
    FROM employee
  WHERE EmployeeID = v_Id;
END
$$

--
-- Create procedure `Proc_employee_GetPaging`
--
CREATE
DEFINER = 'root'@'localhost'
PROCEDURE Proc_employee_GetPaging (IN v_Offset int, -- Thứ tự bản ghi bắt đầu lấy
IN v_Limit int, -- Số bản ghi muốn lấy                           
IN v_Search varchar(1000) -- Điều kiện tìm kiếm
)
COMMENT '
  -- Author: TNMANH
  -- Created date: 15/09/2022
  -- Description: Lấy danh sách nhân viên và tổng nhân viên có phân trang
  -- Modified by:
  -- Code chạy thử Call Proc_employee_GetPaging(0, 10, NULL);
  '
BEGIN
  -- Kiểm tra tham số đầu vào, nếu v_Search bị NULL --> gán giá trị vào cho v_Search = ''
  -- SELECT e.EmployeeCode, e.FullName, e.Gender, e.DateOfBirth, e.IdentityCard, e.PositionName, e.DepartmentName, e.BankAccount, e.BankName
  -- FROM  employee e WHERE 1=1 ;
  -- mặc định để 1=1 để nó trả về điều kiện true
  IF IFNULL(v_Search, '') = '' THEN
    SET @filterWhere = '1=1';
  ELSE
    SET @filterWhere = CONCAT(' EmployeeCode LIKE ''%', v_Search, '%'' OR FullName LIKE ''%', v_Search, '%'' OR MobilePhone LIKE ''%', v_Search, '%'' OR Telephone LIKE ''%', v_Search, '%''');
  END IF;

  -- kiểm tra xem giá trị v_Limit có = -1 không, hiểu ngầm trong công ty bằng -1 là k có limit
  IF v_Limit = -1 THEN
    SET @filterQuery = CONCAT('SELECT e.EmployeeID, e.EmployeeCode, e.FullName, e.Gender, e.EmployeeType ,e.DateOfBirth, e.IdentityCard, e.PositionName, e.DepartmentName, e.BankAccount, e.BankName FROM employee e WHERE ', @filterWhere);
  ELSE
    SET @filterQuery = CONCAT('SELECT e.EmployeeID, e.EmployeeCode, e.FullName, e.Gender, e.EmployeeType , e.DateOfBirth, e.IdentityCard, e.PositionName, e.DepartmentName, e.BankAccount, e.BankName FROM employee e WHERE ', @filterWhere, ' LIMIT ', v_Limit, ' OFFSET ', v_Offset);
  END IF;

  -- @filterQuery là 1 biến có kiểu dữ liệu là string
  PREPARE filterQuery FROM @filterQuery;
  EXECUTE filterQuery;
  DEALLOCATE PREPARE filterQuery;

  -- lấy ra tổng số bản ghi theo điều kiện lọc
  SET @filterQuery = CONCAT('SELECT count(EmployeeID) AS TotalCount FROM employee WHERE ', @filterWhere);
  PREPARE filterQuery FROM @filterQuery;
  EXECUTE filterQuery;
  DEALLOCATE PREPARE filterQuery;
END
$$

DELIMITER ;

-- 
-- Restore previous SQL mode
-- 
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;

-- 
-- Enable foreign keys
-- 
/*!40014 SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS */;