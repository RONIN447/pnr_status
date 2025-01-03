document.getElementById('getTicket').addEventListener('click', async () => {
  const pnr = document.getElementById('pnr').value;
  const ticketDetailsSection = document.getElementById('ticketDetails');

  // Clear previous results
  ticketDetailsSection.innerHTML = '';

  try {
    const response = await fetch(`http://127.0.0.1:3000/ticket/${pnr}`);
    if (response.ok) {
      const ticket = await response.json();

      // Convert fare to a number if it is a string
      const fare = parseFloat(ticket.fare);

      // Create table to display ticket details
      ticketDetailsSection.innerHTML = `
        <table>
          <tr>
            <th>PNR</th>
            <td>${ticket.pnr}</td>
          </tr>
          <tr>
            <th>Train Name</th>
            <td>${ticket.train_name}</td>
          </tr>
          <tr>
            <th>Journey Date</th>
            <td>${new Date(ticket.journey_date).toLocaleDateString()}</td>
          </tr>
          <tr>
            <th>Fare</th>
            <td>₹${fare.toFixed(2)}</td>
          </tr>
          <tr>
            <th>Passenger Name</th>
            <td>${ticket.passenger_name}</td>
          </tr>
          <tr>
            <th>Berth Status</th>
            <td>${ticket.berth_status}</td>
          </tr>
          <tr>
            <th>Berth Number</th>
            <td>${ticket.berth_number}</td>
          </tr>
          <tr>
            <th>Source Station</th>
            <td>${ticket.source_station}</td>
          </tr>
          <tr>
            <th>Destination Station</th>
            <td>${ticket.destination_station}</td>
          </tr>
          <tr>
            <th>Class Type</th>
            <td>${ticket.class_type}</td>
          </tr>
          <tr>
            <th>Booking Time</th>
            <td>${ticket.booking_time}</td>
          </tr>
        </table>
      `;
    } else {
      ticketDetailsSection.innerHTML = '<p class="error">Ticket not found!</p>';
    }
  } catch (error) {
    console.error('Error fetching ticket:', error);
    ticketDetailsSection.innerHTML = '<p class="error">An error occurred while fetching ticket details.</p>';
  }
});
