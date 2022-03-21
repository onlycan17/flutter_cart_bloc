import 'package:flutter/material.dart';
import 'package:flutter_cart_bloc/bloc/cart_provider.dart';
import 'package:flutter_cart_bloc/src/catalog.dart';
import 'package:flutter_cart_bloc/src/login_screen.dart';

void main() {
  runApp(MyApp());
}

//final cartBloc = CartBloc();

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CartProvider(
      child: MaterialApp(
        title: 'Flutter Code Sample for material.Scaffold',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyLoginScreen(),
      ),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Enter'),
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const MyCatalog()));
          },
        ),
      ),
    );
  }
}
