jQuery(function() {
	var blocks;
	$('#teachers_block_id').parent().hide();
  blocks = $('#teachers_block_id').html();
	console.log(blocks);
  return $('#teachers_department_id').change.(function() {
		var department, escaped_department, options;
    department = $('#teachers_department_id :selected').text();
    escaped_department = department.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1');
    options = $(blocks).filter("optgroup[label='#{escaped_department}']").html();
		console.log(options);
    if (options){
      $('#teachers_block_id').html(options);
      return $('#teachers_block_id').parent().show();
    else
      $('#teachers_block_id').empty();
      return $('#teachers_block_id').parent().hide();
		}
	});
});