import 'dart:convert';
import 'package:http/http.dart' show Client;
import 'package:second_flutter_app/models/user_response_model.dart';

class ApiProvider {
  Client client = Client();
  final _baseUrl =
      "http://ec2-3-18-9-117.us-east-2.compute.amazonaws.com/api/v1/profile/";

  Future<UserResponse> fetchUser() async {
    final response = await client.get("$_baseUrl");
    print(response.body.toString());

    if (response.statusCode == 200) {
      return UserResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load Users');
    }
  }
}