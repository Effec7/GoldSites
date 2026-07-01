import '../database.dart';

class FavoriteProviderProfilesTable
    extends SupabaseTable<FavoriteProviderProfilesRow> {
  @override
  String get tableName => 'favorite_provider_profiles';

  @override
  FavoriteProviderProfilesRow createRow(Map<String, dynamic> data) =>
      FavoriteProviderProfilesRow(data);
}

class FavoriteProviderProfilesRow extends SupabaseDataRow {
  FavoriteProviderProfilesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => FavoriteProviderProfilesTable();

  String? get favoriteId => getField<String>('favorite_id');
  set favoriteId(String? value) => setField<String>('favorite_id', value);

  String? get customerUserId => getField<String>('customer_user_id');
  set customerUserId(String? value) =>
      setField<String>('customer_user_id', value);

  String? get providerProfileId => getField<String>('provider_profile_id');
  set providerProfileId(String? value) =>
      setField<String>('provider_profile_id', value);

  DateTime? get favoritedAt => getField<DateTime>('favorited_at');
  set favoritedAt(DateTime? value) => setField<DateTime>('favorited_at', value);

  String? get businessName => getField<String>('business_name');
  set businessName(String? value) => setField<String>('business_name', value);

  String? get shortBio => getField<String>('short_bio');
  set shortBio(String? value) => setField<String>('short_bio', value);

  String? get city => getField<String>('city');
  set city(String? value) => setField<String>('city', value);

  String? get coverImageUrl => getField<String>('cover_image_url');
  set coverImageUrl(String? value) =>
      setField<String>('cover_image_url', value);

  String? get logoUrl => getField<String>('logo_url');
  set logoUrl(String? value) => setField<String>('logo_url', value);

  double? get averageRating => getField<double>('average_rating');
  set averageRating(double? value) => setField<double>('average_rating', value);

  int? get reviewCount => getField<int>('review_count');
  set reviewCount(int? value) => setField<int>('review_count', value);

  bool? get isActive => getField<bool>('is_active');
  set isActive(bool? value) => setField<bool>('is_active', value);
}
