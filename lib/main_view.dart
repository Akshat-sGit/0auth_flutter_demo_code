import 'package:authdemo/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:auth0_flutter/auth0_flutter.dart';


class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {

  Credentials? _credentials;
  late Auth0 auth0; 

  @override
  void initState(){
    super.initState();
    auth0 = Auth0('dev-ic6l737rxpu8ozlv.us.auth0.com', 'jeHuB9UHTuBivF9Z46OKooNOjsj34ije');
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text('0Auth',style: TextStyle(color: Colors.white),),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if(_credentials == null)
            ElevatedButton(
              onPressed: () async {
                final credentials = await auth0.webAuthentication().login(useHTTPS: true);
                setState(() {
                  _credentials = credentials;
                });
              },
              child: const Text('Login', style: TextStyle(color: Colors.black),
              ),
            )
          else 
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ProfileView(user: _credentials!.user),
                ElevatedButton(
                  onPressed: () async {
                    await auth0.webAuthentication().logout();
                    setState(() {
                      _credentials = null;
                    });
                  }, 
                  child: const Text('Logout', style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            )
        ],
      ),
    );
  }
}