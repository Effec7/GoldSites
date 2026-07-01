import '../database.dart';

class BookingDetailVTable extends SupabaseTable<BookingDetailVRow> {
  @override
  String get tableName => 'booking_detail_v';

  @override
  BookingDetailVRow createRow(Map<String, dynamic> data) =>
      BookingDetailVRow(data);
}

class BookingDetailVRow extends SupabaseDataRow {
  BookingDetailVRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => BookingDetailVTable();

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

  String? get statusLabel => getField<String>('status_label');
  set statusLabel(String? value) => setField<String>('status_label', value);

  DateTime? get bookingDate => getField<DateTime>('booking_date');
  set bookingDate(DateTime? value) => setField<DateTime>('booking_date', value);

  PostgresTime? get bookingTime => getField<PostgresTime>('booking_time');
  set bookingTime(PostgresTime? value) =>
      setField<PostgresTime>('booking_time', value);

  DateTime? get bookingStartAt => getField<DateTime>('booking_start_at');
  set bookingStartAt(DateTime? value) =>
      setField<DateTime>('booking_start_at', value);

  String? get bookingDateKey => getField<String>('booking_date_key');
  set bookingDateKey(String? value) =>
      setField<String>('booking_date_key', value);

  String? get bookingTimeLabel => getField<String>('booking_time_label');
  set bookingTimeLabel(String? value) =>
      setField<String>('booking_time_label', value);

  String? get bookingTermLabel => getField<String>('booking_term_label');
  set bookingTermLabel(String? value) =>
      setField<String>('booking_term_label', value);

  int? get durationMinutes => getField<int>('duration_minutes');
  set durationMinutes(int? value) => setField<int>('duration_minutes', value);

  String? get durationLabel => getField<String>('duration_label');
  set durationLabel(String? value) => setField<String>('duration_label', value);

  double? get totalPrice => getField<double>('total_price');
  set totalPrice(double? value) => setField<double>('total_price', value);

  String? get currencyCode => getField<String>('currency_code');
  set currencyCode(String? value) => setField<String>('currency_code', value);

  String? get priceLabel => getField<String>('price_label');
  set priceLabel(String? value) => setField<String>('price_label', value);

  String? get paymentStatus => getField<String>('payment_status');
  set paymentStatus(String? value) => setField<String>('payment_status', value);

  String? get providerName => getField<String>('provider_name');
  set providerName(String? value) => setField<String>('provider_name', value);

  String? get categoryName => getField<String>('category_name');
  set categoryName(String? value) => setField<String>('category_name', value);

  String? get serviceName => getField<String>('service_name');
  set serviceName(String? value) => setField<String>('service_name', value);

  String? get heroImageUrl => getField<String>('hero_image_url');
  set heroImageUrl(String? value) => setField<String>('hero_image_url', value);

  String? get addressLine => getField<String>('address_line');
  set addressLine(String? value) => setField<String>('address_line', value);

  String? get city => getField<String>('city');
  set city(String? value) => setField<String>('city', value);

  String? get postalCode => getField<String>('postal_code');
  set postalCode(String? value) => setField<String>('postal_code', value);

  String? get fullAddress => getField<String>('full_address');
  set fullAddress(String? value) => setField<String>('full_address', value);

  String? get providerPhone => getField<String>('provider_phone');
  set providerPhone(String? value) => setField<String>('provider_phone', value);

  String? get customerEmail => getField<String>('customer_email');
  set customerEmail(String? value) => setField<String>('customer_email', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get googleCalendarUrl => getField<String>('google_calendar_url');
  set googleCalendarUrl(String? value) =>
      setField<String>('google_calendar_url', value);
}
