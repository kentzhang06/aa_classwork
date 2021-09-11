import React from 'react';
import ReactDOM from 'react-dom';
import Congrats from './congrats';
import Clock from './frontend/clock.jsx';
import Tabs from './frontend/tabs'

function Root() {
  const list = [
    { title: "t1", content: "c1" },
    { title: "t2", content: "c2" },
    { title: "t3", content: "c3" }
  ]
  return(
    <div>
      <Clock/>
      <Tabs tabs={list}/>
    </div>
  )
}

document.addEventListener("DOMContentLoaded", () => {
  const root = document.getElementById("root");
  ReactDOM.render(<Root/>, root);
});
