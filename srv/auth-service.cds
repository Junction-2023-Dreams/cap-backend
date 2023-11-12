using { soothify as app } from '../db/schema';

@(path: '/soothify')
service SoothifyService {
    @(requires:'authenticated-user')
    entity Users as projection on app.Users excluding {
        passwordHash
    };
    
    @(requires:'authenticated-user')
    entity Patients as projection on app.Patients;

    @(requires:'authenticated-user')
    entity Heartrates as projection on app.Heartrates;
    
    @(requires:'authenticated-user')
    entity Activities as projection on app.Activities;
    
    @(requires:'authenticated-user')
    entity ActivityParticipations as projection on app.ActivityParticipations;
    
    @(requires:'authenticated-user')
    entity Medications as projection on app.Medications;

    @(requires:'authenticated-user')
    entity PatientMedications as projection on app.PatientMedications;

    @(requires:'authenticated-user')
    entity PainPoints as projection on app.PainPoints;

    action login (email:String,password:String) returns { 
        ID: String;
        email: String;
        firstname: String;
        lastname: String;
        role: String;
        token: String;
    };
}