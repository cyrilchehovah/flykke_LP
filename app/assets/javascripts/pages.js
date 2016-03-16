// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(function() {
  $('a[href*="#"]:not([href="#"])').click(function() {
    if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname) {
      var target = $(this.hash);
      target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
      if (target.length) {
        $('html, body').animate({
          scrollTop: target.offset().top
        }, 1000);
        return false;
      }
    }
  });

  $("div[class='navbar-logo']").click(function() {
    $("html, body").animate({ scrollTop: 0 }, "slow");
    return false;
  });

  $('#myModal').on('shown.bs.modal', function () {
    $('#myInput').focus()
  })

  function reposition() {
      var modal = $(this),
          dialog = modal.find('.modal-dialog');
      modal.css('display', 'block');

      // Dividing by two centers the modal exactly, but dividing by three
      // or four works better for larger screens.
      dialog.css("margin-top", Math.max(0, ($(window).height() - dialog.height()) / 2));
  }
  // Reposition when a modal is shown
  $('.modal').on('show.bs.modal', reposition);
  // Reposition when the window is resized
  $(window).on('resize', function() {
      $('.modal:visible').each(reposition);
  });

});


