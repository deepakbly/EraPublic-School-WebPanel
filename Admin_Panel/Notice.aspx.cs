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

public partial class Notice : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["dbconnect"]);
    SqlCommand cmd = new SqlCommand();
    DataTable dtab = new DataTable();

    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
       {
           bindgrid();
       }
    }
    public void bindgrid()
    {

        SqlDataAdapter da = new SqlDataAdapter("select * from tblNotice", con);
        da.Fill(dtab);
      
        GridView1.DataBind();
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (btnSave.Text == "Save")
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            if (HiddenField2.Value != null)
            {
                cmd = new SqlCommand("insert into tblNotice values('" + txtTopic.Text + "','" + txtDetail.Text + "')", con);
                cmd.ExecuteNonQuery();
                txtTopic.Text = txtDetail.Text = "";
                txtTopic.Focus();
                bindgrid();
            }
        }
        else if (btnSave.Text == "Update")
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            cmd = new SqlCommand("update tblNotice set topic= '" + txtTopic.Text + "', detail='" + txtDetail.Text + "'where id = '" + HiddenField2.Value + "';", con);
            cmd.ExecuteNonQuery();
            txtTopic.Text = txtDetail.Text = "";
            txtTopic.Focus();
            bindgrid();
        }
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        if (con.State == ConnectionState.Closed)
        {
            con.Open();
        }
        if (btnSave.Text == "Update")
        {
            con.Close();
            txtTopic.Text = txtDetail .Text= "";
            btnSave.Text = "Save";
        }
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow gr = GridView1.SelectedRow;
        txtTopic.Text = gr.Cells[0].Text;
        txtDetail.Text = gr.Cells[0].Text;
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        DataTable dt = new DataTable();
        LinkButton btn = (LinkButton)sender;
        GridViewRow gvr = (GridViewRow)btn.NamingContainer;
        string id = gvr.Cells[0].Text.ToString();
        HiddenField2.Value = id;
        if (con.State == ConnectionState.Closed)
        {
            con.Open();
        }
        cmd = new SqlCommand("select * from tblNotice where Id='" + id + "'", con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        txtTopic.Text = dt.Rows[0]["topic"].ToString();
        txtDetail.Text = dt.Rows[0]["detail"].ToString();
        btnSave.Text = "Update";
        bindgrid();
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        if (con.State == ConnectionState.Closed)
        {
            con.Open();
        }

        cmd = new SqlCommand("delete tblNotice where id = '" + HiddenField2.Value + "';", con);
        cmd.ExecuteNonQuery();
        con.Close();
        bindgrid();
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Delete Successfully')", true);
    
    }
   
}