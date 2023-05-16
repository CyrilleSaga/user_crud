import 'dart:convert';

class User {
  int? id;
  String? name;
  String? contact;
  String? bio;

  User({
    this.id,
    this.name,
    this.contact,
    this.bio,
  });

  User copyWith({
    int? id,
    String? name,
    String? contact,
    String? bio,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      contact: contact ?? this.contact,
      bio: bio ?? this.bio,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'id': id});
    }
    if (name != null) {
      result.addAll({'name': name});
    }
    if (contact != null) {
      result.addAll({'contact': contact});
    }
    if (bio != null) {
      result.addAll({'bio': bio});
    }

    return result;
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id']?.toInt(),
      name: map['name'],
      contact: map['contact'],
      bio: map['bio'],
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(id: $id, name: $name, contact: $contact, bio: $bio)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User && other.id == id && other.name == name && other.contact == contact && other.bio == bio;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ contact.hashCode ^ bio.hashCode;
  }
}
