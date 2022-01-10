--Who received a 1.5kg package?
select Name
from Client join Package on Client.AccountNumber=Package.Recipient
where Package.Weight=1.5
--What is the total weight of all the packages that he sent?
select sum(Package.Weight) as 'Total Weight'
from Client join Package on Client.AccountNumber=Package.Recipient
where Package.Sender like (select AccountNumber
					from Client join Package on Client.AccountNumber=Package.Recipient
					where Package.Weight=1.5)
/*select sum(Weight)
from Client join Package on Client.AccountNumber=Package.Sender
where Name like 'Al Gore''s Head'*/

--Which pilots transported those packages?
select Name
from Employee join Shipment on Employee.EmployeeID = Shipment.Manager
				join Package on Package.Shipment = Shipment.ShipmentID
where Package.Shipment in (select Package.Shipment
							from Client join Package on Client.AccountNumber=Package.Sender
							where Client.AccountNumber = (select AccountNumber
															from Client join Package on Client.AccountNumber=Package.Recipient
															where Package.Weight=1.5))
group by Employee.Name
