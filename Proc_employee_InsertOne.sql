CREATE 
	DEFINER = 'root'@'localhost'
PROCEDURE `misa.web08.gpbl.tnmanh`.Proc_employee_InsertOne(IN v_EmployeeID char(36), -- ID nhân viên 
IN v_EmployeeCode VARCHAR(20), IN v_FullName VARCHAR(100), -- tên nhân viên
IN v_DateOfBirth DATETIME, -- ngày sinh nhân viên
IN v_EmployeeGender TINYINT, -- giới tính nhân viên
IN v_EmployeeType tinyint , -- loại nhân viên là khách hàng hay là nhà cung cấp
IN v_IdentityCard VARCHAR(25), -- căn cước công dân/ chứng minh thư nhân viên
IN v_IdentityDate DATETIME, -- ngày cấp căn cước công dân / chứng minh thư
IN v_IdentityPlace VARCHAR(255), -- nơi cấp căn cước công dân / chứng minh thư
IN v_Address VARCHAR(255), -- địa chỉ nhân viên
IN v_PNumRelative VARCHAR(50), -- số điện thoại cá nhân
IN v_PNumFix VARCHAR(50), -- số điện thoại cố định
IN v_Email VARCHAR(100), -- email nhân viên
IN v_BankAccount VARCHAR(25), -- tài khoản ngân hàng
IN v_BankName VARCHAR(255), -- tên ngân hàng
IN v_BankBranch VARCHAR(255), -- chi nhánh ngân hàng
IN v_DepartmentID CHAR(36), -- id đơn vị
IN v_DepartmentName VARCHAR(255), -- tên đơn vị
IN v_PositionID CHAR(36), -- id chức danh
IN v_PositionName VARCHAR(255), -- tên chức danh
IN v_CreatedDate DATETIME, -- ngày tạo nhân viên
IN v_CreatedBy VARCHAR(100), -- người tạo nhân viên
IN v_ModifiedDate DATETIME, -- ngày sửa nhân viên gần nhất
IN v_ModifiedBy VARCHAR(100))
    COMMENT '
  -- Author: TNMANH
  -- Created date: 15/09/2022
  -- Description: Thêm 1 nhân viên mới vào trong bảng employee
  -- Modified by:
  -- Code chạy thử Call Proc_employee_InsertOne(
  -- ''NV12345'', ''Tô Nguyễn Đức Mạnh'', 14/03/2000, 0, 0, ''12312124124'', ''CA Thái Bình'', ''Thái Bình'', ''0981071321'', ''0129211291'', ''ducmanh14032000@gmail.com'', ''1209321031'', ''BIDV'', ''Cầu Giấy'',''11452b0c-768e-5ff7-0d63-eeb1d8ed8cef'' , ''Phòng Hành Chính'', ''39446ba3-3071-7af6-a5a9-deaf32c96293'', ''Giám đốc'', NOW(), ''Bùi Thúy Quỳnh'', NOW(), ''Bùi Thúy Quỳnh''
  );
  -- chú ý : code chạy thử xóa hết các dấu nháy '' và thay bằng nháy đơn
  '
BEGIN
  INSERT employee (EmployeeID, EmployeeCode, FullName, DateOfBirth, EmployeeGender, EmployeeType, IdentityCard, IdentityPlace, Address, PNumRelative, PNumFix, Email, BankAccount, BankName, BankBranch, DepartmentID, DepartmentName, PositionID, PositionName, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy)
  VALUES (v_EmployeeID, v_EmployeeCode, v_FullName, v_DateOfBirth, v_EmployeeGender, v_EmployeeType, v_IdentityCard, v_IdentityPlace, v_Address, v_PNumRelative, v_PNumFix, v_Email, v_BankAccount, v_BankName, v_BankBranch, v_DepartmentID, v_DepartmentName, v_PositionID, v_PositionName, v_CreatedDate, v_CreatedBy, v_ModifiedDate, v_ModifiedBy);

END