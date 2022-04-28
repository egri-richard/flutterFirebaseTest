class User {
  String id;
  final String name;
  final int age;

  User({
    this.id = '',
    required this.name,
    required this.age
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'age': age
  };

  static User fromJson(Map<String, dynamic> map) => User(
    id: map['id'],
    name: map['name'],
    age: map['age']
  );
}