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
  $.getJSON('../proc_types.json', function(data){
    procs=data;
  });
}

$('form select.proc_select').live('change', function() {
  var i = $(this).val();
  var proc_price_input = $(this).siblings('input.proc_price_input');
  proc_price_input.val(get_proc_price(i));
});

