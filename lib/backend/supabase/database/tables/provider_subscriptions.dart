import '../database.dart';

class ProviderSubscriptionsTable
    extends SupabaseTable<ProviderSubscriptionsRow> {
  @override
  String get tableName => 'provider_subscriptions';

  @override
  ProviderSubscriptionsRow createRow(Map<String, dynamic> data) =>
      ProviderSubscriptionsRow(data);
}

class ProviderSubscriptionsRow extends SupabaseDataRow {
  ProviderSubscriptionsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ProviderSubscriptionsTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  String get providerProfileId => getField<String>('provider_profile_id')!;
  set providerProfileId(String value) =>
      setField<String>('provider_profile_id', value);

  String? get tierCode => getField<String>('tier_code');
  set tierCode(String? value) => setField<String>('tier_code', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  DateTime? get startsAt => getField<DateTime>('starts_at');
  set startsAt(DateTime? value) => setField<DateTime>('starts_at', value);

  DateTime? get endsAt => getField<DateTime>('ends_at');
  set endsAt(DateTime? value) => setField<DateTime>('ends_at', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);
}
