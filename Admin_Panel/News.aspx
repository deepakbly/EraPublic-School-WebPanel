<%@ Page Title="" Language="C#" MasterPageFile="~/Admin_Panel/Admin_Master.master" AutoEventWireup="true" CodeFile="News.aspx.cs" Inherits="News" %>


<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <section class="main-content-wrapper">
            <section id="main-content">
                <div class="row">
                    <div class="col-md-12">
                        <!--breadcrumbs start -->
                        <ul class="breadcrumb">
                            <li><a href="#">Dashboard</a>
                            </li>
                            <li class="active">Form News Detail</li>
                        </ul>
                        <!--breadcrumbs end -->
                        <h1 class="h1">Form News Detail</h1>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                               
                                <div class="actions pull-right">
                                    <i class="fa fa-chevron-down"></i>
                                    <i class="fa fa-times"></i>
                                </div>
                            </div>
                            <div class="panel-body" style="    height: 282px;">

                          
                                    <div class="row">  
                                        <div class="col-lg-7">                         
                                          <div class="form-group">
                                        <label class="col-sm-3 control-label">Date</label>
                                        <div class="col-sm-9">
                                            <asp:TextBox ID="txtDate" class="form-control" placeholder="Date"  required=""  runat="server" style="    width: 91%;"></asp:TextBox>
                                            <asp:ImageButton ID="ImageButton1"  runat="server" src="assets/Celender.png" style=" margin-top: -38px; position: relative; top: -14px;   left: 91%;width: 9%;"/>
                                      
                                            <ajaxToolkit:CalendarExtender ID="txtDate_CalendarExtender" runat="server" Enabled="True"  Format="dd/MM/yyyy" TargetControlID="txtDate" PopupButtonID="ImageButton1"/>
                                            
                                              </div>
                                    </div>
                                              <div class="form-group">
                                        <label class="col-sm-3 control-label">Topic</label>
                                        <div class="col-sm-9">
                                            <asp:TextBox ID="txtTopic" cssclass="form-control" placeholder="Topic"  required=""  runat="server"></asp:TextBox>
                                         
                                        </div>
                                    </div>                                           <div class="form-group">
                                        <label class="col-sm-3 control-label" style="    margin-top: 5%;">Detail</label>
                                        <div class="col-sm-9">
                                            <asp:TextBox ID="txtDetail" cssclass="form-control" placeholder="Detail" TextMode="MultiLine" Rows="3"  runat="server" style="    margin-top: 5%;"></asp:TextBox>

                                            

                                        </div>
                                    </div></div>

                                           
                                       
                                         <div class="col-sm-5">
                                    <div class="form-group">
                                        <div class="col-sm-9">
                                            <asp:Image ID="Image1" runat="server" style=" height: 160px; width: 55%;color: #717171; outline: 0;line-height: 18px;font-size: 13px;background-color: #fafafa;    box-shadow: 0 0 1px black; border-radius: 3px;" />
                                          
                                        </div>
                                    </div>
                                             
                                        </div>

                                 
                                    <div class="form-group">
                                        <div class="col-sm-offset-8 col-sm-10" style=" margin-left: 0;position: relative; left: 0px;">
                                            <asp:Button ID="btnAdd" class="btn btn-primary" runat="server" Text="Add"  style="width: 14%;   position: relative;    left: 39%;top: 7px;" OnClick="btnAdd_Click"/>
                                            <asp:Button ID="btnSave" class="btn btn-primary" runat="server" Text="Save"  style="width: 14%;    position: relative;  left: 39%;top: 7px;" OnClick="btnSave_Click"/>
                                             <div style="float: right;margin-top: -19px;margin-right: -50px;">
                                 <asp:FileUpload ID="FileUpload1" runat="server"  Style="margin-top:3px;"/>
                                            <asp:Button ID="btnUpload" runat="server" Text="Upload"  style="color: black;margin-top: 3px;" OnClick="btnUpload_Click"/>
                                           
                                                 
                                                 
                                                 
                                                  <asp:Label ID="lblUpload" runat="server" Text="Label"></asp:Label></div>
                                 </div>
                                             </div>
                                    </div>
                        </div>
                    </div>
                </div>
                </div>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="Id" DataSourceID="SqlDataSource1" Width="1021px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                    <Columns>
                        <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                        <asp:BoundField DataField="date" HeaderText="date" SortExpression="date" />
                        <asp:BoundField DataField="topic" HeaderText="topic" SortExpression="topic" />
                        <asp:BoundField DataField="detail" HeaderText="detail" SortExpression="detail" />
                        <asp:BoundField DataField="image" HeaderText="image" SortExpression="image" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Edit</asp:LinkButton>
                                &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click">Delete</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                    <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                    <RowStyle BackColor="White" ForeColor="#330099" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                    <SortedAscendingCellStyle BackColor="#FEFCEB" />
                    <SortedAscendingHeaderStyle BackColor="#AF0101" />
                    <SortedDescendingCellStyle BackColor="#F6F0C0" />
                    <SortedDescendingHeaderStyle BackColor="#7E0000" />
                </asp:GridView>
                  <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Era_Public_SchoolConnectionString4 %>" SelectCommand="SELECT * FROM [tblNews]"></asp:SqlDataSource>
                  <asp:HiddenField ID="HiddenField1" runat="server" />
                                <asp:HiddenField ID="HiddenField2" runat="server" />
            </section>
        </section>
</asp:Content>

