<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="GioiThieuLeHoiKhmer.Dashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Quản trị</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f0f2f5;
        }

        .header {
            background-color: #007bff;
            color: white;
            padding: 15px 30px;
            font-size: 20px;
            font-weight: bold;
        }

        .container {
            padding: 30px;
        }

        .card {
            background: white;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            padding: 20px;
            margin-bottom: 20px;
            transition: transform 0.2s;
        }

        .card:hover {
            transform: translateY(-5px);
        }

        .card h3 {
            margin: 0;
            font-size: 24px;
            color: #333;
        }

        .card p {
            margin-top: 5px;
            font-size: 14px;
            color: #777;
        }

        .logout {
            float: right;
            font-size: 16px;
            color: #;
            text-decoration: none;
            margin-top: -5px;
        }

        .logout:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
             <div class="header">
        Người dùng:
                 <asp:Label ID="lblUserInfo"  runat="server" ForeColor="White"></asp:Label> 
                 <asp:Button ID="Button1" runat="server" Text="Đăng xuất" class="logout" OnClick="btnClear_Click" /> 
    </div>

    <div class="container">
        <div class="card">
             <div class="card-body" id="cardPosts" runat="server">
        <h3 class="card-title">Tổng số bài viết: <asp:Label ID="lblTotalArticles" runat="server"  ForeColor="Blue"></asp:Label></h3>
        <br /><br />
        <asp:Button ID="btnViewArticles" runat="server" Text="Xem" CssClass="btn btn-primary" OnClick="btnViewArticles_Click" />
    </div>
        </div>

        <div class="card" id="cardUsers" runat="server">
            <h3>Tổng số người dùng: <asp:Label ID="lblUsersCount" runat="server"  ForeColor="Blue"></asp:Label></h3>
            <br /><br />
        <asp:Button ID="btnUserList" runat="server" Text="Xem" CssClass="btn btn-primary" OnClick="btnViewUsers_Click" />
        </div>
    </div>
        </div>
    </form>
</body>
</html>
