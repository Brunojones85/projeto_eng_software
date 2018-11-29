  $(document).on("turbolinks:load", ready);
  $(document).ready(ready);
  ready = function() {
    alert('ola')
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
      $("#q_local_cidade_id_eq").html(options);
    });
  }
;
