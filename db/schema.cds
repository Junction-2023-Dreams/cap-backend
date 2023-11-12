using { sap, managed, cuid } from '@sap/cds/common';
namespace soothify;

entity Users : cuid, managed {
    firstname: String;
    lastname: String;
    email: String;
    passwordHash: String;
    role: String;
    participations: Composition of ActivityParticipations on participations.patient = $self;
    doctors: Composition of ActivityParticipations on doctors.patient = $self;
    medications: Composition of PatientMedications on medications.patient = $self;
    painPoints: Composition of PatientMedications on painPoints.patient = $self;
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
    imageUrl: String;
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
    patients: Composition of PatientMedications on patients.medication = $self;
}

entity PatientMedications : cuid, managed {
    medication: Association to Medications;
    patient: Association to Users;
    amount: String;
    name: String;
    sideeffects: String;
}

entity PainPoints : cuid, managed {
    patient: Association to Users;
    isFront: Boolean;
    posX: Decimal;
    posY: Decimal;
}