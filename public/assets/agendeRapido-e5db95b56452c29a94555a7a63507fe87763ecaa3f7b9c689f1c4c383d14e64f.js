$(document).on("turbolinks:load", function(){
   $("#estado_id").change(function() {
      getCitiesByState("id="+$("#estado_id").val());
    });
    $("#agendamento_medico_id").change(function() {
       getEspecialidades("id="+$("#agendamento_medico_id").val());
     });
     $("#estados_id").change(function() {
        getCitiesByStateConsulta("id="+$("#estados_id").val());
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

  function getEspecialidades(id) {
    $.getJSON("/carrega_especialidades", id, function(j) {
      var options = '<option value="">Por favor, selecione</option>';
      $.each(j.esp, function(i, item) {
        options += '<option value="' + item.id + '">' + item.n + '</option>';
      });
      $("#agendamento_especialidade_id").html(options);
    });
  }



 function getCitiesByStateConsulta(id) {
   $.getJSON("/carrega_cidade", id, function(j) {
     var options = '<option value="">Por favor, selecione</option>';
     $.each(j.cty, function(i, item) {
       options += '<option value="' + item.id + '">' + item.n + '</option>';
     });
     $("#q_local_cidade_id_eq").html(options);
   });
 }
;
