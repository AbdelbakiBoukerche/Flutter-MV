import 'package:flutter/material.dart';

import '../f_abstract_item_model.dart';
import '../f_abstract_item_view.dart';
import '../f_model_index.dart';

class FListView extends FAbstractItemView {
  const FListView({
    super.key,
    required super.model,
    this.padding = const EdgeInsets.all(8.0),
    super.onTap,
  });

  final EdgeInsetsGeometry padding;

  @override
  State<StatefulWidget> createState() => _FListViewState();
}

class _FListViewState extends State<FListView> {
  FAbstractItemModel get model => widget.model;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: model.rowCount(),
      itemBuilder: (BuildContext context, int row) {
        var index = FModelIndex(row, 1, model);

        return InkWell(
          child: Padding(
            padding: widget.padding,
            child: Text("${index.data()}"),
          ),
          onTap: () => widget.onTap?.call(index),
        );
      },
    );
  }
}
