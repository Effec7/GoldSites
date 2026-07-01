import '../database.dart';

class ReviewableBookingsTable extends SupabaseTable<ReviewableBookingsRow> {
  @override
  String get tableName => 'reviewable_bookings';

  @override
  ReviewableBookingsRow createRow(Map<String, dynamic> data) =>
      ReviewableBookingsRow(data);
}

class ReviewableBookingsRow extends SupabaseDataRow {
  ReviewableBookingsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ReviewableBookingsTable();

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

  String? get businessName => getField<String>('business_name');
  set businessName(String? value) => setField<String>('business_name', value);

  String? get serviceName => getField<String>('service_name');
  set serviceName(String? value) => setField<String>('service_name', value);

  int? get durationMinutes => getField<int>('duration_minutes');
  set durationMinutes(int? value) => setField<int>('duration_minutes', value);

  DateTime? get bookingStartAt => getField<DateTime>('booking_start_at');
  set bookingStartAt(DateTime? value) =>
      setField<DateTime>('booking_start_at', value);

  DateTime? get reviewAvailableAt => getField<DateTime>('review_available_at');
  set reviewAvailableAt(DateTime? value) =>
      setField<DateTime>('review_available_at', value);

  String? get bookingStatus => getField<String>('booking_status');
  set bookingStatus(String? value) => setField<String>('booking_status', value);

  DateTime? get bookingDate => getField<DateTime>('booking_date');
  set bookingDate(DateTime? value) => setField<DateTime>('booking_date', value);

  PostgresTime? get bookingTime => getField<PostgresTime>('booking_time');
  set bookingTime(PostgresTime? value) =>
      setField<PostgresTime>('booking_time', value);

  String? get cardImageUrl => getField<String>('card_image_url');
  set cardImageUrl(String? value) => setField<String>('card_image_url', value);

  String? get providerLogoUrl => getField<String>('provider_logo_url');
  set providerLogoUrl(String? value) =>
      setField<String>('provider_logo_url', value);

  String? get providerCoverImageUrl =>
      getField<String>('provider_cover_image_url');
  set providerCoverImageUrl(String? value) =>
      setField<String>('provider_cover_image_url', value);

  String? get serviceImageUrl => getField<String>('service_image_url');
  set serviceImageUrl(String? value) =>
      setField<String>('service_image_url', value);
}
