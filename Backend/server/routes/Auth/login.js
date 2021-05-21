const express = require("express");
const jwt = require("jsonwebtoken");
const login = express.Router();

//Passport file for login/register
const passport = require("../../Auth");

//Login passport authentication
login.post("/login", function (req, res) {
  passport.authenticate("local-login", function (error, user, info) {
    // console.log('user found:', user);
    if (error) {
      return res.status(500).json({
        message: error || "Something happend",
        error: error.message || "Server error",
      });
    }
    const token = jwt.sign({ _id : user._id.toString()} , 'ilovejs')
    req.logIn(user, function (error, data) {
      if (error) {
        return res.status(500).json({
          message: error || "Something happend",
          error: error.message || "Server error",
        });
      }
    });

    user.isAuthenticated = true;
    return res.json({ ... user , token });
  })(req, res);
});

module.exports = login;
