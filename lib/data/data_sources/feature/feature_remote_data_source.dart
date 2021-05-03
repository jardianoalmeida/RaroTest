import 'package:injectable/injectable.dart';
import 'package:raro_test/data/remote/dio_client.dart';
import 'package:raro_test/data/mappers/index.dart';

/// Your [RemoteDataSource] encapsulate your API data source,
/// whether [Dio], [Shooper], [Firestore].
/// This makes it easy to change where your data comes from.
/// Notice that you can also work with more than one API client.

@injectable
class FeatureRemoteDataSource {
  final DioClient _dioClient;

  FeatureRemoteDataSource(this._dioClient);

  Future getSomethingFromApi() async {
    // TODO: implement call
    throw UnimplementedError();
  }
}
