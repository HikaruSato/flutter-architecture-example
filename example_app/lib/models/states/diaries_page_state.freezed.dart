// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'diaries_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$DiariesPageStateTearOff {
  const _$DiariesPageStateTearOff();

  _EditingDiaryState call(
      {bool isLoading = false,
      AppException? exception,
      List<Diary> diaries = const []}) {
    return _EditingDiaryState(
      isLoading: isLoading,
      exception: exception,
      diaries: diaries,
    );
  }
}

/// @nodoc
const $DiariesPageState = _$DiariesPageStateTearOff();

/// @nodoc
mixin _$DiariesPageState {
  bool get isLoading => throw _privateConstructorUsedError;
  AppException? get exception => throw _privateConstructorUsedError;
  List<Diary> get diaries => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DiariesPageStateCopyWith<DiariesPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiariesPageStateCopyWith<$Res> {
  factory $DiariesPageStateCopyWith(
          DiariesPageState value, $Res Function(DiariesPageState) then) =
      _$DiariesPageStateCopyWithImpl<$Res>;
  $Res call({bool isLoading, AppException? exception, List<Diary> diaries});
}

/// @nodoc
class _$DiariesPageStateCopyWithImpl<$Res>
    implements $DiariesPageStateCopyWith<$Res> {
  _$DiariesPageStateCopyWithImpl(this._value, this._then);

  final DiariesPageState _value;
  // ignore: unused_field
  final $Res Function(DiariesPageState) _then;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? exception = freezed,
    Object? diaries = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      exception: exception == freezed
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as AppException?,
      diaries: diaries == freezed
          ? _value.diaries
          : diaries // ignore: cast_nullable_to_non_nullable
              as List<Diary>,
    ));
  }
}

/// @nodoc
abstract class _$EditingDiaryStateCopyWith<$Res>
    implements $DiariesPageStateCopyWith<$Res> {
  factory _$EditingDiaryStateCopyWith(
          _EditingDiaryState value, $Res Function(_EditingDiaryState) then) =
      __$EditingDiaryStateCopyWithImpl<$Res>;
  @override
  $Res call({bool isLoading, AppException? exception, List<Diary> diaries});
}

/// @nodoc
class __$EditingDiaryStateCopyWithImpl<$Res>
    extends _$DiariesPageStateCopyWithImpl<$Res>
    implements _$EditingDiaryStateCopyWith<$Res> {
  __$EditingDiaryStateCopyWithImpl(
      _EditingDiaryState _value, $Res Function(_EditingDiaryState) _then)
      : super(_value, (v) => _then(v as _EditingDiaryState));

  @override
  _EditingDiaryState get _value => super._value as _EditingDiaryState;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? exception = freezed,
    Object? diaries = freezed,
  }) {
    return _then(_EditingDiaryState(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      exception: exception == freezed
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as AppException?,
      diaries: diaries == freezed
          ? _value.diaries
          : diaries // ignore: cast_nullable_to_non_nullable
              as List<Diary>,
    ));
  }
}

/// @nodoc

class _$_EditingDiaryState extends _EditingDiaryState {
  _$_EditingDiaryState(
      {this.isLoading = false, this.exception, this.diaries = const []})
      : super._();

  @JsonKey(defaultValue: false)
  @override
  final bool isLoading;
  @override
  final AppException? exception;
  @JsonKey(defaultValue: const [])
  @override
  final List<Diary> diaries;

  @override
  String toString() {
    return 'DiariesPageState(isLoading: $isLoading, exception: $exception, diaries: $diaries)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _EditingDiaryState &&
            (identical(other.isLoading, isLoading) ||
                const DeepCollectionEquality()
                    .equals(other.isLoading, isLoading)) &&
            (identical(other.exception, exception) ||
                const DeepCollectionEquality()
                    .equals(other.exception, exception)) &&
            (identical(other.diaries, diaries) ||
                const DeepCollectionEquality().equals(other.diaries, diaries)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(isLoading) ^
      const DeepCollectionEquality().hash(exception) ^
      const DeepCollectionEquality().hash(diaries);

  @JsonKey(ignore: true)
  @override
  _$EditingDiaryStateCopyWith<_EditingDiaryState> get copyWith =>
      __$EditingDiaryStateCopyWithImpl<_EditingDiaryState>(this, _$identity);
}

abstract class _EditingDiaryState extends DiariesPageState {
  factory _EditingDiaryState(
      {bool isLoading,
      AppException? exception,
      List<Diary> diaries}) = _$_EditingDiaryState;
  _EditingDiaryState._() : super._();

  @override
  bool get isLoading => throw _privateConstructorUsedError;
  @override
  AppException? get exception => throw _privateConstructorUsedError;
  @override
  List<Diary> get diaries => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$EditingDiaryStateCopyWith<_EditingDiaryState> get copyWith =>
      throw _privateConstructorUsedError;
}
