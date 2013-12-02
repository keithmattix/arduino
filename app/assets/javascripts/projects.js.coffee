# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
window.Project ||= {}

Project.show = () ->
	$ ->
		chartCreate = () -> 
		  new Highcharts.Chart(
		  	chart:
		    	renderTo: "projectchart"
		    title:
		    	text: gon.project.name
		    xAxis:
		    	type: 'datetime'
		    	title: 
		    		text:gon.project.x_name
		    	labels:
		        formatter: ->
		        	Highcharts.dateFormat("%b %e %H:%M", this.value);
		    yAxis: 
		    	title: 
		    		text: gon.project.y_name 
		    series: [
		    					data: if gon.data_values? then $.map(gon.data_values, (item, index) -> item.value) else []
		    				]
		    plotOptions:
		    	series:
		    		pointStart: new Date(if gon.data_values.length > 0 then gon.data_values[0].created_at else Date.now()).getDate()
		  )
		gon.watch("project", {interval: 1000 * 60, method: "POST", url: gon.check_url}, null)
		chartCreate()