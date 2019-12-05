const express = require("express");
const path = require("path");
const bodyparser = require("body-parser");
const ejs = require("ejs");
const mysql = require("mysql");

const app = express();

app.set("view engine", "ejs");

//Connection à la base de données
const db = mysql.createConnection({
    host: "localhost",
    database: "nuit_info",
    user: "root",
    password:""
});
db.connect((err) => {
    if(err) {
        throw err;
    }
    console.log("Connected to database");
})

//Requetes BDD
db.query("SELECT * FROM information", (err, result) => {
    if(err) {
        console.log(err.message);
        return;
    }
    console.log(result);
});

//création des routes
app.get("/", (req, res) => {
    res.setHeader("Content-Type", "text/html");
    res.render("pages/home.ejs");
})

app.get("/forum", (req, res) => {
    res.setHeader("Content-Type", "text/html");
    res.render("pages/forum.ejs");
})

app.listen(3000, () => {
    console.log("Listenning port 3000");
})

//fermeture de la connection à la base
db.end();
