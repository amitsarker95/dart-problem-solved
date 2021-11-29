import 'dart:io';

void main() {
  
  List<List<String>> theBoard =
      List.generate(3, (_) => List.generate(3, (_) => ' '));

  
  startGame(theBoard);

  
  int a = 1, user = 2, tmp;

  while (true) {
   
    tmp = a;
    a = user;
    user = tmp;
    currentBoard(theBoard);

    
    stdout.write("Please User $user, choose a coordinate: ");
    List userChoice = stdin.readLineSync()!.split(" ");
    if (userChoice.join(" ") == "exit") {
      print("\nGame quitted in the following state: ");
      break;
    }

    
    theBoard = makeMove(theBoard, user, userChoice);

  
    if (rowCheck(theBoard)) {
      print("\nUser $user: Row win!");
      break;
    } else if (rowCheck(transpose(theBoard))) {
      print("\nUser $user: Column win!");
      break;
    } else if (rowCheck(diagonals(theBoard))) {
      print("\nUser $user: Diagonal win!");
      break;
    } else if (drawGame(theBoard) == 1) {
      print("\nThe game ended in draw!");
      break;
    }
  }

 
  currentBoard(theBoard);
}

void startGame(List<List<String>> board) {
  print("""\n
  Welcome to Tic Tac Toe!
  The game is for two users: User 1 (X) and User 2 (O).
  To make a move, give the coordinates of the board separated by space.
  For instance, 0 0 is the top left corner, 1 1 is the middle cell
  and 2 2 is the bottom right corner and so on.
  If you want to quite the game, type exit.
  """);
}

void currentBoard(List<List<String>> board) {
 
  String row1 = "| ${board[0][0]} | ${board[0][1]} | ${board[0][2]} |";
  String row2 = "| ${board[1][0]} | ${board[1][1]} | ${board[1][2]} |";
  String row3 = "| ${board[2][0]} | ${board[2][1]} | ${board[2][2]} |";
  String border = "\n --- --- ---\n";

  print(border + row1 + border + row2 + border + row3 + border);
}

List<List<String>> makeMove(
    List<List<String>> board, int currentUser, List choice) {
 
  var move;
  currentUser == 1 ? move = 'X' : move = 'O';

  board[int.parse(choice[0])][int.parse(choice[1])] = move;
  return board;
}

bool rowCheck(List<List<String>> board) {
 
  for (List<String> row in board) {
    if (row.toSet().length == 1 && row.any((e) => e != ' ')) {
      return true;
    }
  }
  return false;
}

List<List<String>> transpose(List<List<String>> board) {
  
  return [
    for (var i = 0; i < board.length; i++) [for (List<String> r in board) r[i]]
  ];
}

List<List<String>> diagonals(List<List<String>> board) {
  
  return [
    [for (var i = 0; i < board.length; i++) board[i][i]],
    [for (var i = 0; i < board.length; i++) board[i].reversed.toList()[i]]
  ];
}

int drawGame(List<List<String>> board) {
  
  int count = 0;
  for (var row in board) {
    for (var e in row) {
      if (e == " ") {
        count += 1;
      }
    }
  }
  return count;
}