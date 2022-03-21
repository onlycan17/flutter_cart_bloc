import 'package:flutter/material.dart';
import 'package:flutter_cart_bloc/bloc/cart_bloc.dart';
import 'package:flutter_cart_bloc/bloc/cart_provider.dart';
import 'package:flutter_cart_bloc/src/item.dart';
import 'package:flutter_cart_bloc/src/my_cart.dart';

class MyCatalog extends StatefulWidget {
  const MyCatalog({Key? key}) : super(key: key);

  @override
  State<MyCatalog> createState() => _MyCatalogState();
}

class _MyCatalogState extends State<MyCatalog> {
  @override
  Widget build(BuildContext context) {
    CartBloc? cartBloc = CartProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Catalog'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => MayCart()));
              },
              icon: Icon(Icons.archive)),
        ],
      ),
      body: StreamBuilder(
          stream: cartBloc!.cartList,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView(
                children: cartBloc.itemList
                    .map((item) =>
                        _buildItem(item, snapshot.data as List<Item>, cartBloc))
                    .toList(),
              );
            }
            return CircularProgressIndicator();
          }),
    );
  }

  Widget _buildItem(Item todo, List<Item> state, CartBloc cartBloc) {
    final isChecked = state.contains(todo);
    return Padding(
      padding: const EdgeInsets.all(8),
      child: ListTile(
        subtitle: Text('${todo.price}'),
        trailing: IconButton(
          onPressed: () {
            if (isChecked) {
              cartBloc.add(CartEvent(CartEventType.remove, todo));
            } else {
              cartBloc.add(CartEvent(CartEventType.add, todo));
            }
          },
          icon: isChecked
              ? Icon(
                  Icons.check,
                  color: Colors.red,
                )
              : Icon(Icons.check),
        ),
        title: Text(
          todo.title,
          style: TextStyle(fontSize: 31),
        ),
      ),
    );
  }
}
