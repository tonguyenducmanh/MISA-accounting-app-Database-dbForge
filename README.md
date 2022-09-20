đặt tên cơ sở dữ liệu misa.web08.gpbl.tnmanh

có 3 bảng là Employee, Deparment, Position

bảng 1 là bảng nhân viên

- Employee :

* comment là "Bảng nhân viên"
* có prefix là tên bảng
  gồm các trường:
* EmployeeID (char(36)) - dùng trigger tạo mặc định qua UUID - not NULL
* EmployeeCode (varchar(20)) - not NULL - mã nhân vinee
* FullName (varchar(100)) - not NULL - tên
* DateOfBirth (datetime) - ngày sinh
* Gender (tinyint) - giới tính
* IdentityCard (varchar(25)) - căn cước
* IdentityDate (datetime) - ngày cấp
* IdentityPlace (varchar(255)) - nơi cấp
* Address (varchar(255)) - địa chỉ
* PhoneNumberRelative (varchar(50)) - số đt cá nhân
* PhoneNumberFix (varchar(50)) - số đt cố định
* Email (varchar(100)) - email đó
* BankAccount (varchar(25)) - stk ngân hàng
* BankName (varchar(255)) - tên ngân hàng
* BankBranch (varchar(255)) - tên chi nhánh ngân hàng
* DepartmentID - khóa ngoại
* DepartmentName - tên đơn vị (short)
* PositionID - khóa ngoại
* PositionName - tên chức danh (short)
* CreatedDate - (datetime) - ngày tạo
* CreatedBy - (varchar(100)) - người tạo
* ModifiedDate - (datetime) - ngày chỉnh sửa gần nhất
* ModifiedBy - (varchar(100)) - người chỉnh sửa gần nhất

bảng 2 là bảng đơn vị:
Department - bảng đơn vị

- DepartmentId: (char(36)) - dùng trigger tạo mặc định qua UUID - not NULL
- DepartmentCode:(varchar(20)) - not NULL - mã đơn vị
- DepartmentName:(varchar(255)) - not NULL - tên đơn vị
- Description:(varchar(255)) - diễn giải
- CreatedDate - (datetime) - ngày tạo
- CreatedBy - (varchar(100)) - người tạo
- ModifiedDate - (datetime) - ngày chỉnh sửa gần nhất
- ModifiedBy - (varchar(100)) - người chỉnh sửa gần nhất

bảng 3 là bảng chức vụ:
Position - bảng chức vụ

- PositionId: (char(36)) - dùng trigger tạo mặc định qua UUID - not NULL
- PositionCode:(varchar(20)) - not NULL - mã chức vụ
- PositionName:(varchar(255)) - not NULL - tên chức vụ
- Description:(varchar(255)) - diễn giải
- CreatedDate - (datetime) - ngày tạo
- CreatedBy - (varchar(100)) - người tạo
- ModifiedDate - (datetime) - ngày chỉnh sửa gần nhất
- ModifiedBy - (varchar(100)) - người chỉnh sửa gần nhất

khóa chính khóa ngoại:

