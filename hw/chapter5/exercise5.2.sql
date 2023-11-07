SELECT u.id, u.name, t.seat_number
FROM users u
JOIN tickets t ON u.id = t.user
JOIN trains tr ON t.train = tr.id
WHERE tr.id = 11
ORDER BY t.seat_number;

SELECT u.id, u.name, COUNT(t.user) AS trains_count, SUM(tr.distance) AS total_distance
FROM users u
LEFT JOIN tickets t ON u.id = t.user
LEFT JOIN trains tr ON t.train = tr.id
GROUP BY u.id, u.name
ORDER BY total_distance DESC
LIMIT 6;

SELECT tr.id, ty.name AS type, s1.name AS src_stn, s2.name AS dst_stn,
TIMEDIFF(tr.arrival, tr.departure) AS travel_time
FROM trains tr
JOIN types ty ON tr.type = ty.id
JOIN stations s1 ON tr.source = s1.id
JOIN stations s2 ON tr.destination = s2.id
ORDER BY travel_time DESC
LIMIT 6;

SELECT ty.name AS type, s1.name AS src_stn, s2.name AS dst_stn,
tr.departure, tr.arrival, ROUND((tr.distance/100)*ty.fare_rate, -2) AS fare
FROM trains tr
JOIN types ty ON tr.type = ty.id
JOIN stations s1 ON tr.source = s1.id
JOIN stations s2 ON tr.destination = s2.id
ORDER BY tr.departure;

SELECT tr.id, ty.name AS type, s1.name AS src_stn, s2.name AS dst_stn,
COUNT(t.seat_number) AS occupied, ty.max_seats AS maximum
FROM trains tr
JOIN types ty ON tr.type = ty.id
JOIN stations s1 ON tr.source = s1.id
JOIN stations s2 ON tr.destination = s2.id
LEFT JOIN tickets t ON tr.id = t.train
GROUP BY tr.id
HAVING occupied > 0
ORDER BY tr.id;

SELECT tr.id, ty.name AS type, s1.name AS src_stn, s2.name AS dst_stn,
IFNULL(COUNT(t.seat_number), 0) AS occupied, ty.max_seats AS maximum
FROM trains tr
JOIN types ty ON tr.type = ty.id
JOIN stations s1 ON tr.source = s1.id
JOIN stations s2 ON tr.destination = s2.id
LEFT JOIN tickets t ON tr.id = t.train
GROUP BY tr.id
ORDER BY tr.id;
