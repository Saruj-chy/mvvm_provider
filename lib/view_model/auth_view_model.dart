import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvm_provider/repository/auth_repository.dart';
import 'package:mvvm_provider/utils/routes/routes_name.dart';
import 'package:mvvm_provider/utils/utils.dart';

class AuthViewModel with ChangeNotifier {
  final _myRepo = AuthRepository();
  bool _loading = false;
  bool get loading => _loading;

  bool _signUpLoading = false;
  bool get signUpLoading => _signUpLoading;

  setLoading(bool value){
    _loading = value ;
    notifyListeners();
  }

  setSignUpLoading(bool value){
    _signUpLoading = value ;
    notifyListeners();
  }


  Future<void> lognApi(dynamic data, BuildContext context) async {
    print(data) ;
    setLoading(true);
    _myRepo.loginApi(data).then((value) {
      setLoading(false) ;
      Utils.flushBarErrorMessage("Login Successfully", context) ;
      Navigator.pushNamed(context, RoutesName.home) ;
      if(kDebugMode){
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setLoading(false) ;
      if(kDebugMode){
        Utils.flushBarErrorMessage("Login Failed", context) ;
        print(error.toString());
      }
    });
  }
  Future<void> signUpApi(dynamic data, BuildContext context) async {
    setSignUpLoading(true);
    _myRepo.loginApi(data).then((value) {
      setSignUpLoading(false) ;
      Utils.flushBarErrorMessage("Sign Up Successfully", context) ;
      Navigator.pushNamed(context, RoutesName.home) ;
      if(kDebugMode){
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setSignUpLoading(false) ;
      if(kDebugMode){
        Utils.flushBarErrorMessage("Sign Up Failed", context) ;
        print(error.toString());
      }
    });
  }


}
