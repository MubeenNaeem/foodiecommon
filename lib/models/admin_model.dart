import 'package:foodiecommon/models/branch_model.dart';

class AdminModel {
  final String id;
  final String name;
  final String email;
  final String? phone;
  final String role;
  final BranchModel? branch;

  AdminModel({
    required this.id,
    required this.name,
    required this.email,
    this.phone,
    required this.role,
    this.branch,
  });

  factory AdminModel.fromMap(Map<String, dynamic> map) {
    return AdminModel(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      phone: map['phone'],
      role: map['role'],
      branch: map['branch'] != null ? BranchModel.fromMap(map['branch']) : null,
    );
  }

  AdminModel fromMapWithoutModels(Map<String, dynamic> map) {
    return AdminModel(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      phone: map['phone'],
      role: map['role'],
      branch: branch,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'role': role,
      'branch': branch?.toMap(),
    };
  }

  AdminModel copyWith({
    String? id,
    String? name,
    String? email,
    String? phone,
    String? role,
    BranchModel? branch,
  }) {
    return AdminModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      role: role ?? this.role,
      branch: branch ?? this.branch,
    );
  }
}
