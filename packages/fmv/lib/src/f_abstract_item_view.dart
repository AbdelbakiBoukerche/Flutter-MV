import 'package:flutter/widgets.dart';

import 'f_abstract_item_model.dart';
import 'f_model_index.dart';

abstract class FAbstractItemView extends StatefulWidget {
  const FAbstractItemView({
    Key? key,
    required this.model,
    this.onTap,
  }) : super(key: key);

  final FAbstractItemModel model;
  final Function(FModelIndex)? onTap;
}
