CREATE SEQUENCE ${iwsPostgresSchema}.auditing_auditlog_seq;

CREATE TABLE ${iwsPostgresSchema}.auditing_auditlog(
	id int default nextval ('${iwsPostgresSchema}.auditing_auditlog_seq') NOT NULL,
	userid char(36) NOT NULL,
	eventdate timestamp(6) NOT NULL,
	eventtype int NOT NULL,
	tablename varchar(256) NOT NULL,
	recordid char(36) NOT NULL,
	originalvalue text NULL,
	newvalue text NULL,
  CONSTRAINT pk_auditlog PRIMARY KEY (id)
  USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace}
)
WITH (
  OIDS=FALSE
)
TABLESPACE ${iwsPostgresTablesTablespace};

CREATE TABLE ${iwsPostgresSchema}.__migrationhistory(
	migrationid varchar(150) NOT NULL,
	contextkey varchar(300) NOT NULL,
	model bytea NOT NULL,
	productversion varchar(32) NOT NULL,
  CONSTRAINT pk_dbo___migrationhistory PRIMARY KEY (migrationid,contextkey)
  USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace} 
)
WITH (
  OIDS=FALSE
)
TABLESPACE ${iwsPostgresTablesTablespace};

CREATE TABLE ${iwsPostgresSchema}.usd_applieddatabasescript(
	scriptfile varchar(255) NOT NULL,
	dateapplied timestamp(3) NOT NULL,
	version int NULL,
	hash varchar(32) NULL,
  CONSTRAINT pk_usd_applieddatabasescript PRIMARY KEY (scriptfile)
  USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace} 
)
WITH (
  OIDS=FALSE
)
TABLESPACE ${iwsPostgresTablesTablespace};
 
CREATE SEQUENCE ${iwsPostgresSchema}.draft_import_seq;

CREATE TABLE ${iwsPostgresSchema}.draft_import(
	id int default nextval ('${iwsPostgresSchema}.draft_import_seq') NOT NULL,
	importnotificationid char(36) NOT NULL,
	type text NOT NULL,
	value text NOT NULL,
  CONSTRAINT pk_draft_import PRIMARY KEY (id)
  USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace} 
)
WITH (
  OIDS=FALSE
)
TABLESPACE ${iwsPostgresTablesTablespace};
 
CREATE TABLE ${iwsPostgresSchema}.filestore_file(
	id char(36) NOT NULL,
	name varchar(256) NOT NULL,
	type varchar(64) NOT NULL,
	content bytea NOT NULL,
  CONSTRAINT pk_file PRIMARY KEY (id)
  USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace}
)
WITH (
  OIDS=FALSE
)
TABLESPACE ${iwsPostgresTablesTablespace};

CREATE TABLE ${iwsPostgresSchema}.identity_aspnetroles(
	id varchar(128) NOT NULL,
	name varchar(256) NOT NULL,
  CONSTRAINT pk_user_aspnetroles PRIMARY KEY (id)
  USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace} 
)
WITH (
  OIDS=FALSE
)
TABLESPACE ${iwsPostgresTablesTablespace};

CREATE SEQUENCE ${iwsPostgresSchema}.identity_aspnetuserclaims_seq;

CREATE TABLE ${iwsPostgresSchema}.identity_aspnetuserclaims(
	id int default nextval ('${iwsPostgresSchema}.identity_aspnetuserclaims_seq') NOT NULL,
	userid varchar(128) NOT NULL,
	claimtype text NULL,
	claimvalue text NULL,
  CONSTRAINT pk_user_aspnetuserclaims PRIMARY KEY (id) 
  USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace}
)
WITH (
  OIDS=FALSE
)
TABLESPACE ${iwsPostgresTablesTablespace};

CREATE TABLE ${iwsPostgresSchema}.identity_aspnetuserlogins(
	loginprovider varchar(128) NOT NULL,
	providerkey varchar(128) NOT NULL,
	userid varchar(128) NOT NULL,
  CONSTRAINT pk_user_aspnetuserlogins PRIMARY KEY (loginprovider,providerkey,userid) 
  USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace}
)
WITH (
  OIDS=FALSE
)
TABLESPACE ${iwsPostgresTablesTablespace};

CREATE TABLE ${iwsPostgresSchema}.identity_aspnetuserroles(
	userid varchar(128) NOT NULL,
	roleid varchar(128) NOT NULL,
  CONSTRAINT pk_user_aspnetuserroles PRIMARY KEY (userid,roleid) 
  USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace}
)
WITH (
  OIDS=FALSE
)
TABLESPACE ${iwsPostgresTablesTablespace};

CREATE TABLE ${iwsPostgresSchema}.identity_consents(
	subject varchar(200) NOT NULL,
	clientid varchar(200) NOT NULL,
	scopes varchar(2000) NOT NULL,
  CONSTRAINT pk_identity_consents PRIMARY KEY (subject,clientid) 
  USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace}
)
WITH (
  OIDS=FALSE
)
TABLESPACE ${iwsPostgresTablesTablespace};
 
CREATE TABLE ${iwsPostgresSchema}.identity_tokens(
	key varchar(128) NOT NULL,
	tokentype smallint NOT NULL,
	subjectid varchar(200) NULL,
	clientid varchar(200) NOT NULL,
	jsoncode text NOT NULL,
	expiry timestamp(6) with time zone NOT NULL,
  CONSTRAINT pk_identity_tokens PRIMARY KEY (key,tokentype) 
  USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace}
)
WITH (
  OIDS=FALSE
)
TABLESPACE ${iwsPostgresTablesTablespace};
 
CREATE TABLE ${iwsPostgresSchema}.importnotification_consent(
	id char(36) NOT NULL,
	from_date date NOT NULL,
	to_date date NOT NULL,
	conditions varchar(4000) NULL,
	userid char(36) NOT NULL,
	notificationid char(36) NOT NULL,
	rowversion bytea NOT NULL,
  CONSTRAINT pk_consent PRIMARY KEY (id)
  USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace} 
)
WITH (
  OIDS=FALSE
)
TABLESPACE ${iwsPostgresTablesTablespace};
 
CREATE TABLE ${iwsPostgresSchema}.importnotification_consultation(
	id char(36) NOT NULL,
	notificationid char(36) NOT NULL,
	localareaid char(36) NULL,
	rowversion bytea NOT NULL,
  CONSTRAINT pk_importnotification_consultation PRIMARY KEY (id)
  USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace} 
)
WITH (
  OIDS=FALSE
)
TABLESPACE ${iwsPostgresTablesTablespace};

CREATE TABLE ${iwsPostgresSchema}.importnotification_exporter(
	id char(36) NOT NULL,
	importnotificationid char(36) NOT NULL,
	name varchar(3000) NOT NULL,
	address1 varchar(1024) NOT NULL,
	address2 varchar(1024) NULL,
	townorcity varchar(1024) NOT NULL,
	postalcode varchar(64) NULL,
	countryid char(36) NOT NULL,
	contactname varchar(1024) NOT NULL,
	telephone varchar(150) NOT NULL,
	email varchar(256) NOT NULL,
	rowversion bytea NOT NULL,
  CONSTRAINT pk_importnotificationexporter PRIMARY KEY (id) 
  USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace}
)
WITH (
  OIDS=FALSE
)
TABLESPACE ${iwsPostgresTablesTablespace};
 
CREATE TABLE ${iwsPostgresSchema}.importnotification_facility(
	id char(36) NOT NULL,
	facilitycollectionid char(36) NOT NULL,
	name varchar(3000) NOT NULL,
	type int NOT NULL,
	registrationnumber varchar(100) NULL,
	address1 varchar(1024) NOT NULL,
	address2 varchar(1024) NULL,
	townorcity varchar(1024) NOT NULL,
	postalcode varchar(64) NULL,
	countryid char(36) NOT NULL,
	contactname varchar(1024) NOT NULL,
	telephone varchar(150) NOT NULL,
	email varchar(256) NOT NULL,
	rowversion bytea NOT NULL,
	isactualsiteoftreatment boolean NOT NULL,
  CONSTRAINT pk_importnotificationfacility PRIMARY KEY (id) 
  USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace}
)
WITH (
  OIDS=FALSE
)
TABLESPACE ${iwsPostgresTablesTablespace};

CREATE TABLE ${iwsPostgresSchema}.importnotification_facilitycollection(
	id char(36) NOT NULL,
	importnotificationid char(36) NOT NULL,
	allfacilitiespreconsented boolean NOT NULL,
	rowversion bytea NOT NULL,
  CONSTRAINT pk_importnotificationfacilitycollection PRIMARY KEY (id)
  USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace} 
)
WITH (
  OIDS=FALSE
)
TABLESPACE ${iwsPostgresTablesTablespace};
 
CREATE TABLE ${iwsPostgresSchema}.importnotification_financialguarantee(
	id char(36) NOT NULL,
	status int NULL,
	receiveddate date NOT NULL,
	completeddate date NULL,
	importnotificationid char(36) NULL,
	createddate timestamp(0) with time zone NULL,
	rowversion bytea NOT NULL,
  CONSTRAINT pk_importnotification_financialguarantee PRIMARY KEY (id) 
  USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace}
)
WITH (
  OIDS=FALSE
)
TABLESPACE ${iwsPostgresTablesTablespace};
 
CREATE TABLE ${iwsPostgresSchema}.importnotification_financialguaranteeapproval(
	id char(36) NOT NULL,
	importnotificationid char(36) NOT NULL,
	decisiondate date NOT NULL,
	referencenumber varchar(70) NOT NULL,
	rowversion bytea NOT NULL,
  CONSTRAINT pk_importnotification_financialguaranteeapproval PRIMARY KEY (id) 
  USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace}
)
WITH (
  OIDS=FALSE
)
TABLESPACE ${iwsPostgresTablesTablespace};

CREATE TABLE ${iwsPostgresSchema}.importnotification_financialguaranteerefusal(
	id char(36) NOT NULL,
	importnotificationid char(36) NOT NULL,
	decisiondate date NOT NULL,
	reason varchar(2048) NOT NULL,
	rowversion bytea NOT NULL,
  CONSTRAINT pk_importnotification_financialguaranteerefusal PRIMARY KEY (id) 
  USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace}
)
WITH (
  OIDS=FALSE
)
TABLESPACE ${iwsPostgresTablesTablespace};

CREATE TABLE ${iwsPostgresSchema}.importnotification_financialguaranteerelease(
	id char(36) NOT NULL,
	importnotificationid char(36) NOT NULL,
	decisiondate date NOT NULL,
	rowversion bytea NOT NULL,
  CONSTRAINT pk_importnotification_financialguaranteerelease PRIMARY KEY (id) 
  USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace}
)
WITH (
  OIDS=FALSE
)
TABLESPACE ${iwsPostgresTablesTablespace};
 
CREATE TABLE ${iwsPostgresSchema}.importnotification_financialguaranteestatuschange(
	id char(36) NOT NULL,
	source int NOT NULL,
	destination int NOT NULL,
	date timestamp(0) with time zone NOT NULL,
	financialguaranteeid char(36) NOT NULL,
	userid char(36) NOT NULL,
	rowversion bytea NOT NULL,
  CONSTRAINT pk_importnotification_financialguaranteestatuschange PRIMARY KEY (id) 
  USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace}
)
WITH (
  OIDS=FALSE
)
TABLESPACE ${iwsPostgresTablesTablespace};

CREATE TABLE ${iwsPostgresSchema}.importnotification_importer(
	id char(36) NOT NULL,
	importnotificationid char(36) NOT NULL,
	name varchar(3000) NOT NULL,
	type int NOT NULL,
	registrationnumber varchar(100) NULL,
	address1 varchar(1024) NOT NULL,
	address2 varchar(1024) NULL,
	townorcity varchar(1024) NOT NULL,
	postalcode varchar(64) NULL,
	countryid char(36) NOT NULL,
	contactname varchar(1024) NOT NULL,
	telephone varchar(150) NOT NULL,
	email varchar(256) NOT NULL,
	rowversion bytea NOT NULL,
  CONSTRAINT pk_importnotificationimporter PRIMARY KEY (id) 
  USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace}
)
WITH (
  OIDS=FALSE
)
TABLESPACE ${iwsPostgresTablesTablespace};
 
CREATE TABLE ${iwsPostgresSchema}.importnotification_interimstatus(
	id char(36) NOT NULL,
	isinterim boolean NOT NULL,
	importnotificationid char(36) NOT NULL,
	rowversion bytea NOT NULL,
  CONSTRAINT pk_importnotification_interimstatus PRIMARY KEY (id) 
  USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace}
)
WITH (
  OIDS=FALSE
)
TABLESPACE ${iwsPostgresTablesTablespace};
 
CREATE TABLE ${iwsPostgresSchema}.importnotification_movement(
	id char(36) NOT NULL,
	number int NOT NULL,
	notificationid char(36) NOT NULL,
	rowversion bytea NOT NULL,
	actualshipmentdate date NOT NULL,
	prenotificationdate date NULL,
	iscancelled boolean NOT NULL,
	comments text NULL,
	statsmarking varchar(1024) NULL,
  CONSTRAINT pk_importmovement PRIMARY KEY (id)
  USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace},
  CONSTRAINT ux_importmovement_number UNIQUE (notificationid,number) 
  USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace}
)
WITH (
  OIDS=FALSE
)
TABLESPACE ${iwsPostgresTablesTablespace};

CREATE TABLE ${iwsPostgresSchema}.importnotification_movementoperationreceipt(
	id char(36) NOT NULL,
	movementid char(36) NOT NULL,
	date date NOT NULL,
	rowversion bytea NOT NULL,
  CONSTRAINT pk_importmovementoperationreceipt PRIMARY KEY (id)
  USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace},
  CONSTRAINT ux_importmovementoperationreceipt_number UNIQUE (movementid) 
  USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace}
)
WITH (
  OIDS=FALSE
)
TABLESPACE ${iwsPostgresTablesTablespace};

CREATE TABLE ${iwsPostgresSchema}.importnotification_movementreceipt(
	id char(36) NOT NULL,
	movementid char(36) NOT NULL,
	date date NOT NULL,
	quantity decimal(18, 4) NOT NULL,
	unit int NOT NULL,
	rowversion bytea NOT NULL,
  CONSTRAINT pk_importmovementreceipt PRIMARY KEY (id)
  USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace},
  CONSTRAINT ux_importmovementreceipt_number UNIQUE (movementid) 
  USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace}
)
WITH (
  OIDS=FALSE
)
TABLESPACE ${iwsPostgresTablesTablespace};
 
CREATE TABLE ${iwsPostgresSchema}.importnotification_movementrejection(
	id char(36) NOT NULL,
	movementid char(36) NOT NULL,
	date date NOT NULL,
	reason text NOT NULL,
	rowversion bytea NOT NULL,
  CONSTRAINT pk_importmovementrejection PRIMARY KEY (id)
  USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace},
  CONSTRAINT ux_importmovementrejection_number UNIQUE (movementid)
  USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace} 
)
WITH (
  OIDS=FALSE
)
TABLESPACE ${iwsPostgresTablesTablespace};
 
CREATE TABLE ${iwsPostgresSchema}.importnotification_notification(
	id char(36) NOT NULL,
	notificationnumber varchar(50) NOT NULL,
	notificationtype int NOT NULL,
	rowversion bytea NOT NULL,
	competentauthority int NOT NULL,
  CONSTRAINT pk_importnotification PRIMARY KEY (id)
  USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace},
  CONSTRAINT uq_importnotification_notificationnumber UNIQUE (notificationnumber)
  USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace}
)
WITH (
  OIDS=FALSE
)
TABLESPACE ${iwsPostgresTablesTablespace};
 
CREATE TABLE ${iwsPostgresSchema}.importnotification_notificationassessment(
	id char(36) NOT NULL,
	notificationapplicationid char(36) NOT NULL,
	status int NOT NULL,
	rowversion bytea NOT NULL,
  CONSTRAINT pk_importnotificationassessment PRIMARY KEY (id)
  USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace} 
)
WITH (
  OIDS=FALSE
)
TABLESPACE ${iwsPostgresTablesTablespace};
 
CREATE TABLE ${iwsPostgresSchema}.importnotification_notificationdates(
	id char(36) NOT NULL,
	notificationassessmentid char(36) NOT NULL,
	rowversion bytea NOT NULL,
	notificationreceiveddate date NULL,
	paymentreceiveddate date NULL,
	withdrawndate date NULL,
	assessmentstarteddate date NULL,
	nameofofficer varchar(256) NULL,
	notificationcompleteddate date NULL,
	acknowledgeddate date NULL,
	consenteddate date NULL,
	consentwithdrawndate date NULL,
	consentwithdrawnreasons varchar(4000) NULL,
	filecloseddate date NULL,
	archivereference varchar(1000) NULL,
  CONSTRAINT pk_importnotificationdates PRIMARY KEY (id) 
  USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace}
)
WITH (
  OIDS=FALSE
)
TABLESPACE ${iwsPostgresTablesTablespace};
 
CREATE TABLE ${iwsPostgresSchema}.importnotification_notificationstatuschange(
	id char(36) NOT NULL,
	notificationassessmentid char(36) NOT NULL,
	previousstatus int NOT NULL,
	newstatus int NOT NULL,
	userid varchar(128) NOT NULL,
	changedate timestamp(6) with time zone NOT NULL,
	rowversion bytea NOT NULL,
  CONSTRAINT pk_importnotificationstatuschange PRIMARY KEY (id) 
  USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace}
)
WITH (
  OIDS=FALSE
)
TABLESPACE ${iwsPostgresTablesTablespace};
 
CREATE TABLE ${iwsPostgresSchema}.importnotification_numberofshipmentshistory(
	id char(36) NOT NULL,
	numberofshipments int NOT NULL,
	datechanged timestamp(0) with time zone NOT NULL,
	importnotificationid char(36) NOT NULL,
	rowversion bytea NOT NULL,
  CONSTRAINT pk_importshipmentnumberhistory PRIMARY KEY (id) 
  USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace}
)
WITH (
  OIDS=FALSE
)
TABLESPACE ${iwsPostgresTablesTablespace};
 
CREATE TABLE ${iwsPostgresSchema}.importnotification_objection(
	id char(36) NOT NULL,
	date date NOT NULL,
	reasons varchar(4000) NOT NULL,
	notificationid char(36) NULL,
	rowversion bytea NOT NULL,
  CONSTRAINT pk_importnotification_objection PRIMARY KEY (id) 
  USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace}
)
WITH (
  OIDS=FALSE
)
TABLESPACE ${iwsPostgresTablesTablespace};
 
CREATE TABLE ${iwsPostgresSchema}.importnotification_operationcodes(
	id char(36) NOT NULL,
	wasteoperationid char(36) NOT NULL,
	operationcode int NOT NULL,
	rowversion bytea NOT NULL,
  CONSTRAINT pk_importnotificationoperationcodes PRIMARY KEY (id)
  USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace} 
)
WITH (
  OIDS=FALSE
)
TABLESPACE ${iwsPostgresTablesTablespace};
 
CREATE TABLE ${iwsPostgresSchema}.importnotification_producer(
	id char(36) NOT NULL,
	importnotificationid char(36) NOT NULL,
	name varchar(3000) NOT NULL,
	address1 varchar(1024) NOT NULL,
	address2 varchar(1024) NULL,
	townorcity varchar(1024) NOT NULL,
	postalcode varchar(64) NULL,
	countryid char(36) NOT NULL,
	contactname varchar(1024) NOT NULL,
	telephone varchar(150) NOT NULL,
	email varchar(256) NOT NULL,
	rowversion bytea NOT NULL,
	isonlyproducer boolean NOT NULL,
  CONSTRAINT pk_importnotificationproducer PRIMARY KEY (id) 
  USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace}
)
WITH (
  OIDS=FALSE
)
TABLESPACE ${iwsPostgresTablesTablespace};
 
CREATE TABLE ${iwsPostgresSchema}.importnotification_shipment(
	id char(36) NOT NULL,
	numberofshipments int NOT NULL,
	quantity decimal(18, 4) NOT NULL,
	units int NOT NULL,
	firstdate date NOT NULL,
	lastdate date NOT NULL,
	importnotificationid char(36) NOT NULL,
	rowversion bytea NOT NULL,
  CONSTRAINT pk_importnotificationshipment PRIMARY KEY (id) 
  USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace}
)
WITH (
  OIDS=FALSE
)
TABLESPACE ${iwsPostgresTablesTablespace};

CREATE TABLE ${iwsPostgresSchema}.importnotification_stateofexport(
	id char(36) NOT NULL,
	transportrouteid char(36) NOT NULL,
	countryid char(36) NOT NULL,
	competentauthorityid char(36) NOT NULL,
	exitpointid char(36) NOT NULL,
	rowversion bytea NOT NULL,
  CONSTRAINT pk_importnotificationstateofexport PRIMARY KEY (id) 
  USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace}
)
WITH (
  OIDS=FALSE
)
TABLESPACE ${iwsPostgresTablesTablespace};
 
CREATE TABLE ${iwsPostgresSchema}.importnotification_stateofimport(
	id char(36) NOT NULL,
	transportrouteid char(36) NOT NULL,
	competentauthorityid char(36) NOT NULL,
	entrypointid char(36) NOT NULL,
	rowversion bytea NOT NULL,
  CONSTRAINT pk_importnotificationstateofimport PRIMARY KEY (id) 
  USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace}
)
WITH (
  OIDS=FALSE
)
TABLESPACE ${iwsPostgresTablesTablespace};
 
CREATE TABLE ${iwsPostgresSchema}.importnotification_transaction(
	id char(36) NOT NULL,
	date date NOT NULL,
	notificationid char(36) NOT NULL,
	debit decimal(12, 2) NULL,
	credit decimal(12, 2) NULL,
	paymentmethod int NULL,
	receiptnumber varchar(100) NULL,
	comments varchar(500) NULL,
	rowversion bytea NOT NULL,
  CONSTRAINT pk_importnotification_transaction PRIMARY KEY (id) 
  USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace}
)
WITH (
  OIDS=FALSE
)
TABLESPACE ${iwsPostgresTablesTablespace};
 
CREATE TABLE ${iwsPostgresSchema}.importnotification_transitstate(
	id char(36) NOT NULL,
	transportrouteid char(36) NOT NULL,
	countryid char(36) NOT NULL,
	competentauthorityid char(36) NOT NULL,
	entrypointid char(36) NOT NULL,
	exitpointid char(36) NOT NULL,
	ordinalposition int NOT NULL,
	rowversion bytea NOT NULL,
  CONSTRAINT pk_importnotificationtransitstate PRIMARY KEY (id) 
  USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace}
)
WITH (
  OIDS=FALSE
)
TABLESPACE ${iwsPostgresTablesTablespace};
 
CREATE TABLE ${iwsPostgresSchema}.importnotification_transportroute(
	id char(36) NOT NULL,
	importnotificationid char(36) NOT NULL,
	rowversion bytea NOT NULL,
  CONSTRAINT pk_importnotificationtransportroute PRIMARY KEY (id) 
  USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace}
)
WITH (
  OIDS=FALSE
)
TABLESPACE ${iwsPostgresTablesTablespace};
 
CREATE TABLE ${iwsPostgresSchema}.importnotification_wastecode(
	id char(36) NOT NULL,
	wastetypeid char(36) NOT NULL,
	wastecodeid char(36) NOT NULL,
	rowversion bytea NOT NULL,
  CONSTRAINT pk_importnotificationwastecode PRIMARY KEY (id) 
  USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace}
)
WITH (
  OIDS=FALSE
)
TABLESPACE ${iwsPostgresTablesTablespace};
 
CREATE TABLE ${iwsPostgresSchema}.importnotification_wasteoperation(
	id char(36) NOT NULL,
	importnotificationid char(36) NOT NULL,
	technologyemployed varchar(70) NULL,
	rowversion bytea NOT NULL,
  CONSTRAINT pk_importnotificationwasteoperation PRIMARY KEY (id) 
  USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace}
)
WITH (
  OIDS=FALSE
)
TABLESPACE ${iwsPostgresTablesTablespace};
 
CREATE TABLE ${iwsPostgresSchema}.importnotification_wastetype(
	id char(36) NOT NULL,
	importnotificationid char(36) NOT NULL,
	name varchar(256) NOT NULL,
	baseloecdcodenotlisted boolean NOT NULL,
	ycodenotapplicable boolean NOT NULL,
	hcodenotapplicable boolean NOT NULL,
	unclassnotapplicable boolean NOT NULL,
	rowversion bytea NOT NULL,
	chemicalcompositiontype int NOT NULL,
  CONSTRAINT pk_importnotificationwastetype PRIMARY KEY (id) 
  USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace}
)
WITH (
  OIDS=FALSE
)
TABLESPACE ${iwsPostgresTablesTablespace};
 
CREATE TABLE ${iwsPostgresSchema}.importnotification_withdrawn(
	id char(36) NOT NULL,
	date date NOT NULL,
	reasons varchar(4000) NOT NULL,
	notificationid char(36) NULL,
	rowversion bytea NOT NULL,
  CONSTRAINT pk_importnotification_withdrawn PRIMARY KEY (id) 
  USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace}
)
WITH (
  OIDS=FALSE
)
TABLESPACE ${iwsPostgresTablesTablespace};
 
CREATE SEQUENCE ${iwsPostgresSchema}.logging_elmah_error_seq;

CREATE TABLE ${iwsPostgresSchema}.logging_elmah_error(
	errorid char(36) NOT NULL,
	application varchar(60) NOT NULL,
	host varchar(50) NOT NULL,
	type varchar(100) NOT NULL,
	source varchar(60) NOT NULL,
	message varchar(500) NOT NULL,
	username varchar(50) NOT NULL,
	statuscode int NOT NULL,
	timeutc timestamp(3) NOT NULL,
	sequence int default nextval ('${iwsPostgresSchema}.logging_elmah_error_seq') NOT NULL,
	allxml text NOT NULL,
  CONSTRAINT pk_elmah_error PRIMARY KEY (errorid) 
  USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace}
)
WITH (
  OIDS=FALSE
)
TABLESPACE ${iwsPostgresTablesTablespace};
 
CREATE TABLE ${iwsPostgresSchema}.lookup_activity(
	id char(36) NOT NULL,
	tradedirection int NOT NULL,
	notificationtype int NOT NULL,
	isinterim boolean NOT NULL,
  CONSTRAINT pk_activity PRIMARY KEY (id) 
  USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace}
)
WITH (
  OIDS=FALSE
)
TABLESPACE ${iwsPostgresTablesTablespace};
 
CREATE TABLE ${iwsPostgresSchema}.lookup_addressbookentitytype(
	id int NOT NULL,
	description varchar(64) NOT NULL,
  CONSTRAINT pk_addressbookentitytype PRIMARY KEY (id) 
  USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace}
)
WITH (
  OIDS=FALSE
)
TABLESPACE ${iwsPostgresTablesTablespace};
 
CREATE TABLE ${iwsPostgresSchema}.lookup_bankholiday(
	id char(36) NOT NULL,
	date timestamp(0) NOT NULL,
	competentauthority int NOT NULL,
	createddate timestamp(0) NOT NULL,
  CONSTRAINT pk_bankholiday PRIMARY KEY (id) 
  USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace}
)
WITH (
  OIDS=FALSE
)
TABLESPACE ${iwsPostgresTablesTablespace};
 
CREATE TABLE ${iwsPostgresSchema}.lookup_businesstype(
	id int NOT NULL,
	description varchar(64) NOT NULL,
  CONSTRAINT pk_businesstype PRIMARY KEY (id) 
  USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace}
)
WITH (
  OIDS=FALSE
)
TABLESPACE ${iwsPostgresTablesTablespace};
 
CREATE TABLE ${iwsPostgresSchema}.lookup_chemicalcompositioncategory(
	id int NOT NULL,
	description varchar(64) NOT NULL,
  CONSTRAINT pk_chemicalcompositioncategory PRIMARY KEY (id) 
  USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace}
)
WITH (
  OIDS=FALSE
)
TABLESPACE ${iwsPostgresTablesTablespace};
 
CREATE TABLE ${iwsPostgresSchema}.lookup_chemicalcompositiontype(
	id int NOT NULL,
	description varchar(64) NOT NULL,
  CONSTRAINT pk_chemicalcompositiontype PRIMARY KEY (id) 
  USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace}
)
WITH (
  OIDS=FALSE
)
TABLESPACE ${iwsPostgresTablesTablespace};

CREATE TABLE ${iwsPostgresSchema}.lookup_codetype(
	id int NOT NULL,
	name varchar(256) NOT NULL,
  CONSTRAINT pk_codetype PRIMARY KEY (id) 
  USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace}
)
WITH (
  OIDS=FALSE
)
TABLESPACE ${iwsPostgresTablesTablespace};
 
CREATE TABLE ${iwsPostgresSchema}.lookup_financialguaranteedecision(
	id int NOT NULL,
	description varchar(30) NOT NULL,
  CONSTRAINT pk_financialguaranteedecision PRIMARY KEY (id)
  USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace} 
)
WITH (
  OIDS=FALSE
)
TABLESPACE ${iwsPostgresTablesTablespace};
 
CREATE TABLE ${iwsPostgresSchema}.lookup_financialguaranteestatus(
	id int NOT NULL,
	description varchar(30) NOT NULL,
  CONSTRAINT pk_financialguaranteestatus PRIMARY KEY (id) 
  USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace}
)
WITH (
  OIDS=FALSE
)
TABLESPACE ${iwsPostgresTablesTablespace};
 
CREATE TABLE ${iwsPostgresSchema}.lookup_importfinancialguaranteestatus(
	id int NOT NULL,
	description varchar(30) NOT NULL,
 CONSTRAINT pk_lookup_importfinancialguaranteestatus PRIMARY KEY (id) 
  USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace}
)
WITH (
  OIDS=FALSE
)
TABLESPACE ${iwsPostgresTablesTablespace};
 
CREATE TABLE ${iwsPostgresSchema}.lookup_importnotificationstatus(
	id int NOT NULL,
	description varchar(64) NOT NULL,
  CONSTRAINT pk_importnotificationstatus PRIMARY KEY (id) 
  USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace}
)
WITH (
  OIDS=FALSE
)
TABLESPACE ${iwsPostgresTablesTablespace};
 
CREATE TABLE ${iwsPostgresSchema}.lookup_internaluserstatus(
	id int NOT NULL,
	description varchar(16) NOT NULL,
  CONSTRAINT pk_internaluserstatus PRIMARY KEY (id) 
  USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace}
)
WITH (
  OIDS=FALSE
)
TABLESPACE ${iwsPostgresTablesTablespace};
 
CREATE TABLE ${iwsPostgresSchema}.lookup_localarea(
	id char(36) NOT NULL,
	name varchar(1024) NOT NULL,
	competentauthorityid int NULL,
	internalid int NULL,
  CONSTRAINT pk_localarea_id PRIMARY KEY (id) 
  USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace}
)
WITH (
  OIDS=FALSE
)
TABLESPACE ${iwsPostgresTablesTablespace};
 
CREATE TABLE ${iwsPostgresSchema}.lookup_movementreceiptdecision(
	id int NOT NULL,
	name varchar(256) NOT NULL,
  CONSTRAINT pk_movementreceiptdecision PRIMARY KEY (id) 
  USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace}
)
WITH (
  OIDS=FALSE
)
TABLESPACE ${iwsPostgresTablesTablespace};
 
CREATE TABLE ${iwsPostgresSchema}.lookup_movementstatus(
	id int NOT NULL,
	status varchar(64) NOT NULL,
  CONSTRAINT pk_movementstatus PRIMARY KEY (id) 
  USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace}
)
WITH (
  OIDS=FALSE
)
TABLESPACE ${iwsPostgresTablesTablespace};
 
CREATE TABLE ${iwsPostgresSchema}.lookup_notificationstatus(
	id int NOT NULL,
	description varchar(64) NOT NULL,
  CONSTRAINT pk_notificationstatus PRIMARY KEY (id) 
  USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace}
)
WITH (
  OIDS=FALSE
)
TABLESPACE ${iwsPostgresTablesTablespace};
 
CREATE TABLE ${iwsPostgresSchema}.lookup_operationcode(
	id int NOT NULL,
	name varchar(256) NOT NULL,
  CONSTRAINT pk_operationcode PRIMARY KEY (id) 
  USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace}
)
WITH (
  OIDS=FALSE
)
TABLESPACE ${iwsPostgresTablesTablespace};
 
CREATE TABLE ${iwsPostgresSchema}.lookup_packagingtype(
	id int NOT NULL,
	description varchar(64) NOT NULL,
  CONSTRAINT pk_packagingtype PRIMARY KEY (id) 
  USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace}
)
WITH (
  OIDS=FALSE
)
TABLESPACE ${iwsPostgresTablesTablespace};
 
CREATE TABLE ${iwsPostgresSchema}.lookup_paymentmethod(
	id int NOT NULL,
	description varchar(16) NOT NULL,
  CONSTRAINT pk_paymentmethod PRIMARY KEY (id) 
  USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace}
)
WITH (
  OIDS=FALSE
)
TABLESPACE ${iwsPostgresTablesTablespace};
 
CREATE TABLE ${iwsPostgresSchema}.lookup_physicalcharacteristictype(
	id int NOT NULL,
	description varchar(64) NOT NULL,
  CONSTRAINT pk_physicalcharacteristictype PRIMARY KEY (id) 
  USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace}
)
WITH (
  OIDS=FALSE
)
TABLESPACE ${iwsPostgresTablesTablespace};
 
CREATE TABLE ${iwsPostgresSchema}.lookup_pricingstructure(
	id char(36) NOT NULL,
	competentauthority int NOT NULL,
	shipmentquantityrangeid char(36) NOT NULL,
	activityid char(36) NOT NULL,
	price money NOT NULL,
	potentialrefund money NOT NULL,
  CONSTRAINT pk_pricingstructure PRIMARY KEY (id) 
  USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace}
)
WITH (
  OIDS=FALSE
)
TABLESPACE ${iwsPostgresTablesTablespace};
 
CREATE TABLE ${iwsPostgresSchema}.lookup_shipmentquantityrange(
	id char(36) NOT NULL,
	rangefrom int NOT NULL,
	rangeto int NULL,
  CONSTRAINT pk_shipmentquantityrange PRIMARY KEY (id) 
  USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace}
)
WITH (
  OIDS=FALSE
)
TABLESPACE ${iwsPostgresTablesTablespace};

CREATE TABLE ${iwsPostgresSchema}.lookup_shipmentquantityunit(
	id int NOT NULL,
	description varchar(64) NOT NULL,
  CONSTRAINT pk_shipmentquantityunit PRIMARY KEY (id) 
  USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace}
)
WITH (
  OIDS=FALSE
)
TABLESPACE ${iwsPostgresTablesTablespace};

CREATE TABLE ${iwsPostgresSchema}.lookup_unitedkingdomcompetentauthority(
	id int NOT NULL,
	competentauthorityid char(36) NULL,
	unitedkingdomcountry varchar(256) NOT NULL,
	bacsaccountname varchar(4000) NOT NULL,
	bacsbank varchar(2048) NOT NULL,
	bacsbankaddress text NOT NULL,
	bacssortcode char(8) NOT NULL,
	bacsaccountnumber varchar(256) NOT NULL,
	bacsiban varchar(256) NOT NULL,
	bacsswiftbic varchar(256) NOT NULL,
	bacsemail varchar(256) NULL,
	bacsfax varchar(128) NULL,
	remittancepostaladdress varchar(4000) NOT NULL,
  CONSTRAINT pk_unitedkingdomcompetentauthority PRIMARY KEY (id) 
  USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace}
)
WITH (
  OIDS=FALSE
)
TABLESPACE ${iwsPostgresTablesTablespace};

CREATE TABLE ${iwsPostgresSchema}.lookup_wastecode(
	id char(36) NOT NULL,
	code varchar(50) NOT NULL,
	description text NULL,
	codetype int NOT NULL,
  CONSTRAINT pk_wastecode PRIMARY KEY (id) 
  USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace}
)
WITH (
  OIDS=FALSE
)
TABLESPACE ${iwsPostgresTablesTablespace};
 
CREATE TABLE ${iwsPostgresSchema}.lookup_wasteinformationtype(
	id int NOT NULL,
	description varchar(64) NOT NULL,
  CONSTRAINT pk_wasteinformationtype PRIMARY KEY (id) 
  USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace}
)
WITH (
  OIDS=FALSE
)
TABLESPACE ${iwsPostgresTablesTablespace};
 
CREATE TABLE ${iwsPostgresSchema}.notification_annexcollection(
	id char(36) NOT NULL,
	notificationid char(36) NOT NULL,
	processofgenerationid char(36) NULL,
	wastecompositionid char(36) NULL,
	technologyemployedid char(36) NULL,
	rowversion bytea NOT NULL,
  CONSTRAINT pk_annexcollection PRIMARY KEY (id) 
  USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace}
)
WITH (
  OIDS=FALSE
)
TABLESPACE ${iwsPostgresTablesTablespace};

CREATE TABLE ${iwsPostgresSchema}.notification_carrier(
	id char(36) NOT NULL,
	name varchar(3000) NOT NULL,
	type int NOT NULL,
	registrationnumber varchar(100) NOT NULL,
	additionalregistrationnumber varchar(100) NULL,
	address1 varchar(1024) NOT NULL,
	address2 varchar(1024) NULL,
	townorcity varchar(1024) NOT NULL,
	postalcode varchar(64) NULL,
	region varchar(1024) NULL,
	country varchar(1024) NOT NULL,
	fullname varchar(2048) NULL,
	telephone varchar(150) NOT NULL,
	fax varchar(150) NULL,
	email varchar(256) NOT NULL,
	rowversion bytea NOT NULL,
	otherdescription varchar(100) NULL,
	carriercollectionid char(36) NOT NULL,
  CONSTRAINT pk_notificationcarrier PRIMARY KEY (id) 
  USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace}
)
WITH (
  OIDS=FALSE
)
TABLESPACE ${iwsPostgresTablesTablespace};
 
CREATE TABLE ${iwsPostgresSchema}.notification_carriercollection(
	id char(36) NOT NULL,
	notificationid char(36) NOT NULL,
	rowversion bytea NOT NULL,
  CONSTRAINT pk_notificationcarriercollection PRIMARY KEY (id) 
  USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace}
)
WITH (
  OIDS=FALSE
)
TABLESPACE ${iwsPostgresTablesTablespace};
 
CREATE TABLE ${iwsPostgresSchema}.notification_consent(
	id char(36) NOT NULL,
	from_date date NOT NULL,
	to_date date NOT NULL,
	conditions varchar(4000) NULL,
	userid char(36) NOT NULL,
	notificationapplicationid char(36) NOT NULL,
	rowversion bytea NOT NULL,
  CONSTRAINT pk_notification_consent PRIMARY KEY (id) 
  USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace}
)
WITH (
  OIDS=FALSE
)
TABLESPACE ${iwsPostgresTablesTablespace};

CREATE TABLE ${iwsPostgresSchema}.notification_consultation(
	id char(36) NOT NULL,
	notificationid char(36) NOT NULL,
	localareaid char(36) NULL,
	rowversion bytea NOT NULL,
  CONSTRAINT pk_notification_consultation PRIMARY KEY (id) 
  USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace}
)
WITH (
  OIDS=FALSE
)
TABLESPACE ${iwsPostgresTablesTablespace};
 
CREATE TABLE ${iwsPostgresSchema}.notification_disposalinfo(
	id char(36) NOT NULL,
	notificationid char(36) NOT NULL,
	unit int NULL,
	amount decimal(12, 2) NULL,
	method varchar(40) NULL,
	rowversion bytea NOT NULL,
  CONSTRAINT pk_notificationdisposalinfo PRIMARY KEY (id) 
  USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace}
)
WITH (
  OIDS=FALSE
)
TABLESPACE ${iwsPostgresTablesTablespace};

CREATE TABLE ${iwsPostgresSchema}.notification_entrycustomsoffice(
	id char(36) NOT NULL,
	name varchar(1024) NOT NULL,
	address varchar(4000) NOT NULL,
	countryid char(36) NOT NULL,
	rowversion bytea NOT NULL,
	transportrouteid char(36) NOT NULL,
  CONSTRAINT pk_entrycustomsoffice PRIMARY KEY (id) 
  USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace}
)
WITH (
  OIDS=FALSE
)
TABLESPACE ${iwsPostgresTablesTablespace};

CREATE TABLE ${iwsPostgresSchema}.notification_entryorexitpoint(
	id char(36) NOT NULL,
	name varchar(2048) NOT NULL,
	countryid char(36) NOT NULL,
	rowversion bytea NULL,
  CONSTRAINT pk_entryorexitpoint PRIMARY KEY (id) 
  USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace}
)
WITH (
  OIDS=FALSE
)
TABLESPACE ${iwsPostgresTablesTablespace};

CREATE TABLE ${iwsPostgresSchema}.notification_exitcustomsoffice(
	id char(36) NOT NULL,
	name varchar(1024) NOT NULL,
	address varchar(4000) NOT NULL,
	countryid char(36) NOT NULL,
	rowversion bytea NOT NULL,
	transportrouteid char(36) NOT NULL,
  CONSTRAINT pk_exitcustomsoffice PRIMARY KEY (id) 
  USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace}
)
WITH (
  OIDS=FALSE
)
TABLESPACE ${iwsPostgresTablesTablespace};

CREATE TABLE ${iwsPostgresSchema}.notification_exporter(
	id char(36) NOT NULL,
	name varchar(3000) NOT NULL,
	type int NOT NULL,
	registrationnumber varchar(100) NOT NULL,
	additionalregistrationnumber varchar(100) NULL,
	address1 varchar(1024) NOT NULL,
	address2 varchar(1024) NULL,
	townorcity varchar(1024) NOT NULL,
	postalcode varchar(64) NULL,
	region varchar(1024) NULL,
	country varchar(1024) NOT NULL,
	fullname varchar(2048) NULL,
	telephone varchar(150) NOT NULL,
	fax varchar(150) NULL,
	email varchar(256) NOT NULL,
	rowversion bytea NOT NULL,
	notificationid char(36) NOT NULL,
	otherdescription varchar(100) NULL,
  CONSTRAINT pk_exporter PRIMARY KEY (id) 
  USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace}
)
WITH (
  OIDS=FALSE
)
TABLESPACE ${iwsPostgresTablesTablespace};
 
CREATE TABLE ${iwsPostgresSchema}.notification_facility(
	id char(36) NOT NULL,
	name varchar(3000) NOT NULL,
	isactualsiteoftreatment boolean NOT NULL,
	type int NOT NULL,
	registrationnumber varchar(100) NOT NULL,
	additionalregistrationnumber varchar(100) NULL,
	address1 varchar(1024) NOT NULL,
	address2 varchar(1024) NULL,
	townorcity varchar(1024) NOT NULL,
	postalcode varchar(64) NULL,
	region varchar(1024) NULL,
	country varchar(1024) NOT NULL,
	fullname varchar(2048) NULL,
	telephone varchar(150) NOT NULL,
	fax varchar(150) NULL,
	email varchar(256) NOT NULL,
	rowversion bytea NOT NULL,
	otherdescription varchar(100) NULL,
	facilitycollectionid char(36) NOT NULL,
  CONSTRAINT pk_notificationfacility PRIMARY KEY (id) 
  USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace}
)
WITH (
  OIDS=FALSE
)
TABLESPACE ${iwsPostgresTablesTablespace};
 
CREATE TABLE ${iwsPostgresSchema}.notification_facilitycollection(
	id char(36) NOT NULL,
	notificationid char(36) NOT NULL,
	allfacilitiespreconsented boolean NULL,
	isinterim boolean NULL,
	rowversion bytea NOT NULL,
  CONSTRAINT pk_notificationfacilitycollection PRIMARY KEY (id) 
  USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace}
)
WITH (
  OIDS=FALSE
)
TABLESPACE ${iwsPostgresTablesTablespace};
 
CREATE TABLE ${iwsPostgresSchema}.notification_financialguarantee(
	id char(36) NOT NULL,
	status int NOT NULL,
	receiveddate date NOT NULL,
	completeddate date NULL,
	createddate timestamp(0) with time zone NULL,
	rowversion bytea NOT NULL,
	decisiondate date NULL,
	refusalreason varchar(2048) NULL,
	activeloadspermitted int NULL,
	referencenumber varchar(70) NULL,
	releaseddate date NULL,
	isblanketbond boolean NULL,
	financialguaranteecollectionid char(36) NOT NULL,
	decision int NOT NULL,
  CONSTRAINT pk_financialguarantee PRIMARY KEY (id) 
  USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace}
)
WITH (
  OIDS=FALSE
)
TABLESPACE ${iwsPostgresTablesTablespace};
 
CREATE TABLE ${iwsPostgresSchema}.notification_financialguaranteecollection(
	id char(36) NOT NULL,
	notificationid char(36) NOT NULL,
	rowversion bytea NOT NULL,
  CONSTRAINT pk_financialguaranteecollection PRIMARY KEY (id) 
  USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace}
)
WITH (
  OIDS=FALSE
)
TABLESPACE ${iwsPostgresTablesTablespace};
 
CREATE TABLE ${iwsPostgresSchema}.notification_financialguaranteestatuschange(
	id char(36) NOT NULL,
	financialguaranteeid char(36) NOT NULL,
	status int NOT NULL,
	userid varchar(128) NOT NULL,
	changedate timestamp(0) with time zone NULL,
	rowversion bytea NOT NULL,
  CONSTRAINT pk_financialguaranteestatuschange PRIMARY KEY (id) 
  USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace}
)
WITH (
  OIDS=FALSE
)
TABLESPACE ${iwsPostgresTablesTablespace};
 
CREATE TABLE ${iwsPostgresSchema}.notification_importer(
	id char(36) NOT NULL,
	name varchar(3000) NOT NULL,
	type int NOT NULL,
	registrationnumber varchar(100) NOT NULL,
	additionalregistrationnumber varchar(100) NULL,
	address1 varchar(1024) NOT NULL,
	address2 varchar(1024) NULL,
	townorcity varchar(1024) NOT NULL,
	postalcode varchar(64) NULL,
	region varchar(1024) NULL,
	country varchar(1024) NOT NULL,
	fullname varchar(2048) NULL,
	telephone varchar(150) NOT NULL,
	fax varchar(150) NULL,
	email varchar(256) NOT NULL,
	rowversion bytea NOT NULL,
	notificationid char(36) NOT NULL,
	otherdescription varchar(100) NULL,
  CONSTRAINT pk_notificationimporter PRIMARY KEY (id) 
  USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace}
)
WITH (
  OIDS=FALSE
)
TABLESPACE ${iwsPostgresTablesTablespace};
 
CREATE TABLE ${iwsPostgresSchema}.notification_meansoftransport(
	id char(36) NOT NULL,
	notificationid char(36) NOT NULL,
	meansoftransport varchar(512) NOT NULL,
	rowversion bytea NOT NULL,
  CONSTRAINT pk_notificationmeansoftransport PRIMARY KEY (id) 
  USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace}
)
WITH (
  OIDS=FALSE
)
TABLESPACE ${iwsPostgresTablesTablespace};
 
CREATE TABLE ${iwsPostgresSchema}.notification_movement(
	id char(36) NOT NULL,
	number int NOT NULL,
	notificationid char(36) NOT NULL,
	date date NULL,
	rowversion bytea NOT NULL,
	fileid char(36) NULL,
	status int NOT NULL,
	prenotificationdate date NULL,
	hasnoprenotification boolean NULL,
	createdby varchar(128) NOT NULL,
	comments text NULL,
	statsmarking varchar(1024) NULL,
  CONSTRAINT pk_data_shipment PRIMARY KEY (id)
  USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace},
  CONSTRAINT uq_movement_notificationid_number UNIQUE (notificationid,number)
  USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace},
  CONSTRAINT ux_movement_number UNIQUE (notificationid,number)
  USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace}
)
WITH (
  OIDS=FALSE
)
TABLESPACE ${iwsPostgresTablesTablespace};
 
CREATE TABLE ${iwsPostgresSchema}.notification_movementcarrier(
	id char(36) NOT NULL,
	carrierid char(36) NOT NULL,
	order_int int NOT NULL,
	rowversion bytea NOT NULL,
	movementdetailsid char(36) NOT NULL,
  CONSTRAINT pk_movementcarrier PRIMARY KEY (id)
  USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace}
)
WITH (
  OIDS=FALSE
)
TABLESPACE ${iwsPostgresTablesTablespace};
 
CREATE TABLE ${iwsPostgresSchema}.notification_movementdatehistory(
	id char(36) NOT NULL,
	movementid char(36) NOT NULL,
	previousdate timestamp(0) with time zone NOT NULL,
	datechanged timestamp(0) with time zone NOT NULL,
	rowversion bytea NOT NULL,
  CONSTRAINT pk_movementdatehistory PRIMARY KEY (id)
  USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace} 
)
WITH (
  OIDS=FALSE
)
TABLESPACE ${iwsPostgresTablesTablespace};
 
CREATE TABLE ${iwsPostgresSchema}.notification_movementdetails(
	id char(36) NOT NULL,
	movementid char(36) NOT NULL,
	quantity decimal(18, 4) NOT NULL,
	unit int NOT NULL,
	numberofpackages int NULL,
	rowversion bytea NOT NULL,
  CONSTRAINT pk_movementdetails PRIMARY KEY (id)
  USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace} 
)
WITH (
  OIDS=FALSE
)
TABLESPACE ${iwsPostgresTablesTablespace};
 
CREATE TABLE ${iwsPostgresSchema}.notification_movementoperationreceipt(
	id char(36) NOT NULL,
	date date NOT NULL,
	rowversion bytea NOT NULL,
	fileid char(36) NULL,
	movementid char(36) NOT NULL,
	createdby varchar(128) NOT NULL,
  CONSTRAINT pk_movementoperationreceipt PRIMARY KEY (id)
  USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace}
)
WITH (
  OIDS=FALSE
)
TABLESPACE ${iwsPostgresTablesTablespace};
 
CREATE TABLE ${iwsPostgresSchema}.notification_movementpackaginginfo(
	packaginginfoid char(36) NOT NULL,
	movementdetailsid char(36) NOT NULL,
  CONSTRAINT pk_movementpackaginginfo PRIMARY KEY (movementdetailsid,packaginginfoid) 
  USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace}
)
WITH (
  OIDS=FALSE
)
TABLESPACE ${iwsPostgresTablesTablespace};
 
CREATE TABLE ${iwsPostgresSchema}.notification_movementreceipt(
	id char(36) NOT NULL,
	movementid char(36) NOT NULL,
	date date NOT NULL,
	decision int NULL,
	quantity decimal(18, 4) NULL,
	rowversion bytea NOT NULL,
	fileid char(36) NULL,
	unit int NOT NULL,
	createdby varchar(128) NOT NULL,
  CONSTRAINT pk_movementreceipt PRIMARY KEY (id) 
  USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace}
)
WITH (
  OIDS=FALSE
)
TABLESPACE ${iwsPostgresTablesTablespace};
 
CREATE TABLE ${iwsPostgresSchema}.notification_movementrejection(
	id char(36) NOT NULL,
	movementid char(36) NOT NULL,
	date date NOT NULL,
	reason text NOT NULL,
	fileid char(36) NULL,
	rowversion bytea NOT NULL,
  CONSTRAINT pk_movementrejection PRIMARY KEY (id)
  USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace} 
)
WITH (
  OIDS=FALSE
)
TABLESPACE ${iwsPostgresTablesTablespace};
 
CREATE TABLE ${iwsPostgresSchema}.notification_movementstatuschange(
	id char(36) NOT NULL,
	movementid char(36) NOT NULL,
	status int NOT NULL,
	userid varchar(128) NOT NULL,
	changedate timestamp(0) with time zone NOT NULL,
	rowversion bytea NOT NULL,
  CONSTRAINT pk_movementstatuschange PRIMARY KEY (id) 
  USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace}
)
WITH (
  OIDS=FALSE
)
TABLESPACE ${iwsPostgresTablesTablespace};
 
CREATE TABLE ${iwsPostgresSchema}.notification_notificationassessment(
	id char(36) NOT NULL,
	notificationapplicationid char(36) NOT NULL,
	rowversion bytea NOT NULL,
	status int NOT NULL,
  CONSTRAINT pk_notificationassessment PRIMARY KEY (id) 
  USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace}
)
WITH (
  OIDS=FALSE
)
TABLESPACE ${iwsPostgresTablesTablespace};

CREATE TABLE ${iwsPostgresSchema}.notification_notificationdates(
	id char(36) NOT NULL,
	notificationreceiveddate date NULL,
	paymentreceiveddate date NULL,
	commencementdate date NULL,
	completedate date NULL,
	transmitteddate date NULL,
	acknowledgeddate date NULL,
	nameofofficer varchar(256) NULL,
	rowversion bytea NOT NULL,
	notificationassessmentid char(36) NOT NULL,
	withdrawndate date NULL,
	objecteddate date NULL,
	consentwithdrawndate date NULL,
	consentwithdrawnreasons varchar(4000) NULL,
	consenteddate date NULL,
	objectionreason varchar(4000) NULL,
	withdrawnreason varchar(4000) NULL,
	filecloseddate date NULL,
	archivereference varchar(1000) NULL,
  CONSTRAINT pk_notificationdates PRIMARY KEY (id) 
  USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace}
)
WITH (
  OIDS=FALSE
)
TABLESPACE ${iwsPostgresTablesTablespace};
 
CREATE TABLE ${iwsPostgresSchema}.notification_notificationstatuschange(
	id char(36) NOT NULL,
	notificationassessmentid char(36) NOT NULL,
	status int NOT NULL,
	userid varchar(128) NOT NULL,
	changedate timestamp(0) with time zone NULL,
	rowversion bytea NOT NULL,
  CONSTRAINT pk_notificationstatuschange PRIMARY KEY (id)
  USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace} 
)
WITH (
  OIDS=FALSE
)
TABLESPACE ${iwsPostgresTablesTablespace};
 
CREATE TABLE ${iwsPostgresSchema}.notification_numberofshipmentshistory(
	id char(36) NOT NULL,
	numberofshipments int NOT NULL,
	datechanged timestamp(0) with time zone NOT NULL,
	notificationid char(36) NOT NULL,
	rowversion bytea NOT NULL,
  CONSTRAINT pk_exportshipmentnumberhistory PRIMARY KEY (id) 
  USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace}
)
WITH (
  OIDS=FALSE
)
TABLESPACE ${iwsPostgresTablesTablespace};

CREATE TABLE ${iwsPostgresSchema}.notification_operationcodes(
	id char(36) NOT NULL,
	notificationid char(36) NOT NULL,
	operationcode int NOT NULL,
	rowversion bytea NOT NULL,
  CONSTRAINT pk_notificationoperationcodes PRIMARY KEY (id) 
    USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace}
)
WITH (
  OIDS=FALSE
)
TABLESPACE ${iwsPostgresTablesTablespace};
 
CREATE TABLE ${iwsPostgresSchema}.notification_packaginginfo(
	id char(36) NOT NULL,
	packagingtype int NOT NULL,
	rowversion bytea NOT NULL,
	otherdescription varchar(100) NULL,
	notificationid char(36) NOT NULL,
  CONSTRAINT pk_packaginginfo PRIMARY KEY (id) 
  USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace}
)
WITH (
  OIDS=FALSE
)
TABLESPACE ${iwsPostgresTablesTablespace};
 
CREATE TABLE ${iwsPostgresSchema}.notification_physicalcharacteristicsinfo(
	id char(36) NOT NULL,
	physicalcharacteristictype int NOT NULL,
	rowversion bytea NOT NULL,
	otherdescription varchar(100) NULL,
	notificationid char(36) NOT NULL,
  CONSTRAINT pk_physicalcharacteristicsinfo PRIMARY KEY (id) 
  USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace}
)
WITH (
  OIDS=FALSE
)
TABLESPACE ${iwsPostgresTablesTablespace};
 
CREATE TABLE ${iwsPostgresSchema}.notification_producer(
	id char(36) NOT NULL,
	name varchar(3000) NOT NULL,
	issiteofexport boolean NOT NULL,
	type int NOT NULL,
	registrationnumber varchar(100) NOT NULL,
	additionalregistrationnumber varchar(100) NULL,
	address1 varchar(1024) NOT NULL,
	address2 varchar(1024) NULL,
	townorcity varchar(1024) NOT NULL,
	postalcode varchar(64) NULL,
	region varchar(1024) NULL,
	country varchar(1024) NOT NULL,
	fullname varchar(2048) NULL,
	telephone varchar(150) NOT NULL,
	fax varchar(150) NULL,
	email varchar(256) NOT NULL,
	rowversion bytea NOT NULL,
	otherdescription varchar(100) NULL,
	producercollectionid char(36) NOT NULL,
  CONSTRAINT pk_notificationproducer PRIMARY KEY (id)
  USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace} 
)
WITH (
  OIDS=FALSE
)
TABLESPACE ${iwsPostgresTablesTablespace};
 
CREATE TABLE ${iwsPostgresSchema}.notification_producercollection(
	id char(36) NOT NULL,
	notificationid char(36) NOT NULL,
	rowversion bytea NOT NULL,
  CONSTRAINT pk_notificationproducercollection PRIMARY KEY (id) 
  USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace}
)
WITH (
  OIDS=FALSE
)
TABLESPACE ${iwsPostgresTablesTablespace};
 
CREATE TABLE ${iwsPostgresSchema}.notification_recoveryinfo(
	id char(36) NOT NULL,
	notificationid char(36) NOT NULL,
	estimatedunit int NOT NULL,
	estimatedamount decimal(12, 2) NOT NULL,
	costunit int NOT NULL,
	costamount decimal(12, 2) NOT NULL,
	rowversion bytea NOT NULL,
	percentagerecoverable decimal(18, 2) NOT NULL,
  CONSTRAINT pk_notificationrecoveryinfo PRIMARY KEY (id)
  USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace} 
)
WITH (
  OIDS=FALSE
)
TABLESPACE ${iwsPostgresTablesTablespace};
 
CREATE TABLE ${iwsPostgresSchema}.notification_shipmentinfo(
	id char(36) NOT NULL,
	notificationid char(36) NOT NULL,
	rowversion bytea NOT NULL,
	numberofshipments int NOT NULL,
	quantity decimal(18, 4) NOT NULL,
	units int NOT NULL,
	firstdate date NOT NULL,
	lastdate date NOT NULL,
  CONSTRAINT pk_notificationshipmentinfo PRIMARY KEY (id) 
  USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace}
)
WITH (
  OIDS=FALSE
)
TABLESPACE ${iwsPostgresTablesTablespace};
 
CREATE TABLE ${iwsPostgresSchema}.notification_stateofexport(
	id char(36) NOT NULL,
	countryid char(36) NOT NULL,
	competentauthorityid char(36) NOT NULL,
	exitpointid char(36) NOT NULL,
	rowversion bytea NOT NULL,
	transportrouteid char(36) NOT NULL,
  CONSTRAINT pk_stateofexport PRIMARY KEY (id) 
  USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace}
)
WITH (
  OIDS=FALSE
)
TABLESPACE ${iwsPostgresTablesTablespace};
 
CREATE TABLE ${iwsPostgresSchema}.notification_stateofimport(
	id char(36) NOT NULL,
	countryid char(36) NOT NULL,
	competentauthorityid char(36) NOT NULL,
	entrypointid char(36) NOT NULL,
	rowversion bytea NOT NULL,
	transportrouteid char(36) NOT NULL,
  CONSTRAINT pk_stateofimport PRIMARY KEY (id) 
  USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace}
)
WITH (
  OIDS=FALSE
)
TABLESPACE ${iwsPostgresTablesTablespace};

CREATE TABLE ${iwsPostgresSchema}.notification_technologyemployed(
	id char(36) NOT NULL,
	annexprovided boolean NOT NULL,
	details varchar(70) NULL,
	notificationid char(36) NOT NULL,
	rowversion bytea NOT NULL,
	furtherdetails text NULL,
  CONSTRAINT pk_notificationtechnologyemployed PRIMARY KEY (id) 
  USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace}
)
WITH (
  OIDS=FALSE
)
TABLESPACE ${iwsPostgresTablesTablespace};
 
CREATE TABLE ${iwsPostgresSchema}.notification_transaction(
	id char(36) NOT NULL,
	date date NOT NULL,
	notificationid char(36) NOT NULL,
	debit decimal(12, 2) NULL,
	credit decimal(12, 2) NULL,
	paymentmethod int NULL,
	receiptnumber varchar(100) NULL,
	comments varchar(500) NULL,
	rowversion bytea NOT NULL,
  CONSTRAINT pk_notification_transaction PRIMARY KEY (id) 
  USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace}
)
WITH (
  OIDS=FALSE
)
TABLESPACE ${iwsPostgresTablesTablespace};
 
CREATE TABLE ${iwsPostgresSchema}.notification_transitstate(
	id char(36) NOT NULL,
	countryid char(36) NOT NULL,
	competentauthorityid char(36) NOT NULL,
	entrypointid char(36) NOT NULL,
	exitpointid char(36) NOT NULL,
	rowversion bytea NOT NULL,
	ordinalposition int NOT NULL,
	transportrouteid char(36) NOT NULL,
  CONSTRAINT pk_transitstate PRIMARY KEY (id) 
  USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace}
)
WITH (
  OIDS=FALSE
)
TABLESPACE ${iwsPostgresTablesTablespace};
 
CREATE TABLE ${iwsPostgresSchema}.notification_transportroute(
	id char(36) NOT NULL,
	notificationid char(36) NOT NULL,
	rowversion bytea NOT NULL,
  CONSTRAINT pk_transportroute PRIMARY KEY (id) 
  USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace}
)
WITH (
  OIDS=FALSE
)
TABLESPACE ${iwsPostgresTablesTablespace};
 
CREATE TABLE ${iwsPostgresSchema}.notification_userhistory(
	id char(36) NOT NULL,
	notificationid char(36) NOT NULL,
	currentuserid varchar(128) NOT NULL,
	newuserid varchar(128) NOT NULL,
	datechanged timestamp(3) NOT NULL,
	rowversion bytea NOT NULL,
  CONSTRAINT pk_userhistory PRIMARY KEY (id) 
  USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace}
)
WITH (
  OIDS=FALSE
)
TABLESPACE ${iwsPostgresTablesTablespace};
 
CREATE TABLE ${iwsPostgresSchema}.notification_wasteadditionalinformation(
	id char(36) NOT NULL,
	constituent varchar(256) NOT NULL,
	minconcentration decimal(7, 2) NOT NULL,
	maxconcentration decimal(7, 2) NOT NULL,
	rowversion bytea NOT NULL,
	wastetypeid char(36) NOT NULL,
	wasteinformationtype int NOT NULL,
  CONSTRAINT pk_wasteadditionalinformation PRIMARY KEY (id) 
  USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace}
)
WITH (
  OIDS=FALSE
)
TABLESPACE ${iwsPostgresTablesTablespace};
 
CREATE TABLE ${iwsPostgresSchema}.notification_wastecodeinfo(
	id char(36) NOT NULL,
	wastecodeid char(36) NULL,
	rowversion bytea NOT NULL,
	customcode varchar(120) NULL,
	notificationid char(36) NOT NULL,
	isnotapplicable boolean NOT NULL,
	codetype int NOT NULL,
  CONSTRAINT pk_wastecodeinfo PRIMARY KEY (id) 
  USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace}
)
WITH (
  OIDS=FALSE
)
TABLESPACE ${iwsPostgresTablesTablespace};

CREATE TABLE ${iwsPostgresSchema}.notification_wastecomposition(
	id char(36) NOT NULL,
	constituent varchar(256) NOT NULL,
	minconcentration decimal(5, 2) NOT NULL,
	maxconcentration decimal(5, 2) NOT NULL,
	rowversion bytea NOT NULL,
	wastetypeid char(36) NOT NULL,
	chemicalcompositiontype int NULL,
  CONSTRAINT pk_wastecomposition PRIMARY KEY (id) 
  USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace}
)
WITH (
  OIDS=FALSE
)
TABLESPACE ${iwsPostgresTablesTablespace};
 
CREATE TABLE ${iwsPostgresSchema}.notification_wastetype(
	id char(36) NOT NULL,
	chemicalcompositiontype int NOT NULL,
	chemicalcompositionname varchar(120) NULL,
	chemicalcompositiondescription text NULL,
	rowversion bytea NOT NULL,
	notificationid char(36) NOT NULL,
	hasannex boolean NOT NULL,
	otherwastetypedescription varchar(256) NULL,
	energyinformation varchar(256) NULL,
	woodtypedescription varchar(256) NULL,
	optionalinformation varchar(256) NULL,
  CONSTRAINT pk_wastetype PRIMARY KEY (id) 
  USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace}
)
WITH (
  OIDS=FALSE
)
TABLESPACE ${iwsPostgresTablesTablespace};
 
CREATE TABLE ${iwsPostgresSchema}.person_address(
	id char(36) NOT NULL,
	address1 varchar(1024) NOT NULL,
	address2 varchar(1024) NULL,
	townorcity varchar(1024) NOT NULL,
	postalcode varchar(64) NULL,
	region varchar(1024) NULL,
	country varchar(1024) NOT NULL,
	rowversion bytea NOT NULL,
  CONSTRAINT pk_personaddress PRIMARY KEY (id) 
  USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace}
)
WITH (
  OIDS=FALSE
)
TABLESPACE ${iwsPostgresTablesTablespace};
 
CREATE TABLE ${iwsPostgresSchema}.person_addressbook(
	id char(36) NOT NULL,
	type int NOT NULL,
	userid char(36) NOT NULL,
	rowversion bytea NOT NULL,
  CONSTRAINT pk_addressbook PRIMARY KEY (id) 
  USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace}
)
WITH (
  OIDS=FALSE
)
TABLESPACE ${iwsPostgresTablesTablespace};
 
CREATE TABLE ${iwsPostgresSchema}.person_addressbookrecord(
	id char(36) NOT NULL,
	addressbookid char(36) NULL,
	name varchar(3000) NOT NULL,
	type int NOT NULL,
	otherdescription varchar(100) NULL,
	registrationnumber varchar(100) NOT NULL,
	additionalregistrationnumber varchar(100) NULL,
	address1 varchar(1024) NOT NULL,
	address2 varchar(1024) NULL,
	townorcity varchar(1024) NOT NULL,
	postalcode varchar(64) NULL,
	region varchar(1024) NULL,
	country varchar(1024) NOT NULL,
	fullname varchar(2048) NULL,
	telephone varchar(150) NOT NULL,
	fax varchar(150) NULL,
	email varchar(256) NOT NULL,
	rowversion bytea NOT NULL,
  CONSTRAINT pk_addressbookrecord PRIMARY KEY (id)
  USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace} 
)
WITH (
  OIDS=FALSE
)
TABLESPACE ${iwsPostgresTablesTablespace};
 
CREATE TABLE ${iwsPostgresSchema}.person_internaluser(
	id char(36) NOT NULL,
	userid varchar(128) NOT NULL,
	rowversion bytea NOT NULL,
	jobtitle varchar(256) NOT NULL,
	competentauthority int NOT NULL,
	localareaid char(36) NOT NULL,
	status int NOT NULL,
  CONSTRAINT pk_internaluser PRIMARY KEY (id) 
  USING INDEX TABLESPACE ${iwsPostgresIndexesTablespace}
)
WITH (
  OIDS=FALSE
)
TABLESPACE ${iwsPostgresTablesTablespace};
 
CREATE TABLE ${iwsPostgresSchema}.reports_freedomofinformationcache(
	notificationnumber varchar(4000) NULL,
	importorexport varchar(6) NOT NULL,
	isinterim boolean NULL,
	receiveddate date NULL,
	competentauthorityid int NOT NULL,
	notifiername varchar(3000) NOT NULL,
	notifieraddress text NULL,
	notifierpostalcode varchar(64) NULL,
	producername varchar(3000) NOT NULL,
	produceraddress text NULL,
	producerpostalcode varchar(64) NULL,
	pointofexport varchar(2048) NOT NULL,
	pointofentry varchar(2048) NOT NULL,
	importcountryname varchar(2048) NOT NULL,
	chemicalcompositiontypeid int NOT NULL,
	nameofwaste varchar(264) NULL,
	ewc text NULL,
	ycode text NULL,
	hcode text NULL,
	operationcodes text NULL,
	importername varchar(3000) NOT NULL,
	importeraddress text NULL,
	importerpostalcode varchar(64) NULL,
	facilityname varchar(3000) NOT NULL,
	facilityaddress text NULL,
	facilitypostalcode varchar(64) NULL,
	intendedquantity decimal(18, 4) NOT NULL,
	intendedquantityunit varchar(64) NOT NULL,
	intendedquantityunitid int NOT NULL,
	consentfrom date NULL,
	consentto date NULL,
	localarea varchar(1024) NULL,
	movementnumber int NULL,
	movementreceiveddate date NULL,
	movementcompleteddate date NULL,
	movementquantityreceviedunitid int NULL,
	movementquantityreceived decimal(18, 4) NULL,
	baseloecdcode text NOT NULL,
	exportcountryname varchar(2048) NOT NULL
)
WITH (
  OIDS=FALSE
)
TABLESPACE ${iwsPostgresTablesTablespace};
 
CREATE TABLE ${iwsPostgresSchema}.reports_shipmentscache(
	notificationid char(36) NOT NULL,
	notificationnumber varchar(4000) NULL,
	competentauthorityid int NOT NULL,
	exporter varchar(3000) NOT NULL,
	importer varchar(3000) NOT NULL,
	facility varchar(3000) NOT NULL,
	shipmentnumber int NOT NULL,
	actualdateofshipment date NULL,
	consentfrom date NULL,
	consentto date NULL,
	prenotificationdate date NULL,
	receiveddate date NULL,
	completeddate date NULL,
	quantityreceived decimal(18, 4) NULL,
	quantityreceivedunit varchar(64) NULL,
	quantityreceivedunitid int NULL,
	chemicalcomposition text NULL,
	localarea varchar(1024) NULL,
	totalquantity decimal(18, 4) NOT NULL,
	totalquantityunits varchar(64) NOT NULL,
	totalquantityunitsid int NOT NULL,
	entryport varchar(2048) NULL,
	destinationcountry varchar(2048) NULL,
	exitport varchar(2048) NULL,
	originatingcountry varchar(2048) NULL,
	status varchar(64) NULL,
	notificationreceiveddate date NULL,
	ewccodes text NULL,
	importorexport varchar(6) NOT NULL,
	baseloecdcode text NULL,
	operationcodes text NULL,
	ycode text NULL,
	hcode text NULL,
	unclass text NULL,
	chemicalcompositiontypeid int NULL
)
WITH (
  OIDS=FALSE
)
TABLESPACE ${iwsPostgresTablesTablespace};

/****** object:  index ix_usd_dateapplied     ******/
CREATE INDEX ix_usd_dateapplied ON ${iwsPostgresSchema}.usd_applieddatabasescript
USING btree
(
	dateapplied 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_fk_draft_import_importnotifcation     ******/
CREATE INDEX ix_fk_draft_import_importnotifcation ON ${iwsPostgresSchema}.draft_import
USING btree
(
	importnotificationid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};
 
/****** object:  index rolenameindex     ******/
create UNIQUE index rolenameindex ON ${iwsPostgresSchema}.identity_aspnetroles
USING btree
(
	name 
)
TABLESPACE ${iwsPostgresIndexesTablespace};
 
/****** object:  index ix_userid     ******/
CREATE INDEX ix_claim_userid ON ${iwsPostgresSchema}.identity_aspnetuserclaims
USING btree
(
	userid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};
 
/****** object:  index ix_userid     ******/
CREATE INDEX ix_login_userid ON ${iwsPostgresSchema}.identity_aspnetuserlogins
(
	userid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};
 
/****** object:  index ix_roleid     ******/
CREATE INDEX ix_roleid ON ${iwsPostgresSchema}.identity_aspnetuserroles
(
	roleid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};
 
/****** object:  index ix_userid     ******/
CREATE INDEX ix_role_userid ON ${iwsPostgresSchema}.identity_aspnetuserroles
USING btree
(
	userid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};
 
/****** object:  index ix_importconsent_notificationid     ******/
CREATE INDEX ix_importconsent_notificationid ON ${iwsPostgresSchema}.importnotification_consent
USING btree
(
	notificationid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_importconsultation_localareaid     ******/
CREATE INDEX ix_importconsultation_localareaid ON ${iwsPostgresSchema}.importnotification_consultation
USING btree
(
	localareaid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_importconsultation_notificationid     ******/
CREATE INDEX ix_importconsultation_notificationid ON ${iwsPostgresSchema}.importnotification_consultation
USING btree
(
	notificationid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_fk_importnotificationexporter_country     ******/
CREATE INDEX ix_fk_importnotificationexporter_country ON ${iwsPostgresSchema}.importnotification_exporter
USING btree
(
	countryid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_importexporter_notificationid     ******/
CREATE INDEX ix_importexporter_notificationid ON ${iwsPostgresSchema}.importnotification_exporter
USING btree
(
	importnotificationid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_fk_importnotificationfacility_businesstype     ******/
CREATE INDEX ix_fk_importnotificationfacility_businesstype ON ${iwsPostgresSchema}.importnotification_facility
USING btree
(
	type 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_fk_importnotificationfacility_country     ******/
CREATE INDEX ix_fk_importnotificationfacility_country ON ${iwsPostgresSchema}.importnotification_facility
USING btree
(
	countryid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_importfacility_facilitycollectionid     ******/
CREATE INDEX ix_importfacility_facilitycollectionid ON ${iwsPostgresSchema}.importnotification_facility
USING btree
(
	facilitycollectionid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_importfacilitycollection_notificationid     ******/
CREATE INDEX ix_importfacilitycollection_notificationid ON ${iwsPostgresSchema}.importnotification_facilitycollection
USING btree
(
	importnotificationid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_fk_importnotification_financialguarantee_financialguaranteestatus     ******/
CREATE INDEX ix_fk_importnotification_financialguarantee_status ON ${iwsPostgresSchema}.importnotification_financialguarantee
USING btree
(
	status 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_fk_importnotification_financialguarantee_importnotification     ******/
CREATE INDEX ix_fk_importnotification_financialguarantee_notification ON ${iwsPostgresSchema}.importnotification_financialguarantee
USING btree
(
	importnotificationid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_fk_importnotification_financialguaranteeapproval_notification     ******/
CREATE INDEX ix_fk_importnotification_financialguaranteeappr_notification ON ${iwsPostgresSchema}.importnotification_financialguaranteeapproval
USING btree
(
	importnotificationid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_fk_importnotification_financialguaranteerefusal_importnotification     ******/
CREATE INDEX ix_fk_importnotification_financialguaranteerefusal_notification ON ${iwsPostgresSchema}.importnotification_financialguaranteerefusal
USING btree
(
	importnotificationid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_fk_importnotification_financialguaranteerelease_importnotification     ******/
CREATE INDEX ix_fk_importnotification_financialguaranteerelease_notification ON ${iwsPostgresSchema}.importnotification_financialguaranteerelease
USING btree
(
	importnotificationid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_fk_importnotification_financialguaranteestatuschange_destination     ******/
CREATE INDEX ix_fk_importnotification_financialguaranteestatuschange_dest ON ${iwsPostgresSchema}.importnotification_financialguaranteestatuschange
USING btree
(
	destination 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_fk_importnotification_financialguaranteestatuschange_source     ******/
CREATE INDEX ix_fk_importnotification_financialguaranteestatuschange_source ON ${iwsPostgresSchema}.importnotification_financialguaranteestatuschange
USING btree
(
	source 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_fk_importnotificationimporter_businesstype     ******/
CREATE INDEX ix_fk_importnotificationimporter_businesstype ON ${iwsPostgresSchema}.importnotification_importer
USING btree
(
	type 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_fk_importnotificationimporter_country     ******/
CREATE INDEX ix_fk_importnotificationimporter_country ON ${iwsPostgresSchema}.importnotification_importer
USING btree
(
	countryid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_importimporter_notificationid     ******/
CREATE INDEX ix_importimporter_notificationid ON ${iwsPostgresSchema}.importnotification_importer
USING btree
(
	importnotificationid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_fk_interimstatus_importnotification     ******/
CREATE INDEX ix_fk_interimstatus_importnotification ON ${iwsPostgresSchema}.importnotification_interimstatus
USING btree
(
	importnotificationid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_importmovement_notificationid     ******/
CREATE INDEX ix_importmovement_notificationid ON ${iwsPostgresSchema}.importnotification_movement
USING btree
(
	notificationid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_importmovement_notificationid_2     ******/
CREATE INDEX ix_importmovement_notificationid_2 ON ${iwsPostgresSchema}.importnotification_movement
USING btree
(
	notificationid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_importmovementoperationreceipt_movementid     ******/
CREATE INDEX ix_importmovementoperationreceipt_movementid ON ${iwsPostgresSchema}.importnotification_movementoperationreceipt
(
	movementid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_fk_importmovementreceipt_shipmentquantity     ******/
CREATE INDEX ix_fk_importmovementreceipt_shipmentquantity ON ${iwsPostgresSchema}.importnotification_movementreceipt
USING btree
(
	unit 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_importmovementreceipt_movementid     ******/
CREATE INDEX ix_importmovementreceipt_movementid ON ${iwsPostgresSchema}.importnotification_movementreceipt
USING btree
(
	movementid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_importmovementrejection_movementid     ******/
CREATE INDEX ix_importmovementrejection_movementid ON ${iwsPostgresSchema}.importnotification_movementrejection
USING btree
(
	movementid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_fk_importnotification_notificationtype     ******/
CREATE INDEX ix_fk_importnotification_notificationtype ON ${iwsPostgresSchema}.importnotification_notification
USING btree
(
	notificationtype 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_fk_importnotification_ukcompetentauthority     ******/
CREATE INDEX ix_fk_importnotification_ukcompetentauthority ON ${iwsPostgresSchema}.importnotification_notification
USING btree
(
	competentauthority 
)
TABLESPACE ${iwsPostgresIndexesTablespace};
 
/****** object:  index ix_importnotification_competentauthority     ******/
CREATE INDEX ix_importnotification_competentauthority ON ${iwsPostgresSchema}.importnotification_notification
USING btree
(
	competentauthority 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_fk_importnotificationassessment_status     ******/
CREATE INDEX ix_fk_importnotificationassessment_status ON ${iwsPostgresSchema}.importnotification_notificationassessment
USING btree
(
	status 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_importnotificationassessment_notificationid     ******/
CREATE INDEX ix_importnotificationassessment_notificationid ON ${iwsPostgresSchema}.importnotification_notificationassessment
USING btree
(
	notificationapplicationid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_importnotificationdates_notificationassessmentid     ******/
CREATE INDEX ix_importnotificationdates_notificationassessmentid ON ${iwsPostgresSchema}.importnotification_notificationdates
USING btree
(
	notificationassessmentid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_fk_importnotificationstatuschange_notificationassessment     ******/
CREATE INDEX ix_fk_importnotificationstatuschange_notificationassessment ON ${iwsPostgresSchema}.importnotification_notificationstatuschange
USING btree
(
	notificationassessmentid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};
 
/****** object:  index ix_fk_importnotificationstatuschange_user     ******/
CREATE INDEX ix_fk_importnotificationstatuschange_user ON ${iwsPostgresSchema}.importnotification_notificationstatuschange
USING btree
(
	userid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_importnotificationstatuschange_notificationassessmentid     ******/
CREATE INDEX ix_importnotificationstatuschange_notificationassessmentid ON ${iwsPostgresSchema}.importnotification_notificationstatuschange
USING btree
(
	notificationassessmentid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_fk_importshipmentnumberhistory_importnotification     ******/
CREATE INDEX ix_fk_importshipmentnumberhistory_importnotification ON ${iwsPostgresSchema}.importnotification_numberofshipmentshistory
USING btree
(
	importnotificationid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_fk_objection_importnotification     ******/
CREATE INDEX ix_fk_objection_importnotification ON ${iwsPostgresSchema}.importnotification_objection
USING btree
(
	notificationid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_fk_importnotificationoperationcodes_operationcode     ******/
CREATE INDEX ix_fk_importnotificationoperationcodes_operationcode ON ${iwsPostgresSchema}.importnotification_operationcodes
USING btree
(
	operationcode 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_fk_importnotificationoperationcodes_wasteoperation     ******/
CREATE INDEX ix_fk_importnotificationoperationcodes_wasteoperation ON ${iwsPostgresSchema}.importnotification_operationcodes
USING btree
(
	wasteoperationid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_fk_importnotificationproducer_country     ******/
CREATE INDEX ix_fk_importnotificationproducer_country ON ${iwsPostgresSchema}.importnotification_producer
USING btree
(
	countryid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_importproducer_notificationid     ******/
CREATE INDEX ix_importproducer_notificationid ON ${iwsPostgresSchema}.importnotification_producer
USING btree
(
	importnotificationid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_fk_importshipmentnotification_units     ******/
CREATE INDEX ix_fk_importshipmentnotification_units ON ${iwsPostgresSchema}.importnotification_shipment
USING btree
(
	units 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_importshipment_importnotificationid     ******/
CREATE INDEX ix_importshipment_importnotificationid ON ${iwsPostgresSchema}.importnotification_shipment
USING btree
(
	importnotificationid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_fk_importnotificationstateofexport_competentauthority     ******/
CREATE INDEX ix_fk_importnotificationstateofexport_competentauthority ON ${iwsPostgresSchema}.importnotification_stateofexport
USING btree
(
	competentauthorityid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_fk_importnotificationstateofexport_country     ******/
CREATE INDEX ix_fk_importnotificationstateofexport_country ON ${iwsPostgresSchema}.importnotification_stateofexport
USING btree
(
	countryid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_fk_importnotificationstateofexport_exitpoint     ******/
CREATE INDEX ix_fk_importnotificationstateofexport_exitpoint ON ${iwsPostgresSchema}.importnotification_stateofexport
USING btree
(
	exitpointid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_fk_importnotificationstateofexport_transportroute     ******/
CREATE INDEX ix_fk_importnotificationstateofexport_transportroute ON ${iwsPostgresSchema}.importnotification_stateofexport
USING btree
(
	transportrouteid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_fk_importnotificationstateofimport_competentauthority     ******/
CREATE INDEX ix_fk_importnotificationstateofimport_competentauthority ON ${iwsPostgresSchema}.importnotification_stateofimport
USING btree
(
	competentauthorityid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_fk_importnotificationstateofimport_entrypoint     ******/
CREATE INDEX ix_fk_importnotificationstateofimport_entrypoint ON ${iwsPostgresSchema}.importnotification_stateofimport
USING btree
(
	entrypointid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_fk_importnotificationstateofimport_transportroute     ******/
CREATE INDEX ix_fk_importnotificationstateofimport_transportroute ON ${iwsPostgresSchema}.importnotification_stateofimport
USING btree
(
	transportrouteid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_fk_importtransaction_paymentmethod     ******/
CREATE INDEX ix_fk_importtransaction_paymentmethod ON ${iwsPostgresSchema}.importnotification_transaction
USING btree
(
	paymentmethod 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_fk_transaction_importnotification     ******/
CREATE INDEX ix_fk_transaction_importnotification ON ${iwsPostgresSchema}.importnotification_transaction
USING btree
(
	notificationid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_fk_importnotificationtransitstate_competentauthority     ******/
CREATE INDEX ix_fk_importnotificationtransitstate_competentauthority ON ${iwsPostgresSchema}.importnotification_transitstate
USING btree
(
	competentauthorityid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_fk_importnotificationtransitstate_country     ******/
CREATE INDEX ix_fk_importnotificationtransitstate_country ON ${iwsPostgresSchema}.importnotification_transitstate
USING btree
(
	countryid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_fk_importnotificationtransitstate_entrypoint     ******/
CREATE INDEX ix_fk_importnotificationtransitstate_entrypoint ON ${iwsPostgresSchema}.importnotification_transitstate
USING btree
(
	entrypointid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_fk_importnotificationtransitstate_exitpoint     ******/
CREATE INDEX ix_fk_importnotificationtransitstate_exitpoint ON ${iwsPostgresSchema}.importnotification_transitstate
USING btree
(
	exitpointid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_fk_importnotificationtransitstate_transportroute     ******/
CREATE INDEX ix_fk_importnotificationtransitstate_transportroute ON ${iwsPostgresSchema}.importnotification_transitstate
USING btree
(
	transportrouteid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_fk_importnotificationtransportroute_importnotification     ******/
CREATE INDEX ix_fk_importnotificationtransportroute_importnotification ON ${iwsPostgresSchema}.importnotification_transportroute
USING btree
(
	importnotificationid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_fk_importnotificationwastecode_importnotificationwastetype     ******/
CREATE INDEX ix_fk_importnotificationwastecode_importnotificationwastetype ON ${iwsPostgresSchema}.importnotification_wastecode
USING btree
(
	wastetypeid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_fk_importnotificationwastecode_lookupwastecode     ******/
CREATE INDEX ix_fk_importnotificationwastecode_lookupwastecode ON ${iwsPostgresSchema}.importnotification_wastecode
USING btree
(
	wastecodeid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_fk_importnotificationwasteoperation_importnotification     ******/
CREATE INDEX ix_fk_importnotificationwasteoperation_importnotification ON ${iwsPostgresSchema}.importnotification_wasteoperation
USING btree
(
	importnotificationid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_fk_importnotificationwastetype_chemicalcompositiontype     ******/
CREATE INDEX ix_fk_importnotificationwastetype_chemicalcompositiontype ON ${iwsPostgresSchema}.importnotification_wastetype
USING btree
(
	chemicalcompositiontype 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_fk_importnotificationwastetype_importnotification     ******/
CREATE INDEX ix_fk_importnotificationwastetype_importnotification ON ${iwsPostgresSchema}.importnotification_wastetype
USING btree
(
	importnotificationid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_fk_withdrawn_importnotification     ******/
CREATE INDEX ix_fk_withdrawn_importnotification ON ${iwsPostgresSchema}.importnotification_withdrawn
USING btree
(
	notificationid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};
 
/****** object:  index ix_elmah_error_app_time_seq     ******/
CREATE INDEX ix_elmah_error_app_time_seq ON ${iwsPostgresSchema}.logging_elmah_error
USING btree
(
	application ,
	timeutc desc,
	sequence desc
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_fk_competentauthorityid_ukcompetentauthority     ******/
CREATE INDEX ix_fk_competentauthorityid_ukcompetentauthority ON ${iwsPostgresSchema}.lookup_localarea
USING btree
(
	competentauthorityid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_fk_pricingstructure_activity     ******/
CREATE INDEX ix_fk_pricingstructure_activity ON ${iwsPostgresSchema}.lookup_pricingstructure
USING btree
(
	activityid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_fk_pricingstructure_shipmentquantityrange     ******/
CREATE INDEX ix_fk_pricingstructure_shipmentquantityrange ON ${iwsPostgresSchema}.lookup_pricingstructure
USING btree
(
	shipmentquantityrangeid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_unitedkingdomcompetentauthority_competentauthority     ******/
CREATE INDEX ix_unitedkingdomcompetentauthority_competentauthority ON ${iwsPostgresSchema}.lookup_unitedkingdomcompetentauthority
USING btree
(
	competentauthorityid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_fk_wastecode_codetype     ******/
CREATE INDEX ix_fk_wastecode_codetype ON ${iwsPostgresSchema}.lookup_wastecode
USING btree
(
	codetype 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_fk_annexcollection_notificationid     ******/
CREATE INDEX ix_fk_annexcollection_notificationid ON ${iwsPostgresSchema}.notification_annexcollection
USING btree
(
	notificationid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_fk_annexcollection_processofgeneration     ******/
CREATE INDEX ix_fk_annexcollection_processofgeneration ON ${iwsPostgresSchema}.notification_annexcollection
USING btree
(
	processofgenerationid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_fk_annexcollection_technologyemployed     ******/
CREATE INDEX ix_fk_annexcollection_technologyemployed ON ${iwsPostgresSchema}.notification_annexcollection
USING btree
(
	technologyemployedid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_fk_annexcollection_wastecomposition     ******/
CREATE INDEX ix_fk_annexcollection_wastecomposition ON ${iwsPostgresSchema}.notification_annexcollection
USING btree
(
	wastecompositionid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_carrier_carriercollectionid     ******/
CREATE INDEX ix_carrier_carriercollectionid ON ${iwsPostgresSchema}.notification_carrier
USING btree
(
	carriercollectionid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_fk_carrier_businesstype     ******/
CREATE INDEX ix_fk_carrier_businesstype ON ${iwsPostgresSchema}.notification_carrier
USING btree
(
	type 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_fk_notificationcarrier_carriercollection     ******/
CREATE INDEX ix_fk_notificationcarrier_carriercollection ON ${iwsPostgresSchema}.notification_carrier
USING btree
(
	carriercollectionid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_fk_notificationcarriercollection_notification     ******/
CREATE INDEX ix_fk_notificationcarriercollection_notification ON ${iwsPostgresSchema}.notification_carriercollection
USING btree
(
	notificationid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_consent_notificationid     ******/
CREATE INDEX ix_consent_notificationid ON ${iwsPostgresSchema}.notification_consent
USING btree
(
	notificationapplicationid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_consultation_localareaid     ******/
CREATE INDEX ix_consultation_localareaid ON ${iwsPostgresSchema}.notification_consultation
USING btree
(
	localareaid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_consultation_notificationid     ******/
CREATE INDEX ix_consultation_notificationid ON ${iwsPostgresSchema}.notification_consultation
USING btree
(
	notificationid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_fk_disposalinfo_notification     ******/
CREATE INDEX ix_fk_disposalinfo_notification ON ${iwsPostgresSchema}.notification_disposalinfo
USING btree
(
	notificationid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_fk_entrycustomsoffice_country     ******/
CREATE INDEX ix_fk_entrycustomsoffice_country ON ${iwsPostgresSchema}.notification_entrycustomsoffice
USING btree
(
	countryid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_fk_entrycustomsoffice_transportroute     ******/
CREATE INDEX ix_fk_entrycustomsoffice_transportroute ON ${iwsPostgresSchema}.notification_entrycustomsoffice
USING btree
(
	transportrouteid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_entryorexitpoint_country     ******/
CREATE INDEX ix_entryorexitpoint_country ON ${iwsPostgresSchema}.notification_entryorexitpoint
USING btree
(
	countryid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_fk_exitcustomsoffice_country     ******/
CREATE INDEX ix_fk_exitcustomsoffice_country ON ${iwsPostgresSchema}.notification_exitcustomsoffice
USING btree
(
	countryid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_fk_exitcustomsoffice_transportroute     ******/
CREATE INDEX ix_fk_exitcustomsoffice_transportroute ON ${iwsPostgresSchema}.notification_exitcustomsoffice
USING btree
(
	transportrouteid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_exporter_notificationid     ******/
CREATE INDEX ix_exporter_notificationid ON ${iwsPostgresSchema}.notification_exporter
USING btree
(
	notificationid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_fk_exporter_businesstype     ******/
CREATE INDEX ix_fk_exporter_businesstype ON ${iwsPostgresSchema}.notification_exporter
USING btree
(
	type 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_facility_facilitycollectionid     ******/
CREATE INDEX ix_facility_facilitycollectionid ON ${iwsPostgresSchema}.notification_facility
USING btree
(
	facilitycollectionid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_fk_facility_businesstype     ******/
CREATE INDEX ix_fk_facility_businesstype ON ${iwsPostgresSchema}.notification_facility
USING btree
(
	type 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_facilitycollection_notificationid     ******/
CREATE INDEX ix_facilitycollection_notificationid ON ${iwsPostgresSchema}.notification_facilitycollection
USING btree
(
	notificationid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_fk_financialguarantee_financialguaranteedecision     ******/
CREATE INDEX ix_fk_financialguarantee_financialguaranteedecision ON ${iwsPostgresSchema}.notification_financialguarantee
USING btree
(
	decision 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_fk_financialguarantee_financialguaranteestatus     ******/
CREATE INDEX ix_fk_financialguarantee_financialguaranteestatus ON ${iwsPostgresSchema}.notification_financialguarantee
USING btree
(
	status 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_fk_notificationfinancialguarantee_collection     ******/
CREATE INDEX ix_fk_notificationfinancialguarantee_financialguaranteecoll ON ${iwsPostgresSchema}.notification_financialguarantee
USING btree
(
	financialguaranteecollectionid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_fk_financialguaranteecollection_notification     ******/
CREATE INDEX ix_fk_financialguaranteecollection_notification ON ${iwsPostgresSchema}.notification_financialguaranteecollection
USING btree
(
	notificationid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_financialguaranteestatuschange_changedate     ******/
CREATE INDEX ix_financialguaranteestatuschange_changedate ON ${iwsPostgresSchema}.notification_financialguaranteestatuschange
USING btree
(
	changedate 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_financialguaranteestatuschange_financialguaranteeid     ******/
CREATE INDEX ix_financialguaranteestatuschange_financialguaranteeid ON ${iwsPostgresSchema}.notification_financialguaranteestatuschange
USING btree
(
	financialguaranteeid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_fk_financialguaranteestatuschange_financialguaranteestatus     ******/
CREATE INDEX ix_fk_financialguaranteestatuschange_financialguaranteestatus ON ${iwsPostgresSchema}.notification_financialguaranteestatuschange
USING btree
(
	status 
)
TABLESPACE ${iwsPostgresIndexesTablespace};
 
/****** object:  index ix_fk_financialguaranteestatuschange_user     ******/
CREATE INDEX ix_fk_financialguaranteestatuschange_user ON ${iwsPostgresSchema}.notification_financialguaranteestatuschange
USING btree
(
	userid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_fk_importer_businesstype     ******/
CREATE INDEX ix_fk_importer_businesstype ON ${iwsPostgresSchema}.notification_importer
USING btree
(
	type 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_importer_notificationid     ******/
CREATE INDEX ix_importer_notificationid ON ${iwsPostgresSchema}.notification_importer
USING btree
(
	notificationid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_fk_notificationmeansoftransport_notification     ******/
CREATE INDEX ix_fk_notificationmeansoftransport_notification ON ${iwsPostgresSchema}.notification_meansoftransport
USING btree
(
	notificationid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_fk_movement_movementstatus     ******/
CREATE INDEX ix_fk_movement_movementstatus ON ${iwsPostgresSchema}.notification_movement
USING btree
(
	status 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

 /****** object:  index ix_fk_notificationmovement_user     ******/
CREATE INDEX ix_fk_notificationmovement_user ON ${iwsPostgresSchema}.notification_movement
(
	createdby 
)
TABLESPACE ${iwsPostgresIndexesTablespace};
 
/****** object:  index ix_movement_date_prenotificationdate     ******/
CREATE INDEX ix_movement_date_prenotificationdate ON ${iwsPostgresSchema}.notification_movement
USING btree
(
	date ,
	prenotificationdate 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_movement_notificationid     ******/
CREATE INDEX ix_movement_notificationid ON ${iwsPostgresSchema}.notification_movement
USING btree
(
	notificationid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};
/****** object:  index ix_movement_notificationid_2     ******/
CREATE INDEX ix_movement_notificationid_2 ON ${iwsPostgresSchema}.notification_movement
(
	notificationid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_movement_notificationid_3     ******/
CREATE INDEX ix_movement_notificationid_3 ON ${iwsPostgresSchema}.notification_movement
USING btree
(
	notificationid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_fk_movementcarrier_carrier     ******/
CREATE INDEX ix_fk_movementcarrier_carrier ON ${iwsPostgresSchema}.notification_movementcarrier
USING btree
(
	carrierid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_fk_movementcarrier_movementdetails     ******/
CREATE INDEX ix_fk_movementcarrier_movementdetails ON ${iwsPostgresSchema}.notification_movementcarrier
USING btree
(
	movementdetailsid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_fk_movementdatehistory_movement     ******/
CREATE INDEX ix_fk_movementdatehistory_movement ON ${iwsPostgresSchema}.notification_movementdatehistory
USING btree
(
	movementid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_fk_movementdetails_shipmentquantityunit     ******/
CREATE INDEX ix_fk_movementdetails_shipmentquantityunit ON ${iwsPostgresSchema}.notification_movementdetails
USING btree
(
	unit 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_movementdetails_movementid     ******/
CREATE INDEX ix_movementdetails_movementid ON ${iwsPostgresSchema}.notification_movementdetails
USING btree
(
	movementid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};
 
/****** object:  index ix_fk_notificationmovementoperationreceipt_user     ******/
CREATE INDEX ix_fk_notificationmovementoperationreceipt_user ON ${iwsPostgresSchema}.notification_movementoperationreceipt
USING btree
(
	createdby 
)
TABLESPACE ${iwsPostgresIndexesTablespace};
 
/****** object:  index ix_movementoperationreceipt_createdby     ******/
CREATE INDEX ix_movementoperationreceipt_createdby ON ${iwsPostgresSchema}.notification_movementoperationreceipt
USING btree
(
	createdby 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_movementoperationreceipt_movementid     ******/
CREATE INDEX ix_movementoperationreceipt_movementid ON ${iwsPostgresSchema}.notification_movementoperationreceipt
USING btree
(
	movementid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_fk_movementreceipt_decision     ******/
CREATE INDEX ix_fk_movementreceipt_decision ON ${iwsPostgresSchema}.notification_movementreceipt
USING btree
(
	decision 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_fk_movementreceipt_shipmentquantityunit     ******/
CREATE INDEX ix_fk_movementreceipt_shipmentquantityunit ON ${iwsPostgresSchema}.notification_movementreceipt
USING btree
(
	unit 
)
TABLESPACE ${iwsPostgresIndexesTablespace};
 
/****** object:  index ix_fk_notificationmovementreceipt_user     ******/
CREATE INDEX ix_fk_notificationmovementreceipt_user ON ${iwsPostgresSchema}.notification_movementreceipt
USING btree
(
	createdby 
)
TABLESPACE ${iwsPostgresIndexesTablespace};
 
/****** object:  index ix_movementreceipt_createdby     ******/
CREATE INDEX ix_movementreceipt_createdby ON ${iwsPostgresSchema}.notification_movementreceipt
USING btree
(
	createdby 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_movementreceipt_movementid     ******/
CREATE INDEX ix_movementreceipt_movementid ON ${iwsPostgresSchema}.notification_movementreceipt
USING btree
(
	movementid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_movementrejection_movementid     ******/
CREATE INDEX ix_movementrejection_movementid ON ${iwsPostgresSchema}.notification_movementrejection
USING btree
(
	movementid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_fk_movementstatuschange_movement     ******/
CREATE INDEX ix_fk_movementstatuschange_movement ON ${iwsPostgresSchema}.notification_movementstatuschange
USING btree
(
	movementid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_fk_movementstatuschange_status     ******/
CREATE INDEX ix_fk_movementstatuschange_status ON ${iwsPostgresSchema}.notification_movementstatuschange
USING btree
(
	status 
)
TABLESPACE ${iwsPostgresIndexesTablespace};
 
/****** object:  index ix_fk_movementstatuschange_user     ******/
CREATE INDEX ix_fk_movementstatuschange_user ON ${iwsPostgresSchema}.notification_movementstatuschange
USING btree
(
	userid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_fk_notificationassessment_status     ******/
CREATE INDEX ix_fk_notificationassessment_status ON ${iwsPostgresSchema}.notification_notificationassessment
USING btree
(
	status 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_notificationassessment_notificationid     ******/
CREATE INDEX ix_notificationassessment_notificationid ON ${iwsPostgresSchema}.notification_notificationassessment
USING btree
(
	notificationapplicationid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_notificationdates_notificationassessmentid     ******/
CREATE INDEX ix_notificationdates_notificationassessmentid ON ${iwsPostgresSchema}.notification_notificationdates
USING btree
(
	notificationassessmentid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_fk_notificationstatuschange_notificationassessment     ******/
CREATE INDEX ix_fk_notificationstatuschange_notificationassessment ON ${iwsPostgresSchema}.notification_notificationstatuschange
USING btree
(
	notificationassessmentid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_fk_notificationstatuschange_status     ******/
CREATE INDEX ix_fk_notificationstatuschange_status ON ${iwsPostgresSchema}.notification_notificationstatuschange
USING btree
(
	status 
)
TABLESPACE ${iwsPostgresIndexesTablespace};
 
/****** object:  index ix_fk_notificationstatuschange_user     ******/
CREATE INDEX ix_fk_notificationstatuschange_user ON ${iwsPostgresSchema}.notification_notificationstatuschange
USING btree
(
	userid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_notificationstatuschange_notificationassessmentid     ******/
CREATE INDEX ix_notificationstatuschange_notificationassessmentid ON ${iwsPostgresSchema}.notification_notificationstatuschange
USING btree
(
	notificationassessmentid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_fk_exportshipmentnumberhistory_notification     ******/
CREATE INDEX ix_fk_exportshipmentnumberhistory_notification ON ${iwsPostgresSchema}.notification_numberofshipmentshistory
USING btree
(
	notificationid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_operationcodes_notificationid     ******/
CREATE INDEX ix_operationcodes_notificationid ON ${iwsPostgresSchema}.notification_operationcodes
USING btree
(
	notificationid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_fk_notificationpackaginginfo_packagingtype     ******/
CREATE INDEX ix_fk_notificationpackaginginfo_packagingtype ON ${iwsPostgresSchema}.notification_packaginginfo
USING btree
(
	packagingtype 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_fk_packaginginfo_notification     ******/
CREATE INDEX ix_fk_packaginginfo_notification ON ${iwsPostgresSchema}.notification_packaginginfo
USING btree
(
	notificationid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_fk_notificationphysicalcharacteristicsinfo_physicalchars     ******/
CREATE INDEX ix_fk_notificationphysicalcharacteristicsinfo_physicalchartype ON ${iwsPostgresSchema}.notification_physicalcharacteristicsinfo
USING btree
(
	physicalcharacteristictype 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_fk_physicalcharacteristicsinfo_notification     ******/
CREATE INDEX ix_fk_physicalcharacteristicsinfo_notification ON ${iwsPostgresSchema}.notification_physicalcharacteristicsinfo
USING btree
(
	notificationid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_fk_producer_businesstype     ******/
CREATE INDEX ix_fk_producer_businesstype ON ${iwsPostgresSchema}.notification_producer
USING btree
(
	type 
)
TABLESPACE ${iwsPostgresIndexesTablespace};
 
/****** object:  index ix_producer_issiteofexport     ******/
CREATE INDEX ix_producer_issiteofexport ON ${iwsPostgresSchema}.notification_producer
USING btree
(
	issiteofexport 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_producer_producercollectionid     ******/
CREATE INDEX ix_producer_producercollectionid ON ${iwsPostgresSchema}.notification_producer
USING btree
(
	producercollectionid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_producercollection_notificationid     ******/
CREATE INDEX ix_producercollection_notificationid ON ${iwsPostgresSchema}.notification_producercollection
USING btree
(
	notificationid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_fk_recoveryinfo_notification     ******/
CREATE INDEX ix_fk_recoveryinfo_notification ON ${iwsPostgresSchema}.notification_recoveryinfo
USING btree
(
	notificationid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_shipmentinfo_notificationid     ******/
CREATE INDEX ix_shipmentinfo_notificationid ON ${iwsPostgresSchema}.notification_shipmentinfo
USING btree
(
	notificationid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_fk_stateofexport_competentauthority     ******/
CREATE INDEX ix_fk_stateofexport_competentauthority ON ${iwsPostgresSchema}.notification_stateofexport
USING btree
(
	competentauthorityid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_fk_stateofexport_country     ******/
CREATE INDEX ix_fk_stateofexport_country ON ${iwsPostgresSchema}.notification_stateofexport
USING btree
(
	countryid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_fk_stateofexport_exitpoint     ******/
CREATE INDEX ix_fk_stateofexport_exitpoint ON ${iwsPostgresSchema}.notification_stateofexport
USING btree
(
	exitpointid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_fk_stateofexport_transportroute     ******/
CREATE INDEX ix_fk_stateofexport_transportroute ON ${iwsPostgresSchema}.notification_stateofexport
USING btree
(
	transportrouteid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_fk_stateofimport_competentauthority     ******/
CREATE INDEX ix_fk_stateofimport_competentauthority ON ${iwsPostgresSchema}.notification_stateofimport
USING btree
(
	competentauthorityid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_fk_stateofimport_country     ******/
CREATE INDEX ix_fk_stateofimport_country ON ${iwsPostgresSchema}.notification_stateofimport
USING btree
(
	countryid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_fk_stateofimport_entrypoint     ******/
CREATE INDEX ix_fk_stateofimport_entrypoint ON ${iwsPostgresSchema}.notification_stateofimport
USING btree
(
	entrypointid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_fk_stateofimport_transportroute     ******/
CREATE INDEX ix_fk_stateofimport_transportroute ON ${iwsPostgresSchema}.notification_stateofimport
USING btree
(
	transportrouteid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_fk_technologyemployed_notification     ******/
CREATE INDEX ix_fk_technologyemployed_notification ON ${iwsPostgresSchema}.notification_technologyemployed
USING btree
(
	notificationid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_fk_transaction_notification     ******/
CREATE INDEX ix_fk_transaction_notification ON ${iwsPostgresSchema}.notification_transaction
USING btree
(
	notificationid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_fk_transitstate_competentauthority     ******/
CREATE INDEX ix_fk_transitstate_competentauthority ON ${iwsPostgresSchema}.notification_transitstate
USING btree
(
	competentauthorityid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_fk_transitstate_country     ******/
CREATE INDEX ix_fk_transitstate_country ON ${iwsPostgresSchema}.notification_transitstate
USING btree
(
	countryid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_fk_transitstate_entrypoint     ******/
CREATE INDEX ix_fk_transitstate_entrypoint ON ${iwsPostgresSchema}.notification_transitstate
USING btree
(
	entrypointid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_fk_transitstate_exitpoint     ******/
CREATE INDEX ix_fk_transitstate_exitpoint ON ${iwsPostgresSchema}.notification_transitstate
USING btree
(
	exitpointid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_fk_transitstate_transportroute     ******/
CREATE INDEX ix_fk_transitstate_transportroute ON ${iwsPostgresSchema}.notification_transitstate
USING btree
(
	transportrouteid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_fk_transportroute_notification     ******/
CREATE INDEX ix_fk_transportroute_notification ON ${iwsPostgresSchema}.notification_transportroute
USING btree
(
	notificationid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};
 
/****** object:  index ix_fk_userhistory_currentuser     ******/
CREATE INDEX ix_fk_userhistory_currentuser ON ${iwsPostgresSchema}.notification_userhistory
USING btree
(
	currentuserid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};
 
/****** object:  index ix_fk_userhistory_newuser     ******/
CREATE INDEX ix_fk_userhistory_newuser ON ${iwsPostgresSchema}.notification_userhistory
USING btree
(
	newuserid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_fk_userhistory_notification     ******/
CREATE INDEX ix_fk_userhistory_notification ON ${iwsPostgresSchema}.notification_userhistory
USING btree
(
	notificationid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_fk_notificationwasteadditionalinformation_wasteinfotype     ******/
CREATE INDEX ix_fk_notificationwasteadditionalinformation_wasteinfotype ON ${iwsPostgresSchema}.notification_wasteadditionalinformation
USING btree
(
	wasteinformationtype 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_fk_wasteadditionalinformation_wastetype     ******/
CREATE INDEX ix_fk_wasteadditionalinformation_wastetype ON ${iwsPostgresSchema}.notification_wasteadditionalinformation
USING btree
(
	wastetypeid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_fk_wastecodeinfo_codetype     ******/
CREATE INDEX ix_fk_wastecodeinfo_codetype ON ${iwsPostgresSchema}.notification_wastecodeinfo
USING btree
(
	codetype 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_fk_wastecodeinfo_notification     ******/
CREATE INDEX ix_fk_wastecodeinfo_notification ON ${iwsPostgresSchema}.notification_wastecodeinfo
USING btree
(
	notificationid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_fk_wastecodeinfo_wastecode     ******/
CREATE INDEX ix_fk_wastecodeinfo_wastecode ON ${iwsPostgresSchema}.notification_wastecodeinfo
USING btree
(
	wastecodeid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_wastecodeinfo_notificationid     ******/
CREATE INDEX ix_wastecodeinfo_notificationid ON ${iwsPostgresSchema}.notification_wastecodeinfo
USING btree
(
	notificationid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_wastecodeinfo_notificationid_codetype     ******/
CREATE INDEX ix_wastecodeinfo_notificationid_codetype ON ${iwsPostgresSchema}.notification_wastecodeinfo
USING btree
(
	notificationid ,
	codetype 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_fk_notificationwastecomposition_chemicalcompositiontype     ******/
CREATE INDEX ix_fk_notificationwastecomposition_chemicalcompositiontype ON ${iwsPostgresSchema}.notification_wastecomposition
USING btree
(
	chemicalcompositiontype 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_fk_wastecomposition_wastetype     ******/
CREATE INDEX ix_fk_wastecomposition_wastetype ON ${iwsPostgresSchema}.notification_wastecomposition
USING btree
(
	wastetypeid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_fk_notificationwastetype_chemicalcompositiontype     ******/
CREATE INDEX ix_fk_notificationwastetype_chemicalcompositiontype ON ${iwsPostgresSchema}.notification_wastetype
USING btree
(
	chemicalcompositiontype 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_fk_wastetype_notification     ******/
CREATE INDEX ix_fk_wastetype_notification ON ${iwsPostgresSchema}.notification_wastetype
USING btree
(
	notificationid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_fk_addressbook_addressbookentitytype     ******/
CREATE INDEX ix_fk_addressbook_addressbookentitytype ON ${iwsPostgresSchema}.person_addressbook
USING btree
(
	type 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_fk_addressbookrecord_addressbook     ******/
CREATE INDEX ix_fk_addressbookrecord_addressbook ON ${iwsPostgresSchema}.person_addressbookrecord
USING btree
(
	addressbookid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_fk_addressbookrecord_businesstype     ******/
CREATE INDEX ix_fk_addressbookrecord_businesstype ON ${iwsPostgresSchema}.person_addressbookrecord
USING btree
(
	type 
)
TABLESPACE ${iwsPostgresIndexesTablespace};
 
/****** object:  index ix_fk_internaluser_aspnetusers     ******/
CREATE INDEX ix_fk_internaluser_aspnetusers ON ${iwsPostgresSchema}.person_internaluser
USING btree
(
	userid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_fk_internaluser_internaluserstatus     ******/
CREATE INDEX ix_fk_internaluser_internaluserstatus ON ${iwsPostgresSchema}.person_internaluser
USING btree
(
	status 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

/****** object:  index ix_fk_internaluser_localarea     ******/
CREATE INDEX ix_fk_internaluser_localarea ON ${iwsPostgresSchema}.person_internaluser
USING btree
(
	localareaid 
)
TABLESPACE ${iwsPostgresIndexesTablespace};

ALTER TABLE ${iwsPostgresSchema}.draft_import ADD CONSTRAINT fk_draft_import_importnotifcation FOREIGN KEY(importnotificationid)
REFERENCES ${iwsPostgresSchema}.importnotification_notification (id);

ALTER TABLE ${iwsPostgresSchema}.identity_aspnetuserclaims ADD CONSTRAINT fk_user_aspnetuserclaims_user_aspnetusers_userid FOREIGN KEY(userid)
REFERENCES ${iwsPostgresSchema}.identity_users (id)
ON DELETE CASCADE;

ALTER TABLE ${iwsPostgresSchema}.identity_aspnetuserlogins ADD CONSTRAINT fk_user_aspnetuserlogins_user_aspnetusers_userid FOREIGN KEY(userid)
REFERENCES ${iwsPostgresSchema}.identity_users (id)
ON DELETE CASCADE;

ALTER TABLE ${iwsPostgresSchema}.identity_aspnetuserroles ADD CONSTRAINT fk_user_aspnetuserroles_user_aspnetroles_roleid FOREIGN KEY(roleid)
REFERENCES ${iwsPostgresSchema}.identity_aspnetroles (id)
ON DELETE CASCADE;

ALTER TABLE ${iwsPostgresSchema}.identity_aspnetuserroles ADD CONSTRAINT fk_user_aspnetuserroles_user_aspnetusers_userid FOREIGN KEY(userid)
REFERENCES ${iwsPostgresSchema}.identity_users (id)
ON DELETE CASCADE;

ALTER TABLE ${iwsPostgresSchema}.importnotification_consent ADD CONSTRAINT fk_importconsent_importnotification FOREIGN KEY(notificationid)
REFERENCES ${iwsPostgresSchema}.importnotification_notification (id);

ALTER TABLE ${iwsPostgresSchema}.importnotification_consultation ADD CONSTRAINT fk_import_consultation_import_notification FOREIGN KEY(notificationid)
REFERENCES ${iwsPostgresSchema}.importnotification_notification (id);

ALTER TABLE ${iwsPostgresSchema}.importnotification_consultation ADD CONSTRAINT fk_importnotification_consultation_lookup_localarea FOREIGN KEY(localareaid)
REFERENCES ${iwsPostgresSchema}.lookup_localarea (id);

ALTER TABLE ${iwsPostgresSchema}.importnotification_exporter ADD CONSTRAINT fk_importnotificationexporter_country FOREIGN KEY(countryid)
REFERENCES ${iwsPostgresSchema}.lookup_country (id);

ALTER TABLE ${iwsPostgresSchema}.importnotification_exporter ADD CONSTRAINT fk_importnotificationexporter_importnotification FOREIGN KEY(importnotificationid)
REFERENCES ${iwsPostgresSchema}.importnotification_notification (id);

ALTER TABLE ${iwsPostgresSchema}.importnotification_facility ADD CONSTRAINT fk_importnotificationfacility_businesstype FOREIGN KEY(type)
REFERENCES ${iwsPostgresSchema}.lookup_businesstype (id);

ALTER TABLE ${iwsPostgresSchema}.importnotification_facility ADD CONSTRAINT fk_importnotificationfacility_country FOREIGN KEY(countryid)
REFERENCES ${iwsPostgresSchema}.lookup_country (id);

ALTER TABLE ${iwsPostgresSchema}.importnotification_facility ADD CONSTRAINT fk_importnotificationfacility_facilitycollection FOREIGN KEY(facilitycollectionid)
REFERENCES ${iwsPostgresSchema}.importnotification_facilitycollection (id);

ALTER TABLE ${iwsPostgresSchema}.importnotification_facilitycollection ADD CONSTRAINT fk_importnotificationfacilitycollection_importnotification FOREIGN KEY(importnotificationid)
REFERENCES ${iwsPostgresSchema}.importnotification_notification (id);

ALTER TABLE ${iwsPostgresSchema}.importnotification_financialguarantee ADD CONSTRAINT fk_importnotification_guarantee_financialguaranteestatus FOREIGN KEY(status)
REFERENCES ${iwsPostgresSchema}.lookup_importfinancialguaranteestatus (id);

ALTER TABLE ${iwsPostgresSchema}.importnotification_financialguarantee ADD CONSTRAINT fk_importnotification_financialguarantee_importnotification FOREIGN KEY(importnotificationid)
REFERENCES ${iwsPostgresSchema}.importnotification_notification (id);

ALTER TABLE ${iwsPostgresSchema}.importnotification_financialguaranteeapproval ADD CONSTRAINT fk_importnotification_guaranteeapproval_importnotification FOREIGN KEY(importnotificationid)
REFERENCES ${iwsPostgresSchema}.importnotification_notification (id);

ALTER TABLE ${iwsPostgresSchema}.importnotification_financialguaranteerefusal ADD CONSTRAINT fk_importnotification_guaranteerefusal_importnotification FOREIGN KEY(importnotificationid)
REFERENCES ${iwsPostgresSchema}.importnotification_notification (id);

ALTER TABLE ${iwsPostgresSchema}.importnotification_financialguaranteerelease ADD CONSTRAINT fk_importnotification_guaranteerelease_importnotification FOREIGN KEY(importnotificationid)
REFERENCES ${iwsPostgresSchema}.importnotification_notification (id);

ALTER TABLE ${iwsPostgresSchema}.importnotification_financialguaranteestatuschange ADD CONSTRAINT fk_importnotification_guaranteestatuschange_destination FOREIGN KEY(destination)
REFERENCES ${iwsPostgresSchema}.lookup_financialguaranteestatus (id);

ALTER TABLE ${iwsPostgresSchema}.importnotification_financialguaranteestatuschange ADD CONSTRAINT fk_importnotification_guaranteestatchange_financialguarantee FOREIGN KEY(financialguaranteeid)
REFERENCES ${iwsPostgresSchema}.importnotification_financialguarantee (id);

ALTER TABLE ${iwsPostgresSchema}.importnotification_financialguaranteestatuschange ADD CONSTRAINT fk_importnotification_financialguaranteestatuschange_source FOREIGN KEY(source)
REFERENCES ${iwsPostgresSchema}.lookup_financialguaranteestatus (id);

ALTER TABLE ${iwsPostgresSchema}.importnotification_importer ADD CONSTRAINT fk_importnotificationimporter_businesstype FOREIGN KEY(type)
REFERENCES ${iwsPostgresSchema}.lookup_businesstype (id);

ALTER TABLE ${iwsPostgresSchema}.importnotification_importer ADD CONSTRAINT fk_importnotificationimporter_country FOREIGN KEY(countryid)
REFERENCES ${iwsPostgresSchema}.lookup_country (id);

ALTER TABLE ${iwsPostgresSchema}.importnotification_importer ADD CONSTRAINT fk_importnotificationimporter_importnotification FOREIGN KEY(importnotificationid)
REFERENCES ${iwsPostgresSchema}.importnotification_notification (id);

ALTER TABLE ${iwsPostgresSchema}.importnotification_interimstatus ADD CONSTRAINT fk_interimstatus_importnotification FOREIGN KEY(importnotificationid)
REFERENCES ${iwsPostgresSchema}.importnotification_notification (id);

ALTER TABLE ${iwsPostgresSchema}.importnotification_movement ADD CONSTRAINT fk_importmovement_importnotification FOREIGN KEY(notificationid)
REFERENCES ${iwsPostgresSchema}.importnotification_notification (id);

ALTER TABLE ${iwsPostgresSchema}.importnotification_movementoperationreceipt ADD CONSTRAINT fk_importmovementoperationreceipt_importnotification FOREIGN KEY(movementid)
REFERENCES ${iwsPostgresSchema}.importnotification_movement (id);

ALTER TABLE ${iwsPostgresSchema}.importnotification_movementreceipt ADD CONSTRAINT fk_importmovementreceipt_importnotification FOREIGN KEY(movementid)
REFERENCES ${iwsPostgresSchema}.importnotification_movement (id);

ALTER TABLE ${iwsPostgresSchema}.importnotification_movementreceipt ADD CONSTRAINT fk_importmovementreceipt_shipmentquantity FOREIGN KEY(unit)
REFERENCES ${iwsPostgresSchema}.lookup_shipmentquantityunit (id);

ALTER TABLE ${iwsPostgresSchema}.importnotification_movementrejection ADD CONSTRAINT fk_importmovementrejection_importnotification FOREIGN KEY(movementid)
REFERENCES ${iwsPostgresSchema}.importnotification_movement (id);

ALTER TABLE ${iwsPostgresSchema}.importnotification_notification ADD CONSTRAINT fk_importnotification_notificationtype FOREIGN KEY(notificationtype)
REFERENCES ${iwsPostgresSchema}.lookup_notificationtype (id);

ALTER TABLE ${iwsPostgresSchema}.importnotification_notification ADD CONSTRAINT fk_importnotification_ukcompetentauthority FOREIGN KEY(competentauthority)
REFERENCES ${iwsPostgresSchema}.lookup_unitedkingdomcompetentauthority (id);

ALTER TABLE ${iwsPostgresSchema}.importnotification_notificationassessment ADD CONSTRAINT fk_importnotificationassessment_notificationapplicationid FOREIGN KEY(notificationapplicationid)
REFERENCES ${iwsPostgresSchema}.importnotification_notification (id);

ALTER TABLE ${iwsPostgresSchema}.importnotification_notificationassessment ADD CONSTRAINT fk_importnotificationassessment_status FOREIGN KEY(status)
REFERENCES ${iwsPostgresSchema}.lookup_importnotificationstatus (id);

ALTER TABLE ${iwsPostgresSchema}.importnotification_notificationdates ADD CONSTRAINT fk_importnotificationdates_importnotificationassessment FOREIGN KEY(notificationassessmentid)
REFERENCES ${iwsPostgresSchema}.importnotification_notificationassessment (id);

ALTER TABLE ${iwsPostgresSchema}.importnotification_notificationstatuschange ADD CONSTRAINT fk_importnotificationstatuschange_notificationassessment FOREIGN KEY(notificationassessmentid)
REFERENCES ${iwsPostgresSchema}.importnotification_notificationassessment (id);

ALTER TABLE ${iwsPostgresSchema}.importnotification_notificationstatuschange ADD CONSTRAINT fk_importnotificationstatuschange_user FOREIGN KEY(userid)
REFERENCES ${iwsPostgresSchema}.identity_users (id);

ALTER TABLE ${iwsPostgresSchema}.importnotification_numberofshipmentshistory  ADD CONSTRAINT fk_importshipmentnumberhistory_importnotification FOREIGN KEY(importnotificationid)
REFERENCES ${iwsPostgresSchema}.importnotification_notification (id);

ALTER TABLE ${iwsPostgresSchema}.importnotification_objection  ADD CONSTRAINT fk_objection_importnotification FOREIGN KEY(notificationid)
REFERENCES ${iwsPostgresSchema}.importnotification_notification (id);

ALTER TABLE ${iwsPostgresSchema}.importnotification_operationcodes  ADD CONSTRAINT fk_importnotificationoperationcodes_operationcode FOREIGN KEY(operationcode)
REFERENCES ${iwsPostgresSchema}.lookup_operationcode (id);

ALTER TABLE ${iwsPostgresSchema}.importnotification_operationcodes  ADD CONSTRAINT fk_importnotificationoperationcodes_wasteoperation FOREIGN KEY(wasteoperationid)
REFERENCES ${iwsPostgresSchema}.importnotification_wasteoperation (id);

ALTER TABLE ${iwsPostgresSchema}.importnotification_producer  ADD CONSTRAINT fk_importnotificationproducer_country FOREIGN KEY(countryid)
REFERENCES ${iwsPostgresSchema}.lookup_country (id);

ALTER TABLE ${iwsPostgresSchema}.importnotification_producer  ADD CONSTRAINT fk_importnotificationproducer_importnotification FOREIGN KEY(importnotificationid)
REFERENCES ${iwsPostgresSchema}.importnotification_notification (id);

ALTER TABLE ${iwsPostgresSchema}.importnotification_shipment  ADD CONSTRAINT fk_importnotificationshipment_importnotification FOREIGN KEY(importnotificationid)
REFERENCES ${iwsPostgresSchema}.importnotification_notification (id);

ALTER TABLE ${iwsPostgresSchema}.importnotification_shipment  ADD CONSTRAINT fk_importshipmentnotification_units FOREIGN KEY(units)
REFERENCES ${iwsPostgresSchema}.lookup_shipmentquantityunit (id);

ALTER TABLE ${iwsPostgresSchema}.importnotification_stateofexport  ADD CONSTRAINT fk_importnotificationstateofexport_competentauthority FOREIGN KEY(competentauthorityid)
REFERENCES ${iwsPostgresSchema}.lookup_competentauthority (id);

ALTER TABLE ${iwsPostgresSchema}.importnotification_stateofexport  ADD CONSTRAINT fk_importnotificationstateofexport_country FOREIGN KEY(countryid)
REFERENCES ${iwsPostgresSchema}.lookup_country (id);

ALTER TABLE ${iwsPostgresSchema}.importnotification_stateofexport  ADD CONSTRAINT fk_importnotificationstateofexport_exitpoint FOREIGN KEY(exitpointid)
REFERENCES ${iwsPostgresSchema}.notification_entryorexitpoint (id);

ALTER TABLE ${iwsPostgresSchema}.importnotification_stateofexport  ADD CONSTRAINT fk_importnotificationstateofexport_transportroute FOREIGN KEY(transportrouteid)
REFERENCES ${iwsPostgresSchema}.importnotification_transportroute (id);

ALTER TABLE ${iwsPostgresSchema}.importnotification_stateofimport  ADD CONSTRAINT fk_importnotificationstateofimport_competentauthority FOREIGN KEY(competentauthorityid)
REFERENCES ${iwsPostgresSchema}.lookup_competentauthority (id);

ALTER TABLE ${iwsPostgresSchema}.importnotification_stateofimport  ADD CONSTRAINT fk_importnotificationstateofimport_entrypoint FOREIGN KEY(entrypointid)
REFERENCES ${iwsPostgresSchema}.notification_entryorexitpoint (id);

ALTER TABLE ${iwsPostgresSchema}.importnotification_stateofimport  ADD CONSTRAINT fk_importnotificationstateofimport_transportroute FOREIGN KEY(transportrouteid)
REFERENCES ${iwsPostgresSchema}.importnotification_transportroute (id);

ALTER TABLE ${iwsPostgresSchema}.importnotification_transaction  ADD CONSTRAINT fk_importtransaction_paymentmethod FOREIGN KEY(paymentmethod)
REFERENCES ${iwsPostgresSchema}.lookup_paymentmethod (id);

ALTER TABLE ${iwsPostgresSchema}.importnotification_transaction  ADD CONSTRAINT fk_transaction_importnotification FOREIGN KEY(notificationid)
REFERENCES ${iwsPostgresSchema}.importnotification_notification (id);

ALTER TABLE ${iwsPostgresSchema}.importnotification_transitstate  ADD CONSTRAINT fk_importnotificationtransitstate_competentauthority FOREIGN KEY(competentauthorityid)
REFERENCES ${iwsPostgresSchema}.lookup_competentauthority (id);

ALTER TABLE ${iwsPostgresSchema}.importnotification_transitstate  ADD CONSTRAINT fk_importnotificationtransitstate_country FOREIGN KEY(countryid)
REFERENCES ${iwsPostgresSchema}.lookup_country (id);

ALTER TABLE ${iwsPostgresSchema}.importnotification_transitstate  ADD CONSTRAINT fk_importnotificationtransitstate_entrypoint FOREIGN KEY(entrypointid)
REFERENCES ${iwsPostgresSchema}.notification_entryorexitpoint (id);

ALTER TABLE ${iwsPostgresSchema}.importnotification_transitstate  ADD CONSTRAINT fk_importnotificationtransitstate_exitpoint FOREIGN KEY(exitpointid)
REFERENCES ${iwsPostgresSchema}.notification_entryorexitpoint (id);

ALTER TABLE ${iwsPostgresSchema}.importnotification_transitstate  ADD CONSTRAINT fk_importnotificationtransitstate_transportroute FOREIGN KEY(transportrouteid)
REFERENCES ${iwsPostgresSchema}.importnotification_transportroute (id);

ALTER TABLE ${iwsPostgresSchema}.importnotification_transportroute  ADD CONSTRAINT fk_importnotificationtransportroute_importnotification FOREIGN KEY(importnotificationid)
REFERENCES ${iwsPostgresSchema}.importnotification_notification (id);

ALTER TABLE ${iwsPostgresSchema}.importnotification_wastecode  ADD CONSTRAINT fk_importnotificationwastecode_importnotificationwastetype FOREIGN KEY(wastetypeid)
REFERENCES ${iwsPostgresSchema}.importnotification_wastetype (id);

ALTER TABLE ${iwsPostgresSchema}.importnotification_wastecode  ADD CONSTRAINT fk_importnotificationwastecode_lookupwastecode FOREIGN KEY(wastecodeid)
REFERENCES ${iwsPostgresSchema}.lookup_wastecode (id);

ALTER TABLE ${iwsPostgresSchema}.importnotification_wasteoperation  ADD CONSTRAINT fk_importnotificationwasteoperation_importnotification FOREIGN KEY(importnotificationid)
REFERENCES ${iwsPostgresSchema}.importnotification_notification (id);

ALTER TABLE ${iwsPostgresSchema}.importnotification_wastetype  ADD CONSTRAINT fk_importnotificationwastetype_chemicalcompositiontype FOREIGN KEY(chemicalcompositiontype)
REFERENCES ${iwsPostgresSchema}.lookup_chemicalcompositiontype (id);

ALTER TABLE ${iwsPostgresSchema}.importnotification_wastetype  ADD CONSTRAINT fk_importnotificationwastetype_importnotification FOREIGN KEY(importnotificationid)
REFERENCES ${iwsPostgresSchema}.importnotification_notification (id);

ALTER TABLE ${iwsPostgresSchema}.importnotification_withdrawn  ADD CONSTRAINT fk_withdrawn_importnotification FOREIGN KEY(notificationid)
REFERENCES ${iwsPostgresSchema}.importnotification_notification (id);

ALTER TABLE ${iwsPostgresSchema}.lookup_localarea  ADD CONSTRAINT fk_competentauthorityid_ukcompetentauthority FOREIGN KEY(competentauthorityid)
REFERENCES ${iwsPostgresSchema}.lookup_unitedkingdomcompetentauthority (id);

ALTER TABLE ${iwsPostgresSchema}.lookup_pricingstructure  ADD CONSTRAINT fk_pricingstructure_activity FOREIGN KEY(activityid)
REFERENCES ${iwsPostgresSchema}.lookup_activity (id);

ALTER TABLE ${iwsPostgresSchema}.lookup_pricingstructure  ADD CONSTRAINT fk_pricingstructure_shipmentquantityrange FOREIGN KEY(shipmentquantityrangeid)
REFERENCES ${iwsPostgresSchema}.lookup_shipmentquantityrange (id);

ALTER TABLE ${iwsPostgresSchema}.lookup_unitedkingdomcompetentauthority  ADD CONSTRAINT pk_unitedkingdomcompetentauthority_competentauthority FOREIGN KEY(competentauthorityid)
REFERENCES ${iwsPostgresSchema}.lookup_competentauthority (id);

ALTER TABLE ${iwsPostgresSchema}.lookup_wastecode  ADD CONSTRAINT fk_wastecode_codetype FOREIGN KEY(codetype)
REFERENCES ${iwsPostgresSchema}.lookup_codetype (id);

ALTER TABLE ${iwsPostgresSchema}.notification_annexcollection  ADD CONSTRAINT fk_annexcollection_notificationid FOREIGN KEY(notificationid)
REFERENCES ${iwsPostgresSchema}.notification_notification (id);

ALTER TABLE ${iwsPostgresSchema}.notification_annexcollection  ADD CONSTRAINT fk_annexcollection_processofgeneration FOREIGN KEY(processofgenerationid)
REFERENCES ${iwsPostgresSchema}.filestore_file (id);

ALTER TABLE ${iwsPostgresSchema}.notification_annexcollection  ADD CONSTRAINT fk_annexcollection_technologyemployed FOREIGN KEY(technologyemployedid)
REFERENCES ${iwsPostgresSchema}.filestore_file (id);

ALTER TABLE ${iwsPostgresSchema}.notification_annexcollection  ADD CONSTRAINT fk_annexcollection_wastecomposition FOREIGN KEY(wastecompositionid)
REFERENCES ${iwsPostgresSchema}.filestore_file (id);

ALTER TABLE ${iwsPostgresSchema}.notification_carrier  ADD CONSTRAINT fk_carrier_businesstype FOREIGN KEY(type)
REFERENCES ${iwsPostgresSchema}.lookup_businesstype (id);

ALTER TABLE ${iwsPostgresSchema}.notification_carrier  ADD CONSTRAINT fk_notificationcarrier_carriercollection FOREIGN KEY(carriercollectionid)
REFERENCES ${iwsPostgresSchema}.notification_carriercollection (id);

ALTER TABLE ${iwsPostgresSchema}.notification_carriercollection  ADD CONSTRAINT fk_notificationcarriercollection_notification FOREIGN KEY(notificationid)
REFERENCES ${iwsPostgresSchema}.notification_notification (id);

ALTER TABLE ${iwsPostgresSchema}.notification_consent  ADD CONSTRAINT fk_consent_notification FOREIGN KEY(notificationapplicationid)
REFERENCES ${iwsPostgresSchema}.notification_notification (id);

ALTER TABLE ${iwsPostgresSchema}.notification_consultation  ADD CONSTRAINT fk_notification_consultation_lookup_localarea FOREIGN KEY(localareaid)
REFERENCES ${iwsPostgresSchema}.lookup_localarea (id);

ALTER TABLE ${iwsPostgresSchema}.notification_consultation  ADD CONSTRAINT fk_notification_consultation_notification_notification FOREIGN KEY(notificationid)
REFERENCES ${iwsPostgresSchema}.notification_notification (id);

ALTER TABLE ${iwsPostgresSchema}.notification_disposalinfo  ADD CONSTRAINT fk_disposalinfo_notification FOREIGN KEY(notificationid)
REFERENCES ${iwsPostgresSchema}.notification_notification (id);

ALTER TABLE ${iwsPostgresSchema}.notification_entrycustomsoffice  ADD CONSTRAINT fk_entrycustomsoffice_country FOREIGN KEY(countryid)
REFERENCES ${iwsPostgresSchema}.lookup_country (id);

ALTER TABLE ${iwsPostgresSchema}.notification_entrycustomsoffice  ADD CONSTRAINT fk_entrycustomsoffice_transportroute FOREIGN KEY(transportrouteid)
REFERENCES ${iwsPostgresSchema}.notification_transportroute (id);

ALTER TABLE ${iwsPostgresSchema}.notification_entryorexitpoint  ADD CONSTRAINT fk_entryorexitpoint_country FOREIGN KEY(countryid)
REFERENCES ${iwsPostgresSchema}.lookup_country (id);

ALTER TABLE ${iwsPostgresSchema}.notification_exitcustomsoffice  ADD CONSTRAINT fk_exitcustomsoffice_country FOREIGN KEY(countryid)
REFERENCES ${iwsPostgresSchema}.lookup_country (id);

ALTER TABLE ${iwsPostgresSchema}.notification_exitcustomsoffice  ADD CONSTRAINT fk_exitcustomsoffice_transportroute FOREIGN KEY(transportrouteid)
REFERENCES ${iwsPostgresSchema}.notification_transportroute (id);

ALTER TABLE ${iwsPostgresSchema}.notification_exporter  ADD CONSTRAINT fk_exporter_businesstype FOREIGN KEY(type)
REFERENCES ${iwsPostgresSchema}.lookup_businesstype (id);

ALTER TABLE ${iwsPostgresSchema}.notification_exporter  ADD CONSTRAINT fk_exporter_notification FOREIGN KEY(notificationid)
REFERENCES ${iwsPostgresSchema}.notification_notification (id);

ALTER TABLE ${iwsPostgresSchema}.notification_facility  ADD CONSTRAINT fk_facility_businesstype FOREIGN KEY(type)
REFERENCES ${iwsPostgresSchema}.lookup_businesstype (id);

ALTER TABLE ${iwsPostgresSchema}.notification_facility  ADD CONSTRAINT fk_notificationfacility_facilitycollection FOREIGN KEY(facilitycollectionid)
REFERENCES ${iwsPostgresSchema}.notification_facilitycollection (id);

ALTER TABLE ${iwsPostgresSchema}.notification_facilitycollection  ADD CONSTRAINT fk_notificationfacilitycollection_notification FOREIGN KEY(notificationid)
REFERENCES ${iwsPostgresSchema}.notification_notification (id);

ALTER TABLE ${iwsPostgresSchema}.notification_financialguarantee  ADD CONSTRAINT fk_financialguarantee_financialguaranteedecision FOREIGN KEY(decision)
REFERENCES ${iwsPostgresSchema}.lookup_financialguaranteedecision (id);

ALTER TABLE ${iwsPostgresSchema}.notification_financialguarantee  ADD CONSTRAINT fk_financialguarantee_financialguaranteestatus FOREIGN KEY(status)
REFERENCES ${iwsPostgresSchema}.lookup_financialguaranteestatus (id);

ALTER TABLE ${iwsPostgresSchema}.notification_financialguarantee  ADD CONSTRAINT fk_notificationfinancialguarantee_financialguaranteecollection FOREIGN KEY(financialguaranteecollectionid)
REFERENCES ${iwsPostgresSchema}.notification_financialguaranteecollection (id);

ALTER TABLE ${iwsPostgresSchema}.notification_financialguaranteecollection  ADD CONSTRAINT fk_financialguaranteecollection_notification FOREIGN KEY(notificationid)
REFERENCES ${iwsPostgresSchema}.notification_notification (id);

ALTER TABLE ${iwsPostgresSchema}.notification_financialguaranteestatuschange  ADD CONSTRAINT fk_financialguaranteestatuschange_financialguarantee FOREIGN KEY(financialguaranteeid)
REFERENCES ${iwsPostgresSchema}.notification_financialguarantee (id);

ALTER TABLE ${iwsPostgresSchema}.notification_financialguaranteestatuschange  ADD CONSTRAINT fk_financialguaranteestatuschange_financialguaranteestatus FOREIGN KEY(status)
REFERENCES ${iwsPostgresSchema}.lookup_financialguaranteestatus (id);

ALTER TABLE ${iwsPostgresSchema}.notification_financialguaranteestatuschange  ADD CONSTRAINT fk_financialguaranteestatuschange_user FOREIGN KEY(userid)
REFERENCES ${iwsPostgresSchema}.identity_users (id);

ALTER TABLE ${iwsPostgresSchema}.notification_importer  ADD CONSTRAINT fk_importer_businesstype FOREIGN KEY(type)
REFERENCES ${iwsPostgresSchema}.lookup_businesstype (id);

ALTER TABLE ${iwsPostgresSchema}.notification_importer  ADD CONSTRAINT fk_importer_notification FOREIGN KEY(notificationid)
REFERENCES ${iwsPostgresSchema}.notification_notification (id);

ALTER TABLE ${iwsPostgresSchema}.notification_meansoftransport  ADD CONSTRAINT fk_notificationmeansoftransport_notification FOREIGN KEY(notificationid)
REFERENCES ${iwsPostgresSchema}.notification_notification (id);

ALTER TABLE ${iwsPostgresSchema}.notification_movement  ADD CONSTRAINT fk_data_notification FOREIGN KEY(notificationid)
REFERENCES ${iwsPostgresSchema}.notification_notification (id);

ALTER TABLE ${iwsPostgresSchema}.notification_movement  ADD CONSTRAINT fk_movement_movementstatus FOREIGN KEY(status)
REFERENCES ${iwsPostgresSchema}.lookup_movementstatus (id);

ALTER TABLE ${iwsPostgresSchema}.notification_movement  ADD CONSTRAINT fk_notificationmovement_user FOREIGN KEY(createdby)
REFERENCES ${iwsPostgresSchema}.identity_users (id);

ALTER TABLE ${iwsPostgresSchema}.notification_movementcarrier  ADD CONSTRAINT fk_movementcarrier_carrier FOREIGN KEY(carrierid)
REFERENCES ${iwsPostgresSchema}.notification_carrier (id);

ALTER TABLE ${iwsPostgresSchema}.notification_movementcarrier  ADD CONSTRAINT fk_movementcarrier_movementdetails FOREIGN KEY(movementdetailsid)
REFERENCES ${iwsPostgresSchema}.notification_movementdetails (id);

ALTER TABLE ${iwsPostgresSchema}.notification_movementdatehistory  ADD CONSTRAINT fk_movementdatehistory_movement FOREIGN KEY(movementid)
REFERENCES ${iwsPostgresSchema}.notification_movement (id);

ALTER TABLE ${iwsPostgresSchema}.notification_movementdetails  ADD CONSTRAINT fk_movementdetails_movement FOREIGN KEY(movementid)
REFERENCES ${iwsPostgresSchema}.notification_movement (id);

ALTER TABLE ${iwsPostgresSchema}.notification_movementdetails  ADD CONSTRAINT fk_movementdetails_shipmentquantityunit FOREIGN KEY(unit)
REFERENCES ${iwsPostgresSchema}.lookup_shipmentquantityunit (id);

ALTER TABLE ${iwsPostgresSchema}.notification_movementoperationreceipt  ADD CONSTRAINT fk_movementoperationreceipt_movement FOREIGN KEY(movementid)
REFERENCES ${iwsPostgresSchema}.notification_movement (id);

ALTER TABLE ${iwsPostgresSchema}.notification_movementoperationreceipt  ADD CONSTRAINT fk_notificationmovementoperationreceipt_user FOREIGN KEY(createdby)
REFERENCES ${iwsPostgresSchema}.identity_users (id);

ALTER TABLE ${iwsPostgresSchema}.notification_movementpackaginginfo  ADD CONSTRAINT fk_movementpackaginginfo_movementdetails FOREIGN KEY(movementdetailsid)
REFERENCES ${iwsPostgresSchema}.notification_movementdetails (id);

ALTER TABLE ${iwsPostgresSchema}.notification_movementpackaginginfo  ADD CONSTRAINT fk_movementpackaginginfo_packaginginfo FOREIGN KEY(packaginginfoid)
REFERENCES ${iwsPostgresSchema}.notification_packaginginfo (id);

ALTER TABLE ${iwsPostgresSchema}.notification_movementreceipt  ADD CONSTRAINT fk_movementreceipt_decision FOREIGN KEY(decision)
REFERENCES ${iwsPostgresSchema}.lookup_movementreceiptdecision (id);

ALTER TABLE ${iwsPostgresSchema}.notification_movementreceipt  ADD CONSTRAINT fk_movementreceipt_movement FOREIGN KEY(movementid)
REFERENCES ${iwsPostgresSchema}.notification_movement (id);

ALTER TABLE ${iwsPostgresSchema}.notification_movementreceipt  ADD CONSTRAINT fk_movementreceipt_shipmentquantityunit FOREIGN KEY(unit)
REFERENCES ${iwsPostgresSchema}.lookup_shipmentquantityunit (id);

ALTER TABLE ${iwsPostgresSchema}.notification_movementreceipt  ADD CONSTRAINT fk_notificationmovementreceipt_user FOREIGN KEY(createdby)
REFERENCES ${iwsPostgresSchema}.identity_users (id);

ALTER TABLE ${iwsPostgresSchema}.notification_movementrejection  ADD CONSTRAINT fk_movementrejection_movement FOREIGN KEY(movementid)
REFERENCES ${iwsPostgresSchema}.notification_movement (id);

ALTER TABLE ${iwsPostgresSchema}.notification_movementstatuschange  ADD CONSTRAINT fk_movementstatuschange_movement FOREIGN KEY(movementid)
REFERENCES ${iwsPostgresSchema}.notification_movement (id);

ALTER TABLE ${iwsPostgresSchema}.notification_movementstatuschange  ADD CONSTRAINT fk_movementstatuschange_status FOREIGN KEY(status)
REFERENCES ${iwsPostgresSchema}.lookup_movementstatus (id);

ALTER TABLE ${iwsPostgresSchema}.notification_movementstatuschange  ADD CONSTRAINT fk_movementstatuschange_user FOREIGN KEY(userid)
REFERENCES ${iwsPostgresSchema}.identity_users (id);

ALTER TABLE ${iwsPostgresSchema}.notification_notificationassessment ADD CONSTRAINT fk_notificationassessment_notificationapplication FOREIGN KEY(notificationapplicationid)
REFERENCES ${iwsPostgresSchema}.notification_notification (id);

ALTER TABLE ${iwsPostgresSchema}.notification_notificationassessment  ADD CONSTRAINT fk_notificationassessment_status FOREIGN KEY(status)
REFERENCES ${iwsPostgresSchema}.lookup_notificationstatus (id);

ALTER TABLE ${iwsPostgresSchema}.notification_notificationdates  ADD CONSTRAINT fk_notificationdates_notificationassessment FOREIGN KEY(notificationassessmentid)
REFERENCES ${iwsPostgresSchema}.notification_notificationassessment (id);

ALTER TABLE ${iwsPostgresSchema}.notification_notificationstatuschange  ADD CONSTRAINT fk_notificationstatuschange_notificationassessment FOREIGN KEY(notificationassessmentid)
REFERENCES ${iwsPostgresSchema}.notification_notificationassessment (id);

ALTER TABLE ${iwsPostgresSchema}.notification_notificationstatuschange  ADD CONSTRAINT fk_notificationstatuschange_status FOREIGN KEY(status)
REFERENCES ${iwsPostgresSchema}.lookup_notificationstatus (id);

ALTER TABLE ${iwsPostgresSchema}.notification_notificationstatuschange  ADD CONSTRAINT fk_notificationstatuschange_user FOREIGN KEY(userid)
REFERENCES ${iwsPostgresSchema}.identity_users (id);

ALTER TABLE ${iwsPostgresSchema}.notification_numberofshipmentshistory  ADD CONSTRAINT fk_exportshipmentnumberhistory_notification FOREIGN KEY(notificationid)
REFERENCES ${iwsPostgresSchema}.notification_notification (id);

ALTER TABLE ${iwsPostgresSchema}.notification_operationcodes  ADD CONSTRAINT fk_operationcodes_notification FOREIGN KEY(notificationid)
REFERENCES ${iwsPostgresSchema}.notification_notification (id);

ALTER TABLE ${iwsPostgresSchema}.notification_packaginginfo  ADD CONSTRAINT fk_notificationpackaginginfo_packagingtype FOREIGN KEY(packagingtype)
REFERENCES ${iwsPostgresSchema}.lookup_packagingtype (id);

ALTER TABLE ${iwsPostgresSchema}.notification_packaginginfo  ADD CONSTRAINT fk_packaginginfo_notification FOREIGN KEY(notificationid)
REFERENCES ${iwsPostgresSchema}.notification_notification (id);

ALTER TABLE ${iwsPostgresSchema}.notification_physicalcharacteristicsinfo  ADD CONSTRAINT fk_notificationphysicalinfo_physicalchartype FOREIGN KEY(physicalcharacteristictype)
REFERENCES ${iwsPostgresSchema}.lookup_physicalcharacteristictype (id);

ALTER TABLE ${iwsPostgresSchema}.notification_physicalcharacteristicsinfo  ADD CONSTRAINT fk_physicalcharacteristicsinfo_notification FOREIGN KEY(notificationid)
REFERENCES ${iwsPostgresSchema}.notification_notification (id);

ALTER TABLE ${iwsPostgresSchema}.notification_producer  ADD CONSTRAINT fk_notificationproducer_producercollection FOREIGN KEY(producercollectionid)
REFERENCES ${iwsPostgresSchema}.notification_producercollection (id);

ALTER TABLE ${iwsPostgresSchema}.notification_producer  ADD CONSTRAINT fk_producer_businesstype FOREIGN KEY(type)
REFERENCES ${iwsPostgresSchema}.lookup_businesstype (id);

ALTER TABLE ${iwsPostgresSchema}.notification_producercollection  ADD CONSTRAINT fk_notificationproducercollection_notification FOREIGN KEY(notificationid)
REFERENCES ${iwsPostgresSchema}.notification_notification (id);

ALTER TABLE ${iwsPostgresSchema}.notification_recoveryinfo  ADD CONSTRAINT fk_recoveryinfo_notification FOREIGN KEY(notificationid)
REFERENCES ${iwsPostgresSchema}.notification_notification (id);

ALTER TABLE ${iwsPostgresSchema}.notification_shipmentinfo  ADD CONSTRAINT fk_shipmentinfo_notification FOREIGN KEY(notificationid)
REFERENCES ${iwsPostgresSchema}.notification_notification (id);

ALTER TABLE ${iwsPostgresSchema}.notification_stateofexport  ADD CONSTRAINT fk_stateofexport_competentauthority FOREIGN KEY(competentauthorityid)
REFERENCES ${iwsPostgresSchema}.lookup_competentauthority (id);

ALTER TABLE ${iwsPostgresSchema}.notification_stateofexport  ADD CONSTRAINT fk_stateofexport_country FOREIGN KEY(countryid)
REFERENCES ${iwsPostgresSchema}.lookup_country (id);

ALTER TABLE ${iwsPostgresSchema}.notification_stateofexport  ADD CONSTRAINT fk_stateofexport_exitpoint FOREIGN KEY(exitpointid)
REFERENCES ${iwsPostgresSchema}.notification_entryorexitpoint (id);

ALTER TABLE ${iwsPostgresSchema}.notification_stateofexport  ADD CONSTRAINT fk_stateofexport_transportroute FOREIGN KEY(transportrouteid)
REFERENCES ${iwsPostgresSchema}.notification_transportroute (id);

ALTER TABLE ${iwsPostgresSchema}.notification_stateofimport  ADD CONSTRAINT fk_stateofimport_competentauthority FOREIGN KEY(competentauthorityid)
REFERENCES ${iwsPostgresSchema}.lookup_competentauthority (id);

ALTER TABLE ${iwsPostgresSchema}.notification_stateofimport  ADD CONSTRAINT fk_stateofimport_country FOREIGN KEY(countryid)
REFERENCES ${iwsPostgresSchema}.lookup_country (id);

ALTER TABLE ${iwsPostgresSchema}.notification_stateofimport  ADD CONSTRAINT fk_stateofimport_entrypoint FOREIGN KEY(entrypointid)
REFERENCES ${iwsPostgresSchema}.notification_entryorexitpoint (id);

ALTER TABLE ${iwsPostgresSchema}.notification_stateofimport  ADD CONSTRAINT fk_stateofimport_transportroute FOREIGN KEY(transportrouteid)
REFERENCES ${iwsPostgresSchema}.notification_transportroute (id);

ALTER TABLE ${iwsPostgresSchema}.notification_technologyemployed  ADD CONSTRAINT fk_technologyemployed_notification FOREIGN KEY(notificationid)
REFERENCES ${iwsPostgresSchema}.notification_notification (id);

ALTER TABLE ${iwsPostgresSchema}.notification_transaction  ADD CONSTRAINT fk_transaction_notification FOREIGN KEY(notificationid)
REFERENCES ${iwsPostgresSchema}.notification_notification (id);

ALTER TABLE ${iwsPostgresSchema}.notification_transitstate  ADD CONSTRAINT fk_transitstate_competentauthority FOREIGN KEY(competentauthorityid)
REFERENCES ${iwsPostgresSchema}.lookup_competentauthority (id);

ALTER TABLE ${iwsPostgresSchema}.notification_transitstate  ADD CONSTRAINT fk_transitstate_country FOREIGN KEY(countryid)
REFERENCES ${iwsPostgresSchema}.lookup_country (id);

ALTER TABLE ${iwsPostgresSchema}.notification_transitstate  ADD CONSTRAINT fk_transitstate_entrypoint FOREIGN KEY(entrypointid)
REFERENCES ${iwsPostgresSchema}.notification_entryorexitpoint (id);

ALTER TABLE ${iwsPostgresSchema}.notification_transitstate  ADD CONSTRAINT fk_transitstate_exitpoint FOREIGN KEY(exitpointid)
REFERENCES ${iwsPostgresSchema}.notification_entryorexitpoint (id);

ALTER TABLE ${iwsPostgresSchema}.notification_transitstate  ADD CONSTRAINT fk_transitstate_transportroute FOREIGN KEY(transportrouteid)
REFERENCES ${iwsPostgresSchema}.notification_transportroute (id);

ALTER TABLE ${iwsPostgresSchema}.notification_transportroute  ADD CONSTRAINT fk_transportroute_notification FOREIGN KEY(notificationid)
REFERENCES ${iwsPostgresSchema}.notification_notification (id);

ALTER TABLE ${iwsPostgresSchema}.notification_userhistory  ADD CONSTRAINT fk_userhistory_currentuser FOREIGN KEY(currentuserid)
REFERENCES ${iwsPostgresSchema}.identity_users (id);

ALTER TABLE ${iwsPostgresSchema}.notification_userhistory  ADD CONSTRAINT fk_userhistory_newuser FOREIGN KEY(newuserid)
REFERENCES ${iwsPostgresSchema}.identity_users (id);

ALTER TABLE ${iwsPostgresSchema}.notification_userhistory  ADD CONSTRAINT fk_userhistory_notification FOREIGN KEY(notificationid)
REFERENCES ${iwsPostgresSchema}.notification_notification (id);

ALTER TABLE ${iwsPostgresSchema}.notification_wasteadditionalinformation  ADD CONSTRAINT fk_notificationwasteadditionalinformation_wasteinformationtype FOREIGN KEY(wasteinformationtype)
REFERENCES ${iwsPostgresSchema}.lookup_wasteinformationtype (id);

ALTER TABLE ${iwsPostgresSchema}.notification_wasteadditionalinformation  ADD CONSTRAINT fk_wasteadditionalinformation_wastetype FOREIGN KEY(wastetypeid)
REFERENCES ${iwsPostgresSchema}.notification_wastetype (id);

ALTER TABLE ${iwsPostgresSchema}.notification_wastecodeinfo  ADD CONSTRAINT fk_wastecodeinfo_codetype FOREIGN KEY(codetype)
REFERENCES ${iwsPostgresSchema}.lookup_codetype (id);

ALTER TABLE ${iwsPostgresSchema}.notification_wastecodeinfo  ADD CONSTRAINT fk_wastecodeinfo_notification FOREIGN KEY(notificationid)
REFERENCES ${iwsPostgresSchema}.notification_notification (id);

ALTER TABLE ${iwsPostgresSchema}.notification_wastecodeinfo  ADD CONSTRAINT fk_wastecodeinfo_wastecode FOREIGN KEY(wastecodeid)
REFERENCES ${iwsPostgresSchema}.lookup_wastecode (id);

ALTER TABLE ${iwsPostgresSchema}.notification_wastecomposition  ADD CONSTRAINT fk_notificationwastecomposition_chemicalcompositiontype FOREIGN KEY(chemicalcompositiontype)
REFERENCES ${iwsPostgresSchema}.lookup_chemicalcompositioncategory (id);

ALTER TABLE ${iwsPostgresSchema}.notification_wastecomposition  ADD CONSTRAINT fk_wastecomposition_wastetype FOREIGN KEY(wastetypeid)
REFERENCES ${iwsPostgresSchema}.notification_wastetype (id);

ALTER TABLE ${iwsPostgresSchema}.notification_wastetype  ADD CONSTRAINT fk_notificationwastetype_chemicalcompositiontype FOREIGN KEY(chemicalcompositiontype)
REFERENCES ${iwsPostgresSchema}.lookup_chemicalcompositiontype (id);

ALTER TABLE ${iwsPostgresSchema}.notification_wastetype  ADD CONSTRAINT fk_wastetype_notification FOREIGN KEY(notificationid)
REFERENCES ${iwsPostgresSchema}.notification_notification (id);

ALTER TABLE ${iwsPostgresSchema}.person_addressbook  ADD CONSTRAINT fk_addressbook_addressbookentitytype FOREIGN KEY(type)
REFERENCES ${iwsPostgresSchema}.lookup_addressbookentitytype (id);

ALTER TABLE ${iwsPostgresSchema}.person_addressbookrecord  ADD CONSTRAINT fk_addressbookrecord_addressbook FOREIGN KEY(addressbookid)
REFERENCES ${iwsPostgresSchema}.person_addressbook (id);

ALTER TABLE ${iwsPostgresSchema}.person_addressbookrecord  ADD CONSTRAINT fk_addressbookrecord_businesstype FOREIGN KEY(type)
REFERENCES ${iwsPostgresSchema}.lookup_businesstype (id);

ALTER TABLE ${iwsPostgresSchema}.person_internaluser  ADD CONSTRAINT fk_internaluser_aspnetusers FOREIGN KEY(userid)
REFERENCES ${iwsPostgresSchema}.identity_users (id);

ALTER TABLE ${iwsPostgresSchema}.person_internaluser  ADD CONSTRAINT fk_internaluser_internaluserstatus FOREIGN KEY(status)
REFERENCES ${iwsPostgresSchema}.lookup_internaluserstatus (id);

ALTER TABLE ${iwsPostgresSchema}.person_internaluser  ADD CONSTRAINT fk_internaluser_localarea FOREIGN KEY(localareaid)
REFERENCES ${iwsPostgresSchema}.lookup_localarea (id);