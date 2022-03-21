import 'package:flutter/material.dart';
import 'package:flutter_cart_bloc/bloc/cart_bloc.dart';
import 'package:flutter_cart_bloc/bloc/cart_provider.dart';
import 'package:flutter_cart_bloc/src/item.dart';

class MayCart extends StatefulWidget {
  const MayCart({Key? key}) : super(key: key);

  @override
  State<MayCart> createState() => _MayCartState();
}

class _MayCartState extends State<MayCart> {
  @override
  Widget build(BuildContext context) {
    CartBloc? cartBloc = CartProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('MyCart'),
      ),
      body: StreamBuilder<List<Item>>(
          stream: cartBloc!.cartList,
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              var sum = 0;
              if (snapshot.data!.isNotEmpty) {
                sum = snapshot.data!
                    .map((item) => item.price)
                    .reduce((x, y) => x + y);
              }
              return Center(
                child: Text('합계 : $sum'),
              );
            }
            return Center(
              child: const Text('합계 : 0'),
            );
          })),
    );
  }
}
