import React from 'react';
import ReactDOM from 'react-dom';
import Game from "./components/game.jsx";

function Tile() {
  return (
    <div>
      T
    </div>
  )
}

document.addEventListener("DOMContentLoaded", () => {
  const root = document.getElementById("root");

  ReactDOM.render(<Game/>, root);
});