$(window).on('beforeunload', function(){
    // console.log('Are you sure you want to leave?');
    $(".navbar").fadeTo("slow",0.2);
    $("#contentHolder").html(`<div class='text-center' style='position:absolute;top:40%;left:50%;transform:translate(-50%,-50%);'> 
        <h1>Task Management App </h1> 
        <h3>Loading ... </h3> 

        <div class="text-center my_loader">
            <div class="loadingio-spinner-spinner-fpufj1c8num  ">
                <div class="ldio-0hf3ht1mqwp">
                    <div></div><div></div><div></div><div></div><div></div><div></div><div></div><div></div><div></div><div></div>
                </div>
            </div>

        </div>
    </div>`);
});