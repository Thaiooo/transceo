alter table member drop foreign key FKBFC28A9AB9312A16;
drop table if exists administrator;
drop table if exists customer;
drop table if exists member;
create table administrator (id bigint not null auto_increment, version bigint not null, passwword varchar(255) not null, login varchar(255) not null, primary key (id));
create table customer (id bigint not null auto_increment, version bigint not null, last_name varchar(255) not null, phone_number varchar(255) not null, first_name varchar(255) not null, primary key (id));
create table member (id bigint not null, postal integer not null, street varchar(255) not null, number integer not null, sponsor_id bigint not null, password varchar(255) not null, city varchar(255) not null, e_mail varchar(255) not null, active bit not null, subscribe_date datetime not null, activation_id bigint not null, primary key (id));
alter table member add index FKBFC28A9AB9312A16 (sponsor_id), add constraint FKBFC28A9AB9312A16 foreign key (sponsor_id) references member (id);
