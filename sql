CREATE TABLE license_type (
    id_license_type serial primary key,
    lic_type int4 not null,
    lic_txt varchar(5000),
    user_txt varchar(5000)
);

CREATE TABLE license (
    id_license serial primary key,
    lic_num varchar(64),
	IMEI varchar(64),
    OS varchar(128),
	model varchar(200),
	license_type_id int4,
	UID varchar(64)
);

ALTER TABLE license ADD CONSTRAINT FK_license_type_id FOREIGN KEY (license_type_id) REFERENCES license_type (id_license_type) ON DELETE CASCADE ON UPDATE CASCADE;

CREATE TABLE esignature (
    id_esignature serial primary key,
    param1 varchar(64),
	param2 varchar(64),
	param3 varchar(64),
	param4 varchar(64),
	param5 varchar(64)
);

CREATE TABLE auth
( id_auth    SERIAL CONSTRAINT id_users_pk PRIMARY KEY
, email  varchar(64)

, google_id varchar(128)
, google_secret varchar(128)

, vk_id varchar(128)
, vk_token varchar(128)

, ok_id varchar(128)
, ok_secret varchar(128)

,mailru varchar(64)
,mail_token varchar(64)

, yandex_id varchar(128)

,password varchar(64)
,ip varchar(15)
,username varchar(64)
, last_in timestamp (0) without time zone

,pay_date date
, summ integer
,pay_ident varchar(128)
, end_date timestamp (0) without time zone

, license_id integer
,esignature_id integer
);


ALTER TABLE auth ADD CONSTRAINT FK_license_id FOREIGN KEY (license_id) REFERENCES license (id_license) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE auth ADD CONSTRAINT FK_esignature_id FOREIGN KEY (esignature_id) REFERENCES esignature (id_esignature) ON DELETE CASCADE ON UPDATE CASCADE;




CREATE TABLE support (
    id_support serial primary key,
    auth_id integer,
	req_time timestamp (0) without time zone,
	trouble varchar(640),
	status integer,
	resp_time timestamp (0) without time zone,
	response varchar(640),
	category integer,
	mark integer
);

ALTER TABLE support ADD CONSTRAINT FK_auth_id FOREIGN KEY (auth_id) REFERENCES auth (id_auth) ON DELETE CASCADE ON UPDATE CASCADE;


CREATE TABLE errors (
    id_errors serial primary key,
    auth_id integer,
	date_err timestamp (0) without time zone,
	error_code varchar(32),
	lic_num varchar(32),
	license_type_id integer,
	uid varchar(32),
	imei varchar(64),
	os varchar(64),
	model varchar(256),
	file_id integer
);

ALTER TABLE errors ADD CONSTRAINT FK_auth_id FOREIGN KEY (auth_id) REFERENCES auth (id_auth) ON DELETE CASCADE ON UPDATE CASCADE;


