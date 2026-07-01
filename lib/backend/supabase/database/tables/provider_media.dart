import '../database.dart';

class ProviderMediaTable extends SupabaseTable<ProviderMediaRow> {
  @override
  String get tableName => 'provider_media';

  @override
  ProviderMediaRow createRow(Map<String, dynamic> data) =>
      ProviderMediaRow(data);
}

class ProviderMediaRow extends SupabaseDataRow {
  ProviderMediaRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ProviderMediaTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  String get providerProfileId => getField<String>('provider_profile_id')!;
  set providerProfileId(String value) =>
      setField<String>('provider_profile_id', value);

  String? get mediaType => getField<String>('media_type');
  set mediaType(String? value) => setField<String>('media_type', value);

  String get url => getField<String>('url')!;
  set url(String value) => setField<String>('url', value);

  String? get altText => getField<String>('alt_text');
  set altText(String? value) => setField<String>('alt_text', value);

  int? get sortOrder => getField<int>('sort_order');
  set sortOrder(int? value) => setField<int>('sort_order', value);

  bool? get isCover => getField<bool>('is_cover');
  set isCover(bool? value) => setField<bool>('is_cover', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get providerServiceId => getField<String>('provider_service_id');
  set providerServiceId(String? value) =>
      setField<String>('provider_service_id', value);
}
