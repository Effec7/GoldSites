import '../database.dart';

class ChatInboxTable extends SupabaseTable<ChatInboxRow> {
  @override
  String get tableName => 'chat_inbox';

  @override
  ChatInboxRow createRow(Map<String, dynamic> data) => ChatInboxRow(data);
}

class ChatInboxRow extends SupabaseDataRow {
  ChatInboxRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ChatInboxTable();

  String? get threadId => getField<String>('thread_id');
  set threadId(String? value) => setField<String>('thread_id', value);

  String? get customerUserId => getField<String>('customer_user_id');
  set customerUserId(String? value) =>
      setField<String>('customer_user_id', value);

  String? get providerProfileId => getField<String>('provider_profile_id');
  set providerProfileId(String? value) =>
      setField<String>('provider_profile_id', value);

  String? get bookingId => getField<String>('booking_id');
  set bookingId(String? value) => setField<String>('booking_id', value);

  String? get displayName => getField<String>('display_name');
  set displayName(String? value) => setField<String>('display_name', value);

  String? get displayImageUrl => getField<String>('display_image_url');
  set displayImageUrl(String? value) =>
      setField<String>('display_image_url', value);

  String? get lastMessage => getField<String>('last_message');
  set lastMessage(String? value) => setField<String>('last_message', value);

  DateTime? get lastMessageAt => getField<DateTime>('last_message_at');
  set lastMessageAt(DateTime? value) =>
      setField<DateTime>('last_message_at', value);

  int? get unreadCount => getField<int>('unread_count');
  set unreadCount(int? value) => setField<int>('unread_count', value);

  bool? get isBookingChat => getField<bool>('is_booking_chat');
  set isBookingChat(bool? value) => setField<bool>('is_booking_chat', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);
}
