// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'company.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Company {
  String? get name;
  Director get director;

  /// Create a copy of Company
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CompanyCopyWith<Company> get copyWith =>
      _$CompanyCopyWithImpl<Company>(this as Company, _$identity);

  /// Serializes this Company to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Company &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.director, director) || other.director == director));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, director);

  @override
  String toString() {
    return 'Company(name: $name, director: $director)';
  }
}

/// @nodoc
abstract mixin class $CompanyCopyWith<$Res> {
  factory $CompanyCopyWith(Company value, $Res Function(Company) _then) = _$CompanyCopyWithImpl;
  @useResult
  $Res call({String? name, Director director});

  $DirectorCopyWith<$Res> get director;
}

/// @nodoc
class _$CompanyCopyWithImpl<$Res> implements $CompanyCopyWith<$Res> {
  _$CompanyCopyWithImpl(this._self, this._then);

  final Company _self;
  final $Res Function(Company) _then;

  /// Create a copy of Company
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? director = null,
  }) {
    return _then(_self.copyWith(
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      director: null == director
          ? _self.director
          : director // ignore: cast_nullable_to_non_nullable
              as Director,
    ));
  }

  /// Create a copy of Company
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DirectorCopyWith<$Res> get director {
    return $DirectorCopyWith<$Res>(_self.director, (value) {
      return _then(_self.copyWith(director: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _Company implements Company {
  _Company({this.name, required this.director});
  factory _Company.fromJson(Map<String, dynamic> json) => _$CompanyFromJson(json);

  @override
  final String? name;
  @override
  final Director director;

  /// Create a copy of Company
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CompanyCopyWith<_Company> get copyWith => __$CompanyCopyWithImpl<_Company>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CompanyToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Company &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.director, director) || other.director == director));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, director);

  @override
  String toString() {
    return 'Company(name: $name, director: $director)';
  }
}

/// @nodoc
abstract mixin class _$CompanyCopyWith<$Res> implements $CompanyCopyWith<$Res> {
  factory _$CompanyCopyWith(_Company value, $Res Function(_Company) _then) = __$CompanyCopyWithImpl;
  @override
  @useResult
  $Res call({String? name, Director director});

  @override
  $DirectorCopyWith<$Res> get director;
}

/// @nodoc
class __$CompanyCopyWithImpl<$Res> implements _$CompanyCopyWith<$Res> {
  __$CompanyCopyWithImpl(this._self, this._then);

  final _Company _self;
  final $Res Function(_Company) _then;

  /// Create a copy of Company
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = freezed,
    Object? director = null,
  }) {
    return _then(_Company(
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      director: null == director
          ? _self.director
          : director // ignore: cast_nullable_to_non_nullable
              as Director,
    ));
  }

  /// Create a copy of Company
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DirectorCopyWith<$Res> get director {
    return $DirectorCopyWith<$Res>(_self.director, (value) {
      return _then(_self.copyWith(director: value));
    });
  }
}

// dart format on
