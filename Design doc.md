# Ghost
Native App Studio Project

Naam: Elias Gorter
Studentnummer: 6052274

**Classes**

class Dictionary: Contains either an English or Dutch dictionary to check if typed words exist.

class Game: Implements all game rules, represents one game.

class Memory: Stores all current game information so it can be resumed after quitting the game.

class PlayerDatabase: Stores all player names and the amount of wins of each player.

class Dictionaries? : Contains all the words of the Dutch and English dictionaries.


**Methods**

func load_dictionary() -> dictionary: String

func append_player(playerName: String)

func select_player(playerName: String)

func play_game_round(userInput: String) -> gameHasEnded: Bool, winner: Bool

func append_game_win(playerName: String)

func store_in_memory(current game state, all player data)

func load_from_memory() -> current game state, all player data


**Sketches**

Sketches are in .PNG files in this same doc folder. 
