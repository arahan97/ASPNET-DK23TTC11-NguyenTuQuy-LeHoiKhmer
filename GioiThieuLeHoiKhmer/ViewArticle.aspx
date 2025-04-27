<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewArticle.aspx.cs" Inherits="GioiThieuLeHoiKhmer.ViewArticle" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Xem bài viết</title>
    <style>
          body {
        font-family: 'Georgia', serif;
        margin: 0;
        padding: 0;
        background-color: #f5f5f5;
    }
    .container {
        width: 70%;
        max-width: 900px; /* Giới hạn chiều rộng tổng thể */
        margin: 30px auto;
        background: white;
        padding: 30px;
        box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        border-radius: 8px;
    }
    .image-cover img {
        width: 100%;
        max-width: 900px;
        max-height: 900px;
        height: auto;
        object-fit: cover;
        border-radius: 8px;
        display: block;
        margin: 0 auto;
    }
    .title {
        margin-top: 30px;
        text-align: center;
        font-size: 28px;
        font-weight: bold;
        letter-spacing: 1px;
    }
    .summary {
        margin-top: 10px;
        text-align: center;
        font-style: italic;
        color: gray;
        font-size: 16px;
    }
    .content {
        margin-top: 30px;
        line-height: 1.8;
        font-size: 18px;
        color: #333;
        text-align: justify;
    }
    
              /* header */  
                   * {
             box-sizing: border-box;
             margin: 0;
             padding: 0;
         }
     .hero {
         position: relative;
         background-image: url('image/banner_2.jpg');
         background-size: cover;
         background-position: center;
         height: 30vh;
         color: white;
         display: flex;
         flex-direction: column;
         justify-content: center;
         align-items: center;
         text-align: center;
     }
     .navbar {
         position: absolute;
         top: 0;
         width: 100%;
         display: flex;
         justify-content: space-between;
         align-items: center;
         padding: 1rem 2rem;
         background-color: rgba(0, 0, 0, 0.3);
     }
     .nav-links {
         list-style: none;
         display: flex;
         gap: 1.5rem;
     }
     .nav-links li a {
         color: white;
         text-decoration: none;
     }
     .social-icons a img {
         width: 20px;
         margin-left: 10px;
     }
     .hero-content h2 {
         font-size: 2rem;
         margin: 0;
     }
     .hero-content h1 {
         font-size: 3rem;
         margin: 0.5rem 0;
     }
     .btn {
         padding: 0.75rem 1.5rem;
         background-color: white;
         color: black;
         text-decoration: none;
         border-radius: 4px;
         margin-top: 1rem;
         font-weight: bold;
     }
                 .logo {
           display: flex;
           align-items: center;
         }

         .logo img {
           height: 70px;
         }
                      body {
              font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
              line-height: 1.6;
              background: #fff;
              color: #333;
          }
         body {
           margin: 0;
           font-family: 'Open Sans', sans-serif;
           background-color: #f5f5f5;
         }
             * {
    box-sizing: border-box;
    margin: 0;
    padding: 0;
}
body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    line-height: 1.6;
    background: #fff;
    color: #333;
}

        /* footer */
footer {
  background-color: #333;
  color: #ccc;
  padding: 50px 40px 20px;
}

.footer-container {
  display: flex;
  justify-content: space-between;
  flex-wrap: wrap;
  max-width: 1200px;
  margin: 0 auto;
}

.footer-column {
  flex: 1;
  min-width: 220px;
  margin-bottom: 30px;
}

.footer-logo {
  font-size: 24px;
  font-weight: bold;
  color: #fff;
  display: flex;
  align-items: center;
  gap: 10px;
  margin-bottom: 20px;
}

.footer-logo i {
  font-size: 28px;
  color: #fff;
}

.social-icons {
  display: flex;
  gap: 15px;
  margin-top: 10px;
}

.social-icons a {
  background: #555;
  color: white;
  border-radius: 50%;
  padding: 10px;
  display: inline-flex;
  align-items: center;
  justify-content: center;
  text-decoration: none;
  font-size: 14px;
  transition: background 0.3s;
}

.social-icons a:hover {
  background: #777;
}

.footer-column h4 {
  color: white;
  text-transform: uppercase;
  font-size: 14px;
  margin-bottom: 15px;
  letter-spacing: 1px;
}

.footer-column p,
.footer-column a {
  color: #bbb;
  font-size: 14px;
  margin: 5px 0;
  text-decoration: none;
}

.subscribe-input {
  display: flex;
  align-items: center;
  background: #666;
  padding: 10px;
  border-radius: 6px;
  max-width: 300px;
}

.subscribe-input input {
  border: none;
  outline: none;
  background: transparent;
  color: white;
  font-size: 14px;
  flex: 1;
}

.subscribe-input i {
  color: #78bbe6;
}

.footer-bottom {
  text-align: center;
  margin-top: 20px;
  border-top: 1px solid #444;
  padding-top: 10px;
  font-size: 13px;
  color: #888;
}
/* end footer */
    </style>
</head>
<body>
      
   <header class="hero">
        <nav class="navbar">
            <div class="logo">
                    <img src="image/logo.png" alt="Logo">
            </div>
            <ul class="nav-links">
                <li><a href="Default.aspx">Trang chủ</a></li>
                <li><a href="GioiThieu.aspx">Giới thiệu</a></li>
                <li><a href="Lehoi.aspx">Lễ hội</a></li>
                <li><a href="TinTuc.aspx">Tin tức</a></li>
                <li><a href="LienHe.aspx">Liên hệ</a></li>
            </ul>
            <div class="social-icons">
                <a href="login.aspx">Đăng nhập</a>
            </div>
        </nav>
        
        <div class="hero-content">
            <h2>Ok Om Bok</h2>
            <h1>Lễ Hội cúng Trăng</h1>
            <a href="#" class="btn">Xem Thêm</a>
        </div>
    </header>

      <form id="form1" runat="server">
        <div class="container">
            <div class="image-cover">
                <asp:Image ID="imgArticle" runat="server" />
            </div>
            <div class="title">
                <asp:Label ID="lblTitle" runat="server" Text=""></asp:Label>
            </div>
            <div class="summary">
                <asp:Label ID="lblSummary" runat="server" Text=""></asp:Label>
            </div>
            <div class="content">
                <asp:Literal ID="ltlContent" runat="server"></asp:Literal>
            </div>
        </div>
    </form>

    <footer>
  <div class="footer-container">
    <div class="footer-column">
      <div class="footer-logo">
        <i class="fas fa-circle-notch"></i>
          <div class="logo">
        <img src="image/logo.png" alt="Logo">
            </div>
      </div>    
    </div>

    <div class="footer-column">
      <h4>Liên hệ</h4>
      <p>khmer@gmail.com</p>
      <p>Hồ Chí Minh, Việt Nam</p>
      <p>+84 123456789</p>
    </div>

    <div class="footer-column">
      <h4>Đăng ký</h4>
      <p>Nhập Email của bạn để nhận thông báo mới nhất của chúng tôi</p>
      <div class="subscribe-input">
        <input type="email" placeholder="Email">
        <i class="fas fa-envelope"></i>
      </div>
    </div>
  </div>

  <div class="footer-bottom">
    © 2025 Nguyen Tu Quy. ASP.NET
  </div>
</footer>
</body>
</html>
