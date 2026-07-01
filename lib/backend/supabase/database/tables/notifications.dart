import '../database.dart';

class NotificationsTable extends SupabaseTable<NotificationsRow> {
  @override
  String get tableName => 'notifications';

  @override
  NotificationsRow createRow(Map<String, dynamic> data) =>
      NotificationsRow(data);
}

class NotificationsRow extends SupabaseDataRow {
  NotificationsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => NotificationsTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);

  String get title => getField<String>('title')!;
  set title(String value) => setField<String>('title', value);

  String? get body => getField<String>('body');
  set body(String? value) => setField<String>('body', value);

  String? get notificationType => getField<String>('notification_type');
  set notificationType(String? value) =>
      setField<String>('notification_type', value);

  String? get bookingId => getField<String>('booking_id');
  set bookingId(String? value) => setField<String>('booking_id', value);

  bool? get isRead => getField<bool>('is_read');
  set isRead(bool? value) => setField<bool>('is_read', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String get recipientUserId => getField<String>('recipient_user_id')!;
  set recipientUserId(String value) =>
      setField<String>('recipient_user_id', value);

  String get recipientRole => getField<String>('recipient_role')!;
  set recipientRole(String value) => setField<String>('recipient_role', value);

  String? get actorUserId => getField<String>('actor_user_id');
  set actorUserId(String? value) => setField<String>('actor_user_id', value);

  String get type => getField<String>('type')!;
  set type(String value) => setField<String>('type', value);

  String? get icon => getField<String>('icon');
  set icon(String? value) => setField<String>('icon', value);

  String? get priority => getField<String>('priority');
  set priority(String? value) => setField<String>('priority', value);

  String? get serviceId => getField<String>('service_id');
  set serviceId(String? value) => setField<String>('service_id', value);

  String? get providerId => getField<String>('provider_id');
  set providerId(String? value) => setField<String>('provider_id', value);

  String? get conversationId => getField<String>('conversation_id');
  set conversationId(String? value) =>
      setField<String>('conversation_id', value);

  String? get reviewId => getField<String>('review_id');
  set reviewId(String? value) => setField<String>('review_id', value);

  String? get routeName => getField<String>('route_name');
  set routeName(String? value) => setField<String>('route_name', value);

  dynamic? get routeParams => getField<dynamic>('route_params');
  set routeParams(dynamic? value) => setField<dynamic>('route_params', value);

  DateTime? get readAt => getField<DateTime>('read_at');
  set readAt(DateTime? value) => setField<DateTime>('read_at', value);

  DateTime? get archivedAt => getField<DateTime>('archived_at');
  set archivedAt(DateTime? value) => setField<DateTime>('archived_at', value);

  String? get dedupeKey => getField<String>('dedupe_key');
  set dedupeKey(String? value) => setField<String>('dedupe_key', value);
}
