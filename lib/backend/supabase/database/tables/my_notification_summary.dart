import '../database.dart';

class MyNotificationSummaryTable
    extends SupabaseTable<MyNotificationSummaryRow> {
  @override
  String get tableName => 'my_notification_summary';

  @override
  MyNotificationSummaryRow createRow(Map<String, dynamic> data) =>
      MyNotificationSummaryRow(data);
}

class MyNotificationSummaryRow extends SupabaseDataRow {
  MyNotificationSummaryRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => MyNotificationSummaryTable();

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  int? get totalCount => getField<int>('total_count');
  set totalCount(int? value) => setField<int>('total_count', value);

  int? get unreadCount => getField<int>('unread_count');
  set unreadCount(int? value) => setField<int>('unread_count', value);

  int? get readCount => getField<int>('read_count');
  set readCount(int? value) => setField<int>('read_count', value);

  DateTime? get latestNotificationAt =>
      getField<DateTime>('latest_notification_at');
  set latestNotificationAt(DateTime? value) =>
      setField<DateTime>('latest_notification_at', value);
}
