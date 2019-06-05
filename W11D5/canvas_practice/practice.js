document.addEventListener("DOMContentLoaded", function(){
    const canvas = document.getElementById('mycanvas');
    canvas.height = 500;
    canvas.width = 500;



    const ctx = canvas.getContext('2d');
    ctx.fillStyle = "red";
    ctx.fillRect(0,0,100,100);


    ctx.beginPath();
    ctx.arc(150, 175, 50, 0, 2 * Math.PI, true);
    ctx.strokeStyle = "purple";
    ctx.lineWidth = 10;

    ctx.stroke();
    ctx.fillStyle = "blue";
    ctx.fill();

    // ctx.beginPath();
    // ctx.arc(100, 100, 20, 0, 2 * Math.PI, true);
    // ctx.strokeStyle = "green";
    // ctx.lineWidth = 5;
    // ctx.stroke();
    // ctx.fillStyle = "blue";
    // ctx.fill();
});
