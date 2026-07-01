import '../database.dart';

class BookingsTable extends SupabaseTable<BookingsRow> {
  @override
  String get tableName => 'bookings';

  @override
  BookingsRow createRow(Map<String, dynamic> data) => BookingsRow(data);
}

class BookingsRow extends SupabaseDataRow {
  BookingsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => BookingsTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  String? get customerUserId => getField<String>('customer_user_id');
  set customerUserId(String? value) =>
      setField<String>('customer_user_id', value);

  String get providerProfileId => getField<String>('provider_profile_id')!;
  set providerProfileId(String value) =>
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

  String? get customerName => getField<String>('customer_name');
  set customerName(String? value) => setField<String>('customer_name', value);

  String? get customerEmail => getField<String>('customer_email');
  set customerEmail(String? value) => setField<String>('customer_email', value);

  String? get customerPhone => getField<String>('customer_phone');
  set customerPhone(String? value) => setField<String>('customer_phone', value);

  String? get serviceAddressLine => getField<String>('service_address_line');
  set serviceAddressLine(String? value) =>
      setField<String>('service_address_line', value);

  String? get serviceCity => getField<String>('service_city');
  set serviceCity(String? value) => setField<String>('service_city', value);

  String? get servicePostalCode => getField<String>('service_postal_code');
  set servicePostalCode(String? value) =>
      setField<String>('service_postal_code', value);

  String? get customerNote => getField<String>('customer_note');
  set customerNote(String? value) => setField<String>('customer_note', value);

  String? get providerNote => getField<String>('provider_note');
  set providerNote(String? value) => setField<String>('provider_note', value);

  double? get totalPrice => getField<double>('total_price');
  set totalPrice(double? value) => setField<double>('total_price', value);

  String? get currencyCode => getField<String>('currency_code');
  set currencyCode(String? value) => setField<String>('currency_code', value);

  String? get paymentStatus => getField<String>('payment_status');
  set paymentStatus(String? value) => setField<String>('payment_status', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  DateTime? get reviewRequestedAt => getField<DateTime>('review_requested_at');
  set reviewRequestedAt(DateTime? value) =>
      setField<DateTime>('review_requested_at', value);

  DateTime? get bookingStartAt => getField<DateTime>('booking_start_at');
  set bookingStartAt(DateTime? value) =>
      setField<DateTime>('booking_start_at', value);

  String? get bookingDateKey => getField<String>('booking_date_key');
  set bookingDateKey(String? value) =>
      setField<String>('booking_date_key', value);

  String? get bookingTimeLabel => getField<String>('booking_time_label');
  set bookingTimeLabel(String? value) =>
      setField<String>('booking_time_label', value);
}
