import '../database.dart';

class ProviderServiceGalleryTable
    extends SupabaseTable<ProviderServiceGalleryRow> {
  @override
  String get tableName => 'provider_service_gallery';

  @override
  ProviderServiceGalleryRow createRow(Map<String, dynamic> data) =>
      ProviderServiceGalleryRow(data);
}

class ProviderServiceGalleryRow extends SupabaseDataRow {
  ProviderServiceGalleryRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ProviderServiceGalleryTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  String get providerServiceId => getField<String>('provider_service_id')!;
  set providerServiceId(String value) =>
      setField<String>('provider_service_id', value);

  String get imageUrl => getField<String>('image_url')!;
  set imageUrl(String value) => setField<String>('image_url', value);

  int? get sortOrder => getField<int>('sort_order');
  set sortOrder(int? value) => setField<int>('sort_order', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);
}
