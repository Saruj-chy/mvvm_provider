import 'package:flutter/material.dart';
import 'package:mvvm_provider/utils/routes/routes_name.dart';
import 'package:mvvm_provider/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final userPreferences = Provider.of<UserViewModel>(context) ;
    return Scaffold(
      appBar: AppBar(title: Text("Home Screen"),),
      body: InkWell(
        onTap: (){
          userPreferences.remove().then((value){
            Navigator.pushNamed(context, RoutesName.login) ;
          });
        },
          child: Center(
              child: Text("Log Out"))),
    );
  }
}
