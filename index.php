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
            <h2>Home Page</h2>
                <?php 
                    echo "<b>Group Members:</b><br>";
                    echo "Andrew Haskett<br>";
                    echo "Felipe Veloso<br>";
                    echo "Katrina Hartley<br>";
                    echo "Luke Nigro<br>";
                    echo "<br><br>";
                    
                 ?>
                 <div class="row">
         		 	<div class="column">
         		 	<p>
         		 		<?php 
                            echo "<b>Table Names:</b><br>";
                            $sql = "SELECT table_name FROM information_schema.tables where table_schema = 'itcs6160' and table_type = 'BASE TABLE' order by table_name asc";
                            $result = mysqli_query($db->connection,$sql);
                            while ( $row = mysqli_fetch_array($result)) {
                              echo $row ["table_name"];
                              echo "<br>";
                            }
                            echo "<br><br>";
                        ?>
                        </p>
                    </div>
                    <div class="column">
                    <p>
         		 		<?php 
                            echo "<b>View Names:</b><br>";
                            $sql = "SELECT table_name FROM information_schema.views order by table_name asc";
                            $result = mysqli_query($db->connection,$sql);
                            while ( $row = mysqli_fetch_array($result)) {
                                echo $row ["table_name"];
                                echo "<br>";
                            }
                            echo "<br><br>";
                            
                            echo "<b>Stored Procedure Names:</b><br>";
                            $sql = "SELECT ROUTINE_NAME FROM information_schema.ROUTINES order by ROUTINE_NAME asc";
                            $result = mysqli_query($db->connection,$sql);
                            while ( $row = mysqli_fetch_array($result)) {
                                echo $row ["ROUTINE_NAME"];
                                echo "<br>";
                            }
                            echo "<br><br>";
                        ?>
                    </p>
                </div>
            </div>
        </center>
    </body>
</html>