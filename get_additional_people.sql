-- get names of pepole who where withsomonw else ...
select name,personId,count(personId)
from  "default"."FindMyPeopleApiStack-FilesTable1399FAA4-1CHT6DQZFRXP5" tab1
where name in
(
select name
from  "default"."FindMyPeopleApiStack-FilesTable1399FAA4-1CHT6DQZFRXP5" tab1
where name in
(
select name
from "default"."FindMyPeopleApiStack-FilesTable1399FAA4-1CHT6DQZFRXP5"
where personid = lower('USER_NAME_1')  
or personid = lower('USER_NAME_2')
group by name 
having count (distinct personId)>=2
)
group by name
having count (distinct personId) > 2)
group by name,personId
order by name,personId
