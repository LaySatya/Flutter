enum Direction { north, east, south, west } // enum is like a class, it's fixed or constant value 
// north 0 , east 1 , north 2 , north 3
void main() {
  // Initial position {7, 3} and facing north
  int x = 1;
  int y = 1;
  Direction direction = Direction.north; // let robot stay at one position 

  // Example instruction sequence
  const instructions = "A";  // let the robot move

  // Process the instructions and get the final position and direction
  print("Start Position: ($x, $y) $direction");
  void turnRight(){
    var currentRobotDirection = direction.index; // it get the current index of the direction which the robot is facing
    var turningRight = (currentRobotDirection + 1) % 4; 
     // plus by one it will move the the next index of the direction and 
     //modulus by 4 to ensure that it will wrap around back to the north position 
     //when the robot's current position in the last index called west (clockwise ទ្រនិចនាឡិកា)
    direction = Direction.values[turningRight]; // get the direction value
  }

  void turnLeft(){
    var currentRobotDirection = direction.index; // it get the current index of the direction which the robot is facing
    var turningLeft = (currentRobotDirection + 3) % 4;  
    // don't subtract it by 1 because index starts from 0 so when it stay in 0 index the result will get negative
    // so plus it by 3 to turn left and also modolus by 4 to ensure after turn left from index 0 it will wrap around still
    direction = Direction.values[turningLeft]; // get the direction value
  }

  void goForward(){
     switch (direction) {       
      case Direction.north:
        y += 1;
        break;
      case Direction.east:
        x += 1;
        break;
      case Direction.south:
        y -= 1;
        break;
      case Direction.west:
        x -= 1;
        break;
    }
  }

  void startPosition(int x, int y, Direction direction){
    for(var i = 0; i < instructions.length; i++){
      var instruction = instructions[i];
      if(instruction == 'R'){
        turnRight();
      } else if(instruction == 'L'){
        turnLeft();
      } else if(instruction == 'A'){
        goForward();
      }
    }
  }
  startPosition(x , y , direction);

  // Print the final position and direction
  print("Final position: (x,y) = ($x,$y) $direction");
  print("Facing:  $direction");
}
