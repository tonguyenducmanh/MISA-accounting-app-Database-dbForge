-- gọi procedure lọc, tìm kiếm và phân trang
CALL Proc_employee_GetPaging(10, 10, NULL, NULL);

-- gọi procedure thêm mới 1 bản ghi


-- gọi procedure sửa 1 bản ghi


-- gọi procedure xóa 1 bản ghi
CALL Proc_employee_DeleteOne('1170a168-2949-6f39-dfd2-89b22d10517e');

-- gọi procedure lấy chi tiết 1 bản ghi
CALL Proc_employee_DetailOne('117d03f4-5df7-183b-7335-0028ed526dd0');


-- gọi procedure lấy mã lớn nhất


-- gọi procedure lấy tất cả bản ghi của 1 bảng