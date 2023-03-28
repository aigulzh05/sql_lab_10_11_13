--SOZDANIYE TRIGGEROV
--10 lab
/*CREATE TRIGGER adding_klient
ON klientAFTER INSERT
ASINSERT INTO History (id_klient, description)
SELECT id_klient, 'Добавлен клиент ' + first_name + ' '+ middle_name + ' офис ' + officeFROM INSERTED
CREATE TRIGGER deleting_klient
ON klientAFTER DELETE
ASINSERT INTO History (id_klient, description)
SELECT id_klient, 'delated ' + first_name + ' '+ middle_name+' офис ' + officeFROM DELETED
*/

/*
CREATE TRIGGER updating_klient
ON klientafter UPDATE
ASINSERT INTO History (id_klient, description)
SELECT id_klient, 'Ubdated klient ' + first_name + ' '+middle_name+ ' офис ' + officeFROM inserted
PROVERKA
--insert into klient values('a','b','c','2022-03-07','some_office','some_position','no comments',1,1,1)
--update klient--set first_name='Irinova'
--where id_klient=8
delete from klient where id_klient=9
*/


--11 lab
/*
begin transaction
 declare @a int,@b int,@c int;
 set @a=10;
 set @b=15;
 set @c=0;
if @c>=0
 begin
 select @a+@b+@c;
 end;
else
 rollback transaction
commit transaction;


use ProductsMyDB
begin transaction
if (select full_name from klient where id_klient=6) is null
 rollback transaction
else
 update klient set login='someLoginOK' where id_klient=6
 commit transaction


begin transaction
if (select paid_status from zakaz where id_klient=5) = 0
 rollback transaction
else
 insert into Zakaz values('2021-02-06','460846','no comments',5,1,1,1,1,1)
 commit transaction