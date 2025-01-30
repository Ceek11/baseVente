ALTER TABLE `users` ADD `helmet` INT(1) NOT NULL DEFAULT '0' AFTER `phone_number`;


INSERT INTO `jobs` (`name`, `label`) VALUES
('abatoire', 'Abatoire');
('couturier', 'Couturier');

INSERT INTO `job_grades` (job_name, grade, name, label, salary) VALUES
('abatoire', 0,'employe','Employé' , 0);
('couturier', 0,'couturier','Couturier' , 0);