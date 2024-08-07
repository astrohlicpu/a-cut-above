-- I will need the following reports:
use ACutAboveDB
go

-- 1) upoming appointments- seperate report for each hairdresser, ordered by appointment time with more recent appointment 
-- at the top of the list. Report should be formatted like this: Client first name client last name apt day of the week, apt datetime - service (price) phone number
select UpcomingAppointment_Sara = CONCAT(a.ClientFirstName, ' ', a.ClientLastName, ': ', a.DayOfWeek,', ', a.AppointmentDate, ' - ', a.ServiceReq, ' ($',a.Price,') ', a.PhoneNumber )
from Appointment a
where a.Hairdresser = 'sara' and a.AppointmentDate >= getdate()
order by a.AppointmentDate 

select UpcomingAppointment_Penina = CONCAT(a.ClientFirstName, ' ', a.ClientLastName, ': ', a.DayOfWeek,', ', a.AppointmentDate, ' - ', a.ServiceReq, ' ($',a.Price,') ', a.PhoneNumber )
from Appointment a
where a.Hairdresser = 'penina' and a.AppointmentDate >= getdate()
order by a.AppointmentDate 

select UpcomingAppointment_Leah = CONCAT(a.ClientFirstName, ' ', a.ClientLastName, ': ', a.DayOfWeek,', ', a.AppointmentDate, ' - ', a.ServiceReq, ' ($',a.Price,') ', a.PhoneNumber )
from Appointment a
where a.Hairdresser = 'leah' and a.AppointmentDate >= getdate()
order by a.AppointmentDate 

-- 2) money owed- clients who already had their Appointment and still haven't paid. report should show how many days late the payment is 

select a.ClientFirstName, a.ClientLastName, a.PhoneNumber, a.Price, a.Paid, DaysLate = datediff(DAY,a.AppointmentDate,GETDATE()), a.AppointmentDate
from Appointment a
where a.AppointmentDate < GETDATE()
    and a.Paid = 0

-- 3) best client- I need to know which client brought in the most money(including tips)
select top 1 a.ClientFirstName, a.ClientLastName, TotalPaid = sum(a.Price) + SUM(a.Tips)
from Appointment a 
group by a.ClientFirstName, a.ClientLastName
order by TotalPaid desc

-- 4) report showing amount of money I made per month (not including tips)
select Total = sum(a.Price), PerMonth = DATENAME(month, a.AppointmentDate)
from Appointment a
group by DATENAME(month, a.AppointmentDate)
