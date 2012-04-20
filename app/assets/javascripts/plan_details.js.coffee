jQuery ->
	
	$('.picktime').live "click",->
		$(this).datetimepicker
			showOn:'focus'
			numberOfMonths: 1 #显示几个月  
			showButtonPanel: true #是否显示按钮面板  
			dateFormat: 'yy-mm-dd' #日期格式  
			clearText:"清除" #清除日期的按钮名称  
			closeText:"关闭" #关闭选择框的按钮名称  
			yearSuffix: '年' #年的后缀  
			showMonthAfterYear:true #是否把月放在年的后面  
			#defaultDate:tomorrow #默认日期  
			#minDate:tomorrow #最小日期  
			#maxDate:'2011-03-20',#最大日期  
			monthNames: ['一月','二月','三月','四月','五月','六月','七月','八月','九月','十月','十一月','十二月'] 
			dayNames: ['星期日','星期一','星期二','星期三','星期四','星期五','星期六'] 
			dayNamesShort: ['周日','周一','周二','周三','周四','周五','周六']  
			dayNamesMin: ['日','一','二','三','四','五','六']
		.focus()
		
	$('.picktime-sample').datepicker
		numberOfMonths: 1 #显示几个月  
		showButtonPanel: true #是否显示按钮面板  
		dateFormat: 'yy-mm-dd' #日期格式  
		clearText:"清除" #清除日期的按钮名称  
		closeText:"关闭" #关闭选择框的按钮名称  
		yearSuffix: '年' #年的后缀  
		showMonthAfterYear:true #是否把月放在年的后面  
		#defaultDate:tomorrow #默认日期  
		#minDate:tomorrow #最小日期  
		#maxDate:'2011-03-20',#最大日期  
		monthNames: ['一月','二月','三月','四月','五月','六月','七月','八月','九月','十月','十一月','十二月'] 
		dayNames: ['星期日','星期一','星期二','星期三','星期四','星期五','星期六'] 
		dayNamesShort: ['周日','周一','周二','周三','周四','周五','周六']  
		dayNamesMin: ['日','一','二','三','四','五','六']

	$("#add_air_button").click ->
		insertNewLine("#add_air")

	$("#add_hotel_button").click ->
		insertNewLine("#add_hotel")
	
	$("#add_way_button").click ->
		insertNewLine("#add_way")
	
	#this is a function
	insertNewLine = (the_button_div) ->
		#old
		the_node = $(the_button_div).prev() #获取最新的节点，此节点位于按钮之上
		line_num = parseInt(the_node.attr("id"))
		#New
		new_line_num = line_num + 1
		new_line = the_node.clone()
		
		#replace string
		new_line.attr("id",new_line_num)
		new_line.children().each ->
			new_id = $(this).attr("id").replace(line_num, new_line_num)
			new_name = $(this).attr("name").replace(line_num, new_line_num)
			$(this).attr("id",new_id)
			$(this).attr("name",new_name)
			$(this).attr("value","")
		
		#insert
		$(the_button_div).before(new_line)