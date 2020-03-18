import 'package:flutter/material.dart';
import './src/screens/news_list.dart';
import './src/screens/news_detail.dart';
import './src/blocs/stories_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Route routes(RouteSettings settings) {
    if (settings.name == '/') {
      return MaterialPageRoute(
        builder: (context) {
          final bloc = StoriesProvider.of(context);

          bloc.fetchTopIds();
          return NewsList();
        },
      );
    } else {
      return MaterialPageRoute(builder: (context) {
        final itemId = int.parse(settings.name.replaceFirst('/', ''));
        return NewsDetail(itemId: itemId);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return StoriesProvider(
      child: MaterialApp(title: 'News!!', onGenerateRoute: routes),
    );
  }
}
