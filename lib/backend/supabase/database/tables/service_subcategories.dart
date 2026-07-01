import '../database.dart';

class ServiceSubcategoriesTable extends SupabaseTable<ServiceSubcategoriesRow> {
  @override
  String get tableName => 'service_subcategories';

  @override
  ServiceSubcategoriesRow createRow(Map<String, dynamic> data) =>
      ServiceSubcategoriesRow(data);
}

class ServiceSubcategoriesRow extends SupabaseDataRow {
  ServiceSubcategoriesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ServiceSubcategoriesTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  String get categoryId => getField<String>('category_id')!;
  set categoryId(String value) => setField<String>('category_id', value);

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);

  String get slug => getField<String>('slug')!;
  set slug(String value) => setField<String>('slug', value);

  int? get sortOrder => getField<int>('sort_order');
  set sortOrder(int? value) => setField<int>('sort_order', value);

  bool? get isActive => getField<bool>('is_active');
  set isActive(bool? value) => setField<bool>('is_active', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);
}
