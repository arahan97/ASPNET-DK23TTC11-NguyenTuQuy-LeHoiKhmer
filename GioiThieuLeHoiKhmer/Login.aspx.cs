using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System;
using System.Data.SqlClient;

namespace GioiThieuLeHoiKhmer
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text.Trim();

            string connStr = WebConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();
                string sql = "SELECT UserID, Role FROM Users WHERE Username=@Username AND Password=@Password";

                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.Parameters.AddWithValue("@Username", username);
                    cmd.Parameters.AddWithValue("@Password", password);

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            // Lấy UserID và Role
                            int userId = Convert.ToInt32(reader["UserID"]);
                            string role = reader["Role"].ToString();

                            // Lưu vào Session
                            Session["UserID"] = userId;
                            Session["Username"] = username;
                            Session["Role"] = role;

                            Response.Redirect("Dashboard.aspx");
                        }
                        else
                        {
                            lblMessage.Text = "Tên đăng nhập hoặc mật khẩu không đúng!";
                        }
                    }
                }
            }
        }
    }
}