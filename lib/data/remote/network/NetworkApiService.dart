import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../AppException.dart';
import 'BaseApiService.dart';

class NetworkApiService extends BaseApiService {

  @override
  Future getResponse(String url,[bool withoutBase=false]) async {
    dynamic responseJson;
    try {
      Uri finalUri;
      if(withoutBase){
        finalUri= Uri.parse(url);
      }else{
        finalUri= Uri.parse(baseUrl + url);
      }
      final response = await http.get(finalUri);
      print(finalUri);
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  @override
  Future postResponse(String url, Map JsonBody,[bool withoutBase=false]) async{
    dynamic responseJson;
    try {
      Uri finalUri;
      if(withoutBase){
        finalUri= Uri.parse(url);
      }else{
        finalUri= Uri.parse(baseUrl + url);
      }
      final response = await http.post(finalUri,body: JsonBody);
      print(finalUri);
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 404:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while communication with server' +
                ' with status code : ${response.statusCode}');
    }
  }
}