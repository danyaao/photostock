// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'photo_ui.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PhotoUI {
  String get id => throw _privateConstructorUsedError;
  bool get isFavorite => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  int get likesCount => throw _privateConstructorUsedError;
  Color get shadowColor => throw _privateConstructorUsedError;
  Uint8List get blurHash => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PhotoUICopyWith<PhotoUI> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhotoUICopyWith<$Res> {
  factory $PhotoUICopyWith(PhotoUI value, $Res Function(PhotoUI) then) =
      _$PhotoUICopyWithImpl<$Res, PhotoUI>;
  @useResult
  $Res call(
      {String id,
      bool isFavorite,
      String url,
      String username,
      int likesCount,
      Color shadowColor,
      Uint8List blurHash,
      String? note});
}

/// @nodoc
class _$PhotoUICopyWithImpl<$Res, $Val extends PhotoUI>
    implements $PhotoUICopyWith<$Res> {
  _$PhotoUICopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? isFavorite = null,
    Object? url = null,
    Object? username = null,
    Object? likesCount = null,
    Object? shadowColor = null,
    Object? blurHash = null,
    Object? note = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      isFavorite: null == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      likesCount: null == likesCount
          ? _value.likesCount
          : likesCount // ignore: cast_nullable_to_non_nullable
              as int,
      shadowColor: null == shadowColor
          ? _value.shadowColor
          : shadowColor // ignore: cast_nullable_to_non_nullable
              as Color,
      blurHash: null == blurHash
          ? _value.blurHash
          : blurHash // ignore: cast_nullable_to_non_nullable
              as Uint8List,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PhotoUIImplCopyWith<$Res> implements $PhotoUICopyWith<$Res> {
  factory _$$PhotoUIImplCopyWith(
          _$PhotoUIImpl value, $Res Function(_$PhotoUIImpl) then) =
      __$$PhotoUIImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      bool isFavorite,
      String url,
      String username,
      int likesCount,
      Color shadowColor,
      Uint8List blurHash,
      String? note});
}

/// @nodoc
class __$$PhotoUIImplCopyWithImpl<$Res>
    extends _$PhotoUICopyWithImpl<$Res, _$PhotoUIImpl>
    implements _$$PhotoUIImplCopyWith<$Res> {
  __$$PhotoUIImplCopyWithImpl(
      _$PhotoUIImpl _value, $Res Function(_$PhotoUIImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? isFavorite = null,
    Object? url = null,
    Object? username = null,
    Object? likesCount = null,
    Object? shadowColor = null,
    Object? blurHash = null,
    Object? note = freezed,
  }) {
    return _then(_$PhotoUIImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      isFavorite: null == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      likesCount: null == likesCount
          ? _value.likesCount
          : likesCount // ignore: cast_nullable_to_non_nullable
              as int,
      shadowColor: null == shadowColor
          ? _value.shadowColor
          : shadowColor // ignore: cast_nullable_to_non_nullable
              as Color,
      blurHash: null == blurHash
          ? _value.blurHash
          : blurHash // ignore: cast_nullable_to_non_nullable
              as Uint8List,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$PhotoUIImpl with DiagnosticableTreeMixin implements _PhotoUI {
  const _$PhotoUIImpl(
      {required this.id,
      required this.isFavorite,
      required this.url,
      required this.username,
      required this.likesCount,
      required this.shadowColor,
      required this.blurHash,
      this.note});

  @override
  final String id;
  @override
  final bool isFavorite;
  @override
  final String url;
  @override
  final String username;
  @override
  final int likesCount;
  @override
  final Color shadowColor;
  @override
  final Uint8List blurHash;
  @override
  final String? note;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PhotoUI(id: $id, isFavorite: $isFavorite, url: $url, username: $username, likesCount: $likesCount, shadowColor: $shadowColor, blurHash: $blurHash, note: $note)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PhotoUI'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('isFavorite', isFavorite))
      ..add(DiagnosticsProperty('url', url))
      ..add(DiagnosticsProperty('username', username))
      ..add(DiagnosticsProperty('likesCount', likesCount))
      ..add(DiagnosticsProperty('shadowColor', shadowColor))
      ..add(DiagnosticsProperty('blurHash', blurHash))
      ..add(DiagnosticsProperty('note', note));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PhotoUIImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isFavorite, isFavorite) ||
                other.isFavorite == isFavorite) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.likesCount, likesCount) ||
                other.likesCount == likesCount) &&
            (identical(other.shadowColor, shadowColor) ||
                other.shadowColor == shadowColor) &&
            const DeepCollectionEquality().equals(other.blurHash, blurHash) &&
            (identical(other.note, note) || other.note == note));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      isFavorite,
      url,
      username,
      likesCount,
      shadowColor,
      const DeepCollectionEquality().hash(blurHash),
      note);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PhotoUIImplCopyWith<_$PhotoUIImpl> get copyWith =>
      __$$PhotoUIImplCopyWithImpl<_$PhotoUIImpl>(this, _$identity);
}

abstract class _PhotoUI implements PhotoUI {
  const factory _PhotoUI(
      {required final String id,
      required final bool isFavorite,
      required final String url,
      required final String username,
      required final int likesCount,
      required final Color shadowColor,
      required final Uint8List blurHash,
      final String? note}) = _$PhotoUIImpl;

  @override
  String get id;
  @override
  bool get isFavorite;
  @override
  String get url;
  @override
  String get username;
  @override
  int get likesCount;
  @override
  Color get shadowColor;
  @override
  Uint8List get blurHash;
  @override
  String? get note;
  @override
  @JsonKey(ignore: true)
  _$$PhotoUIImplCopyWith<_$PhotoUIImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
