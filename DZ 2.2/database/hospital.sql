drop database hospital_managment;
create database hospital_managment;
\c hospital_managment
create table doctor (doctor_id varchar(5),
                     fname varchar(20),
					 lname varchar(20),
					 gender varchar(6),
					 address varchar(40), 
					 nationality varchar(15),
                     qualification varchar(20),
					 date_of_joining varchar(15),
					 sepialization varchar(25), 
					 NIC_no integer not null,
					 dtype varchar(20) not null,
					 primary key(doctor_id));

create table ward(w_id varchar(5),
					 wtype varchar(10) not null,
					 gender varchar(5),
					 total_no_of_beds integer,
					 no_of_available integer,
					 primary key(w_id));
					 

					 
create table medicalstore( 
                     medicine_name varchar(20) primary key,
                     total_quantity integer,
					 consumed_medicines integer,
					 available_quantity integer,
					 date_of_acquiring varchar(15),
					 medicine_price integer);

create table receptionist( rec_id varchar(5) primary key,
                     r_password varchar(15),
                     fname varchar(20),
					 lname varchar(20),
					 gender varchar(5),
					 address varchar(40),
					 nationality varchar(15),
					 qualification varchar(15) not null
					 );

create table system_administrator( admin_id varchar(5) primary key,
                     a_password varchar(15),
                     fname varchar(20),
					 lname varchar(20),
					 gender varchar(5),
					 address varchar(40));

create table laboratory( lt_id varchar(5),
                     l_password varchar(15), 
                     test_name varchar(15),
                     test_description varchar(30),
					 primary key (lt_id));

	
					 
create table Inpatient(patient_id varchar(5),
                     fname varchar(20),
					 lname varchar(20),
					 gender varchar(5),
					 date_of_birth varchar(15),
					 height integer,
					 weight integer,
					 test_report varchar(30),
                     ptype varchar(15),
					 rec_id varchar(5),
					 w_id varchar(5),
					 lt_id varchar(5),
					 medicine_name varchar(20),
					 date_of_joining varchar(18),
					 date_of_discharge varchar(18),
                     primary key(patient_id),
					 foreign key(rec_id) references receptionist,
					 foreign key(w_id) references ward,
					 foreign key(lt_id) references laboratory,
					 foreign key(medicine_name) references medicalstore 
					 on delete cascade);
					 
create table Outpatient(patient_id varchar(5),
                     fname varchar(20),
					 lname varchar(20),
					 gender varchar(5),
					 date_of_birth varchar(15),
					 height integer,
					 weight integer,
					 test_report varchar(30),
                     ptype varchar(15),
					 rec_id varchar(5),
					 lt_id varchar(5),
					 medicine_name varchar(20),
                     primary key(patient_id),
					 foreign key(rec_id) references receptionist,
					 foreign key(lt_id) references laboratory,
					 foreign key(medicine_name) references medicalstore 
					 on delete cascade);
					 
					 
create table user_table( user_id varchar(5) primary key,
                     u_password varchar(8),
					 fname varchar(20),
					 lname varchar(20),
					 gender varchar(5),
					 phone_no integer,
					 foreign key(user_id)references Inpatient on delete cascade);
					 
create table appointment_schedule( appointment_date varchar(15),
                     appointment_time varchar(6),
                     doctor_id varchar(5),
					 patient_id varchar(5),
					 foreign key(patient_id) references Inpatient ,
				     primary key(doctor_id));
					 
create table examine(doctor_id varchar(5),
                     patient_id varchar(5),
					 prescription varchar(30),
					 foreign key(doctor_id)references doctor,
					 foreign key(patient_id) references Inpatient 
					 on delete cascade);
					 


					 
create table provides_info(lt_id varchar(5),
                     medicine_name varchar(20),
					 rec_id varchar(5),
					 no_of_patients integer,
					 no_of_test_done integer,
					 medicine_req integer,
					 test_charge integer,
					 foreign key(lt_id)references laboratory,
					 foreign key(medicine_name)references medicalstore,
					 foreign key(rec_id)references receptionist
					 on delete cascade);
					 
create table is_a(rec_id varchar(5),
                     medicine_name varchar(20),
					 lt_id varchar(5),
					 lab_assistant varchar(15) not null,
					 store_keeper varchar(15),
					 foreign key(lt_id)references laboratory,
					 foreign key(medicine_name)references medicalstore,
					 foreign key(rec_id) references receptionist
					 on delete cascade);
					 
create table acess(w_id varchar(5),
                     rec_id varchar(5),
					 foreign key(w_id)references ward,
					 foreign key(rec_id) references receptionist
					 on delete cascade);
					 
create table patient_ttype(patient_id varchar(5),
                          patient_type varchar(15) not null,
						  foreign key(patient_id) references Inpatient
						  on delete cascade);

insert into receptionist values('R001','kumar123','Sai','Kumar','M','RR nagar','Indian','BBA');
insert into receptionist values('R002','roopa123','Roopa','Ravi','F','JP nagar','Indian','BBM');
insert into receptionist values('R003','srujana123','Srujana','MR','F','Jaynagar','Indian','Diploma');
insert into receptionist values('R004','tejas123','Tejas','HK','M','Sudhamanagar','Indian','B.com');
insert into receptionist values('R005','anand123','Anand','Patil','M','Hanumanth nagar','Indian','B.com');
insert into receptionist values('R006','mohith123','Mohith','Kohli','M','MG road','Indian','BBM');
insert into receptionist values('R007','shreyas123','Shreyas','KT','M','PK nagar','Indian','Diploma');
insert into receptionist values('R008','bhaskar123','Bhaskar','D','M','Tilak nagar','Indian','BBM');
insert into receptionist values('R009','dev123','Dev','Raj','M','JP nagar','Indian','BBA');
insert into receptionist values('R010','dharma123','Dharam','Teja','M','Rajajinagar','Indian','BBM');
insert into receptionist values('R011','manju123','manju','Kumar','M','RR nagar','Indian','BBA');
insert into receptionist values('R012','roopesh123','Roopesh','Ravi','M','JP nagar','Indian','BBM');
insert into receptionist values('R013','suraj123','Suraj','MR','M','Jaynagar','Indian','Diploma');
insert into receptionist values('R014','teja123','Teja','HK','M','Sudhamanagar','Indian','B.com');
insert into receptionist values('R015','ananda123','Anandan','Patil','M','Hanumanth nagar','Indian','B.com');
insert into receptionist values('R016','mahi123','Mahi','Kohli','M','MG road','Indian','BBM');
insert into receptionist values('R017','shrey123','Shrey','KT','M','PK nagar','Indian','Diploma');
insert into receptionist values('R018','bhasava123','Bhasava','D','M','Tilak nagar','Indian','BBM');
insert into receptionist values('R019','devanand123','Dev','Raj','M','JP nagar','Indian','BBA');
insert into receptionist values('R020','dharmesh123','Dharamesh','Teja','M','Rajajinagar','Indian','BBM');


insert into medicalstore values('Paracetomol', 500, 140, 360, '12.12.2017', 160);
insert into medicalstore values('Accolate', 500, 200, 300, '23.04.2017', 10);
insert into medicalstore values('Acitretin', 600, 200, 400, '06.02.2018', 6);
insert into medicalstore values('Ketoconazole', 1000, 600, 400, '12.01.2018', 143);
insert into medicalstore values('Loperamide', 2000, 1000, 1000, '24.12.2017', 8);
insert into medicalstore values('Metronidazole', 500, 140, 360, '16.02.2018', 48);
insert into medicalstore values('Codeine', 500, 150, 350, '28.12.2017', 210);
insert into medicalstore values('Promethazine', 1500, 500, 1000, '12.12.2017', 13);
insert into medicalstore values('Doxylamine', 500, 500, 450, '18.12.2017', 12);
insert into medicalstore values('Ibuprofen', 5000, 1500, 3500, '12.12.2017', 45);
insert into medicalstore values('Diclofinac', 500, 140, 360, '12.12.2017', 160);
insert into medicalstore values('calamine lotion', 500, 200, 300, '23.04.2017', 10);
insert into medicalstore values('chlorohexidine', 600, 200, 400, '06.02.2018', 6);
insert into medicalstore values('fluconazole', 1000, 600, 400, '12.01.2018', 143);
insert into medicalstore values('ketoconazole', 2000, 1000, 1000, '24.12.2017', 8);
insert into medicalstore values('povidone', 500, 140, 360, '16.02.2018', 48);
insert into medicalstore values('Codenal', 500, 150, 350, '28.12.2017', 210);
insert into medicalstore values('povone', 1500, 500, 1000, '12.12.2017', 13);
insert into medicalstore values('Doxylu', 500, 500, 450, '18.12.2017', 12);
insert into medicalstore values('Ibupro', 5000, 1500, 3500, '12.12.2017', 45);



insert into system_administrator values('A001','ravi123','Ravi','Raj','M','RR nagar');
insert into system_administrator values('A002','manjula123','Manjula','Madhu','F','JP nagar');
insert into system_administrator values('A003','jyothi123','Jyothi','Puru','F','KR nagar');
insert into system_administrator values('A004','jeevan123','Jeevan','Ramesh','M','Jaynagar');
insert into system_administrator values('A005','govind123','Govind','Raj','M','Jaynagar');
insert into system_administrator values('A006','venkatesh123','Venkatesh','R','M','Rajajinagar');
insert into system_administrator values('A007','dhruv123','Dhruv','Sehgal','M','Vijaynagar');
insert into system_administrator values('A008','bhrama123','Bhrama','Devi','F','Deepak nagar');
insert into system_administrator values('A009','mohan123','Mohan','Karan','M','Ilyasnagar');
insert into system_administrator values('A010','rama123','Rama','Raghav','F','JP nagar');


Insert into doctor values('0001','Dr Nagasubramanyam','s','M','WhiteField','INDIAN','MBBS,MS,MCH,DNB','10.11.1995','UROLOGIST','1110100234','Temporary');
Insert into doctor values('0002','Dr Nikhil','CV','M','Girinagar','INDIAN','MBBS,MS,MCH,DNB','10.11.1995','UROLOGIST','1110100234','Permanent');
Insert into doctor values('0003','Dr Chaitanya','K','F','Padmanabhnagar','INDIAN','MBBS,MS,MCH,DNB','10.11.1995','UROLOGIST','1110100234','Temporary');
Insert into doctor values('0004','Dr Yashoda','T','F','Koramangala','INDIAN','MBBS,MD-Pediatrics','1.11.2003','Pediatrician','1256478293','Temporary');
Insert into doctor values('0005','Dr Chandra','J','M','JP nagar','INDIAN','MBBS,MS,MCH','10.01.2003','Neurosurgeon','1110100234','Permanent');
Insert into doctor values('0006','Dr Thejaswini','R','F','BTM','INDIAN','BDS,MDS-Periodontist','10.05.1990','Dentist','1115388276','Permanent');
Insert into doctor values('0007','Dr Mohith','S','M','Jaynagar','INDIAN','MBBS,DPM,MD','1.05.2010','Pschychiatrist','1342567835','Permanent');
Insert into doctor values('0008','Dr Charan','L','M','Electronic city','INDIAN','MBBS,DNB,DDVL','11.06.2000','Dermatologist','1117281987','Permanent');
Insert into doctor values('0009','Dr Ullas','P','M','Mahadevpura','INDIAN','MBBS,MS,FICS,MASGE','15.07.1988','Gastroenterologist','1117765432','Permanent');
Insert into doctor values('0010','Dr Shreya','N','F','Vijaynagar','INDIAN','MBBS,MS,MCH,DNB','10.11.1995','Urologist','1116543765','');


insert into laboratory values('lt001','lab123','PTT','Partial Thromboplastin Time');
insert into laboratory values('lt002','lab123','HCG','HUMAN CHORIONIC GONADOTROPIN');
insert into laboratory values('lt003','lab123','Blood Pressure');
insert into laboratory values('lt004','lab123','CBC','Complete Blood Count');
insert into laboratory values('lt005','lab123','CPK','Creatine Phosphokinase');
insert into laboratory values('lt006','lab123','BUN','Blood Urea Nitrogen');
insert into laboratory values('lt007','lab123','UA','urinalysis');
insert into laboratory values('lt008','lab123','X-RAY','Xray');
insert into laboratory values('lt009','lab123','Widal Test','Typhoid');
insert into laboratory values('lt010','lab123','ECG','Electrocardiogram');

insert into ward values('W001','General','M',18,8);
insert into ward values('W002','General','F',20,15);
insert into ward values('W003','General','F',10,4);
insert into ward values('W005','ICU',NULL,10,5);
insert into ward values('W004','General','M',15,4);
insert into ward values('W006','ICU',NULL,15,9);
insert into ward values('W007','ICU',NULL,6,2);
insert into ward values('W008','General',NULL,15,9);

INSERT INTO Inpatient VALUES('P001','Naga','Reddy','M','12.02.1990',6,'78','Normal','Inpatient','R002','W005','lt010','Ketoconazole','14.03.2018','17.03.2018');
INSERT INTO Inpatient VALUES('P002','Manasa','shekhar','F','22.10.1993',5.3,'80','pregnant','Inpatient','R001','W003','lt004','Accolate','27.02.2018','10.03.2018');
INSERT INTO Inpatient VALUES('P003','Nagaraj','Humble','M','17.11.1989',5.6,'66','Diabetics','Inpatient','R005','W006','lt006','Acitretin','01.03.2018','09.03.2018');
INSERT INTO Inpatient VALUES('P004','Ajoy','Shenoy','M','19.07.1992',5.8,'65','Teeth Cavity','Inpatient','R004','W007','lt003','Metronidazole','11.03.2018','24.03.2018');
INSERT INTO Inpatient VALUES('P005','Ganesh','Charan','M','1.05.1994',5.4,'70','Infection','Outpatient','R008','W008','lt001','Ibuprofen','25.03.2018','01.04.2018');
INSERT INTO Inpatient VALUES('P006','Anitha','hassandria','F','12.02.1990',5.4,'78','cardio arrest','Outpatient','R007',NULL,'lt010','Doxylamine','17.03.2018','05.04.2018');
INSERT INTO Inpatient VALUES('P007','Mohith','ER','M','10.12.1998',6.1,'80','HighFever','Outpatient','R003',NULL,'lt005','Promethazine','12.01.2018','27.02.2018');
INSERT INTO Inpatient VALUES('P008','Basavamma','yadav','F','19.12.1994',5.2,'58','neuroproblem','Inpatient','R006','W002','lt008','Codeine','14.03.2018','15.03.2018');
INSERT INTO Inpatient VALUES('P009','Raja','Gowda','M','26.02.1980',5.4,'69','urinInfection','Inpatient','R009','W001','lt007','Doxylamine','04.03.2018','19.03.2018');
INSERT INTO Inpatient VALUES('P010','Mahesh','shetty','M','22.12.1984',5.5,'78','Typhoid','Inpatient','R010',NULL,'lt009','Loperamide','04.03.2018','17.03.2018');

INSERT INTO Outpatient VALUES('P001','Naga','Reddy','M','12.02.1990',6,'78','Normal','Inpatient','R002','lt010','Ketoconazole');
INSERT INTO Outpatient VALUES('P002','Manasa','shekhar','F','22.10.1993',5.3,'80','pregnant','Inpatient','R001','lt004','Accolate');
INSERT INTO Outpatient VALUES('P003','Nagaraj','Humble','M','17.11.1989',5.6,'66','Diabetics','Inpatient','R005','lt006','Acitretin');
INSERT INTO Outpatient VALUES('P004','Ajoy','Shenoy','M','19.07.1992',5.8,'65','Teeth Cavity','Inpatient','R004','lt003','Metronidazole');
INSERT INTO Outpatient VALUES('P005','Ganesh','Charan','M','1.05.1994',5.4,'70','Infection','Outpatient','R008','lt001','Ibuprofen');
INSERT INTO Outpatient VALUES('P006','Anitha','hassandria','F','12.02.1990',5.4,'78','cardio arrest','Outpatient','R007','lt010','Doxylamine');
INSERT INTO Outpatient VALUES('P007','Mohith','ER','M','10.12.1998',6.1,'80','HighFever','Outpatient','R003','lt005','Promethazine');
INSERT INTO Outpatient VALUES('P008','Basavamma','yadav','F','19.12.1994',5.2,'58','neuroproblem','Inpatient','R006','lt008','Codeine');
INSERT INTO Outpatient VALUES('P009','Raja','Gowda','M','26.02.1980',5.4,'69','urinInfection','Inpatient','R009','lt007','Doxylamine');
INSERT INTO Outpatient VALUES('P010','Mahesh','shetty','M','22.12.1984',5.5,'78','Typhoid','Inpatient','R010','lt009','Loperamide');
					 
insert into appointment_schedule values('10.08.2017','10:00','0001','P001');
insert into appointment_schedule values('25.05.2017','11:00','0004','P002');
insert into appointment_schedule values('06.07.2017','12:00','0006','P006');
insert into appointment_schedule values('23.11.2017','10:00','0005','P010');
insert into appointment_schedule values('10.08.2017','12:00','0002','P003');
insert into appointment_schedule values('11.04.2017','10:00','0008','P005');
insert into appointment_schedule values('20.01.2017','16:00','0003','P004');
insert into appointment_schedule values('21.02.2017','14:00','0007','P007');
insert into appointment_schedule values('25.05.2017','13:30','0010','P008');
insert into appointment_schedule values('10.08.2017','15:00','0009','P009');
					 
insert into is_a values('R001','Ibuprofen','lt010','Yashas','Pradeep');
insert into is_a values('R003','Paracetomol','lt003','Rama','Shree');
insert into is_a values('R004','Doxylamine','lt006','Soma','Nidhi');
insert into is_a values('R002','Codeine','lt010','Keerthi','Shwetha');
insert into is_a values('R010','Doxylamine','lt003','Sindu','Siri');
insert into is_a values('R005','Loperamide','lt001','Prabhat','Sonam');
insert into is_a values('R009','Accolate','lt002','Rishab','Shruthi');
insert into is_a values('R006','Acitretin','lt004','Jainar','Karan');
insert into is_a values('R007','Ibuprofen','lt008','Karthi','Kishore');
insert into is_a values('R008','Metronidazole','lt009','Tanu','Shravan');

insert into user_table values('P001','abc123','Divya','konidala','F','123');
insert into user_table values('P002','ccc123','Uma','kadala','F', '134' );
insert into user_table values('P003','num123','Usha','chancharla','F','156');
insert into user_table values('P004','ert153','Thanu','Dibbia','F','167');
insert into user_table values('P005','123ad3','satya','konidala','M','178');
insert into user_table values('P006','asd876','Prabu','Junnu','M','198');
insert into user_table values('P007','kird76','Raj','Prabhu','M','175');
insert into user_table values('P008','mihaj87','Keerthi','honidala','F','189');
insert into user_table values('P009','nicjn23','Anu','Gonna','F','167');
insert into user_table values('P010','abc@123','Avinash','konidala','M','176');


insert into provides_info values('lt010','Paracetomol', 'R002','10','40','200');
insert into provides_info values('lt010','Ibuprofen', 'R008','20','40','500');
insert into provides_info values('lt004','Doxylamine', 'R005','5','40','300');
insert into provides_info values('lt007','Ibuprofen', 'R004','30','70','1000');
insert into provides_info values('lt009','Accolate', 'R010','10','40','400');
insert into provides_info values('lt002','Metronidazole', 'R007','10','20','600');
insert into provides_info values('lt003','Loperamide', 'R006','10','40','200');
insert into provides_info values('lt003','Promethazine', 'R009','5','40','700');
insert into provides_info values('lt009','Doxylamine', 'R008','10','40','200');
insert into provides_info values('lt003','Acitretin', 'R003','50','40','800');

insert into acess values('W001','R010');
insert into acess values('W001','R009');
insert into acess values('W001','R003');
insert into acess values('W001','R004');
insert into acess values('W004','R008');
insert into acess values('W004','R005');
insert into acess values('W004','R002');
insert into acess values('W002','R001');
insert into acess values('W002','R007');
insert into acess values('W003','R006');

insert into patient_ttype values('P001','cancer');
insert into patient_ttype values('P002','anemia');
insert into patient_ttype values('P003','anemiamia');
insert into patient_ttype values('P003','dialysis');
insert into patient_ttype values('P004','blood cancer');
insert into patient_ttype values('P004','nerve weekness');
insert into patient_ttype values('P005','leg_knee pains');
insert into patient_ttype values('P005','heart');
insert into patient_ttype values('P006','lung cancer');
insert into patient_ttype values('P007','preg compli');
insert into patient_ttype values('P007','anemia');
insert into patient_ttype values('P008','sugar');
insert into patient_ttype values('P008','asthama');
insert into patient_ttype values('P008','skin diseases');
insert into patient_ttype values('P009','migrane');
insert into patient_ttype values('P009','thyroid patient');
insert into patient_ttype values('P009','eye infections');
insert into patient_ttype values('P010','teeth infect');
insert into patient_ttype values('P010','ear infect');
insert into patient_ttype values('P010','asthama');


insert into examine values('0010','P009','Doxylamine,drink lot of water');
insert into examine values('0001','P002','Accolate,drink lot of water');
insert into examine values('0002','P003','Acitretin,drink lot of water');
insert into examine values('0006','P004','Metronidazole');
insert into examine values('0008','P005','Ibuprofen,drink lot of water');
insert into examine values('0003','P006','Doxylamine,drink lot of water');
insert into examine values('0002','P007','Promethazine,syrup ');
insert into examine values('0005','P008','Codeine,drink lot of water');
insert into examine values('0004','P010','Doxylamine,drink lot of water');
insert into examine values('0002','P001','Ketoconazole,drink water');

select * from doctor;
select * from patient;
select * from receptionist;
select * from ward;
select * from examine;
select * from provides_info;
select * from patient_ttype;
select * from appointment_schedule;
select * from acess;
select * from user_table;
select * from is_a;
select * from laboratory;
select * from system_administrator;
select * from medicalstore;
  