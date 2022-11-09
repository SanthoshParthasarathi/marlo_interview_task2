import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:marlo_task2/model/employee_role_model.dart';

class ApiHandler {
  static Future<List<Contacts>> getContactsDetail() async {
    String authToken =
        "eyJhbGciOiJSUzI1NiIsImtpZCI6ImQ3YjE5MTI0MGZjZmYzMDdkYzQ3NTg1OWEyYmUzNzgzZGMxYWY4OWYiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL3NlY3VyZXRva2VuLmdvb2dsZS5jb20vbWFybG8tYmFuay1kZXYiLCJhdWQiOiJtYXJsby1iYW5rLWRldiIsImF1dGhfdGltZSI6MTY2ODAxNzg1NywidXNlcl9pZCI6IlJoSGdiY1U0cHZNMGR3RE90d1piTlhPOTlRMjMiLCJzdWIiOiJSaEhnYmNVNHB2TTBkd0RPdHdaYk5YTzk5UTIzIiwiaWF0IjoxNjY4MDE3ODU3LCJleHAiOjE2NjgwMjE0NTcsImVtYWlsIjoieGlob2g1NTQ5NkBkaW5lcm9hLmNvbSIsImVtYWlsX3ZlcmlmaWVkIjpmYWxzZSwiZmlyZWJhc2UiOnsiaWRlbnRpdGllcyI6eyJlbWFpbCI6WyJ4aWhvaDU1NDk2QGRpbmVyb2EuY29tIl19LCJzaWduX2luX3Byb3ZpZGVyIjoicGFzc3dvcmQifX0.Ym6hqH2j0-VbJhsqXctuogPP91Y2vWZGce2wD_0JuDcg9k2tx4WhvzBbzAs215igtzULGopeD0jzmdVbVR5oqkagofd26VxhzUqrOXbOKkm0daiOn-lmXiY5t94GSmslwkYxegUJ9JYaVpkzWtASfhaJ31UWKveUNhS-Nwq1TotCnZvvH5Y02urSLXQNhfCxofa2Y95JT5th8EK2gcAu38-7WwUbaspfx9OqWC6__sX61SKBXe3J2qNCBZmBMwVt0zPZS8cS6Bm2Of21DiT857_DbF0i1AN5oTOiw2uNF8vnF1t9QbJ5OarOPzFsa3_W1jhlO2Bgz6782zAv_8xmRA";

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

    for (var i in data['data']['contacts']) {
      tempList.add(i);
    }
    // print("data from templist");

    // print(tempList);
    return Contacts.dataFromSnapshot(tempList);
  }

  static Future<List<Invites>> getInviteDetail() async {
    String authToken =
        "eyJhbGciOiJSUzI1NiIsImtpZCI6ImQ3YjE5MTI0MGZjZmYzMDdkYzQ3NTg1OWEyYmUzNzgzZGMxYWY4OWYiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL3NlY3VyZXRva2VuLmdvb2dsZS5jb20vbWFybG8tYmFuay1kZXYiLCJhdWQiOiJtYXJsby1iYW5rLWRldiIsImF1dGhfdGltZSI6MTY2ODAxNzg1NywidXNlcl9pZCI6IlJoSGdiY1U0cHZNMGR3RE90d1piTlhPOTlRMjMiLCJzdWIiOiJSaEhnYmNVNHB2TTBkd0RPdHdaYk5YTzk5UTIzIiwiaWF0IjoxNjY4MDE3ODU3LCJleHAiOjE2NjgwMjE0NTcsImVtYWlsIjoieGlob2g1NTQ5NkBkaW5lcm9hLmNvbSIsImVtYWlsX3ZlcmlmaWVkIjpmYWxzZSwiZmlyZWJhc2UiOnsiaWRlbnRpdGllcyI6eyJlbWFpbCI6WyJ4aWhvaDU1NDk2QGRpbmVyb2EuY29tIl19LCJzaWduX2luX3Byb3ZpZGVyIjoicGFzc3dvcmQifX0.Ym6hqH2j0-VbJhsqXctuogPP91Y2vWZGce2wD_0JuDcg9k2tx4WhvzBbzAs215igtzULGopeD0jzmdVbVR5oqkagofd26VxhzUqrOXbOKkm0daiOn-lmXiY5t94GSmslwkYxegUJ9JYaVpkzWtASfhaJ31UWKveUNhS-Nwq1TotCnZvvH5Y02urSLXQNhfCxofa2Y95JT5th8EK2gcAu38-7WwUbaspfx9OqWC6__sX61SKBXe3J2qNCBZmBMwVt0zPZS8cS6Bm2Of21DiT857_DbF0i1AN5oTOiw2uNF8vnF1t9QbJ5OarOPzFsa3_W1jhlO2Bgz6782zAv_8xmRA";

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

  static Future<Invites> postInviteRequest(String email, String role) async {
    String authToken =
        "eyJhbGciOiJSUzI1NiIsImtpZCI6ImQ3YjE5MTI0MGZjZmYzMDdkYzQ3NTg1OWEyYmUzNzgzZGMxYWY4OWYiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL3NlY3VyZXRva2VuLmdvb2dsZS5jb20vbWFybG8tYmFuay1kZXYiLCJhdWQiOiJtYXJsby1iYW5rLWRldiIsImF1dGhfdGltZSI6MTY2ODAxNzg1NywidXNlcl9pZCI6IlJoSGdiY1U0cHZNMGR3RE90d1piTlhPOTlRMjMiLCJzdWIiOiJSaEhnYmNVNHB2TTBkd0RPdHdaYk5YTzk5UTIzIiwiaWF0IjoxNjY4MDE3ODU3LCJleHAiOjE2NjgwMjE0NTcsImVtYWlsIjoieGlob2g1NTQ5NkBkaW5lcm9hLmNvbSIsImVtYWlsX3ZlcmlmaWVkIjpmYWxzZSwiZmlyZWJhc2UiOnsiaWRlbnRpdGllcyI6eyJlbWFpbCI6WyJ4aWhvaDU1NDk2QGRpbmVyb2EuY29tIl19LCJzaWduX2luX3Byb3ZpZGVyIjoicGFzc3dvcmQifX0.Ym6hqH2j0-VbJhsqXctuogPP91Y2vWZGce2wD_0JuDcg9k2tx4WhvzBbzAs215igtzULGopeD0jzmdVbVR5oqkagofd26VxhzUqrOXbOKkm0daiOn-lmXiY5t94GSmslwkYxegUJ9JYaVpkzWtASfhaJ31UWKveUNhS-Nwq1TotCnZvvH5Y02urSLXQNhfCxofa2Y95JT5th8EK2gcAu38-7WwUbaspfx9OqWC6__sX61SKBXe3J2qNCBZmBMwVt0zPZS8cS6Bm2Of21DiT857_DbF0i1AN5oTOiw2uNF8vnF1t9QbJ5OarOPzFsa3_W1jhlO2Bgz6782zAv_8xmRA";

    String apiUrl =
        "https://asia-southeast1-marlo-bank-dev.cloudfunctions.net/api_dev/invites";

    var uri = Uri.parse(apiUrl);

    var jsonBody = {
      'email': "pp@storypo.com",
      'role': "2",
    };

    final response = await http.post(
      uri,
      headers: {
        'authtoken': '$authToken',
      },
      body: jsonBody,
    );
    var data = json.decode(response.body);

    print(data);
    print("data from api");

    return Invites.fromJson(data);
  }
}
