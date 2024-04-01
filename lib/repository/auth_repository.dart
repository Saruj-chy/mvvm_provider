import 'package:mvvm_provider/data/network/BaseApiServices.dart';
import 'package:mvvm_provider/data/network/NetworkApiService.dart';
import 'package:mvvm_provider/res/app_url.dart';

class AuthRepository{
  BaseApiServices _apiServices = NetworkApiService();

  Future<dynamic> loginApi(dynamic data) async {
    try{
      dynamic response = await _apiServices.getPostApiResponse(AppUrl.login_url, data);
      return response;
    }catch(e){
      throw e;
    }
  }

  Future<dynamic> signupApi(dynamic data) async {
    try{
      dynamic response = await _apiServices.getPostApiResponse(AppUrl.register_url, data);
      return response;
    }catch(e){
      throw e;
    }
  }


}