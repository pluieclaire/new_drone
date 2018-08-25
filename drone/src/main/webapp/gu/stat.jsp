<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="row" style="boder-style: solid">
   <div class="container">
      <div class="chart-container" style="position: relative; height:30vh; width:30vw">
        <canvas id="myChart"></canvas>
      </div>
   </div>
   
   <div class="container">
      <div class="chart-container" style="position: relative; left:300px; height:30vh; width:30vw">
        <canvas id="myChart1"></canvas>
      </div>
   </div>

   <div class="container">
      <div class="chart-container" style="position: relative; height:30vh; width:30vw">
        <canvas id="myChart2"></canvas>
      </div>
   </div>

</div>
<script>
var ctx = document.getElementById("myChart");
var myChart = new Chart(ctx, {
    type: 'bar',
    data: {
        labels: ["2015", "2016", "2018", "2020","2022","2024"],
        datasets: [{
            label: '세계 드론 시장 규모',
            data: [39.9, 47.3, 67.3, 97.9, 127.1, 146.9],
            backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)'
            ],
            borderColor: [
                'rgba(255,99,132,1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)'
            ],
            borderWidth: 1
        }]
    },
    options: {
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero:true
                }
            }]
        }
    }
});
</script>
<script>
var ctx = document.getElementById("myChart1");
var myChart1 = new Chart(ctx, {
    type: 'bar',
    data: {
        labels: ["2015", "2016", "2017", "2018"],
        datasets: [{
            label: '드론 자격 취득 현황',
            data: [205, 454, 2872, 4504],
            backgroundColor: [
              /*   'rgba(255, 99, 132, 0.2)', */
                'rgba(54, 162, 235, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(54, 162, 235, 0.2)'
              /*   'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)' */
            ],
            borderColor: [
                /* 'rgba(255,99,132,1)', */
                   'rgba(54, 162, 235, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(54, 162, 235, 1)'
            /*     'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)', */
            ],
            borderWidth: 1
        }]
    },
    options: {
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero:true
                }
            }]
        }
    }
});
</script>
<script>
var ctx = document.getElementById("myChart2");
var myChart2 = new Chart(ctx, {
    type: 'doughnut',
    data : { 
       datasets:[{ 
           data: [12.9, 9.7, 7.4, 5.1, 4.9, 60],
         backgroundColor: [
             'rgba(255, 99, 132, 0.2)', 
             'rgba(153, 102, 255, 0.2)',
             'rgba(54, 162, 235, 0.2)',
             'rgba(255, 206, 86, 0.2)',
             'rgba(255, 159, 64, 0.2)',
             'rgba(153, 153, 153, 0.2)'
                 ]
       }],
       // These labels appear in the legend and in the tooltips when hovering different arcs
       labels: [
           '치어슨 CX-10A',
           'DJI 매빅프로',
           '시마 X5 쿼드콥터',
           '치어슨 CX-10D',
           '시마 X5C 쿼트콥터',
           '기타'
       ]
    }
});
/* data = {
       datasets: [{
           data: [10, 20, 30]
       }],

       // These labels appear in the legend and in the tooltips when hovering different arcs
       labels: [
           'Red',
           'Yellow',
           'Blue'
       ]
   }; */
</script>
</body>
</html>