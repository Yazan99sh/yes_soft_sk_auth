import 'dart:convert';
import 'package:http/http.dart' as http;
class ApiClient {
  String token;
  final String tag = 'ApiClient';

  // get
  Future <Map<String,dynamic>>get(String url,Map<String, String> headers)async{
    http.Response response = await http.get(url,headers:headers);
    return _processResponse(response);
  }
  //post
  Future <Map<String,dynamic>>post(String url , Map<String, String> headers , var body)async{
    http.Response response = await http.post(url,headers:headers,body:jsonEncode(body));
    return _processResponse(response);
  }
  //put
  Future <Map<String,dynamic>>put(String url , Map<String, String> headers , var body)async{
    http.Response response = await http.put(url,headers:headers,body:jsonEncode(body));
    return _processResponse(response);
  }


  Map<String, dynamic> _processResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 400) {
      return json.decode(response.body);
    } else {
      return null;
    }
  }
}
