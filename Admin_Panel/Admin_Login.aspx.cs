using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Admin_Login : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["dbconnect"]);
    SqlCommand cmd = new SqlCommand();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        { }
    }
    DataTable tbllogin = new DataTable();
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        if (con.State == ConnectionState.Closed)
        {
            con.Open();
        }
        cmd = new SqlCommand("select count(*) from tblLog_in where username='" + txtUserName.Text + "' and password='" + txtPassWord.Text + "' ", con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(tbllogin);
        if (tbllogin.Rows[0][0].ToString() == "1")
        {
            Response.Redirect("~/Admin_Panel/Admin_Home.aspx");
            lbl1.Text = "Login";
        }
        else
        {
            lbl1.Text = "Please Enter Right Information";
            lbl1.ForeColor = System.Drawing.Color.Red;
        }
    }
}