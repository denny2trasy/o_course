function checkall(){
   var a = $(":checkbox");
   var n = a.length;
   for (var i=0; i<n; i++){
       if( a[i].id!="all"){ 
       a[i].checked = true;
     } 
   }
}

/*反选*/
function uncheck(){
   var a = $(":checkbox");
   var n = a.length;
   for (var i=0; i<n; i++){
     if(a[i].id!="all"){ 
       if(a[i].checked == true){
          a[i].checked = false;
       }
       else{ a[i].checked = true; } 
     }
   }
}
function docheck(flag){
 if(flag){  checkall(); }
 else{ uncheck(); } 
}