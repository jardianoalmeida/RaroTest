import 'package:injectable/injectable.dart';
import 'package:raro_test/data/local/hive_client.dart';
import 'package:raro_test/data/mappers/index.dart';

/// Your [LocalDataSource] encapsulate your storage data source,
/// whether [SharedPreferences], [Hive] or [Moor].
/// This makes it easy to change where your data comes from.
/// Notice that you can also work with more than one storage client.

@injectable
class FeatureLocalDataSource {
  final HiveClient _hiveClient;

  FeatureLocalDataSource(this._hiveClient);

  Future getSomethingFromMyStorage() async {
    // TODO: implement call
    throw UnimplementedError();
  }
}
