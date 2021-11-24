import 'package:flutter/material.dart';
import 'package:sw2project/view_model/userProvider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

enum authType { login, signup }

class _LoginPageState extends State<LoginPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  authType _authType = authType.login;

  List<String> area = [
    'Alexandria',
    'Aswan',
    'Asyut',
    'Beheira',
    'Beni Suef',
    'Cairo',
    'Dakahlia',
    'Damietta',
    'Faiyum',
    'Gharbia',
    'Giza',
    'Ismailia',
    'Luxor'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Transporter'),
        ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Transporter',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    )),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10),
                  child: Text(
                    _authType == authType.login ? 'Sign in' : 'Sign Up',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                _authType == authType.signup
                    ? Container(
                        padding: EdgeInsets.all(10),
                        child: TextField(
                          controller: nameController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'User Name',
                          ),
                        ),
                      )
                    : SizedBox(),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                    ),
                  ),
                ),
                _authType == authType.signup
                    ? Container(
                        padding: EdgeInsets.all(10),
                        child: TextField(
                          keyboardType: TextInputType.number,
                          controller: phoneController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Phone Number',
                          ),
                        ),
                      )
                    : SizedBox(),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                ),
                _authType == authType.login
                    ? FlatButton(
                        onPressed: () {
                          //forgot password screen
                        },
                        textColor: Colors.blue,
                        child: Text('Forgot Password'),
                      )
                    : SizedBox(
                        height: 20,
                      ),
                Container(
                    height: 50,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.blue,
                      child: Text(
                          _authType == authType.login ? 'Login' : 'Sign UP'),
                      onPressed: ()async {
                        User user = User();
                        await user.setEmail('driver@gmail.com');
                        await user.setPassword('1234567');
                        await user.setUsername('driver');
                        await user.setPhoneNumber('01006126863');
                        await user.setUserType('driver');
                        await user.getOnlyOneUser();
                      },
                    )),
                Container(
                    child: Row(
                  children: <Widget>[
                    Text(_authType == authType.login
                        ? 'Does not have account?'
                        : 'Go to'),
                    FlatButton(
                      textColor: Colors.blue,
                      child: Text(
                        _authType == authType.login ? 'Sign up' : 'Login',
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        if (_authType == authType.login) {
                          setState(() {
                            _authType = authType.signup;
                          });
                        } else {
                          setState(() {
                            _authType = authType.login;
                          });
                        }
                        //signup screen
                      },
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ))
              ],
            )));
    ;
  }
}
