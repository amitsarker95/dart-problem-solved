import 'dart:io';

void main() {

  String randomWord = "EVAPORATE";
  hangman(randomWord);
}

void hangman(String word) {
 

  List clue = ("___ " * word.length).split(" ");

 
  print(clue.join(" "));
  int count = 0;

  
  while (true) {
   
    count += 1;
    stdout.write("\nPlease guess a letter: ");
    String choice = stdin.readLineSync()!.toUpperCase();

 
    if (choice == word) {
      print("\nBingo! Attemps: $count");
      break;
    } else if (choice == "EXIT") {
      print("\nBye bye!\n");
      break;
    } else if (choice.length > 1) {
      print("\nNope!");
      continue;
    }

   
    for (var i = 0; i < word.length; i++) {
      if (clue[i] == choice) {
        continue;
      } else if (word[i] == choice) {
        clue[i] = choice;
      }
    }

  
    print(clue.join(" "));

  
    if (clue.join("") == word) {
      print("\nBingo! Attemps:$count\n");
      break;
    }
  }
}
