<%-- 
    Document   : ticketfile
    Created on : 22 Mar, 2024, 5:11:26 PM
    Author     : Blesson MS George
--%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Flight Ticket Booker</title>
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
    }
    .container {
        width: 80%;
        margin: 20px auto;
    }
    h2 {
        text-align: center;
    }
    form {
        background-color: #f9f9f9;
        padding: 20px;
        border-radius: 5px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
    input[type="text"], input[type="date"], input[type="submit"] {
        width: calc(100% - 20px);
        padding: 10px;
        margin-bottom: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
    }
    input[type="submit"] {
        background-color: #4CAF50;
        color: white;
        border: none;
        cursor: pointer;
    }
</style>
</head>
<body>
<div class="container">
    <h2>Flight Ticket Booker</h2>
    <form id="flightSearchForm">
        <input type="text" id="departure" placeholder="Departure Airport" required>
        <input type="text" id="destination" placeholder="Destination Airport" required>
        <input type="date" id="date" required>
        <input type="submit" value="Search Flights">
    </form>
    <div id="flightResults"></div>
</div>

<script>
    // Mock flight data (replace with real data from backend)
    const flights = [
        { id: 1, departure: "New York", destination: "Los Angeles", date: "2024-03-30", price: 250 },
        { id: 2, departure: "Los Angeles", destination: "New York", date: "2024-04-02", price: 300 },
        { id: 3, departure: "Chicago", destination: "Miami", date: "2024-04-05", price: 200 }
    ];

    // Function to search flights
    function searchFlights(event) {
        event.preventDefault();
        const departure = document.getElementById('departure').value;
        const destination = document.getElementById('destination').value;
        const date = document.getElementById('date').value;
        const flightResults = document.getElementById('flightResults');
        flightResults.innerHTML = '';

        const filteredFlights = flights.filter(flight => flight.departure.toLowerCase() === departure.toLowerCase() && 
                                                        flight.destination.toLowerCase() === destination.toLowerCase() &&
                                                        flight.date === date);

        if (filteredFlights.length === 0) {
            flightResults.innerHTML = '<p>No flights found.</p>';
        } else {
            const ul = document.createElement('ul');
            filteredFlights.forEach(flight => {
                const li = document.createElement('li');
                li.textContent = `${flight.departure} to ${flight.destination} - Price: $${flight.price}`;
                const bookButton = document.createElement('button');
                bookButton.textContent = 'Book';
                bookButton.addEventListener('click', () => bookFlight(flight.id));
                li.appendChild(bookButton);
                ul.appendChild(li);
            });
            flightResults.appendChild(ul);
        }
    }

    // Function to book a flight
    function bookFlight(flightId) {
        alert(`Booking confirmed for flight ID: ${flightId}`);
    }

    // Event listener for form submission
    document.getElementById('flightSearchForm').addEventListener('submit', searchFlights);
</script>
</body>
</html>
