import '../database.dart';

class ProviderAvailabilityTable extends SupabaseTable<ProviderAvailabilityRow> {
  @override
  String get tableName => 'provider_availability';

  @override
  ProviderAvailabilityRow createRow(Map<String, dynamic> data) =>
      ProviderAvailabilityRow(data);
}

class ProviderAvailabilityRow extends SupabaseDataRow {
  ProviderAvailabilityRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ProviderAvailabilityTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  String get providerProfileId => getField<String>('provider_profile_id')!;
  set providerProfileId(String value) =>
      setField<String>('provider_profile_id', value);

  int get dayOfWeek => getField<int>('day_of_week')!;
  set dayOfWeek(int value) => setField<int>('day_of_week', value);

  bool? get isAvailable => getField<bool>('is_available');
  set isAvailable(bool? value) => setField<bool>('is_available', value);

  PostgresTime? get startTime => getField<PostgresTime>('start_time');
  set startTime(PostgresTime? value) =>
      setField<PostgresTime>('start_time', value);

  PostgresTime? get endTime => getField<PostgresTime>('end_time');
  set endTime(PostgresTime? value) => setField<PostgresTime>('end_time', value);

  PostgresTime? get breakStartTime =>
      getField<PostgresTime>('break_start_time');
  set breakStartTime(PostgresTime? value) =>
      setField<PostgresTime>('break_start_time', value);

  PostgresTime? get breakEndTime => getField<PostgresTime>('break_end_time');
  set breakEndTime(PostgresTime? value) =>
      setField<PostgresTime>('break_end_time', value);

  int? get slotMinutes => getField<int>('slot_minutes');
  set slotMinutes(int? value) => setField<int>('slot_minutes', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  String? get dayNameSk => getField<String>('day_name_sk');
  set dayNameSk(String? value) => setField<String>('day_name_sk', value);
}
