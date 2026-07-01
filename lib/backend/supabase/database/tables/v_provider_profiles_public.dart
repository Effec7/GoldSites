import '../database.dart';

class VProviderProfilesPublicTable
    extends SupabaseTable<VProviderProfilesPublicRow> {
  @override
  String get tableName => 'v_provider_profiles_public';

  @override
  VProviderProfilesPublicRow createRow(Map<String, dynamic> data) =>
      VProviderProfilesPublicRow(data);
}

class VProviderProfilesPublicRow extends SupabaseDataRow {
  VProviderProfilesPublicRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => VProviderProfilesPublicTable();

  String? get providerProfileId => getField<String>('provider_profile_id');
  set providerProfileId(String? value) =>
      setField<String>('provider_profile_id', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String? get categoryId => getField<String>('category_id');
  set categoryId(String? value) => setField<String>('category_id', value);

  String? get categoryName => getField<String>('category_name');
  set categoryName(String? value) => setField<String>('category_name', value);

  String? get businessName => getField<String>('business_name');
  set businessName(String? value) => setField<String>('business_name', value);

  String? get slug => getField<String>('slug');
  set slug(String? value) => setField<String>('slug', value);

  String? get tagline => getField<String>('tagline');
  set tagline(String? value) => setField<String>('tagline', value);

  String? get shortBio => getField<String>('short_bio');
  set shortBio(String? value) => setField<String>('short_bio', value);

  String? get longBio => getField<String>('long_bio');
  set longBio(String? value) => setField<String>('long_bio', value);

  String? get businessPhone => getField<String>('business_phone');
  set businessPhone(String? value) => setField<String>('business_phone', value);

  String? get businessEmail => getField<String>('business_email');
  set businessEmail(String? value) => setField<String>('business_email', value);

  String? get websiteUrl => getField<String>('website_url');
  set websiteUrl(String? value) => setField<String>('website_url', value);

  String? get addressLine => getField<String>('address_line');
  set addressLine(String? value) => setField<String>('address_line', value);

  String? get city => getField<String>('city');
  set city(String? value) => setField<String>('city', value);

  String? get region => getField<String>('region');
  set region(String? value) => setField<String>('region', value);

  String? get postalCode => getField<String>('postal_code');
  set postalCode(String? value) => setField<String>('postal_code', value);

  String? get countryCode => getField<String>('country_code');
  set countryCode(String? value) => setField<String>('country_code', value);

  String? get logoUrl => getField<String>('logo_url');
  set logoUrl(String? value) => setField<String>('logo_url', value);

  String? get coverImageUrl => getField<String>('cover_image_url');
  set coverImageUrl(String? value) =>
      setField<String>('cover_image_url', value);

  List<String> get galleryUrls => getListField<String>('gallery_urls');
  set galleryUrls(List<String>? value) =>
      setListField<String>('gallery_urls', value);

  bool? get isVerified => getField<bool>('is_verified');
  set isVerified(bool? value) => setField<bool>('is_verified', value);

  bool? get isPremiumMember => getField<bool>('is_premium_member');
  set isPremiumMember(bool? value) =>
      setField<bool>('is_premium_member', value);

  double? get averageRating => getField<double>('average_rating');
  set averageRating(double? value) => setField<double>('average_rating', value);

  int? get reviewCount => getField<int>('review_count');
  set reviewCount(int? value) => setField<int>('review_count', value);

  int? get completedJobs => getField<int>('completed_jobs');
  set completedJobs(int? value) => setField<int>('completed_jobs', value);

  int? get responseCount => getField<int>('response_count');
  set responseCount(int? value) => setField<int>('response_count', value);

  double? get totalEarnings => getField<double>('total_earnings');
  set totalEarnings(double? value) => setField<double>('total_earnings', value);

  String? get currencyCode => getField<String>('currency_code');
  set currencyCode(String? value) => setField<String>('currency_code', value);

  bool? get isActive => getField<bool>('is_active');
  set isActive(bool? value) => setField<bool>('is_active', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);
}
