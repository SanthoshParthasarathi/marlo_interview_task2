import 'dart:io';

import 'package:flutter/material.dart';
import 'package:marlo_task2/model/employee_role_model.dart';
import 'package:marlo_task2/model/role.dart';
import 'package:marlo_task2/screens/teams_invite_screen.dart';
import 'package:marlo_task2/widgets/invited_list.dart';
import 'package:marlo_task2/widgets/role_list.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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

  String authToken =
      "eyJhbGciOiJSUzI1NiIsImtpZCI6ImRjMzdkNTkzNjVjNjIyOGI4Y2NkYWNhNTM2MGFjMjRkMDQxNWMxZWEiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL3NlY3VyZXRva2VuLmdvb2dsZS5jb20vbWFybG8tYmFuay1kZXYiLCJhdWQiOiJtYXJsby1iYW5rLWRldiIsImF1dGhfdGltZSI6MTY2NzkzNDg3OCwidXNlcl9pZCI6IlJoSGdiY1U0cHZNMGR3RE90d1piTlhPOTlRMjMiLCJzdWIiOiJSaEhnYmNVNHB2TTBkd0RPdHdaYk5YTzk5UTIzIiwiaWF0IjoxNjY3OTM0ODc4LCJleHAiOjE2Njc5Mzg0NzgsImVtYWlsIjoieGlob2g1NTQ5NkBkaW5lcm9hLmNvbSIsImVtYWlsX3ZlcmlmaWVkIjpmYWxzZSwiZmlyZWJhc2UiOnsiaWRlbnRpdGllcyI6eyJlbWFpbCI6WyJ4aWhvaDU1NDk2QGRpbmVyb2EuY29tIl19LCJzaWduX2luX3Byb3ZpZGVyIjoicGFzc3dvcmQifX0.mGIqLsjz760DqNAlGkbeMiVOLi_DpW88XXjkhx6RIxxojjtd-BGkR5v-HANWqmMhaVvrhGyhgArfO791oLJKrk0_pNcgHI3k8W9O0zsb8nsTrBHUrLhhG9fFJRpgUudX3xJWxx2wnLDUfg97FqC76eCLQGfOU--QKrbxbQCjoW6kl70AKJMcTIzL0fEJl_ETmenGZHbvu7fXyXA-RqRqGJFFRmF7aGLiJ7sfC7QZn63zrX3wjAPLA8fPDhT5yA4w6hCKYmX8rQXhRJBIaOvI6I1jUdT4-4cyaXlF278GrTVlQMdTA8sQ2WBHzGyQWxws_-uMsYOJC_H6m9yr-pUUhQ";

  String url =
      "https://asia-southeast1-marlo-bank-dev.cloudfunctions.net/api_dev/company/6dc9858b-b9eb-4248-a210-0f1f08463658/teams";

  Future<EmployeeRoleModel> getEmpDetails() async {
    print("data");
    Uri uri = Uri.parse(url);
    final response = await http.get(
      uri,
      headers: {
        'authtoken': '$authToken',
      },
    );
    print(response.statusCode);
    if (response.statusCode == 200 || response.statusCode == 201) {
      var coinsData = json.decode(response.body);

      print(coinsData);

      return EmployeeRoleModel.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  late Future<EmployeeRoleModel> empDetailsFuture;

  @override
  void initState() {
    super.initState();
    empDetailsFuture = getEmpDetails();
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "All People. 3",
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
              SizedBox(height: 200, width: double.infinity, child: RoleList()),
              SizedBox(
                height: size.height * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Invited People. 1",
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
                  height: 200, width: double.infinity, child: InvitedList()),
            ],
          ),
        ));
  }
}
