-- Table: ${iwsPostgresSchema}.lookup_country

-- DROP TABLE ${iwsPostgresSchema}.lookup_country;

CREATE TABLE ${iwsPostgresSchema}.lookup_country
(
  id character(36) NOT NULL,
  name character varying(2048) NOT NULL,
  isoalpha2code character(2) NOT NULL,
  iseuropeanunionmember boolean NOT NULL,
  CONSTRAINT pk_country_id PRIMARY KEY (id)
     USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace}
)
WITH (
  OIDS=FALSE
)
TABLESPACE ${iwsPostgresTablesTablespace};
  
-- Table: ${iwsPostgresSchema}.lookup_competentauthority

-- DROP TABLE ${iwsPostgresSchema}.lookup_competentauthority;

CREATE TABLE ${iwsPostgresSchema}.lookup_competentauthority
(
  id character(36) NOT NULL,
  name character varying(1023) NOT NULL,
  abbreviation character varying(63),
  issystemuser boolean NOT NULL,
  code character varying(25) NOT NULL,
  countryid character(36) NOT NULL,
  region character varying(2048),
  istransitauthority boolean,
  CONSTRAINT pk_competentauthority_id PRIMARY KEY (id)
     USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace},
  CONSTRAINT fk_competentauthority_country FOREIGN KEY (countryid)
    REFERENCES ${iwsPostgresSchema}.lookup_country (id) MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
)
TABLESPACE ${iwsPostgresTablesTablespace};

-- Index: ${iwsPostgresSchema}.ix_competentauthority_country

-- DROP INDEX ${iwsPostgresSchema}.ix_competentauthority_country;

CREATE INDEX ix_competentauthority_country
  ON ${iwsPostgresSchema}.lookup_competentauthority
  USING btree
  (countryid COLLATE pg_catalog."default")
  TABLESPACE ${iwsPostgresIndexesTablespace};

-- Table: ${iwsPostgresSchema}.notification_organisation

-- DROP TABLE ${iwsPostgresSchema}.notification_organisation;

CREATE TABLE ${iwsPostgresSchema}.notification_organisation
(
  id character(36) NOT NULL,
  name character varying(2048) NOT NULL,
  type integer NOT NULL,
  rowversion bytea NOT NULL,
  registrationnumber character varying(64),
  aditionalregistrationnumber character varying(64),
  fullname character varying(2048),
  telephone character varying(150),
  fax character varying(150),
  email character varying(150),
  otherdescription character varying(2048),
  CONSTRAINT pk_organisation_id PRIMARY KEY (id)
     USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace}
)
WITH (
  OIDS=FALSE
)
TABLESPACE ${iwsPostgresTablesTablespace};

-- Table: ${iwsPostgresSchema}.lookup_notificationtype

-- DROP TABLE ${iwsPostgresSchema}.lookup_notificationtype;

CREATE TABLE ${iwsPostgresSchema}.lookup_notificationtype
(
  id integer NOT NULL,
  description character varying(64) NOT NULL,
  CONSTRAINT pk_notificationtype PRIMARY KEY (id)
     USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace}
)
WITH (
  OIDS=FALSE
)
TABLESPACE ${iwsPostgresTablesTablespace};

-- Table: ${iwsPostgresSchema}.identity_users

-- DROP TABLE ${iwsPostgresSchema}.identity_users;

CREATE TABLE ${iwsPostgresSchema}.identity_users
(
  id character varying(128) NOT NULL,
  email character varying(256),
  emailconfirmed boolean NOT NULL,
  passwordhash text,
  securitystamp text,
  phonenumber text,
  phonenumberconfirmed boolean NOT NULL,
  twofactorenabled boolean NOT NULL,
  lockoutenddateutc timestamp(3) without time zone,
  lockoutenabled boolean NOT NULL,
  accessfailedcount integer NOT NULL,
  username character varying(256) NOT NULL,
  firstname character varying(256),
  surname character varying(256),
  organisationid character(36),
  addressid character(36),
  CONSTRAINT pk_user_users PRIMARY KEY (id)
     USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace},
  CONSTRAINT fk_users_organisation FOREIGN KEY (organisationid)
    REFERENCES ${iwsPostgresSchema}.notification_organisation (id) MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
)
TABLESPACE ${iwsPostgresTablesTablespace};

-- Index: ${iwsPostgresSchema}.ix_users_email

-- DROP INDEX ${iwsPostgresSchema}.ix_users_email;

CREATE INDEX ix_users_email
  ON ${iwsPostgresSchema}.identity_users
  USING btree
  (email COLLATE pg_catalog."default")
  TABLESPACE ${iwsPostgresIndexesTablespace};

-- Index: ${iwsPostgresSchema}.ix_users_emailconfirmed

-- DROP INDEX ${iwsPostgresSchema}.ix_users_emailconfirmed;

CREATE INDEX ix_users_emailconfirmed
  ON ${iwsPostgresSchema}.identity_users
  USING btree
  (emailconfirmed)
  TABLESPACE ${iwsPostgresIndexesTablespace};

-- Index: ${iwsPostgresSchema}.ix_fk_users_organisation

-- DROP INDEX ${iwsPostgresSchema}.ix_fk_users_organisation;

CREATE INDEX ix_fk_users_organisation
  ON ${iwsPostgresSchema}.identity_users
  USING btree
  (organisationid COLLATE pg_catalog."default")
  TABLESPACE ${iwsPostgresIndexesTablespace};

-- Index: ${iwsPostgresSchema}.usernameindex

-- DROP INDEX ${iwsPostgresSchema}.usernameindex;

CREATE UNIQUE INDEX usernameindex
  ON ${iwsPostgresSchema}.identity_users
  USING btree
  (username COLLATE pg_catalog."default")
  TABLESPACE ${iwsPostgresIndexesTablespace};

-- Table: ${iwsPostgresSchema}.notification_notification

-- DROP TABLE ${iwsPostgresSchema}.notification_notification;

CREATE TABLE ${iwsPostgresSchema}.notification_notification
(
  id character(36) NOT NULL,
  userid character(36) NOT NULL,
  notificationtype integer NOT NULL,
  competentauthority integer NOT NULL,
  notificationnumber character varying(50) NOT NULL,
  rowversion bytea NOT NULL,
  createddate timestamp(0) with time zone NOT NULL,
  reasonforexport character varying(70),
  hasspecialhandlingrequirements boolean,
  specialhandlingdetails character varying(2048),
  isrecoverypercentagedataprovidedbyimporter boolean,
  wastegenerationprocess character varying(1024),
  iswastegenerationprocessattached boolean,
  CONSTRAINT pk_notification PRIMARY KEY (id)
     USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace},
  CONSTRAINT fk_notification_notificationtype FOREIGN KEY (notificationtype)
    REFERENCES ${iwsPostgresSchema}.lookup_notificationtype (id) MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
)
TABLESPACE ${iwsPostgresTablesTablespace};

-- Index: ${iwsPostgresSchema}.ix_fk_notification_notificationtype

-- DROP INDEX ${iwsPostgresSchema}.ix_fk_notification_notificationtype;

CREATE INDEX ix_fk_notification_notificationtype
  ON ${iwsPostgresSchema}.notification_notification
  USING btree
  (notificationtype)
  TABLESPACE ${iwsPostgresIndexesTablespace};

-- Index: ${iwsPostgresSchema}.ix_notification_competentauthority

-- DROP INDEX ${iwsPostgresSchema}.ix_notification_competentauthority;

CREATE INDEX ix_notification_competentauthority
  ON ${iwsPostgresSchema}.notification_notification
  USING btree
  (competentauthority)
  TABLESPACE ${iwsPostgresIndexesTablespace};

-- Index: ${iwsPostgresSchema}.ix_notification_competentauthority_2

-- DROP INDEX ${iwsPostgresSchema}.ix_notification_competentauthority_2;

CREATE INDEX ix_notification_competentauthority_2
  ON ${iwsPostgresSchema}.notification_notification
  USING btree
  (competentauthority)
  TABLESPACE ${iwsPostgresIndexesTablespace};


