import 'package:flutter/material.dart';

import '../f_abstract_item_model.dart';
import '../f_abstract_item_view.dart';
import '../f_model_index.dart';

class FTableView extends FAbstractItemView {
  const FTableView({
    Key? key,
    required FAbstractItemModel model,
  }) : super(key: key, model: model);

  @override
  State<StatefulWidget> createState() => _FTableViewState();
}

class _FTableViewState extends State<FTableView> {
  FAbstractItemModel get model => widget.model;

  late Set<FModelIndex> _selectedIndexes;

  @override
  void initState() {
    super.initState();

    _selectedIndexes = {};
  }

  @override
  void dispose() {
    _selectedIndexes.clear();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: DataTable(
        columns: _getColumn(),
        rows: _getRows(),
      ),
    );
  }

  List<DataColumn> _getColumn() {
    List<DataColumn> columns = [];
    for (int i = 0; i < model.columnCount(); i++) {
      columns.add(
        DataColumn(
          label: Text("${model.headerData(i)}"),
        ),
      );
    }
    return columns;
  }

  List<DataRow> _getRows() {
    List<DataRow> rows = [];
    for (int i = 0; i < model.rowCount(); i++) {
      rows.add(
        DataRow(
          cells: _getRowCells(i),
        ),
      );
    }
    return rows;
  }

  List<DataCell> _getRowCells(int row) {
    List<DataCell> cells = [];
    for (int i = 0; i < model.columnCount(); i++) {
      var dataIndex = FModelIndex(row, i, model);
      cells.add(
        DataCell(
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 250.0,
              minWidth: 100.0,
            ),
            child: Text(
              "${dataIndex.data() ?? "N/A"}",
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      );
    }
    return cells;
  }
}
