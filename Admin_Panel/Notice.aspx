<%@ Page Title="" Language="C#" MasterPageFile="~/Admin_Panel/Admin_Master.master" AutoEventWireup="true" CodeFile="Notice.aspx.cs" Inherits="Notice" %>

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
                            <li class="active">Form Notice Detail</li>
                        </ul>
                        <!--breadcrumbs end -->
                        <h1 class="h1">Form Notice Detail</h1>
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
                            <div class="panel-body">
                                    <div class="row">  
                                      <div class="col-lg-12">                               
                                               <div class="form-group">
                                        <label class="col-sm-3 control-label">Topic</label>
                                        <div class="col-sm-6">
                                            <asp:TextBox ID="txtTopic" class="form-control" placeholder="Topic"   runat="server"></asp:TextBox>
                                         
                                        </div>
                                    </div>
                                            </div>
                                        <div class="col-lg-12">                               
                                               <div class="form-group">
                                        <label class="col-sm-3 control-label"style="    margin-top: 3.8%;">Detail</label>
                                        <div class="col-sm-6">
                                            <asp:TextBox ID="txtDetail" class="form-control" placeholder="Detail" TextMode="MultiLine" Rows="3"  runat="server" style="    margin-top: 5%;"></asp:TextBox>
                                         
                                        </div>
                                    </div>
                                            </div>
                                        
                                        </div>
                                    
                                    <div class="form-group">
                                        <div class="col-sm-offset-8 col-sm-10"style=" margin-left: 0;     margin-top: 16px;">
                                             <asp:Button ID="btnAdd" class="btn btn-primary" runat="server" Text="Add"  style="width: 14%;position: relative;left: 61%;" OnClick="btnAdd_Click"/>
                                            <asp:Button ID="btnSave" class="btn btn-primary" runat="server" Text="Save"  style="width: 14%;position: relative;left: 61%;" OnClick="btnSave_Click"/>
                                            
                                        </div>
                                    </div>
                                <asp:HiddenField ID="HiddenField1" runat="server" />
                                <asp:HiddenField ID="HiddenField2" runat="server" />
                            </div>
                        </div>
                    </div>
                    </div>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="1076px">
                        <Columns>
                            <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                            <asp:BoundField DataField="topic" HeaderText="topic" SortExpression="topic" />
                            <asp:BoundField DataField="detail" HeaderText="detail" SortExpression="detail" />
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
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Era_Public_SchoolConnectionString7 %>" SelectCommand="SELECT * FROM [tblNotice]"></asp:SqlDataSource>
            </section>
        </section>
</asp:Content>

