$(document).ready(function() {
  var wrapper         = $(".input_fields_wrap"); //Fields wrapper
  var add_button      = $(".edit_link"); //Add button ID

  var x = 1; //initlal text box count
  $(add_button).click(function(e){ //on add input button click
    e.preventDefault();
    x++; //text box increment
    $(wrapper).append('<div class="jk-ingredients"><input type="text" name="amounts[]" placeholder="Amount" class="form-control jk-amount"><input class="form-control jk-ingredient" type="text" name="ingredients[]" placeholder="Ingredient"/><a href="#" class="remove_field">Remove</a></div>'); //add input box
  });

  $(wrapper).on("click",".remove_field", function(e){ //user click on remove text
    e.preventDefault(); $(this).parent('div').remove(); x--;
  })
});
