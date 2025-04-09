// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'street_noshery_rating_review.dart';

class StreetNosheryShopRatingMapper
    extends ClassMapperBase<StreetNosheryShopRating> {
  StreetNosheryShopRatingMapper._();

  static StreetNosheryShopRatingMapper? _instance;
  static StreetNosheryShopRatingMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = StreetNosheryShopRatingMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'StreetNosheryShopRating';

  static int? _$shopId(StreetNosheryShopRating v) => v.shopId;
  static const Field<StreetNosheryShopRating, int> _f$shopId =
      Field('shopId', _$shopId, opt: true);
  static int? _$totalRating(StreetNosheryShopRating v) => v.totalRating;
  static const Field<StreetNosheryShopRating, int> _f$totalRating =
      Field('totalRating', _$totalRating, opt: true);
  static int? _$ratingCount(StreetNosheryShopRating v) => v.ratingCount;
  static const Field<StreetNosheryShopRating, int> _f$ratingCount =
      Field('ratingCount', _$ratingCount, opt: true);
  static double? _$averageRating(StreetNosheryShopRating v) => v.averageRating;
  static const Field<StreetNosheryShopRating, double> _f$averageRating =
      Field('averageRating', _$averageRating, opt: true);

  @override
  final MappableFields<StreetNosheryShopRating> fields = const {
    #shopId: _f$shopId,
    #totalRating: _f$totalRating,
    #ratingCount: _f$ratingCount,
    #averageRating: _f$averageRating,
  };

  static StreetNosheryShopRating _instantiate(DecodingData data) {
    return StreetNosheryShopRating(
        shopId: data.dec(_f$shopId),
        totalRating: data.dec(_f$totalRating),
        ratingCount: data.dec(_f$ratingCount),
        averageRating: data.dec(_f$averageRating));
  }

  @override
  final Function instantiate = _instantiate;

  static StreetNosheryShopRating fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<StreetNosheryShopRating>(map);
  }

  static StreetNosheryShopRating fromJson(String json) {
    return ensureInitialized().decodeJson<StreetNosheryShopRating>(json);
  }
}

mixin StreetNosheryShopRatingMappable {
  String toJson() {
    return StreetNosheryShopRatingMapper.ensureInitialized()
        .encodeJson<StreetNosheryShopRating>(this as StreetNosheryShopRating);
  }

  Map<String, dynamic> toMap() {
    return StreetNosheryShopRatingMapper.ensureInitialized()
        .encodeMap<StreetNosheryShopRating>(this as StreetNosheryShopRating);
  }

  StreetNosheryShopRatingCopyWith<StreetNosheryShopRating,
          StreetNosheryShopRating, StreetNosheryShopRating>
      get copyWith => _StreetNosheryShopRatingCopyWithImpl(
          this as StreetNosheryShopRating, $identity, $identity);
  @override
  String toString() {
    return StreetNosheryShopRatingMapper.ensureInitialized()
        .stringifyValue(this as StreetNosheryShopRating);
  }

  @override
  bool operator ==(Object other) {
    return StreetNosheryShopRatingMapper.ensureInitialized()
        .equalsValue(this as StreetNosheryShopRating, other);
  }

  @override
  int get hashCode {
    return StreetNosheryShopRatingMapper.ensureInitialized()
        .hashValue(this as StreetNosheryShopRating);
  }
}

extension StreetNosheryShopRatingValueCopy<$R, $Out>
    on ObjectCopyWith<$R, StreetNosheryShopRating, $Out> {
  StreetNosheryShopRatingCopyWith<$R, StreetNosheryShopRating, $Out>
      get $asStreetNosheryShopRating => $base
          .as((v, t, t2) => _StreetNosheryShopRatingCopyWithImpl(v, t, t2));
}

abstract class StreetNosheryShopRatingCopyWith<
    $R,
    $In extends StreetNosheryShopRating,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {int? shopId, int? totalRating, int? ratingCount, double? averageRating});
  StreetNosheryShopRatingCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _StreetNosheryShopRatingCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, StreetNosheryShopRating, $Out>
    implements
        StreetNosheryShopRatingCopyWith<$R, StreetNosheryShopRating, $Out> {
  _StreetNosheryShopRatingCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<StreetNosheryShopRating> $mapper =
      StreetNosheryShopRatingMapper.ensureInitialized();
  @override
  $R call(
          {Object? shopId = $none,
          Object? totalRating = $none,
          Object? ratingCount = $none,
          Object? averageRating = $none}) =>
      $apply(FieldCopyWithData({
        if (shopId != $none) #shopId: shopId,
        if (totalRating != $none) #totalRating: totalRating,
        if (ratingCount != $none) #ratingCount: ratingCount,
        if (averageRating != $none) #averageRating: averageRating
      }));
  @override
  StreetNosheryShopRating $make(CopyWithData data) => StreetNosheryShopRating(
      shopId: data.get(#shopId, or: $value.shopId),
      totalRating: data.get(#totalRating, or: $value.totalRating),
      ratingCount: data.get(#ratingCount, or: $value.ratingCount),
      averageRating: data.get(#averageRating, or: $value.averageRating));

  @override
  StreetNosheryShopRatingCopyWith<$R2, StreetNosheryShopRating, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _StreetNosheryShopRatingCopyWithImpl($value, $cast, t);
}
