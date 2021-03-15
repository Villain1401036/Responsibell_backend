-----USER

DROP TABLE user_table ;

CREATE TABLE user_table(

	user_num bigserial Primary Key,
	userid UUID Unique not null,
	username text Unique NOT NULL,

  email text UNIQUE ,
 	phone bigint UNIQUE ,
  identity text Unique NOT null,
	profilepic text ,

	created timestamp not null,

	----pass

	metadata jsonb

		);

-----DESIGNATION
CREATE TYPE mood AS ENUM ('patient','caretaker');

DROP TABLE user_type ;

CREATE TABLE user_type(
	user_num bigserial ,
	user_type mood ,
	PRIMARY KEY(user_num, user_type)
);

-----CONNECTION

DROP TABLE user_connection ;

CREATE TABLE user_connection (
	caretaker_id bigserial,
	patient_id bigserial,
	PRIMARY KEY(caretaker_id, patient_id)
);

-----DRUGS

DROP TABLE drugs_table;

CREATE TABLE drugs_table (
  patient_id bigserial,
	drug_name text ,
	drug_info text ,
	image text ,
	stock_left int,
	timings jsonb ,
	PRIMARY KEY (patient_id, drug_name)

);

-----Appointment TABLE

DROP TABLE appointment_table;

CREATE TABLE appointment_table (
  patient_id bigserial,
	doc_name text ,
	appointment_info text ,
	time timestamp ,
	stock_left int,
	timings jsonb ,
	PRIMARY KEY (patient_id, drug_name)

);

----COMPLAINTS TABLE

DROP TABLE complaints_table ;

CREATE TABLE complaints_table (

patient_id bigserial,
drug_name text ,
note text ,
voice text ,
created timestamp ,

PRIMARY KEY (patient_id , drug_name)

);
