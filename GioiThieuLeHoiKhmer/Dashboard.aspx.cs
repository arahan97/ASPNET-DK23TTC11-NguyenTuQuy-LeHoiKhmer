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
                CheckPermissions();
                LoadDashboardData();
            }
        }

        private void CheckPermissions()
        {
            if (Session["Role"] != null && Session["Username"] != null)
            {
                string role = Session["Role"].ToString();
                string username = Session["Username"].ToString();

                lblUserInfo.Text = username + " (" + role + ")";

                if (role == "Editor")
                {
                    cardUsers.Visible = false;
                }
            }
            else
            {
                Response.Redirect("Login.aspx");
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
        protected void btnViewUsers_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserList.aspx");
        }
        protected void btnClear_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("Login.aspx");
        }

    }
}