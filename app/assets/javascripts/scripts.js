$(document).ready(function(){
    $('section').horizon();
    // the "href" attribute of the modal trigger must specify the modal ID that wants to be triggered
    $('.modal').modal();
    $(".logo").hover3d({
      selector: ".logo__card",
      shine: true,
      sensitivity: 20,
   });
});
