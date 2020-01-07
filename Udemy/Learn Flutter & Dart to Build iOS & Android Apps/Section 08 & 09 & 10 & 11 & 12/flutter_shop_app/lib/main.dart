import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './screens/products_overview_screen.dart';
import './screens/product_detail_screen.dart';
import './screens/cart_screen.dart';
import './screens/orders_screen.dart';
import './screens/user_products_screen.dart';
import './screens/edit_product_screen.dart';
import './screens/auth-screen.dart';
import './providers/products.dart';
import './providers/cart.dart';
import './providers/orders.dart';
import './providers/auth.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget _buildMaterialApp(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Auth(),
        ),
        ChangeNotifierProvider.value(
          value: Products(),
        ),
        ChangeNotifierProvider.value(
          value: Cart(),
        ),
        ChangeNotifierProvider.value(
          value: Orders(),
        ),
      ],
      child: Consumer<Auth>(builder: (context, auth, child) {
        return MaterialApp(
          title: 'Practice with Udemy',
          initialRoute: auth.isAuth ? ProductsOverviewScreen.routeName : '/',
          routes: {
            '/': (context) => AuthScreen(),
            ProductsOverviewScreen.routeName: (context) =>
                ProductsOverviewScreen(),
            ProductDetailScreen.routeName: (context) => ProductDetailScreen(),
            CartScreen.routeName: (context) => CartScreen(),
            OrdersScreen.routeName: (context) => OrdersScreen(),
            UserProductsScreen.routeName: (context) => UserProductsScreen(),
            EditProductScreen.routeName: (context) => EditProductScreen(),
          },
          onGenerateRoute: (settings) {
            return MaterialPageRoute(
                builder: (context) => ProductsOverviewScreen());
          },
          onUnknownRoute: (settings) {
            return MaterialPageRoute(
                builder: (context) => ProductsOverviewScreen());
          },
          theme: ThemeData(
            primaryColor: Colors.purple,
            primarySwatch: Colors.purple,
            accentColor: Colors.deepOrange,
            fontFamily: 'Lato',
          ),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildMaterialApp(context);
  }
}
