<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditUser.aspx.cs" Inherits="GioiThieuLeHoiKhmer.EditUser" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Chỉnh sửa người dùng</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f5f5f5;
            padding: 30px;
        }
        .form-container {
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
            max-width: 600px;
            margin: auto;
        }
        .form-container h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        .form-group {
            margin-bottom: 15px;
        }
        label {
            display: block;
            margin-bottom: 6px;
            color: #333;
        }
        input, select {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .btn-submit {
            background-color: #ffc107;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            width: 100%;
            font-size: 16px;
        }
        .btn-submit:hover {
            background-color: #e0a800;
        }
        .btn-back {
            background-color: #6c757d;
            color: white;
            padding: 8px 16px;
            text-decoration: none;
            border-radius: 5px;
        }
        .btn-back:hover {
            background-color: #5a6268;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="form-container">

            <div >
                  <a href="UserList.aspx"  color: white; padding: 8px 16px> ←</a>
                <h2 >Chỉnh sửa người dùng</h2>
            </div>

            <div class="form-group">
                <label>Tên đăng nhập:</label>
                <asp:TextBox ID="txtUsername" runat="server" />
            </div>

            <div class="form-group">
                <label>Mật khẩu mới:</label>
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" />
                <small>(Nếu để trống sẽ giữ nguyên mật khẩu cũ)</small>
            </div>

            <div class="form-group">
                <label>Quyền:</label>
                <asp:DropDownList ID="ddlRole" runat="server">
                    <asp:ListItem Text="Admin" Value="Admin"></asp:ListItem>
                    <asp:ListItem Text="Editor" Value="Editor"></asp:ListItem>
                </asp:DropDownList>
            </div>

            <asp:Button ID="btnSubmit" runat="server" Text="Cập nhật" CssClass="btn-submit" OnClick="btnSubmit_Click" />
        </div>
    </form>
</body>
</html>
