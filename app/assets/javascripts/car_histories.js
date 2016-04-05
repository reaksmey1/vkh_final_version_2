jQuery.ajaxSetup({
	'beforeSend': function(xhr) {xhr.setRequestHeader("Accept", "text/javascript")}
})

$(document).ready(function() {

	$("#spare_part_name").keypress(function(e) {
    if(e.which == 13) {
      $.post($(this).attr("action"), $(this).serialize(), null, "script");
      return false;
    }
	});

	$('#datetimepicker').datetimepicker({
		timepicker:false,
		format:'Y/m/d'
	});

	$("#invoice").click(function() {
		alert("invoice is clicked");
	});

	$("#btn_link_new").click(function() {
		$("#btn_link_new").hide();
		$("#new-spare-part").show();
	});

	$("#btn_new_spare_part").click(function() {
		var spare_part = $("#txt_spare_part").val();
		$.ajax({
			type: "POST",
			url: "/spare_parts/quick_create",
			data: {name: spare_part},
			success: function (data) {
				$("#btn_link_new").show();
				$("#new-spare-part").hide();
			}
		})
	});

	$("#print").click(function() {
  //window.alert("clicked internal btn!");
		var i = 0;
		var sell_data = [];
		$('#spare_part_detail tr').each(function() {
		    i = i + 1
		    if (i > 1) {
		      var code = $(this).find(".code").html();
		      var name = $(this).find(".spare_part").html();
		      var amount = $(this).children().find('input')[0].value;
		      var unit_price = $(this).children().find('input')[1].value;
		      var discount = $(this).children().find('input')[2].value;
		      var total_price = $(this).children().find('input')[3].value;
		      var sub_total = $("#total").val();
		      var recieved = $("#recieved").val();
		      var return_money = $("#return").val();
		      var total_discount = $("#discount").val();
		      var car_id = $("#car_id").val();
		      var entry_date = $("#datetimepicker").val();
		      sell_data.push({code: code, name: name, amount: amount, unit_price: unit_price, total_price: total_price, sub_total: sub_total, recieved: recieved, return_money: return_money, car_id: car_id, entry_date: entry_date, discount: discount, total_discount: total_discount})
		    }
		 });
	  $.ajax({
	      type: "POST",
	      contentType: "application/json; charset=utf-8",
	      url: "/cars/"+$("#car_id").val()+"/print",
	      //data: "{'data1':'" + value1+ "', 'data2':'" + value2+ "', 'data3':'" + value3+ "'}",
	      data: JSON.stringify(sell_data),
	      // dataType: "json",
	      success: function (data) {
	      //do somthing here
		      if (data == "failed") {
	      		window.alert("សូមបន្តែមពត៍មាន មុននឹង PRINT");
	      	} else {
	      		par = data.split("-");
	      		window.open("../"+par[1]+"-"+par[2]+".pdf", '_blank');
	      	}
	      },
	      error: function (data){
	      	console.log(data);
	          // window.alert("something wrong!");
	          // window.open("bobo.pdf", '_blank');
	      }
	  });
	});


});

