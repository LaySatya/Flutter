// Class Tree
class Tree {
  String type;
  double height;

  Tree(this.type, this.height);
  @override
  String toString() => "$type, $height meters";
}

// Class House
class House {
  String address;
  List<Tree> trees = [];  // by default empty
  List<Window> windows = [];
  List<Door> door = [];
  Roof? roof;
  List<Chimney> chimney = [];
  House(this.address);

  void addTree(Tree newTree){
    this.trees.add(newTree);
  }
  
  void addWindow(Window newWindow){
    this.windows.add(newWindow);
  }

  void addDoor(Door newDoor){
    this.door.add(newDoor);
  }
  
  void setRoof(Roof roofType){
    roof = roofType;
  }

  void addChimney(Chimney newChimney){
    this.chimney.add(newChimney);
  }

  @override
  String toString(){   
    return 
    """ 
    || Address: $address
    || Trees: ${trees.map((tree) => tree)}
    || Windows: ${windows.map((window) => "\n    ||\t\t$window")}
    || Doors: ${door.map((door) => door)}
    || Roof: ${roof?.toString() ?? 'No roof'}
    || Chimney: ${chimney.map((chimney) => chimney)}
    """;
  } // note """ to make long code clear """
}

class Window{
  String color;
  String position;
  int floor;
  int numWindows;
  
  Window(this.color, this.position, this.floor , this.numWindows);

  @override
  String toString() => "Color $color has $numWindows windows at $position on stair $floor";
}

class Roof{
  String type;

  Roof(this.type);
  @override 
  String toString() => "$type roof";
}

class Door{
  String color;
  String position;

  Door(this.color, this.position);

  @override  
  String toString() => "Color $color and stay in the $position of the house.";
}

class Chimney{
  bool hasChimney;
  double height;

  Chimney(this.hasChimney , this.height);

  @override    

  String toString() => "${hasChimney? 'Has chimney' : 'doesn`t have chimney'} with height $height meters";
}

void main(){
  print("\n    ====================== Welcome to Satya's House =========================\n");
  House myHouse = House('Phnom Penh');
  myHouse.addTree(Tree('Malis', 8));
  myHouse.addWindow(Window('gray', 'left and right' , 1 , 2));
  myHouse.addWindow(Window('gray', 'left and right' , 2 , 2));
  myHouse.addDoor(Door('gray', 'middle'));
  myHouse.setRoof(Roof('Metal'));
  myHouse.addChimney(Chimney(true, 0.8));
  print(myHouse);
  print("    ============================================================================");
}