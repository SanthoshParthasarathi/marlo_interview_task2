import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:marlo_task2/model/employee_role_model.dart';
import 'package:oktoast/oktoast.dart';

class ApiHandler {
  static Future<List<Contacts>> getContactsDetail() async {
    String authToken =
        "eyJhbGciOiJSUzI1NiIsImtpZCI6ImQ3YjE5MTI0MGZjZmYzMDdkYzQ3NTg1OWEyYmUzNzgzZGMxYWY4OWYiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL3NlY3VyZXRva2VuLmdvb2dsZS5jb20vbWFybG8tYmFuay1kZXYiLCJhdWQiOiJtYXJsby1iYW5rLWRldiIsImF1dGhfdGltZSI6MTY2ODA3ODc0MiwidXNlcl9pZCI6IlJoSGdiY1U0cHZNMGR3RE90d1piTlhPOTlRMjMiLCJzdWIiOiJSaEhnYmNVNHB2TTBkd0RPdHdaYk5YTzk5UTIzIiwiaWF0IjoxNjY4MDc4NzQyLCJleHAiOjE2NjgwODIzNDIsImVtYWlsIjoieGlob2g1NTQ5NkBkaW5lcm9hLmNvbSIsImVtYWlsX3ZlcmlmaWVkIjpmYWxzZSwiZmlyZWJhc2UiOnsiaWRlbnRpdGllcyI6eyJlbWFpbCI6WyJ4aWhvaDU1NDk2QGRpbmVyb2EuY29tIl19LCJzaWduX2luX3Byb3ZpZGVyIjoicGFzc3dvcmQifX0.dDcyVqLQzYK1NeBKNQT6dGsDhFIplhPO-2XYaR4vB0fGON8r9jFDKuuD-LQzVR_3q9-PTH0XBHKWRrKEwLeeQ1i7xfLZfrC1eaVsJ5W8awT92GrWqaZSW5Kd4j8tGg1wCdrJDdNnicZPhE9NbkRgoJKJueBf11lhJyB2cn496KLIM_ZbLDrJlx_zGXIG8TINWEq2VRNCGUneSX1umUXQSk7WU9c8OmZwMugI8vJOhuCXso9zYLKZOmr3ngexKnXZr65wUTdsIVf_EgbypIcqCx-AwmkcKUWjLLAzfY6VuLfUcHx496Ho9NW_Exi3iTyNuQAMzkTvBJf6m1QVW83UFA";

    String apiUrl =
        "https://asia-southeast1-marlo-bank-dev.cloudfunctions.net/api_dev/company/6dc9858b-b9eb-4248-a210-0f1f08463658/teams";

    var uri = Uri.parse(apiUrl);

    // print("before get");

    final response = await http.get(
      uri,
      headers: {
        'authtoken': '$authToken',
      },
    );
    var data = json.decode(response.body);

    // print(data);
    // print("data from api");

    List tempList = [];

    for (var i in data['data']['contacts']) {
      tempList.add(i);
    }
    // print("data from templist");

    // print(tempList);
    return Contacts.dataFromSnapshot(tempList);
  }

  static Future<List<Invites>> getInviteDetail() async {
    String authToken =
        "eyJhbGciOiJSUzI1NiIsImtpZCI6ImQ3YjE5MTI0MGZjZmYzMDdkYzQ3NTg1OWEyYmUzNzgzZGMxYWY4OWYiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL3NlY3VyZXRva2VuLmdvb2dsZS5jb20vbWFybG8tYmFuay1kZXYiLCJhdWQiOiJtYXJsby1iYW5rLWRldiIsImF1dGhfdGltZSI6MTY2ODA3ODc0MiwidXNlcl9pZCI6IlJoSGdiY1U0cHZNMGR3RE90d1piTlhPOTlRMjMiLCJzdWIiOiJSaEhnYmNVNHB2TTBkd0RPdHdaYk5YTzk5UTIzIiwiaWF0IjoxNjY4MDc4NzQyLCJleHAiOjE2NjgwODIzNDIsImVtYWlsIjoieGlob2g1NTQ5NkBkaW5lcm9hLmNvbSIsImVtYWlsX3ZlcmlmaWVkIjpmYWxzZSwiZmlyZWJhc2UiOnsiaWRlbnRpdGllcyI6eyJlbWFpbCI6WyJ4aWhvaDU1NDk2QGRpbmVyb2EuY29tIl19LCJzaWduX2luX3Byb3ZpZGVyIjoicGFzc3dvcmQifX0.dDcyVqLQzYK1NeBKNQT6dGsDhFIplhPO-2XYaR4vB0fGON8r9jFDKuuD-LQzVR_3q9-PTH0XBHKWRrKEwLeeQ1i7xfLZfrC1eaVsJ5W8awT92GrWqaZSW5Kd4j8tGg1wCdrJDdNnicZPhE9NbkRgoJKJueBf11lhJyB2cn496KLIM_ZbLDrJlx_zGXIG8TINWEq2VRNCGUneSX1umUXQSk7WU9c8OmZwMugI8vJOhuCXso9zYLKZOmr3ngexKnXZr65wUTdsIVf_EgbypIcqCx-AwmkcKUWjLLAzfY6VuLfUcHx496Ho9NW_Exi3iTyNuQAMzkTvBJf6m1QVW83UFA";

    String apiUrl =
        "https://asia-southeast1-marlo-bank-dev.cloudfunctions.net/api_dev/company/6dc9858b-b9eb-4248-a210-0f1f08463658/teams";

    var uri = Uri.parse(apiUrl);

    final response = await http.get(
      uri,
      headers: {
        'authtoken': '$authToken',
      },
    );
    var data = json.decode(response.body);

    // print(data);
    // print("data from api");

    List tempList = [];

    for (var i in data['data']['invites']) {
      tempList.add(i);
    }
    // print("data from templist");

    // print(tempList);
    return Invites.dataFromSnapshot(tempList);
  }

  static Future<Invites> postInviteRequest(
      String email, String role, BuildContext context) async {
    String authToken =
        "eyJhbGciOiJSUzI1NiIsImtpZCI6ImQ3YjE5MTI0MGZjZmYzMDdkYzQ3NTg1OWEyYmUzNzgzZGMxYWY4OWYiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL3NlY3VyZXRva2VuLmdvb2dsZS5jb20vbWFybG8tYmFuay1kZXYiLCJhdWQiOiJtYXJsby1iYW5rLWRldiIsImF1dGhfdGltZSI6MTY2ODA3ODc0MiwidXNlcl9pZCI6IlJoSGdiY1U0cHZNMGR3RE90d1piTlhPOTlRMjMiLCJzdWIiOiJSaEhnYmNVNHB2TTBkd0RPdHdaYk5YTzk5UTIzIiwiaWF0IjoxNjY4MDc4NzQyLCJleHAiOjE2NjgwODIzNDIsImVtYWlsIjoieGlob2g1NTQ5NkBkaW5lcm9hLmNvbSIsImVtYWlsX3ZlcmlmaWVkIjpmYWxzZSwiZmlyZWJhc2UiOnsiaWRlbnRpdGllcyI6eyJlbWFpbCI6WyJ4aWhvaDU1NDk2QGRpbmVyb2EuY29tIl19LCJzaWduX2luX3Byb3ZpZGVyIjoicGFzc3dvcmQifX0.dDcyVqLQzYK1NeBKNQT6dGsDhFIplhPO-2XYaR4vB0fGON8r9jFDKuuD-LQzVR_3q9-PTH0XBHKWRrKEwLeeQ1i7xfLZfrC1eaVsJ5W8awT92GrWqaZSW5Kd4j8tGg1wCdrJDdNnicZPhE9NbkRgoJKJueBf11lhJyB2cn496KLIM_ZbLDrJlx_zGXIG8TINWEq2VRNCGUneSX1umUXQSk7WU9c8OmZwMugI8vJOhuCXso9zYLKZOmr3ngexKnXZr65wUTdsIVf_EgbypIcqCx-AwmkcKUWjLLAzfY6VuLfUcHx496Ho9NW_Exi3iTyNuQAMzkTvBJf6m1QVW83UFA";

    String apiUrl =
        "https://asia-southeast1-marlo-bank-dev.cloudfunctions.net/api_dev/invites";

    var uri = Uri.parse(apiUrl);

    var jsonBody = {
      'email': "$email",
      'role': "$role",
    };

    var body = jsonBody;

    final response = await http.post(
      uri,
      headers: {
        'authtoken': '$authToken',
      },
      body: body,
    );
    var data = json.decode(response.body);

    if (data["error_flag"] == "SUCCESS") {
      showToast(
        data["message"].toString(),
        duration: Duration(seconds: 2),
        position: ToastPosition.bottom,
        backgroundColor: Colors.black.withOpacity(0.8),
        radius: 13.0,
        textStyle: TextStyle(fontSize: 18.0),
      );
    } else {
      showToast(
        data["message"].toString(),
        duration: Duration(seconds: 2),
        position: ToastPosition.bottom,
        backgroundColor: Colors.black.withOpacity(0.8),
        radius: 13.0,
        textStyle: TextStyle(fontSize: 18.0),
      );
    }
    Navigator.of(context).pop();

    print(data);
    print("data from api");

    return Invites.fromJson(data);
  }
}
