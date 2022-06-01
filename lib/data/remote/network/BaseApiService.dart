
import 'dart:ffi';

abstract class BaseApiService {

  final String baseUrl = "https://reqres.in/";

  Future<dynamic> getResponse(String url,[bool withoutBase=false]);
  Future<dynamic> postResponse(String url,Map jsonBody,[bool withoutBase=false]);

}