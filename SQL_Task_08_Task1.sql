-- Task_08_01 : Find if we can do insert, update, alter , delete on view 

-- yes, you can insert and update into a view if the view is updatable and satisfies the following conditions:
-- the view is based on a single table (not a join or union).
-- the view does not contain distinct, group by, having, limit, or aggregate functions.
-- all the columns required for insertion (non-null columns in the base table) are present in the view.
-- alter: You cannot directly alter a view. Instead, you can:
-- drop the view using drop view and recreate it.
-- use create or replace view to modify its structure.
-- delete: You can delete rows through a view if:
-- the view is updatable and it does not include clauses like distinct, group by, having, or joins.
	
select * from players;

-- creating view
create view player_view 
as select id,year,name,number,position from players;

select * from player_view;

-- inserting into view
insert into player_view 
values (307,2022,'Johny Orlando',91,'CB');

-- deleting view row
delete from player_view 
where id = 305;

-- updating view row
update player_view 
set name = 'Francisko Addams'
where id = 306;

-- as for alter as we specify in above statement we cannot alter view but instead we can drop and recreate view
alter view player_view 
add column age int;

-- if we try to run this query the above erroe will appear
-- ERROR:  This operation is not supported for views.ALTER action ADD COLUMN cannot be performed on relation "player_view" 
-- ERROR:  ALTER action ADD COLUMN cannot be performed on relation "player_view"
-- SQL state: 42809
-- Detail: This operation is not supported for views.