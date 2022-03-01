import random
import os


player_1 = ({'Name' : input("Player 1 please enter your name : ")})
player_2 = ({'Name' : input("Player 2 please enter your name : ")})
os.system('cls')


board = [-1] * 9

def create_board() :
    for y in range(3):
        for x in range(3):
            if board[x + 3 * y] == -1: print(str(x + 3 * y) + "  ", end="")
            elif board[x + 3 * y] % 2 == 0: print("X  ", end="")
            else: print("O  ", end="")
        print()


def draw_game(countOfTurns) :
    os.system('cls')
    print("Turn  " + str(countOfTurns) + "          ", end="")
    if countOfTurns % 2 == 0: print(player_1["Name"] + "'s turn ! (X)")
    else: print(player_2["Name"] + "'s turn ! (O)")
    print()
    create_board()
    print()


def draw_winner() :
    os.system('cls')
    winner = checkWinCondition()
    if winner == 1:
        print(player_1["Name"] + " Won !")
    elif winner == 2:
        print(player_2["Name"] + " Won !")
    else:
        print("Its a tie")
    print()
    create_board()


def whoIsGoingToStart():
    if random.randint(0,100) <= 50 :
        starting_player = player_1
    else :
        starting_player = player_2
    return(starting_player)


def fullBoard():
    for i in range(9):
        if board[i] == -1: return False
    return True



def checkWinCondition():
    solutions = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    for i in solutions :
        if board[i[0]] != -1 and board[i[1]] != -1 and board[i[2]] != -1:   #Testing 3 full cells 
            if board[i[0]] % 2 == board[i[1]] % 2 == board[i[2]] % 2:       #Checking if unique player fulfilled the cells
                if board[i[0]] % 2 == 0: 
                    return 1
                else: 
                    return 2
    return 0


def takeTurns():
    countOfTurns = 0
    if whoIsGoingToStart() is player_2:
        countOfTurns = 1
    while True:
        draw_game(countOfTurns)
        selected_cell = input("Please input the number of the cell you want to play in : ")
        if selected_cell.isdigit and len(selected_cell) == 1 and board[int(selected_cell)] == -1: 
            board[int(selected_cell)] = countOfTurns
            countOfTurns += 1
        
        if checkWinCondition() != 0: break 
        if fullBoard() : break 
    draw_winner()

takeTurns()
