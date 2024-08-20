class ApiPageResponseModel<T> {
  final int page;

  final int count;

  final List<T> data;

  ApiPageResponseModel({
    required this.page,
    required this.count,
    required this.data,
  });
}