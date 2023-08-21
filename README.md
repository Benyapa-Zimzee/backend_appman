Describe

download
-npm init
-npm i --save body-parser express pg

server running on port localhost:8080

run : node api.js

students api
get all students (http://localhost:8080/students/)
get student by id (http://localhost:8080/students/:id)
post student (http://localhost:8080/students/)
put student by id (http://localhost:8080/students/:id)
delete student by id (http://localhost:8080/students/:id)
value:{
        "std_id": ,
        "std_name": ""
      }

universities api
get all students (http://localhost:8080/universities/)
get student by id (http://localhost:8080/universities/:id)
post student (http://localhost:8080/universities/)
put student by id (http://localhost:8080/universities/:id)
delete student by id (http://localhost:8080/universities/:id)
value:{
        "uni_id": ,
        "uni_name": ""
      }

register student in the university
http://localhost:8080/register
value:{
        "std_id": ,
        "uni_id": 
      }
