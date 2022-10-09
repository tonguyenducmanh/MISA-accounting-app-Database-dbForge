USE `misa.web08.gpbl.tnmanh` ;

UPDATE employee e
SET e.DepartmentName = 'Phòng Hành Chính'
WHERE e.DepartmentID = '17120d02-6ab5-3e43-18cb-66948daf6128';

UPDATE employee e
SET e.DepartmentName = 'Phòng Kế Toán'
WHERE e.DepartmentID = '142cb08f-7c31-21fa-8e90-67245e8b283e';

UPDATE employee e
SET e.DepartmentName = 'Phòng Công Nghệ Thông Tin'
WHERE e.DepartmentID = '4e272fc4-7875-78d6-7d32-6a1673ffca7c';

UPDATE employee e
SET e.DepartmentName = 'Phòng Nhân Sự'
WHERE e.DepartmentID = '469b3ece-744a-45d5-957d-e8c757976496';

UPDATE employee e
SET e.DepartmentName = 'Phòng Nghiên Cứu Và Phát Triển'
WHERE e.DepartmentID = '11452b0c-768e-5ff7-0d63-eeb1d8ed8cef';