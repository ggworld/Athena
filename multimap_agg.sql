-- Get columns per each day in month with sum of all data 
SELECT resourceid,sum(blendedcost) blc1, min(coalesce(substring(usagestartdate,1,10),'2')) ,multimap_agg(substring(usagestartdate,1,10)  ,blendedcost) as kv,
 transform_values(multimap_agg(substring(usagestartdate,1,10)  ,blendedcost), (k, v) -> reduce(v,0.00,(s, x) -> s + x, s -> s)) as sum_kv
 from c_cust_db.c_res_fin_d
 where 
 resourceid= 'XXXX'
 and recordtype='LineItem' 
 group by resourceid
