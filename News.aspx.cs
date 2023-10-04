using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


public partial class News : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["dbconnect"]);
    SqlCommand cmd = new SqlCommand();
    DataTable dt = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            BindData();

        }

    }

    protected void BindData()
    {

        DataSet ds = new DataSet();

        con.Open();

        string cmdstr = "Select top 20 * from tblNews";

        SqlCommand cmd = new SqlCommand(cmdstr, con);

        SqlDataAdapter adp = new SqlDataAdapter(cmd);

        adp.Fill(ds);

        DataList1.DataSource = ds.Tables[0];

        DataList1.DataBind();


    }
}