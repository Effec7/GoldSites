import '../database.dart';

class ProviderServicesTable extends SupabaseTable<ProviderServicesRow> {
  @override
  String get tableName => 'provider_services';

  @override
  ProviderServicesRow createRow(Map<String, dynamic> data) =>
      ProviderServicesRow(data);
}

class ProviderServicesRow extends SupabaseDataRow {
  ProviderServicesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ProviderServicesTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  String get providerProfileId => getField<String>('provider_profile_id')!;
  set providerProfileId(String value) =>
      setField<String>('provider_profile_id', value);

  String? get categoryId => getField<String>('category_id');
  set categoryId(String? value) => setField<String>('category_id', value);

  String? get subcategoryId => getField<String>('subcategory_id');
  set subcategoryId(String? value) => setField<String>('subcategory_id', value);

  String get serviceName => getField<String>('service_name')!;
  set serviceName(String value) => setField<String>('service_name', value);

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

  String? get mainImageUrl => getField<String>('main_image_url');
  set mainImageUrl(String? value) => setField<String>('main_image_url', value);

  List<String> get galleryUrls => getListField<String>('gallery_urls');
  set galleryUrls(List<String>? value) =>
      setListField<String>('gallery_urls', value);

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
