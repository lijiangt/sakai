update SAM_ASSESSMENTBASE_T set TITLE='教学评测',DESCRIPTION='系统默认定义的测验类型' where TITLE='Formative Assessment';
update SAM_ASSESSMENTBASE_T set TITLE='习题集',DESCRIPTION='系统默认定义的测验类型' where TITLE='Problem Set';
update SAM_ASSESSMENTBASE_T set TITLE='随堂测验',DESCRIPTION='系统默认定义的测验类型' where TITLE='Quiz';
update SAM_ASSESSMENTBASE_T set TITLE='调查',DESCRIPTION='系统默认定义的测验类型' where TITLE='Survey';
update SAM_ASSESSMENTBASE_T set TITLE='测验',DESCRIPTION='系统默认定义的测验类型' where TITLE='Test';
update SAM_ASSESSMENTBASE_T set TITLE='记时测验',DESCRIPTION='系统默认定义的测验类型' where TITLE='Timed Test';
update SAM_ASSESSMENTBASE_T set TITLE='默认测验类型',DESCRIPTION='系统默认定义的测验类型' where TITLE='Default Assessment Type';	

update SAM_ASSESSMENTBASE_T set TITLE='随堂测验',DESCRIPTION='系统默认定义的测验类型' where TITLE='随课测验';
update SAM_ASSESSMENTBASE_T set TITLE='习题集',DESCRIPTION='系统默认定义的测验类型' where TITLE='题集';
update SAM_ASSESSMENTBASE_T set TITLE='测验',DESCRIPTION='系统默认定义的测验类型' where TITLE='测试';
update SAM_ASSESSMENTBASE_T set TITLE='记时测验',DESCRIPTION='系统默认定义的测验类型' where TITLE='即时测试';