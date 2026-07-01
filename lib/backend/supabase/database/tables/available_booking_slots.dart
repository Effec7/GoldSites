import '../database.dart';

class AvailableBookingSlotsTable
    extends SupabaseTable<AvailableBookingSlotsRow> {
  @override
  String get tableName => 'available_booking_slots';

  @override
  AvailableBookingSlotsRow createRow(Map<String, dynamic> data) =>
      AvailableBookingSlotsRow(data);
}

class AvailableBookingSlotsRow extends SupabaseDataRow {
  AvailableBookingSlotsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AvailableBookingSlotsTable();

  String? get availabilityId => getField<String>('availability_id');
  set availabilityId(String? value) =>
      setField<String>('availability_id', value);

  String? get providerProfileId => getField<String>('provider_profile_id');
  set providerProfileId(String? value) =>
      setField<String>('provider_profile_id', value);

  DateTime? get slotDate => getField<DateTime>('slot_date');
  set slotDate(DateTime? value) => setField<DateTime>('slot_date', value);

  PostgresTime? get slotTime => getField<PostgresTime>('slot_time');
  set slotTime(PostgresTime? value) =>
      setField<PostgresTime>('slot_time', value);

  PostgresTime? get slotEndTime => getField<PostgresTime>('slot_end_time');
  set slotEndTime(PostgresTime? value) =>
      setField<PostgresTime>('slot_end_time', value);

  int? get slotMinutes => getField<int>('slot_minutes');
  set slotMinutes(int? value) => setField<int>('slot_minutes', value);
}
