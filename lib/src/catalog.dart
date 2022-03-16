import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cart_bloc/bloc/cart_bloc.dart';
import 'package:flutter_cart_bloc/src/item.dart';
import 'package:flutter_cart_bloc/src/my_cart.dart';

class MyCatalog extends StatefulWidget {
  const MyCatalog({Key? key}) : super(key: key);

  @override
  State<MyCatalog> createState() => _MyCatalogState();
}

class _MyCatalogState extends State<MyCatalog> {
  final List<Item> _itemList = itemList;

  @override
  Widget build(BuildContext context) {
    final _cartBloc = BlocProvider.of<CartBloc>(context);
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
      body: BlocBuilder<CartBloc, List<Item>>(
        builder: (BuildContext context, List state) {
          return Center(
            child: ListView(
              children: _itemList
                  .map((item) => _buildItem(item, state, _cartBloc))
                  .toList(),
            ),
          );
        },
        bloc: _cartBloc,
      ),
    );
  }

  Widget _buildItem(Item todo, List state, CartBloc bloc) {
    final isChecked = state.contains(todo);
    return Padding(
      padding: const EdgeInsets.all(8),
      child: ListTile(
        subtitle: Text('${todo.price}'),
        trailing: IconButton(
          onPressed: () {
            setState(() {
              if (isChecked) {
                bloc.add(CartEvent(CartEventType.remove, todo));
              } else {
                bloc.add(CartEvent(CartEventType.add, todo));
              }
            });
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
