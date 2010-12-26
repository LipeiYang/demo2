function get_proc_price(index) {
  for(var i in j_procs) {
    var proc = j_procs[i].proc_type;
    if(proc.id==index){
      return proc.price;
    }
  }
}

$('form select.proc_select').live('change', function() {
  var proc_price_input = this.id.replace(/proc_type_id/g,"price");
  var i = $(this).val();
  $('input#'+proc_price_input).val(get_proc_price(i));
});

