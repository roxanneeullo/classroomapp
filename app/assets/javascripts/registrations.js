jQuery(function() {
	var blocks;
	$('#user_block_id').parent().hide();
  blocks = $('#user_block_id').html();
	console.log(blocks);
  return $('#user_department_id').change.(function() {
		var department, escaped_country, options;
    department = $('#user_department_id :selected').text();
    escaped_department = department.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1');
    options = $(blocks).filter("optgroup[label='#{escaped_department}']").html();
		console.log(options);
    if (options){
      $('#user_block_id').html(options);
      return $('#user_block_id').parent().show();
    else
      $('#user_block_id').empty();
      return $('#user_block_id').parent().hide();
		}
	});
});