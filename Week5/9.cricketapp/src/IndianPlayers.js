import React from "react";

function IndianPlayers() {

  const Team = [
    "Sachin",
    "Virat",
    "Dhoni",
    "Rohit",
    "Rahul",
    "Hardik"
  ];

  const [odd1, even1, odd2, even2, odd3, even3] = Team;

  const T20players = [
    "Virat",
    "Rohit",
    "Hardik"
  ];

  const RanjiPlayers = [
    "Pujara",
    "Rahane",
    "Jaiswal"
  ];

  const mergedPlayers = [...T20players, ...RanjiPlayers];

  return (
    <div>

      <h2>Odd Team Players</h2>

      <p>{odd1}</p>
      <p>{odd2}</p>
      <p>{odd3}</p>

      <h2>Even Team Players</h2>

      <p>{even1}</p>
      <p>{even2}</p>
      <p>{even3}</p>

      <h2>Merged Players</h2>

      {mergedPlayers.map((player, index) => (
        <p key={index}>{player}</p>
      ))}

    </div>
  );
}

export default IndianPlayers;