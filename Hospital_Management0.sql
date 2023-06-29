create database Hospital_Management

create table HOSPITAL(H_id int  NOT NULL primary key , H_name varchar (26) , Street_Address varchar(50) , City varchar (26));

create table EMPLOYEE(Fname varchar(26) , Mname varchar(26) , Lname varchar(26) , Employee_id int  NOT NULL primary key , Date_of_birth date , Age int , 
Gender varchar (10) , Hospital_id int foreign key references HOSPITAL (H_id)) ;

create table E_PHONE(Employee_id int foreign key references EMPLOYEE (Employee_id) , phone_number int);

create table RECEPTIONIST(floor_No int  NOT NULL primary key ,Appointment_data varchar(50))


create table NURSE(Employee_id int foreign key references EMPLOYEE (Employee_id) , Degree varchar(26) );

create table DOCTOR(Employee_id int foreign key references EMPLOYEE (Employee_id) ,major varchar(50) ,  Degree varchar(26) );

create table DEPARTMENT( Dep_number int NOT NULL primary key , Dep_name varchar(25) , officeNumber int ,
 Hos_id int foreign key references HOSPITAL (H_id) , Manage_doctorID int foreign key references EMPLOYEE (Employee_id))
 
 alter table EMPLOYEE 
add dep_No  int

alter table EMPLOYEE 
add foreign key(dep_No) references DEPARTMENT(Dep_number)

create table ROOM (Number int NOT NULL primary key , R_type varchar(25) , num_of_beds int , Floor_number int ,
D_number int foreign key references DEPARTMENT(Dep_number))


create table PATIENT(P_id int NOT NULL primary key , P_Age int , P_Gender varchar(25) , Fname varchar(25) , Mname varchar(25) , Lname varchar(25) ,
P_Status varchar(25) , Email varchar(25) , blood_group varchar(25) , Doctor_id int foreign key references  EMPLOYEE ( Employee_id ),
NumAssigend int foreign key references ROOM (Number), Receptiontist_id int foreign key references EMPLOYEE ( Employee_id ) ,
Nurse_id int foreign key references EMPLOYEE (Employee_id))

create table P_PHONE(P_id int foreign key references PATIENT(P_id) , phone_number int unique )

create table MEDICATION (Med_Name varchar(25) , price int , M_description varchar(25) , quantity int ,
patient_id int foreign key references PATIENT(P_id) , doctor_id int foreign key references EMPLOYEE ( Employee_id ))

create table MEDICAL_RECORD ( date_of_diagnosis date , medication varchar(25) , Arrival_leaving_date date ,
patient_file_number int  , disease varchar(25)  , Doctor_id int foreign key references  EMPLOYEE (Employee_id), reception_id int  foreign key references EMPLOYEE ( Employee_id ) ,
 Has_P_id int foreign key references PATIENT(P_id))




insert into HOSPITAL values(12345,'Al-Ahmadi','king fahad street,Dammam36223,Saudi Arabia','Dammam')
insert into HOSPITAL values(12769,'king Fahad','shura street,Al-khobar31952,Saudi Arabia','Khobar')
insert into HOSPITAL values(21653,'king Fahad','khali ibn Al-walid,Medina42351,Saudi Arabia','Medina')
insert into HOSPITAL values(18765,'king faisal','Shihar road,Taif26514,Saudi Arabia','Taif')


insert into EMPLOYEE values ('john','smith','adam',1256,'1999-04-19',23,'Male',12345,6)
insert into EMPLOYEE values ('david','Adam','Ali',1487,'2001-08-13',21,'Male',12769,6)
insert into EMPLOYEE values ('tony','Mohammed','lee',2143,'1997-02-11',25,'Female',21653,1)
insert into EMPLOYEE values ('Anny','jan','clark',3654,'1990-07-22',32,'Female',18765,5)
insert into EMPLOYEE values ('Saad','Fahad','Al_Ahmadi',1123,'1997-03-01',25,'Male',12345,4)
insert into EMPLOYEE values ('Omar','Saleh','Al_Harbi',1114,'2000-12-18',22,'Male',12345,3)
insert into EMPLOYEE values ('Sara','Mohammed','Al_johani',2234,'1980-01-15',42,'Female',21653,3)
insert into EMPLOYEE values ('Amal','Omar','Al_Harthi',3030,'1987-09-20',35,'Female',18765,2)
insert into EMPLOYEE values ('Saleh','Mohamed','Al_Harbi',3031,'1987-04-23',35,'Male',21653,1)
insert into EMPLOYEE values ('Mohamed','Osamah','Al_Harthi',3036,'1988-11-01',34,'Male',21653,2)
insert into EMPLOYEE values ('Fay','Mohammed','Al_johani',1223,'1980-05-10',42,'Female',18765,1)
insert into EMPLOYEE values ('Lama','turki','Al_Harbii',3667,'1987-01-25',35,'Female',12769,4)

insert into E_PHONE values(1256,0534698888)
insert into E_PHONE values(1487,0521133333)
insert into E_PHONE values(2143,0542344444)
insert into E_PHONE values(3654,0547899999)
insert into E_PHONE values(1123,0542555555)
insert into E_PHONE values(1114,0507811111)
insert into E_PHONE values(2234,0531234567)
insert into E_PHONE values(3030,0501033455)
insert into E_PHONE values(3031,0544556239)
insert into E_PHONE values(3036,0541124556)
insert into E_PHONE values(3036,0598777777)
insert into E_PHONE values(1223,0515556289)
insert into E_PHONE values(3667,0543354550)


insert into RECEPTIONIST values (2,'Ahmed Ali Al-Ahmadi,112,29,9.00.00AM')
insert into RECEPTIONIST values (1,'jana Mohamed Al-johani,113,10,8.00.00AM')
insert into RECEPTIONIST values (3,'Saad khalid Al-Ahmadi,114,32,9.00.00AM')
--insert into RECEPTIONIST values (2,'Mohamed Ali Al-Harbi,115,44,6.00.00PM')


insert into NURSE values (1123 , 'Master')
insert into NURSE values (1114 , 'Bachelor')
insert into NURSE values (2234 , 'Master')
insert into NURSE values (3030 , 'Bachelor')
insert into NURSE values (3654 , 'Bachelor')

insert into DOCTOR values(3031, 'heart surgery','Master')
insert into DOCTOR values(3036, 'Radiologists','Bachelor')
insert into DOCTOR values(1223, 'pharmacist','Master')
insert into DOCTOR values(3667, 'Radiologists','PHD')
insert into DOCTOR values(1256, 'Obstetrician','Bachelor')
insert into DOCTOR values(1487, 'Emergency ','Master')
insert into DOCTOR values(2143, 'General surgery ','PHP')

insert into DEPARTMENT values(1 , 'surgery' , 9 , 21653 ,2143)
insert into DEPARTMENT values(2, 'Radiology' , 4 , 21653 ,3667)
insert into DEPARTMENT values(3,'pharmacy ' , 2 , 21653, 1223)
insert into DEPARTMENT values(4,' Laboratory', 2 , 21653, 3036)
insert into DEPARTMENT values(5,'Hypnosis', 3 ,21653 , 2234)
insert into DEPARTMENT values(6,'Operations', 3 ,21653,1256)


insert into ROOM values(1,'private individual' ,1 , 3 , 5)
insert into ROOM values(2,'private individual' ,1 , 3 , 5)
insert into ROOM values(3,'private individual',1 , 3 , 5)
insert into ROOM values(4,'private individual',1 , 3 , 5)
insert into ROOM values(5,'Emergency',8, 1, 5)
insert into ROOM values(6,'Emergency' ,8 , 1 , 5)
insert into ROOM values(7,'Emergency' ,8 , 1 , 5)
insert into ROOM values(8,'Emergency' ,8 , 1 , 5)
insert into ROOM values(9,'Emergency' ,8 , 1 , 5)


insert into PATIENT values (112,29,'Male','Ahmed','Ali','Al-Ahmadi','acute_tonsillitis','Aa12@gmail.com','A',3031 ,1, 1256,1123 )
insert into PATIENT values (113,10,'Female','jana','Mohamed','Al-johani','UTI','Jana_1@gmail.com','O',3036 ,2,1487 ,1114 )
insert into PATIENT values (114,32,'Male','Saad','khalid','Al-Ahmadi','acute_tonsillitis','SS11@gmail.com','A',1223 ,5,2143 ,2234 )
insert into PATIENT values (115,44,'Male','Mohamed','Ali','Al-Harbi','asthma','mmo@gmail.com','B',3667 ,3,3654 ,3030 )

insert into P_PHONE values (112,0555122233)
insert into P_PHONE values (113,0500122235)
insert into P_PHONE values (114,0501320553)
insert into P_PHONE values (115,0501111112)

insert into MEDICATION values ('amoxicillin',15,'TID_for_5days',500,112,3031)
insert into MEDICATION values ('nitrofurantoin',50,'BID_for_7days',100,113,3036)
insert into MEDICATION values ('amoxicillin',15,'TID_for_5days',500,114,1223)
insert into MEDICATION values ('salbutamol',44,'when_needed',100,115,3667)

insert into MEDICAL_RECORD values ('2022-11-12','amoxicillin','2022-11-12',12,'acute_tonsillitis',3031,1256,112)
insert into MEDICAL_RECORD values ('2022-11-14','nitrofurantoin','2022-11-14',13,'UTI',3036,1487,113)
insert into MEDICAL_RECORD values ('2022-10-20','amoxicillin','2022-10-20',10,'acute_tonsillitis',1223,2143,114)
insert into MEDICAL_RECORD values ('2022-8-12','salbutamol','2022-8-12',8,'asthma',3667,3654,115)


--List each doctor with his patient.
select doctor_id, Employee.Fname ,Employee.Mname ,Employee.Lname,p_id,PATIENT.Fname,PATIENT.Mname, PATIENT.Lname 
From Employee , PATIENT
where Doctor_id=Employee_id

--List specific patient details.
select * from MEDICAL_RECORD,PATIENT

--For each reception, there is a list of doctors according to the specialization assigned to this reception.
select * from RECEPTIONIST





