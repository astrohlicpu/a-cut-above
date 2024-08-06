use ACutAboveDB
go

delete Appointments
go


insert Appointments
    (ClientFirstName, ClientLastName, PhoneNumber, AppointmentDate, Hairdresser, ServiceReq, Paid, Tips)
    select 'Rivka', 'Adler', '845-425-5462', '2024-07-02 10:15', 'Leah', 'haircut', 1, 5
union
    select 'Sara', 'Cohn', '914-582-0987', '2024-07-04 17:45', 'Penina', 'hairstyle', 1, 3
union
    select 'Rochel', 'Weiss', '347-334-5466', '2024-07-07 15:30', 'Leah', 'hairstyle', 1, 4
union
    select 'Malka', 'Aron', '432-987-8776', '2024-07-07 15:00', 'Leah', 'haircut', 0, 0
union
    select 'Peri', 'Katz', '213-345-9876', '2024-07-07 16:00', 'Sara', 'haircut', 0, 0
union
    select 'Yali', 'Lax', '432-234-9864', '2024-07-16 14:30', 'Penina', 'hairstyle', 1, 10
union
    select 'Kaylee', 'Lax', '432-234-9864', '2024-07-16 15:00', 'Penina', 'hairstyle', 1, 0
union
    select 'Faygie', 'Ackerman', '576-965-9090', '2024-09-19 16:00', 'Sara', 'hairstyle', 1, 0
union
    select 'Esther', 'Bodner', '334-746-8665', '2024-09-25 14:00', 'Penina', 'haircut', 1, 0
union
    select 'Dena', 'Pollack', '578-849-2002', '2024-09-25 15:30', 'Leah', 'hairstyle', 1, 0


select * from Appointments