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

public partial class Gallery : System.Web.UI.Page
{
     SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["dbconnect"]);
     SqlCommand cmd = new SqlCommand();
     DataTable dt = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {
     if(!IsPostBack)
       {
           bindgrid();
       }
    }
    public void bindgrid()
    {
       
        SqlDataAdapter da = new SqlDataAdapter("select * from tblGallery", con);
        da.Fill(dt);
        GridView1.DataSource = dt;
        GridView1.DataBind();
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        if(btnSave.Text=="Save")
        { 
         if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            if (HiddenField1.Value != null)
            {
                cmd = new SqlCommand("insert into tblGallery values('" + txtDate.Text + "','" + txtTopic.Text + "','" + HiddenField1.Value + "')", con);
                cmd.ExecuteNonQuery();
            }
            else
            {
                cmd = new SqlCommand("insert into tblGallery values('" + txtDate.Text + "','" + txtTopic.Text + "','" + image + "')", con);
                cmd.ExecuteNonQuery();
            }
            con.Close();
            lblUpload.ForeColor = System.Drawing.Color.Green;
            txtDate.Text = txtTopic.Text = "";
            Image1.ImageUrl = "";
            txtDate.Focus();
            bindgrid();

            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Save Successfully')", true);
        }
        else
            if (btnSave.Text == "Upload")
            {
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            if (HiddenField1.Value != null)
            {
                cmd = new SqlCommand("Update tblGallery set date='" + txtDate.Text + "',topic='" + txtTopic.Text + "',image='" + HiddenField1.Value + "' ;", con);
                cmd.ExecuteNonQuery();
            }
            con.Close();
            lblUpload.ForeColor = System.Drawing.Color.Green;
            txtDate.Text = txtTopic.Text = "";
            Image1.ImageUrl = "";
            txtDate.Focus();
            bindgrid();

            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Save Successfully')", true);
        }
    }
    }

    string str, image;
    protected void btnUpload_Click(object sender, EventArgs e)
    {

        if (FileUpload1.HasFile)
        {
            str = FileUpload1.FileName;
            FileUpload1.PostedFile.SaveAs(Server.MapPath("~/Admin_Panel/Upload/Event/" + str));
            image = "~/Admin_Panel/Upload/Event/" + str.ToString();
            Image1.ImageUrl = image;
            HiddenField1.Value = image;
            lblUpload.Text = "Image Upload";

        }
        else
        {
            lblUpload.Text = "Please Upload your Image";
            lblUpload.ForeColor = System.Drawing.Color.Red;
        }

    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow gr = GridView1.SelectedRow;
        txtDate.Text = gr.Cells[0].Text;
        txtTopic.Text = gr.Cells[1].Text;
        Image1.ImageUrl = image;
    }
    protected void LinkButton1_Click1(object sender, EventArgs e)
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
        cmd = new SqlCommand("select * from tblGallery where Id='" + id + "'", con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        txtDate.Text = dt.Rows[0]["date"].ToString();
        txtTopic.Text = dt.Rows[0]["topic"].ToString();
        Image1.ImageUrl = dt.Rows[0]["image"].ToString();
        btnSave.Text = "Update";
        bindgrid();
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        if (con.State == ConnectionState.Closed)
        {
            con.Open();
        }

        cmd = new SqlCommand("delete tblGallery where id = '" + HiddenField2.Value + "';", con);
        cmd.ExecuteNonQuery();
        con.Close();
        bindgrid();
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Delete Successfully')", true);
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        if (con.State == ConnectionState.Closed)
        {
            con.Open();
        }
        if (btnSave.Text == "Update")
        {
            txtDate.Text = txtTopic.Text = "";
            Image1.ImageUrl = "";
            btnSave.Text = "Save";
        }
    }
}