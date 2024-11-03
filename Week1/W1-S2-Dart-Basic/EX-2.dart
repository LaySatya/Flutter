void main() {
  // 1 - iLike
  String iLike = 'I like pizza';  // CONST because this variable never changes (known at compile time)

  // 2 - toppings
  String toppings = 'with tomatoes';  // VAR because the variable is increment to modify
  toppings += " and cheese";

  // 3 - message
  String message = '$iLike $toppings';  // FINAL because this variable can be assigned once but after that it cannot be changed
  print(message);

  // 4 - rbgColors
  List<String> rbgColors = ['red', 'blue', 'green'];  // CONST because the rbgColors variable is never changes (known at compile time)
  print(rbgColors);

  // 5 - weekDays
  List<String> weekDays = ['monday', 'tuesday', 'wednesday'];   // FINAL because this variable of the list don't change but added the new items to the end of the list
  weekDays.add('thursday');
  print(weekDays);

  // 6 - scores
  List<int> scores = [45,35,50];        // VAR because the list itself is being reassigned
  scores = [45,35,50, 78];
  print(scores);
}


