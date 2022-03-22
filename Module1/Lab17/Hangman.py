import random

def player_guess_letter(x,y,z):
    import re
      #x = letter, or user_input
      #y=word to guess, never changes
      #z=the guess, to be updated by the function
    matches=re.finditer(x,y)
    matches_position=[match.start() for match in matches]

    for i in matches_position:
        z = z[:i] + x + z[i + 1:]
    return z

players = []
player1 = input("Player One, please input your name: ")
player2 = input('Player Two, please input your name: ')
players.append(player1)
players.append(player2)

host = random.choice(players)

if host == player1:
    print(player1,"is the HOST ", player2,"is the PLAYER")

else:
    print(player2,"is the HOST ", player1,"is the PLAYER")

word = input(f'{host}, you are the HOST! Please input the word you want the player to find! ')
word = word.lower()
guess = '-' * len(word)
print(f'You have to guess {guess}, a {len(word)}-letter word')
trials = 0
letter = input('Please input your guess: ')
guess = player_guess_letter(letter,word,guess)

while guess != word:
    if trials == 9:
        print('You are to be hanged, burn in hell!')
        break
    elif len(letter) > 1:
        print('Your input must be 1 single letter at a time!')
        letter = input(f'{guess}. Please input your next guess. You have {10-trials} trials left! ')
    else:
        if letter in guess:
            print('You have already input this letter!')
            letter = input(f'{guess}. Please input your next guess. You have {10-trials} trials left! ')    
        elif letter not in [i for i in word]:
            trials += 1
            letter=input(f'{guess}. Please input your next guess. You have {10-trials} trials left! ')
        else:
            guess=player_guess_letter(letter,word,guess)
            if guess == word:
                print(f'Congratulations! You win! You had to guess {word}')
                break
            else:
                letter = input(f'{guess}. Please input your next guess.You have {10-trials} trials left! ')