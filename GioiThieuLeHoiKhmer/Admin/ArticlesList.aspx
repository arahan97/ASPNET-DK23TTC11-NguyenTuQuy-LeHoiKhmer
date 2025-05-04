<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ArticlesList.aspx.cs" Inherits="GioiThieuLeHoiKhmer.Admin.ArticlesList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Quản lý bài viết</title>
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
            gap: 5px;
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
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
              <div class="title">
                  <a href="Dashboard.aspx"  color: white; padding: 8px 16px> ←</a>Quản lý bài viết</div>

    <a href="AddArticle.aspx" class="button-add">+ Thêm bài viết</a>

    <div class="grid">
        <asp:GridView ID="gvArticles" runat="server" AutoGenerateColumns="False" CssClass="gridview" 
                      OnRowCommand="gvArticles_RowCommand" OnRowDataBound="gvArticles_RowDataBound">
            <Columns>
                <asp:BoundField DataField="ArticleID" HeaderText="ID" />
                <asp:BoundField DataField="Title" HeaderText="Tiêu đề" />
                <asp:BoundField DataField="Summary" HeaderText="Tóm tắt" />
                <asp:BoundField DataField="Content" HeaderText="Nội dung" />
                <asp:BoundField DataField="CreatedAt" HeaderText="Ngày đăng" DataFormatString="{0:dd/MM/yyyy}" />
                <asp:TemplateField HeaderText="Hành động">
                    <ItemTemplate>
                        <asp:LinkButton ID="btnView" runat="server" CommandName="ViewArticle" CommandArgument='<%# Eval("ArticleID") %>' CssClass="btn btn-primary" Style="background-color: #17a2b8; margin-right:5px;">Xem</asp:LinkButton>

                        <asp:LinkButton ID="btnEdit" runat="server" CommandName="EditArticle" CommandArgument='<%# Eval("ArticleID") %>' CssClass="btn btn-edit">Sửa</asp:LinkButton>
                        <asp:LinkButton ID="btnDelete" runat="server" CommandName="DeleteArticle" CommandArgument='<%# Eval("ArticleID") %>' CssClass="btn btn-delete" OnClientClick="return confirm('Bạn chắc chắn muốn xóa?');">Xóa</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
        </div>
    </form>
</body>
</html>
