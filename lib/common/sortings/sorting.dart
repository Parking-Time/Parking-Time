abstract interface class Sorting {
  final String name;

  Sorting({required this.name});

  bool equals(Object other);

  @override
  bool operator ==(Object other) => equals(other);

  @override
  int get hashCode => name.hashCode;



}