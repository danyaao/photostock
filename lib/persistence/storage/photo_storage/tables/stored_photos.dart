import 'package:drift/drift.dart';

/// Table for photos.
class StoredPhotos extends Table {
  /// Photo's id.
  TextColumn get id => text()();

  /// Photo's id.
  TextColumn get url => text()();

  /// Photo's author's username.
  TextColumn get username => text()();

  /// Photo's count of likes.
  IntColumn get likesCount => integer()();

  /// Photo's color of shadow.
  TextColumn get shadowColor => text()();

  /// Photo's blur hash as Uint8list.
  BlobColumn get blurHash => blob()();

  /// Photo's note.
  TextColumn get note => text().nullable()();
}
