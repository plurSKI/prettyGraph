var width = 500;
var height = 500;
var ctx;

$(document).ready(function() {
  var c=document.getElementById("canvas");
  ctx=c.getContext("2d");
});

function graphFunction(){
  var f = new Function('x','y', 'return ' + $("#formula").val());

  for(var x = 0; x <= width; x ++)
  {
    try {
      for(var y = 0; y <= height; y ++)
      {
         var val = f(x,y);
         var r = val % 255;
         var g = (val * 2) % 255;
         var b = (val * 3) % 255;
         ctx.fillStyle = "rgb(" + r + "," + g + "," + b + ")";
         ctx.fillRect(x,y,1,1);
      }
    } catch (ex) {
      alert(ex);
      break;
    }
  }

}
