import '../database.dart';

class BookingAvailableSlotsVTable
    extends SupabaseTable<BookingAvailableSlotsVRow> {
  @override
  String get tableName => 'booking_available_slots_v';

  @override
  BookingAvailableSlotsVRow createRow(Map<String, dynamic> data) =>
      BookingAvailableSlotsVRow(data);
}

class BookingAvailableSlotsVRow extends SupabaseDataRow {
  BookingAvailableSlotsVRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => BookingAvailableSlotsVTable();

  String? get providerProfileId => getField<String>('provider_profile_id');
  set providerProfileId(String? value) =>
      setField<String>('provider_profile_id', value);

  String? get providerServiceId => getField<String>('provider_service_id');
  set providerServiceId(String? value) =>
      setField<String>('provider_service_id', value);

  String? get serviceName => getField<String>('service_name');
  set serviceName(String? value) => setField<String>('service_name', value);

  int? get durationMinutes => getField<int>('duration_minutes');
  set durationMinutes(int? value) => setField<int>('duration_minutes', value);

  double? get price => getField<double>('price');
  set price(double? value) => setField<double>('price', value);

  String? get currencyCode => getField<String>('currency_code');
  set currencyCode(String? value) => setField<String>('currency_code', value);

  DateTime? get slotDate => getField<DateTime>('slot_date');
  set slotDate(DateTime? value) => setField<DateTime>('slot_date', value);

  String? get dateKey => getField<String>('date_key');
  set dateKey(String? value) => setField<String>('date_key', value);

  String? get dateLabel => getField<String>('date_label');
  set dateLabel(String? value) => setField<String>('date_label', value);

  String? get weekdayLabel => getField<String>('weekday_label');
  set weekdayLabel(String? value) => setField<String>('weekday_label', value);

  int? get dayNumber => getField<int>('day_number');
  set dayNumber(int? value) => setField<int>('day_number', value);

  int? get monthNumber => getField<int>('month_number');
  set monthNumber(int? value) => setField<int>('month_number', value);

  String? get dayNameSk => getField<String>('day_name_sk');
  set dayNameSk(String? value) => setField<String>('day_name_sk', value);

  PostgresTime? get slotTime => getField<PostgresTime>('slot_time');
  set slotTime(PostgresTime? value) =>
      setField<PostgresTime>('slot_time', value);

  String? get timeLabel => getField<String>('time_label');
  set timeLabel(String? value) => setField<String>('time_label', value);

  String? get periodKey => getField<String>('period_key');
  set periodKey(String? value) => setField<String>('period_key', value);

  String? get periodLabel => getField<String>('period_label');
  set periodLabel(String? value) => setField<String>('period_label', value);

  int? get availableSlotsCount => getField<int>('available_slots_count');
  set availableSlotsCount(int? value) =>
      setField<int>('available_slots_count', value);

  DateTime? get slotStartAt => getField<DateTime>('slot_start_at');
  set slotStartAt(DateTime? value) =>
      setField<DateTime>('slot_start_at', value);
}
