-- Database Users

-- admin
CREATE USER 'admin'@'itcs6160' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON * . * TO 'admin'@'itcs6160';
-- read only user
CREATE USER 'user1'@'itcs6160' IDENTIFIED BY 'password';
GRANT SELECT ON * . * TO 'user1'@'itcs6160';

commit;


-- Views

-- display all rides
CREATE VIEW `all_rides` AS
select r.rideID,
  r.startDateTime,
  r.endDateTime,
  l1.locationName as startLocation,
  l2.locationName as endLocation,
  p2.name as passenger1,
  p3.name as passenger2,
  p1.name driver
from rides r
left outer join drivers d on d.driverID = r.driverID
left outer join person p1 on p1.personID = d.personID
join person p2 on p2.personID = r.passenger1
left outer join person p3 on p3.personID = r.passenger2
join locations l1 on l1.locationID = r.startLocation
join locations l2 on l2.locationID = r.endLocation;

-- display all payments
CREATE VIEW `all_payments` AS
select p.name, pa.paymentDate, pa.paymentAmount
from person p
join accounts a on a.personID = p.personID
join payments pa on pa.accountID = a.accountID
order by p.personID asc;

-- display all drivers
CREATE VIEW `all_drivers` AS
select *
from person
where personID in (select personID from drivers)
order by personID asc;

commit;


-- Procedures

-- add new ride
DELIMITER //
CREATE PROCEDURE add_ride
(IN startDateTime DateTime, IN endDateTime DateTime, IN startLocation int, IN endLocation int, IN passenger1 int, IN passenger2 int)
BEGIN
  set @maxID = (select max(rideID) from rides);
  insert into rides 
  values ((@maxID+1), startDateTime, endDateTime, startLocation, endLocation, null, null, passenger1, passenger2, null, null);
END //
DELIMITER ;

-- modify a ride
DELIMITER //
CREATE PROCEDURE modify_ride
(IN ride int, IN startDate DateTime, IN endDate DateTime, IN sLocation int, IN eLocation int, IN pass1 int, IN pass2 int)
BEGIN
  update rides 
  set startDateTime = startDate, endDateTime = endDate, startLocation = sLocation, endLocation = eLocation, passenger1 = pass1, passenger2 = pass2
  where rideID = ride;
END //
DELIMITER ;

-- remove a ride
DELIMITER //
CREATE PROCEDURE remove_ride
(IN ride INT)
BEGIN
  delete from rides where rideID = ride;
END //
DELIMITER ;

-- add new payment
DELIMITER //
CREATE PROCEDURE add_payment
(IN ride int, IN account int, IN amount Double)
BEGIN
  set @maxID = (select max(paymentID) from payments);
  insert into payments 
  values ((@maxID+1), account, current_date(), amount);
  update rides
  set paymentID = @maxID+1
  where rideID = ride;
END //
DELIMITER ;

-- add new rating
DELIMITER //
CREATE PROCEDURE add_rating
(IN ride int, IN rating int, IN comment varchar(300))
BEGIN
  set @maxID = (select max(ratingID) from ratings);
  insert into ratings 
  values ((@maxID+1), rating, comment, current_date());
  update rides
  set ratingID = @maxID+1
  where rideID = ride;
END //
DELIMITER ;


-- triggers

-- update balance when a payment is added
DELIMITER //
CREATE TRIGGER update_balance
AFTER INSERT on payments 
FOR EACH ROW 
BEGIN
  UPDATE accounts
    SET balance = round(balance - new.paymentAmount, 2)
    WHERE accountID = new.accountID;
END $$

-- 
DELIMITER //
CREATE TRIGGER AFTER_golfcart_update
AFTER INSERT ON payments
FOR EACH ROW
BEGIN
    INSERT INTO payments
    VALUES (NEW.paymentID, new.accountID, NOW(), new.paymentAmount);
END$$
DELIMITER //


commit;