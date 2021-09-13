import React from 'react';
import ReactDOM from 'react-dom';
import Congrats from './congrats';
import Autocomplete from './frontend/autocomplete';
import Clock from './frontend/clock.jsx';
import Tabs from './frontend/tabs';
import Weather from './frontend/weather';

function Root() {
  const list = [
    { title: "t1", content: "c1" },
    { title: "t2", content: "c2" },
    { title: "t3", content: "c3" }
  ]
  const names = [
    'Spencer',
    'James',
    'Kent',
    'Kenny'
  ]

  return(
    <div>
      <Clock/>
      <Tabs tabs={list}/>
      <Weather/>
      <Autocomplete names={names}/>
    </div>
  )
}

document.addEventListener("DOMContentLoaded", () => {
  const root = document.getElementById("root");

  ReactDOM.render(<Root/>, root);
});
