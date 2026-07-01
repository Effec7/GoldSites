import '../database.dart';

class ReviewsTable extends SupabaseTable<ReviewsRow> {
  @override
  String get tableName => 'reviews';

  @override
  ReviewsRow createRow(Map<String, dynamic> data) => ReviewsRow(data);
}

class ReviewsRow extends SupabaseDataRow {
  ReviewsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ReviewsTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  String? get bookingId => getField<String>('booking_id');
  set bookingId(String? value) => setField<String>('booking_id', value);

  String get providerProfileId => getField<String>('provider_profile_id')!;
  set providerProfileId(String value) =>
      setField<String>('provider_profile_id', value);

  String? get providerServiceId => getField<String>('provider_service_id');
  set providerServiceId(String? value) =>
      setField<String>('provider_service_id', value);

  String get customerUserId => getField<String>('customer_user_id')!;
  set customerUserId(String value) =>
      setField<String>('customer_user_id', value);

  int get rating => getField<int>('rating')!;
  set rating(int value) => setField<int>('rating', value);

  String? get comment => getField<String>('comment');
  set comment(String? value) => setField<String>('comment', value);

  String? get providerReply => getField<String>('provider_reply');
  set providerReply(String? value) => setField<String>('provider_reply', value);

  bool? get isVisible => getField<bool>('is_visible');
  set isVisible(bool? value) => setField<bool>('is_visible', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  String? get customerDisplayName => getField<String>('customer_display_name');
  set customerDisplayName(String? value) =>
      setField<String>('customer_display_name', value);

  String? get customerAvatarUrl => getField<String>('customer_avatar_url');
  set customerAvatarUrl(String? value) =>
      setField<String>('customer_avatar_url', value);

  bool? get isPublic => getField<bool>('is_public');
  set isPublic(bool? value) => setField<bool>('is_public', value);
}
