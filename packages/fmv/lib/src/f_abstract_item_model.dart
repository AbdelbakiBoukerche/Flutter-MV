import './f_model_index.dart';

enum FOrientation { horizontal, vertical }

abstract class FAbstractItemModel {
  int rowCount() => 0;
  int columnCount() => 0;

  bool checkIndex(FModelIndex index) {
    if (index.isValid() && index.model == this) {
      return true;
    }
    return false;
  }

  FModelIndex? createIndex(int row, int column, {FModelIndex? parent}) {
    FModelIndex index = FModelIndex(row, column, this, parent);
    if (!index.isValid()) return null;

    return index;
  }

  dynamic headerData(
    int column, {
    FOrientation orientation = FOrientation.horizontal,
  }) =>
      null;

  dynamic data(FModelIndex index) => null;
}
