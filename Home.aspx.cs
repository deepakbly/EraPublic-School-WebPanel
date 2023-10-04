using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Home : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["dbconnect"]);
    SqlCommand cmd = new SqlCommand();
    DataTable dtnotice = new DataTable();
    DataTable dtimage = new DataTable();
   
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            BindData();
          

        }
        if (!IsPostBack)
        {
            load_data();
        }
         if (!IsPostBack)
        {
            data_load();
         }
        if (con.State == ConnectionState.Closed)
        {
            con.Open();
        }
        cmd = new SqlCommand("select detail from tblNotice", con);
        SqlDataAdapter db = new SqlDataAdapter(cmd);
        db.Fill(dtnotice);

        string s2;
        s2 = "<table><tr><td>";

        for (int i = 0; i < dtnotice.Rows.Count; i++)
        {
            s2 += dtnotice.Rows[i][0].ToString();
            s2 += "<br/>";
            s2 += "<br/>";
        }
        s2 += "</tr></table>";
        ltnews.Text = s2.ToString();

        
       
    }

    protected void BindData()
    {

        DataSet ds = new DataSet();

        con.Open();
        string cmdstr = "Select top 8 * from tblGallery";

        SqlCommand cmd = new SqlCommand(cmdstr, con);

        SqlDataAdapter adp = new SqlDataAdapter(cmd);

        adp.Fill(ds);

        DataList1.DataSource = ds.Tables[0];

        DataList1.DataBind(); 



    }
    DataTable dtnews = new DataTable();
    protected void load_data()
    {

        DataSet ds = new DataSet();
        if(con.State==ConnectionState.Closed)
        { 
        con.Open();
        }
        string cmdstr = "Select top 3 * from tblNews";

        SqlCommand cmd = new SqlCommand(cmdstr, con);

        SqlDataAdapter adp = new SqlDataAdapter(cmd);

        adp.Fill(ds);

        DataList2.DataSource = ds.Tables[0];

        DataList2.DataBind();
        con.Close();

    }
    DataTable danews = new DataTable();
    protected void data_load()
    {

        DataSet ds = new DataSet();
        if (con.State == ConnectionState.Closed)
        {
            con.Open();
        }
        string cmdstr = "Select top 1 * from tblNews";

        SqlCommand cmd = new SqlCommand(cmdstr, con);

        SqlDataAdapter adp = new SqlDataAdapter(cmd);

        adp.Fill(ds);

        DataList3.DataSource = ds.Tables[0];

        DataList3.DataBind();
        con.Close();

    }
}