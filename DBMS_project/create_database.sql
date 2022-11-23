create database Sample_project

use Sample_project;

TABLES:
create table driver(Driver_id int auto_increment,Driver_Name varchar(30),Age int,Salary int,Address varchar(255),primary key(Driver_id));

create table vehicle(vehicle_id int auto_increment,Regestartion_number varchar(30),Type varchar(20),Capacity int,primary key(Vehicle_id));

create table user(user_id int auto_increment,First_Name varchar(15),Last_Name varchar(15),User_Type varchar(10) not null,DOB date,Address varchar(255),primary key(user_id));

create table package(package_id int auto_increment,package_name varchar(30) not null,Duration int,Prize int,primary key(package_id));

create table package_attractions(package_id int,attraction_id int,attraction_name varchar(30),primary key(package_id,attraction_id));

alter table package_attractions add foreign key(package_id) references package(package_id) on delete cascade;

create table route_info(package_id int,Source_id int,Destination_id int,Source_name varchar(30),Destination_name varchar(30),Distance int,primary key(package_id,Source_id,Destination_id));

alter table route_info add foreign key(package_id) references package(package_id) on delete cascade;
alter table route_info add foreign key(Source_id) references package_attractions(attraction_id) on delete cascade;
alter table route_info add foreign key(Destination_id) references package_attractions(attraction_id) on delete cascade;

create table ticket(Ticket_number int auto_increment,Seat_Number int not null,user_id int,package_id int,vehicle_id int,start_date date,end_date date,primary key(Ticket_number,user_id,package_id,vehicle_id));

alter table ticket add foreign key(user_id) references user(user_id);
alter table ticket add foreign key(package_id) references package(package_id);
alter table ticket add foreign key(vehicle_id) references vehicle(vehicle_id);

create table payment_info(Ticket_number int,Transaction_number varchar(30),Bank varchar(30),Card_Number varchar(30),Amount int not null,primary key(Ticket_number,Transaction_number));

alter table payment_info add foreign key(Ticket_number) references ticket(Ticket_number);

create table package_vehicle_driver(package_id int,Driver_id int,Vehicle_id int,start_date date,end_date date,primary key(package_id,Driver_id,Vehicle_id,start_date,end_date));

alter table package_vehicle_driver add foreign key(package_id) references package(package_id);
alter table package_vehicle_driver add foreign key(Driver_id) references driver(Driver_id) on delete cascade;
alter table package_vehicle_driver add foreign key(Vehicle_id) references vehicle(Vehicle_id);

create table driver_phone(Driver_id int,Phone_number int,primary key(Driver_id,Phone_number));

alter table driver_phone add foreign key(Driver_id) references driver(Driver_id) on delete cascade;

create table user_phone(user_id int,Phone_number int,primary key(user_id,Phone_number));

alter table user_phone add foreign key(user_id) references user(user_id) on delete cascade;


-- create table driver(Driver_id int auto_increment,Driver_Name varchar(30),Age int,Salary int,Address varchar(255),primary key(Driver_id));
insert into driver(Driver_Name,Age,Salary,Address) values('Ajith',21,20000,'Laggere');
insert into driver(Driver_Name,Age,Salary,Address) values('Amogh',28,30000,'RRNagar');
insert into driver(Driver_Name,Age,Salary,Address) values('Chetan',30,22000,'JPNagar');
insert into driver(Driver_Name,Age,Salary,Address) values('Chinmay',42,35000,'Banshankri');
insert into driver(Driver_Name,Age,Salary,Address) values('Alan',38,30000,'Electronic City');

-- create table vehicle(vehicle_id int auto_increment,Regestartion_number varchar(30),Type varchar(20),Capacity int,primary key(Vehicle_id));
insert into vehicle(Regestartion_number,Type,Capacity) values('KA-02-BD-0512','Delux',50);
insert into vehicle(Regestartion_number,Type,Capacity) values('KA-04-AJ-1403','Mini',25);
insert into vehicle(Regestartion_number,Type,Capacity) values('KA-02-LR-1803','Mini',25);
insert into vehicle(Regestartion_number,Type,Capacity) values('KA-06-NG-2804','Sleeper',20);

-- create table user(user_id int auto_increment,First_Name varchar(15),Last_Name varchar(15),User_Type varchar(10) not null,DOB date,Address varchar(255),primary key(user_id));
insert into user(First_Name,Last_Name,User_Type,DOB,Address) values('Nitin','Gutte','Passenger','2002-04-28','Yelahanka');
insert into user(First_Name,Last_Name,User_Type,DOB,Address) values('Likhith','Ramesh','Passenger','2002-03-18','Sunkadakatte');
insert into user(First_Name,Last_Name,User_Type,DOB,Address) values('Srujan','Shankar','Passenger','2002-09-19','Electronic City');
insert into user(First_Name,Last_Name,User_Type,DOB,Address) values('Sunil','Prakash','Passenger','2002-04-10','Electronic City');
insert into user(First_Name,Last_Name,User_Type,DOB,Address) values('Ajith','Srinath','Driver','2002-03-14','Rajeshwari Nagar');
insert into user(First_Name,Last_Name,User_Type,DOB,Address) values('Mutharaj','T R','Passenger','1991-06-23','Laggere');
insert into user(First_Name,Last_Name,User_Type,DOB,Address) values('Radhika','Raj','Passenger','2002-04-02','Laggere');
insert into user(First_Name,Last_Name,User_Type,DOB,Address) values('Rangadhamaiah','T V','Passenger','1954-08-15','Laggere');

-- create table package(package_id int auto_increment,package_name varchar(30) not null,Duration int,prize int,primary key(package_id));
insert into package(package_name,Duration,Prize) values('Karnataka-Mumbai',8,15000);
insert into package(package_name,Duration,Prize) values('Mysore-Mangaluru',4,8000);
insert into package(package_name,Duration,Prize) values('Managaluru-Kerala',6,12000);
insert into package(package_name,Duration,Prize) values('Goa-Chikmagaluru',6,12000);

-- create table package_attractions(package_id int,attraction_id int auto_increment,attraction_name varchar(30),primary key(package_id,attraction_id));
insert into package_attractions values(1,1,'Kudalasangama');
insert into package_attractions values(1,2,'Gol Gumbaz');
insert into package_attractions values(1,3,'Thuljapura');
insert into package_attractions values(1,4,'Shani Sinagapura');
insert into package_attractions values(1,5,'Shiradi');
insert into package_attractions values(1,6,'Mumbai');
insert into package_attractions values(1,7,'Pune');
insert into package_attractions values(2,8,'KRS Dam');
insert into package_attractions values(2,9,'Mysore Palace');
insert into package_attractions values(2,10,'Sriranagapatana');
insert into package_attractions values(2,11,'Shravanabelagola');
insert into package_attractions values(2,12,'Dharmasthala');
insert into package_attractions values(2,13,'Shringeri');
insert into package_attractions values(2,14,'Uddupi');
insert into package_attractions values(2,15,'Malpe Beach');
insert into package_attractions values(3,16,'Dharmasthala');
insert into package_attractions values(3,17,'Kukke Subramanya');
insert into package_attractions values(3,18,'Talakaveri');
insert into package_attractions values(3,19,'Coorg');
insert into package_attractions values(3,20,'Waynad');
insert into package_attractions values(3,21,'Kasargod');
insert into package_attractions values(3,22,'Kannur');
insert into package_attractions values(4,23,'Dhudsagar Falls');
insert into package_attractions values(4,24,'Baga Beach');
insert into package_attractions values(4,25,'Gokarna');
insert into package_attractions values(4,26,'Mulayanagiri');
insert into package_attractions values(4,27,'Kudremukh');
insert into package_attractions values(4,28,'Beluru');
insert into package_attractions values(4,29,'Halebedu');
insert into package_attractions values(4,30,'Charmady Ghat');

-- create table route_info(package_id int,Source_id int,Destination_id int,Source_name varchar(30),Destination_name varchar(30),Distance int,primary key(package_id,Source_id,Destination_id));
insert into route_info values(1,1,2,'Kudalasangama','Gol Gumbaz',92);
insert into route_info values(1,2,3,'Gol Gumbaz','Thuljapura',150);
insert into route_info values(1,3,4,'Thuljapura','Shani Singapura',280);
insert into route_info values(1,4,5,'Shani Singapura','Shiradi',80);
insert into route_info values(1,5,6,'Shiradi','Mumbai',250);
insert into route_info values(1,6,7,'Mumbai','Pune',150);
insert into route_info values(2,8,9,'KRS Dam','Mysore Palace',20);
insert into route_info values(2,9,10,'Mysore Palace','Sriranagapatana',18);
insert into route_info values(2,10,11,'Sriranagapatana','Shravanabelagola',70);
insert into route_info values(2,11,12,'Shravanabelagola','Dharmasthala',70);
insert into route_info values(2,12,13,'Dharmasthala','Shringeri',150);
insert into route_info values(2,13,14,'Shringeri','Uddupi',100);
insert into route_info values(2,14,15,'Uddupi','Malpe Beach',10);
insert into route_info values(3,16,17,'Dharmasthala','Kukke Subramanya',30);
insert into route_info values(3,17,18,'Kukke Subramanya','Talakaveri',70);
insert into route_info values(3,18,19,'Talakaveri','Coorg',80);
insert into route_info values(3,19,20,'Coorg','Waynad',120);
insert into route_info values(3,20,21,'Waynad','Kasargod',60);
insert into route_info values(3,21,22,'Kasargod','Kannur',180);
insert into route_info values(4,23,24,'Dhudsagar Falls','Baga Beach',70);
insert into route_info values(4,24,25,'Baga Beach','Gokarna',40);
insert into route_info values(4,25,26,'Gokarna','Mulayanagiri',140);
insert into route_info values(4,26,27,'Mulayanagiri','Kudremukh',80);
insert into route_info values(4,27,28,'Kudremukh','Beluru',50);
insert into route_info values(4,28,29,'Beluru','Halebedu',30);
insert into route_info values(4,29,30,'Halebedu','Charmady Ghat',40);

-- create table ticket(Ticket_number int auto_increment,Seat_Number int not null,user_id int,package_id int,vehicle_id int,start_date date,end_date date,primary key(Ticket_number,user_id,package_id,vehicle_id));
insert into ticket(Seat_Number,user_id,package_id,vehicle_id,start_date,end_date) values(1,1,4,4,'2022-10-02','2022-10-08');
insert into ticket(Seat_Number,user_id,package_id,vehicle_id,start_date,end_date) values(2,2,4,4,'2022-10-02','2022-10-08');
insert into ticket(Seat_Number,user_id,package_id,vehicle_id,start_date,end_date) values(3,3,4,4,'2022-10-02','2022-10-08');
insert into ticket(Seat_Number,user_id,package_id,vehicle_id,start_date,end_date) values(4,4,4,4,'2022-10-02','2022-10-08');
insert into ticket(Seat_Number,user_id,package_id,vehicle_id,start_date,end_date) values(5,5,4,4,'2022-10-02','2022-10-08')

-- create table payment_info(Ticket_number int,Transaction_number varchar(30),Bank varchar(30),Card_Number varchar(30),Amount int not null,primary key(Ticket_number,Transaction_number));
insert into payment_info values(1,'HDFC3847','HDFC' ,'3077845167895',12000);
insert into payment_info values(2,'ICICI2036','ICICI' ,'456128975556',12000);
insert into payment_info values(3,'HDFC4037','HDFC' ,'265147856622',12000);
insert into payment_info values(4,'UCO8465','UCO' ,'884532321454',12000);
insert into payment_info values(5,'BOB3546','BANK OF BARODA' ,'3077845167895',12000);

-- create table package_vehicle_driver(package_id int,Driver_id int,Vehicle_id int,start_date date,end_date date,primary key(package_id,Driver_id,Vehicle_id,start_date,end_date));
insert into package_vehicle_driver values(4,3,4,'2022-10-02','2022-10-08');
insert into package_vehicle_driver values(3,2,4,'2022-10-02','2022-10-08');
insert into package_vehicle_driver values(2,3,4,'2022-10-02','2022-10-08');
insert into package_vehicle_driver values(4,1,3,'2022-10-02','2022-10-08');
insert into package_vehicle_driver values(1,2,3,'2022-10-02','2022-10-08');
insert into package_vehicle_driver values(3,2,2,'2022-10-02','2022-10-08');
insert into package_vehicle_driver values(2,1,2,'2022-10-02','2022-10-08');
insert into package_vehicle_driver values(1,1,1,'2022-10-02','2022-10-08');

-- create table package_user(package_id int,user_id int,primary key(package_id,user_id)); 
-- insert into package_user(4)

-- create table driver_phone(Driver_id int,Phone_number int,primary key(Driver_id,Phone_number));
insert into driver_phone values(1,9946561254);
insert into driver_phone values(2,9021212187);
insert into driver_phone values(3,9945671219);
insert into driver_phone values(3,9945699909);
insert into driver_phone values(4,8452319875);
insert into driver_phone values(5,7483645879);

-- create table user_phone(user_id int,Phone_number int,primary key(user_id,Phone_number));
insert into user_phone values(1,9845896211);
insert into user_phone values(2,9741126352);
insert into user_phone values(3,9465286674);
insert into user_phone values(4,8046627146);
insert into user_phone values(4,9088645679);
insert into user_phone values(5,6459785321);

-------------------View Tables--------------------

create view tour_distance as select package_id,sum(Distance) as Package_distance from route_info group by(package_id);
select Vehicle_id,sum(Package_distance) as vehicle_Travelled from package_vehicle_driver p,tour_distance t where p.package_id=t.package_id group by vehicle_id;

------------------ Functions -----------------------

DELIMITER $$   
CREATE OR REPLACE FUNCTION get_capacity(v_id INT) RETURNS int   
BEGIN   
DECLARE cap int;  
SELECT Capacity INTO cap FROM vehicle WHERE vehicle_id = v_id;  
RETURN cap;  
END $$ 

DELIMITER ;

-------------------- Trigger ------------------------

DELIMITER $$ 
CREATE OR REPLACE TRIGGER Check_Seat_Number 
BEFORE INSERT ON ticket FOR EACH ROW  
BEGIN 
DECLARE cap int;
DECLARE error_msg varchar(50);
DECLARE seat int;
SET error_msg="No seat number exists";
SET cap=(select get_capacity(new.vehicle_id));
SET seat=new.Seat_Number;
IF seat>cap THEN
SIGNAL SQLSTATE'45000'
SET MESSAGE_TEXT = error_msg;
END IF; 
END ;
$$ 
DELIMITER ;

insert into ticket(Seat_Number,user_id,package_id,vehicle_id,start_date,end_date) values(21,6,3,4,'2022-10-02','2022-10-08');


