import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cart_bloc/bloc/cart_bloc.dart';
import 'package:flutter_cart_bloc/src/item.dart';

class MayCart extends StatefulWidget {
  const MayCart({Key? key}) : super(key: key);

  @override
  State<MayCart> createState() => _MayCartState();
}

class _MayCartState extends State<MayCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyCart'),
      ),
      body: BlocBuilder<CartBloc, List<Item>>(
        bloc: BlocProvider.of<CartBloc>(context),
        builder: (BuildContext context, List state) {
          var sum = 0;
          if (state.length > 0) {
            sum = state.map((item) => item.price).reduce((x, y) => x + y);
          }
          return Center(
            child: Text('합계 : $sum'),
          );
        },
      ),
    );
  }
}
