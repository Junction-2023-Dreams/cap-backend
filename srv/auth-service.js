const cds = require('@sap/cds');
const jwt = require('jsonwebtoken');
const dotenv = require("dotenv");
dotenv.config({ path: __dirname + "/env/.env"});

module.exports = async function() {
	const db = await cds.connect.to("db");
	let { Users } = db.entities;
    
    this.on('login', async req => {
        const { email, password } = req.data;

        // TODO: IMPLEMENT PASSWORD HASH LOL
        const user = await SELECT.from(Users, (h) => {
            h`.*`;
        }).where`email=${email} AND passwordHash=${password}`;
        console.log(user, user.length)
        if(user.length !== 1) {
            throw req.reject(400);
        }

        console.log(user[0])

        const token = jwt.sign({
            ID: user[0].ID,
            email: user[0].email,
            firstname: user[0].firstname,
            lastname: user[0].lastname,
            role: user[0].role,
        }, process.env.JWT_SIGN_TOKEN, {
            expiresIn: "2h"
        })
        return {
            ID: user[0].ID,
            email: user[0].email,
            firstname: user[0].firstname,
            lastname: user[0].lastname,
            role: user[0].role,
            token: token
        };
    })
}