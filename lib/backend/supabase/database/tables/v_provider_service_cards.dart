import '../database.dart';

class VProviderServiceCardsTable
    extends SupabaseTable<VProviderServiceCardsRow> {
  @override
  String get tableName => 'v_provider_service_cards';

  @override
  VProviderServiceCardsRow createRow(Map<String, dynamic> data) =>
      VProviderServiceCardsRow(data);
}

class VProviderServiceCardsRow extends SupabaseDataRow {
  VProviderServiceCardsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => VProviderServiceCardsTable();

  String? get providerServiceId => getField<String>('provider_service_id');
  set providerServiceId(String? value) =>
      setField<String>('provider_service_id', value);

  String? get providerProfileId => getField<String>('provider_profile_id');
  set providerProfileId(String? value) =>
      setField<String>('provider_profile_id', value);

  String? get businessName => getField<String>('business_name');
  set businessName(String? value) => setField<String>('business_name', value);

  String? get providerSlug => getField<String>('provider_slug');
  set providerSlug(String? value) => setField<String>('provider_slug', value);

  String? get city => getField<String>('city');
  set city(String? value) => setField<String>('city', value);

  String? get region => getField<String>('region');
  set region(String? value) => setField<String>('region', value);

  String? get logoUrl => getField<String>('logo_url');
  set logoUrl(String? value) => setField<String>('logo_url', value);

  String? get coverImageUrl => getField<String>('cover_image_url');
  set coverImageUrl(String? value) =>
      setField<String>('cover_image_url', value);

  bool? get isVerified => getField<bool>('is_verified');
  set isVerified(bool? value) => setField<bool>('is_verified', value);

  bool? get isPremiumMember => getField<bool>('is_premium_member');
  set isPremiumMember(bool? value) =>
      setField<bool>('is_premium_member', value);

  double? get providerAverageRating =>
      getField<double>('provider_average_rating');
  set providerAverageRating(double? value) =>
      setField<double>('provider_average_rating', value);

  int? get providerReviewCount => getField<int>('provider_review_count');
  set providerReviewCount(int? value) =>
      setField<int>('provider_review_count', value);

  String? get categoryId => getField<String>('category_id');
  set categoryId(String? value) => setField<String>('category_id', value);

  String? get categoryName => getField<String>('category_name');
  set categoryName(String? value) => setField<String>('category_name', value);

  String? get subcategoryId => getField<String>('subcategory_id');
  set subcategoryId(String? value) => setField<String>('subcategory_id', value);

  String? get subcategoryName => getField<String>('subcategory_name');
  set subcategoryName(String? value) =>
      setField<String>('subcategory_name', value);

  String? get serviceName => getField<String>('service_name');
  set serviceName(String? value) => setField<String>('service_name', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  double? get price => getField<double>('price');
  set price(double? value) => setField<double>('price', value);

  String? get priceType => getField<String>('price_type');
  set priceType(String? value) => setField<String>('price_type', value);

  String? get priceUnit => getField<String>('price_unit');
  set priceUnit(String? value) => setField<String>('price_unit', value);

  String? get currencyCode => getField<String>('currency_code');
  set currencyCode(String? value) => setField<String>('currency_code', value);

  int? get durationMinutes => getField<int>('duration_minutes');
  set durationMinutes(int? value) => setField<int>('duration_minutes', value);

  String? get imageUrl => getField<String>('image_url');
  set imageUrl(String? value) => setField<String>('image_url', value);

  double? get averageRating => getField<double>('average_rating');
  set averageRating(double? value) => setField<double>('average_rating', value);

  int? get reviewCount => getField<int>('review_count');
  set reviewCount(int? value) => setField<int>('review_count', value);

  bool? get isFeatured => getField<bool>('is_featured');
  set isFeatured(bool? value) => setField<bool>('is_featured', value);

  bool? get isActive => getField<bool>('is_active');
  set isActive(bool? value) => setField<bool>('is_active', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);
}
