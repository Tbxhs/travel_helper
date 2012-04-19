jQuery ->
	$(".edit-plan-detail").click ->
		url = ($ @).attr('id')
		$.get url,(data) ->
			$("#edit-plan-detail-modal").html(data)
			$("#edit-plan-detail-modal").modal("show")