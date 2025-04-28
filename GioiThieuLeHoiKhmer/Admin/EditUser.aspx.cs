using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GioiThieuLeHoiKhmer.Admin
{
    public partial class EditUser : System.Web.UI.Page
    {
        protected int userId;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Role"] == null || Session["Role"].ToString() != "Admin")
            {
                Response.Redirect("Dashboard.aspx");
            }

            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    userId = Convert.ToInt32(Request.QueryString["id"]);
                    LoadUser();
                }
                else
                {
                    Response.Redirect("UserList.aspx");
                }
            }
        }

        private void LoadUser()
        {
            string connStr = WebConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("SELECT Username, Role FROM Users WHERE UserID=@UserID", conn);
                cmd.Parameters.AddWithValue("@UserID", Request.QueryString["id"]);

                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    txtUsername.Text = reader["Username"].ToString();
                    ddlRole.SelectedValue = reader["Role"].ToString();
                }
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text.Trim();
            string role = ddlRole.SelectedValue;

            string connStr = WebConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();

                SqlCommand cmd;

                if (!string.IsNullOrEmpty(password))
                {
                    // Nếu có nhập mật khẩu mới
                    cmd = new SqlCommand("UPDATE Users SET Username=@Username, Password=@Password, Role=@Role WHERE UserID=@UserID", conn);
                    cmd.Parameters.AddWithValue("@Password", password);
                }
                else
                {
                    // Nếu để trống mật khẩu thì không cập nhật password
                    cmd = new SqlCommand("UPDATE Users SET Username=@Username, Role=@Role WHERE UserID=@UserID", conn);
                }

                cmd.Parameters.AddWithValue("@Username", username);
                cmd.Parameters.AddWithValue("@Role", role);
                cmd.Parameters.AddWithValue("@UserID", Request.QueryString["id"]);

                cmd.ExecuteNonQuery();
            }

            Response.Redirect("UserList.aspx");
        }
    }
}