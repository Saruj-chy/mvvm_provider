import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_provider/res/components/round_btn.dart';
import 'package:mvvm_provider/utils/routes/routes_name.dart';
import 'package:mvvm_provider/utils/utils.dart';
import 'package:mvvm_provider/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    _emailController.dispose();
    _passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    _obsecurePassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context) ;
    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Signup View'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                focusNode: emailFocusNode,
                decoration: InputDecoration(
                    hintText: "Email",
                    labelText: "Email",
                    prefixIcon: Icon(Icons.alternate_email)),
                onFieldSubmitted: (value) {
                  Utils.fieldFocusNode(
                      context, emailFocusNode, passwordFocusNode);
                },
              ),
              ValueListenableBuilder(
                  valueListenable: _obsecurePassword,
                  builder: (context, value, child) {
                    return TextFormField(
                      controller: _passwordController,
                      obscureText: _obsecurePassword.value,
                      obscuringCharacter: "*",
                      focusNode: passwordFocusNode,
                      decoration: InputDecoration(
                          hintText: "Password",
                          labelText: "Password",
                          prefixIcon: Icon(Icons.lock_open_rounded),
                          suffixIcon: InkWell(
                              onTap: () {
                                _obsecurePassword.value =
                                !_obsecurePassword.value;
                              },
                              child: _obsecurePassword.value
                                  ? Icon(Icons.visibility_outlined)
                                  : Icon(Icons.visibility_off_outlined))),
                    );
                  }),
              SizedBox(height: height * 0.1,),
              RoundButton(
                  title:"Sign Up",
                  loading: authViewModel.signUpLoading,
                  onPress: (){
                    if(_emailController.text.isEmpty){
                      Utils.flushBarErrorMessage("Please Enter Email: ", context);
                    } else  if(_passwordController.text.isEmpty){
                      Utils.flushBarErrorMessage("Please Enter Password: ", context);
                    } else  if(_passwordController.text.length <6){
                      Utils.flushBarErrorMessage("Please Enter a digit password: ", context);
                    }else{
                      print("API hit");
                      Map data = {
                        "email": _emailController.text.toString(),
                        "password": _passwordController.text.toString()
                      };
                      authViewModel.signUpApi(data, context);
                    }
                  }),
              SizedBox(height: height * 0.02,),
              InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, RoutesName.login) ;
                  },
                  child: Text("Already have an Account? Sign In")),
            ],
          ),
        ),
      ),
    );
  }
}
