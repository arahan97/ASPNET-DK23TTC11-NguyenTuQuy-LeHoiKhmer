using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GioiThieuLeHoiKhmer.Admin
{
    public partial class EditArticle : System.Web.UI.Page
    {
        string connStr = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
        int articleId;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] == null)
            {
                Response.Redirect("ArticlesList.aspx");
                return;
            }

            articleId = int.Parse(Request.QueryString["id"]);

            if (!IsPostBack)
            {
                LoadArticle();
            }
        }

        private void LoadArticle()
        {
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
                            txtTitle.Text = reader["Title"].ToString();
                            txtSummary.Text = reader["Summary"].ToString();
                            txtContent.Text = reader["Content"].ToString();

                            string imagePath = reader["ImagePath"].ToString();
                            if (!string.IsNullOrEmpty(imagePath))
                            {
                                imgPreview.ImageUrl = "~/" + imagePath;
                                imgPreview.Visible = true; // <-- thêm dòng này để chắc chắn hình hiện lên
                            }
                            else
                            {
                                imgPreview.Visible = false; // không có ảnh thì ẩn đi
                            }
                        }
                        else
                        {
                            Response.Redirect("ArticlesList.aspx");
                        }
                    }
                }
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string imagePath = "";

            if (fuImage.HasFile)
            {
                string fileName = Guid.NewGuid().ToString() + System.IO.Path.GetExtension(fuImage.FileName);
                string savePath = Server.MapPath("~/") + fileName;
                fuImage.SaveAs(savePath);
                imagePath = fileName;
            }

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();

                string sql;
                if (!string.IsNullOrEmpty(imagePath))
                {
                    sql = "UPDATE Articles SET Title = @Title, Summary = @Summary, Content = @Content, ImagePath = @ImagePath WHERE ArticleID = @ArticleID";
                }
                else
                {
                    sql = "UPDATE Articles SET Title = @Title, Summary = @Summary, Content = @Content WHERE ArticleID = @ArticleID";
                }

                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.Parameters.AddWithValue("@Title", txtTitle.Text.Trim());
                    cmd.Parameters.AddWithValue("@Summary", txtSummary.Text.Trim());
                    cmd.Parameters.AddWithValue("@Content", txtContent.Text.Trim());
                    cmd.Parameters.AddWithValue("@ArticleID", articleId);

                    if (!string.IsNullOrEmpty(imagePath))
                    {
                        cmd.Parameters.AddWithValue("@ImagePath", imagePath);
                    }

                    cmd.ExecuteNonQuery();
                }
            }

            Response.Redirect("ArticlesList.aspx");
        }
    }
}