import React from "react";
import ListofPlayers from "./ListOfPlayers";
import IndianPlayers from "./IndianPlayers";

function App() {

  const flag = false;

  if (flag) {
    return <ListofPlayers />;
  } else {
    return <IndianPlayers />;
  }

}

export default App;