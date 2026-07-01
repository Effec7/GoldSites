import '../database.dart';

class FavouriteProviderProfilesTable
    extends SupabaseTable<FavouriteProviderProfilesRow> {
  @override
  String get tableName => 'favourite_provider_profiles';

  @override
  FavouriteProviderProfilesRow createRow(Map<String, dynamic> data) =>
      FavouriteProviderProfilesRow(data);
}

class FavouriteProviderProfilesRow extends SupabaseDataRow {
  FavouriteProviderProfilesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => FavouriteProviderProfilesTable();

  String? get favoriteId => getField<String>('favorite_id');
  set favoriteId(String? value) => setField<String>('favorite_id', value);

  String? get customerUserId => getField<String>('customer_user_id');
  set customerUserId(String? value) =>
      setField<String>('customer_user_id', value);

  String? get providerProfileId => getField<String>('provider_profile_id');
  set providerProfileId(String? value) =>
      setField<String>('provider_profile_id', value);

  DateTime? get favoriteCreatedAt => getField<DateTime>('favorite_created_at');
  set favoriteCreatedAt(DateTime? value) =>
      setField<DateTime>('favorite_created_at', value);

  String? get businessName => getField<String>('business_name');
  set businessName(String? value) => setField<String>('business_name', value);

  String? get shortBio => getField<String>('short_bio');
  set shortBio(String? value) => setField<String>('short_bio', value);

  String? get logoUrl => getField<String>('logo_url');
  set logoUrl(String? value) => setField<String>('logo_url', value);

  String? get coverImageUrl => getField<String>('cover_image_url');
  set coverImageUrl(String? value) =>
      setField<String>('cover_image_url', value);

  String? get city => getField<String>('city');
  set city(String? value) => setField<String>('city', value);

  String? get region => getField<String>('region');
  set region(String? value) => setField<String>('region', value);

  double? get rating => getField<double>('rating');
  set rating(double? value) => setField<double>('rating', value);

  int? get reviewCount => getField<int>('review_count');
  set reviewCount(int? value) => setField<int>('review_count', value);

  bool? get providerIsActive => getField<bool>('provider_is_active');
  set providerIsActive(bool? value) =>
      setField<bool>('provider_is_active', value);

  String? get serviceNames => getField<String>('service_names');
  set serviceNames(String? value) => setField<String>('service_names', value);

  int? get serviceCount => getField<int>('service_count');
  set serviceCount(int? value) => setField<int>('service_count', value);
}
