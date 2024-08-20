import 'package:either_dart/either.dart';
import 'package:parking_time/data/models/api_response_model.dart';
import 'package:parking_time/main.dart';
import 'package:parking_time/utils/typedef/exception_trace.dart';

import '../typedef/page.dart';

extension FutureApiResponseExtensions<T> on Future<ApiResponseModel<T>> {
  Future<Either<ExceptionTrace, T>> toDataResult() async {
    try {
      final result = await this;

      if (result.status >= 400) {
        throw Exception(result.errorMessage);
      }

      return Right(result.body as T);
    } catch (e, trace) {
      if (e is Exception) {
        return Left((exception: e, trace: trace));
      } else {
        return Left((exception: Exception('unknown error'), trace: trace));
      }
    }
  }

  Future<Either<ExceptionTrace, Page<V>>> toPageDataResult<V>() async {
    try {
      final result = await this;

      if (result.status >= 400) {
        throw Exception(result.errorMessage);
      }

      return Right((data: result.body! as List<V>, count: result.meta!.count, page: result.meta!.page, pageSize: result.meta!.pageSize));
    } catch (e, trace) {
      if (e is Exception) {
        return Left((exception: e, trace: trace));
      } else {
        logger.e("Error", error: e, stackTrace: trace);
        return Left((exception: Exception('unknown error'), trace: trace));
      }
    }
  }
}