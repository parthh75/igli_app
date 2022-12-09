class registerModalData {
  String? firstName;
  String? lastName;
  String? name;
  String? phone;
  String? email;
  String? updatedAt;
  String? createdAt;
  int? id;

  registerModalData({
    this.firstName,
    this.lastName,
    this.name,
    this.phone,
    this.email,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  registerModalData.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name']?.toString();
    lastName = json['last_name']?.toString();
    name = json['name']?.toString();
    phone = json['phone']?.toString();
    email = json['email']?.toString();
    updatedAt = json['updated_at']?.toString();
    createdAt = json['created_at']?.toString();
    id = json['id']?.toInt();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['name'] = name;
    data['phone'] = phone;
    data['email'] = email;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    data['id'] = id;
    return data;
  }
}

class RegisterModal {
  bool? success;
  String? message;
  registerModalData? data;

  RegisterModal({
    this.success,
    this.message,
    this.data,
  });

  RegisterModal.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message']?.toString();
    data = (json['data'] != null)
        ? registerModalData.fromJson(json['data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}
