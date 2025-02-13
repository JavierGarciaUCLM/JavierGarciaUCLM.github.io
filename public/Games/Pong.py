import pygame
import sys
import random

#En un sitio random pa ser más dificil
def reset_ball():
    global ball_speed_x, ball_speed_y
    ball.x = screen_width/2 - 10
    ball.y = random.randint(10,100)
    ball_speed_x *= random.choice([-1,1])
    ball_speed_y *= random.choice([-1,1])

def point_won(winner):
    global cpu_points, player_points
    if winner == "cpu":
        cpu_points += 1
    if winner == "player":
        player_points += 1
    reset_ball()

def animate_ball():
    global ball_speed_x, ball_speed_y
    ball.x += ball_speed_x
    ball.y += ball_speed_y

    #aquí limito para que rebote "encima y debajo" de la porteria
    if ball.top <= 0 or ball.bottom >= screen_height:
        ball_speed_y *= -1

    #si choca la bola con el jugador
    if ball.colliderect(player):
        # Rebote hacia la izquierda
        ball_speed_x = -abs(ball_speed_x)
        # Con esto recoloca la pelota y evita problemas de que el jugador se atasque con la pelota como en las pruebas
        ball.right = player.left
    if ball.colliderect(cpu):
        #Rebote hacia la derecha
        ball_speed_x = abs(ball_speed_x)
        #Igual que con player
        ball.left = cpu.right

    #Calculo límite de porterías
    goal_top = (screen_height - goal_area_height) // 2
    goal_bottom = goal_top + goal_area_height

    #Compruebo si gol
    if ball.right >= screen_width:
        if goal_top <= ball.centery <= goal_bottom:
            point_won("cpu")
        else:
            ball_speed_x *= -1
            ball.right = screen_width

    #Compruebo si gol
    if ball.left <= 0:
        if goal_top <= ball.centery <= goal_bottom:
            point_won("player")
        if ball.centery < goal_top or ball.centery > goal_bottom:
            ball_speed_x *= -1
            ball.left = 0

def animate_player():
    player.y += player_speed
    if player.top <= 0:
        player.top = 0
    if player.bottom >= screen_height:
        player.bottom = screen_height

def animate_cpu():
    global cpu_speed, cpu_pos_y
    cpu_pos_y += cpu_speed  # Usamos la variable flotante
    cpu.y = int(cpu_pos_y)  # Convertimos a int solo al asignar
    
    #IA para ir en contra del movimiento de bola
    #Básicamente pone en movimientos opuestos si el punto medio de la
    #bola está por encima o debajo del punto medio de la barra cpu

    #La velocidad define la dificultad, 6 es el límite (no fallará ninguna) establecido por la bola, ya que la sigue.
    #Cuanto menor sea el número, más fácil será
    if ball.centery <= cpu.centery:
        cpu_speed = -5.2
    if ball.centery >= cpu.centery:
        cpu_speed = 5.2

    if cpu.top <= 0:
        cpu.top = 0
        cpu_pos_y = 0
    if cpu.bottom >= screen_height:
        cpu.bottom = screen_height
        cpu_pos_y = screen_height - cpu.height

pygame.init()
pygame.font.init()

# Defino el tamaño del área
goal_area_width = 200
goal_area_height = 400

# Defino el tamaño de la pantalla
screen_width = 1280
screen_height = 800

screen = pygame.display.set_mode((screen_width, screen_height))
pygame.display.set_caption("This is my game hehe")

# Para el rate frame
clock = pygame.time.Clock()

# x,y coordinates and width and height. Rectangle
ball = pygame.Rect(0, 0, 30, 30)
ball.center = (screen_width/2, screen_height/2)

cpu = pygame.Rect(0,0,20,80)
cpu.centery = screen_height/2

player = pygame.Rect(0,0,20,80)
player.midright = (screen_width, screen_height/2)


#Posición área
left_goal_area = pygame.Rect(0, (screen_height - goal_area_height) // 2, goal_area_width, goal_area_height)
right_goal_area = pygame.Rect(screen_width - goal_area_width, (screen_height - goal_area_height) // 2, goal_area_width, goal_area_height)

#Para no perder precisión se convierte a float
cpu_pos_y = float(cpu.centery)

ball_speed_x = 6
ball_speed_y = 6
player_speed = 0
cpu_speed = 5.2

cpu_points, player_points = 0, 0
score_font = pygame.font.Font(None, 100)

# Loop del juego, que se actualiza constantemente, con esto se le puede
# dar movimiento continuo de una manera sencilla
while True:
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            pygame.quit()
            sys.exit()
        #Compruebo movimiento jugador
        if event.type == pygame.KEYDOWN:
            if event.key == pygame.K_UP:
                player_speed = -6
            if event.key == pygame.K_DOWN:
                player_speed = 6
        if event.type == pygame.KEYUP:
            if event.key == pygame.K_UP:
                player_speed = 0
            if event.key == pygame.K_DOWN:
                player_speed = 0
    #Cambiar la posición de los objetos
    animate_ball()
    animate_player()
    animate_cpu()
    #Limpia la pantalla en cada frame
    screen.fill((86, 130, 3))

    cpu_score_surface = score_font.render(str(cpu_points), True, "white")
    player_score_surface = score_font.render(str(player_points), True, "white")
    #Blit =  Block Image Transfer
    screen.blit(cpu_score_surface, (screen_width/4, 20))
    screen.blit(player_score_surface, (3*screen_width/4, 20))
    
     # Dibujar los objetos
    pygame.draw.aaline(screen, "white", (screen_width/2, 0), (screen_width/2, screen_height))
    pygame.draw.circle(screen, "white", (640, 400), 100, 1)
    pygame.draw.ellipse(screen, "white", ball)
    pygame.draw.rect(screen, "white", cpu)
    pygame.draw.rect(screen, "white", player)
    pygame.draw.rect(screen, "white", left_goal_area, 1)
    pygame.draw.rect(screen, "white", right_goal_area, 1)
    #Actualizar la ventana constantemente
    pygame.display.update()
    #Esto define los fps
    clock.tick(90)
