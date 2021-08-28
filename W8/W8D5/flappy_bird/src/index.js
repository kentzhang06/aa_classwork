import FlappyBird from './game';

document.addEventListener("DOMContentLoaded", function(){
  const canvas = document.getElementById('bird-game');
  let newGame = new FlappyBird(canvas);
  newGame.restart();
  newGame.play();
});

// const canvas = document.getElementById('bird-game');
// let newGame = new FlappyBird(canvas);
// newGame.restart();
