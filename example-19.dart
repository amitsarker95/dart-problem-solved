import 'dart:io';

void main() {
 
  List<List<String>> initialBoard =
      List.generate(3, (_) => List.generate(3, (_) => ' '));
  drawBoard(initialBoard, 2);
}

void drawBoard(List<List<String>> board, int currentUser) {
 
  var move;
  currentUser == 1 ? move = 'X' : move = 'O';

  stdout.write("Please choose a coordinate: ");
  List choice = stdin.readLineSync()!.split(" ");
  board[int.parse(choice[0])][int.parse(choice[1])] = move;
  print(board);
}