(function($) {
	$.ajax({url: 'getCompanies', dataType: "json", async: true, success: function(data) {
		var option ='';
		$.each(data, function(index,company){
			 option += '<option>' + company.name +'</option>'
		});
		$('#companylist').html(option).selectpicker('refresh');
        
    }});
}(jQuery));