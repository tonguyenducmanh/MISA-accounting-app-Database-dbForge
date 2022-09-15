CREATE 
	DEFINER = 'root'@'localhost'
PROCEDURE `misa.web08.gpbl.tnmanh`.Proc_employee_InsertOne(IN v_EmployeeCode varchar(20),
IN v_FullName varchar(100), -- tên nhân viên
IN v_DateOfBirth datetime, -- ngày sinh nhân viên
IN v_EmployeeGender tinyint, -- giới tính nhân viên
IN v_IdentityCard varchar(25), -- căn cước công dân/ chứng minh thư nhân viên
IN v_IdentityDate datetime, -- ngày cấp căn cước công dân / chứng minh thư
IN v_IdentityPlace varchar(255), -- nơi cấp căn cước công dân / chứng minh thư
IN v_Address varchar(255), -- địa chỉ nhân viên
IN v_PNumRelative varchar(50), -- số điện thoại cá nhân
IN v_PNumFix varchar(50), -- số điện thoại cố định
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
IN v_ModifiedDate datetime,  -- ngày sửa nhân viên gần nhất
IN v_ModifiedBy varchar(100))
    COMMENT '
  -- Author: TNMANH
  -- Created date: 15/09/2022
  -- Description: Thêm 1 nhân viên mới vào trong bảng employee
  -- Modified by:
  -- Code chạy thử Call Proc_employee_InsertOne(
  -- ''NV12345'', ''Tô Nguyễn Đức Mạnh'', 14/03/2000, 0, ''12312124124'', ''CA Thái Bình'', ''Thái Bình'', ''0981071321'', ''0129211291'', ''ducmanh14032000@gmail.com'', ''1209321031'', ''BIDV'', ''Cầu Giấy'',''11452b0c-768e-5ff7-0d63-eeb1d8ed8cef'' , ''Phòng Hành Chính'', ''39446ba3-3071-7af6-a5a9-deaf32c96293'', ''Giám đốc'', NOW(), ''Bùi Thúy Quỳnh'', NOW(), ''Bùi Thúy Quỳnh''
  );
  -- chú ý : code chạy thử xóa hết các dấu nháy '' và thay bằng nháy đơn
  '
BEGIN
  INSERT employee (EmployeeID, EmployeeCode, FullName, DateOfBirth, EmployeeGender, IdentityCard, IdentityPlace, Address, PNumRelative, PNumFix, Email, BankAccount, BankName, BankBranch, DepartmentID, DepartmentName, PositionID, PositionName, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy)
  VALUES (UUID(), v_EmployeeCode, v_FullName, v_DateOfBirth, v_EmployeeGender, v_IdentityCard, v_IdentityPlace, v_Address, v_PNumRelative, v_PNumFix, v_Email, v_BankAccount, v_BankName, v_BankBranch, v_DepartmentID, v_DepartmentName, v_PositionID, v_PositionName, v_CreatedDate, v_CreatedBy, v_ModifiedDate, v_ModifiedBy);

END