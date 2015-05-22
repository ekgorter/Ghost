Naam: Elias Gorter

Studentnummer: 6052274

Vak: Minor Programmeren - Native App Studio

Opdracht: Final Project Report

##Ghost -  App for iOS

###Introduction

This app allows the user(s) to play the game Ghost. In this game players take turns picking a letter and appending this letter to the previously picked letters. Should a player either form an existing word longer than three letters or form a string of letters that cannot lead to any existing word by adding more letters, then this player loses the game. Players can enter their names or pick their name from a list of previously entered names to play the game with. This way a highscore list can be kept and viewed. Finally, the user can choose between the English or Dutch language for checking the words formed in the game.

###Overview

1 navigation controller

8 views with view controllers

2 model classes

2 dictionary .txt files

1 .png image file


**Used Model Classes:**

- Dictionary

- Game


**Used View Controllers:**

- MainMenuViewController

- HighscoresTableViewController

- SettingsViewController

- SelectViewController

- NewNameViewController

- ExistingPlayersTableViewController

- GameViewController

- WinViewController


**App views hierarchy:**

![alt text][appoverview]

###Description of used Model Classes

*Game.swift*

This model class implements most of the game rules of Ghost. One instance of this class represents one playable game round. It needs an instance of the Dictionary model class to be created. The class keeps track of the word formed so far, the player whose turn it is and if the end game conditions have been met. The guess function appends the inputted letter to the word formed so far and filters the dictionary for the remaining possible words. The turn function switches whose turn it currently is. The ended function checks if any of the end game conditions have been met, it returns true when this is the case. The winner function finally returns which player is the winner, being the opposite player of who triggered a game over.

*Dictionary.swift*

The dictionary model class takes a string of words separated by newlines as its input. These words will make up the dictionary used in the game. The words in the string are are separated from each other (using the newlines as denominator) and put into an array of strings. Two of these arrays are made, one for filtering during gameplay, another to be able to restore the dictionary to it’s original state quickly. Four actions can be performed on the dictionary. The filter function takes a string as input and removes all words from the dictionary that do not start with this combination of characters. The count function counts the remaining amount of words in the dictionary. The result function returns the single remaining word in the dictionary and the reset function restores the dictionary to it’s unfiltered state.

###Description of used View Controllers

*MainMenuViewController.swift*

This view controller controls the main menu view that is the root view of the app and of the navigation controller. The main menu view is shown when the app is started and can also be reached from the game view and the win view using unwind segues. It contains four buttons. The New Game button segues to the player selection view, the Settings button segues to the Settings view and the Highscores button segues to the Highscores view. The fourth button is the Resume Game button, this button is only shown and usable when there is currently a game in progress. This allows the player to continue the current game after the phone or app is shut down or when visiting the main menu while a game is in progress. Pressing the Resume Game button will in fact segue to the Game view and create a new game, but set the game variables to be those stored in NSUserDefaults.
![alt text][mainmenu]

*HighscoresTableViewController.swift*

This table view controller controls a table view that displays the stored highscores for each player. The table is a single section with the same amount of rows as there are saved player names. Each cell displays a string made up of the player rank, name and amount of won games. The cells are ordered by amount of wins, from high to low. The view is reached from the main menu view or from the win view. 
![alt text][highscores]

*SettingsViewController.swift*

The settings view controller controls the settings view. The settings view is reached by pressing the settings button in the main menu. The settings view contains a segmented control for selecting the dictionary language to be used and a button to clear all saved player names and highscores. The selected segment of the segmented control is stored in NSUserDefaults, so the setting will be remembered even after shutting down the phone. The clear all data button removes the stored player names and highscores from NSUserDefaults.
![alt text][settings]

*SelectViewController.swift*

The select view controller controls the player selection view that is reached by pressing the new game button in the main menu. The view consists of two labels representing the player names of the two players that are about to play the game. By default, the labels are set to “Player 1” and “Player 2”. Using these standard names to play a game will allow the users to play an unranked game round, the result of the game will not be stored in the highscores. Below each player label are two buttons, a “new” and an “existing” button. Pressing the new button will take the user to the new name view, were a new name can be entered. Pressing the existing button will take the player to the existing players table view, where an existing player name can be selected. The newly entered or selected name will replace the name in the corresponding player label. When both players are selected, pressing the play button will start a new game using the player names displayed in the labels and the game view will be displayed. 
![alt text][selection]

*NewNameViewController.swift*

The new name view consists of a text field and a button. The user may enter a name in the text field. When the save button is pressed, the save name function in the select view controller is called through a delegate. The name entered in the text field is added to the known player names and highscores list. The name label in the select view is replaced with the entered name and pressing save causes the view to return immediately to the select view.
![alt text][new]

*ExistingPlayersTableViewController.swift*

This table view shows all names saved into the player names list and in NSUserDefaults. Upon pressing on a player name the set name function in the select view controller is called through a delegate. This function changes the player name label into the selected name. Selecting a name also causes the view to switch immediately back to the select view.
![alt text][existing]

*GameViewController.swift*

The game view controller allows one game of Ghost to be played, this can be a new game or an unfinished game. It instantiates a game class and a dictionary class. The dictionary language is the language selected in the settings view, as the selected dictionary function ensures. The player whose turn it currently is is displayed in the upper right or left corner of the view, the other player label is hidden. In the text field the user can enter a single letter. More than one character cannot be entered. By pressing the add button, this letter is inputted in the game class guess function. The add button will not work with other characters entered than the allowed letters of the alphabet. The first time the add button is pressed a game is considered to be in progress, and this will enable the resume game button in the main menu. Once the inputted letter is added to the game word and no end game condition is met, the turn is passed to the next player and all current game information is stored in NSUserDefaults. If an end game condition is met, the win view is displayed with the required information to display segued from the game view controller. The game is considered to be over and the resume game button in the main menu is disabled. The winning player gains a point in the highscore dictionary. In the game view the main menu button allows users access to the main menu at all times.
![alt text][game]

*WinViewController.swift*

The final view controller is the win view controller. The win view displays the name of the winner as received from the game view controller. The reason for winning and the remaining word is also displayed. The user can choose to view the highscore view by pressing the highscore button or return to the main menu by pressing the main menu button. The user is then returned to the main menu through an unwind segue.
![alt text][win]

###Requirement implementations

_•Before the game actually starts, it must ask the users for their respective names. If the game has been played before, all previously used names should be provided by the app to choose from._

When the new game button is pressed in the main menu, a selection view is shown where the players can either enter a new name in the new name view, or pick a name saved in NSUserDefaults in the existing players table view.

_•The game must be interactive: at each step, it should say who the current player is and what the current word fragment is._

In the game view, the current word is displayed at all times. It is made clear who the current player is by only showing the name of the player whose turn it currently is. The other player name label is hidden.

_•The player must be able to input a letter guess via an on-screen keyboard._

The text input field allows the user to enter letters with the built-in iOS keyboard.

_•Your app must only accept as valid input single alphabetical characters (case-insensitively). Invalid input (e.g., multiple characters, no characters, characters already inputted, punctuation, etc.) should be ignored (silently or with some sort of alert) but not penalized._

The user cannot enter more than one character in the text input field. The input is treated case-insensitive. Any input that is not a letter in the alphabet can be entered in the text field, but it cannot be added to the game word by pressing the add button, or cause any other change to occur in the game. The game can only continue when the user enters a valid character.

_•The letter should be added to the word fragment and the updated word fragment should be displayed._

When a valid character is entered, it is added to the word fragment in the game class and the label displaying the word fragment is updated as well.

_•The game should end if the current player has formed a word (longer than 3 characters) or no words can be formed._

When the user presses the add button and this causes an end game condition to be met, the game is over and the win screen is displayed. The user can in no way return to the game view, only a new game can be started.

_•The game must have a choice of dictionaries: either Dutch or English._

Inside the settings view, the user can select a language using a segmented control.

_•During game play, the user should be allowed to hit a menu button to cause some form of menu to appear and allow the user to restart the current round or change the language._

In the game view, the user can press the main menu button which shows the main menu view. In the main menu the user can either choose to start a new game or to go to the settings view where settings may be changed.

_•If the user changes the language of the game it must cause game play to restart. The preference should survive if the user quits and re-opens the app. If no preference is set, the default language should be used._

The selected language is saved in NSUserDefaults. By default, dutch is selected.  Changing the language while a game is in progress does not cause the game to restart however.

_•The game’s state must survive if the user quits the app or other activities appear above it. The end result should be that users can return to the game and continue playing where they left off even if the app is quit or the device is turned off._

All required game information is stored in NSUserDefaults after every turn, so that the game in progress may be continued at any time, even after turning off the phone. The game in progress may be continued by pressing the resume game button in the main menu.

_•When a player has won, a new screen must appear that congratulates the winner on their accomplishment and state the reason for winning._

When an end game condition is met, a new screen appears that shows the winning player, the reason for winning and the remaining word fragment.

_•Then, the player should be shown their place in the high score list, where each game that is won counts towards the score._

In the win view, the user can press the highscore button, which shows the highscore table view.

_•Finally, there must also be a way to immediately start a new game or change the player’s names._

In the win view the user can press the main menu button, where the new game button will allow users to set up a new game.

###Extra features

In the settings view a clear all data button is added, which allows the user to clear all saved names and highscores. A useful addition if your friends keep beating you and you are at the bottom of the highscore list.

###Discussion

Most of the requirements have been successfully implemented in this app. The only flaw is the fact that changing the dictionary in the middle of a game does not restart the game. There was not enough time left to fix this. No interaction in the app has been found so far that can cause the app to crash however. Perhaps the view controller for the highscores and the existing player selection could have been combined in some way. The app was tested on an iPhone 4, and it performed well. Only starting a new game or continuing an existing game takes some seconds, probably because the dictionary is being loaded.

[appoverview]: https://github.com/ekgorter/Ghost/blob/master/doc/AppOverview.png
[mainmenu]: https://github.com/ekgorter/Ghost/blob/master/doc/mainmenu.png
[settings]: https://github.com/ekgorter/Ghost/blob/master/doc/settings.png
[highscores]: https://github.com/ekgorter/Ghost/blob/master/doc/highscores.png
[selection]: https://github.com/ekgorter/Ghost/blob/master/doc/selection.png
[new]: https://github.com/ekgorter/Ghost/blob/master/doc/new.png
[existing]: https://github.com/ekgorter/Ghost/blob/master/doc/existing.png
[game]: https://github.com/ekgorter/Ghost/blob/master/doc/game.png
[win]: https://github.com/ekgorter/Ghost/blob/master/doc/win.png
