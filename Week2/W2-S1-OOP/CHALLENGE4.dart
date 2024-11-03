// Master of operator overload
class Distance{
  final double _distanceValueKms;   // i set the default distance value to kms unit

  // default contructor
  // Distance(this._distanceValueKms);

  // name constructors

  // Distance.distanceOrigin() : this._distanceValueKms = 0;

  Distance.kms(double kms) : _distanceValueKms = kms;

  Distance.meters(double meters) : _distanceValueKms = meters / 1000;

  Distance.cms(double cms) : _distanceValueKms = cms / 100000;

  // getters

  double get kilometers{
    return _distanceValueKms;    // get kilometers value
  }
  double get meters{
    return _distanceValueKms * 1000;   // get meters value
  }
  double get centimeters{
    return _distanceValueKms * 100000;   // get centimeters value
  }

  // we can write it in arrow functions also
  // double get kilometers => _distanceValueKms;
  // double get meters => _distanceValueKms / 1000;
  // double get centimeters => _distanceValueKms / 100000;

  // operators overloading

  // @override        // not clear about override
  Distance operator +(covariant Distance newDistance){
    return Distance.kms(this._distanceValueKms + newDistance._distanceValueKms);
  }
  
  // @override 
  // String toString() => 
  // """
  //   Distance: $kilometers kilometers
  //   Distance: $meters meters
  //   Distance: $centimeters centimeters
  // """;
}

void main(){
  print("================== Distances =================");
  Distance d1 = Distance.meters(2000);
  Distance d2 = Distance.kms(5);
  Distance d3 = Distance.cms(100000);
  // Add distances togethers
  print("${(d1 + d2 + d3).kilometers} Kilometer");
  print("${(d1 + d2 + d3).meters} Meters");
  print("${(d1 + d2 + d3).centimeters} Centimeters");

  // d1._distanceValueKms = 20; //error because it assigned once, and can't be changed
}