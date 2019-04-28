<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<?php 
        global $db;
        include_once 'header.html';
        require_once 'dbConnection.php'; 
        $pageRideID = $_POST['rideID'];
    ?>
	<body>
    	<p></p>
    	<center>
    		<h1>Edit A Ride</h1>
    		<p></p>
    		<FORM ACTION="editRide.php" METHOD="POST">
    			<h4>**Dates are in YYYY:MM:DD HH:mm:ss format**</h4>
    			<h3>Start DateTime: 
    				<input type="text" name="startDateTime" required/>
    					<?php 
    	  				    $sql = "SELECT * FROM rides where rideID = " . $pageRideID;
    	  				    $result = mysqli_query($db->connection,$sql);
    	  				    while ( $row = mysqli_fetch_array($result)) {
    	  				        echo "  Currect Value: " . $row['startDateTime'];
                            }
                        ?>
    	  		</h3>
    	  		<h3>End DateTime: 
    				<input type="text" name="endDateTime" required/>
    					<?php 
    	  				    $sql = "SELECT * FROM rides where rideID = " . $pageRideID;
    	  				    $result = mysqli_query($db->connection,$sql);
    	  				    while ( $row = mysqli_fetch_array($result)) {
    	  				        echo "  Currect Value: " . $row['endDateTime'];
                            }
                        ?>
    	  		</h3>
    	  		<h3>Start Location: 
    	  			<select name="startLocation">
    	  				<?php 
    	  				    $sql = "SELECT * FROM locations order by locationName asc";
    	  				    $result = mysqli_query($db->connection,$sql);
    	  				    while ( $row = mysqli_fetch_array($result)) {
    	  				        echo "<option value=". $row['locationID'] . ">" . $row['locationName'] . "</option>";
                            }
                        ?>
                    </select>
                    <?php 
                        $sql = "SELECT l.locationName as startLocation FROM rides r join locations l on l.locationID = r.startLocation where rideID = " . $pageRideID;
	  				    $result = mysqli_query($db->connection,$sql);
	  				    while ( $row = mysqli_fetch_array($result)) {
	  				        echo "  Currect Value: " . $row['startLocation'];
                        }
                    ?> 
    	  		</h3>
    	  		<h3>End Location: 
    	  			<select name="endLocation">
    	  				<?php 
    	  				    $sql = "SELECT * FROM locations order by locationName asc";
    	  				    $result = mysqli_query($db->connection,$sql);
    	  				    while ( $row = mysqli_fetch_array($result)) {
    	  				        echo "<option value=". $row['locationID'] . ">" . $row['locationName'] . "</option>";
                            }
                        ?>
                    </select>
                    <?php 
	  				    $sql = "SELECT l.locationName as endLocation FROM rides r join locations l on l.locationID = r.endLocation where rideID = " . $pageRideID;
	  				    $result = mysqli_query($db->connection,$sql);
	  				    while ( $row = mysqli_fetch_array($result)) {
	  				        echo "  Currect Value: " . $row['endLocation'];
                        }
                    ?> 
    	  		</h3>
    	  		<h3>Passenger1: 
    	  			<select name="passenger1">
    	  				<?php 
    	  				    $sql = "SELECT * FROM person order by name asc";
    	  				    $result = mysqli_query($db->connection,$sql);
    	  				    while ( $row = mysqli_fetch_array($result)) {
    	  				        echo "<option value=". $row['personID'] . ">" . $row['name'] . "</option>";
                            }
                        ?>
                    </select>
                    <?php 
	  				    $sql = "SELECT p.name as passenger1 FROM rides r join person p on p.personID = r.passenger1 where rideID = " . $pageRideID;
	  				    $result = mysqli_query($db->connection,$sql);
	  				    while ( $row = mysqli_fetch_array($result)) {
	  				        echo "  Currect Value: " . $row['passenger1'];
                        }
                    ?> 
    	  		</h3>
    	  		<h3>Passenger2 (optional): 
    	  			<select name="passenger2">
    	  				<option></option>
    	  				<?php 
    	  				    $sql = "SELECT * FROM person order by name asc";
    	  				    $result = mysqli_query($db->connection,$sql);
    	  				    while ( $row = mysqli_fetch_array($result)) {
    	  				        echo "<option value=". $row['personID'] . ">" . $row['name'] . "</option>";
                            }
                        ?>
                    </select>
                    <?php 
                        $sql = "SELECT p.name as passenger2 FROM rides r join person p on p.personID = r.passenger2 where rideID = " . $pageRideID;
	  				    $result = mysqli_query($db->connection,$sql);
	  				    while ( $row = mysqli_fetch_array($result)) {
	  				        echo "  Currect Value: " . $row['passenger2'];
                        }
                    ?> 
    	  		</h3>
				<?php 
				    echo '<input type="hidden" name="rideID" value="' . $pageRideID . '" />';
				?>
    			<input TYPE="submit" value="Save Changes"/>
    			<button type="button" name="back" onclick="history.back()">Back</button>
    		</FORM>
    		<?php
    		    function edit($rideID, $startDateTime, $endDateTime, $startLocation, $endLocation, $passenger1, $passenger2, $db){
    		         if(empty($passenger2)){
    		             $sql = "Call modify_ride(" . $rideID . ", '" . $startDateTime . "', '" . $endDateTime . "', " . $startLocation . ", " . $endLocation . ", " . $passenger1 . ", null)";
    		             $result = mysqli_query($db->connection,$sql);
    		             echo "<script> window.location.href = 'http://localhost:8689/itcs-6160-final-project/actions.php'; </script>";
    		         }else{
                        $sql = "Call modify_ride(" . $rideID . ", '" . $startDateTime . "', '" . $endDateTime . "', " . $startLocation . ", " . $endLocation . ", " . $passenger1 . ", " . $passenger2 . ")";
                        $result = mysqli_query($db->connection,$sql);
                        echo "<script> window.location.href = 'http://localhost:8689/itcs-6160-final-project/actions.php'; </script>";
    		         }
                }
                
                if(isset($_POST["passenger1"])){
                    $rowRideID = $_POST["rideID"];
                    $rowStartDateTime = $_POST["startDateTime"];
                    $rowEndDateTime = $_POST["endDateTime"];
                    $rowStartLocation = $_POST["startLocation"];
                    $rowEndLocation = $_POST["endLocation"];
                    $rowPassenger1 = $_POST["passenger1"];
                    $rowPassenger2 = $_POST["passenger2"];
                    edit($rowRideID, $rowStartDateTime, $rowEndDateTime, $rowStartLocation, $rowEndLocation, $rowPassenger1, $rowPassenger2, $db);
                }
            ?>
    	</center>
	</body>
</html>