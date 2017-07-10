CREATE TABLE users
( id_users    SERIAL CONSTRAINT id_users_pk PRIMARY KEY
,password varchar(64)
,username varchar(64)
, email  varchar(64) 
, google_id varchar(128)
, google_secret varchar(128)
, vk_id varchar(128)
, vk_token varchar(128)
, ok_id varchar(128)
, ok_secret varchar(128)
, yandex_id varchar(128)

);
