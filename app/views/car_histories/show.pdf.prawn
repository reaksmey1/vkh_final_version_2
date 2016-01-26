<!DOCTYPE HTML>
<html>
	 	<head>
		 <meta http-equiv="content-type" content="text/html; charset=utf-8" />
		</head>
	<div>
		<div style="display: inline;">
			<span>
				<%= wicked_pdf_image_tag 'logo.png' %>
			</span>
			<span>
				<%= wicked_pdf_image_tag 'logo.png' %>
			</span>
			<span>
				sdfdsfds
			</span>
		</div>
	</div>
		


		
	<div>
	<div style="">
	<div>

	<div style="display: block;">
		<div style=" float : left;">
			<h4> Invoice : <%= @car.invoice_number %> </h4>
			<p> Plate Number : <%= @car.plate_number %> </p>
			<p> Date : <%= @car.entry_date %> </p>
		</div>

		<div style=" float : right;">
			<p> Brand : <%= @car.name %> </p>
			<p> Color : <%= @car.color %> </p>
			<p> Phone Number : <%= @car.phone_number %> </p>
			<p> Conteur : <%= @car.conteur %> </p>
		</div>
	</div>
	</div>

	<table border="1" width="100%">
		<tr style="background-color: gray ; color: white;">
			<th style="text-align: center;"> ឈ្មោះ </th>
			<th style="text-align: center;"> Amount </th>
			<th style="text-align: center;"> Unit price </th>
			<th style="text-align: center;"> Selling price </th>
		</tr>
		<% @sell.each do |el| %>
		<tr>
			<td style="font-size: 75%; padding: 5px;"> <%= el.spare_part.name %> </td>
			<td style="font-size: 75%;"><%= el.unit %></td>
			<td style="font-size: 75%;"><%= el.selling_price %></td>
			<td style="font-size: 75%;"><%= el.total_price %></td>
		</tr>
		<% end %>
		</table>
		<div style="margin-top: 10px;">
			<p style="text-align: right; font-weight: bold;">Total ៖ <%= @sell[0].sub_total %> $</p>
		</div>
		<br/>
		<br/>
		<br/>

		<div style="border-radius: 25px; border: 2px solid #73AD21; padding: 20px; width: 100%; height: 150px;">
			<b>កំណត់សំគាល់ : </b>
			<p>
				<%= @car.detail %>
			</p>
		</div>
		<br/>
		<br/>
		<div>
			<b>អ្នកទទួល : </b><br/><br/>
			<b>ជាងជុសជុល : </b><br/><br/>
			<b>អ្នកសាកឡាន : </b><br/><br/>
		</div>

