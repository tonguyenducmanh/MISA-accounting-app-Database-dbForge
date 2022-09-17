CREATE DEFINER=`root`@`localhost` PROCEDURE `misa.web08.gpbl.tnmanh`.Proc_employee_GetPaging(
IN v_Offset int, -- Thứ tự bản ghi bắt đầu lấy
IN v_Limit int, -- Số bản ghi muốn lấy
IN v_Sort varchar(100), -- Điều kiện sắp xếp
IN v_Where varchar(1000) -- Điều kiện tìm kiếm
)
    COMMENT '
  -- Author: TNMANH
  -- Created date: 15/09/2022
  -- Description: Lấy danh sách nhân viên và tổng nhân viên có phân trang
  -- Modified by:
  -- Code chạy thử Call Proc_employee_GetPaging(0, 10, NULL, NULL);
  '
BEGIN
  -- Kiểm tra tham số đầu vào, nếu v_Where bị NULL --> gán giá trị vào cho v_Where = ''
  -- SELECT e.EmployeeCode, e.FullName, e.EmployeeGender, e.DateOfBirth, e.IdentityCard, e.PositionName, e.DepartmentName, e.BankAccount, e.BankName
  -- FROM  employee e WHERE 1=1 ;
  -- mặc định để 1=1 để nó trả về điều kiện true
  IF IFNULL(v_Where, '') = '' THEN
    SET v_Where = '1=1';
  END IF;

  -- Kiểm tra nếu tham số đầu vào v_Sort bị NULL  --> gán giá trị cho v_Sort = ''
  -- mặc định để sắp xếp theo trường ngày sửa gần nhất
  -- SELECT e.EmployeeCode, e.FullName, e.EmployeeGender,e.EmployeeType , e.DateOfBirth, e.IdentityCard, e.PositionName, e.DepartmentName, e.BankAccount, e.BankName
  -- FROM employee e WHERE 1=1 ORDER BY ModifiedDate DESC
  IF IFNULL(v_Sort, '') = '' THEN
    SET v_Sort = 'ModifiedDate DESC';
  END IF;

  -- kiểm tra xem giá trị v_Limit có = -1 không, hiểu ngầm trong công ty bằng -1 là k có limit
  IF v_Limit = -1 THEN
    SET @filterQuery = CONCAT('SELECT e.EmployeeID, e.EmployeeCode, e.FullName, e.EmployeeGender, e.EmployeeType ,e.DateOfBirth, e.IdentityCard, e.PositionName, e.DepartmentName, e.BankAccount, e.BankName FROM employee e WHERE ', v_Where, ' ORDER BY ', v_Sort);
  ELSE
    SET @filterQuery = CONCAT('SELECT e.EmployeeID, e.EmployeeCode, e.FullName, e.EmployeeGender, e.EmployeeType , e.DateOfBirth, e.IdentityCard, e.PositionName, e.DepartmentName, e.BankAccount, e.BankName FROM employee e WHERE ', v_Where, ' ORDER BY ', v_Sort, ' LIMIT ', v_Limit, ' OFFSET ', v_Offset);
  END IF;

  -- @filterQuery là 1 biến có kiểu dữ liệu là string
  PREPARE filterQuery FROM @filterQuery;
  EXECUTE filterQuery;
  DEALLOCATE PREPARE filterQuery;

  -- lấy ra tổng số bản ghi theo điều kiện lọc
  SET @filterQuery = CONCAT('SELECT count(EmployeeID) AS TotalCount FROM employee WHERE ', v_Where);
  PREPARE filterQuery FROM @filterQuery;
  EXECUTE filterQuery;
  DEALLOCATE PREPARE filterQuery;
END