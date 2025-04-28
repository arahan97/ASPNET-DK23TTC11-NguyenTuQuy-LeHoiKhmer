<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="GioiThieuLeHoiKhmer.Admin.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Đăng nhập</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            background-color: #2f3338;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .login-container {
            background: white;
            padding: 30px 30px 20px 30px;
            border-radius: 6px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.3);
            width: 350px;
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }

        label {
            display: block;
            margin-bottom: 5px;
            color: #333;
            font-weight: bold;
            font-size: 14px;
        }

        input[type=text], input[type=password] {
            width: 100%;
            padding: 10px 12px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            font-size: 14px;
        }

        .options {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 15px;
            font-size: 13px;
        }

        .options label {
            font-weight: normal;
        }

        .forgot-password {
            color: red;
            text-decoration: none;
            font-weight: bold;
        }

        .forgot-password:hover {
            text-decoration: underline;
        }

        .login-button {
            width: 100%;
            padding: 12px;
            background-color: #28a745;
            color: white;
            font-size: 16px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .login-button:hover {
            background-color: #218838;
        }

        .error {
            color: red;
            text-align: center;
            margin-bottom: 10px;
            font-size: 13px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
         <div class="login-container">
            <h2>Đăng nhập</h2>
            <asp:Label ID="lblMessage" runat="server" CssClass="error" />
            <div>
                <asp:Label Text="TÊN ĐĂNG NHẬP" runat="server" AssociatedControlID="txtUsername" />
                <asp:TextBox ID="txtUsername" runat="server" />
            </div>
            <div>
                <asp:Label Text="MẬT KHẨU" runat="server" AssociatedControlID="txtPassword" />
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" />
            </div>
            <asp:Button ID="btnLogin" runat="server" Text="ĐĂNG NHẬP" CssClass="login-button" OnClick="btnLogin_Click" />
        </div>
    </form>
</body>
</html>
