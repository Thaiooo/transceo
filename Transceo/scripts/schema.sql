alter table confirmation_code drop foreign key FK4BF333B7E66A7296;
alter table invitation drop foreign key FK473F7799E617FA05;
alter table member drop foreign key FKBFC28A9AB9312A16;
alter table travel drop foreign key FKCC667F1A71763A59;
alter table travel drop foreign key FKCC667F1AF0928FFF;
alter table travel drop foreign key FKCC667F1A76BC3516;
drop table if exists administrator;
drop table if exists adresse;
drop table if exists code_sequence;
drop table if exists confirmation_code;
drop table if exists customer;
drop table if exists customer_quotation;
drop table if exists invitation;
drop table if exists member;
drop table if exists rate_mile;
drop table if exists travel;
create table administrator (id bigint not null auto_increment, version bigint not null, last_name varchar(255) not null, login varchar(255) not null unique, first_name varchar(255) not null, password varchar(255) not null, primary key (id));
create table adresse (id bigint not null auto_increment, version bigint not null, adresse varchar(255) not null, postal integer not null, country varchar(255) not null, city varchar(255) not null, class varchar(255) not null, label varchar(255), primary key (id));
create table code_sequence (id bigint not null auto_increment, version bigint not null, sequence integer not null, primary key (id));
create table confirmation_code (id bigint not null auto_increment, version bigint not null, travel_id bigint not null, code varchar(255) not null, primary key (id));
create table customer (id bigint not null auto_increment, version bigint not null, last_name varchar(255) not null, phone_number varchar(255) not null, firm varchar(255), first_name varchar(255) not null, primary key (id));
create table customer_quotation (id bigint not null, e_mail varchar(255), primary key (id));
create table invitation (id bigint not null auto_increment, message varchar(255), author_id bigint not null, e_mail varchar(255) not null, code bigint not null, primary key (id));
create table member (id bigint not null, adresse varchar(255), postal integer, miles integer, code varchar(255) unique, sponsor_id bigint, password varchar(255), city varchar(255), country varchar(255), friend_miles integer, active bit, subscribe_date datetime, activation_id bigint, primary key (id));
create table rate_mile (id bigint not null auto_increment, version bigint not null, rate integer not null, level integer not null unique, primary key (id));
create table travel (id bigint not null auto_increment, version bigint not null, depart_id bigint not null, status varchar(255) not null, travel_date datetime not null, customer_id bigint not null, destination_id bigint, travel_minute integer not null, creation_date datetime not null, price double precision not null, travel_hour integer not null, number_of_personne integer not null, comment varchar(255), class varchar(255) not null, travels_idx integer, primary key (id));
alter table confirmation_code add index FK4BF333B7E66A7296 (travel_id), add constraint FK4BF333B7E66A7296 foreign key (travel_id) references travel (id);
alter table invitation add index FK473F7799E617FA05 (author_id), add constraint FK473F7799E617FA05 foreign key (author_id) references member (id);
alter table member add index FKBFC28A9AB9312A16 (sponsor_id), add constraint FKBFC28A9AB9312A16 foreign key (sponsor_id) references member (id);
alter table travel add index FKCC667F1A71763A59 (depart_id), add constraint FKCC667F1A71763A59 foreign key (depart_id) references adresse (id);
alter table travel add index FKCC667F1AF0928FFF (destination_id), add constraint FKCC667F1AF0928FFF foreign key (destination_id) references adresse (id);
alter table travel add index FKCC667F1A76BC3516 (customer_id), add constraint FKCC667F1A76BC3516 foreign key (customer_id) references customer (id);
