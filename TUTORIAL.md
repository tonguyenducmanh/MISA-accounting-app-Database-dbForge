# hướng dẫn điền vào trong dbforge

copy các file txt vào trong thư mục này

C:\Users\Public\Documents\Devart\dbForge Studio for MySQL\Data Generators

## điền department code có 5 phòng ban, position cũng tương tự

(D001)|(D002)|(D003)|(D004)|(D005)

(P001)|(P002)|(P003)|(P004)|(P005)|(P006)|(P007)|(P008)|(P009)

## điền department name, position cũng tương tự

$"vnphongban.txt"

$"vnchucdanh.txt"

## created date để cho thật thì chọn ngày gần đây

cứ để là năm trước đi

## modified date để gần đây

cứ để là năm nay đi

## phần tên thì để như sau

($"vnho.txt") (($"vndemnam.txt") ($"vntennam.txt")) | (($"vndemnu.txt") ($"vntennu.txt"))

## employee code viết là

NV\d{5}

## giới tính để min 0 đến max 2

## chứng minh thư để là

034((2)|(3))0000\d{4}

nó sẽ render ra ví dụ 034200007684

## nơi cấp cmt để là

CA ($"[Address]")

## phần địa chỉ để là ( cột Address bên trên)

($"vndiachi.txt")

khi đó nơi cấp sẽ ăn theo ô địa chỉ

## phần số điện thoại cá nhân để là

09\d{8}

## phần số điện thoại cố định để là

1((8)|(9))00\d{4}

## email để mặc định như họ cũng dkd

(($"vnhokdau.txt")(($"vndemnamkdau.txt")($"vntennamkdau.txt"))|(($"vndemnukdau.txt")($"vntennukdau.txt")))((@gmail.com)|(@tmu.edu.vn)|(@microsoft.com))

## tên ngân hàng

($"vnnganhang.txt")

## position name và id thì sẽ đặt sau, vì nó chả quan hệ gì với nhau cả, nên nếu để trong database employee thì nó sẽ bị lộn xộn, phải update lại trong SQL scripts