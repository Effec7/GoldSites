import '../database.dart';

class UserSettingsTable extends SupabaseTable<UserSettingsRow> {
  @override
  String get tableName => 'user_settings';

  @override
  UserSettingsRow createRow(Map<String, dynamic> data) => UserSettingsRow(data);
}

class UserSettingsRow extends SupabaseDataRow {
  UserSettingsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UserSettingsTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);

  String? get languageCode => getField<String>('language_code');
  set languageCode(String? value) => setField<String>('language_code', value);

  bool? get pushEnabled => getField<bool>('push_enabled');
  set pushEnabled(bool? value) => setField<bool>('push_enabled', value);

  bool? get emailEnabled => getField<bool>('email_enabled');
  set emailEnabled(bool? value) => setField<bool>('email_enabled', value);

  bool? get marketingEnabled => getField<bool>('marketing_enabled');
  set marketingEnabled(bool? value) =>
      setField<bool>('marketing_enabled', value);

  bool? get darkModeEnabled => getField<bool>('dark_mode_enabled');
  set darkModeEnabled(bool? value) =>
      setField<bool>('dark_mode_enabled', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);
}
