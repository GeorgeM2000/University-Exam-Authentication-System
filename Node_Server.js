const express = require("express");
const path = require("path");
const mysql = require("mysql2");

const app = express();
const port = process.env.PORT || 3000;


app.use(express.static(path.join(__dirname, "")));
app.use(express.static(path.join(__dirname, "Frontend")));
app.use(express.urlencoded({extended: true}));

// Create connection and specify DB information
var mysql_connection = mysql.createConnection({
    host: "url",
    user: "username",
    password: "password for database",
    port: "port to database",
    database: "your database"
});

// Connect to MySQL DB
mysql_connection.connect((err) => {
    if(!err)
        console.log("Database connection succeded.");
    else
        console.log("Database connection failed.\nError : " + JSON.stringify(err, undefined, 2));
})


// Check if server is working
app.get("/login", (req, res) => {
    res.sendFile("/Frontend/Login.html");
});


app.get("/id_verification", (req, res) => {
    res.sendFile("/Frontend/ID_Verification.html");
});


// Route to handle qr_scan logic
app.post("/id_verification", (req, res) => {
    let spawn = require("child_process").spawn;

    let process = spawn("python.exe", ["./QR_Code_Reader.py"]);

    process.stdout.on("data", function(data) {

        // Get the QR code number
        let student_code = data.toString();

        // Strip all non numerical characters
        student_code = student_code.replace(/\D/g, '');

        // Make query
        mysql_connection.query(`select * from Student_Info where student_code = '${student_code}'`, (error, result) => {
            if(!error){
                if(result.length == 0){
                    console.log("QR code not found.");
                } else {
                    res.send(result);
                }
            } else {
                console.log(error);
            }
        });
    });

});


// Route to handle login logic
app.post("/login", (req, res) => {

    // Make query
    mysql_connection.query(`select academic_email, academic_password 
                            from Student_Authentication_Info
                            where academic_email = '${req.body.email}' and academic_password = '${req.body.password}'`, 
                            (error, result) => {
                                if(!error){
                                    if(result.length == 0){
                                        console.log("Authentication failed.")
                                    } else {
                                        res.redirect("/id_verification");
                                    }
                                    
                                }else {
                                    console.log(error);
                                }
    });
});


// Start the server on port 3000
app.listen(port, () => {
    console.log(`Server is running on post ${port}`);
});
