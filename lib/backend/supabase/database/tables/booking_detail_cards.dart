import '../database.dart';

class BookingDetailCardsTable extends SupabaseTable<BookingDetailCardsRow> {
  @override
  String get tableName => 'booking_detail_cards';

  @override
  BookingDetailCardsRow createRow(Map<String, dynamic> data) =>
      BookingDetailCardsRow(data);
}

class BookingDetailCardsRow extends SupabaseDataRow {
  BookingDetailCardsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => BookingDetailCardsTable();

  String? get bookingId => getField<String>('booking_id');
  set bookingId(String? value) => setField<String>('booking_id', value);

  String? get customerUserId => getField<String>('customer_user_id');
  set customerUserId(String? value) =>
      setField<String>('customer_user_id', value);

  String? get providerProfileId => getField<String>('provider_profile_id');
  set providerProfileId(String? value) =>
      setField<String>('provider_profile_id', value);

  String? get providerServiceId => getField<String>('provider_service_id');
  set providerServiceId(String? value) =>
      setField<String>('provider_service_id', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  DateTime? get bookingDate => getField<DateTime>('booking_date');
  set bookingDate(DateTime? value) => setField<DateTime>('booking_date', value);

  PostgresTime? get bookingTime => getField<PostgresTime>('booking_time');
  set bookingTime(PostgresTime? value) =>
      setField<PostgresTime>('booking_time', value);

  int? get durationMinutes => getField<int>('duration_minutes');
  set durationMinutes(int? value) => setField<int>('duration_minutes', value);

  double? get totalPrice => getField<double>('total_price');
  set totalPrice(double? value) => setField<double>('total_price', value);

  String? get currencyCode => getField<String>('currency_code');
  set currencyCode(String? value) => setField<String>('currency_code', value);

  String? get paymentStatus => getField<String>('payment_status');
  set paymentStatus(String? value) => setField<String>('payment_status', value);

  String? get customerNote => getField<String>('customer_note');
  set customerNote(String? value) => setField<String>('customer_note', value);

  String? get serviceName => getField<String>('service_name');
  set serviceName(String? value) => setField<String>('service_name', value);

  String? get serviceDescription => getField<String>('service_description');
  set serviceDescription(String? value) =>
      setField<String>('service_description', value);

  String? get serviceImageUrl => getField<String>('service_image_url');
  set serviceImageUrl(String? value) =>
      setField<String>('service_image_url', value);

  double? get servicePrice => getField<double>('service_price');
  set servicePrice(double? value) => setField<double>('service_price', value);

  String? get businessName => getField<String>('business_name');
  set businessName(String? value) => setField<String>('business_name', value);

  String? get providerSlug => getField<String>('provider_slug');
  set providerSlug(String? value) => setField<String>('provider_slug', value);

  String? get businessPhone => getField<String>('business_phone');
  set businessPhone(String? value) => setField<String>('business_phone', value);

  String? get businessEmail => getField<String>('business_email');
  set businessEmail(String? value) => setField<String>('business_email', value);

  String? get phoneBusiness => getField<String>('phone_business');
  set phoneBusiness(String? value) => setField<String>('phone_business', value);

  String? get emailBusiness => getField<String>('email_business');
  set emailBusiness(String? value) => setField<String>('email_business', value);

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

  String? get fullAddress => getField<String>('full_address');
  set fullAddress(String? value) => setField<String>('full_address', value);

  String? get logoUrl => getField<String>('logo_url');
  set logoUrl(String? value) => setField<String>('logo_url', value);

  String? get coverImageUrl => getField<String>('cover_image_url');
  set coverImageUrl(String? value) =>
      setField<String>('cover_image_url', value);

  double? get providerAverageRating =>
      getField<double>('provider_average_rating');
  set providerAverageRating(double? value) =>
      setField<double>('provider_average_rating', value);

  int? get providerReviewCount => getField<int>('provider_review_count');
  set providerReviewCount(int? value) =>
      setField<int>('provider_review_count', value);

  String? get categoryName => getField<String>('category_name');
  set categoryName(String? value) => setField<String>('category_name', value);

  String? get subcategoryName => getField<String>('subcategory_name');
  set subcategoryName(String? value) =>
      setField<String>('subcategory_name', value);

  String? get cardImageUrl => getField<String>('card_image_url');
  set cardImageUrl(String? value) => setField<String>('card_image_url', value);
}
