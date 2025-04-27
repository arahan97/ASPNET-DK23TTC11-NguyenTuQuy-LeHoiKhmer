using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GioiThieuLeHoiKhmer
{
    public partial class addArticle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (Session["UserID"] == null)
            {
                // Nếu không có session -> yêu cầu đăng nhập lại
                Response.Redirect("Login.aspx");
                return;
            }
            string title = txtTitle.Text.Trim();
            string summary = txtSummary.Text.Trim();
            string content = txtContent.Text.Trim();
            string imagePath = "";

            // Xử lý upload file
            if (fileImage.HasFile)
            {
                string uploadsFolder = Server.MapPath("~/Uploads/");
                if (!Directory.Exists(uploadsFolder))
                {
                    Directory.CreateDirectory(uploadsFolder);
                }

                string filename = Path.GetFileName(fileImage.FileName);

                // Nếu cần an toàn hơn: thêm timestamp để tránh trùng file
                string uniqueFilename = DateTime.Now.ToString("yyyyMMddHHmmss_") + filename;
                string savePath = Path.Combine(uploadsFolder, uniqueFilename);

                fileImage.SaveAs(savePath);
                imagePath = "Uploads/" + uniqueFilename;
            }

            int createdBy = Convert.ToInt32(Session["UserID"]);
            string connStr = WebConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();
                string sql = "INSERT INTO Articles (Title, Summary, Content, ImagePath, CreatedAt, CreatedBy) " +
                             "VALUES (@Title, @Summary, @Content, @ImagePath, GETDATE(), @CreatedBy)";
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.Parameters.AddWithValue("@Title", title);
                    cmd.Parameters.AddWithValue("@Summary", summary);
                    cmd.Parameters.AddWithValue("@Content", content);
                    cmd.Parameters.AddWithValue("@ImagePath", imagePath);
                    cmd.Parameters.AddWithValue("@CreatedBy", createdBy);

                    cmd.ExecuteNonQuery();
                }
            }

            // Sau khi thêm xong, chuyển về danh sách bài viết
            Response.Redirect("ArticlesList.aspx");
        }
    }
}