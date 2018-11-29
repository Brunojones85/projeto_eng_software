$(document).on("turbolinks:load", function(){
   $("#estado_id").change(function() {
      getCitiesByState("id="+$("#estado_id").val());
    });
  });

  function getCitiesByState(id) {
    $.getJSON("/carrega_cidade", id, function(j) {
      var options = '<option value="">Por favor, selecione</option>';
      $.each(j.cty, function(i, item) {
        options += '<option value="' + item.id + '">' + item.n + '</option>';
      });
      $("#local_cidade_id").html(options);
    });
  }
;
