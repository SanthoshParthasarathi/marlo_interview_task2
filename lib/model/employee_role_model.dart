import 'package:flutter/material.dart';

class EmployeeRoleModel with ChangeNotifier {
  String? errorFlag;
  String? message;
  Data? data;

  EmployeeRoleModel({this.errorFlag, this.message, this.data});

  EmployeeRoleModel.fromJson(Map<String, dynamic> json) {
    errorFlag = json['error_flag'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['error_flag'] = this.errorFlag;
  //   data['message'] = this.message;
  //   if (this.data != null) {
  //     data['data'] = this.data!.toJson();
  //   }
  //   return data;
  // }
}

class Data with ChangeNotifier {
  List<Contacts>? contacts;
  List<Invites>? invites;

  Data({this.contacts, this.invites});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['contacts'] != null) {
      contacts = <Contacts>[];
      json['contacts'].forEach((v) {
        contacts!.add(new Contacts.fromJson(v));
      });
    }
    if (json['invites'] != null) {
      invites = <Invites>[];
      json['invites'].forEach((v) {
        invites!.add(new Invites.fromJson(v));
      });
    }
  }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.contacts != null) {
//       data['contacts'] = this.contacts!.map((v) => v.toJson()).toList();
//     }
//     if (this.invites != null) {
//       data['invites'] = this.invites!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
}

class Contacts with ChangeNotifier {
  String? contactId;
  String? email;
  String? firstname;
  String? lastname;
  String? mobile;
  String? dob;
  String? contactAddressLine1;
  Null? contactAddressLine2;
  String? city;
  Null? countyId;
  Null? countryId;
  bool? isactive;
  int? role;
  String? roleName;

  Contacts(
      {this.contactId,
      this.email,
      this.firstname,
      this.lastname,
      this.mobile,
      this.dob,
      this.contactAddressLine1,
      this.contactAddressLine2,
      this.city,
      this.countyId,
      this.countryId,
      this.isactive,
      this.role,
      this.roleName});

  Contacts.fromJson(Map<String, dynamic> json) {
    contactId = json['contact_id'];
    email = json['email'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    mobile = json['mobile'];
    dob = json['dob'];
    contactAddressLine1 = json['contact_address_line_1'];
    contactAddressLine2 = json['contact_address_line_2'];
    city = json['city'];
    countyId = json['county_id'];
    countryId = json['country_id'];
    isactive = json['isactive'];
    role = json['role'];
    roleName = json['role_name'];
  }

  static List<Contacts> dataFromSnapshot(List contactSnapshot) {
    return contactSnapshot.map((data) {
      return Contacts.fromJson(data);
    }).toList();
  }
}

class Invites with ChangeNotifier {
  String? inviteId;
  String? email;
  String? configName;

  Invites({this.inviteId, this.email, this.configName});

  Invites.fromJson(Map<String, dynamic> json) {
    inviteId = json['invite_id'];
    email = json['email'];
    configName = json['config_name'];
  }

   static List<Invites> dataFromSnapshot(List inviteSnapshot) {
    return inviteSnapshot.map((data) {
      return Invites.fromJson(data);
    }).toList();
  }
}

