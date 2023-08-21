const client = require('./connection.js')
const express = require('express');
const app = express();

app.use(express.json());

app.listen(8080, ()=>{
    console.log("Sever is now listening at port 8080");
})

app.get('/universities', (req, res)=>{
    client.query(`SELECT * FROM universities`, (err, result)=>{
        if(!err){
            res.send(result.rows);
        }
    });
})

app.get('/universities/:id', (req, res)=>{
    client.query(`SELECT universities.uni_id, universities.uni_name, students.std_name
                    FROM universities
                    LEFT JOIN students_universities ON universities.uni_id = students_universities.uni_id
                    LEFT JOIN students ON students_universities.std_id = students.std_id 
                    WHERE universities.uni_id = ${req.params.id}`, (err, result)=>{
        if(!err){
            res.send(result.rows);
        }
    });
})

app.post('/universities', (req, res)=> {
    const universities = req.body;
    let insertQuery = `INSERT INTO universities(uni_id, uni_name) 
                       VALUES(${universities.uni_id}, '${universities.uni_name}')`
    client.query(insertQuery, (err, result)=>{
        if(!err){
            res.send('Insertion was successful')
        }
        else{ console.log(err.message) }
    })
})

app.put('/universities/:id', (req, res)=> {
    let universities = req.body;
    let updateQuery = `UPDATE universities
                       SET uni_name = '${universities.uni_name}'
                       WHERE universities.uni_id = ${req.params.id}`

    client.query(updateQuery, (err, result)=>{
        if(!err){
            res.send('Update was successful')
        }
        else{ console.log(err.message) }
    })
})

app.delete('/universities/:id', (req, res)=> {
    let insertQuery = `DELETE FROM universities WHERE universities.uni_id = ${req.params.id}`

    client.query(insertQuery, (err, result)=>{
        if(!err){
            res.send('Deletion was successful')
        }
        else{ console.log(err.message) }
    })
})

app.get('/students', (req, res)=>{
    client.query(`SELECT * FROM students`, (err, result)=>{
        if(!err){
            res.send(result.rows);
        }
    });
})

app.get('/students/:id', (req, res)=>{
    client.query(`SELECT students.std_id, students.std_name, universities.uni_name
                    FROM students
                    LEFT JOIN students_universities ON students.std_id = students_universities.std_id
                    LEFT JOIN universities ON students_universities.uni_id = universities.uni_id 
                    WHERE students.std_id = ${req.params.id}`, (err, result)=>{
        if(!err){
            res.send(result.rows);
        }
    });
})

app.post('/students', (req, res)=> {
    const students = req.body;
    let insertQuery = `INSERT INTO students(std_id, std_name) 
                       VALUES(${students.std_id}, '${students.std_name}')`
    client.query(insertQuery, (err, result)=>{
        if(!err){
            res.send('Insertion was successful')
        }
        else{ console.log(err.message) }
    })
})

app.put('/students/:id', (req, res)=> {
    let students = req.body;
    let updateQuery = `UPDATE students
                       SET std_name = '${students.std_name}'
                       WHERE students.std_id = ${req.params.id}`

    client.query(updateQuery, (err, result)=>{
        if(!err){
            res.send('Update was successful')
        }
        else{ console.log(err.message) }
    })
})

app.delete('/students/:id', (req, res)=> {
    let insertQuery = `DELETE FROM students WHERE students.std_id = ${req.params.id}`

    client.query(insertQuery, (err, result)=>{
        if(!err){
            res.send('Deletion was successful')
        }
        else{ console.log(err.message) }
    })
})

app.post('/register', (req, res) => {
    const students_universities = req.body;

    let insertQuery = `INSERT INTO students_universities (std_id, uni_id) 
                       VALUES (${students_universities.std_id}, ${students_universities.uni_id})`;

    let checkReferencesQuery = `SELECT students.std_id FROM students WHERE std_id = ${students_universities.std_id}
                                AND EXISTS (SELECT universities.uni_id FROM universities WHERE uni_id = ${students_universities.uni_id})`;

    client.query(checkReferencesQuery, (refErr, refResult) => {
        if (refErr) {
            console.log(refErr.message);
            res.status(500).send('insert students id and university id');
        } else if (refResult.rows.length === 0) {
            res.status(400).send('not have student or university in database');
        } else {
            client.query(insertQuery, (err, result) => {
                if (err) {
                    console.log(err.message);
                    res.status(500).send('An error occurred');
                } else {
                    res.send('register successfully');
                }
            });
        }
    });
});

client.connect()