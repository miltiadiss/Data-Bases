CREATE DATABASE travel_agency;
USE travel_agency;

  CREATE TABLE branch(
     br_code INT(11) NOT NULL AUTO_INCREMENT,
     br_street VARCHAR(30) NOT NULL DEFAULT 'unknown',
     br_num INT(4) NOT NULL DEFAULT '0',
     br_city VARCHAR(30) DEFAULT 'unknown' NOT NULL,
     PRIMARY KEY(br_code)
     )engine=InnoDB;
     
  CREATE TABLE phones(
      ph_br_code INT(11) NOT NULL,
      ph_number CHAR(10) NOT NULL DEFAULT 'unknown',
      PRIMARY KEY(ph_br_code, ph_number),
      CONSTRAINT PHONECODE FOREIGN KEY (ph_br_code) REFERENCES branch(br_code) 
      ON UPDATE CASCADE ON DELETE CASCADE
      )engine=InnoDB;
         
 CREATE TABLE worker(
      wrk_AT CHAR(10) DEFAULT 'unknown' NOT NULL,
      wrk_name VARCHAR(20) DEFAULT 'unknown' NOT NULL,
      wrk_lname VARCHAR(20) DEFAULT 'unknown' NOT NULL,
      wrk_salary FLOAT(7,2) NOT NULL, 
      wrk_br_code INT(11) NOT NULL,
      PRIMARY KEY (wrk_AT),
      CONSTRAINT BRAWORKER FOREIGN KEY (wrk_br_code) REFERENCES branch(br_code)
      ON UPDATE CASCADE ON DELETE CASCADE
      )engine=InnoDB;
  
 CREATE TABLE guide(
      gui_AT CHAR(10) NOT NULL,
      gui_cv TEXT,
      PRIMARY KEY(gui_AT),
      CONSTRAINT GUIDEAT FOREIGN KEY (gui_AT) REFERENCES worker(wrk_AT) 
      ON UPDATE CASCADE ON DELETE CASCADE
      )engine=InnoDB;
           
 CREATE TABLE driver(
      drv_AT CHAR(10) NOT NULL, 
      drv_license ENUM('A','B','C','D') NOT NULL,
      drv_route ENUM('LOCAL','ABROAD') NOT NULL,
      drv_experience TINYINT(4) DEFAULT '0' NOT NULL,
      PRIMARY KEY (drv_AT),
      CONSTRAINT WORDRIVER FOREIGN KEY (drv_AT) REFERENCES worker(wrk_AT)
      ON UPDATE CASCADE ON DELETE CASCADE
      )engine=InnoDB;
  
  CREATE TABLE trip(
      tr_id INT(11) NOT NULL auto_increment,
      tr_departure DATETIME NOT NULL,
      tr_return DATETIME NOT NULL,
      tr_maxseats tinyint(4) not null default '0',
      tr_cost float(7,2) not null default '0',
      tr_br_code int(11) NOT NULL default '0',
      tr_gui_AT CHAR(10) NOT NULL DEFAULT '0',
      tr_drv_AT char(10) not null default '0',
      PRIMARY KEY (tr_id),
      CONSTRAINT brcode FOREIGN KEY (tr_br_code) REFERENCES branch(br_code) 
      ON UPDATE CASCADE ON DELETE CASCADE,
      CONSTRAINT drvat FOREIGN KEY (tr_drv_AT) REFERENCES driver(drv_AT) 
      ON UPDATE CASCADE ON DELETE CASCADE,
      CONSTRAINT guideaAT FOREIGN KEY (tr_gui_AT) REFERENCES guide(gui_AT) 
      ON UPDATE CASCADE ON DELETE CASCADE
      )engine=InnoDB;
  
  CREATE TABLE event(
      ev_tr_id INT(11) NOT NULL,
      ev_start DATETIME NOT NULL,
      ev_end DATETIME NOT NULL,
      ev_descr TEXT,
      PRIMARY KEY(ev_tr_id,ev_start),
      CONSTRAINT EVENTID FOREIGN KEY (ev_tr_id) REFERENCES trip(tr_id) 
      ON UPDATE CASCADE ON DELETE CASCADE
      )engine=InnoDB;
      
  CREATE TABLE admin(
      adm_AT CHAR(10) NOT NULL,
      adm_type ENUM('LOGISTICS','ADMINISTRATIVE','ACCOUNTING') NOT NULL,
      adm_diploma VARCHAR(200) NOT NULL DEFAULT 'unknown',
      PRIMARY KEY(adm_AT),
      CONSTRAINT ADMINAT FOREIGN KEY (adm_AT) REFERENCES worker(wrk_AT) 
      ON UPDATE CASCADE ON DELETE CASCADE
      )engine=InnoDB;
      
  CREATE TABLE manages(
      mng_adm_AT CHAR(10) NOT NULL,
      mng_br_code INT(11) NOT NULL,
      PRIMARY KEY(mng_adm_AT,mng_br_code),
      CONSTRAINT MNGAT FOREIGN KEY (mng_adm_AT) REFERENCES admin(adm_AT) 
      ON UPDATE CASCADE ON DELETE CASCADE,
      CONSTRAINT MNGCODE FOREIGN KEY (mng_br_code) REFERENCES branch(br_code) 
      ON UPDATE CASCADE ON DELETE CASCADE
      )engine=InnoDB;
      
  CREATE TABLE destination(
       dst_id INT(11) NOT NULL AUTO_INCREMENT, 
       dst_name VARCHAR(50) NOT NULL DEFAULT 'unknown',
       dst_descr TEXT,
       dst_rtype ENUM('LOCAL','ABROAD'),
       dst_language VARCHAR(30) NOT NULL DEFAULT 'unknown',
       dst_location INT(11) DEFAULT '0', 
       PRIMARY KEY(dst_id),
       CONSTRAINT LOCATION FOREIGN KEY (dst_location) REFERENCES destination(dst_id) 
       ON UPDATE CASCADE ON DELETE CASCADE
       )engine=InnoDB;
  
  CREATE TABLE languages(
       lng_gui_AT CHAR(10) NOT NULL,
       lng_language VARCHAR(30) NOT NULL DEFAULT 'unknown',
       PRIMARY KEY(lng_gui_AT,lng_language),
       CONSTRAINT GUIDELANGUAGE FOREIGN KEY (lng_gui_AT) REFERENCES guide(gui_AT) 
       ON UPDATE CASCADE ON DELETE CASCADE
       )engine=InnoDB;
       
  CREATE TABLE travel_to(
       to_tr_id INT(11) NOT NULL,
       to_dst_id INT(11) NOT NULL,
       to_arrival DATETIME NOT NULL,
       to_departure DATETIME NOT NULL,
       PRIMARY KEY(to_tr_id,to_dst_id),
       CONSTRAINT TRAVEID FOREIGN KEY (to_tr_id) REFERENCES trip(tr_id) 
       ON UPDATE CASCADE ON DELETE CASCADE,
       CONSTRAINT DESTINATIONID FOREIGN KEY (to_dst_id) REFERENCES destination(dst_id) 
       ON UPDATE CASCADE ON DELETE CASCADE
       )engine=InnoDB;
      
  CREATE TABLE reservation(
       res_tr_id INT(11) NOT NULL,
       res_seatnum TINYINT(4) NOT NULL DEFAULT '0',
       res_name VARCHAR(20) NOT NULL DEFAULT 'unknown',
       res_lname VARCHAR(20) NOT NULL DEFAULT 'unknown',
       res_isadult ENUM('ADULT','MINOR'),
       PRIMARY KEY(res_tr_id, res_seatnum),
       CONSTRAINT TRIPRESERVATION FOREIGN KEY (res_tr_id) REFERENCES trip(tr_id) 
       ON UPDATE CASCADE ON DELETE CASCADE
       )engine=InnoDB;
       
       CREATE TABLE IT(
       IT_AT CHAR(10) NOT NULL, 
      IT_password varchar(10) NOT NULL DEFAULT 'password',
      IT_start_date DATE NOT NULL,
       IT_end_date DATE NOT NULL,
      PRIMARY KEY (IT_AT),
      CONSTRAINT WORKERIT FOREIGN KEY 
      (IT_AT) REFERENCES worker(wrk_AT)
      ON UPDATE CASCADE ON DELETE CASCADE
      )engine=InnoDB;

CREATE TABLE IT(
      IT_AT CHAR(10) NOT NULL, 
      IT_password varchar(10) NOT NULL DEFAULT 'password',
      IT_start_date DATE NOT NULL,
      IT_end_date DATE ,
      PRIMARY KEY (IT_AT),
      CONSTRAINT WORKERIT FOREIGN KEY 
      (IT_AT) REFERENCES worker(wrk_AT)
      ON UPDATE CASCADE ON DELETE CASCADE
      )engine=InnoDB;   
      
      insert into worker values('IT151516', 'VASILIS' ,'KARAKOSTAS', '2090.00', 2);
      insert into it values('IT151516', 'it2023', '2022-10-09', NULL);

CREATE TABLE log(
user VARCHAR(50),
action VARCHAR(10),
changes VARCHAR(200),
time timestamp
);

CREATE INDEX indexres
ON reservation_offers (res_offers_name, res_offers_lname,res_advance_payment);
