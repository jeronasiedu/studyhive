import 'package:equatable/equatable.dart';

class Profile extends Equatable {
  final String id;
  final String name;
  final String email;
  final String? photoUrl;
  final String? bio;
  final String? school;
  final String? phoneNumber;

  const Profile({
    required this.id,
    required this.name,
    required this.email,
    this.photoUrl,
    this.bio,
    this.school,
    this.phoneNumber,
  });

  @override
  List<Object> get props {
    return [
      id,
      name,
      email,
      photoUrl ?? '',
      bio ?? '',
      school ?? '',
      phoneNumber ?? '',
    ];
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'photoUrl': photoUrl,
      'bio': bio,
      'school': school,
      'phoneNumber': phoneNumber,
    };
  }

  factory Profile.fromMap(Map<String, dynamic> map) {
    return Profile(
      id: map['id'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
      photoUrl: map['photoUrl'] as String,
      bio: map['bio'] as String,
      school: map['school'] as String,
      phoneNumber: map['phoneNumber'] as String,
    );
  }
}
