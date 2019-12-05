const express = require("express");
const path = require("path");
const bodyparser = require("body-parser");

const app = express();

app.listen(3000, () => {
    console.log("Listening port 3000");
})

app.get("/", (req, res) => {
    res.setHeader("Content-Type", "text/plain");
    res.send("Hello word");
})