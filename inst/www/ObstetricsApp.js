//set CORS to call "stocks" package on public server
ocpu.seturl("//public.opencpu.org/ocpu/library/stats/R")

//some example data
//to run with different data, edit and press Run at the top of the page
var mydata = [1,2,3,4,5,5,999,5,4,4,3,2,1];

//call R function: stats::var(x=data)
$("#submitbutton").click(function(){
    
    var req = ocpu.rpc("lowess",{
        x : mydata
    }, function(output){
        $("code").text(output.y.join("\n"));
    }); 

    //optional
    req.fail(function(){
        alert("R returned an error: " + req.responseText); 
    });
});
