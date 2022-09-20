USE `misa.web08.gpbl.tnmanh`;

DROP PROCEDURE IF EXISTS Proc_positions_GetAll;

DELIMITER $$

CREATE
DEFINER = 'root'@'localhost'
PROCEDURE Proc_positions_GetAll ()
COMMENT '
  -- Author: TNMANH
  -- Created date: 15/09/2022
  -- Description: Lấy toàn bộ danh sách bản ghi trong positions
  -- Modified by:
  -- Code chạy thử Call `Proc_positions_GetAll`();
  '
BEGIN
  SELECT
    PositionID,
    PositionCode,
    PositionName,
    Description
  FROM positions;
END
$$

DELIMITER ;