// ignore_for_file: public_member_api_docs, sort_constructors_first
class User {
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;
  final String location;
  final int age;

  User({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.location,
    required this.age,
  });

  factory User.initial() => User(
        firstName: '',
        lastName: '',
        email: '',
        phoneNumber: '',
        location: '',
        age: 0,
      );

  User copyWith({
    String? firstName,
    String? lastName,
    String? email,
    String? phoneNumber,
    String? location,
    int? age,
  }) {
    return User(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      location: location ?? this.location,
      age: age ?? this.age,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phoneNumber': phoneNumber,
      'location': location,
      'age': age,
    };
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      email: json['email'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
      location: json['location'] ?? '',
      age: json['age'] ?? 0,
    );
  }

  @override
  String toString() {
    return 'User(firstName: $firstName, lastName: $lastName, email: $email, phoneNumber: $phoneNumber, location: $location, age: $age)';
  }
}
