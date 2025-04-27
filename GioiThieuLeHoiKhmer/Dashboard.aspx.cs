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
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDashboardData();
            }
        }

        private void LoadDashboardData()
        {
            string connStr = WebConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();

                // Đếm bài viết
                SqlCommand cmdPosts = new SqlCommand("SELECT COUNT(*) FROM Articles", conn);
                int postsCount = (int)cmdPosts.ExecuteScalar();
                lblTotalArticles.Text = postsCount.ToString();

                // Đếm user
                SqlCommand cmdUsers = new SqlCommand("SELECT COUNT(*) FROM Users", conn);
                int usersCount = (int)cmdUsers.ExecuteScalar();
                lblUsersCount.Text = usersCount.ToString();
            }
        }

        protected void btnViewArticles_Click(object sender, EventArgs e)
        {
            Response.Redirect("ArticlesList.aspx");
        }

    }
}