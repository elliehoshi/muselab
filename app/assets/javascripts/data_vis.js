var colors = d3.scale.category20c();
SimpleBubble = function(d, id, c) {
  this.data = d;
  this.id = id;
  this.canvas = c;
  this.el = null;
  this.x = 0;
  this.y = 0;
  this.radius = 0;
  this.boxSize = 0;
  this.isDragging = false;
  this.isSelected = false;
  this.tooltip = null;

  this.init();
};

SimpleBubble.prototype.init = function() {
  /* Elements that make up the bubbles display*/
  this.el = $("<div class='bubble' id='bubble-" + this.id + "'></div>");
  this.elFill = $("<div class='bubbleFill'></div>");
  
  this.el[0].setAttribute("id","bubble-" + this.id);
  this.el[0].setAttribute("data-questionurl","ideas");
  
  this.el.append(this.elFill);


  /* Set CSS of Elements  */
  this.radius = this.data * 100;
  this.boxSize = this.data * 20;

  this.elFill.css({
    width: this.boxSize,
    height: this.boxSize,
    left: -this.boxSize / 2,
    top: -this.boxSize / 2,
    "background-color": colors(this.data)});
};


SimpleBubble.prototype.move = function() {
  this.el.css({top: this.y, left:this.x});
};

SimpleVis = function(container,d) {
  this.width = 800;
  this.height = 400;
  this.canvas = $(container);
  this.data = d;
  this.force = null;
  this.bubbles = [];
  this.centers = [
  {x: 200, y:200},
  {x: 400, y:200},
  {x: 600, y:200}
  ];

  this.bin = d3.scale.ordinal().range([0, 1, 2]);

  this.bubbleCharge = function(d) {
    return -Math.pow(d.radius,1) * 2;
  };

  this.init();
};

SimpleVis.prototype.init = function() {
  /* Store reference to original this */
  var me = this;

  /* Initialize root visualization element */
  this.canvas.css({
    width: this.width,
    height: this.height,
    position: "relative"});

  /* Create Bubbles */
  for(var i=0; i< this.data.length; i++) {
    var b = new SimpleBubble(this.data[i], i, this.canvas);
    /* Define Starting locations */
    b.x = b.boxSize + (20 * (i+1));
    b.y = b.boxSize + (10 * (i+1));
    this.bubbles.push(b);
    /* Add root bubble element to visualization */
    this.canvas.append(b.el);
  };

  /* Setup force layout */
  this.force = d3.layout.force()
    .nodes(this.bubbles)
    .gravity(0)
    .charge(this.bubbleCharge)
    .friction(0.1)
    .size([this.width, this.height])
    .on("tick", function(e) {
      me.bubbles.forEach( function(b) {
        me.setBubbleLocation(b, e.alpha, me.centers);
        b.move();
      });
    });

  this.force.start();
};

SimpleVis.prototype.setBubbleLocation = function(bubble, alpha, centers) {
  var center = centers[this.bin(bubble.id)];
  bubble.y = bubble.y + (center.y - bubble.y) * (0.02) * alpha;
  bubble.x = bubble.x + (center.x - bubble.x) * (0.115) * alpha;
};

