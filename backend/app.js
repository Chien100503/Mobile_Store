const express = require("express");
const body_parser = require("body-parser");
const connectDb = require("./config/db");
const UserRouter = require("./routers/user.router");

const app = express();
connectDb();
app.use(body_parser.json());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use("/", UserRouter);

module.exports = app;
