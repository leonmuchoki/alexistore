$(document).on('ready turbolinks:load',function(){
  //alert("haiyaa");
  var sub_total_amount = [];
  var total_amount = 0;
  var total_profit = [];
  var order_sale_items = [];

  //------------------------------------------------------------
  // add ordered items to slip
  //--------------------------------------------------------------
  $('#table-sale-items').on('click', '.ui-btn', function() {
  	var current_row = $(this).closest("tr");
  	var o_item_name = current_row.find('#table-sale-items-name').text();
  	var o_item_id = current_row.find('#item-sale-id').val();
  	var o_item_price = current_row.find('#sell-item-price').val();
  	var o_item_quantity = current_row.find('#sell-item-quantity').val();

  	var amount = o_item_price * o_item_quantity;
  	sub_total_amount.push(amount);

  	// do summary of items
  	total_amount = 0;
  	$.each(sub_total_amount, function(index, value) {
  	  total_amount += value;
  	});
    
    // display in order slip
  	$("#table-sell-slip tbody").append(
      "<tr>" + 
        "<td>" + o_item_name + "</td>" +
        "<td>" + amount + "</td>" +
        "<td>" + o_item_quantity + "</td>" +
        "</tr>"
  	);  

  	$('#table-sell-slip-footer h3').html(total_amount);

  	// save ordered foods for submitation later
  	order_sale_items.push({
  	  item_id: o_item_id,
  	  quantity: o_item_quantity,
  	  amount: amount
  	});	

    });

  //------------------------------------------------------------
  // submit order
  //--------------------------------------------------------------
  $('#table-sell-slip').on('click', '.btnsubmit', function() {
    
    $.ajax({
      type: "POST",
      url: "/sales",
      data: {sale: {amount: total_amount,
                     sale_items_attributes: order_sale_items}},
      dataType: "JSON"
    }).success(function(response) {
        console.log("success" + JSON.stringify(response));

        //clean up
        total_amount = 0;
        $("#table-sell-slip tbody tr").remove();
        $('#table-sell-slip-footer h3').html("Order created successfully.");

    }).error(function(error) {
      console.log("error" + JSON.stringify(error));
    });
  });

   });
