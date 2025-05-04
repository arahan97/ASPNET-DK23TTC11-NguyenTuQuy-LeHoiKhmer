using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GioiThieuLeHoiKhmer.Admin

{
    public partial class ArticlesList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadArticles();
            }
        }

        private void LoadArticles()
        {
            string connStr = WebConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string sql = "SELECT ArticleID, Title, Summary, Content, CreatedAt FROM Articles ORDER BY CreatedAt DESC";
                SqlDataAdapter da = new SqlDataAdapter(sql, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvArticles.DataSource = dt;
                gvArticles.DataBind();
            }
        }
        protected void gvArticles_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType != DataControlRowType.DataRow) return;

            string fullText = e.Row.Cells[3].Text;



            int maxLen = 100; // số ký tự tối đa
            if (fullText.Length > maxLen)
            {
                string truncated = fullText.Substring(0, maxLen) + "...";
                e.Row.Cells[3].Text = truncated;


            }
        }
        protected void gvArticles_RowCommand(object sender, System.Web.UI.WebControls.GridViewCommandEventArgs e)
        {
            int articleId = Convert.ToInt32(e.CommandArgument);

            if (e.CommandName == "EditArticle")
            {
                Response.Redirect("EditArticle.aspx?id=" + articleId);
            }
            else if (e.CommandName == "DeleteArticle")
            {
                DeleteArticle(articleId); // Gọi hàm xóa
                Response.Redirect("ArticlesList.aspx"); // Reload 
            }
            else if (e.CommandName == "ViewArticle")
            {
                Response.Redirect($"/ViewArticle.aspx?id=" + articleId); // Chuyển đến trang xem chi tiết
            }
        }

        private void DeleteArticle(int articleId)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();
                string sql = "DELETE FROM Articles WHERE ArticleID = @ArticleID";
                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("@ArticleID", articleId);
                cmd.ExecuteNonQuery();
            }
        }
    }
}