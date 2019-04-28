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
        	<h2>Stored Procedures in Action</h2>
        	<p></p>
        	<?php 
        	   echo "<b>View All Rides</b><br>";
        	   echo "This page showcases 3 of the 5 stored procedures we have created: add_ride, modify_ride, and remove_ride.<br>";
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
        			<th>
        				<form action="newRide.php" method="GET">
        					<input type="submit" value="Add New">
        				</form>
					<th>
    			</tr>
    	   		<?php
    				$sql = "SELECT * from all_rides";
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
        			<td>
        				<form action="editRide.php" method="post">
        					<input type="hidden" name="rideID" value=<?php echo $row ["rideID"] ?> />
    						<input type="submit" value="Edit"/>
						</form>
        			</td>
        			<td>
        				<form method="post">
        					<input type="hidden" name="rideID" value=<?php echo $row ["rideID"] ?> />
    						<input type="hidden" name="action" value="delete" />
    						<input type="submit" value="Delete"/>
						</form>
        			</td>
    			</tr>
    			<?php } ?>
			</table>
        </center>
        <?php
            function remove($rideID, $db){
                $sql = "Call remove_ride($rideID)";
                $result = mysqli_query($db->connection,$sql);
                echo "<meta http-equiv='refresh' content='0'>";
            }
            
            
            if(isset($_POST["action"])){
                $rowRideID = $_POST["rideID"];
                remove($rowRideID, $db);
            }
        ?>
    </body>
</html>