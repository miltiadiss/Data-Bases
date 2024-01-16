DROP PROCEDURE IF EXISTS new_driver;
DELIMITER $
CREATE PROCEDURE new_driver(IN drvat CHAR(10),IN name varchar(20), IN lname VARCHAR(20), IN salary FLOAT(7,2),
 IN license ENUM('A','B','C','D'), IN route ENUM('LOCAL','ABROAD'), IN experience TINYINT(4))
BEGIN
DECLARE minworker INT;
DECLARE min_br_code INT(11);

select count(*), br_code into minworker, min_br_code from worker inner join branch on wrk_br_code = br_code inner join driver on drv_AT=wrk_AT
 where drv_AT=wrk_AT group by wrk_br_code order by count(*) limit 1;

     Insert into worker(wrk_AT,wrk_name,wrk_lname,wrk_salary, wrk_br_code) VALUES(drvat, name, lname, salary, min_br_code);
    INSERT INTO driver VALUES(drvat, license, route, experience);
    
END $
DELIMITER ;

call new_driver('AT10108434', 'AGGELOS', 'FILIS', 1060.00, 'B', 'LOCAL', '13');


DROP PROCEDURE IF EXISTS find_trip_info;
DELIMITER $                      
CREATE PROCEDURE find_trip_info(IN branch_id int(11), IN Date_1 date, IN Date_2 date)
BEGIN 
    DECLARE not_found INT ;
    DECLARE departure date;
    DECLARE number_of_res INT;
    DECLARE cost INT(11);
	DECLARE driver_name CHAR(25);
	DECLARE driver_lastname CHAR(25);
	DECLARE guide_name CHAR(25);
	DECLARE guide_lastname CHAR(25);
    DECLARE max_seats TINYINT(4);
	DECLARE empty_seats int;
    
    DECLARE TR_INFO CURSOR FOR 
        SELECT tr_id, tr_cost, tr_maxseats, tr_departure,count(tr_id)
        FROM branch INNER JOIN trip ON br_code=tr_br_code INNER JOIN  reservation ON tr_id=res_tr_id
        WHERE br_code=branch_id group by res_tr_id;
  
  declare WRK_1 cursor for 
  select wrk_name, wrk_lname FROM branch INNER JOIN trip ON br_code=tr_br_code inner join driver on tr_drv_AT=drv_AT inner join worker ON drv_AT=wrk_AT where br_code=branch_id ;
  declare WRK_2 cursor for
  select wrk_name, wrk_lname FROM branch INNER JOIN trip ON br_code=tr_br_code  inner join guide on tr_gui_AT=gui_AT inner join worker ON gui_AT=wrk_AT where br_code=branch_id ;	
  
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET not_found=1;
	
    SET not_found = 0;
    OPEN TR_INFO;
	open WRK_1;
	open WRK_2;
	
    REPEAT
		FETCH TR_INFO INTO branch_id, cost, max_seats, departure, number_of_res;
	    FETCH WRK_1  into driver_name, driver_lastname; 
		FETCH WRK_2 into guide_name, guide_lastname;

       IF(not_found=0)
		THEN
            IF Date_1 <= departure AND Date_2 >= departure THEN
			SET empty_seats=max_seats-number_of_res;
			SELECT cost, max_seats, number_of_res, driver_name, driver_lastname,guide_name, guide_lastname, empty_seats ;
			ELSE SELECT 'NO TRIP FOUND BETWEEN THESE DATES';	
            END IF;
        END IF;
    UNTIL(not_found=1)
	END REPEAT;
    CLOSE TR_INFO;
	CLOSE WRK_1;
	CLOSE WRK_2;
END$
DELIMITER ;

call find_trip_info(10, '2023-08-10', '2023-11-20');
call find_trip_info(9, '2022-03-04', '2022-04-14');


DROP PROCEDURE IF EXISTS delete_employee;
DELIMITER $
CREATE PROCEDURE delete_employee( IN first_name VARCHAR(25), IN last_name VARCHAR(25))
BEGIN

DECLARE emp_id CHAR(10);
DECLARE mng_id CHAR(10);

SELECT wrk_AT INTO emp_id FROM worker 
INNER JOIN admin ON wrk_AT=adm_AT
INNER JOIN manages ON mng_adm_AT=adm_AT
WHERE wrk_name=first_name AND wrk_lname=last_name AND adm_type='ADMINISTRATIVE' AND mng_adm_AT<>adm_AT;

IF emp_id is NOT NULL THEN 
 DELETE FROM worker WHERE wrk_AT=emp_id;
ELSE
  SELECT wrk_AT INTO mng_id FROM worker 
INNER JOIN admin ON wrk_AT=adm_AT
INNER JOIN manages ON mng_adm_AT=adm_AT
WHERE wrk_name=first_name AND wrk_lname=last_name AND adm_type='ADMINISTRATIVE' AND mng_adm_AT=adm_AT;

IF mng_id is NOT NULL THEN 
 SELECT 'The employee is the manager of a branch and cannot be deleted';
END IF;
END IF;
END $

DELIMITER ;

call delete_employee('GIANNIS', 'PANOY');

 
DROP PROCEDURE IF EXISTS find_reserv;
DELIMITER $
CREATE PROCEDURE find_reserv(IN low FLOAT(7,2), IN high FLOAT(7,2))
BEGIN 
SELECT res_offers_name, res_offers_lname,res_advance_payment FROM reservation_offers WHERE res_advance_payment BETWEEN low AND high;	
END $
DELIMITER ;
call find_reserv(51.00 , 52.00); 


DROP PROCEDURE IF EXISTS find_client_info;
DELIMITER $

CREATE PROCEDURE find_client_info(IN client_lname VARCHAR(20))
sp: BEGIN

DECLARE cl_lname VARCHAR(20);
DECLARE counter INT;
DECLARE not_found INT;
DECLARE clcursor CURSOR FOR 
SELECT res_offers_lname, COUNT(res_offers_lname) FROM reservation_offers WHERE res_offers_lname = client_lname;

DECLARE CONTINUE HANDLER FOR NOT FOUND
SET not_found=1;
	
SET not_found=0;
OPEN clcursor;
    REPEAT
    FETCH clcursor INTO cl_lname, counter;
    IF(not_found=0)
    THEN
	SELECT offer_id, res_offers_name, res_offers_lname FROM offers INNER JOIN reservation_offers ON offer_id = offers_res_offer_id WHERE res_offers_lname = cl_lname;
	SELECT COUNT(res_offers_lname) FROM reservation_offers WHERE res_offers_lname = cl_lname INTO counter;
	IF(counter>1)
	THEN
		SELECT counter AS 'Plithos pelatwn', offer_id FROM offers INNER JOIN reservation_offers ON offer_id = offers_res_offer_id WHERE res_offers_lname = cl_lname GROUP BY offer_id;
        LEAVE sp;
	END IF;
    END IF;
    UNTIL(not_found=1)
    END REPEAT;
CLOSE clcursor;
END $
DELIMITER ;

call find_client_info('Craig');
