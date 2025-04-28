<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addArticle.aspx.cs" Inherits="GioiThieuLeHoiKhmer.addArticle" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Thêm bài viết</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            padding: 30px;
        }

        .form-container {
            background-color: #fff;
            padding: 25px;
            border-radius: 8px;
            width: 600px;
            margin: auto;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        .form-container h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 15px;
        }

        label {
            font-weight: bold;
        }

        input[type=text], textarea, input[type=file] {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        textarea {
            height: 150px;
        }

        .btn-submit {
            background-color: #28a745;
            color: white;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            width: 100%;
            border-radius: 4px;
            font-size: 16px;
        }

        .btn-submit:hover {
            background-color: #218838;
        }

        .back-link {
            display: block;
            margin-top: 15px;
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
         <div class="form-container">
              <a href="ArticlesList.aspx"  color: white; padding: 8px 16px> ←</a>
            <h2>Thêm Bài Viết Mới</h2>

            <div class="form-group">
                <asp:Label Text="Tiêu đề:" runat="server" AssociatedControlID="txtTitle" />
                <asp:TextBox ID="txtTitle" runat="server" />
            </div>

            <div class="form-group">
                <asp:Label Text="Tóm tắt:" runat="server" AssociatedControlID="txtSummary" />
                <asp:TextBox ID="txtSummary" runat="server" />
            </div>

            <div class="form-group">
                <asp:Label Text="Nội dung chính:" runat="server" AssociatedControlID="txtContent" />
                <asp:TextBox ID="txtContent" runat="server" TextMode="MultiLine" />
            </div>

            <div class="form-group">
                <asp:Label Text="Ảnh đại diện:" runat="server" AssociatedControlID="fileImage" />
                <asp:FileUpload ID="fileImage" runat="server" />
            </div>

            <asp:Button ID="btnSubmit" runat="server" Text="Thêm Bài Viết" CssClass="btn-submit" OnClick="btnSubmit_Click" />

            <a href="ArticlesList.aspx" class="back-link">← Quay lại danh sách bài viết</a>
        </div>
    </form>
</body>
</html>
