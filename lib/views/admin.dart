import 'package:flutter/material.dart';
import 'package:sw2project/view_model/userProvider.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({Key? key}) : super(key: key);

  @override
  _AdminScreenState createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  User user = User();
  late List users;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin'),
      ),
      body: ListView.builder(itemBuilder: (context, index) {
        return Container(
          child: Text(users[index]['username']),
        );
      }),
    );
  }
}
