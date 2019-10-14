(function ($){
$(document).ready(function(){
  //Attach An event Handler - SignIN Button
$(#shellSignBtn").click(function(){ 
  var httpreq=new XMLHttpRequest();
  httpReg.onreadystatechange=function(){
  If(httpReq.readyState==4)
 {
    if(httpReq.Status==200)
   {
      var response = httpReq.responseText;
     alert(response);
    $("#viewcontainer").html(response);
  }
}

};
  http.open("GET","login.html",true);
  httpReq.send();
});

});

})(jQuery);