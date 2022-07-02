import 'package:flutter/widgets.dart';

import 'f_abstract_item_model.dart';

abstract class FAbstractItemView extends StatefulWidget {
  const FAbstractItemView({
    Key? key,
    required this.model,
  }) : super(key: key);

  final FAbstractItemModel model;
}
