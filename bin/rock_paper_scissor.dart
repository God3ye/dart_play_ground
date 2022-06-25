import 'dart:io';
import 'dart:math';

enum Move { Rock, Paper, Scissor }
void main() {
  final random = Random();
  while (true) {
    stdout.write('Rock,Paper or Scissor? (r,p,s)');
    final userInput = stdin.readLineSync();
    var userMove;
    if (userInput == 'r' || userInput == 'p' || userInput == 's') {
      if (userInput == 'r') {
        userMove = Move.Rock;
      } else if (userInput == 'p') {
        userMove = Move.Paper;
      } else {
        userMove = Move.Scissor;
      }

      final index = random.nextInt(3);
      final aiInput = Move.values[index];
      print('You : $userMove');
      print('Ai  :  $aiInput');
      if (userMove == aiInput) {
        print('Draw Draw');
      } else if (userMove == Move.Paper && aiInput == Move.Rock ||
          userMove == Move.Scissor && aiInput == Move.Paper ||
          userMove == Move.Rock && aiInput == Move.Scissor) {
        print('You Won!');
      } else {
        print('Ai Won!');
      }
    } else if (userInput == 'q') {
      break;
    } else {
      print('Invalid Input');
    }
  }
}
