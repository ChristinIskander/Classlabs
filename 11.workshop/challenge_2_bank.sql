use bank;
--1
select * from client;
select client_id from client
where district_id =1
limit 5
--2
select client_id from client
where district_id =72
order by client_id desc
limit 1
--3
select * from loan
select amount from loan
order by amount asc
limit 3
--4
select distinct status from loan 
order by status asc
--5
select * from loan
select loan_id from loan 
order by payments desc
limit 1
--6
select account_id, amount from loan
order by account_id asc
limit 5
--7
select account_id from loan
where duration = 60
order by amount asc
limit 5
--8
select distinct k_symbol from `order`
where k_symbol<>""
order by k_symbol asc
--9
select order_id from `order`
where account_id=34
--10
select distinct account_id from `order`
where order_id between 29540 and 29560 
--11
select amount from `order`
where account_to = 30067122
--12
select trans_id, date, type, amount  from trans
where account_id = 793
order by date desc
limit 10
--13
select district_id, count(client_id) from client
where district_id < 10
group by district_id
order by district_id asc
--14
select * from card
select type, count(card_id) from card
group by type
--15
select * from loan
select account_id, sum(amount) from loan
group by account_id
order by sum(amount) desc
limit 10
--16
select date, count(loan_id) from loan
where date < 930907
group by date
order by date desc
--17
select date, duration, count(loan_id) from loan
where date between 971201 and 971231
group by date,duration
order by date, duration
--18
select * from trans
select account_id, type,sum(amount) as total_amount from trans
where account_id = 396
group by operation
select * from bank.account as acc inner join bank.loan as ln using (account_id)

select account_id, amount from bank.loan
where amount > (select avg(amount) from bank.loan)