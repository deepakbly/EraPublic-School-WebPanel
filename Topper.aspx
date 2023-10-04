<%@ Page Title="" Language="C#" MasterPageFile="~/Era_Master.master" AutoEventWireup="true" CodeFile="Topper.aspx.cs" Inherits="Topper" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="home-banner">


        <div id="carousel-home-banner" class="carousel slide home-carousel" data-ride="carousel" data-duration="1600">

            <!-- Wrapper for slides -->
            <div class="carousel-inner" role="listbox">

                <div class="item active">
                    <div class="home-slider-item-img" style="background-image: url(wp-content/uploads/4.jpg); box-shadow: inset 0 0 3px #d8d8d8;"> </div>
                    <div class="container home-slider-item-caption wow rotateInDownRight" data-wow-duration="1s" data-wow-delay="0s">
                    </div>
                </div>


            </div>

            <!-- Controls -->
        </div>
    </div>

    <div class="container inner-banner-heading">
        <div class="inner-banner-heading-text">
            <h1 align="center" style="margin: 62px 0 15px; color: #0d3a08; font-weight: bold; font-size: 36px; ">Our Toppers</h1>
        </div>
    </div>
<section class="inner-page-content teaching-staff-section-1">
	<div class="container"> 
       <!--grid -->
      <div class="row grid">    
           <div class="col-sm-12 col-md-12">
              <div class="profile-box">
                    <asp:DataList ID="DataList1" runat="server" RepeatColumns="4" RepeatDirection="Horizontal">
                    <ItemTemplate>
             <section id="main-slider" style="margin:20px;">
                  <div class="profile-box-photo" style="    padding-bottom: 0;">
<asp:Image ID="imgEmp" runat="server" Width="100px" Height="120px" ImageUrl='<%# Bind("image") %>'  style="width: 100%;height: 220px; "/>
                  </div>
                  <div class="profile-box-title">
                       <asp:Label ID="lblName" runat="server" Text='<%# Bind("name") %>' style="font-size: 16px; color: #b1040e;font-family: 'Questrial', sans-serif;font-weight: 700;">

                </asp:Label>
                 <span style="color: #b1040e;font-weight: 700;">   - </span>
                  <asp:Label ID="lblPercentage" runat="server" Text='<%# Bind("percentage") %>' style="font-size: 16px; color: #b1040e;font-family: 'Questrial', sans-serif;font-weight: 700;">

                </asp:Label>
                    <br />
                  <span style="color: #b1040e;">Class - </span>
                           <asp:Label ID="lblClass" runat="server" Text='<%# Bind("class") %>' style="font-family: 'Questrial', sans-serif;font-size: 16px;color: #b1040e;font-weight: 500;">

                </asp:Label>
                      <br />
                  <span>Year - </span>
                      <asp:Label ID="lblYear" runat="server" Text='<%# Bind("currentyear") %>' style="font-size: 17px;">

                </asp:Label>
                    
                  </div>
                   </section>
        </ItemTemplate>
                </asp:DataList>  
              </div>
          </div>
        
	     
       </div>  
    </div>
</section>
</asp:Content>

