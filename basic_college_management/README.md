# basic collage management 
is a vuln web site to XSS and SQLi

## XXS
### reflected XSS
> reflected XSS found in **all_students.php page at search function** 
> u can use `?search=<image%20src=s%20onerror=prompt(8)>` as a payload to test the vuln

### sotred XXS
> stored XSS found in **add_student.php page at Address field** 
> u can insert `<script>alertt(2)</script>` in Address field as a payload 
> to test the vuln go to **all_students.php page** 
