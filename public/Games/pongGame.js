let screenWidth = 1280;
let screenHeight = 800;

let goalAreaWidth = 200;
let goalAreaHeight = 400;

let ball, cpu, player;
let ballSpeedX = 8;
let ballSpeedY = 8;
let playerSpeed = 0;
let cpuSpeed = 7.2;
let cpuPosY;

let cpuPoints = 0;
let playerPoints = 0;

function setup() {
  createCanvas(screenWidth, screenHeight);
  frameRate(90);
  
  // Inicializamos la pelota: (x, y, ancho, alto)
  ball = {
    w: 30,
    h: 30,
    //centrar la pelota 
    x: screenWidth / 2 - 15,
    y: screenHeight / 2 - 15
  };


  cpu = {
    w: 20,
    h: 80,
    x: 0,
    y: screenHeight / 2 - 40
  };


  player = {
    w: 20,
    h: 80,
    x: screenWidth - 20,
    y: screenHeight / 2 - 40
  };

  //Cuidao float
  cpuPosY = cpu.y;

  textSize(100);
  textAlign(CENTER, TOP);
}

function draw() {
  background(86, 130, 3);


  animateBall();
  animatePlayer();
  animateCPU();

  //Marcador
  fill("white");
  noStroke();
  text(cpuPoints, screenWidth / 4, 20);
  text(playerPoints, (3 * screenWidth) / 4, 20);

  //Línea del medio
  stroke("white");
  strokeWeight(2);
  line(screenWidth / 2, 0, screenWidth / 2, screenHeight);

  //Círculo central d= 200 r= 100)
  noFill();
  ellipse(screenWidth / 2, screenHeight / 2, 200, 200);

  //Pelota
  fill("white");
  noStroke();
  ellipse(ball.x + ball.w / 2, ball.y + ball.h / 2, ball.w, ball.h);

  //CPU y jugador
  rect(cpu.x, cpu.y, cpu.w, cpu.h);
  rect(player.x, player.y, player.w, player.h);

  //Áreas de gol
  noFill();
  stroke("white");
  rect(0, (screenHeight - goalAreaHeight) / 2, goalAreaWidth, goalAreaHeight);
  rect(screenWidth - goalAreaWidth, (screenHeight - goalAreaHeight) / 2, goalAreaWidth, goalAreaHeight);
}


function animateBall() {
  ball.x += ballSpeedX;
  ball.y += ballSpeedY;


  if (ball.y <= 0 || ball.y + ball.h >= screenHeight) {
    ballSpeedY *= -1;
  }


  if (rectCollide(ball, player)) {
    ballSpeedX = -Math.abs(ballSpeedX);
    ball.x = player.x - ball.w;
  }


  if (rectCollide(ball, cpu)) {
    ballSpeedX = Math.abs(ballSpeedX);
    ball.x = cpu.x + cpu.w;
  }

  //área de gol
  let goalTop = (screenHeight - goalAreaHeight) / 2;
  let goalBottom = goalTop + goalAreaHeight;
  let ballCenterY = ball.y + ball.h / 2;

  //Pelota por derecha
  if (ball.x + ball.w >= screenWidth) {
    if (ballCenterY >= goalTop && ballCenterY <= goalBottom) {
      pointWon("cpu");
    } else {
      ballSpeedX *= -1;
      ball.x = screenWidth - ball.w;
    }
  }

  //Pelota por izquierda
  if (ball.x <= 0) {
    if (ballCenterY >= goalTop && ballCenterY <= goalBottom) {
      pointWon("player");
    } else {
      ballSpeedX *= -1;
      ball.x = 0;
    }
  }
}

function animatePlayer() {
  player.y += playerSpeed;
  //Poner limites jugador
  if (player.y < 0) player.y = 0;
  if (player.y + player.h > screenHeight) player.y = screenHeight - player.h;
}


function animateCPU() {
  cpuPosY += cpuSpeed;
  cpu.y = cpuPosY; 

  let cpuCenterY = cpu.y + cpu.h / 2;
  let ballCenterY = ball.y + ball.h / 2;
    //Seguimiento de la pelota, AI
  if (ballCenterY <= cpuCenterY) {
    cpuSpeed = -7.2;
  }
  if (ballCenterY >= cpuCenterY) {
    cpuSpeed = 7.2;
  }

//Poner limites cpu
  if (cpu.y < 0) {
    cpu.y = 0;
    cpuPosY = 0;
  }
  if (cpu.y + cpu.h > screenHeight) {
    cpu.y = screenHeight - cpu.h;
    cpuPosY = cpu.y;
  }
}


function pointWon(winner) {
  if (winner === "cpu") {
    cpuPoints++;
  } else if (winner === "player") {
    playerPoints++;
  }
  resetBall();
}

// Función para reubicar la pelota en una posición aleatoria
function resetBall() {
  ball.x = screenWidth / 2 - 10; 
  ball.y = random(10, 760); 
  //Se invierte aleatoriamente la dirección de la pelota
  ballSpeedX *= random([-1, 1]);
  ballSpeedY *= random([-1, 1]);
}

//Colixiones entre rectángulos
function rectCollide(r1, r2) {
  return (
    r1.x < r2.x + r2.w &&
    r1.x + r1.w > r2.x &&
    r1.y < r2.y + r2.h &&
    r1.y + r1.h > r2.y
  );
}

//ToLower hace que transforma a minúscula lo entrante y así solo hay 1 condición en vez de 2
function keyPressed() {
  if (key.toLowerCase() === 'w') {
    playerSpeed = -8;
  } else if (key.toLowerCase() === 's') {
    playerSpeed = 8;
  }
}

function keyReleased() {
  if (key.toLowerCase() === 'w' || key.toLowerCase() === 's') {
    playerSpeed = 0;
  }
}
