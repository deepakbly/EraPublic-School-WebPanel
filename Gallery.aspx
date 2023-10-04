<%@ Page Title="" Language="C#" MasterPageFile="~/Era_Master.master" AutoEventWireup="true" CodeFile="Gallery.aspx.cs" Inherits="Gallery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="home-banner">


    <div id="carousel-home-banner" class="carousel slide home-carousel" data-ride="carousel" data-duration="1600">

        <!-- Wrapper for slides -->
        <div class="carousel-inner" role="listbox">

            <div class="item active">
                <div class="home-slider-item-img" style="background-image: url(wp-content/uploads/9.jpg)"> </div>
                <div class="container home-slider-item-caption wow rotateInDownRight" data-wow-duration="1s" data-wow-delay="0s">
                </div>
            </div>


        </div>

        <!-- Controls -->
    </div>
</div>
      <div class="container inner-banner-heading">
            <div class="inner-banner-heading-text">
                <h1 align="center" style="margin: 62px 0 15px; color: #0d3a08; font-weight: bold; font-size: 36px; ">Gallery</h1>
            </div>
        </div>
  	 <section class="inner-page-content event-detail-section-2 main-gallery-page">
        <div class="event-detail-photo-slider">
            <div class="container">
                <div class="row flex">
                     <div class="col-sm-12 col-md-12">
               <div class="profile-box">
                    <asp:DataList ID="DataList1" runat="server" RepeatColumns="4" RepeatDirection="Horizontal">
                    <ItemTemplate>
             <section id="main-slider" style="margin:20px;    box-shadow: 0 0 1px black;">
                       <div class="square-img-box" style="     width: 100%;
    height: 220px;   padding-bottom: 0;">
<asp:Image ID="imgEmp" runat="server" Width="100px" Height="120px" ImageUrl='<%# Bind("image") %>'  style="width: 100%;height: 220px; "/>
                  <div class="overlay">
                                    </div>
                  </div>
                
                    </section>
        </ItemTemplate>
                </asp:DataList> 
               </div>
             </div>  
                    
                               
                            </div>
                    </div>




                </div>
           
    </section>

</asp:Content>

