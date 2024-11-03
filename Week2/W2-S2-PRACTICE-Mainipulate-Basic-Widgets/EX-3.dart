class MyDuration {
  final int _milliseconds;

  // name constructor and check the value of user input (check it will be greater than 0 or equal 0)
  // so when user input the value is negative it will auto be positive 
  MyDuration.fromHours(int hours) : _milliseconds = (hours >= 0 ? hours : hours = -hours) * 3600 * 1000;

  MyDuration.fromMinutes(int minutes) : _milliseconds = (minutes >= 0 ? minutes : minutes = -minutes) * 60 * 1000;

  MyDuration.fromSeconds(int seconds) : _milliseconds = (seconds >= 0 ? seconds : seconds = -seconds) * 1000;

  MyDuration.fromMilliseconds(int milliseconds) : _milliseconds = (milliseconds >= 0 ? milliseconds : -milliseconds);

  // Note: one more way is to use abs() method to ensure the input always positive
  
  MyDuration operator +(covariant MyDuration otherDuration){
    return MyDuration.fromMilliseconds(this._milliseconds + otherDuration._milliseconds);
  }
  
  MyDuration operator -(covariant MyDuration otherDuration){
    if (otherDuration._milliseconds > this._milliseconds) {
      throw Exception('Subtraction result cannot be negative');
    }
    return MyDuration.fromMilliseconds(this._milliseconds - otherDuration._milliseconds);
  }

  bool operator >(covariant MyDuration otherDuration){
    return this._milliseconds > otherDuration._milliseconds;
  }

  // Display the duration in a readable format
  @override
  String toString() {
    int seconds = (_milliseconds / 1000).round();
    int minutes = (seconds / 60).floor();
    seconds = seconds % 60;
    int hours = (minutes / 60).floor();
    minutes = minutes % 60;
    return '$hours hours, $minutes minutes, $seconds seconds';
  }
}

void main() {
  print("=================== Duration =========================");
  MyDuration duration1 = MyDuration.fromHours(30); // 3 hours
  MyDuration duration2 = MyDuration.fromMinutes(45); // 45 minutes
  // MyDuration duration3 = MyDuration.fromSeconds(-59);
  print("|| One duration: $duration1");
  print("|| Other duration: $duration2"); // 45 minutes, 0 seconds
  print("|| Add: ${duration1 + duration2}"); // 3 hours, 45 minutes, 0 seconds
  print("|| Compare: ${duration1 > duration2}"); //true
  print("|| Minus: ${duration1 - duration2}"); 
  try {
    print("|| Minus: ${duration2 - duration1}"); // This will throw an exception
  } catch (e) {
    print("|| Minus: ${e}"); 
  }
  print("======================================================");

}