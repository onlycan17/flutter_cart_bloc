import 'package:flutter/widgets.dart';
import 'package:flutter_cart_bloc/bloc/cart_bloc.dart';

class CartProvider extends InheritedWidget {
  final CartBloc cartBloc;

  CartProvider({Key? key, CartBloc? cartBloc, required Widget child})
      : cartBloc = cartBloc ?? CartBloc(),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    throw UnimplementedError();
  }

  static CartBloc? of(BuildContext context) =>
      (context.dependOnInheritedWidgetOfExactType<CartProvider>())?.cartBloc;
}
