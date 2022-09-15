CREATE 
	DEFINER = 'root'@'localhost'
PROCEDURE `misa.web08.gpbl.tnmanh`.Proc_employee_EditOne(IN v_EmployeeID char(36), -- Mã nhân viên đang sửa
IN v_EmployeeCode varchar(20), IN v_FullName varchar(100), -- tên nhân viên
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
IN v_ModifiedDate datetime, -- ngày sửa nhân viên gần nhất
IN v_ModifiedBy varchar(100))
    COMMENT '
  -- Author: TNMANH
  -- Created date: 15/09/2022
  -- Description: Sủa 1 nhân viên có sẵn trong bảng employee
  -- Modified by:
  -- Code chạy thử Call Proc_employee_EditOne(
  -- ''29dcec4b-6bba-5878-1735-60b3ebf808a9'',
  -- ''NV12345'', ''Tô Nguyễn Đức Mạnh'', 14/03/2000, 0, ''12312124124'', ''CA Thái Bình'', ''Thái Bình'', ''0981071321'', ''0129211291'', ''ducmanh14032000@gmail.com'', ''1209321031'', ''BIDV'', ''Cầu Giấy'',''11452b0c-768e-5ff7-0d63-eeb1d8ed8cef'' , ''Phòng Hành Chính'', ''39446ba3-3071-7af6-a5a9-deaf32c96293'', ''Giám đốc'', NOW(), ''Bùi Thúy Quỳnh'', NOW(), ''Bùi Thúy Quỳnh''
  );
  -- chú ý : code chạy thử xóa hết các dấu nháy '' và thay bằng nháy đơn
  '
BEGIN
  UPDATE employee e
  SET EmployeeCode = v_EmployeeCode,
      FullName = v_FullName,
      DateOfBirth = v_DateOfBirth,
      EmployeeGender = v_EmployeeGender,
      IdentityCard = v_IdentityCard,
      IdentityPlace = v_IdentityDate,
      Address = v_Address,
      PNumRelative = v_PNumRelative,
      PNumFix = v_PNumFix,
      Email = v_Email,
      BankAccount = v_BankAccount,
      BankName = v_BankName,
      BankBranch = v_BankBranch,
      DepartmentID = v_DepartmentID,
      DepartmentName = v_DepartmentName,
      PositionID = v_PositionID,
      PositionName = v_PositionName,
      CreatedDate = v_CreatedDate,
      CreatedBy = v_CreatedBy,
      ModifiedDate = v_ModifiedDate,
      ModifiedBy = v_ModifiedBy
  WHERE EmployeeID = v_EmployeeID;
END