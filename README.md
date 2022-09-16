# left_outer_join_order_by

left outer join と order byを組み合わせる。  
片方のテーブルにレコードがない場合は、もう片方を参照してorder byする。

## 実行

``` bash
sqlite3 sample.db < select.sql
```

## 定義

### テーブル

``` sql
create table master_table(id integer primary key autoincrement, name text, sort integer);
create table tran_table(id integer primary key autoincrement, sort integer);
```

### データ

#### master

``` csv
1,hoge,1
2,piyo,2
3,fuga,3
```

#### tran

``` csv
1,2
2,1
```

### select

``` sql
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
```