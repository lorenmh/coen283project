/* globals d3 */

var TWO_PI = Math.PI * 2,
    NUM = 14,
    USE_EXT = false,
    MAX = 0.0003
;

var width = 1000,
    height = 500
;

canvas = document.getElementById('view');

d3.csv('./csv/cc.csv', function(error, data) {
  a = data.map((d) => {
    return [
      d.c1,
      d.c2,
      d.c3,
      d.c4,
      d.c5,
      d.c6,
      d.c7,
      d.c8,
      d.c9,
      d.c10,
      d.c11,
      d.c12,
      d.c13,
      d.c14
    ].filter((v) => !!v);
  });
  
  b = a.map((d) => d.map((dd) => dd ? +dd : undefined));

  extent = b
    .reduce((p,c) => p.concat(c))
    .filter((d) => !!d)
    .reduce((p,c) => {
      if (c < p[0]) p[0] = c;
      if (c > p[1]) p[1] = c;
      return p;
    }, [Infinity, -Infinity])
  ;

  counts = b
    .map((r) => r.length)
    .reduce((p,c) => {
      p[0] += c;
      p[1][c] += 1;
      p[2] += 1;
      return p;
    }, [0, Array.apply(null, {length:NUM+1}).map(()=>0), 0])
  ;

  mean = counts[0]/counts[2];
  median = 0;
  c = 500;
  for (var e=0; e<counts[1].length; e++) {
    c -= counts[1][e];
    if (c <= 0) {
      median = e;
      break;
    }
  }
  mode = [0, -Infinity];
  for (e=0; e<counts[1].length; e++) {
    if (counts[1][e] > mode[1]) {
      mode[0] = e;
      mode[1] = counts[1][e];
    }
  }

  extent = USE_EXT ? extent : [extent[0], MAX];
  xScale = d3.scale.linear().domain(extent).range([20, width-40]);
  yScale = d3.scale.linear().domain([0,NUM]).range([height-40, 20]);

  function drawCircle(ctx, x, y, r, fill) {
    ctx.beginPath();
    ctx.arc(x, y, r, 0, TWO_PI);
    ctx.fillStyle = fill || 'black';
    ctx.fill();
  }

  context = canvas.getContext('2d');
  context.font = '16px Helvetica';

  function col(i) {
    return 'rgba(255,0,0,.02)';
  }

  avgStrs = `Mean: ${mean}  |  Median: ${median}  |  Mode: ${mode[0]} (${mode[1]})`;
  context.fillText(avgStrs, 5, 14);

  for (var y=0;y<NUM;y++) {
    context.fillText(('' + (y+1)), 5, yScale(y) + 5);
  }

  b.forEach((r,i) => {
    r.forEach((c,j) => {
      if (!c) return;
      drawCircle(
        context,
        xScale(c),
        yScale(j),
        3,
        col(j)
      );
    });
  });
});
