enum Skill { FLUTTER, DART, OTHER }

class Employee {
  final String _name;
  final double _baseSalary;
  List<Skill> skills = [];
  final int _yearOfExperience;
  Address _address;

  Employee(this._name, this._baseSalary, this._address, this._yearOfExperience, this.skills);

  // Named constructor
  Employee.mobileDeveloper(
    String name, double baseSalary, Address empAddress, int empYearOfExperience
  ) : 
  _name = name,
  _baseSalary = baseSalary,
  _address = empAddress,
  _yearOfExperience = empYearOfExperience,
  skills = [Skill.FLUTTER, Skill.DART]; 

  // Getter methods for accessing the private atributes
  String get employeeName => _name;
  double get baseSalary => _baseSalary;
  List<Skill> get employeeSkills => skills;
  Address get employeeAddress => _address;
  int get employeeYearOfExperience => _yearOfExperience;

  double computeSalary(){
    double totalSalary = _baseSalary;
    double bonusEachYear = _yearOfExperience * 2000;
    totalSalary += bonusEachYear;
    for(var skill in skills){
      switch(skill){
        case Skill.FLUTTER: totalSalary += 5000; break;
        case Skill.DART: totalSalary += 3000; break;
        default: totalSalary += 1000; break;
      }
    }
    return totalSalary;
  }

  // want to print the bonus of skill of each employee
  double computeSkillBonus(){
    double skillBonus = 0;
    for(var skill in skills){
      switch(skill){
        case Skill.FLUTTER: skillBonus += 5000; break;
        case Skill.DART: skillBonus += 3000; break;
        default: skillBonus += 1000; break;
      }
    }
    return skillBonus;
  }

  // this is teacher given method which print the default constructor
  void printDetails() {
    print("""
      ============================ Salary ===========================
      || Employee: $_name
      || Address: $_address
      || Experience: $_yearOfExperience
      || Skills: $skills
      || Base Salary: \$$_baseSalary
      || BonusExperiences: \$${_yearOfExperience * 2000}
      || BonusSkills: \$${computeSkillBonus()}
      || TotalSalary: ${computeSalary()}
      ===============================================================
    """
    );
  }

  // this is to print from named constructor
  @override
  String toString(){
    return """ 
      ============================= Salary ==========================
      || Name: $_name
      || Address: $_address
      || Experience: $_yearOfExperience
      || Skills: $skills
      || Base Salary: \$$_baseSalary
      || BonusExperiences: \$${_yearOfExperience * 2000}
      || BonusSkills: \$${computeSkillBonus()}
      || TotalSalary: ${computeSalary()}
      ===============================================================
    """
;
  }
}

class Address {
  final String _street;
  final String _city;
  final String _zipCode;

  Address(this._street, this._city, this._zipCode);

  @override
  String toString() {
    return 'Street: $_street, City: $_city, Zip Code: $_zipCode';
  }
}

void main() {
  // address
  var address1 = Address('102', 'PhnomPenh', '+855');
  var address2 = Address('888', 'Pong Tuek', '+855');
  
  // employee 
  var emp1 = Employee('Sokea', 40000, address1, 5, [Skill.OTHER]);
  
  // employee mobile developer
  var mobileDeveloper = Employee.mobileDeveloper('Satya', 2000, address2, 2);

  emp1.printDetails();
  print(mobileDeveloper);
}
