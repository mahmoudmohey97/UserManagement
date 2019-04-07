/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2014                    */
/* Created on:     4/1/2019 9:56:01 PM                          */
/*==============================================================*/


if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('COMPANYLOCATION') and o.name = 'FK_COMPANYL_HAS_COMPANY')
alter table COMPANYLOCATION
   drop constraint FK_COMPANYL_HAS_COMPANY
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('FILL') and o.name = 'FK_FILL_FILL_APPLICAN')
alter table FILL
   drop constraint FK_FILL_FILL_APPLICAN
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('FILL') and o.name = 'FK_FILL_FILL2_FORM')
alter table FILL
   drop constraint FK_FILL_FILL2_FORM
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('FORM') and o.name = 'FK_FORM_INITIATE_JOBVACAN')
alter table FORM
   drop constraint FK_FORM_INITIATE_JOBVACAN
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('INTEREST') and o.name = 'FK_INTEREST_CONTAINS_COMPANY')
alter table INTEREST
   drop constraint FK_INTEREST_CONTAINS_COMPANY
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('INTEREST') and o.name = 'FK_INTEREST_CONTAINS2_APPLICAN')
alter table INTEREST
   drop constraint FK_INTEREST_CONTAINS2_APPLICAN
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('INTEREST') and o.name = 'FK_INTEREST_CONTAINS3_ADMIN')
alter table INTEREST
   drop constraint FK_INTEREST_CONTAINS3_ADMIN
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('JOBVACANCY') and o.name = 'FK_JOBVACAN_CREATE_COMPANY')
alter table JOBVACANCY
   drop constraint FK_JOBVACAN_CREATE_COMPANY
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('JOBVACANCY') and o.name = 'FK_JOBVACAN_INITIATE2_FORM')
alter table JOBVACANCY
   drop constraint FK_JOBVACAN_INITIATE2_FORM
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('REQUIREMENTS') and o.name = 'FK_REQUIREM_NEEDS_JOBVACAN')
alter table REQUIREMENTS
   drop constraint FK_REQUIREM_NEEDS_JOBVACAN
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('SKILLS') and o.name = 'FK_SKILLS_HAVE_APPLICAN')
alter table SKILLS
   drop constraint FK_SKILLS_HAVE_APPLICAN
go

if exists (select 1
            from  sysobjects
           where  id = object_id('ADMIN')
            and   type = 'U')
   drop table ADMIN
go

if exists (select 1
            from  sysobjects
           where  id = object_id('APPLICANT')
            and   type = 'U')
   drop table APPLICANT
go

if exists (select 1
            from  sysobjects
           where  id = object_id('COMPANY')
            and   type = 'U')
   drop table COMPANY
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('COMPANYLOCATION')
            and   name  = 'HAS_FK'
            and   indid > 0
            and   indid < 255)
   drop index COMPANYLOCATION.HAS_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('COMPANYLOCATION')
            and   type = 'U')
   drop table COMPANYLOCATION
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('FILL')
            and   name  = 'FILL2_FK'
            and   indid > 0
            and   indid < 255)
   drop index FILL.FILL2_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('FILL')
            and   name  = 'FILL_FK'
            and   indid > 0
            and   indid < 255)
   drop index FILL.FILL_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('FILL')
            and   type = 'U')
   drop table FILL
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('FORM')
            and   name  = 'INITIATE_FK'
            and   indid > 0
            and   indid < 255)
   drop index FORM.INITIATE_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('FORM')
            and   type = 'U')
   drop table FORM
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('INTEREST')
            and   name  = 'CONTAINS_FK'
            and   indid > 0
            and   indid < 255)
   drop index INTEREST.CONTAINS_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('INTEREST')
            and   name  = 'CONTAINS3_FK'
            and   indid > 0
            and   indid < 255)
   drop index INTEREST.CONTAINS3_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('INTEREST')
            and   name  = 'CONTAINS2_FK'
            and   indid > 0
            and   indid < 255)
   drop index INTEREST.CONTAINS2_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('INTEREST')
            and   type = 'U')
   drop table INTEREST
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('JOBVACANCY')
            and   name  = 'INITIATE2_FK'
            and   indid > 0
            and   indid < 255)
   drop index JOBVACANCY.INITIATE2_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('JOBVACANCY')
            and   name  = 'CREATE_FK'
            and   indid > 0
            and   indid < 255)
   drop index JOBVACANCY.CREATE_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('JOBVACANCY')
            and   type = 'U')
   drop table JOBVACANCY
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('REQUIREMENTS')
            and   name  = 'NEEDS_FK'
            and   indid > 0
            and   indid < 255)
   drop index REQUIREMENTS.NEEDS_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('REQUIREMENTS')
            and   type = 'U')
   drop table REQUIREMENTS
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('SKILLS')
            and   name  = 'HAVE_FK'
            and   indid > 0
            and   indid < 255)
   drop index SKILLS.HAVE_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('SKILLS')
            and   type = 'U')
   drop table SKILLS
go

/*==============================================================*/
/* Table: ADMIN                                                 */
/*==============================================================*/
create table ADMIN (
   USERID               int                  not null,
   ADMINID              int                  not null,
   USERNAME             varchar(1024)        null,
   EMAIL                varchar(1024)        null,
   PASSWORD             varchar(1024)        null,
   constraint PK_ADMIN primary key (USERID, ADMINID)
)
go

/*==============================================================*/
/* Table: APPLICANT                                             */
/*==============================================================*/
create table APPLICANT (
   USERID               int                  not null,
   AGE                  int                  null,
   GENDER               bit                  null,
   FNAME                varchar(1024)        null,
   LNAME                varchar(1024)        null,
   MOBILENUM            bigint               null,
   APPLICANTID          int                  not null,
   USERNAME             varchar(1024)        null,
   EMAIL                varchar(1024)        null,
   PASSWORD             varchar(1024)        null,
   constraint PK_APPLICANT primary key (USERID, APPLICANTID)
)
go

/*==============================================================*/
/* Table: COMPANY                                               */
/*==============================================================*/
create table COMPANY (
   USERID               int                  not null,
   NAME                 varchar(1)           null,
   NUMEMPLOYEES         int                  null,
   COMPANYID            char(10)             not null,
   USERNAME             varchar(1024)        null,
   EMAIL                varchar(1024)        null,
   PASSWORD             varchar(1024)        null,
   constraint PK_COMPANY primary key (USERID, COMPANYID)
)
go

/*==============================================================*/
/* Table: COMPANYLOCATION                                       */
/*==============================================================*/
create table COMPANYLOCATION (
   LOCACATION           varchar(500)         not null,
   IDCOMPANY            int                  not null,
   USERID               int                  not null,
   COMPANYID            char(10)             not null,
   constraint PK_COMPANYLOCATION primary key (LOCACATION, IDCOMPANY)
)
go

/*==============================================================*/
/* Index: HAS_FK                                                */
/*==============================================================*/




create nonclustered index HAS_FK on COMPANYLOCATION (USERID ASC,
  COMPANYID ASC)
go

/*==============================================================*/
/* Table: FILL                                                  */
/*==============================================================*/
create table FILL (
   USERID               int                  not null,
   APPLICANTID          int                  not null,
   FORMID               int                  not null,
   constraint PK_FILL primary key (USERID, APPLICANTID, FORMID)
)
go

/*==============================================================*/
/* Index: FILL_FK                                               */
/*==============================================================*/




create nonclustered index FILL_FK on FILL (USERID ASC,
  APPLICANTID ASC)
go

/*==============================================================*/
/* Index: FILL2_FK                                              */
/*==============================================================*/




create nonclustered index FILL2_FK on FILL (FORMID ASC)
go

/*==============================================================*/
/* Table: FORM                                                  */
/*==============================================================*/
create table FORM (
   FORMID               int                  not null,
   JOBID                int                  null,
   JOBVACID             int                  not null,
   constraint PK_FORM primary key (FORMID)
)
go

/*==============================================================*/
/* Index: INITIATE_FK                                           */
/*==============================================================*/




create nonclustered index INITIATE_FK on FORM (JOBID ASC)
go

/*==============================================================*/
/* Table: INTEREST                                              */
/*==============================================================*/
create table INTEREST (
   INTERESTS            varchar(1024)        not null,
   ID                   int                  not null,
   USERID               int                  not null,
   APPLICANTID          int                  not null,
   USE_USERID           int                  not null,
   ADMINID              int                  not null,
   USE_USERID2          int                  not null,
   COMPANYID            char(10)             not null,
   constraint PK_INTEREST primary key (INTERESTS, ID)
)
go

/*==============================================================*/
/* Index: CONTAINS2_FK                                          */
/*==============================================================*/




create nonclustered index CONTAINS2_FK on INTEREST (USERID ASC,
  APPLICANTID ASC)
go

/*==============================================================*/
/* Index: CONTAINS3_FK                                          */
/*==============================================================*/




create nonclustered index CONTAINS3_FK on INTEREST (USE_USERID ASC,
  ADMINID ASC)
go

/*==============================================================*/
/* Index: CONTAINS_FK                                           */
/*==============================================================*/




create nonclustered index CONTAINS_FK on INTEREST (USE_USERID2 ASC,
  COMPANYID ASC)
go

/*==============================================================*/
/* Table: JOBVACANCY                                            */
/*==============================================================*/
create table JOBVACANCY (
   TYPE                 varchar(500)         null,
   TITLE                varchar(500)         null,
   DESCRIPTION          varchar(1024)        null,
   JOBID                int                  not null,
   USERID               int                  null,
   COMPANYID            char(10)             null,
   FORMID               int                  null,
   COMPID               int                  not null,
   constraint PK_JOBVACANCY primary key (JOBID)
)
go

/*==============================================================*/
/* Index: CREATE_FK                                             */
/*==============================================================*/




create nonclustered index CREATE_FK on JOBVACANCY (USERID ASC,
  COMPANYID ASC)
go

/*==============================================================*/
/* Index: INITIATE2_FK                                          */
/*==============================================================*/




create nonclustered index INITIATE2_FK on JOBVACANCY (FORMID ASC)
go

/*==============================================================*/
/* Table: REQUIREMENTS                                          */
/*==============================================================*/
create table REQUIREMENTS (
   REQUIREMENTS         varchar(1024)        not null,
   VACANCYID            int                  not null,
   JOBID                int                  not null,
   constraint PK_REQUIREMENTS primary key (REQUIREMENTS, VACANCYID)
)
go

/*==============================================================*/
/* Index: NEEDS_FK                                              */
/*==============================================================*/




create nonclustered index NEEDS_FK on REQUIREMENTS (JOBID ASC)
go

/*==============================================================*/
/* Table: SKILLS                                                */
/*==============================================================*/
create table SKILLS (
   USERID               int                  null,
   APPLICANTID          int                  null,
   SKILL                varchar(1000)        not null,
   IDAPPLICANT          int                  not null
)
go

/*==============================================================*/
/* Index: HAVE_FK                                               */
/*==============================================================*/




create nonclustered index HAVE_FK on SKILLS (USERID ASC,
  APPLICANTID ASC)
go

alter table COMPANYLOCATION
   add constraint FK_COMPANYL_HAS_COMPANY foreign key (USERID, COMPANYID)
      references COMPANY (USERID, COMPANYID)
go

alter table FILL
   add constraint FK_FILL_FILL_APPLICAN foreign key (USERID, APPLICANTID)
      references APPLICANT (USERID, APPLICANTID)
go

alter table FILL
   add constraint FK_FILL_FILL2_FORM foreign key (FORMID)
      references FORM (FORMID)
go

alter table FORM
   add constraint FK_FORM_INITIATE_JOBVACAN foreign key (JOBID)
      references JOBVACANCY (JOBID)
go

alter table INTEREST
   add constraint FK_INTEREST_CONTAINS_COMPANY foreign key (USE_USERID2, COMPANYID)
      references COMPANY (USERID, COMPANYID)
go

alter table INTEREST
   add constraint FK_INTEREST_CONTAINS2_APPLICAN foreign key (USERID, APPLICANTID)
      references APPLICANT (USERID, APPLICANTID)
go

alter table INTEREST
   add constraint FK_INTEREST_CONTAINS3_ADMIN foreign key (USE_USERID, ADMINID)
      references ADMIN (USERID, ADMINID)
go

alter table JOBVACANCY
   add constraint FK_JOBVACAN_CREATE_COMPANY foreign key (USERID, COMPANYID)
      references COMPANY (USERID, COMPANYID)
go

alter table JOBVACANCY
   add constraint FK_JOBVACAN_INITIATE2_FORM foreign key (FORMID)
      references FORM (FORMID)
go

alter table REQUIREMENTS
   add constraint FK_REQUIREM_NEEDS_JOBVACAN foreign key (JOBID)
      references JOBVACANCY (JOBID)
go

alter table SKILLS
   add constraint FK_SKILLS_HAVE_APPLICAN foreign key (USERID, APPLICANTID)
      references APPLICANT (USERID, APPLICANTID)
go

