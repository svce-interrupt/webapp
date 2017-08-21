



window.sr = ScrollReveal({reset: true});

sr.reveal('.fromLeft',{
   duration: 1300,
   origin:'left',
   easing:'cubic-bezier(1,-0.03, 0.15, 1.23)',
   distance: '100px'
});
sr.reveal('.fromRight',{
   duration: 1300,
   origin:'right',
   easing:'cubic-bezier(1,-0.03, 0.15, 1.23)',
   distance: '100px'
});
sr.reveal('.item',{
   duration: 1300,
   easing:'cubic-bezier(1,-0.03, 0.15, 1.23)',
   origin: 'bottom',
   scale: 0.001

});
sr.reveal('.logo',{
   duration: 1000,
   origin:'bottom',
   scale:0.0001,
   easing:'cubic-bezier(1,-0.03, 0, 2.31)',
   delay:500
});

$(document).ready(function(){
    $('.modal').modal();
    $(".logo").hover3d({
      selector: ".logo__card",
      shine: true,
      sensitivity: 20,
   });
   $('.btn-floating').click(function(e) {
      var link = $(this).attr('href');
      //console.log($(link).offset().top);

    $('html, body').animate({
      scrollTop: $(link).offset().top
   }, 900);
   e.preventDefault();
  });

});



//
//
//
//
