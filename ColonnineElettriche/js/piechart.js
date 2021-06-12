
var data = [
    { label: 'Enel', percent: 51.71 , numero:1703},
    { label: 'Tesla Motors', percent: 10.44, numero:604 },
    { label: 'E-moving', percent: 3.35, numero:106 },
    { label: 'Altri', percent: 24.29, numero:1132},
    { label: 'Op. locali', percent: 10.21, numero:488 }
];

var svg = d3.select("svg"),
    width = svg.attr("width"),
    height = svg.attr("height"),
    radius = Math.min(width, height) / 2,
    g = svg.append("g").attr("transform", "translate(" + width / 2 + "," + height / 2 + ")");

var color = d3.scaleOrdinal(['#4daf4a','#377eb8','#ff7f00','#984ea3','#e41a1c']);

// Generate the pie
var pie = d3.pie()
    .value(function(d) { return d.percent; })
    .sort(null);

// Generate the arcs
var arc = d3.arc()
    .innerRadius(0)
    .outerRadius(radius);

//Generate groups
var arcs = g.selectAll(".arc")
    .data(pie(data))
    .enter().append("g")
    .attr("class", "arc");

/*etichetta del nome operatore*/

var label = d3.arc()
    .outerRadius(radius)
    .innerRadius(radius + 28);

/*aggiunto altra etichetta per numero colonnine*/

var labelt = d3.arc()
    .outerRadius(radius)
    .innerRadius(radius - 100);

arcs.append("path")
    .attr("d", arc)
    .attr("fill", function(d) { return color(d.data.label); });

arcs.append("text")
    .attr("transform", function(d) {
        return "translate(" + label.centroid(d) + ")";
    })
    .text(function(d) { return d.data.label; });

/*ulteriore arco per appendere il numero*/
arcs.append("text")
    .attr("transform", function(d) {
        return "translate(" + labelt.centroid(d) + ")";
    })
    .text(function(d) { return d.data.numero; });

svg.append("g")
    .attr("transform", "translate(" + (width / 2 - 250) + "," +480 + ")")
    .append("text")
    .text("Operatori sul mercato con relativo numero di colonnine")
    .attr("class", "title")

        /*timeout entrata*/
(window.svg);
setTimeout(restOfTheData,3000);