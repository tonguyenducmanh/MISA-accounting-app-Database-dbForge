USE `misa.web08.gpbl.tnmanh`;
-- đề bài : người dùng nhập vào ô tìm kiếm chữ 'an'
-- tìm theo mã, tên hoặc số điện thoại
-- đề bài : người dùng chọn lọc theo phòng chủ tịch
-- người dùng chọn lọc theo vị trí chủ tịch

SELECT
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