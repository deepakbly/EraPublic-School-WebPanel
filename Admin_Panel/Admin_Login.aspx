<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin_Login.aspx.cs" Inherits="Admin_Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>SpaceLab</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <!-- Favicon -->
    <link rel="shortcut icon" href="assets/img/favicon.ico" type="image/x-icon">
    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="assets/plugins/bootstrap/css/bootstrap.min.css">
    <!-- Fonts from Font Awsome -->
    <link rel="stylesheet" href="assets/css/font-awesome.min.css">
    <!-- CSS Animate -->
    <link rel="stylesheet" href="assets/css/animate.css">
    <!-- Custom styles for this theme -->
    <link rel="stylesheet" href="assets/css/main.css">
    <!-- Fonts -->
    <link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,900,300italic,400italic,600italic,700italic,900italic' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700' rel='stylesheet' type='text/css'>
    <!-- Feature detection -->
    <script src="assets/js/modernizr-2.6.2.min.js"></script>
    <style>
        .form-group {
            margin-bottom: 62px;
            margin-right: -15px; 
            margin-left: -15px;
        }
        .panel-primary {
            border-color: #1abc9c;
            margin-top: 35%;
        }
        .form-control {
            padding-left: 30px;

        }
        .panel-body {
            padding: 15px;
           
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>

    <section id="login-container">
        <div style="    text-align: center;">
            <div class="row">
                    <div class="col-md-12" style="    position: relative;
    top: 116px;">
                        <!--breadcrumbs start -->
                        
                        <!--breadcrumbs end -->
                        <h1 class="h1" >WELCOME TO ERA PUBLIC SCHOOL</h1>
                    </div>
                </div>
        </div>
        <div class="row">
            <div class="col-md-4" id="login-wrapper">
                <div class="panel panel-primary animated flipInY">
                    <div class="panel-heading">
                        <h3 class="panel-title">     
                           LogIn
                        </h3>      
                    </div>
                    <div class="panel-body">
                     
                            <div class="form-group">
                                <div class="col-md-12">
                                     <asp:TextBox ID="txtUserName"  type="UserName" class="form-control"  placeholder="UserName" runat="server"></asp:TextBox>
                                    <i class="fa fa-user"></i>
                                </div>
                            </div>
                            <div class="form-group">
                               <div class="col-md-12">
                                  <asp:TextBox ID="txtPassWord" type="PassWord" class="form-control" placeholder="PassWord" runat="server"></asp:TextBox>
                                    <i class="fa fa-lock"></i></div>
                            </div>
                            <div class="form-group">
                               <div class="col-md-12">
        <asp:Button ID="btnLogin" class="btn btn-primary btn-block" runat="server" Text="Login"  style=" margin-top: 8%;" OnClick="btnLogin_Click"/>
                                   <asp:Label ID="lbl1" runat="server" Text=""></asp:Label>
                                </div>
                            </div>
                       
                    </div>
                </div>
            </div>
        </div>

    </section>
    </div>
    </form>
     <script src="assets/js/jquery-1.10.2.min.js"></script>
    <script src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/plugins/waypoints/waypoints.min.js"></script>
    <script src="assets/js/application.js"></script>
</body>
</html>
