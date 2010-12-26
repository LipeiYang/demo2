var procs;

function get_proc_price(index) {
  for(var i in procs) {
    var proc = procs[i].proc_type;
    if(proc.id==index){
      return proc.price;
    }
  }
}

if(!procs){
  $.getJSON(proc_types_json_url, function(data){
    procs=data;
  });
}

$('form select.proc_select').live('change', function() {
  var proc_price_input = this.id.replace(/proc_type_id/g,"price");
  var i = $(this).val();
  $('input#'+proc_price_input).val(get_proc_price(i));
});

