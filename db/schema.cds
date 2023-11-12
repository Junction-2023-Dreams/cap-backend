using { sap, managed, cuid } from '@sap/cds/common';
namespace soothify;

entity Users : cuid, managed {
    firstname: String;
    lastname: String;
    email: String;
    passwordHash: String;
    role: String;
}

entity Patients : cuid, managed {
    patient: Association to Users;
    doctor: Association to Users;
}

entity Heartrates : cuid, managed {
    patient: Association to Users;
    heartrate: Integer;
}

entity Activities : cuid, managed {
    name: String;
    description: String;
    startTime: DateTime;
    location: String;
    participations: Composition of ActivityParticipations on participations.activity = $self;
}

entity ActivityParticipations : cuid, managed {
    patient: Association to Users;
    activity: Association to Activities;
}

entity Medications : cuid, managed {
    name: String;
    description: String;
    sideeffects: String;
    defaultAmount: String;
}

entity PatientMedications : cuid, managed {
    medication: Association to Medications;
    patient: Association to Users;
}

entity PainPoints : cuid, managed {
    patient: Association to Users;
    isFront: Boolean;
    posX: Decimal;
    posY: Decimal;
}