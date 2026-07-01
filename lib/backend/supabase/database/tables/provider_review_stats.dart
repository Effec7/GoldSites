import '../database.dart';

class ProviderReviewStatsTable extends SupabaseTable<ProviderReviewStatsRow> {
  @override
  String get tableName => 'provider_review_stats';

  @override
  ProviderReviewStatsRow createRow(Map<String, dynamic> data) =>
      ProviderReviewStatsRow(data);
}

class ProviderReviewStatsRow extends SupabaseDataRow {
  ProviderReviewStatsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ProviderReviewStatsTable();

  String? get providerProfileId => getField<String>('provider_profile_id');
  set providerProfileId(String? value) =>
      setField<String>('provider_profile_id', value);

  double? get averageRating => getField<double>('average_rating');
  set averageRating(double? value) => setField<double>('average_rating', value);

  int? get reviewsCount => getField<int>('reviews_count');
  set reviewsCount(int? value) => setField<int>('reviews_count', value);

  int? get rating5Count => getField<int>('rating_5_count');
  set rating5Count(int? value) => setField<int>('rating_5_count', value);

  int? get rating4Count => getField<int>('rating_4_count');
  set rating4Count(int? value) => setField<int>('rating_4_count', value);

  int? get rating3Count => getField<int>('rating_3_count');
  set rating3Count(int? value) => setField<int>('rating_3_count', value);

  int? get rating2Count => getField<int>('rating_2_count');
  set rating2Count(int? value) => setField<int>('rating_2_count', value);

  int? get rating1Count => getField<int>('rating_1_count');
  set rating1Count(int? value) => setField<int>('rating_1_count', value);

  DateTime? get latestReviewAt => getField<DateTime>('latest_review_at');
  set latestReviewAt(DateTime? value) =>
      setField<DateTime>('latest_review_at', value);

  double? get rating5Percent => getField<double>('rating_5_percent');
  set rating5Percent(double? value) =>
      setField<double>('rating_5_percent', value);

  double? get rating4Percent => getField<double>('rating_4_percent');
  set rating4Percent(double? value) =>
      setField<double>('rating_4_percent', value);

  double? get rating3Percent => getField<double>('rating_3_percent');
  set rating3Percent(double? value) =>
      setField<double>('rating_3_percent', value);

  double? get rating2Percent => getField<double>('rating_2_percent');
  set rating2Percent(double? value) =>
      setField<double>('rating_2_percent', value);

  double? get rating1Percent => getField<double>('rating_1_percent');
  set rating1Percent(double? value) =>
      setField<double>('rating_1_percent', value);
}
