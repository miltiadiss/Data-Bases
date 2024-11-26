DROP TRIGGER tr_trip_after_update;
DELIMITER $
CREATE TRIGGER tr_trip_after_update
AFTER UPDATE ON trip
FOR EACH ROW 
     BEGIN
     DECLARE changes VARCHAR(200);
     SET changes=CONCAT(NEW.tr_id, ',' ,
			NEW.tr_departure, ',' ,
			NEW.tr_return, ',' ,
                        NEW.tr_maxseats, ',' ,
                        NEW.tr_cost, ',' ,
                        NEW.tr_br_code, ',' ,
                        NEW.tr_gui_AT, ',' ,
                        NEW.tr_drv_AT);
	INSERT INTO log VALUES(CURRENT_USER(),'update to trip' ,changes ,current_timestamp());
END$
DELIMITER ;


DROP TRIGGER reservation_update;
DELIMITER $
CREATE TRIGGER reservation_update
AFTER UPDATE ON reservation
FOR EACH ROW 
     BEGIN
     DECLARE changes VARCHAR(200);
     SET changes=CONCAT(NEW.res_tr_id, ',' ,
			NEW.res_seatnum, ',' ,
			NEW.res_name, ',' ,
                        NEW.res_lname, ',' ,
                        NEW.res_isadult);
	INSERT INTO log VALUES(CURRENT_USER(),'update to reservation' ,changes ,current_timestamp());
END$
DELIMITER ;


DROP TRIGGER tr_destination_after_update;
DELIMITER $
CREATE TRIGGER tr_destination_after_update
AFTER UPDATE ON destination
FOR EACH ROW 
     BEGIN
     DECLARE changes VARCHAR(200);
     SET changes=CONCAT(NEW.dst_id, ',' ,
						NEW.dst_name , ',' ,
						NEW.dst_descr , ',' ,
                        NEW.dst_rtype , ',' ,
                        NEW.dst_language , ',' ,
                        NEW.dst_location);
	INSERT INTO log VALUES(CURRENT_USER(),'update to destination' ,changes ,current_timestamp());
END$
DELIMITER ;


DROP TRIGGER tr_travel_to_after_update;
DELIMITER $
CREATE TRIGGER tr_travel_to_after_update
AFTER UPDATE ON travel_to
FOR EACH ROW 
     BEGIN
     DECLARE changes VARCHAR(200);
     SET changes=CONCAT(NEW.to_tr_id, ',' ,
						NEW.to_dst_id, ',' ,
						NEW.to_arrival, ',' ,
                        NEW.to_departure);
	INSERT INTO log VALUES(CURRENT_USER(),'update to travel_to' ,changes ,current_timestamp());
END$
DELIMITER ;


DROP TRIGGER tr_event_after_update;
DELIMITER $
CREATE TRIGGER tr_event_after_update
AFTER UPDATE ON event
FOR EACH ROW 
     BEGIN
     DECLARE changes VARCHAR(200);
     SET changes=CONCAT(NEW.ev_tr_id, ',' ,
						NEW.ev_start, ',' ,
						NEW.ev_end, ',' ,
                        NEW.ev_descr);
	INSERT INTO log VALUES(CURRENT_USER(),'update to event' ,changes ,current_timestamp());
END$
DELIMITER ;


DROP TRIGGER tr_trip_after_delete;
DELIMITER $
CREATE TRIGGER tr_trip_after_delete
AFTER DELETE ON trip
FOR EACH ROW 
     BEGIN
     DECLARE changes VARCHAR(200);
     SET changes=CONCAT(OLD.tr_id, ',' ,
						OLD.tr_departure, ',' ,
						OLD.tr_return, ',' ,
                        OLD.tr_maxseats, ',' ,
                        OLD.tr_cost, ',' ,
                        OLD.tr_br_code, ',' ,
                        OLD.tr_gui_AT, ',' ,
                        OLD.tr_drv_AT);
	INSERT INTO log VALUES(CURRENT_USER(),'delete to trip' ,changes ,current_timestamp());
END$
DELIMITER ;


DROP TRIGGER tr_destination_after_delete;
DELIMITER $
CREATE TRIGGER tr_destination_after_delete
AFTER DELETE ON destination
FOR EACH ROW 
     BEGIN
     DECLARE changes VARCHAR(200);
     SET changes=CONCAT(OLD.dst_id, ',' ,
						OLD.dst_name, ',' ,
						OLD.dst_descr, ',' ,
                        OLD.dst_rtype, ',' ,
                        OLD.dst_language, ',' ,
                        OLD.dst_location);
	INSERT INTO log VALUES(CURRENT_USER(),'delete to destination' ,changes ,current_timestamp());
END$
DELIMITER ;


DROP TRIGGER tr_travel_to_after_delete;
DELIMITER $
CREATE TRIGGER tr_travel_to_after_delete
AFTER DELETE ON travel_to
FOR EACH ROW 
     BEGIN
     DECLARE changes VARCHAR(200);
     SET changes=CONCAT(OLD.to_tr_id, ',' ,
						OLD.to_dst_id, ',' ,
						OLD.to_arrival, ',' ,
                        OLD.to_departure);
	INSERT INTO log VALUES(CURRENT_USER(),'delete to travel_to' ,changes ,current_timestamp());
END$
DELIMITER ;


DROP TRIGGER tr_event_after_delete;
DELIMITER $
CREATE TRIGGER tr_event_after_delete
AFTER DELETE ON event
FOR EACH ROW 
     BEGIN
     DECLARE changes VARCHAR(200);
     SET changes=CONCAT(OLD.ev_tr_id, ',' ,
						OLD.ev_start, ',' ,
						OLD.ev_end, ',' ,
                        OLD.ev_descr);
	INSERT INTO log VALUES(CURRENT_USER(),'delete to event' ,changes ,current_timestamp());
END$
DELIMITER ;


DROP TRIGGER tr_reservation_after_delete;
DELIMITER $
CREATE TRIGGER tr_reservation_after_delete
AFTER DELETE ON reservation
FOR EACH ROW 
     BEGIN
     DECLARE changes VARCHAR(200);
     SET changes=CONCAT(OLD.res_tr_id , ',' ,
					    OLD.res_seatnum  , ',' ,
						OLD.res_name  , ',' ,
                        OLD.res_lname , ',' ,
                        OLD.res_isadult);
	INSERT INTO log VALUES(CURRENT_USER(),'update to reservation' ,changes ,current_timestamp());
END$
DELIMITER ;


DROP TRIGGER tr_trip_after_update;
DELIMITER $
CREATE TRIGGER tr_trip_after_update
AFTER INSERT ON trip
FOR EACH ROW 
     BEGIN
     DECLARE changes VARCHAR(200);
     SET changes=CONCAT(NEW.tr_id, ',' ,
			NEW.tr_departure, ',' ,
			NEW.tr_return, ',' ,
                        NEW.tr_maxseats, ',' ,
                        NEW.tr_cost, ',' ,
                        NEW.tr_br_code, ',' ,
                        NEW.tr_gui_AT, ',' ,
                        NEW.tr_drv_AT);
	INSERT INTO log VALUES(CURRENT_USER(),'update to trip' ,changes ,current_timestamp());
END$
DELIMITER ;


DROP TRIGGER reservation_update;
DELIMITER $
CREATE TRIGGER reservation_update
AFTER INSERT ON reservation
FOR EACH ROW 
     BEGIN
     DECLARE changes VARCHAR(200);
     SET changes=CONCAT(NEW.res_tr_id, ',' ,
			NEW.res_seatnum, ',' ,
			NEW.res_name, ',' ,
                        NEW.res_lname, ',' ,
                        NEW.res_isadult);
	INSERT INTO log VALUES(CURRENT_USER(),'update to reservation' ,changes ,current_timestamp());
END$
DELIMITER ;


DROP TRIGGER tr_destination_after_update;
DELIMITER $
CREATE TRIGGER tr_destination_after_update
AFTER INSERT ON destination
FOR EACH ROW 
     BEGIN
     DECLARE changes VARCHAR(200);
     SET changes=CONCAT(NEW.dst_id, ',' ,
						NEW.dst_name , ',' ,
						NEW.dst_descr , ',' ,
                        NEW.dst_rtype , ',' ,
                        NEW.dst_language , ',' ,
                        NEW.dst_location);
	INSERT INTO log VALUES(CURRENT_USER(),'update to destination' ,changes ,current_timestamp());
END$
DELIMITER ;


DROP TRIGGER tr_travel_to_after_update;
DELIMITER $
CREATE TRIGGER tr_travel_to_after_update
AFTER INSERT ON travel_to
FOR EACH ROW 
     BEGIN
     DECLARE changes VARCHAR(200);
     SET changes=CONCAT(NEW.to_tr_id, ',' ,
						NEW.to_dst_id, ',' ,
						NEW.to_arrival, ',' ,
                        NEW.to_departure);
	INSERT INTO log VALUES(CURRENT_USER(),'update to travel_to' ,changes ,current_timestamp());
END$
DELIMITER ;


DROP TRIGGER tr_event_after_update;
DELIMITER $
CREATE TRIGGER tr_event_after_update
AFTER INSERT ON event
FOR EACH ROW 
     BEGIN
     DECLARE changes VARCHAR(200);
     SET changes=CONCAT(NEW.ev_tr_id, ',' ,
						NEW.ev_start, ',' ,
						NEW.ev_end, ',' ,
                        NEW.ev_descr);
	INSERT INTO log VALUES(CURRENT_USER(),'update to event' ,changes ,current_timestamp());
END$
DELIMITER ;


drop trigger if exists dont_change_info;
delimiter $
create trigger dont_change_info
before update on trip
for each row
begin 
DECLARE reservationCount INT;
	SET reservationCount=0;
	
	SELECT COUNT(*) INTO reservationCount 
	FROM reservation 
	INNER JOIN trip ON tr_id=res_tr_id
	WHERE res_tr_id=tr_id;

if reservationCount>0 then set 
new.tr_departure=old.tr_departure,
new.tr_return=old.tr_return,
new.tr_cost=old.tr_cost;
end if;

end $

delimiter ;

update trip set tr_cost=80000 where tr_id=1001101;


drop trigger if exists salary_reduction;
delimiter $
create trigger salary_reduction
before update on worker
for each row
begin 
if new.wrk_salary<old.wrk_salary
then 
set new.wrk_salary=old.wrk_salary;
end if;
end $
delimiter ;

update worker set wrk_salary=500 where wrk_AT='AA09895623';
