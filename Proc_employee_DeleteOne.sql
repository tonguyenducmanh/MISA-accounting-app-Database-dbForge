USE `misa.web08.gpbl.tnmanh`;

DROP PROCEDURE IF EXISTS Proc_employee_DeleteOne;

DELIMITER $$

CREATE
DEFINER = 'root'@'localhost'
PROCEDURE Proc_employee_DeleteOne (IN v_Id char(36) -- id của employee muốn xóa
)
COMMENT '
  -- Author: TNMANH
  -- Created date: 15/09/2022
  -- Description: Xóa 1 bản ghi trong bảng employee theo id
  -- Modified by:
  -- Code chạy thử CALL Proc_employee_DeleteOne("11131abd-1b99-688b-96f6-423b4e874d0f");
  '
BEGIN
  DELETE
    FROM employee
  WHERE EmployeeID = v_Id;
END
$$

DELIMITER ;