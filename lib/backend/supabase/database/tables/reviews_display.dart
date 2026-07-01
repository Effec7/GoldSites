import '../database.dart';

class ReviewsDisplayTable extends SupabaseTable<ReviewsDisplayRow> {
  @override
  String get tableName => 'reviews_display';

  @override
  ReviewsDisplayRow createRow(Map<String, dynamic> data) =>
      ReviewsDisplayRow(data);
}

class ReviewsDisplayRow extends SupabaseDataRow {
  ReviewsDisplayRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ReviewsDisplayTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  String? get bookingId => getField<String>('booking_id');
  set bookingId(String? value) => setField<String>('booking_id', value);

  String? get providerProfileId => getField<String>('provider_profile_id');
  set providerProfileId(String? value) =>
      setField<String>('provider_profile_id', value);

  String? get providerServiceId => getField<String>('provider_service_id');
  set providerServiceId(String? value) =>
      setField<String>('provider_service_id', value);

  String? get customerUserId => getField<String>('customer_user_id');
  set customerUserId(String? value) =>
      setField<String>('customer_user_id', value);

  int? get rating => getField<int>('rating');
  set rating(int? value) => setField<int>('rating', value);

  String? get comment => getField<String>('comment');
  set comment(String? value) => setField<String>('comment', value);

  String? get customerDisplayName => getField<String>('customer_display_name');
  set customerDisplayName(String? value) =>
      setField<String>('customer_display_name', value);

  String? get customerAvatarUrl => getField<String>('customer_avatar_url');
  set customerAvatarUrl(String? value) =>
      setField<String>('customer_avatar_url', value);

  String? get providerReply => getField<String>('provider_reply');
  set providerReply(String? value) => setField<String>('provider_reply', value);

  bool? get isPublic => getField<bool>('is_public');
  set isPublic(bool? value) => setField<bool>('is_public', value);

  bool? get isVisible => getField<bool>('is_visible');
  set isVisible(bool? value) => setField<bool>('is_visible', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  String? get createdDateShort => getField<String>('created_date_short');
  set createdDateShort(String? value) =>
      setField<String>('created_date_short', value);

  String? get createdDateMedium => getField<String>('created_date_medium');
  set createdDateMedium(String? value) =>
      setField<String>('created_date_medium', value);

  String? get customerInitial => getField<String>('customer_initial');
  set customerInitial(String? value) =>
      setField<String>('customer_initial', value);
}
