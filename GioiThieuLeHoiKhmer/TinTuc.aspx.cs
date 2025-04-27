using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GioiThieuLeHoiKhmer
{
    public partial class TinTuc1 : System.Web.UI.Page
    {
        // Đây là hàm giả lập lấy dữ liệu. Bạn thay bằng lấy từ database nhé.
        private DataTable GetArticles()
        {
            string connStr = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string sql = "SELECT ArticleId, Title, Summary, ImagePath FROM Articles ORDER BY CreatedAt DESC";
                SqlDataAdapter da = new SqlDataAdapter(sql, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);
                return dt;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadArticles();
            }
        }

        private void LoadArticles()
        {
            DataTable dt = GetArticles();

            lvArticles.DataSource = dt;
            lvArticles.DataBind();
        }


    }
}