load_posts_page();
/* Load Events On Page Load Start */
function load_posts_page(){
     $.ajax({
 type:"POST",
data:{
            action:'my_action3'
          }, 

url: "http://www.theindianacademy.com/wp-admin/admin-ajax.php", 
success:function(data){
//console.log(data);
  var $data = $(data);
            if($data.length){
                $("#ajax-posts").show();  // all post
                $("#more_posts").show();  // all post lode more
                $("#ajax-posts").append($data);  // Filterd post
                $("#more_posts_filterd").hide();			
                $("#ajax-posts_filterd").hide();			
				
				$("#more_posts").attr("disabled",false);
            } else{
               // $("#more_posts").attr("disabled",true);
                $("#more_posts").hide();
            }
},
 error: function(errorThrown){
      alert(errorThrown);
  } 
});
}
/* Load Events On Page Load End*/ 


var ppp = 4; // Post per page
var pageNumber = 1;

/* Load More Events Start */

function load_posts(){
    pageNumber++;
    var str = '&cat=' + cat + '&pageNumber=' + pageNumber + '&ppp=' + ppp + '&action=more_post_ajax';
   // alert(str);
	$.ajax({
        type: "POST",
        dataType: "html",
url: "http://www.theindianacademy.com/wp-admin/admin-ajax.php", 
        data: str,
        success: function(data){
            var $data = $(data);
            if($data.length){
				console.log($data.length);
                $("#ajax-posts").append($data);
			if($data.length == 4){	
                $("#more_posts").attr("disabled",false);
            }
			else{
			$("#more_posts").hide();
			}
			} else{
                $("#more_posts").hide();
            }
        },
        error : function(jqXHR, textStatus, errorThrown) {
            $loader.html(jqXHR + " :: " + textStatus + " :: " + errorThrown);
        }

    });
    return false;
}
var cat = '';//$('#more_posts').data('category');
$("#more_posts").on("click",function(){ // When btn is pressed.
    $("#more_posts").attr("disabled",true); // Disable the button, temp.
    load_posts();
});

/* Load More Events End */

/* Load Events When Filter Button Pressed Start */
var cat2;
$( "#event_filter_btn" ).click(function() {
		var event_year = $("#event_year option:selected").val();
		var event_month = $("#event_month option:selected").val();
		var event_cat = $("#event_cat option:selected").val();
//	alert(event_year);
	//	alert(event_month);
	$("#ajax-posts").empty();
	$("#ajax-posts_filterd").empty();
	$("#more_posts_filterd").remove();
	
	//alert('click');
	if(event_year == '' && event_month == '' && event_cat == '' )
	{
	load_posts_page();
	pageNumber =1;
	}
	else{
	 pageNumber2 = 1;
		$.ajax({
	type:"POST",
	data:{
            action:'my_action2',
            event_year:event_year,
            event_month:event_month,
            event_cat:event_cat
          }, 

url: "http://www.theindianacademy.com/wp-admin/admin-ajax.php", 
success:function(data){
//console.log(data);
  var $data = $(data);
            if($data.length){
			//	alert('1');
                $("#ajax-posts").hide();  // all post
                $("#ajax-posts_filterd").show();  // all post
                $("#more_posts").hide();  // all post lode more
                $("#ajax-posts_filterd").append($data);  // Filterd post
				
var data2 = '<div  id="more_posts_filterd" data-category="'+event_year+'-'+event_month+'-'+event_cat+'" class="read read-more text-center"><a class="btn btn-2 btn-sm"> Load More <i class="fa fa-angle-right"></i></a></div>';
	
               $("#ajax-posts_filterd").after(data2);  // Filterd post
if($data.length == 4){	
                $("#more_posts_filterd").show();
            }
			else{
                $("#more_posts_filterd").hide();
			}

//				$( "#more_posts_filterd" ).data( "category", event_year );
				//$("#more_posts_filterd").attr("disabled",false);
            } else{
                $("#more_posts_filterd").hide();
            }
			
			
 cat2 = $('#more_posts_filterd').data('category');

$("#more_posts_filterd").on("click",function(){ // When btn is pressed.
   // $("#more_posts_filterd").attr("disabled",true); // Disable the button, temp.
   load_posts2();
});
			
},
 error: function(errorThrown){
      alert(errorThrown);
  } 
});}
	});

/* Load Events When Filter Button Pressed End */

/* Load More With Filter Start */

var ppp2 = 4; // Post per page
//var cat = 7;
var pageNumber2 = 1;
function load_posts2(){
    pageNumber2++;
	//alert(cat2);
    var str = '&cat=' + cat2 + '&pageNumber=' + pageNumber2 + '&ppp=' + ppp2 + '&action=more_post_ajax_filter';
    alert(str);
	$.ajax({
        type: "POST",
        dataType: "html",
url: "http://www.theindianacademy.com/wp-admin/admin-ajax.php", 
        data: str,
        success: function(data){
			//alert('hiiiiii');
            var $data = $(data);
            console.log($data);
            if($data.length){
			//	alert('44');
				console.log($data);
                $("#ajax-posts").hide();  // all post
                $("#more_posts").hide();  // all post lode more
                $("#ajax-posts_filterd").append($data);  // Filterd post
if($data.length == 4){	
                $("#more_posts_filterd").show();
            }
			else{
                $("#more_posts_filterd").hide();
			}               
			   //$("#more_posts_filterd").attr("disabled",false);
            } else{
							//	alert('55');
              //  $("#more_posts_filterd").attr("disabled",true);
                $("#more_posts_filterd").hide();
            }
        },
        error : function(jqXHR, textStatus, errorThrown) {
            $loader.html(jqXHR + " :: " + textStatus + " :: " + errorThrown);
        }

    });
    return false;
}



/* Load More With Filter End */


