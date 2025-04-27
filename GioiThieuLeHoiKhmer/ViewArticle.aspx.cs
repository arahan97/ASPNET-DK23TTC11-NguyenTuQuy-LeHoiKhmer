using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GioiThieuLeHoiKhmer
{
    public partial class ViewArticle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int articleId;
                if (int.TryParse(Request.QueryString["id"], out articleId))
                {
                    LoadArticle(articleId);
                }
            }
        }

        private void LoadArticle(int articleId)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();
                string sql = "SELECT Title, Summary, Content, ImagePath FROM Articles WHERE ArticleID = @ArticleID";

                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.Parameters.AddWithValue("@ArticleID", articleId);

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            lblTitle.Text = reader["Title"].ToString();
                            lblSummary.Text = reader["Summary"].ToString();
                            ltlContent.Text = reader["Content"].ToString();

                            string imagePath = reader["ImagePath"].ToString();
                            if (!string.IsNullOrEmpty(imagePath))
                            {
                                imgArticle.ImageUrl = imagePath;
                            }
                            else
                            {
                                imgArticle.Visible = false;
                            }
                        }
                        else
                        {
                            lblTitle.Text = "Bài viết không tồn tại.";
                        }
                    }
                }
            }
        }
    }
}
