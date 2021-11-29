import 'dart:io';

void main() {
  stdout.write("What square size do you want: ");
  int userChoice = int.parse(stdin.readLineSync()!);
  print("Here is a $userChoice by $userChoice board: \n");

  drawBoard(userChoice);
}

void drawBoard(int squareSize) {
  
  String rowLines = " ---";
  String colLines = "|   ";

  
  for (var i = 0; i < squareSize; i++) {
    print(rowLines * squareSize);
    print(colLines * (squareSize + 1));
  }

  
  print("${rowLines * squareSize}\n");
}