import 'f_abstract_item_model.dart';
import 'f_abstract_item_view.dart';

/// FModelIndex is used to reference data items stored in a model of type [FAbstractItemModel].
/// The index is used by the [FAbstractItemView] to locate a single item in the model.
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

  /// Returns the row refered to by this index.
  int get row => _row;

  /// Returns the column refered to by this index.
  int get column => _column;

  /// Returns the model used by the this index.
  FAbstractItemModel? get model => _model;

  /// Returns the parent of this index.
  FModelIndex? get parent => _parent;

  /// Returns `true` if index is valid otherwiser returns `false`.
  ///
  /// A [FModelIndex] is valid if
  /// Both [row] and [column] are greater or equal to 0, and [model] is not null.
  bool isValid() {
    if (row < 0 || column < 0 || model == null) {
      return false;
    }
    return true;
  }

  /// Returns a new [FModelIndex] at the given [row] and [column].
  FModelIndex sibling(int row, int column) {
    return FModelIndex(row, column, _model, _parent);
  }

  /// Returns a new [FModelIndex] at the given [row].
  FModelIndex siblingAtRow(int row) {
    return FModelIndex(row, _column, _model, _parent);
  }

  /// Returns a new [FModelIndex] at the given [column].
  FModelIndex siblingAtColumn(int column) {
    return FModelIndex(_row, column, _model, _parent);
  }

  /// Retruns the data for the item refered to by `this` index.
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
