declare
  dtdlocation varchar2(100);
  doctype_dtd varchar2(255);
  seqxml_update varchar2(4000);
begin
  dtdlocation :=  '/var/melete/packagefiles/moduleSeq.dtd';
  doctype_dtd := '<!DOCTYPE module SYSTEM "'||dtdlocation||'">';
  seqxml_update := 'update melete_module_seqxml set seq_xml=replace(seq_xml,'''||doctype_dtd||''',''<!DOCTYPE module [
    <!ELEMENT module (section+)>
    <!ELEMENT section (section*)>
    <!ATTLIST section id ID #REQUIRED>
  ]>'') where seq_xml is not NULL';
  
  begin
  	execute immediate 'drop table melete_module_seqxml';
  exception
  	when others then
  		null;
  end;
  
  execute immediate 'create table melete_module_seqxml as select * from melete_module';
  execute immediate seqxml_update;
end;
/