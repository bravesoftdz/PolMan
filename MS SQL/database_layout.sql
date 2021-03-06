IF EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = N'db_pman_devco')
	DROP DATABASE [db_pman_devco]
GO

CREATE DATABASE [db_pman_devco]  ON (NAME = N'db_pman_devco_Data', FILENAME = N'e:\ms_db\MSSQL\data\db_pman_devco_Data.MDF' , SIZE = 3, FILEGROWTH = 10%) LOG ON (NAME = N'db_pman_devco_Log', FILENAME = N'F:\ms_log\db_pman_devco.LDF' , SIZE = 1, FILEGROWTH = 10%)
 COLLATE SQL_Latin1_General_CP1_CI_AS
GO

exec sp_dboption N'db_pman_devco', N'autoclose', N'true'
GO

exec sp_dboption N'db_pman_devco', N'bulkcopy', N'false'
GO

exec sp_dboption N'db_pman_devco', N'trunc. log', N'true'
GO

exec sp_dboption N'db_pman_devco', N'torn page detection', N'true'
GO

exec sp_dboption N'db_pman_devco', N'read only', N'false'
GO

exec sp_dboption N'db_pman_devco', N'dbo use', N'false'
GO

exec sp_dboption N'db_pman_devco', N'single', N'false'
GO

exec sp_dboption N'db_pman_devco', N'autoshrink', N'true'
GO

exec sp_dboption N'db_pman_devco', N'ANSI null default', N'false'
GO

exec sp_dboption N'db_pman_devco', N'recursive triggers', N'false'
GO

exec sp_dboption N'db_pman_devco', N'ANSI nulls', N'false'
GO

exec sp_dboption N'db_pman_devco', N'concat null yields null', N'false'
GO

exec sp_dboption N'db_pman_devco', N'cursor close on commit', N'false'
GO

exec sp_dboption N'db_pman_devco', N'default to local cursor', N'false'
GO

exec sp_dboption N'db_pman_devco', N'quoted identifier', N'false'
GO

exec sp_dboption N'db_pman_devco', N'ANSI warnings', N'false'
GO

exec sp_dboption N'db_pman_devco', N'auto create statistics', N'true'
GO

exec sp_dboption N'db_pman_devco', N'auto update statistics', N'true'
GO

use [db_pman_devco]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tbl_broker]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tbl_broker]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tbl_broker_agreement]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tbl_broker_agreement]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tbl_broker_base_commission]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tbl_broker_base_commission]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tbl_broker_commission]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tbl_broker_commission]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tbl_broker_compliance]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tbl_broker_compliance]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tbl_broker_status]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tbl_broker_status]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tbl_business_area]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tbl_business_area]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tbl_client]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tbl_client]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tbl_client_bank]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tbl_client_bank]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tbl_commission_base]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tbl_commission_base]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tbl_commission_level]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tbl_commission_level]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tbl_country]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tbl_country]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tbl_currency]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tbl_currency]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tbl_dynrate]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tbl_dynrate]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tbl_frequency]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tbl_frequency]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tbl_funds]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tbl_funds]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tbl_idcard_types]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tbl_idcard_types]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tbl_lookup_fields]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tbl_lookup_fields]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tbl_override]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tbl_override]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tbl_payment_types]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tbl_payment_types]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tbl_policy]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tbl_policy]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tbl_product]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tbl_product]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tbl_product_provider]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tbl_product_provider]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tbl_product_provider_commission]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tbl_product_provider_commission]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tbl_product_provider_contacts]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tbl_product_provider_contacts]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tbl_product_type]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tbl_product_type]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tbl_prof_status_id]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tbl_prof_status_id]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tbl_sex]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tbl_sex]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tbl_status_broker]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tbl_status_broker]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tbl_status_policy]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tbl_status_policy]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tbl_titles]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tbl_titles]
GO

if not exists (select * from master.dbo.syslogins where loginname = N'EBN\EBN_Gestion_Users')
	exec sp_grantlogin N'EBN\EBN_Gestion_Users'
	exec sp_defaultdb N'EBN\EBN_Gestion_Users', N'db_polest'
	exec sp_defaultlanguage N'EBN\EBN_Gestion_Users', N'us_english'
GO

if not exists (select * from dbo.sysusers where name = N'EBN\EBN_Gestion_Users' and uid < 16382)
	EXEC sp_grantdbaccess N'EBN\EBN_Gestion_Users', N'EBN\EBN_Gestion_Users'
GO

exec sp_addrolemember N'db_datareader', N'EBN\EBN_Gestion_Users'
GO

exec sp_addrolemember N'db_datawriter', N'EBN\EBN_Gestion_Users'
GO

CREATE TABLE [dbo].[tbl_broker] (
	[broker_id] [bigint] IDENTITY (2001, 1) NOT NULL ,
	[broker_manager_id] [bigint] NOT NULL ,
	[broker_lastname] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[broker_firstname] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[broker_company] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[broker_address] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[broker_zip] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[broker_city] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[broker_country] [tinyint] NULL ,
	[broker_business_phone1] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[broker_business_phone2] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[broker_private_phone] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[broker_mobile_phone] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[broker_fax] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[broker_email] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[comm_level] [tinyint] NULL ,
	[broker_payment_frequency] [int] NULL ,
	[broker_currency] [tinyint] NULL ,
	[broker_status] [smallint] NULL ,
	[broker_bank] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[broker_lastmeeting] [smalldatetime] NULL ,
	[broker_remarks] [ntext] COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[broker_ebn_sales_dir] [nvarchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[use_iban] [bit] NULL ,
	[broker_iban] [nvarchar] (32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[broker_bic] [nvarchar] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[broker_commencement_date] [smalldatetime] NULL ,
	[company_group] [bit] NULL ,
	[last_edit] [datetime] NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [dbo].[tbl_broker_agreement] (
	[agreement_id] [bigint] IDENTITY (1, 1) NOT NULL ,
	[broker_id] [bigint] NOT NULL ,
	[product_id] [int] NOT NULL ,
	[contract_date] [datetime] NOT NULL ,
	[contract_level] [tinyint] NOT NULL ,
	[specific_contract] [bit] NOT NULL ,
	[last_edit] [datetime] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tbl_broker_base_commission] (
	[comm_id] [bigint] IDENTITY (1, 1) NOT NULL ,
	[broker_id] [bigint] NULL ,
	[contract_date] [datetime] NULL ,
	[comm_level] [tinyint] NULL ,
	[product_id] [int] NULL ,
	[volume_level] [bigint] NULL ,
	[comm_year] [tinyint] NULL ,
	[initial_comm] [real] NULL ,
	[initial_override] [real] NULL ,
	[renewal_comm] [real] NULL ,
	[renewal_override] [real] NULL ,
	[other_comm] [real] NULL ,
	[other_override] [real] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tbl_broker_commission] (
	[comm_id] [bigint] IDENTITY (1, 1) NOT NULL ,
	[broker_id] [bigint] NULL ,
	[contract_date] [datetime] NULL ,
	[comm_level] [tinyint] NULL ,
	[product_id] [int] NULL ,
	[volume_level] [bigint] NULL ,
	[comm_year] [tinyint] NULL ,
	[initial_comm] [real] NULL ,
	[initial_override] [real] NULL ,
	[renewal_comm] [real] NULL ,
	[renewal_override] [real] NULL ,
	[other_comm] [real] NULL ,
	[other_override] [real] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tbl_broker_compliance] (
	[broker_id] [int] NULL ,
	[request_date1] [datetime] NULL ,
	[request_date2] [datetime] NULL ,
	[request_date3] [datetime] NULL ,
	[request_date4] [datetime] NULL ,
	[request_date5] [datetime] NULL ,
	[request_date6] [datetime] NULL ,
	[request_date7] [datetime] NULL ,
	[request_date8] [datetime] NULL ,
	[request_date9] [datetime] NULL ,
	[request_date10] [datetime] NULL ,
	[request_date11] [datetime] NULL ,
	[request_date12] [datetime] NULL ,
	[request_date13] [datetime] NULL ,
	[request_date14] [datetime] NULL ,
	[request_date15] [datetime] NULL ,
	[receive_date1] [datetime] NULL ,
	[receive_date2] [datetime] NULL ,
	[receive_date3] [datetime] NULL ,
	[receive_date4] [datetime] NULL ,
	[receive_date5] [datetime] NULL ,
	[receive_date6] [datetime] NULL ,
	[receive_date7] [datetime] NULL ,
	[receive_date8] [datetime] NULL ,
	[receive_date9] [datetime] NULL ,
	[receive_date10] [datetime] NULL ,
	[receive_date11] [datetime] NULL ,
	[receive_date12] [datetime] NULL ,
	[receive_date13] [datetime] NULL ,
	[receive_date14] [datetime] NULL ,
	[receive_date15] [datetime] NULL ,
	[done1] [bit] NOT NULL ,
	[done2] [bit] NOT NULL ,
	[done3] [bit] NOT NULL ,
	[done4] [bit] NOT NULL ,
	[done5] [bit] NOT NULL ,
	[done6] [bit] NOT NULL ,
	[done7] [bit] NOT NULL ,
	[done8] [bit] NOT NULL ,
	[done9] [bit] NOT NULL ,
	[done10] [bit] NOT NULL ,
	[done11] [bit] NOT NULL ,
	[done12] [bit] NOT NULL ,
	[done13] [bit] NOT NULL ,
	[done14] [bit] NOT NULL ,
	[done15] [bit] NOT NULL ,
	[avad_negative] [bit] NOT NULL ,
	[cat93] [bit] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tbl_broker_status] (
	[status_id] [tinyint] NOT NULL ,
	[status_text] [char] (9) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tbl_business_area] (
	[business_area_id] [int] NOT NULL ,
	[business_desc] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tbl_client] (
	[client_id] [bigint] IDENTITY (1, 1) NOT NULL ,
	[client_title1] [tinyint] NULL ,
	[client_title2] [tinyint] NULL ,
	[client_lastname] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[client_firstname] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[client_company] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[client_address] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[client_zip] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[client_city] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[client_country] [tinyint] NULL ,
	[client_telephone] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[client_fax] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[client_email] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[client_birthdate] [datetime] NULL ,
	[client_id_type] [tinyint] NULL ,
	[client_id_number] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[client_copy_id] [bit] NULL ,
	[client_nationality] [tinyint] NULL ,
	[client_sex] [tinyint] NULL ,
	[client_prof_status] [tinyint] NULL ,
	[client_job_title] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[client_height] [tinyint] NULL ,
	[client_weight] [tinyint] NULL ,
	[client_doctor] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[client_health_notes] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[client_private_comments] [ntext] COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[client_public_comments] [ntext] COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[last_edit] [datetime] NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [dbo].[tbl_client_bank] (
	[client_id] [bigint] NOT NULL ,
	[insured_life_pay] [bit] NULL ,
	[bank_signature_date] [datetime] NULL ,
	[account_name] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[bank_name] [char] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[country_bank] [smallint] NULL ,
	[account_bic] [char] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[account_iban] [char] (32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tbl_commission_base] (
	[base_id] [tinyint] NOT NULL ,
	[base_description] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tbl_commission_level] (
	[level_id] [tinyint] NOT NULL ,
	[level_letter] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tbl_country] (
	[country_id] [int] NOT NULL ,
	[country_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[iso2] [nvarchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[iso3] [nvarchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[iana] [nvarchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[un_vehicle] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[ioc_olympic] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[un_iso_nummeric] [int] NULL ,
	[itu_calling] [int] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tbl_currency] (
	[currency_id] [int] NOT NULL ,
	[currency_tag] [nvarchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[currency_name] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[exchange_rate_euro] [float] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tbl_dynrate] (
	[dynrate_id] [int] IDENTITY (1, 1) NOT NULL ,
	[product_id] [smallint] NOT NULL ,
	[dynrate] [real] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tbl_frequency] (
	[frequency_id] [int] NOT NULL ,
	[frequency_desc] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tbl_funds] (
	[fund_id] [int] NOT NULL ,
	[product_id] [int] NOT NULL ,
	[fund_name] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tbl_idcard_types] (
	[idcard_id] [tinyint] NULL ,
	[idcard_type] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tbl_lookup_fields] (
	[entry_id] [int] IDENTITY (1, 1) NOT NULL ,
	[lookup_id] [int] NOT NULL ,
	[table_name] [varchar] (75) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[datafield_name] [varchar] (75) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[datafield_desc_name] [varchar] (75) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[column_def_width] [int] NOT NULL ,
	[column_money] [bit] NOT NULL ,
	[load_order] [int] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tbl_override] (
	[override_id] [bigint] IDENTITY (1, 1) NOT NULL ,
	[contract_date] [datetime] NOT NULL ,
	[comm_level] [tinyint] NOT NULL ,
	[override_broker_id] [bigint] NOT NULL ,
	[broker_id] [bigint] NOT NULL ,
	[product_id] [int] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tbl_payment_types] (
	[payment_type_id] [tinyint] NULL ,
	[payment_desc] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tbl_policy] (
	[pol_id] [bigint] IDENTITY (1, 1) NOT NULL ,
	[pol_number] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[pol_business_id] [tinyint] NULL ,
	[pol_broker_id] [int] NULL ,
	[pol_product_id] [int] NULL ,
	[pol_type_id] [int] NULL ,
	[pol_status_id] [int] NULL ,
	[pol_date_received] [datetime] NULL ,
	[pol_date_send_to_broker] [datetime] NULL ,
	[pol_date_signed] [datetime] NULL ,
	[pol_date_policy] [datetime] NULL ,
	[pol_date_begin] [datetime] NULL ,
	[pol_date_end] [datetime] NULL ,
	[pol_term] [tinyint] NULL ,
	[pol_payment_term] [tinyint] NULL ,
	[pol_date_send_to_supplier] [datetime] NULL ,
	[pol_regular_premium] [real] NULL ,
	[pol_single_premium] [real] NULL ,
	[pol_frequency] [tinyint] NULL ,
	[pol_currency] [tinyint] NULL ,
	[pol_dynamic_rate] [real] NULL ,
	[pol_client1_id] [int] NULL ,
	[pol_client2_id] [int] NULL ,
	[pol_life1_insured] [int] NULL ,
	[pol_life2_insured] [int] NULL ,
	[pol_life3_insured] [int] NULL ,
	[pol_life4_insured] [int] NULL ,
	[pol_life5_insured] [int] NULL ,
	[pol_link] [bigint] NULL ,
	[pol_comm_level] [tinyint] NULL ,
	[last_edit] [datetime] NULL ,
	[pol_notes] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[additional_comm] [bit] NOT NULL ,
	[pol_fund] [int] NOT NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [dbo].[tbl_product] (
	[product_id] [smallint] IDENTITY (1, 1) NOT NULL ,
	[product_provider_id] [smallint] NOT NULL ,
	[product_name] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[product_type] [tinyint] NULL ,
	[product_base] [tinyint] NULL ,
	[product_restrict_min_age_commence] [tinyint] NULL ,
	[product_restrict_max_age_commence] [tinyint] NULL ,
	[product_restrict_min_age_mature] [tinyint] NULL ,
	[product_restrict_max_age_mature] [tinyint] NULL ,
	[product_restrict_max_duration] [tinyint] NULL ,
	[product_restrict_issued_from] [datetime] NULL ,
	[product_restrict_issued_to] [datetime] NULL ,
	[product_currency] [tinyint] NULL ,
	[comm_base] [tinyint] NOT NULL ,
	[comm_fund_based] [bit] NOT NULL ,
	[comm_payment_after_months] [tinyint] NULL ,
	[comm_frequency_payment_months] [tinyint] NULL ,
	[renewal_base] [tinyint] NOT NULL ,
	[renewal_fund_based] [bit] NULL ,
	[renewal_payment_after_months] [tinyint] NULL ,
	[renewal_frequency_payment_months] [tinyint] NULL ,
	[other_base] [tinyint] NOT NULL ,
	[other_fund_based] [bit] NULL ,
	[other_payment_after_months] [tinyint] NULL ,
	[other_frequency_payment_months] [tinyint] NULL ,
	[other_payment_type] [tinyint] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tbl_product_provider] (
	[product_provider_id] [int] IDENTITY (1, 1) NOT NULL ,
	[product_provider_company] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[product_provider_address] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[product_provider_zip] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[product_provider_city] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[product_provider_country] [tinyint] NULL ,
	[product_provider_telephone] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[product_provider_fax] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[product_provider_website] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[product_provider_email] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tbl_product_provider_commission] (
	[rate_id] [bigint] IDENTITY (1, 1) NOT NULL ,
	[product_id] [int] NOT NULL ,
	[y1_rate] [real] NOT NULL ,
	[y2_rate] [real] NOT NULL ,
	[y3_rate] [real] NOT NULL ,
	[y4_rate] [real] NOT NULL ,
	[y5_rate] [real] NOT NULL ,
	[renewal_rate] [real] NOT NULL ,
	[other_rate] [real] NOT NULL ,
	[contract_date] [datetime] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tbl_product_provider_contacts] (
	[product_provider_id] [tinyint] NOT NULL ,
	[contact_id] [int] IDENTITY (1, 1) NOT NULL ,
	[contact_business_area] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[contact_name] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[contact_telephone] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[contact_fax] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[contact_email] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tbl_product_type] (
	[product_type_id] [tinyint] NOT NULL ,
	[product_type_desc] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tbl_prof_status_id] (
	[prof_status_id] [tinyint] NULL ,
	[status_desc] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tbl_sex] (
	[sex_id] [tinyint] NULL ,
	[sex_desc] [char] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tbl_status_broker] (
	[status_id] [tinyint] NOT NULL ,
	[status_text] [char] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tbl_status_policy] (
	[policy_status_id] [int] NOT NULL ,
	[policy_status_desc] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tbl_titles] (
	[title_id] [tinyint] NULL ,
	[title_type] [bit] NULL ,
	[title] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[tbl_broker] WITH NOCHECK ADD 
	CONSTRAINT [PK_tbl_broker] PRIMARY KEY  CLUSTERED 
	(
		[broker_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[tbl_broker_base_commission] WITH NOCHECK ADD 
	CONSTRAINT [PK_tbl_broker_base_commission] PRIMARY KEY  CLUSTERED 
	(
		[comm_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[tbl_broker_commission] WITH NOCHECK ADD 
	CONSTRAINT [PK_tbl_broker_commission] PRIMARY KEY  CLUSTERED 
	(
		[comm_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[tbl_client] WITH NOCHECK ADD 
	CONSTRAINT [PK_tbl_client] PRIMARY KEY  CLUSTERED 
	(
		[client_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[tbl_commission_level] WITH NOCHECK ADD 
	CONSTRAINT [PK_tbl_commission_level] PRIMARY KEY  CLUSTERED 
	(
		[level_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[tbl_currency] WITH NOCHECK ADD 
	CONSTRAINT [PK_tbl_currency] PRIMARY KEY  CLUSTERED 
	(
		[currency_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[tbl_dynrate] WITH NOCHECK ADD 
	CONSTRAINT [PK_tbl_dyn_rate] PRIMARY KEY  CLUSTERED 
	(
		[dynrate_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[tbl_lookup_fields] WITH NOCHECK ADD 
	CONSTRAINT [PK_tbl_lookup_fields] PRIMARY KEY  CLUSTERED 
	(
		[entry_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[tbl_override] WITH NOCHECK ADD 
	CONSTRAINT [PK_tbl_override] PRIMARY KEY  CLUSTERED 
	(
		[override_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[tbl_policy] WITH NOCHECK ADD 
	CONSTRAINT [PK_tbl_policy] PRIMARY KEY  CLUSTERED 
	(
		[pol_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[tbl_product] WITH NOCHECK ADD 
	CONSTRAINT [PK_tbl_product] PRIMARY KEY  CLUSTERED 
	(
		[product_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[tbl_product_provider] WITH NOCHECK ADD 
	CONSTRAINT [PK_tbl_product_provider] PRIMARY KEY  CLUSTERED 
	(
		[product_provider_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[tbl_product_provider_commission] WITH NOCHECK ADD 
	CONSTRAINT [PK_tbl_product_provider_commission] PRIMARY KEY  CLUSTERED 
	(
		[rate_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[tbl_product_provider_contacts] WITH NOCHECK ADD 
	CONSTRAINT [PK_tbl_product_provider_contacts] PRIMARY KEY  CLUSTERED 
	(
		[contact_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[tbl_product_type] WITH NOCHECK ADD 
	CONSTRAINT [PK_tbl_product_type] PRIMARY KEY  CLUSTERED 
	(
		[product_type_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[tbl_broker] WITH NOCHECK ADD 
	CONSTRAINT [DF_tbl_broker_broker_manager_id] DEFAULT (1000) FOR [broker_manager_id],
	CONSTRAINT [DF_tbl_broker_use_iban] DEFAULT (1) FOR [use_iban],
	CONSTRAINT [DF_tbl_broker_company_group] DEFAULT (0) FOR [company_group]
GO

ALTER TABLE [dbo].[tbl_broker_base_commission] WITH NOCHECK ADD 
	CONSTRAINT [DF_tbl_broker_base_commission_broker_id] DEFAULT (0) FOR [broker_id],
	CONSTRAINT [DF_tbl_broker_base_commission_initial_comm] DEFAULT (0) FOR [initial_comm],
	CONSTRAINT [DF_tbl_broker_base_commission_initial_override] DEFAULT (0) FOR [initial_override],
	CONSTRAINT [DF_tbl_broker_base_commission_renewal_comm] DEFAULT (0) FOR [renewal_comm],
	CONSTRAINT [DF_tbl_broker_base_commission_renewal_override] DEFAULT (0) FOR [renewal_override],
	CONSTRAINT [DF_tbl_broker_base_commission_other_comm] DEFAULT (0) FOR [other_comm],
	CONSTRAINT [DF_tbl_broker_base_commission_other_override] DEFAULT (0) FOR [other_override]
GO

ALTER TABLE [dbo].[tbl_broker_commission] WITH NOCHECK ADD 
	CONSTRAINT [DF_tbl_broker_commission_broker_id] DEFAULT (0) FOR [broker_id],
	CONSTRAINT [DF_tbl_broker_commission_comm_level] DEFAULT (0) FOR [comm_level],
	CONSTRAINT [DF_tbl_broker_commission_product_id] DEFAULT (0) FOR [product_id],
	CONSTRAINT [DF_tbl_broker_commission_volume_level] DEFAULT (0) FOR [volume_level],
	CONSTRAINT [DF_tbl_broker_commission_comm_year] DEFAULT (0) FOR [comm_year],
	CONSTRAINT [DF_tbl_broker_commission_initial_comm] DEFAULT (0) FOR [initial_comm],
	CONSTRAINT [DF_tbl_broker_commission_initial_override] DEFAULT (0) FOR [initial_override],
	CONSTRAINT [DF_tbl_broker_commission_renewal_comm] DEFAULT (0) FOR [renewal_comm],
	CONSTRAINT [DF_tbl_broker_commission_renewal_override] DEFAULT (0) FOR [renewal_override],
	CONSTRAINT [DF_tbl_broker_commission_other_comm] DEFAULT (0) FOR [other_comm],
	CONSTRAINT [DF_tbl_broker_commission_other_override] DEFAULT (0) FOR [other_override]
GO

ALTER TABLE [dbo].[tbl_broker_compliance] WITH NOCHECK ADD 
	CONSTRAINT [DF_tbl_broker_compliance_done1] DEFAULT (0) FOR [done1],
	CONSTRAINT [DF_tbl_broker_compliance_done2] DEFAULT (0) FOR [done2],
	CONSTRAINT [DF_tbl_broker_compliance_done3] DEFAULT (0) FOR [done3],
	CONSTRAINT [DF_tbl_broker_compliance_done4] DEFAULT (0) FOR [done4],
	CONSTRAINT [DF_tbl_broker_compliance_done5] DEFAULT (0) FOR [done5],
	CONSTRAINT [DF_tbl_broker_compliance_done6] DEFAULT (0) FOR [done6],
	CONSTRAINT [DF_tbl_broker_compliance_done7] DEFAULT (0) FOR [done7],
	CONSTRAINT [DF_tbl_broker_compliance_done8] DEFAULT (0) FOR [done8],
	CONSTRAINT [DF_tbl_broker_compliance_done9] DEFAULT (0) FOR [done9],
	CONSTRAINT [DF_tbl_broker_compliance_done10] DEFAULT (0) FOR [done10],
	CONSTRAINT [DF_tbl_broker_compliance_done11] DEFAULT (0) FOR [done11],
	CONSTRAINT [DF_tbl_broker_compliance_done12] DEFAULT (0) FOR [done12],
	CONSTRAINT [DF_tbl_broker_compliance_done13] DEFAULT (0) FOR [done13],
	CONSTRAINT [DF_tbl_broker_compliance_done14] DEFAULT (0) FOR [done14],
	CONSTRAINT [DF_tbl_broker_compliance_done15] DEFAULT (0) FOR [done15],
	CONSTRAINT [DF_tbl_broker_compliance_avad_negative] DEFAULT (0) FOR [avad_negative],
	CONSTRAINT [DF_tbl_broker_compliance_cat93] DEFAULT (0) FOR [cat93]
GO

ALTER TABLE [dbo].[tbl_policy] WITH NOCHECK ADD 
	CONSTRAINT [DF_tbl_policy_additional_comm] DEFAULT (1) FOR [additional_comm],
	CONSTRAINT [DF_tbl_policy_pol_fund] DEFAULT (0) FOR [pol_fund]
GO

ALTER TABLE [dbo].[tbl_product] WITH NOCHECK ADD 
	CONSTRAINT [DF_tbl_product_product_type] DEFAULT (0) FOR [product_type],
	CONSTRAINT [DF_tbl_product_product_restrict_min_age_commence] DEFAULT (0) FOR [product_restrict_min_age_commence],
	CONSTRAINT [DF_tbl_product_product_restrict_max_age_commence] DEFAULT (0) FOR [product_restrict_max_age_commence],
	CONSTRAINT [DF_tbl_product_product_restrict_min_age_mature] DEFAULT (0) FOR [product_restrict_min_age_mature],
	CONSTRAINT [DF_tbl_product_product_restrict_max_age_mature] DEFAULT (0) FOR [product_restrict_max_age_mature],
	CONSTRAINT [DF_tbl_product_product_restrict_max_duration] DEFAULT (0) FOR [product_restrict_max_duration],
	CONSTRAINT [DF_tbl_product_comm_base] DEFAULT (0) FOR [comm_base],
	CONSTRAINT [DF_tbl_product_comm_fund_based] DEFAULT (0) FOR [comm_fund_based],
	CONSTRAINT [DF_tbl_product_comm_payment_after months] DEFAULT (0) FOR [comm_payment_after_months],
	CONSTRAINT [DF_tbl_product_comm_frequency_payment_months] DEFAULT (0) FOR [comm_frequency_payment_months],
	CONSTRAINT [DF_tbl_product_renewal_base] DEFAULT (0) FOR [renewal_base],
	CONSTRAINT [DF_tbl_product_renewal_fund_based] DEFAULT (0) FOR [renewal_fund_based],
	CONSTRAINT [DF_tbl_product_renewal_frequency_payment_months] DEFAULT (0) FOR [renewal_frequency_payment_months],
	CONSTRAINT [DF_tbl_product_other_base] DEFAULT (0) FOR [other_base],
	CONSTRAINT [DF_tbl_product_other_fund_based] DEFAULT (0) FOR [other_fund_based]
GO

ALTER TABLE [dbo].[tbl_product_provider_commission] WITH NOCHECK ADD 
	CONSTRAINT [DF_tbl_product_provider_commission_y1_rate] DEFAULT (0) FOR [y1_rate],
	CONSTRAINT [DF_tbl_product_provider_commission_y2_rate] DEFAULT (0) FOR [y2_rate],
	CONSTRAINT [DF_tbl_product_provider_commission_y3_rate] DEFAULT (0) FOR [y3_rate],
	CONSTRAINT [DF_tbl_product_provider_commission_y4_rate] DEFAULT (0) FOR [y4_rate],
	CONSTRAINT [DF_tbl_product_provider_commission_y5_rate] DEFAULT (0) FOR [y5_rate],
	CONSTRAINT [DF_tbl_product_provider_commission_renewal_rate] DEFAULT (0) FOR [renewal_rate],
	CONSTRAINT [DF_tbl_product_provider_commission_other_rate] DEFAULT (0) FOR [other_rate]
GO

