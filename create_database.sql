create table  Users (
    authenticating_userid int,
    nickname varchar(100),
    enabled boolean default true,
    initials varchar(100),
    phone varchar(100),
    lastname varchar(100),
    firstname varchar(100),
    dva_provider varchar(100) );

create table Users_Patients (userid int, patientid int);

create table  patients (
    id                  int,
    active              boolean default true,
    creation_date       TIMESTAMP DEFAULT NOW(),
    referral_date       timestamp,
    lastname            varchar(100),
    firstname           varchar(100),
    spousename          varchar(100),
    billing             varchar(100),
    phone               varchar(100),
    Referrer            varchar(100),
    birthdate           timestamp,
    age                 int,
    vx                  varchar(100),
    address             text,
    next_of_kin_name    varchar(100),
    next_of_kin_address text,
    next_of_kin_phone   varchar(100),
    Diagnosis           text,
    PastHistory         text,
    SocialHistory       text,
    InitialAssessment   text,
    Treatment           text,
    last_update         TIMESTAMP DEFAULT NOW(),
    -- last_updator        int,
    dateLetterSent      timestamp,
    Referrer_Provider_No varchar(100),
    Referrer_Address    varchar(100),
    private             boolean);

create table patient_fax(patientid int, faxid int);
create table faxes(faxid serial, fax bytea, content_type varchar(60));

create table  progress (
    patient           int,
    appointment_date  TIMESTAMP DEFAULT NOW(),
    detail            text,
    creator           int,
    creation_date     TIMESTAMP DEFAULT NOW(),
    last_modifier     int,
    modification_date TIMESTAMP DEFAULT NOW(),
    charge            real,
    paid              boolean default false,
    code              varchar(100));


create table  letters (
    patient           int,
    creator           int,
    creation_date     TIMESTAMP DEFAULT NOW(),
    last_modifier     int,
    modification_date TIMESTAMP DEFAULT NOW(),
    letter            text,
    sent              boolean default false,
    waiting_to_be_sent boolean default false);


create table  audit (

    id int,
    date TIMESTAMP DEFAULT NOW(),
    "user" int,
    action varchar(100),
    data varchar(100));


create table  doctor (
    name      varchar(100),
    address   text,
    postcode  varchar(100));

-- create table  "Group" (
--     name varchar(100),
--     addresstext,
--     phone varchar(100),
--     contact_name varchar(100),
--     comment text,
--     weekday int,
--     time int,
--     AmPm int,
--     last_updated = TIMESTAMP DEFAULT NOW());



create table  Fax_Queue (
    creation_date TIMESTAMP DEFAULT NOW(),
    name varchar(100),
    fax bytea);


create table  Email_Attachment (
    name varchar(100),
    data bytea);


create table  RAP (
    sent_date TIMESTAMP DEFAULT NOW(),
    destination varchar(100),
    "user" int,
    patient int,
    rap_fields json,
    page1 bytea,
    page2 bytea);


create table  Variables (
    name varchar(100),
    value text,
    type varchar(100),
    list json,
    "blob" bytea);

