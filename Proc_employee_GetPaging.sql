USE `misa.web08.gpbl.tnmanh`;

DROP PROCEDURE IF EXISTS Proc_employee_GetPaging;

DELIMITER $$

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
    SET @filterWhere = CONCAT(' EmployeeCode LIKE ''%', v_Search, '%'' OR FullName LIKE ''%', v_Search, '%'' OR PhoneNumberRelative LIKE ''%', v_Search, '%'' OR PhoneNumberFix LIKE ''%', v_Search, '%''');
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