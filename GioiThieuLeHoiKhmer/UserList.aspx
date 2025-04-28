<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserList.aspx.cs" Inherits="GioiThieuLeHoiKhmer.UserList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Quản lý người dùng</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 20px;
        }
        .title {
            font-size: 24px;
            margin-bottom: 20px;
            color: #333;
        }
        .button-add {
            display: inline-block;
            background-color: #28a745;
            color: white;
            padding: 10px 20px;
            margin-bottom: 20px;
            text-decoration: none;
            border-radius: 5px;
        }
        .button-add:hover {
            background-color: #218838;
        }
        .grid {
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        .gridview th {
            background-color: #007bff;
            color: white;
            padding: 8px;
        }
        .gridview td {
            padding: 8px;
            text-align: center;
        }
        .btn {
            padding: 5px 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            text-decoration: none;
            color: white;
        }
        .btn-edit {
            background-color: #ffc107;
        }
        .btn-delete {
            background-color: #dc3545;
        }
        .btn-view {
            background-color: #17a2b8;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
         <div>
             
            <div class="title">
                     <a href="Dashboard.aspx"  color: white; padding: 8px 16px> ←</a>   Quản lý người dùng</div>

            <a href="AddUser.aspx" class="button-add">+ Thêm người dùng</a>

            <div class="grid">
                <asp:GridView ID="gvUsers" runat="server" AutoGenerateColumns="False" CssClass="gridview" 
                              OnRowCommand="gvUsers_RowCommand" DataKeyNames="UserID">
                    <Columns>
                        <asp:BoundField DataField="UserID" HeaderText="ID" />
                        <asp:BoundField DataField="Username" HeaderText="Tên đăng nhập" />
                        <asp:BoundField DataField="Password" HeaderText="Mật khẩu" />
                        <asp:BoundField DataField="Role" HeaderText="Quyền" />
                        <asp:TemplateField HeaderText="Hành động">
                            <ItemTemplate>

                                <asp:LinkButton ID="btnEdit" runat="server" Text="Sửa" CommandName="EditUser" CommandArgument='<%# Eval("UserID") %>' CssClass="btn btn-edit" Style="margin-right:5px;" />

                                <asp:LinkButton ID="btnDelete" runat="server" Text="Xóa" CommandName="DeleteUser" CommandArgument='<%# Eval("UserID") %>' CssClass="btn btn-delete" OnClientClick="return confirm('Bạn chắc chắn muốn xóa?');" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </form>
</body>
</html>
