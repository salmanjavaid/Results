import re
import mechanize, urllib, urllib2
import pprint, time
from multiprocessing import Pool
import os
from bs4 import BeautifulSoup

br = mechanize.Browser()
count = 0

a = 140000
b = 160000


def fetchAfter(y):
        strfile = "E:\Results\\" + str(a) + "-" + str(b) + "\\" + str(y) + ".html"
        
        if (os.path.exists( os.path.join( "E:\Results\\" + str(a) + "-" + str(b) + "\\", str(y) + ".html" )) == 0):
                f = open(strfile, "w")
                try:
                       if(br.open("http://www.biselahore.com/result_ssc_annual_12.htm", timeout=100)):
                               if(br.response().read()):
                                  br.response().read()
                                  br.select_form(nr=1)
                                  br.form['student_rno'] = str(y)
                                  br.submit()
                                  if (br.response().read()):
                                          f.write(br.response().read())
                                          f.close()
                               
                       else:
                             print "Timed Out"
                except mechanize.URLError:
                       print "Connection failed"
        elif((os.path.getsize( os.path.join( "E:\Results\\" + str(a) + "-" + str(b) + "\\", str(y) + ".html" ) ) == 154772)):
                f = open(strfile, "w")
                try:
                       if(br.open("http://www.biselahore.com/result_ssc_annual_12.htm", timeout=100)):
                               if(br.response().read()):
                                  br.response().read()
                                  br.select_form(nr=0)
                                  br.form['student_rno'] = str(y)
                                  br.submit()
                                  if (br.response().read()):
                                          f.write(br.response().read())
                                          f.close()
                               
                       else:
                             print "Timed Out"
                except mechanize.URLError:
                       print "Connection failed"
        else:
                pprint.pprint("I am here")
                
##def fetch(y):
##       strfile = "E:\Results\\" + str(a) + "-" + str(b) + "\\" + str(y) + ".html"
##       f = open(strfile, "w")
####       try:
##       if(br.open("http://www.biselahore.com/result_ssc_annual_12.htm", timeout=100)):
##               if(br.response().read()):
##                  br.response().read()
##                  br.select_form(nr=0)
##                  br.form['student_rno'] = str(y)
##                  br.submit()
##                  if (br.response().read()):
##                          f.write(br.response().read())
##                          f.close()
####        except mechanize.URLError:
####                     print "Connection failed"

if __name__ == '__main__': 
       startresult = a
       endresult = b
##        fetchAfter(120592)
##      for i in range(1,100):
       start = time.time()
       pool = Pool(processes=8)
       print pool.map(fetchAfter, range(startresult,endresult))          
       print time.time()-start
##       startresult = endresult
##        endresult = endresult + 500
##        fetchAfter(range(1,10), 317854)
####        
