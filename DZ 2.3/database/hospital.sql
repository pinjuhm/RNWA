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
					 

CREATE TABLE employee (
emp_id DECIMAL(9,0),
emp_type varchar(3) NOT NULL,
fname VARCHAR(20) NOT NULL,
minit CHAR(1),
lname VARCHAR(20),
bdate DATE,
address VARCHAR(30) NOT NULL,
sex CHAR(1),
contact_no varchar(15) NOT NULL,
relative_contact_no varchar(15),
date_of_join DATE NOT NULL,
date_of_resign DATE ,
PRIMARY KEY (emp_id)
);

					 
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


INSERT INTO employee values (1,'DOC','Ramesh','A','Patel','4/11/1968','xxx yyy zz','M',506094,724470,'11/4/2000',null);
INSERT INTO employee values (2,'DOC','Suresh','B','Upadhyay','4/19/1966','hdgd','M',737430,232422,'11/8/2000',null);
INSERT INTO employee values (3,'DOC','Jalpa','B','Asthana','1/24/1965','ttt hhh','F',428782,135343,'9/3/2000',null);
INSERT INTO employee values (4,'DOC','Jaydeep','C','Parekh','1/5/1970','hhh sjsk','M',919753,578678,'5/4/2000',null);
INSERT INTO employee values (5,'DOC','Feny','D','Gadhiya','3/25/1953','xxx yyy jjjj','F',687454,484171,'2/7/2000',null);
INSERT INTO employee values (6,'DOC','Shahbaz','K','Khan','9/1/1964','ddd ff gg','M',888869,922244,'1/8/2000',null);
INSERT INTO employee values (7,'DOC','Falguni','P ','Pathak','11/8/1962','ff shsh sh','F',623089,384222,'8/24/2001',null);
INSERT INTO employee values (8,'DOC','Raj','K','Malhotra','10/26/1958','yyy ccc xxx','M',836880,425568,'6/29/2002',null);
INSERT INTO employee values (9,'DOC','Abhishek','P','Patel','1/6/1974','fff rrr sjjs','M',696016,193778,'6/12/2000',null);
INSERT INTO employee values (10,'DOC','Bhakti','G','Dedania','4/5/1977','vvv xxx zzz','F',267510,399106,'5/18/2001',null);
INSERT INTO employee values (11,'DOC','Shanaya','J','Chaudhary','8/2/1977','sss ddd','F',310209,547446,'12/14/2000',null);
INSERT INTO employee values (12,'DOC','Kuldeep','H','Gajjar','6/19/1983','ggg','M',726341,941983,'1/11/2001',null);
INSERT INTO employee values (13,'DOC','Yash','P','Shihora','7/19/1968','ggghfhd','M',721280,166937,'9/12/2002',null);
INSERT INTO employee values (14,'DOC','Rutvik','J','Patil','1/10/1961','fff','M',323424,303785,'10/8/2002',null);
INSERT INTO employee values (15,'DOC','Yogesh','O','Modi','3/23/1969','hrewks','M',894026,631161,'3/16/2003',null);
INSERT INTO employee values (16,'DOC','Neeta','P','Singh','7/13/1963','jkers','F',436637,60492,'11/25/2001','3/14/2010');
INSERT INTO employee values (17,'DOC','Tarang','J','Pathak','8/28/1962','rrr eee www','M',603352,769737,'8/6/2000',null);
INSERT INTO employee values (18,'DOC','Harish','P','Chandra','4/27/1974','uuu yyy','M',664857,679941,'7/13/2011','2/15/2018');
INSERT INTO employee values (19,'DOC','Jagruti','L','Nath','2/1/1976','hhh','F',680042,866261,'1/28/2018',null);
INSERT INTO employee values (20,'DOC','Payal','J','Tanna','6/13/1980','ddd rrr eee','F',55669,588818,'11/6/2016',null);
INSERT INTO employee values (21,'DOC','Shailesh','P','Jadeja','4/20/1976','aa ddgjss','M',604624,251582,'2/24/2009',null);
INSERT INTO employee values (22,'DOC','Harish','P','Chandra','2/5/1984','q234jfh jdh','M',17508,1007833,'5/12/2011',null);
INSERT INTO employee values (23,'DOC','Shyam','K','Jadeja','10/5/1973','xlpc3r4x1l19jn7snu','M',104604,144129,'5/3/2013',null);
INSERT INTO employee values (24,'DOC','Ram','J','Jadwani','9/13/1963','ui6thqho74iypf8ytt','M',538123,500829,'3/24/2016',null);
INSERT INTO employee values (25,'DOC','Sheila','T','Yadav','12/11/1977','24iosvtaos5siu8vfp','F',194268,182465,'11/7/2013',null);
INSERT INTO employee values (26,'DOC','Rahul','B','Khurana','9/23/1982','ts4048amt7kg653nk4','M',315619,331362,'3/1/2015',null);
INSERT INTO employee values (27,'DOC','Jasmine','H','Kundani','4/11/1968','zhdaukj7z2fzq5hq88','F',750669,944371,'11/4/2009','3/30/2017');
INSERT INTO employee values (28,'DOC','Kajal','B','Tiwari','3/16/1981','82uijrqfybkcmsnm19','F',100021,614616,'6/12/2018',null);
INSERT INTO employee values (29,'DOC','Nayan','K','Patel','5/24/1966','8hmmdu3um6z971xjzr','M',396174,737048,'4/10/2015',null);
INSERT INTO employee values (30,'DOC','Aarav','J','Duggal','1/6/1974','7e85sd97470aeg6fg2','M',745499,876906,'6/1/2017',null);
INSERT INTO employee values (31,'DOC','Farah','N','Khanna','9/24/1966','icl25rncksji9kc438','F',389241,229456,'4/15/2017',null);
INSERT INTO employee values (32,'DOC','Shubham','U','Pandya','1/5/1976','cu1m7rebvhrjy7fusf','M',580203,717798,'5/9/2011',null);
INSERT INTO employee values (33,'DOC','Hardik','J','Kohli','4/27/1973','2mqhbeg73fcl49zp05','M',230389,709202,'2/1/2016',null);
INSERT INTO employee values (34,'DOC','Rohit','H','Sharma','3/17/1967','6uc4a8mvkmm8l1765p','M',442536,667364,'7/12/2015',null);
INSERT INTO employee values (35,'DOC','Mohammad','K','Shami','10/13/1981','33va44htejqn0vcsev','M',786536,664815,'3/13/2017',null);
INSERT INTO employee values (36,'DOC','Shikhar','F','Dhawan','8/7/1980','0b17xqzaarmibi9wus','M',330003,221000,'7/11/2015',null);
INSERT INTO employee values (37,'DOC','Purvi','H','Gajjar','11/11/1969','n326o4jzhlt8ybp69o','F',281709,600688,'11/7/2003','5/25/2018');
INSERT INTO employee values (38,'DOC','Krina','B','Savaliya','11/27/1978','9vn5kjf84ezpci8xa2','F',302242,106471,'7/7/2018',null);
INSERT INTO employee values (39,'DOC','Geeta','T','Tanna','10/14/1970','rpzg85o16wmqczauc0','F',890535,488479,'4/1/2015',null);
INSERT INTO employee values (40,'DOC','Shivam','R','Parekh','6/6/1964','rz94tb2tx9powrop5j','M',580315,967853,'6/12/2017',null);
INSERT INTO employee values (41,'DOC','Gayatri ','D','Deshmukh','5/11/1962','4boyk9n09gxvwktnhd','F',917721,604163,'11/2/2012',null);
INSERT INTO employee values (42,'DOC','Hitarth','G','Pandya','9/27/1969','s68b8l54jr4efmncr7','M',461504,935975,'7/11/2014',null);
INSERT INTO employee values (43,'DOC','Sudesh','P','Parikh','3/8/1979','3hpw7lmn6utaq6f3nr','M',351946,40600,'8/7/2009','9/8/2017');
INSERT INTO employee values (44,'DOC','Maniklal','K','Shah','8/22/1982','gso3ljbfhkrft9bwwp','M',953173,319933,'12/11/2017',null);
INSERT INTO employee values (45,'DOC','Kuldeep','T','Gupta','3/15/1979','iiva85l3q402hi3hbo','M',759789,510331,'1/7/2012',null);
INSERT INTO employee values (46,'DOC','Harsh','P','Sharma','11/1/1963','lrhhebmrpgce1xfzmd','M',138091,854638,'11/7/2018',null);
INSERT INTO employee values (47,'DOC','Raghu','N','Sinha','6/20/1980','b5mwg07p1sidmj3nkx','M',882052,738120,'10/7/2017',null);
INSERT INTO employee values (48,'DOC','Aarushi','P','Talwar','3/15/1961','bjteu697b1j2nalfb0','F',933013,888493,'12/9/2016',null);
INSERT INTO employee values (49,'DOC','Harshil','N','Mehta','8/1/1969','ayr9dozbvyvn1iskfn','M',959017,858336,'11/8/2009',null);
INSERT INTO employee values (50,'DOC','Hariprasad','G','Singhania','8/25/1972','0i57hftcdjkwvp4cb9','M',24191,22894,'5/11/2010',null);
INSERT INTO employee values (51,'NUR','Shivani','P','Malhotra','2/2/1961','r0qk8gc455rldq2rc6','F',143389,94049,'12/11/2016',null);
INSERT INTO employee values (52,'NUR','Jhanvi','J','Joshi','2/26/1961','35z754bwr9ch9x2h69','F',248533,295111,'6/1/2018',null);
INSERT INTO employee values (53,'NUR','Kanika','N','Gupta','1/26/1965','bl1zhs7k87wgsailb0','F',806656,975846,'6/4/2018',null);
INSERT INTO employee values (54,'NUR','Leela','M','Singhania','2/1/1984','2us3r3wie6nsbraitp','F',149679,238472,'1/4/2011',null);
INSERT INTO employee values (55,'NUR','Sita','P','Chokhani','11/3/1965','idqew2gscfupinjifu','F',13865,214284,'3/2/2018',null);
INSERT INTO employee values (56,'NUR','Raghunath','P','Bharani','7/2/1963','ltgqsztgowuc74o52o','M',139460,773010,'2/1/2013',null);
INSERT INTO employee values (57,'NUR','Vikas','H','Nair','12/27/1976','tq2baj8bpwfvnvoldw','M',70873,971318,'7/10/2015',null);
INSERT INTO employee values (58,'NUR','Gamita','J','Banerjee','2/15/1978','8ljqbfu7s87ww8rt5y','F',192802,259166,'5/10/2015',null);
INSERT INTO employee values (59,'NUR','Naresh','P','Mehta','9/20/1960','263yzxzv40nhi05yi9','M',48465,664665,'2/12/2011',null);
INSERT INTO employee values (60,'NUR','Jhansi','N','Gandhi','10/27/1974','4d26edwlbwt5tqobgt','F',414437,390357,'7/29/2018',null);
INSERT INTO employee values (61,'NUR','Parita','B','Thakkar','2/20/1962','b6kvf0672ikbbwms0s','F',751962,612926,'10/1/2018',null);
INSERT INTO employee values (62,'NUR','Payal','T','Panara','9/10/1968','29ezio6nvfhbzmz7rb','F',904678,132190,'10/11/2015',null);
INSERT INTO employee values (63,'NUR','Dhwani','M','Shah','12/1/1972','o38cf1wt3wpsdxwpme','F',145648,256394,'1/4/2011',null);
INSERT INTO employee values (64,'NUR','Hiral','N','Adesara','8/20/1965','t678c8y5b9cgzj6lx4','F',777613,399171,'10/12/2010',null);
INSERT INTO employee values (65,'NUR','Kinjal','A','Patel','3/16/1975','fzu0z9rrlvfuacz6fn','F',472010,292321,'6/8/2009',null);
INSERT INTO employee values (66,'NUR','Kajal','D','Singh','5/19/1984','adz0ozfjt9v3amry0p','F',44806,898614,'9/10/2016',null);
INSERT INTO employee values (67,'NUR','Rajesh','K','Lahiri','7/2/1977','5eb2bgdomol2xm4o3b','M',423412,53633,'2/26/2018',null);
INSERT INTO employee values (68,'NUR','Saif','H','Khan','3/16/1980','x42138hfwdmtpwnb0a','M',92053,693090,'6/12/2010',null);
INSERT INTO employee values (69,'NUR','Maitri','T','Manek','1/7/1974','f2j7ubxcz3ttmgy9if','F',341305,1006274,'7/2/2014',null);
INSERT INTO employee values (70,'NUR','Harshit','P','Agarwal','11/16/1972','hn2l779qzrit8g705z','M',490278,639727,'6/12/2016',null);
INSERT INTO employee values (71,'NUR','Nisha','P','Nair','6/20/1961','07z5uyzqy5tn4ug9h2','F',327102,994034,'2/5/2009',null);
INSERT INTO employee values (72,'NUR','Nidhi','J','Jha','1/17/1972','8lslkfcoqfuij3dlme','F',45246,901508,'7/8/2009',null);
INSERT INTO employee values (73,'NUR','Harsha','P','Bhogle','9/25/1960','g5ug7646yi1cnnky4w','F',618540,605594,'12/4/2003','4/15/2017');
INSERT INTO employee values (74,'NUR','DHara','N','Sagar','12/28/1963','qn6iqjdyox241fsc4p','F',882274,557551,'8/2/2013',null);
INSERT INTO employee values (75,'NUR','Jagruti','J','Pathak','4/11/1960','0wgvunbk0d71x40e52','F',877894,85090,'11/5/2001','5/16/2017');
INSERT INTO employee values (76,'NUR','Leena','H','Maher','10/11/1960','7wknpjika78uzavo1j','F',578302,167080,'11/4/2014',null);
INSERT INTO employee values (77,'NUR','Shyamlal','B','Dharokha','11/1/1969','jzqzqidj8d14ga4wio','M',246033,413168,'1/3/2000',null);
INSERT INTO employee values (78,'NUR','Sheetal','P','Chaudhary','11/1/1976','ldy7bk30go79ozlkcx','F',66646,824618,'1/9/2005',null);
INSERT INTO employee values (79,'NUR','Darshana','N','Chavda','7/27/1969','qcfiteiccbcts5h1t1','F',60246,464733,'2/10/2008',null);
INSERT INTO employee values (80,'NUR','Deepali','M','Kumar','12/24/1962','awxk6a68jyti3makfn','F',341572,253194,'4/21/2002',null);
INSERT INTO employee values (81,'NUR','Kiran','H','Patel','7/9/1963','557tcmp07fizec9mo9','M',775280,741395,'9/1/2010',null);
INSERT INTO employee values (82,'NUR','Jodha','N','Patnaik','9/26/1975','nczom20elbhm2rdw2z','F',361236,953708,'2/9/2002',null);
INSERT INTO employee values (83,'NUR','Urvashi','B','Pratap','6/4/1979','o17rnwu1sv0vd9264z','F',591782,201163,'4/6/2011',null);
INSERT INTO employee values (84,'NUR','Sejal','R','Rana','3/15/1984','xlh5yyzgp7nx20dow5','F',841498,777263,'5/8/2003',null);
INSERT INTO employee values (85,'NUR','Bhanu','P','Singh','10/8/1965','rg0m6f3qvaccl883ki','M',349952,724421,'8/2/2004',null);
INSERT INTO employee values (86,'SEC','Jaggu','P','Dewan','7/14/1967','4wr0t7me8bejxlb63v','M',329920,161768,'1/5/2007',null);
INSERT INTO employee values (87,'SEC','Babloo','P','Bhagwan','5/12/1973','0qpbc1l0asr7tqmmzk','M',769414,97977,'12/6/2002',null);
INSERT INTO employee values (88,'SEC','Shantaram','K','Kumar','1/28/1976','05fv6cz2wvrq782t8s','M',398699,592049,'8/12/2012','8/12/2018');
INSERT INTO employee values (89,'SEC','Arun','K','Lathi','7/18/1984','focqt3ulcaxo1egzi2','M',862188,612965,'1/1/2011',null);
INSERT INTO employee values (90,'SEC','Archit','P','Agarwal','4/10/1964','0objou0c5f54mcgpx6','M',467680,275521,'10/9/2009',null);
INSERT INTO employee values (91,'SEC','Deepak','N','Parekh','7/9/1964','cv8qhk5qrd6jvbi7up','M',672278,242288,'9/6/2005',null);
INSERT INTO employee values (92,'SEC','Hari','M','Purohit','6/26/1960','u2nikxrinvf8hlcvbi','M',282257,54820,'2/4/2003',null);
INSERT INTO employee values (93,'SEC','Bhagya','N','Patil','11/14/1974','8epaf1eac564t6hk8s','M',463645,709588,'4/19/2000',null);
INSERT INTO employee values (94,'SEC','Narendra','J','Baghiya','9/27/1980','u3huh8amjq7o1jz95s','M',144779,978434,'2/27/2002',null);
INSERT INTO employee values (95,'SEC','Raju','B','Bhola','9/12/1974','epduvbtkcr4sqc4qa9','M',802887,840033,'12/22/2010',null);
INSERT INTO employee values (96,'SEC','Bakul','K','Jani','11/23/1969','9epxpc2f2ads3bqd2n','M',870325,577312,'3/12/2002',null);
INSERT INTO employee values (97,'JAN','Maganlal','P','Charotra','11/19/1982','ix6f1yeh0xsiqbz1t2','M',982123,319529,'1/9/2004',null);
INSERT INTO employee values (98,'JAN','Ramlal','N','Patra','4/11/1982','640fih6aebpl4gl5uv','M',272762,657584,'11/1/2005',null);
INSERT INTO employee values (99,'JAN','Chaman','J','Sojitra','1/2/1966','epy163nic4owqf21bx','M',51758,772046,'2/9/2010',null);
INSERT INTO employee values (100,'JAN','Mohan','N','Lahiri','3/2/1961','al81vofy4eoyy2lm4o','M',81567,616033,'2/8/2013',null);
INSERT INTO employee values (101,'JAN','Shyam','P','Gohel','6/14/1971','tca07m59yzr54ckvbh','M',80692,515296,'4/12/2008',null);
INSERT INTO employee values (102,'JAN','Darshit','N','Chavda','11/23/1961','8jcgynhf8rrce75912','M',63432,402561,'3/5/2002','8/12/2018');
INSERT INTO employee values (103,'JAN','Darshan','P','Bhagvat','10/20/1973','8fwmrllp5c70utchuj','M',191913,108209,'2/3/2004',null);
INSERT INTO employee values (104,'JAN','Parth','P','Panara','3/2/1981','sj0bntk4rwa0blgyos','M',570973,424510,'2/2/2003',null);
INSERT INTO employee values (105,'JAN','Bhola','M','Raman','7/20/1984','x8szkdgt7hon423bbt','M',356237,48463,'2/12/2005',null);
INSERT INTO employee values (106,'JAN','Gagan','K','Vala','9/24/1970','v9ec9kx03lwg4w67b5','M',124981,67257,'4/11/2011',null);
INSERT INTO employee values (107,'JAN','Harsh','B','Devde','11/4/1976','8h1dsft963hle19lbz','M',388376,985490,'4/6/2001',null);
INSERT INTO employee values (108,'JAN','Pavan','G','Garg','12/21/1976','u33ibpl4r0dj4acu2z','M',1007448,742692,'10/4/2008',null);
INSERT INTO employee values (109,'JAN','Shaurya','H','Hingrajya','5/14/1968','6y2d5ksqg9lz5z4quo','M',593801,761743,'9/9/2005',null);
INSERT INTO employee values (110,'JAN','Madhav','P','Sharma','6/17/1963','zoh0e2u7yyizq4dge0','M',988302,982503,'7/30/2008',null);
INSERT INTO employee values (111,'REC','Khushboo','L','Singh','2/27/1966','o9nw8ca6aabxrq93nb','F',129937,166904,'7/11/2000',null);
INSERT INTO employee values (112,'REC','Mallika','N','Pujara','1/10/1970','1dnxgdh081inqc2s8b','F',791601,600274,'10/22/2000',null);
INSERT INTO employee values (113,'REC','Bhavna','P','Desai','6/9/1977','22a6jjws0rx7t9thz3','F',851156,303864,'9/29/2000','2/28/2018');
INSERT INTO employee values (114,'REC','Jarna','B','Gupta','7/5/1973','zqpy6345xirzcnpbt1','F',1002659,157088,'5/11/2000',null);
INSERT INTO employee values (115,'REC','Zeal','M','Vora','12/20/1983','aoxhoxs67za17l942q','F',961838,401079,'12/8/2000',null);
 
INSERT INTO employee values (116,'DOC','Vyom','G','Sagar','12/27/1963','u015iwiv4s45vfifc0','M',815409,336660,'7/27/2016',null);
INSERT INTO employee values (117,'DOC','Shweta','F','Savaliya','10/24/1984','7yq3wne418ltty6wno','F',83299,912367,'11/24/2012',null);
INSERT INTO employee values (118,'DOC','Gaurav','P','Shankar','2/6/1981','rw5t3q45torlq8mnj4','M',445259,550423,'6/12/2013',null);
INSERT INTO employee values (119,'DOC','Ayaan','D','Mehta','11/16/1973','8d7y8gszxhn9b9ter6','M',431693,904066,'4/4/2002',null);
INSERT INTO employee values (120,'DOC','Arjun','P','Shakti','1/22/1962','1cfn90ghof918ajcvt','M',975217,583578,'9/9/2000',null);
INSERT INTO employee values (121,'DOC','Vihaan','C','Parmar','5/23/1951','yhift2ofj7ty78gzrs','M',516507,139123,'10/1/2000',null);
INSERT INTO employee values (122,'DOC','Abhijit','F','Gosai','5/6/1964','ohdtc6fszyiqeqb6s9','M',343865,212497,'6/10/2011',null);
INSERT INTO employee values (123,'DOC','Dhruv','E','Padaliya','2/11/1973','vorqdbtllyvj1tnonk','M',997289,664029,'11/1/2009',null);
INSERT INTO employee values (124,'DOC','Krishna','A','Shukla','8/12/1963','cs5yqnwt1n5oy8e2pp','M',685642,455462,'12/8/2008',null);
INSERT INTO employee values (125,'DOC','Rudra','V','Shingala','12/21/1953','ovnqu5d67xhggn7vu3','M',107209,886780,'1/12/2015',null);
INSERT INTO employee values (126,'DOC','Samarth','T','Parikh','2/10/1968','sooea6ojoxo7elnwqs','M',70812,978792,'10/11/2005',null);
INSERT INTO employee values (127,'DOC','Sania','G','Gosai','10/6/1980','k50c10v3h8u8p0ki44','F',469820,525396,'6/7/2010',null);
INSERT INTO employee values (128,'DOC','Diya','A','Chotai','9/10/1963','qxed5g17v1yzxm691e','F',628501,139631,'10/7/2013',null);
INSERT INTO employee values (129,'DOC','Riya','V','Kapoor','7/21/1974','tou535e2jnlak9b8s3','F',970998,598608,'1/3/2012',null);
INSERT INTO employee values (130,'DOC','Devansh','N','Ruparelia','9/10/1954','6iy2l45gk5rj25x6ym','M',237058,420184,'10/5/2003',null);
INSERT INTO employee values (131,'DOC','Dhyey','W','Doshi','6/8/1972','fvzu1anvlqq8b6l6hy','M',407649,1004915,'8/2/2008',null);
INSERT INTO employee values (132,'DOC','Malti','Z','Ghosh','6/2/1979','3hkbe6cfbkrih0cpl6','F',607894,141859,'2/6/2012',null);
INSERT INTO employee values (133,'DOC','Jasbir','J','Das','3/3/1956','krkpwyd1nlcc0iwv40','M',704311,408489,'3/8/2013',null);
INSERT INTO employee values (134,'DOC','Gia','S','Joshi','10/5/1979','rfofiecqoisd2mdxeu','F',826309,722631,'5/11/2000','6/7/2018');
INSERT INTO employee values (135,'DOC','Hardik','L','Dasgupta','2/15/1963','xdtnf3fg5qc6gphqv3','M',343702,865757,'12/1/2006',null);
INSERT INTO employee values (136,'DOC','Bharat','E','Nathwani','5/9/1976','kwln4x4e91l8gr4izk','M',279368,409201,'9/5/2016',null);
INSERT INTO employee values (137,'DOC','Sarla','D','Bachchan','5/24/1981','jmfphbqhv6wsrreii2','F',214845,453047,'4/6/2015',null);
INSERT INTO employee values (138,'DOC','Sheetal','F','Kasauli','4/27/1954','0yml1godsliznmrqh8','F',199456,487595,'7/9/2016',null);
INSERT INTO employee values (139,'DOC','Roshan','L','Singh','2/12/1951','pfsmelmwgcd3jz4h33','M',94162,48409,'12/8/2001',null);
INSERT INTO employee values (140,'DOC','Raghubur','F','Patel','7/27/1950','1qpim99usvec3v2vd2','M',671280,55807,'2/1/2004','8/10/2017');
INSERT INTO employee values (141,'DOC','Foram','D','Nathani','10/7/1981','iu95jtfqyi69ukjaln','F',83781,986907,'7/4/2009',null);
INSERT INTO employee values (142,'DOC','Karan','T','Sanghvi','10/22/1973','6ua6sunaabnba11n1y','M',291985,197083,'2/11/2007',null);
INSERT INTO employee values (143,'DOC','Hitesh','J','Saxena','12/22/1972','yc1pvhx8po2ajj4apu','M',596626,190098,'2/10/2012',null);
INSERT INTO employee values (144,'DOC','Siddharth','P','Shastri','4/9/1979','zyftrncczmn7kyxkr0','M',778051,76115,'9/5/2012',null);
INSERT INTO employee values (145,'DOC','Bhargav','M','Soni','8/6/1961','sakr4nrppqd8ykbxhd','M',889247,947575,'6/5/2009',null);
INSERT INTO employee values (146,'DOC','Mohammad','U','Hussein','2/11/1980','1f3yty4xmcjseohp5h','M',51895,140095,'11/7/2010',null);
INSERT INTO employee values (147,'DOC','Fatima','O','Jalwani','4/17/1963','dld2np2tfn1b1p3ge6','F',807646,58255,'7/10/2005',null);
INSERT INTO employee values (148,'DOC','Pankti','O','Dholakia','4/13/1979','jwxbhropv8z6tp61if','F',582039,886529,'3/1/2008',null);
INSERT INTO employee values (149,'DOC','Abhishek','R','Banerjee','11/11/1980','ij60b937wbuuny7k45','M',694816,188012,'11/7/2016',null);
INSERT INTO employee values (150,'DOC','Dhairya','O','Shah','7/20/1964','2ddgx40o7qp5xyouoo','M',626342,444692,'2/10/2001',null);
INSERT INTO employee values (151,'DOC','Sujaan','I','Chatterjee','12/18/1972','ci53upyponzcg07me6','M',459519,176463,'1/1/2007',null);
INSERT INTO employee values (152,'DOC','Omkar','G','Bhanushali','6/17/1951','djkogu04kqvtxnaynn','M',472507,137710,'7/5/2005',null);
INSERT INTO employee values (153,'DOC','Inder','H','Vala','8/17/1981','94y2y7g3elrhp5ftlg','M',409223,750343,'1/2/2000',null);
INSERT INTO employee values (154,'DOC','Harin','C','Popat','3/4/1977','eoj2ur2k0zblh42th7','M',641410,961182,'4/7/2005',null);
INSERT INTO employee values (155,'DOC','Charmi','G','Ramanuj','5/13/1954','wz81hkal6nknp7uar3','F',87183,455581,'1/11/2013',null);
INSERT INTO employee values (156,'DOC','Gauri','F','Modi','3/9/1977','lm21ujywoil5wt8t9v','F',988036,789862,'9/11/2007',null);
INSERT INTO employee values (157,'DOC','Faiz','L','Khan','1/13/1978','ez2u78l23w31yaplvh','M',579301,726626,'1/7/2015',null);
INSERT INTO employee values (158,'DOC','Laksh','E','Nath','10/20/1968','bdzzewq1gyztsql7hy','M',564275,313579,'2/10/2008','3/5/2018');
INSERT INTO employee values (159,'DOC','Parth','P','Sharma','4/16/1963','ojgmu5f4w5s9mxdrt2','M',921135,759783,'12/8/2008',null);
INSERT INTO employee values (160,'DOC','Pankil','Y','Tanna','4/18/1957','q2kbwi3mzwva9d7aii','M',337454,606382,'12/1/2002',null);
 
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
  
