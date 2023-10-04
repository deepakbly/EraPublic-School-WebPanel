<%@ Page Title="" Language="C#" MasterPageFile="~/Era_Master.master" AutoEventWireup="true" CodeFile="News.aspx.cs" Inherits="News" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="home-banner">


        <div id="carousel-home-banner" class="carousel slide home-carousel" data-ride="carousel" data-duration="1600">

            <!-- Wrapper for slides -->
            <div class="carousel-inner" role="listbox">

                <div class="item active">
                    <div class="home-slider-item-img" style="background-image:url(wp-content/uploads/8.jpg)"> </div>
                    <div class="container home-slider-item-caption wow rotateInDownRight" data-wow-duration="1s" data-wow-delay="0s">
                    </div>
                </div>

                <!-- Controls -->

            </div>
        </div>
        <div class="container inner-banner-heading">
            <div class="inner-banner-heading-text">
                <h1 align="center" style="margin: 62px 0 15px; color: #0d3a08; font-weight: bold; font-size: 36px; ">News & Event</h1>
            </div>
        </div>
      
             
                <!--  in-news-recoard-->
                <div class="row in-news-recoard" id="news-1">
                     <asp:DataList ID="DataList1" runat="server" RepeatColumns="1" RepeatDirection="Horizontal">
                    <ItemTemplate>
             <section id="main-slider" style="margin:20px;">
                    <div class="in-news-date">
                           <asp:Label ID="lbldate" runat="server" Text='<%# Bind("date") %>' style="color: #0a0a0a;font-weight: bold;">
                  </asp:Label>
                    </div>


                    <div class="in-news-recoard-boay">
                        <asp:Label ID="lblDetail" runat="server" Text='<%# Bind("detail") %>'>

                </asp:Label>
                        <div class="in-news-recoard-text"></div>
                        <div class="read-more">

                        </div>
                    </div>

                      </section>
        </ItemTemplate>
                </asp:DataList>
                </div>
             
</asp:Content>

