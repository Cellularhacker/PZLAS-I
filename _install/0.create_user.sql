--- CHANGE by '' to by 'your_own_passwd'
-- USER 생성 --
create user 'PZLAS'@'localhost' ientified by '';

-- DATABASE 생성 --
create database PZLAS;

-- DATABASE ACCESS GRANT FOR USER 'PZLAS'
grant all privilesges on PZLAS.* to 'PZLAS'@'localhost';

-- Flush Privileges
flush privileges;