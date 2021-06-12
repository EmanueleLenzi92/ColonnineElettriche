$(function () {

    Highcharts.chart('containerbarplot', {

        chart: {
            type: 'bar'
        },
        title: {
            text: 'Rapporto di auto elettriche ogni 100.000 abitanti per regione'
        },

        xAxis: {
            categories: ['Trentino-Alto-Adige','Valle d\'Aosta','Toscana','Lazio','Lombardia', 'Emilia-Romagna','Veneto', 'Piemonte','Umbria','Friuli Venezia Giulia', 'Marche','Sardegna',
                'Basilicata','Sicilia','Liguria','Abruzzo','Campania',  'Calabria', 'Molise', 'Puglia'
              ],
        },
        yAxis: {
            min: 0,
            max: 125,
            title: {
                text: 'Auto elettrica per 100.000 abitanti',
                align: 'high'
            },
            labels: {
                overflow: 'justify'
            }
        },
        tooltip: {
            valueSuffix: ' rapporto tot auto/abitanti'
        },
        plotOptions: {
            bar: {
                dataLabels: {
                    enabled: false
                }
            }
        },
        // legend: {
        //     layout: 'vertical',
        //     align: 'right',
        //     verticalAlign: 'top',
        //     x: -40,
        //     y: 80,
        //     floating: true,
        //     borderWidth: 1,
        //     backgroundColor:
        //         Highcharts.defaultOptions.legend.backgroundColor || '#FFFFFF',
        //     shadow: true
        // },
        credits: {
            enabled: false
        },
        series: [{
            name: 'Dati',
            data: [
                125.50,
                25.35,
                21.03,
                18.31,
                16.13,
                15.76,
                12.03,
                10.00,
                7.57,
                7.39,
                7.31,
                6.79,
                6.52,
                6.18,
                5.78,
                5.17,
                3.74,
                3.16,
                2.91,
                0.91,






                ]
        }]
    });

});