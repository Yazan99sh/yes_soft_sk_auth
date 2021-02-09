import 'dart:convert';
import 'package:http/http.dart' as http;
class ApiClient {
  String token;
  final String tag = 'ApiClient';

  // get
  Future <Map<String,dynamic>>get(String url , var headers)async{
    http.Response response = await http.post(url,headers:headers);
    print(response.body);
    return _processResponse(response);
  }
  //post
  Future <Map<String,dynamic>>post(String url , var headers , var body)async{
  http.Response response = await http.post(url,headers:headers,body:body);
  print(response.body);
  return _processResponse(response);
  }
  //put
  Map<String, dynamic> _processResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 400) {
      return json.decode(response.body);
    } else {
      return null;
    }
  }
}
