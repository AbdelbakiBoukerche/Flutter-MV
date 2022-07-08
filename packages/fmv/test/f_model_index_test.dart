import 'package:flutter_test/flutter_test.dart';
import 'package:fmv/fmv.dart';

void main() {
  group('FModelIndex initialization', () {
    test('Creates invalid Index', () {
      // Arrange
      late FModelIndex index;

      // Act
      index = FModelIndex();
      // Assert
      expect(index.isValid(), false);
    });
  });
}
