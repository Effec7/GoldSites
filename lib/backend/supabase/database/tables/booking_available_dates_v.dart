import '../database.dart';

class BookingAvailableDatesVTable
    extends SupabaseTable<BookingAvailableDatesVRow> {
  @override
  String get tableName => 'booking_available_dates_v';

  @override
  BookingAvailableDatesVRow createRow(Map<String, dynamic> data) =>
      BookingAvailableDatesVRow(data);
}

class BookingAvailableDatesVRow extends SupabaseDataRow {
  BookingAvailableDatesVRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => BookingAvailableDatesVTable();

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

  int? get availableSlotsCount => getField<int>('available_slots_count');
  set availableSlotsCount(int? value) =>
      setField<int>('available_slots_count', value);

  DateTime? get firstSlotStartAt => getField<DateTime>('first_slot_start_at');
  set firstSlotStartAt(DateTime? value) =>
      setField<DateTime>('first_slot_start_at', value);
}
