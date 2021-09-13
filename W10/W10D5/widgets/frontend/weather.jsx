import React from "react";

class Weather extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      weather: null
    };

    this.extractWeather = this.extractWeather.bind(this);
  }

  componentDidMount() {
    navigator.geolocation.getCurrentPosition(this.extractWeather);
    

  }

  extractWeather(position) {
    let request = new XMLHttpRequest();
    let lat = position.coords.latitude;
    let long = position.coords.longitude;
    let API = '9ea12ec41d3c35e251a19aa5e883d597';
    let that = this;

    request.onreadystatechange = function() {
      if (request.readyState == XMLHttpRequest.DONE && request.status == 200) {
        const data = JSON.parse(request.responseText);
        that.setState({weather: data});
      }
    };

    request.open("GET", `http://api.openweathermap.org/data/2.5/weather?lat=${lat}&lon=${long}&appid=${API}`, true);
    request.send();
  }

  render() {
    let content;

    if (this.state.weather) {
      const weather = this.state.weather;
      const temp = (weather.main.temp - 273.15) * 1.8 + 32;
      content = <div>
                  <p>{weather.name}</p>
                  <p>{temp.toFixed(1)}</p>
                </div>
    } else {
      content = <div className='loading'>loading weather...</div>;
    }
    return (
      <div>
        <div className='weather'>
          {content}
        </div>
      </div>
    );
  }
}

export default Weather;