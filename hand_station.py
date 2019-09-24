#not working but the base
from collections import Counter
import csv
def as_p(x,n,m_ste):
    global c
    c[x]={'start' :m_ste.find(x),'end':0}
l_n=0
with open('/Users/allcloud/Documents/tmp/isd-history.txt','r') as i_f, open('/Users/allcloud/Documents/tmp/isd-history.csv','w') as o_f:
    i_w=csv.writer(o_f,quotechar="'", quoting=csv.QUOTE_MINIMAL)
    i_r=csv.reader(i_f)
    for i in range(20):
        header=next(i_r)
        l_n+=1
    header=next(i_r)
    l_n+=1
    print(header)
    print('-'*50)
    c=Counter()
    i_w=csv.writer(o_f,quotechar="'", delimiter=',',quoting=csv.QUOTE_MINIMAL)
    titles=['USAF','WBAN','STATION NAME','CTRY','ST ','CALL','LAT','LON','ELEV(M)','BEGIN','END']
    [as_p(x,n,header[0]) for n,x in enumerate(titles)]
    prev=''
    for i in c:
        if prev:
            c[prev]['end']=c[i]['start']-1
        prev=i
        if i == 'END':
             c[i]['end']=c[i]['start']+8
            
    print(c)
    line_l=[]
    for ll in c:
        print(l_n)
        line_l.append(header[0][c[ll]['start']:c[ll]['end']])
        l_n+=1
    i_w.writerow(line_l)
    line_l=[]
    
    for i in i_r:
        for ll in c:
            line_l.append(i[0][c[ll]['start']:c[ll]['end']])
        i_w.writerow(line_l)
        line_l=[]
