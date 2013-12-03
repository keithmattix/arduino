$ ->
	gon.data_values = '<%= Project.find_by(slug: params[:id]).data_values %>'; 
	$('#projectchart').empty(); 
	chartCreate();