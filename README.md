# Website  giới thiệu lễ hội của dân tộc khmer

Website ASP.NET giới thiệu các lễ hội truyền thống của người dân tộc Khmer, được xây dựng nhằm phục vụ việc phổ biến văn hóa, lưu giữ bản sắc dân tộc và cung cấp thông tin trực quan cho người dùng.

---

## Giới thiệu

Dự án này được thực hiện trong khuôn khổ học phần Chuyên đề ASP.NET, Trường Đại học Trà Vinh.  
Website cung cấp thông tin về các lễ hội lớn của người Khmer, cùng với hệ thống quản trị bài viết và người dùng (phân quyền admin/editor).

---

## Công nghệ sử dụng

- ASP.NET Web Forms
- C# (.NET Framework)
- SQL Server Management Studio 2022
- HTML, CSS, JavaScript
- Bootstrap 5

---

## Cách cài đặt & triển khai

### 1. Clone dự án
```
git clone https://github.com/your-username/ASPNET-DK23TTC11-NguyenTuQuy-LeHoiKhmer.git
```

### 2. Mở bằng Visual Studio 2022

### 3. Khôi phục cơ sở dữ liệu
- Tạo database `KhmerDB` trong SQL Server.
- Import 2 bảng: `Users` và `Articles` theo file `.sql` có sẵn.
- Bảng `User`: chứa thông tin người dùng, phân quyền `Admin` và `Editor`.
- Bảng `Articles`: chứa bài viết về lễ hội.

### 4. Cập nhật chuỗi kết nối trong `Web.config`
```
<connectionStrings>
  <add name="DefaultConnection" connectionString="Data Source=.;Initial Catalog=KhmerDB;Integrated Security=True" providerName="System.Data.SqlClient" />
</connectionStrings>
```
### 5. Kết nối website quản lý
- Nhấn vào nút đăng nhập ở góc phải header của website hoặc nhập: https://localhost:44322/login.aspx
- Tài khoản Admin:
    - tài khoản: admin
    - mật khẩu: admin123
- Tài khoản editor:
    - tài khoản: editor1
    - mật khẩu: editor123
- Bạn có thể truy xuất thông tin tài khoản ở bảng User của Database
---

## Tính năng chính

- Hiển thị danh sách các lễ hội Khmer, chi tiết bài viết
- Đăng nhập quản trị với 2 phân quyền:
  - Admin: toàn quyền quản lý user và bài viết
  - Editor: chỉ quản lý bài viết
- Tạo, chỉnh sửa, xóa bài viết
- Hỗ trợ đăng hình ảnh lễ hội
- Trang chủ, giới thiệu, lễ hội, tin tức

---


## Thông tin người thực hiện
- Họ tên: Nguyễn Tử Quý  
- MSSV: 170123606  
- Lớp: DK23TTC11
- Email: tuquy1997@gmail.com
- Số điện thoại: 0337448111 
- Giảng viên hướng dẫn: ThS. Đoàn Phước Miền  
- Trường: Đại học Trà Vinh
