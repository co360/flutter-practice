import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './screens/products_overview_screen.dart';
import './screens/product_detail_screen.dart';
import './providers/products.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget _buildMaterialApp(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: Products(),
      child: MaterialApp(
        title: 'Practice with Udemy',
        initialRoute: '/',
        routes: {
          '/': (context) => ProductsOverviewScreen(),
          ProductDetailScreen.routeName: (context) => ProductDetailScreen(),
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
          // textTheme: ThemeData.light().textTheme.copyWith(
          //   body1: ,
          //   body2: ,
          //   title: ,
          // ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildMaterialApp(context);
  }
}