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
        	<h2>All Table Data</h2>
        	<p></p>
        	<?php echo "<b>Accounts Table</b><br>"?>
			<table class="sortable" cellpadding="15" border="1">
				<tr>
        			<th>AccountID</th>
        			<th>PersonID</th>
        			<th>Balance</th>
    			</tr>
    	   		<?php
    				$sql = "SELECT * FROM accounts order by accountID asc";
    				$result = mysqli_query($db->connection,$sql);
    				while ( $row = mysqli_fetch_array($result)) {
    			?>
    			<tr>
        			<td><?php echo $row ["accountID"]; ?></td>
        			<td><?php echo $row ["personID"]; ?></td>
        			<td><?php echo $row ["balance"]; ?></td>
    			</tr>
    			<?php } ?>
			</table>
			<p></p>
        	<?php echo "<b>Carts Table</b><br>"?>
			<table class="sortable" cellpadding="15" border="1">
				<tr>
        			<th>CartID</th>
        			<th>Make</th>
        			<th>Model</th>
        			<th>NumOfSeats</th>
        			<th>Available</th>
    			</tr>
    	   		<?php
    				$sql = "SELECT * FROM carts order by cartID asc";
    				$result = mysqli_query($db->connection,$sql);
    				while ( $row = mysqli_fetch_array($result)) {
    			?>
    			<tr>
        			<td><?php echo $row ["cartID"]; ?></td>
        			<td><?php echo $row ["make"]; ?></td>
        			<td><?php echo $row ["model"]; ?></td>
        			<td><?php echo $row ["numOfSeats"]; ?></td>
        			<td><?php echo $row ["available"]; ?></td>
    			</tr>
    			<?php } ?>
			</table>
			<p></p>
        	<?php echo "<b>Drivers Table</b><br>"?>
			<table class="sortable" cellpadding="15" border="1">
				<tr>
        			<th>DriverID</th>
        			<th>PersonID</th>
        			<th>Status</th>
    			</tr>
    	   		<?php
    				$sql = "SELECT * FROM drivers order by driverID asc";
    				$result = mysqli_query($db->connection,$sql);
    				while ( $row = mysqli_fetch_array($result)) {
    			?>
    			<tr>
        			<td><?php echo $row ["driverID"]; ?></td>
        			<td><?php echo $row ["personID"]; ?></td>
        			<td><?php echo $row ["status"]; ?></td>
    			</tr>
    			<?php } ?>
			</table>
			<p></p>
        	<?php echo "<b>Faculty Table</b><br>"?>
			<table class="sortable" cellpadding="15" border="1">
				<tr>
        			<th>PersonID</th>
        			<th>Department</th>
        			<th>Fulltime</th>
    			</tr>
    	   		<?php
    				$sql = "SELECT * FROM faculty order by personID asc";
    				$result = mysqli_query($db->connection,$sql);
    				while ( $row = mysqli_fetch_array($result)) {
    			?>
    			<tr>
        			<td><?php echo $row ["personID"]; ?></td>
        			<td><?php echo $row ["department"]; ?></td>
        			<td><?php echo $row ["fulltime"]; ?></td>
    			</tr>
    			<?php } ?>
			</table>
			<p></p>
        	<?php echo "<b>Locations Table</b><br>"?>
			<table class="sortable" cellpadding="15" border="1">
				<tr>
        			<th>LocationID</th>
        			<th>LocationName</th>
        			<th>LocationAddress</th>
    			</tr>
    	   		<?php
    				$sql = "SELECT * FROM locations order by locationID asc";
    				$result = mysqli_query($db->connection,$sql);
    				while ( $row = mysqli_fetch_array($result)) {
    			?>
    			<tr>
        			<td><?php echo $row ["locationID"]; ?></td>
        			<td><?php echo $row ["locationName"]; ?></td>
        			<td><?php echo $row ["locationAddress"]; ?></td>
    			</tr>
    			<?php } ?>
			</table>
			<p></p>
        	<?php echo "<b>Payments Table</b><br>"?>
			<table class="sortable" cellpadding="15" border="1">
				<tr>
        			<th>PaymentID</th>
        			<th>AccountID</th>
        			<th>PaymentDate</th>
        			<th>PaymentAmount</th>
    			</tr>
    	   		<?php
    				$sql = "SELECT * FROM payments order by paymentID asc";
    				$result = mysqli_query($db->connection,$sql);
    				while ( $row = mysqli_fetch_array($result)) {
    			?>
    			<tr>
        			<td><?php echo $row ["paymentID"]; ?></td>
        			<td><?php echo $row ["accountID"]; ?></td>
        			<td><?php echo $row ["paymentDate"]; ?></td>
        			<td><?php echo $row ["paymentAmount"]; ?></td>
    			</tr>
    			<?php } ?>
			</table>
			<p></p>
        	<?php echo "<b>Person Table</b><br>"?>
			<table class="sortable" cellpadding="15" border="1">
				<tr>
        			<th>PersonID</th>
        			<th>Name</th>
        			<th>Email</th>
        			<th>PhoneNumber</th>
        			<th>PersonType</th>
    			</tr>
    	   		<?php
    				$sql = "SELECT * FROM person order by personID asc";
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
        	<?php echo "<b>Ratings Table</b><br>"?>
			<table class="sortable" cellpadding="15" border="1">
				<tr>
        			<th>RatingID</th>
        			<th>Rating</th>
        			<th>Comment</th>
        			<th>RatingDate</th>
    			</tr>
    	   		<?php
    				$sql = "SELECT * FROM ratings order by ratingID asc";
    				$result = mysqli_query($db->connection,$sql);
    				while ( $row = mysqli_fetch_array($result)) {
    			?>
    			<tr>
        			<td><?php echo $row ["ratingID"]; ?></td>
        			<td><?php echo $row ["rating"]; ?></td>
        			<td><?php echo $row ["comment"]; ?></td>
        			<td><?php echo $row ["ratingDate"]; ?></td>
    			</tr>
    			<?php } ?>
			</table>
			<p></p>
        	<?php echo "<b>Rides Table</b><br>"?>
			<table class="sortable" cellpadding="15" border="1">
				<tr>
        			<th>RideID</th>
        			<th>StartDateTime</th>
        			<th>EndDateTime</th>
        			<th>StartLocation</th>
        			<th>EndLocation</th>
        			<th>PaymentID</th>
        			<th>RatingID</th>
        			<th>Passenger1</th>
        			<th>Passenger2</th>
        			<th>DriverID</th>
        			<th>CartID</th>
    			</tr>
    	   		<?php
    				$sql = "SELECT * FROM rides order by rideID asc";
    				$result = mysqli_query($db->connection,$sql);
    				while ( $row = mysqli_fetch_array($result)) {
    			?>
    			<tr>
        			<td><?php echo $row ["rideID"]; ?></td>
        			<td><?php echo $row ["startDateTime"]; ?></td>
        			<td><?php echo $row ["endDateTime"]; ?></td>
        			<td><?php echo $row ["startLocation"]; ?></td>
        			<td><?php echo $row ["endLocation"]; ?></td>
        			<td><?php echo $row ["paymentID"]; ?></td>
        			<td><?php echo $row ["ratingID"]; ?></td>
        			<td><?php echo $row ["passenger1"]; ?></td>
        			<td><?php echo $row ["passenger2"]; ?></td>
        			<td><?php echo $row ["driverID"]; ?></td>
        			<td><?php echo $row ["cartID"]; ?></td>
    			</tr>
    			<?php } ?>
			</table>
			<p></p>
        	<?php echo "<b>Staff Table</b><br>"?>
			<table class="sortable" cellpadding="15" border="1">
				<tr>
        			<th>PersonID</th>
        			<th>Department</th>
        			<th>IsAdmin</th>
        			<th>Position</th>
    			</tr>
    	   		<?php
    				$sql = "SELECT * FROM staff order by personID asc";
    				$result = mysqli_query($db->connection,$sql);
    				while ( $row = mysqli_fetch_array($result)) {
    			?>
    			<tr>
        			<td><?php echo $row ["personID"]; ?></td>
        			<td><?php echo $row ["department"]; ?></td>
        			<td><?php echo $row ["isAdmin"]; ?></td>
        			<td><?php echo $row ["position"]; ?></td>
    			</tr>
    			<?php } ?>
			</table>
			<p></p>
        	<?php echo "<b>Student Table</b><br>"?>
			<table class="sortable" cellpadding="15" border="1">
				<tr>
        			<th>PersonID</th>
        			<th>Department</th>
        			<th>GradYear</th>
        			<th>BirthDate</th>
    			</tr>
    	   		<?php
    				$sql = "SELECT * FROM student order by personID asc";
    				$result = mysqli_query($db->connection,$sql);
    				while ( $row = mysqli_fetch_array($result)) {
    			?>
    			<tr>
        			<td><?php echo $row ["personID"]; ?></td>
        			<td><?php echo $row ["department"]; ?></td>
        			<td><?php echo $row ["gradYear"]; ?></td>
        			<td><?php echo $row ["birthDate"]; ?></td>
    			</tr>
    			<?php } ?>
			</table>
        </center>
    </body>
</html>