select
    master_table.id
    , master_table.name
    , case
      when tran_table.sort is null then master_table.sort
      else tran_table.sort 
    end as sort
from master_table
left outer join tran_table on master_table.id = tran_table.id
order by sort
;