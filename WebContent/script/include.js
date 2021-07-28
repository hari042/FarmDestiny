
$(function () {
    var includes = $('[data-include]')
    $.each(includes, function () {
      var file = 'home'+ $(this).data('include') + 'home.html'
      $(this).load(file)
    })
  })
