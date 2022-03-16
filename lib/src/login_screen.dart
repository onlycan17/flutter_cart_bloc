import 'package:flutter/material.dart';
import 'package:flutter_cart_bloc/src/catalog.dart';

class MyLoginScreen extends StatefulWidget {
  const MyLoginScreen({Key? key}) : super(key: key);

  @override
  State<MyLoginScreen> createState() => _MyLoginScreenState();
}

class _MyLoginScreenState extends State<MyLoginScreen> {
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'),
      ),
      body: Column(
        children: [
          Text('Login'),
          TextField(
            controller: _loginController,
          ),
          Text('Password'),
          TextField(
            controller: _passwordController,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => MyCatalog()));
              },
              child: Text('Enter'))
        ],
      ),
    );
  }
}
