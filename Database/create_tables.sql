create table Department (
    dept_name varchar(100) not null,
    formed_date date,
    annual_budget double,
    employees int,
    students int,
    
    primary key (dept_name)
);

create table Student_Authentication_Info (
	person_id int not null auto_increment,
	department varchar(100),
    academic_email varchar(20),
    academic_password varchar(100),
    
    primary key (person_id),
    foreign key (department) references Department(dept_name)
);
    
    
create table Student_Info (
	student_code varchar(12) not null,
    am varchar(10),
    department varchar(100),
    academic_email varchar(20),
    personal_email varchar(80),
    s_name varchar(30),
    surname varchar(30),
    s_year int,
    phone varchar(13),
    
    primary key (student_code),
    foreign key (department) references Department(dept_name)
)
    
    
