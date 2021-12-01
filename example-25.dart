import 'dart:io';
import 'dart:math';

void main() {
 
  String theWord = randomWord("sowpods.txt");

  intro();
  hangman(theWord);
}

void hangman(String word) {
 

  List clue = ("___ " * word.length).split(" ");

  
  print(clue.join(" "));
  int count = 0;
  int attempts = word.length + 1;
  List history = [];

 
  while (true) {
    count += 1;
    attempts -= 1;

    
    stdout.write("\nPlease guess a letter: ");
    String choice = stdin.readLineSync()!.toUpperCase();
    if (history.contains(choice)) {
      print("\nYou already tried this letter!");
      attempts += 1;
    } else {
      history.add(choice);
    }

    
    if (choice == word) {
      print("\nBingo! Attemps: $count");
      break;
    } else if (choice == "EXIT") {
      print("\nBye bye!\n");
      break;
    } else if (choice.length > 1) {
      attempts += 1;
      print("\nNope! Attemps left: $attempts");
      continue;
    } else if (attempts < 1) {
      print("\nAttemps left: $attempts. \nGame over!");
      print("\nThe word was: $word");
      break;
    }

   
    for (var i = 0; i < word.length; i++) {
      if (word[i] == choice) {
        clue[i] = choice;
      }
    }
    print("\nAttempts left: $attempts");

    
    print(clue.join(" "));

   
    if (clue.join("") == word) {
      print("\nBingo! Attemps:$count\n");
      break;
    }
  }
}

String randomWord(String txt) {
 
  final random = Random();
  var file = File(txt);
  List<String> wordList = file.readAsLinesSync();
  String word = wordList[random.nextInt(wordList.length)];
  return word;
}

void intro() {
  print("""\n
  Welcome to Hangman!
  We prepared a word for you.
  You have 6 attempts to guess it correctly
  You can type the whole word anytime before attempts are over
  To quit the game type "exit"
  """);
}
