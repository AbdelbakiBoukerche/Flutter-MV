import './f_abstract_item_model.dart';

class FModelIndex {
  FModelIndex([
    int? row,
    int? column,
    FAbstractItemModel? model,
    FModelIndex? parent,
  ])  : _row = row ?? -1,
        _column = column ?? -1,
        _model = model,
        _parent = parent;

  final int _row;
  final int _column;
  final FAbstractItemModel? _model;
  final FModelIndex? _parent;

  int get row => _row;
  int get column => _column;
  FAbstractItemModel? get model => _model;
  FModelIndex? get parent => _parent;

  bool isValid() {
    if (row < 0 || column < 0 || model == null) {
      return false;
    }
    return true;
  }

  FModelIndex sibling(int row, int column) {
    return FModelIndex(row, column, _model, _parent);
  }

  FModelIndex siblingAtRow(int row) {
    return FModelIndex(row, _column, _model, _parent);
  }

  FModelIndex siblingAtColumn(int column) {
    return FModelIndex(_row, column, _model, _parent);
  }

  dynamic data() {
    return _model?.data(this);
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
