alter table QUALITY_FORM
add PARENT_TYPE VARCHAR(100)

alter table QUALITY_FORM
drop column DEPT_CODE

exec sp_rename 'QUALITY_FORM_DETAIL.FORM_CODE','FORM_TYPE','column';

alter table QUALITY_FORM_DETAIL
add DESCRIP VARCHAR(500)