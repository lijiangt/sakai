drop table if exists metaobj_form_def;
create table metaobj_form_def (id varchar(36) not null, description varchar(255), documentRoot varchar(255) not null, owner varchar(255) not null, created datetime not null, modified datetime not null, systemOnly bit not null, externalType varchar(255) not null, siteId varchar(255), siteState integer not null, globalState integer not null, schemaData longblob not null, instruction text, schema_hash varchar(255), primary key (id));
