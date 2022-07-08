import 'package:flutter/material.dart';
import 'package:fmv/fmv.dart';

import 'models/movies_model.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  /// 0 : List
  /// 1 : Table
  /// 2 : Tree
  int _currentView = 0;

  @override
  Widget build(BuildContext context) {
    MoviesModel model = MoviesModel();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          splashRadius: 25.0,
          onPressed: () {
            model.fetchMore();
          },
          icon: const Icon(Icons.add),
        ),
        title: const Text('Flutter Model/View Pattern'),
        centerTitle: true,
        actions: [
          IconButton(
            splashRadius: 25.0,
            onPressed: () {
              setState(() {
                _currentView = 0;
              });
            },
            icon: const Icon(Icons.list_alt),
          ),
          IconButton(
            splashRadius: 25.0,
            onPressed: () {
              setState(() {
                _currentView = 1;
              });
            },
            icon: const Icon(Icons.view_comfortable),
          ),
          IconButton(
            splashRadius: 25.0,
            onPressed: () {
              setState(() {
                _currentView = 3;
              });
            },
            icon: const Icon(Icons.view_sidebar),
          ),
        ],
      ),
      body: _getView(model),
    );
  }

  Widget _getView(FAbstractItemModel model) {
    if (_currentView == 0) {
      return FListView(
        model: model,
        onTap: (modelIndex) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(content: Text("${modelIndex.data()} ")));
        },
      );
    } else if (_currentView == 1) {
      return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: FTableView(
          showCheckboxColumn: false,
          model: model,
          rowsPerPage: 5,
          onTap: (modelIndex) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(SnackBar(content: Text("${modelIndex.data()} ")));
          },
        ),
      );
    } else {
      return const Text("Tree View");
    }
  }
}
