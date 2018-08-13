select * from order_ding where rownum between 1 and 3
select count(*) from order_ding
select * from  (select order_ding.*,rownum as rm from order_ding order by order_date desc) b  
where b.rm between 3 and 6
delete  from order_ding where order_userid='123@123'