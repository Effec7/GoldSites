import '../database.dart';

class ProviderSearchCardsTable extends SupabaseTable<ProviderSearchCardsRow> {
  @override
  String get tableName => 'provider_search_cards';

  @override
  ProviderSearchCardsRow createRow(Map<String, dynamic> data) =>
      ProviderSearchCardsRow(data);
}

class ProviderSearchCardsRow extends SupabaseDataRow {
  ProviderSearchCardsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ProviderSearchCardsTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  String? get providerProfileId => getField<String>('provider_profile_id');
  set providerProfileId(String? value) =>
      setField<String>('provider_profile_id', value);

  String? get businessName => getField<String>('business_name');
  set businessName(String? value) => setField<String>('business_name', value);

  String? get shortBio => getField<String>('short_bio');
  set shortBio(String? value) => setField<String>('short_bio', value);

  String? get logoUrl => getField<String>('logo_url');
  set logoUrl(String? value) => setField<String>('logo_url', value);

  String? get coverImageUrl => getField<String>('cover_image_url');
  set coverImageUrl(String? value) =>
      setField<String>('cover_image_url', value);

  bool? get providerIsActive => getField<bool>('provider_is_active');
  set providerIsActive(bool? value) =>
      setField<bool>('provider_is_active', value);

  String? get serviceNames => getField<String>('service_names');
  set serviceNames(String? value) => setField<String>('service_names', value);

  int? get serviceCount => getField<int>('service_count');
  set serviceCount(int? value) => setField<int>('service_count', value);

  double? get rating => getField<double>('rating');
  set rating(double? value) => setField<double>('rating', value);

  int? get reviewCount => getField<int>('review_count');
  set reviewCount(int? value) => setField<int>('review_count', value);

  String? get searchText => getField<String>('search_text');
  set searchText(String? value) => setField<String>('search_text', value);

  String? get favoriteId => getField<String>('favorite_id');
  set favoriteId(String? value) => setField<String>('favorite_id', value);

  bool? get isFavorited => getField<bool>('is_favorited');
  set isFavorited(bool? value) => setField<bool>('is_favorited', value);
}
