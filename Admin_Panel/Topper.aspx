<%@ Page Title="" Language="C#" MasterPageFile="~/Admin_Panel/Admin_Master.master" AutoEventWireup="true" CodeFile="Topper.aspx.cs" Inherits="Topper" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <section class="main-content-wrapper">
            <section id="main-content">
                <script type="text/javascript">
                    function onCalendarShown() {
                        var cal = $find("cale_ClearedYr");
                        //Setting the default mode to year
                        cal._switchMode("years", true);
                        //Iterate every year Item and attach click event to it
                        if (cal._yearsBody) {
                            for (var i = 0; i < cal._yearsBody.rows.length; i++) {
                                var row = cal._yearsBody.rows[i];
                                for (var j = 0; j < row.cells.length; j++) {
                                    Sys.UI.DomEvent.addHandler(row.cells[j].firstChild, "click", call);
                                }
                            }
                        }
                    }

                    function onCalendarHidden() {
                        var cal = $find("cale_ClearedYr");
                        //Iterate every month Item and remove click event from it
                        if (cal._yearsBody) {
                            for (var i = 0; i < cal._yearsBody.rows.length; i++) {
                                var row = cal._yearsBody.rows[i];
                                for (var j = 0; j < row.cells.length; j++) {
                                    Sys.UI.DomEvent.removeHandler(row.cells[j].firstChild, "click", call);
                                }
                            }
                        }
                    }

                    function call(eventElement) {
                        var target = eventElement.target;
                        switch (target.mode) {
                            case "year":
                                var cal = $find("cale_ClearedYr");
                                cal._visibleDate = target.date;
                                cal.set_selectedDate(target.date);
                                cal._switchMonth(target.date);
                                cal._blur.post(true);
                                cal.raiseDateSelectionChanged();
                                break;
                        }
                    }
    </script>
                <div class="row">
                    <div class="col-md-12">
                        <!--breadcrumbs start -->
                        <ul class="breadcrumb">
                            <li><a href="#">Dashboard</a>
                            </li>
                            <li class="active">Form Topper Detail</li>
                        </ul>
                        <!--breadcrumbs end -->
                        <h1 class="h1">Form Topper Detail</h1>
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
                                         <div class="col-lg-7">                         
                                          
                                               <div class="form-group">
                                        <label class="col-sm-3 control-label">Name</label>
                                        <div class="col-sm-9">
                                            <asp:TextBox ID="txtName" class="form-control" placeholder="Name"  required=""  runat="server"></asp:TextBox>
                                         
                                        </div>
                                    </div>
                                              <div class="form-group">
                                        <label class="col-sm-3 control-label" style="    margin-top: 3.8%;">Percentage</label>
                                        <div class="col-sm-9">
                                            <asp:TextBox ID="txtPercentage" class="form-control" placeholder="Percentage"  required=""  runat="server" style="    margin-top: 5%;"></asp:TextBox>
                                         
                                        </div>
                                    </div>
                                              <div class="form-group">
                                        <label class="col-sm-3 control-label" style="    margin-top: 3.8%;">Class</label>
                                        <div class="col-sm-9">
                                            <asp:TextBox ID="txtClass" class="form-control" placeholder="Class"  required=""  runat="server" style="    margin-top: 5%;"></asp:TextBox>
                                         
                                        </div>
                                    </div>
                                          <div class="form-group">
                                        <label class="col-sm-3 control-label"style="    margin-top: 3.8%;">Year</label>
                                        <div class="col-sm-9" style="    margin-top: 5%;">
                                            <asp:TextBox ID="txtYear" class="form-control" placeholder="Year"  required=""  runat="server" style="    width: 91%;"></asp:TextBox>
                                            <asp:ImageButton ID="ImageButton1"  runat="server" src="assets/Celender.png" style=" margin-top: -38px; position: relative; top: -14px;   left: 91%;width: 9%;"/>
                                      
                                            <ajaxToolkit:CalendarExtender ID="txtYear_CalendarExtender" runat="server" Enabled="True"  Format="yyyy" TargetControlID="txtYear" PopupButtonID="ImageButton1" DaysModeTitleFormat="yyyy" DefaultView="Years"/>
                                            
                                              </div>
                                    </div>                        
                                          
                                            </div>
                                         <div class="col-sm-5">
                                    <div class="form-group">
                                        <div class="col-sm-9">
                                            <asp:Image ID="Image1" runat="server" style=" height: 160px; width: 55%;color: #717171; outline: 0;line-height: 18px;font-size: 13px;background-color: #fafafa; border-radius: 3px;" />
                                            <asp:FileUpload ID="FileUpload1" runat="server"  Style="margin-top:3px;"/>
                                            <asp:Button ID="btnUpload" runat="server" Text="Upload"  style="color: black;margin-top: 3px;" OnClick="btnUpload_Click"/>
                                            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></div>
                                    </div>
                                        </div>
                                        </div>
                                    
                                    <div class="form-group">
                                        <div class="col-sm-offset-8 col-sm-10" style="    margin-left: 0; position: relative;
    top: -14px;">
                                             <asp:Button ID="btnAdd" class="btn btn-primary" runat="server" Text="Add"  style="width: 14%;    position: relative;left: 39%;" OnClick="btnAdd_Click"/>
                                            <asp:Button ID="btnSave" class="btn btn-primary" runat="server" Text="Save"  style="width: 14%;    position: relative;left: 39%;" OnClick="btnSave_Click"/>
                                            
                                        </div>
                                    </div>
                                <asp:HiddenField ID="HiddenField1" runat="server" />
                                <asp:HiddenField ID="HiddenField2" runat="server" />
                            </div>
                        </div>
                    </div>
                </div>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlDataSource3" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="1073px">
                    <Columns>
                        <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                        <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                        <asp:BoundField DataField="percentage" HeaderText="percentage" SortExpression="percentage" />
                        <asp:BoundField DataField="class" HeaderText="class" SortExpression="class" />
                        <asp:BoundField DataField="year" HeaderText="year" SortExpression="year" />
                        <asp:BoundField DataField="image" HeaderText="image" SortExpression="image" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Edit</asp:LinkButton>
                                &nbsp;
                                <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click">Delete</asp:LinkButton>
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
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:Era_Public_SchoolConnectionString %>" DeleteCommand="DELETE FROM [tblTopper] WHERE [id] = @id" InsertCommand="INSERT INTO [tblTopper] ([name], [percentage], [class], [year], [image]) VALUES (@name, @percentage, @class, @year, @image)" SelectCommand="SELECT * FROM [tblTopper]" UpdateCommand="UPDATE [tblTopper] SET [name] = @name, [percentage] = @percentage, [class] = @class, [year] = @year, [image] = @image WHERE [id] = @id">
                    <DeleteParameters>
                        <asp:Parameter Name="id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="name" Type="String" />
                        <asp:Parameter Name="percentage" Type="String" />
                        <asp:Parameter Name="class" Type="String" />
                        <asp:Parameter Name="year" Type="String" />
                        <asp:Parameter Name="image" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="name" Type="String" />
                        <asp:Parameter Name="percentage" Type="String" />
                        <asp:Parameter Name="class" Type="String" />
                        <asp:Parameter Name="year" Type="String" />
                        <asp:Parameter Name="image" Type="String" />
                        <asp:Parameter Name="id" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Era_Public_SchoolConnectionString6 %>" SelectCommand="SELECT * FROM [tblTopper]"></asp:SqlDataSource>
            </section>
        </section>
</asp:Content>

