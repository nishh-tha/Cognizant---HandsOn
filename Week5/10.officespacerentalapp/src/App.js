import React from "react";
import officeImage from "./office.jpeg";

function App() {
  const office = {
    Name: "DBS",
    Rent: 50000,
    Address: "Chennai",
  };

  const officeSpaces = [
    {
      Name: "DBS",
      Rent: 50000,
      Address: "Chennai",
    },
    {
      Name: "Regus",
      Rent: 75000,
      Address: "Bangalore",
    },
    {
      Name: "WeWork",
      Rent: 65000,
      Address: "Hyderabad",
    },
  ];

  return (
    <div style={{ padding: "20px" }}>
      <h1>Office Space Rental App</h1>

      <img
        src={officeImage}
        alt="Office Space"
        width="500"
        height="300"
      />

      <h2>Featured Office</h2>

      <h3>Name: {office.Name}</h3>

      <h3
        style={{
          color: office.Rent < 60000 ? "red" : "green",
        }}
      >
        Rent: ₹{office.Rent}
      </h3>

      <h3>Address: {office.Address}</h3>

      <hr />

      <h2>Available Office Spaces</h2>

      {officeSpaces.map((item, index) => (
        <div key={index}>
          <h3>Name: {item.Name}</h3>

          <h3
            style={{
              color: item.Rent < 60000 ? "red" : "green",
            }}
          >
            Rent: ₹{item.Rent}
          </h3>

          <h3>Address: {item.Address}</h3>

          <hr />
        </div>
      ))}
    </div>
  );
}

export default App;