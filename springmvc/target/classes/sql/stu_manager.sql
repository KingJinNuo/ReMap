CREATE TABLE `district` (
`dis_id` int NOT NULL,
`dis_name` varchar(60)  NOT NULL,
PRIMARY KEY (`dis_id`) 
);

CREATE TABLE `organization` (
`org_id` int NOT NULL,
`org_name` varchar(60) NOT NULL,
`dis_id` int NOT NULL,
PRIMARY KEY (`org_id`) 
);

CREATE TABLE `unit` (
`unit_id` int NOT NULL,
`unit_name` varchar(60) NOT NULL,
`org_id` int NULL,
PRIMARY KEY (`unit_id`) 
);

CREATE TABLE `student` (
`stu_id` int NOT NULL,
`stu_name` varchar(60) NOT NULL,
`stu_sex` varchar(10) NOT NULL,
`stu_add` varchar(200) NOT NULL,
`unit_id` int NOT NULL,
PRIMARY KEY (`stu_id`) 
);


ALTER TABLE `organization` ADD CONSTRAINT ` ` FOREIGN KEY (`dis_id`) REFERENCES `district` ();
ALTER TABLE `unit` ADD FOREIGN KEY (`org_id`) REFERENCES `organization` ();
ALTER TABLE `student` ADD FOREIGN KEY (`unit_id`) REFERENCES `unit` ();


