import 'package:http/http.dart';

class Network {
  static const bool isTester = false;

  static String SERVER_DEVELOPMENT = "jsonplaceholder.typicode.com";
  static String SERVER_DEPLOYMENT = "jsonplaceholder.typicode.com";

  static String getServer() {
    if (isTester) return SERVER_DEVELOPMENT;
    return SERVER_DEPLOYMENT;
  }

  // ! Http Header

  static Map<String, String> getHeaders() {
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8'
    };
    return headers;
  }

  // ! Http Request

  static Future<String?> GET(String api, Map<String, String> params) async {
    var uri = Uri.https(getServer(), api, params); // http or https
    var response = await get(uri);
    print(response.body);
    if (response.statusCode == 200) return response.body;

    return null;
  }

  // ! Http APIs

  static String API_GET_PHOTO = '/photos';

  // ! Http Params

  static Map<String, String> paramsEmpty() {
    Map<String, String> params = {};
    return params;
  }
}