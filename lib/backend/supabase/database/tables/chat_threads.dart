import '../database.dart';

class ChatThreadsTable extends SupabaseTable<ChatThreadsRow> {
  @override
  String get tableName => 'chat_threads';

  @override
  ChatThreadsRow createRow(Map<String, dynamic> data) => ChatThreadsRow(data);
}

class ChatThreadsRow extends SupabaseDataRow {
  ChatThreadsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ChatThreadsTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  String get customerUserId => getField<String>('customer_user_id')!;
  set customerUserId(String value) =>
      setField<String>('customer_user_id', value);

  String get providerProfileId => getField<String>('provider_profile_id')!;
  set providerProfileId(String value) =>
      setField<String>('provider_profile_id', value);

  String? get bookingId => getField<String>('booking_id');
  set bookingId(String? value) => setField<String>('booking_id', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  String? get lastMessage => getField<String>('last_message');
  set lastMessage(String? value) => setField<String>('last_message', value);

  DateTime? get lastMessageAt => getField<DateTime>('last_message_at');
  set lastMessageAt(DateTime? value) =>
      setField<DateTime>('last_message_at', value);

  String? get lastMessageSenderUserId =>
      getField<String>('last_message_sender_user_id');
  set lastMessageSenderUserId(String? value) =>
      setField<String>('last_message_sender_user_id', value);

  DateTime? get customerLastReadAt =>
      getField<DateTime>('customer_last_read_at');
  set customerLastReadAt(DateTime? value) =>
      setField<DateTime>('customer_last_read_at', value);

  DateTime? get providerLastReadAt =>
      getField<DateTime>('provider_last_read_at');
  set providerLastReadAt(DateTime? value) =>
      setField<DateTime>('provider_last_read_at', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);
}
