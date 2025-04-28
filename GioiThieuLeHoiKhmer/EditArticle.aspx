<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditArticle.aspx.cs" Inherits="GioiThieuLeHoiKhmer.EditArticle" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <title>Sửa bài viết</title>
    <style>
       body {
            font-family: Arial, sans-serif;
            background: #f8f9fa;
            padding: 20px;
        }
        h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        .form-container {
            max-width: 700px;
            margin: auto;
            background: #fff;
            padding: 20px;
            border-radius: 6px;
            box-shadow: 0px 0px 10px rgba(0,0,0,0.1);
        }
        label {
            font-weight: bold;
            display: block;
            margin-top: 10px;
        }
        input[type="text"], textarea {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
            border-radius: 4px;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }
        .current-image {
            margin-top: 10px;
            text-align: center;
        }
        .current-image img {
            max-width: 300px;
            height: auto;
            margin-bottom: 10px;
            border-radius: 6px;
        }
        .btn-save {
            margin-top: 20px;
            padding: 10px 20px;
            background: #007bff;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .btn-save:hover {
            background: #0056b3;
        }
        .back-link {
            display: block;
            margin-top: 20px;
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" enctype="multipart/form-data">
        <div class="form-container">
             <a href="ArticlesList.aspx"  color: white; padding: 8px 16px> ←</a>
            <h2>Sửa bài viết</h2>

            <asp:Label Text="Tiêu đề" runat="server" />
            <asp:TextBox ID="txtTitle" runat="server" />

            <asp:Label Text="Tóm tắt" runat="server" />
            <asp:TextBox ID="txtSummary" runat="server" />

            <asp:Label Text="Nội dung" runat="server" />
            <asp:TextBox ID="txtContent" runat="server" TextMode="MultiLine" Rows="10" />

            <asp:Label Text="Hình ảnh hiện tại" runat="server" />
            <div class="current-image">
                <asp:Image ID="imgPreview" runat="server"  Width="300px" />
            </div>

            <asp:Label Text="Chọn hình ảnh mới (nếu muốn thay đổi)" runat="server" />
          <asp:FileUpload ID="fuImage" runat="server" CssClass="form-control" />
            <br />

            <asp:Button ID="btnSave" runat="server" Text="Lưu thay đổi" OnClick="btnSave_Click" CssClass="btn-save" />

            <asp:HyperLink ID="lnkBack" runat="server" NavigateUrl="ArticlesList.aspx" CssClass="back-link">← Quay về danh sách</asp:HyperLink>
        </div>
    </form>
</body>
</html>
