$ ->
	gon.data_values = JSON.parse('<%= Project.find_by(slug: params[:id]).data_values.to_a.map {|x| x.value} %>'); 
	chart.series[0].setData(gon.data_values, true);