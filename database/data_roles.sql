
insert into Roles (id, RoleName)
select 1,'Owner' as RoleName
Union All
select 2,'Admin' as RoleName
Union All
select 3,'Developer' as RoleName
