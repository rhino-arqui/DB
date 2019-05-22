CREATE TABLE client  
( password varchar2(255) NOT NULL,  
  username varchar2(255) NOT NULL,  
  given_name varchar2(255) ,
  last_name varchar2(255),
  email varchar2(255),
  id varchar2(255) NOT NULL, -- cedula
  CONSTRAINT unique_values UNIQUE (username, email, id),
  CONSTRAINT client_pk PRIMARY KEY (id)
);  

CREATE TABLE property(
    is_delete number(1,0) DEFAULT 0,
    adress varchar2(255) NOT NULL,
    is_available number(1,0) DEFAULT 1,
    number_rooms integer NOT NULL,
    rent number(10,2) NOT NULL,
    id integer,
    client_id varchar2(255),
    CONSTRAINT property_pk PRIMARY KEY (id),
    CONSTRAINT client_fk FOREIGN KEY (client_id) REFERENCES client(id)
);

CREATE TABLE visiting_list(
    client_id varchar2(255),
    property_id integer,
    CONSTRAINT client_v_fk FOREIGN KEY (client_id) REFERENCES client(id),
    CONSTRAINT property_v_fk FOREIGN KEY (property_id) REFERENCES property(id),
    CONSTRAINT visiting_list_pk PRIMARY KEY (client_id, property_id)
);

CREATE TABLE rent_record(
    id integer,
    lease_path varchar2(255),
    rental_date date,
    property_id integer NOT NULL,
    CONSTRAINT property_r_fk FOREIGN KEY (property_id) REFERENCES property(id),
    CONSTRAINT rent_record_pk PRIMARY KEY (id)
);

CREATE TABLE log_payments(
    transaction_id integer,
    rent_value number(10,2) NOT NULL,
    rent_record_id integer NOT NULL,
    CONSTRAINT rent_record_l_fk FOREIGN KEY (rent_record_id) REFERENCES rent_record(id),
    CONSTRAINT log_payments_pk PRIMARY KEY (transaction_id)
);

commit;