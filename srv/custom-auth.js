
const { jwtDecode } = require('jwt-decode')

module.exports = async function custom_auth (req, res, next) {
	const db = await cds.connect.to("db");
	let { Users } = db.entities;
    
    const token = req.header("authorization");
    if(!token || typeof token !== 'string') {
        next();
        return;
    } 
    const payload = jwtDecode(token);
    const user = await SELECT.from(Users, (h) => {
        h`.*`;
    }).where`ID=${payload.ID}`;
    if(user.length === 0) {
        next();
        return 
    }

    req.user = new cds.User("Dummy");

    next();
}