$(function() {
  $.get("/charts", function(response) {
    console.log(response);
    var langData = []
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
        text: "Primary Language Used"
      },
      series: [{
        name: "Language",
        data: langData
      }]
    });
  });
});
