using { soothify as app } from '../db/schema';

@(path: '/soothify')
service SoothifyService {
    @(requires:'authenticated-user')
    entity Users as projection on app.Users;
    action login (email:String,password:String) returns { 
        email: String;
        firstname: String;
        lastname: String;
        role: String;
        token: String;
    };
}