(function($) {
	$.ajax({url: '../common/getRoles', dataType: "json", async: true, success: function(data) {
		var option ='';
		$.each(data, function(index,role){
			 option += '<option value=' + role.name + '>' + role.name.split('_')[1] +'</option>'
		});
		console.log('test');
		$('#rolePicker').html(option).selectpicker('refresh');
        
    }});	
	
}(jQuery));