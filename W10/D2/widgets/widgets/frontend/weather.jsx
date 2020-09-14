import React from 'react';
const apiKey = "9f393f2ba6ec6fd9a5aced6423161d54";

class Weather extends React.Component{
    constructor(props){

        this.state = {
            weather: "",
            temperature: ""
        }
    }

    success(position){
        const latitude = position.coords.latitude;
        const longitude = position.coords.longitude;
        const weatherInfo = $.ajax({
            method: "GET",
            url: `api.openweathermap.org/data/2.5/weather?lat=${latitude}&lon=${longitude}&appid=${apiKey}`,
            dataType: "json"
        });


    }

    componentDidMount(){
        navigator.geolocation.getCurrentPosition(success, error)
        $.ajax({
            method: "GET",
            url: 
        })
        this.setState({

        })
    }
}

export default Weather;