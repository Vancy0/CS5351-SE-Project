bool isWin(char game[3][3]) {

	/*bool win = false;
	if (game[0][0] == game[0][1] && game[0][1] == game[0][2] && (game[0][0] == 'X' || game[0][0] == 'O')) win = true;
	if (game[1][0] == game[1][1] && game[1][1] == game[1][2] && (game[1][0] == 'X' || game[1][0] == 'O')) win = true;
	if (game[2][0] == game[2][1] && game[2][1] == game[2][2] && (game[2][0] == 'X' || game[2][0] == 'O')) win = true;
	// column
	if (game[0][0] == game[1][0] && game[1][0] == game[2][0] && (game[0][0] == 'X' || game[0][0] == 'O')) win = true;
	if (game[0][1] == game[1][1] && game[1][1] == game[2][1] && (game[0][1] == 'X' || game[0][1] == 'O')) win = true;
	if (game[0][2] == game[1][2] && game[1][2] == game[2][2] && (game[0][2] == 'X' || game[0][2] == 'O')) win = true;
	// diagonal
	if (game[0][0] == game[1][1] && game[1][1] == game[2][2] && (game[0][0] == 'X' || game[0][0] == 'O')) win = true;
	if (game[0][2] == game[1][1] && game[1][1] == game[2][0] && (game[0][2] == 'X' || game[0][2] == 'O')) win = true;
	return win;*/
	
	for (int i = 0; i < 3; i++) {
		// row
		if (game[i][0] == game[i][1] && game[i][1] == game[i][2] && game[i][0] != ' ') {
			return true;
		}
		// column
		if (game[0][i] == game[1][i] && game[1][i] == game[2][i] && game[0][i] != ' ') {
			return true;
		}
	}

	// diagonal
	if (game[0][0] == game[1][1] && game[1][1] == game[2][2] && game[0][0] != ' ') {
		return true;
	}
	if (game[0][2] == game[1][1] && game[1][1] == game[2][0] && game[0][2] != ' ') {
		return true;
	}

	return false;
}

bool isDraw(char game[3][3]) {
	// if has chance to win
	for (int i = 0; i < 3; i++) {
		// different mark in same row/column || if the row/column is full
		if ((game[i][0] != game[i][1] || game[i][1] != game[i][2]) && (game[i][0] != ' ' && game[i][1] != ' ' && game[i][2] != ' ')) {
			return true; 
		}
		if ((game[0][i] != game[1][i] || game[1][i] != game[2][i]) && (game[0][i] != ' ' && game[1][i] != ' ' && game[2][i] != ' ')) {
			return true;
		}
	}

	// diagonal
	if ((game[0][0] != game[1][1] || game[1][1] != game[2][2]) && (game[0][0] != ' ' && game[1][1] != ' ' && game[2][2] != ' ')) {
		return true;
	}
	if ((game[0][2] != game[1][1] || game[1][1] != game[2][0]) && (game[0][2] != ' ' && game[1][1] != ' ' && game[2][0] != ' ')) {
		return true;
	}

	return false;
}

int main() {
	int i, j;

	//char game[3][3] = { ' ' }; // Tic-tac-toe
	char game[3][3] = { {' ', ' ', ' '}, {' ', ' ', ' '}, {' ', ' ', ' '} };

	char player1 = 'X';
	char player2 = 'O';
	bool turn = true; // false for player 1's turn, true for player 2's turn. Player 1 first.
	cout << "X = Player 1" << endl << "O = Player 2" << endl;
	for (int n = 0; n < 9; n++) {
		turn = !turn;  // use the not-operator to change true to false or false to true.
		if (turn == false)
			cout << "Player 1: ";
		else
			cout << "Player 2: ";
		cout << "Which cell to mark? i:[1..3], j:[1..3]: ";
		cin >> i >> j;

		//i&j should subtract 1
		i--, j--;
		//check input validation
		if (i < 0 || i > 2 || j < 0 || j > 2 || game[i][j] != ' ') {
			cout << "Invalid move!" << endl;
			n--;
			continue;
		}

		if (turn == false)
			game[i][j] = 'X';
		else
			game[i][j] = 'O';
		if (isWin(game)) {
			cout << "Win!" << endl;
			break; // need to terminate the problem
		}

		if (n > 6) {
			if (isDraw(game)) {
				cout << "Tie!" << endl;
				break;
			}
		}
	}
	//if (i == 3) // all celles with i=0 to 2 have been inputted above but no winner yet
		//cout << "Tie!" << endl;

	// show the game to console
	cout << game[0][0] << " " << game[0][1] << " " << game[0][2] << endl;
	cout << game[1][0] << " " << game[1][1] << " " << game[1][2] << endl;
	cout << game[2][0] << " " << game[2][1] << " " << game[2][2] << endl;
	return 0;
}

