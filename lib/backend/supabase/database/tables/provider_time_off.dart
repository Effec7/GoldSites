import '../database.dart';

class ProviderTimeOffTable extends SupabaseTable<ProviderTimeOffRow> {
  @override
  String get tableName => 'provider_time_off';

  @override
  ProviderTimeOffRow createRow(Map<String, dynamic> data) =>
      ProviderTimeOffRow(data);
}

class ProviderTimeOffRow extends SupabaseDataRow {
  ProviderTimeOffRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ProviderTimeOffTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  String get providerProfileId => getField<String>('provider_profile_id')!;
  set providerProfileId(String value) =>
      setField<String>('provider_profile_id', value);

  DateTime get dateOff => getField<DateTime>('date_off')!;
  set dateOff(DateTime value) => setField<DateTime>('date_off', value);

  bool? get isFullDay => getField<bool>('is_full_day');
  set isFullDay(bool? value) => setField<bool>('is_full_day', value);

  PostgresTime? get startTime => getField<PostgresTime>('start_time');
  set startTime(PostgresTime? value) =>
      setField<PostgresTime>('start_time', value);

  PostgresTime? get endTime => getField<PostgresTime>('end_time');
  set endTime(PostgresTime? value) => setField<PostgresTime>('end_time', value);

  String? get reason => getField<String>('reason');
  set reason(String? value) => setField<String>('reason', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);
}
