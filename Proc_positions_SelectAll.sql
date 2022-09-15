CREATE DEFINER=`root`@`localhost` PROCEDURE `misa.web08.gpbl.tnmanh`.Proc_positions_SelectAll()
    COMMENT '
  -- Author: TNMANH
  -- Created date: 15/09/2022
  -- Description: Lấy toàn bộ danh sách bản ghi trong positions
  -- Modified by:
  -- Code chạy thử Call Proc_positions_SelectAll();
  '
BEGIN
  SELECT
    PositionID,
    PositionCode,
    PositionName,
    Description
  FROM positions;
END