create database PaulsVetClinic;

use PaulsVetClinic;

select DATABASE();

create table Pets(
    pet_id mediumint unsigned auto_increment primary key,
    name varchar(50) not null
) engine = innodb;

show tables;

create table PetOwners(
    pet_owner_id mediumint unsigned auto_increment primary key,
    first_name varchar(30) not null,
    last_name varchar(30) default "",
    email varchar (50) not null
) engine = innodb;

alter table Pets add column pet_owner_id mediumint unsigned;

alter table Pets add constraint fk_pets_petOwners
    foreign key (pet_owner_id) references PetOwners(pet_owner_id);

create table Appointments(
    appointment_id int unsigned auto_increment primary key,
    datetime datetime not null
);
alter table Appointments add column pet_id mediumint unsigned;
alter table Appointments add constraint fk_appointments_pets
    foreign key (pet_id) references Pets (pet_id);

alter table Appointments add column pet_owner_id mediumint unsigned;
alter table Appointments add constraint fk_appointments_pet_owners
    foreign key (pet_owner_id) references PetOwners (pet_owner_id);

create table Vets(
    vet_id smallint unsigned auto_increment primary key,
    first_name varchar(30) not null,
    last_name varchar(30) not null
);

alter table Vets add column office_number varchar(20) not null;

alter table Appointments add column vet_id smallint unsigned;
alter table Appointments add constraint fk_appointments_vets
    foreign key (vet_id) references Vets (vet_id);

create table Shifts(
    shift_id int unsigned auto_increment primary key,
    day smallint unsigned not null,
    start_time time not null,
    end_time time not null,
    vet_id smallint unsigned 
);
alter table Shifts add constraint fk_shifts_vets
    foreign key(vet_id) references Vets(vet_id);

create table Diagnosis(
    diagnosis_id int unsigned auto_increment primary key,
    doctor_notes text,
    appointment_id int unsigned 
);
alter table Diagnosis add constraint fk_diagnosis_appointments
    foreign key(appointment_id) references Appointments(appointment_id);

create table Treatments(
    treatment_id mediumint unsigned auto_increment primary key,
    dosage float,
    unit varchar(10),
    diagnosis_id int unsigned,
    qty int unsigned
);
alter table Treatments add constraint fk_treatments_diagnosis 
    foreign key(diagnosis_id) references Diagnosis(diagnosis_id);

create table Medicines(
    medicine_id mediumint unsigned auto_increment primary key,
    name varchar(50),
    description text
);

create table Prescriptions(
    prescription_id mediumint unsigned auto_increment primary key,
    treatment_id mediumint unsigned,
    medicine_id mediumint unsigned
);
alter table Prescriptions add constraint fk_prescriptions_treatments 
    foreign key(treatment_id) references Treatments(treatment_id);

alter table Prescriptions add constraint fk_prescriptions_medicines
foreign key(medicine_id) references Medicines(medicine_id);

insert into PetOwners (first_name, last_name, email) values ('Boon Siang', "Tay", "tayboonsiang90@gmail.com");

insert into Pets (name, pet_owner_id) values ("Meow Meow", 1);

insert into Vets (first_name, last_name, office_number) value ('Jian De', 'Goh', '91869636');

insert into Shifts (day, start_time, end_time, vet_id) values (1, "15:50:00", "20:50:00", 1);

insert into Appointments (datetime, vet_id, pet_id, pet_owner_id) values ("2022-03-29 13:05:00", 1, 1, 1);

insert into Diagnosis (doctor_notes, appointment_id) values ("Naughty boy", 1);

insert into Treatments (dosage, unit, diagnosis_id, qty) values (2.0, "ml", 1, 4);

insert into Medicines (name, description) values ("tuna", "tasty tuna for naughty cat");

insert into Prescriptions (treatment_id, medicine_id) values (1, 1);