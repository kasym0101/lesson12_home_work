import 'dart:io';
import 'dart:math';

void main() {
  startGame();

// compareFunc();
// int binaryCount = binarySearch();
// print('Количество шагов: $binaryCount');

// int randoumCount = randomSearch();
// print('Количество шагов: $randoumCount');

// int binaryCompCount = compBinarySearch();
// print('Количество шагов: $binaryCompCount');

// int binaryRandomCount = compRandomSearch();
// print('Количество шагов: $binaryRandomCount');
}

void startGame() {
  print('Добро пожаловать! Выберите кто будет отгадывать:\n1)Вы\n2)Компьютер');

  int answer = int.parse(stdin.readLineSync()!);

  if (answer == 1) {
    int answer = userFunc();
    print('Количество шагов: $answer');
  } else if (answer == 2) {
    print('Выберите уровень:\n1)легкий\n2)сложный');
    int compLevel = int.parse(stdin.readLineSync()!);

    if (compLevel == 1) {
      int binaryCount = binarySearch();
      print('Количество шагов: $binaryCount');
    } else if (compLevel == 2) {
      int randoumCount = randomSearch();
      print('Количество шагов: $randoumCount');
    }
  } else {
    print('error');
  }

// switch (answer) {
// case 1:
// userFunc();
// break;
// case 2:
// binarySearch();
// break;
// default:
// print('error');
// }
}

int userFunc() {
  int min = 1;
  int max = 101;
  int compRandomNum = min + Random().nextInt(max - min);
  print('compRandomNum = $compRandomNum');
  int userRandomNum = 99999;
  int counter = 0;

  while (compRandomNum != userRandomNum) {
    stdout.write('Компьютер загадал число. Введите число: ');
    userRandomNum = int.parse(stdin.readLineSync()!);
    counter++;

    if (compRandomNum > userRandomNum) {
      print('больше');
    } else if (compRandomNum < userRandomNum) {
      print('меньше');
    }
  }

  return counter;
}

int binarySearch() {
  print('загадайте число от 1 до 100');
  int min = 1;
  int max = 100;
  int mid = (min + max) ~/ 2;
  int count = 0;

  String answer = '';

  while (answer != 'yes') {
    print('Ваше число $mid?');
    answer = stdin.readLineSync()!;
    count++;

    if (answer == '+') {
      min = mid;
      mid = (min + max) ~/ 2;
    } else if (answer == '-') {
      max = mid;
      mid = (min + max) ~/ 2;
    }
  }

  return count;
}

int randomSearch() {
  int min = 1;
  int max = 101; // 1-100
  int mid = min + Random().nextInt(max - min);

  int counter = 0;
  String answer = '';

  while (answer != 'yes') {
    print('Ваше число $mid?');
    counter++;
    answer = stdin.readLineSync()!;

    if (answer == 'more') {
      min = mid; // 0 -> 45
      mid = min + Random().nextInt(max - min); // 45-100
    } else if (answer == 'less') {
      max = mid; // 100 -> 33
      mid = min + Random().nextInt(max - min); // 0-33
    }
  }

  return counter;
}

int compBinarySearch(int randomNum) {
  int min = 1;
  int max = 100;
  int mid = (min + max) ~/ 2;
  int counter = 1;
// int randomNum = min + Random().nextInt(max - min);
// теперь вместо нас компьютер загадывает число
// print('Комьютер загадал число $randomNum');

  while (mid != randomNum) {
// print('Ваше число $mid?');
    counter++;

    if (mid > randomNum) {
      max = mid;
      mid = (min + max) ~/ 2;
    } else if (mid < randomNum) {
      min = mid;
      mid = (min + max) ~/ 2;
    }
  }

  return counter;
}

int compRandomSearch(int randomNum) {
  int min = 1;
  int max = 100;
  int mid = min + Random().nextInt(max - min);
  int counter = 1;
  int randomNum = min + Random().nextInt(max - min);
// теперь вместо нас компьютер загадывает число
// print('Комьютер загадал число $randomNum');

  while (mid != randomNum) {
// print('Ваше число $mid?');
    counter++;

    if (mid > randomNum) {
      max = mid;
      mid = min + Random().nextInt(max - min);
    } else if (mid < randomNum) {
      min = mid;
      mid = min + Random().nextInt(max - min);
    }
  }

  return counter;
}

void compareFunc() {
  List array = [];

  for (int i = 0; i < 100; i++) {
    array.add(Random().nextInt(100));
  }

  print('array ==== $array');

  int binaryTotalCount = 0;
  int randomTotalCount = 0;

  for (int i = 0; i < array.length; i++) {
    binaryTotalCount += compBinarySearch(array[i]);
    randomTotalCount += compRandomSearch(array[i]);
  }

  print('binaryTotalCount: $binaryTotalCount');
  print('randomTotalCount: $randomTotalCount');

  double binaryAverage = binaryTotalCount / array.length;
  double randomAverage = randomTotalCount / array.length;

  print('binaryAverage: $binaryAverage');
  print('randomAverage: $randomAverage');

  if (randomAverage > binaryAverage) {
    print('бинарный поиск лучше');
  } else if (randomAverage < binaryAverage) {
    print('рандомный поиск лучше');
  } else {
    print('оба способа выдали одинаковый результат');
  }
}
