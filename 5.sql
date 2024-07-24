-- 1.30
use awaiz_tech

-- there are two tables: accounts(id, name) & transactions(acc_id, trans_id, date, value)
-- display id, name, num of transactions in March 2024, total transaction value where the account with highest transaction value first
select id, "name", count(trans_id) as num_of_trans, sum(value) as total
from accounts join transactions on account.id=transactions.acc_id where month(dt)=3 
group by id order by total desc