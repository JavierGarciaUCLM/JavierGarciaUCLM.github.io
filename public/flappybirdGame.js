let Pajaro, Fondo, gameOverImage;
let cX = 30, cY = 300, vel = 0, acel = 0.3;
let score = 0, scored = false;
let x, w = 50, topPipe, bottom;
const pipeGap = 100;

function preload() {
  Pajaro = loadImage('/assets/Pajaro.png');
  Fondo = loadImage('/assets/Fondo.png');
  gameOverImage = loadImage('/assets/GameOver.png');
}

function setup() {
  createCanvas(600, 500);
  frameRate(120);
  resetGame();
}

function draw() {
  background(Fondo);

  x -= 5;
  if (x < -w) {
    x = width;
    topPipe = random(height / 4, height - pipeGap - 100);
    bottom = height - topPipe - pipeGap;
    scored = false;
  }

  fill(255, 0, 10);
  rect(x, 0, w, topPipe);
  rect(x, height - bottom, w, bottom);

  image(Pajaro, cX, cY, 25, 25);
  vel += acel;
  cY += vel;

  if (cY >= height) cY = height;
  if (cY <= 0) cY = 0;

  if ((cX + 25 > x && cX < x + w) && (cY < topPipe || cY + 25 > height - bottom)) {
    image(gameOverImage, width / 2 - gameOverImage.width / 2, height / 2 - gameOverImage.height / 2);
    noLoop();
    setTimeout(resetGame, 2000);  // Esperar 2 segundos y reiniciar
  }

  if (!scored && x + w < cX) {
    score++;
    scored = true;
  }

  fill(0);
  textSize(32);
  text("Score: " + score, 10, 40);
}

function keyPressed() {
  if (key === ' ') {
    vel = -5;
  }
}
function mousePressed() {
  vel = -5;
}
function touchStarted() {
  vel = -5;
}

function resetGame() {
  cX = 30;
  cY = 300;
  vel = 0;
  score = 0;
  scored = false;
  x = width + 150;
  topPipe = random(height / 4, height - pipeGap - 100);
  bottom = height - topPipe - pipeGap;
  loop();  // Volver a ejecutar el bucle del juego
}
