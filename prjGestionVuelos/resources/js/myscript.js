// Llamar a tooltip

$(document).ready(function(){
          // $('[data-toggle="tooltip"]').tooltip(); 
          $('.mytool').tooltip();
});

// Funcion de Sidebar
 
   //FUNCION ORIGINAL
  //$('.hamburger').on('click', function () {
  //      $('#wrapper').toggleClass('toggled');
  //});

  $("#btnMenu").click(function (e) {
      e.preventDefault();
      $("#wrapper").toggleClass("toggled");
  });
