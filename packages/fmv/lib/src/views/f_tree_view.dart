import 'package:flutter/material.dart';

import '../f_abstract_item_model.dart';
import '../f_abstract_item_view.dart';
import '../f_model_index.dart';

class FTreeView extends FAbstractItemView {
  const FTreeView({
    Key? key,
    required FAbstractItemModel model,
  }) : super(key: key, model: model);

  @override
  State<StatefulWidget> createState() => _FTreeViewState();
}

class _FTreeViewState extends State<FTreeView> {
  @override
  Widget build(BuildContext context) {
    return const SizedBox();
  }
}
