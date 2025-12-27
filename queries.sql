 -- Requirement: Retrieve booking information along with Customer name and Vehicle name.
SELECT
  booking_id,
  users.name AS customer_name,
  vehicles.name AS vehicle_name,
  start_date,
  end_date,
  bookings.status
FROM
  bookings
  INNER JOIN users ON bookings.user_id = users.user_id
  INNER JOIN vehicles ON bookings.vehicle_id = vehicles.vehicle_id



  -- Requirement: Find all vehicles that have never been book
SELECT
  *
FROM
  vehicles
WHERE
  NOT EXISTS (
    SELECT
      *
    FROM
      bookings
    WHERE
      bookings.vehicle_id = vehicles.vehicle_id
  )



-- Requirement: Retrieve all available vehicles of a specific type (e.g. cars).
SELECT * FROM vehicles WHERE status ='available' AND type = 'car';



-- Find the total number of bookings for each vehicle and display only those vehicles that have more than 2 bookings.
SELECT vehicles.name AS vehicle_name , 
 COUNT(bookings.booking_id) AS total_bookings
  FROM bookings INNER JOIN vehicles
   USING(vehicle_id) 
    GROUP BY vehicles.name
      HAVING COUNT (bookings.booking_id) > 2;

