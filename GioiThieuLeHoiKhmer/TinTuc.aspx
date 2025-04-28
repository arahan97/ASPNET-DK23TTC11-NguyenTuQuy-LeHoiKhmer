<%@ Page Title="" Language="C#" MasterPageFile="~/TinTuc.Master" AutoEventWireup="true" CodeBehind="TinTuc.aspx.cs" Inherits="GioiThieuLeHoiKhmer.TinTuc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

      <style>
          body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    line-height: 1.6;
    background: #fff;
    color: #333;
}
        /* Featured bài lớn */
        .featured-article {
            width: 100%;
            text-align: center;
            margin-bottom: 40px;
            max-width: 1200px;
            margin-left: auto;
            margin-right: auto;
        }
        .featured-article img {
            width: 100%;
            max-height: 700px;
            object-fit: cover;
            border-radius: 10px;
        }
        .article-list {
            width: 100%;
            max-width: 1200px;
            margin: 0 auto;
        }
        .row {
            display: flex;
            justify-content: space-between;
            gap: 20px;
            margin-bottom: 20px;
        }
        .article-card {
            flex: 0 0 calc(33.333% - 20px);
            background: #fff;
            border: 1px solid #eee;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 2px 8px rgba(0,0,0,0.05);
            text-align: center;
            transition: all 0.3s ease;
        }
        .article-card img {
            width: 100%;
            height: 300px;
            object-fit: cover;
        }
        .article-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }
        /* Phân trang */
        .pager {
            text-align: center;
            margin-top: 40px;
        }
        .pager a, .pager span {
            display: inline-block;
            padding: 8px 12px;
            margin: 0 4px;
            background: #eee;
            color: #333;
            text-decoration: none;
            border-radius: 5px;
        }
        .pager a:hover {
            background: #ccc;
        }
        .pager .aspNetDisabled {
            background: #007bff;
            color: #fff;
            font-weight: bold;
        }
    </style>

    <asp:ListView ID="lvArticles" runat="server">
        <LayoutTemplate>
            <div id="itemPlaceholderContainer" class="article-list">
                <asp:PlaceHolder runat="server" ID="itemPlaceholder" />
                
                <!-- DataPager nằm bên trong LayoutTemplate -->
                <div class="pager">
                    <asp:DataPager ID="dpArticles" runat="server" PageSize="7">
                        <Fields>
                            <asp:NumericPagerField 
                                ButtonCount="5" 
                                NextPageText="Next" 
                                PreviousPageText="Previous"
                                ButtonType="Button" />
                        </Fields>
                    </asp:DataPager>
                </div>
            </div>
        </LayoutTemplate>

        <ItemTemplate>
            <%-- Bài đầu tiên (featured) --%>
            <%# Container.DisplayIndex == 0 ?
                "<div class='featured-article'>" +
                    $"<a href='ViewArticle.aspx?id={Eval("ArticleId")}'><img src='{Eval("ImagePath")}' alt='{Eval("Title")}' /></a>" +
                    $"<h2><a href='ViewArticle.aspx?id={Eval("ArticleId")}' style='text-decoration:none; color:inherit;'>{Eval("Title")}</a></h2>" +
                    $"<p>{Eval("Summary")}</p>" + 
                    $"<p>{Eval("CreatedAt")}</p>" + 
                    $"<div class='read-more'><a href='ViewArticle.aspx?id={Eval("ArticleId")}'>Đọc tiếp...</a></div>" +
                "</div>"
                : ""
            %>

            <%-- Các bài nhỏ --%>
            <%# Container.DisplayIndex > 0 ?
                (((Container.DisplayIndex - 1) % 3 == 0) ? "<div class='row'>" : "") +
                "<div class='article-card'>" +
                    $"<a href='ViewArticle.aspx?id={Eval("ArticleId")}'><img src='{Eval("ImagePath")}' alt='{Eval("Title")}' /></a>" +
                    $"<h4><a href='ViewArticle.aspx?id={Eval("ArticleId")}' style='text-decoration:none; color:inherit;'>{Eval("Title")}</a></h4>" +
                    $"<p>{Eval("Summary")}</p>" +
                    $"<p>{Eval("CreatedAt")}</p>" + 

                "</div>" +
                (((Container.DisplayIndex - 1) % 3 == 2 || Container.DisplayIndex == lvArticles.Items.Count - 1) ? "</div>" : "")
            : ""
            %>
        </ItemTemplate>
    </asp:ListView>

</asp:Content>
