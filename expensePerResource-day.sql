SELECT cd.productname,r_id as resource ,   
--kv[cd.col0] as _1,kv[cd.col1] as _2,kv[cd.col2] as _3,kv[cd.col3] as _4,kv[cd.col4] as _5,kv[cd.col5] as _6,kv[cd.col6] as _7,kv[cd.col7] as _8,
kv[cd.col8] as _9,kv[cd.col9] as _10,kv[cd.col10] as _11
--,kv[cd.col11] as _12,kv[cd.col12] as _13,kv[cd.col13] as _14,kv[cd.col14] as _15,kv[cd.col15] as _16,kv[cd.col16] as _17,kv[cd.col17] as _18,kv[cd.col18] as --_19,kv[cd.col19] as _20,kv[cd.col20] as _21,kv[cd.col21] as _22,kv[cd.col22] as _23,kv[cd.col23] as _24,kv[cd.col24] as _25,kv[cd.col25] as _26,kv[cd.col26] --as _27,kv[cd.col27] as _28,kv[cd.col28] as _29,kv[cd.col29] as _30,kv[cd.col30] as _31
    from (
    select * from
    (SELECT linkedaccountid,resourceid as r_id,productname,itemdescription,  
    transform_values(multimap_agg(substring(usagestartdate,1,10)  ,blendedcost), (k, v) -> reduce(v,0.00,(s, x) -> s + x, s -> s)) as kv  
    FROM c_cust_db.c_res_fin_d_p1
     where linkedaccountid=260413673020
     and d_month='2020-01'
     and date_parse(usagestartdate,'%Y-%m-%d %H:%i:%s') > date_add('day',-3,NOW())
      GROUP BY linkedaccountid,productname,itemdescription, resourceid) t1,c_cust_db.c_res_fin_dates cd1) cd
      order by _9+_10+_11 desc 
