import 'package:freezed_annotation/freezed_annotation.dart';
part 'main_failure.freezed.dart';

@freezed
class MainFailure with _$MainFailure {
  const factory MainFailure.clientFailure(
      {required String e, required String type}) = _ClientFailure;
  const factory MainFailure.serverFailure(
      {required String e, required String type}) = _ServerFailure;
}

class FailureTypes {
  static String connection = "connection";
}
