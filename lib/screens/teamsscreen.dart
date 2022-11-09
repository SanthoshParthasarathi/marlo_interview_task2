import 'dart:io';

import 'package:flutter/material.dart';
import 'package:marlo_task2/model/employee_role_model.dart';
import 'package:marlo_task2/model/role.dart';
import 'package:marlo_task2/screens/teams_invite_screen.dart';
import 'package:marlo_task2/services/services.dart';
import 'package:marlo_task2/widgets/invited_list.dart';
// import 'package:marlo_task2/widgets/role_list.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
import 'package:provider/provider.dart';

class TeamsScreen extends StatefulWidget {
  const TeamsScreen({Key? key}) : super(key: key);

  @override
  _TeamsScreenState createState() => _TeamsScreenState();
}

class _TeamsScreenState extends State<TeamsScreen> {
  List<Role> rolesList = [
    Role(name: "Krishna Soundar", active: "active", role: "Admin"),
    Role(name: "Vishnoo B", active: "active", role: "Admin"),
  ];

  // String authToken =
  //     "eyJhbGciOiJSUzI1NiIsImtpZCI6ImQ3YjE5MTI0MGZjZmYzMDdkYzQ3NTg1OWEyYmUzNzgzZGMxYWY4OWYiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL3NlY3VyZXRva2VuLmdvb2dsZS5jb20vbWFybG8tYmFuay1kZXYiLCJhdWQiOiJtYXJsby1iYW5rLWRldiIsImF1dGhfdGltZSI6MTY2Nzk5OTQ0MiwidXNlcl9pZCI6IlJoSGdiY1U0cHZNMGR3RE90d1piTlhPOTlRMjMiLCJzdWIiOiJSaEhnYmNVNHB2TTBkd0RPdHdaYk5YTzk5UTIzIiwiaWF0IjoxNjY3OTk5NDQyLCJleHAiOjE2NjgwMDMwNDIsImVtYWlsIjoieGlob2g1NTQ5NkBkaW5lcm9hLmNvbSIsImVtYWlsX3ZlcmlmaWVkIjpmYWxzZSwiZmlyZWJhc2UiOnsiaWRlbnRpdGllcyI6eyJlbWFpbCI6WyJ4aWhvaDU1NDk2QGRpbmVyb2EuY29tIl19LCJzaWduX2luX3Byb3ZpZGVyIjoicGFzc3dvcmQifX0.HBVZOzQKbratngxPxha-OZ2O7ltydXSkzoC8PwyZodbAwHsbA-RLVx3E35rd3zqmB7TRRfUQh9AqunR9YgvIcHxjl2Va9cA8fQVLJZFIrvoceTXD1-iho3W7vnj_c62GaXIhCAYkkoWPXwu8DH_8qm6PfTMRpFNCnHtG1-UcBdzLwZKDjNuHSLLnrc172XsjsCpWhCQwOrytNCFrj6L8HYtI85DxwIgwlUwv0XU3XRTSu0zV_HQi3dXfWa-AA6HmN7Y4s2QrBXXLB8jscNhm8rqCM19TEZqliy_--z8utQwS36eCknA9GVRykMpT_T1enZXzS3BA0SYgKtNgS61lwA";

  // String url =
  //     "https://asia-southeast1-marlo-bank-dev.cloudfunctions.net/api_dev/company/6dc9858b-b9eb-4248-a210-0f1f08463658/teams";

  // Future<List<EmployeeRoleModel>> getEmpDetails() async {
  //   print("data");
  //   Uri uri = Uri.parse(url);
  //   final response = await http.get(
  //     uri,
  //     headers: {
  //       'authtoken': '$authToken',
  //     },
  //   );
  //   print(response.statusCode);
  //   if (response.statusCode == 200 || response.statusCode == 201) {
  //     final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

  //     return parsed
  //         .map<EmployeeRoleModel>((json) => EmployeeRoleModel.fromMap(json))
  //         .toList();
  //   } else {
  //     // If the server did not return a 200 OK response,
  //     // then throw an exception.
  //     throw Exception('Failed to load album');
  //   }
  // }

  // late Future<EmployeeRoleModel> empDetailsFuture;

  @override
  void initState() {
    super.initState();
    // empDetailsFuture = getEmpDetails();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      // backgroundColor: Colors.white,
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   elevation: 0,
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => InviteScreen(),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.08,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Teams",
                  style: TextStyle(
                    // color: Colors.black,
                    fontSize: 36,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1,
                  ),
                ),
                Icon(
                  Icons.search,
                  // color: Colors.grey,
                  size: 30,
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            FutureBuilder<List<Contacts>>(
                future: ApiHandler.getContactsDetail(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "All People. ${snapshot.data!.length}",
                              style: TextStyle(
                                // color: Colors.grey,
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                                letterSpacing: 1,
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                "See all",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18,
                                  letterSpacing: 0.4,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 260,
                          width: double.infinity,
                          child: ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              return ChangeNotifierProvider.value(
                                value: snapshot.data![index],
                                child: Card(
                                  child: ListTile(
                                    // tileColor: Colors.white,
                                    leading: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Container(
                                          color: Colors.blue,
                                          height: size.height * 0.05,
                                          width: size.width * 0.1,
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(top: 8.0),
                                            child: Text(
                                              snapshot.data![index].firstname
                                                      .toString()
                                                      .substring(0, 1)
                                                      .toUpperCase() +
                                                  snapshot.data![index].lastname
                                                      .toString()
                                                      .substring(0, 1)
                                                      .toUpperCase(),
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.white,
                                              ),
                                            ),
                                          )),
                                    ),
                                    trailing: Text(
                                      snapshot.data![index].roleName.toString(),
                                    ),
                                    title: Text(
                                      snapshot.data![index].firstname
                                              .toString() +
                                          ' ' +
                                          snapshot.data![index].lastname
                                              .toString(),
                                    ),
                                    subtitle: Text(
                                        snapshot.data![index].isactive == true
                                            ? "Active"
                                            : "Inactive"),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  } else {
                    return SizedBox(
                      height: 200,
                      child: Center(
                        child: Image.asset("assets/images/loading.png"),
                      ),
                    );
                  }
                }),
            SizedBox(
              height: size.height * 0.02,
            ),
            FutureBuilder<List<Invites>>(
                future: ApiHandler.getInviteDetail(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Invited People. ${snapshot.data!.length}",
                              style: TextStyle(
                                // color: Colors.grey,
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                                letterSpacing: 1,
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                "See all",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18,
                                  letterSpacing: 0.4,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 200,
                          child: ListView.builder(
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                return Card(
                                  child: ListTile(
                                    // tileColor: Colors.white,
                                    leading: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Container(
                                          color: Colors.brown[400],
                                          height: size.height * 0.05,
                                          width: size.width * 0.1,
                                          child: Icon(
                                            Icons.person,
                                            color: Colors.white,
                                          )),
                                    ),
                                    title: Text(
                                      snapshot.data![index].email.toString(),
                                    ),
                                    subtitle: Text(
                                      snapshot.data![index].configName
                                          .toString(),
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ],
                    );
                  } else {
                    return SizedBox(
                      height: 200,
                      child: Center(
                        child: Image.asset("assets/images/loading.png"),
                      ),
                    );
                  }
                }),
          ],
        ),
      ),
    );
  }
}
