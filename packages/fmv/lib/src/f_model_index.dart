import './f_abstract_item_model.dart';

class FModelIndex {
  FModelIndex([
    int? row,
    int? column,
    FAbstractItemModel? model,
    FModelIndex? parent,
  ])  : _row = row,
        _column = column,
        _model = model,
        _parent = parent;

  final int? _row;
  final int? _column;
  final FAbstractItemModel? _model;
  final FModelIndex? _parent;

  int? get row => _row;
  int? get column => _column;
  FAbstractItemModel? get model => _model;
  FModelIndex? get parent => _parent;

  bool isValid() {
    if (_row == null || _column == null || _model == null) return false;
    if (_row! < 0 || _column! < 0) return false;

    if (row! > _model!.rowCount() || _column! > _model!.columnCount()) {
      return false;
    }
    return true;
  }

  FModelIndex? sibling(int row, int column) {
    FModelIndex index = FModelIndex(row, column, _model);

    if (!index.isValid()) return null;

    return index;
  }

  FModelIndex? siblingAtRow(int row) {
    FModelIndex index = FModelIndex(row, _column, _model);

    if (!index.isValid()) return null;

    return index;
  }

  FModelIndex? siblingAtColumn(int column) {
    FModelIndex index = FModelIndex(_row, column, _model);

    if (!index.isValid()) return null;

    return index;
  }

  dynamic data() {
    return model?.data(this);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is FModelIndex &&
        other.row == _row &&
        other.column == _column &&
        other.model == _model &&
        other.parent == _parent;
  }

  @override
  int get hashCode {
    return _row.hashCode ^
        _column.hashCode ^
        _model.hashCode ^
        _parent.hashCode;
  }
}
