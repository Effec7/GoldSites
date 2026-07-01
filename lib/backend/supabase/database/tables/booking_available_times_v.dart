import '../database.dart';

class BookingAvailableTimesVTable
    extends SupabaseTable<BookingAvailableTimesVRow> {
  @override
  String get tableName => 'booking_available_times_v';

  @override
  BookingAvailableTimesVRow createRow(Map<String, dynamic> data) =>
      BookingAvailableTimesVRow(data);
}

class BookingAvailableTimesVRow extends SupabaseDataRow {
  BookingAvailableTimesVRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => BookingAvailableTimesVTable();

  String? get providerProfileId => getField<String>('provider_profile_id');
  set providerProfileId(String? value) =>
      setField<String>('provider_profile_id', value);

  String? get providerServiceId => getField<String>('provider_service_id');
  set providerServiceId(String? value) =>
      setField<String>('provider_service_id', value);

  DateTime? get slotDate => getField<DateTime>('slot_date');
  set slotDate(DateTime? value) => setField<DateTime>('slot_date', value);

  String? get dateKey => getField<String>('date_key');
  set dateKey(String? value) => setField<String>('date_key', value);

  PostgresTime? get slotTime => getField<PostgresTime>('slot_time');
  set slotTime(PostgresTime? value) =>
      setField<PostgresTime>('slot_time', value);

  String? get timeLabel => getField<String>('time_label');
  set timeLabel(String? value) => setField<String>('time_label', value);

  String? get periodKey => getField<String>('period_key');
  set periodKey(String? value) => setField<String>('period_key', value);

  String? get periodLabel => getField<String>('period_label');
  set periodLabel(String? value) => setField<String>('period_label', value);

  int? get durationMinutes => getField<int>('duration_minutes');
  set durationMinutes(int? value) => setField<int>('duration_minutes', value);

  double? get price => getField<double>('price');
  set price(double? value) => setField<double>('price', value);

  String? get currencyCode => getField<String>('currency_code');
  set currencyCode(String? value) => setField<String>('currency_code', value);

  DateTime? get slotStartAt => getField<DateTime>('slot_start_at');
  set slotStartAt(DateTime? value) =>
      setField<DateTime>('slot_start_at', value);
}
