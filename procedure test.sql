-- gọi procedure lọc, tìm kiếm và phân trang
CALL Proc_employee_GetPaging(10, 10, NULL, NULL);

-- gọi procedure thêm mới 1 bản ghi
CALL Proc_employee_InsertOne('NV1312412','Liễu Thị Oanh',22/02/2000,1,
'111111',13/03/2000,'CA Thái Nguyên', 'Thái Nguyên','1111','1111',
'lieuoanh@gmail.com','1111','TPBank','TPBank Thái Nguyên'
,'11452b0c-768e-5ff7-0d63-eeb1d8ed8cef' , 'Phòng Hành Chính', '39446ba3-3071-7af6-a5a9-deaf32c96293', 'Giám đốc'
,14/04/2022
,'Mạnh',14/09/2022,'Mạnh');

-- gọi procedure sửa 1 bản ghi


-- gọi procedure xóa 1 bản ghi
CALL Proc_employee_DeleteOne('1170a168-2949-6f39-dfd2-89b22d10517e');

-- gọi procedure lấy chi tiết 1 bản ghi
CALL Proc_employee_DetailOne('117d03f4-5df7-183b-7335-0028ed526dd0');


-- gọi procedure lấy mã lớn nhất
Call Proc_employee_MaxEmployeeCode();

-- gọi procedure lấy tất cả bản ghi của 1 bảng
CALL Proc_department_SelectAll();
CALL Proc_employee_SelectAll();
CALL Proc_positions_SelectAll();