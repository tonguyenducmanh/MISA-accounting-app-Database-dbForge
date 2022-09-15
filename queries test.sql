USE `misa.web08.gpbl.tnmanh`;
-- đề bài : người dùng nhập vào ô tìm kiếm chữ 'an'
-- tìm theo mã, tên hoặc số điện thoại
-- đề bài : người dùng chọn lọc theo phòng chủ tịch
-- người dùng chọn lọc theo vị trí chủ tịch

SELECT
  e.EmployeeID,
  e.EmployeeCode,
  e.FullName,
  e.EmployeeGender,
  e.DateOfBirth,
  e.IdentityCard,
  e.PositionName,
  e.DepartmentName,
  e.BankAccount,
  e.BankName
FROM employee e
WHERE ((e.EmployeeCode LIKE '%an%')
OR (e.FullName LIKE '%an%')
OR (e.PNumRelative LIKE '%an%'))
AND e.DepartmentID = '469b3ece-744a-45d5-957d-e8c757976496'
AND e.PositionID = '71952621-23c8-61d2-d0eb-e423f1575e00'
ORDER BY e.ModifiedDate DESC
LIMIT 10
OFFSET 0
;

-- đề bài : xóa 1 bản ghi trong bảng employee

DELETE
  FROM employee
WHERE EmployeeID = '11131abd-1b99-688b-96f6-423b4e874d0f';

-- đề bài : lấy chi tiết 1 bản ghi trong employee

SELECT
  e.EmployeeID,
  e.EmployeeCode,
  e.FullName,
  e.EmployeeGender,
  e.DateOfBirth,
  e.IdentityCard,
  e.IdentityPlace,
  e.Address,
  e.PNumRelative,
  e.PNumFix,
  e.Email,
  e.PositionID,
  e.DepartmentID,
  e.PositionName,
  e.DepartmentName,
  e.BankAccount,
  e.BankName,
  e.BankBranch
FROM employee e
WHERE e.EmployeeID = '117d03f4-5df7-183b-7335-0028ed526dd0';

-- đề bài : Lấy tất cả bản ghi của 1 bảng
-- chia ra 3 cái , 1 bảng là employee , 1 bảng là positon và 1 bảng là department

SELECT
  EmployeeID,
  EmployeeCode,
  FullName,
  EmployeeGender,
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

-- Đề bài : lấy ra mã nhân viên lớn nhất

SELECT
  MAX(EmployeeCode)
FROM employee;

-- Đề bài : Thêm 1 bản ghi mới vào employee

INSERT employee (EmployeeID, EmployeeCode, FullName, DateOfBirth, EmployeeGender, IdentityCard, IdentityPlace, Address, PNumRelative, PNumFix, Email, BankAccount, BankName, BankBranch, DepartmentID, DepartmentName, PositionID, PositionName, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy)
  VALUES (UUID(), 'NV12345', 'Tô Nguyễn Đức Mạnh', 14 / 03 / 2000, 0, '12312124124', 'CA Thái Bình', 'Thái Bình', '0981071321', '0129211291', 'ducmanh14032000@gmail.com', '1209321031', 'BIDV', 'Cầu Giấy', '11452b0c-768e-5ff7-0d63-eeb1d8ed8cef', 'Phòng Hành Chính', '39446ba3-3071-7af6-a5a9-deaf32c96293', 'Giám đốc', NOW(), 'Bùi Thúy Quỳnh', NOW(), 'Bùi Thúy Quỳnh');


-- test insert vừa nhập
SELECT
  *
FROM employee e
WHERE e.FullName = 'Tô Nguyễn Đức Mạnh';

-- Đề bài : Sửa 1 bản ghi trong employee
UPDATE employee e
SET EmployeeCode = '',
    FullName = '',
    DateOfBirth = NOW(),
    EmployeeGender = 0,
    IdentityCard = '',
    IdentityPlace = '',
    Address = '',
    PNumRelative = '',
    PNumFix = '',
    Email = '',
    BankAccount = '',
    BankName = '',
    BankBranch = '',
    DepartmentID = '',
    DepartmentName = '',
    PositionID = '',
    PositionName = '',
    CreatedDate = NOW(),
    CreatedBy = '',
    ModifiedDate = NOW(),
    ModifiedBy = ''
WHERE EmployeeID = '';