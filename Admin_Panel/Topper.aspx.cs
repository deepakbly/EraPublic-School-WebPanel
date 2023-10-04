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

public partial class Topper : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["dbconnect"]);
    SqlCommand cmd = new SqlCommand();
    DataTable dta = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bindgrid();
        }
    }
    public void bindgrid()
    {

        SqlDataAdapter dab = new SqlDataAdapter("select * from tblTopper", con);
        dab.Fill(dta);

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
            if (HiddenField1.Value != null)
            {
                cmd = new SqlCommand("insert into tblTopper values('" + txtName.Text + "','" + txtPercentage.Text + "','" + txtClass.Text + "','" + txtYear.Text + "','" + HiddenField1.Value + "')", con);
                cmd.ExecuteNonQuery();
                bindgrid();
            }
            else
            {
                cmd = new SqlCommand("Update tblTopper values('" + txtName.Text + "','" + txtPercentage.Text + "','" + txtClass.Text + "','" + txtYear.Text + "','" + Image1 + "')", con);
                cmd.ExecuteNonQuery();
            }
            con.Close();
            Label1.ForeColor = System.Drawing.Color.Green;
            txtName.Text = "";
            txtName.Focus();
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
                        cmd = new SqlCommand("update tblTopper set name='" + txtName.Text + "',percentage='" + txtPercentage.Text + "',class='" + txtClass.Text + "', date='" + txtYear.Text + "', image='" + HiddenField1.Value + "' ", con);
                        cmd.ExecuteNonQuery();
                    }
                    con.Close();
                    Label1.ForeColor = System.Drawing.Color.Green;
                    txtName.Text = "";
                    txtName.Focus();
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
            FileUpload1.PostedFile.SaveAs(Server.MapPath("~/Admin_Panel/Upload/Topper/" + str));
            image = "~/Admin_Panel/Upload/Topper/" + str.ToString();
            Image1.ImageUrl = image;
            HiddenField1.Value = image;
            Label1.Text = "Image Upload";
        }
        else
        {
            Label1.Text = "Please Upload your Image";
            Label1.ForeColor = System.Drawing.Color.Red;
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
            txtName.Text = "";
            Image1.ImageUrl = "";
            btnSave.Text = "Save";
        }
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow gr = GridView1.SelectedRow;
        txtName.Text = gr.Cells[0].Text;
        Image1.ImageUrl = image;
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
        cmd = new SqlCommand("select * from tblTopper where Id='" + id + "'", con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);

        txtName.Text = dt.Rows[0]["name"].ToString();
        txtPercentage.Text = dt.Rows[0]["percentage"].ToString();
        txtClass.Text = dt.Rows[0]["class"].ToString();
        txtYear.Text = dt.Rows[0]["year"].ToString();
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

        cmd = new SqlCommand("delete tblTopper where id = '" + HiddenField2.Value + "';", con);
        cmd.ExecuteNonQuery();
        bindgrid();
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Delete Successfully')", true);
    
    }
}