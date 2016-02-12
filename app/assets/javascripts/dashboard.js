$(function() {
  $.get("/languages", function(response) {
    console.log(response);
    var langData = [];
    for (key in response) {
      langData.push({name: key, y: response[key]});
    }
    $("#lang-chart").highcharts({
      chart: {
        type: "pie"
      },
      plotOptions: {
        pie: {
          allowPointSelect:true,
          cursor: "pointer",
          dataLabels: {
                    enabled: true,
                    format: '<b>{point.name}</b>: {point.percentage:.1f} %',
                    style: {
                        color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                    }
          }
        }
      },
      title: {
        text: "Primary Language Used",
        style: {
          color: "#F0B67F",
          fontFamily: 'Maven Pro, sans-serif',
          fontSize: "30px"
        }
      },
      series: [{
        name: "Language",
        data: langData
      }]
    });
  });

  $.get("/events", function(response) {
    console.log(response);
    var eventData = [];
    for (key in response) {
      eventData.push({name: key, y: response[key]});
    }
    $("#event-chart").highcharts({
      chart: {
        type: "pie"
      },
      plotOptions: {
        pie: {
          allowPointSelect:true,
          cursor: "pointer",
          dataLabels: {
                    enabled: true,
                    format: '<b>{point.name}</b>: {point.percentage:.1f} %',
                    style: {
                        color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                    }
          }
        }
      },
      title: {
        text: "Lastest Events (up to 300)",
        style: {
          color: "#F0B67F",
          fontFamily: 'Maven Pro, sans-serif',
          fontSize: "30px"
        }
      },
      series: [{
        name: "Event",
        data: eventData
      }]
    });
  });

});
