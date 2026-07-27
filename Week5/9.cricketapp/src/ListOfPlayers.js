import React from "react";

function ListofPlayers() {
  const players = [
    { name: "Sachin", score: 95 },
    { name: "Virat", score: 82 },
    { name: "Dhoni", score: 67 },
    { name: "Rohit", score: 78 },
    { name: "Rahul", score: 69 },
    { name: "Hardik", score: 74 },
    { name: "Jadeja", score: 58 },
    { name: "Gill", score: 90 },
    { name: "Pant", score: 72 },
    { name: "Bumrah", score: 45 },
    { name: "Shami", score: 80 }
  ];

  const below70 = players.filter(player => player.score < 70);

  return (
    <div>
      <h2>List of Players</h2>

      {players.map((player, index) => (
        <p key={index}>
          {player.name} - {player.score}
        </p>
      ))}

      <h2>Players with Score below 70</h2>

      {below70.map((player, index) => (
        <p key={index}>
          {player.name} - {player.score}
        </p>
      ))}
    </div>
  );
}

export default ListofPlayers;