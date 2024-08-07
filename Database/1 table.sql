use ACutAboveDB
GO
DROP table if exists Appointment
go 

CREATE TABLE dbo.Appointment (
    AppointmentID int not null identity primary key,
    ClientFirstName varchar(50) not null constraint ck_Appointment_ClientFirstName_cannot_be_blank check(ClientFirstName > ''),
    ClientLastName varchar(50) not null constraint ck_Appointment_ClientLastName_cannot_be_blank check(ClientLastName > ''),
    PhoneNumber varchar(12) not null constraint ck_Appointment_PhoneNumber_cannot_be_blank check(PhoneNumber > ''),
    AppointmentDate datetime not null 
        constraint ck_Appointment_AppointmentDate_cannot_be_on_friday_or_saturday check(lower(datename(WEEKDAY,AppointmentDate)) not in ('friday', 'saturday')),
    DayOfWeek as datename(WEEKDAY, AppointmentDate),
    Hairdresser varchar(50) not null constraint ck_Appointment_Hairdresser_must_be_Sara_Penina_or_Leah check(Hairdresser in('Leah', 'Penina', 'Sara')),
    ServiceReq varchar(50) not null constraint ck_Appointment_ServiceReq_must_be_hairstyle_or_haircut check(ServiceReq in('Hairstyle', 'Haircut')),
    Price as case ServiceReq 
    when 'Hairstyle' then 36
    else 25
    end persisted, 
    Paid bit not null default 0,
    Tips decimal(10, 2) not null default 0.00,
    constraint u_Appointment_Hairdresser_AppointmentDate unique(Hairdresser, AppointmentDate),
    constraint ck_Appointment_Hairdresser_not_available_selected_time 
        check(
        (Hairdresser = 'Sara' AND DATEPART(HOUR, AppointmentDate) between 15 and 17) OR
        (Hairdresser = 'Leah' AND DATEPART(HOUR, AppointmentDate) between 10 and 19) OR
        (Hairdresser = 'Penina' AND DATEPART(HOUR, AppointmentDate) between 14 and 19)
    )
);



