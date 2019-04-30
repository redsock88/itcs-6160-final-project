<!DOCTYPE HTML">
<html>
	<?php 
        global $db;
        include_once 'header.html';
        require_once 'dbConnection.php'; 
    ?>
    <body>
        <center>
        	<p></p>
        	<h2>All Database Views</h2>
        	<p></p>
        	<?php 
        	   echo "<b>View All Drivers</b><br>";
        	   echo "This view returns all person table data for all drivers.<br>";
        	?>
			<table class="sortable" cellpadding="15" border="1">
				<tr>
        			<th>PersonID</th>
        			<th>Name</th>
        			<th>Email</th>
        			<th>PhoneNumber</th>
        			<th>PersonType</th>
    			</tr>
    	   		<?php
    				$sql = "SELECT * FROM all_drivers order by personID asc";
    				$result = mysqli_query($db->connection,$sql);
    				while ( $row = mysqli_fetch_array($result)) {
    			?>
    			<tr>
        			<td><?php echo $row ["personID"]; ?></td>
        			<td><?php echo $row ["name"]; ?></td>
        			<td><?php echo $row ["email"]; ?></td>
        			<td><?php echo $row ["phoneNumber"]; ?></td>
        			<td><?php echo $row ["personType"]; ?></td>
    			</tr>
    			<?php } ?>
			</table>
			<p></p>
        	<?php 
        	   echo "<b>View All Payments</b><br>";
        	   echo "This view returns a summary of all payments recieved.<br>";
        	?>
			<table class="sortable" cellpadding="15" border="1">
				<tr>
        			<th>Name</th>
        			<th>PaymentDate</th>
        			<th>PaymentAmount</th>
    			</tr>
    	   		<?php
    				$sql = "SELECT * FROM all_payments order by name asc";
    				$result = mysqli_query($db->connection,$sql);
    				while ( $row = mysqli_fetch_array($result)) {
    			?>
    			<tr>
        			<td><?php echo $row ["name"]; ?></td>
        			<td><?php echo $row ["paymentDate"]; ?></td>
        			<td><?php echo $row ["paymentAmount"]; ?></td>
    			</tr>
    			<?php } ?>
			</table>
			<p></p>
        	<?php 
        	   echo "<b>View All Rides</b><br>";
        	   echo "This view returns a summary of all rides.<br>";
        	?>
			<table class="sortable" cellpadding="15" border="1">
				<tr>
        			<th>StartDateTime</th>
        			<th>EndDateTime</th>
        			<th>StartLocation</th>
        			<th>EndLocation</th>
        			<th>Passenger1</th>
        			<th>Passenger2</th>
        			<th>Driver</th>
    			</tr>
    	   		<?php
    				$sql = "SELECT * FROM all_rides order by startDateTime asc";
    				$result = mysqli_query($db->connection,$sql);
    				while ( $row = mysqli_fetch_array($result)) {
    			?>
    			<tr>
        			<td><?php echo $row ["startDateTime"]; ?></td>
        			<td><?php echo $row ["endDateTime"]; ?></td>
        			<td><?php echo $row ["startLocation"]; ?></td>
        			<td><?php echo $row ["endLocation"]; ?></td>
        			<td><?php echo $row ["passenger1"]; ?></td>
        			<td><?php echo $row ["passenger2"]; ?></td>
        			<td><?php echo $row ["driver"]; ?></td>
    			</tr>
    			<?php } ?>
			</table>
        </center>
    </body>
</html>