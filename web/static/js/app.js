// Brunch automatically concatenates all files in your
// watched paths. Those paths can be configured at
// config.paths.watched in "brunch-config.js".
//
// However, those files will only be executed if
// explicitly imported. The only exception are files
// in vendor, which are never wrapped in imports and
// therefore are always executed.

// Import dependencies
//
// If you no longer want to use a dependency, remember
// to also remove its path from "config.paths.watched".
import "phoenix_html"

// Import local files
//
// Local files can be imported directly using relative
// paths "./socket" or full ones "web/static/js/socket".

// import socket from "./socket"

// No seconds
function format_time(datestr) {
  out = moment(datestr)
  
}

// ES6
import "chart.js"

var ctx_temp = document.getElementById("tempChart");
var ctx_hum = document.getElementById("humChart");

var times = document.getElementsByClassName("timedata");
var temps = document.getElementsByClassName("tempdata");
var hums = document.getElementsByClassName("humdata");

var timeData = []
var tempData = []
var humData = []

for(var i = 0; i < times.length; i++)
{
   timeData.unshift(times.item(i).textContent);
   tempData.unshift(temps.item(i).textContent);
   humData.unshift(hums.item(i).textContent);
}

// console.log(timeData);
// console.log(tempData);
// console.log(humData);

var temp_graph_data = {
    labels: timeData,
    datasets: [
        {
            label: "Temperature (Fahrenheit)",
            fill: false,
            lineTension: 0.1,
            backgroundColor: "rgba(193, 75, 75, 0.4)",
            borderColor: "rgba(193, 75, 75, 1)",
            borderCapStyle: 'butt',
            borderDash: [],
            borderDashOffset: 0.0,
            borderJoinStyle: 'miter',
            pointBorderColor: "rgba(193, 75, 75, 1)",
            pointBackgroundColor: "#fff",
            pointBorderWidth: 1,
            pointHoverRadius: 5,
            pointHoverBackgroundColor: "rgba(193, 75, 75, 1)",
            pointHoverBorderColor: "rgba(220,220,220,1)",
            pointHoverBorderWidth: 2,
            pointRadius: 1,
            pointHitRadius: 10,
            data: tempData,
            spanGaps: false,
        }
    ]
};

var tempChart = new Chart(ctx_temp, {
    type: 'line',
    data: temp_graph_data,
    options: {}
});

var hum_graph_data = {
    labels: timeData,
    datasets: [
        {
            label: "Humidity (%)",
            fill: false,
            lineTension: 0.1,
            backgroundColor: "rgba(75,192,192,0.4)",
            borderColor: "rgba(75,192,192,1)",
            borderCapStyle: 'butt',
            borderDash: [],
            borderDashOffset: 0.0,
            borderJoinStyle: 'miter',
            pointBorderColor: "rgba(75,192,192,1)",
            pointBackgroundColor: "#fff",
            pointBorderWidth: 1,
            pointHoverRadius: 5,
            pointHoverBackgroundColor: "rgba(75,192,192,1)",
            pointHoverBorderColor: "rgba(220,220,220,1)",
            pointHoverBorderWidth: 2,
            pointRadius: 1,
            pointHitRadius: 10,
            data: humData,
            spanGaps: false,
        }
    ]
};

var humChart = new Chart(ctx_hum, {
    type: 'line',
    data: hum_graph_data,
    options: {}
});




// 
// 
// var myChart = new Chart(ctx_temp, {
//     type: 'bar',
//     data: {
//         labels: ["Red", "Blue", "Yellow", "Green", "Purple", "Orange"],
//         datasets: [{
//             label: '# of Votes',
//             data: [12, 19, 3, 5, 2, 3],
//             backgroundColor: [
//                 'rgba(255, 99, 132, 0.2)',
//                 'rgba(54, 162, 235, 0.2)',
//                 'rgba(255, 206, 86, 0.2)',
//                 'rgba(75, 192, 192, 0.2)',
//                 'rgba(153, 102, 255, 0.2)',
//                 'rgba(255, 159, 64, 0.2)'
//             ],
//             borderColor: [
//                 'rgba(255,99,132,1)',
//                 'rgba(54, 162, 235, 1)',
//                 'rgba(255, 206, 86, 1)',
//                 'rgba(75, 192, 192, 1)',
//                 'rgba(153, 102, 255, 1)',
//                 'rgba(255, 159, 64, 1)'
//             ],
//             borderWidth: 1
//         }]
//     },
//     options: {
//         scales: {
//             yAxes: [{
//                 ticks: {
//                     beginAtZero:true
//                 }
//             }]
//         }
//     }
// });
