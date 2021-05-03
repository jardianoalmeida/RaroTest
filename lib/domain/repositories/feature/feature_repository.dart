/// Abstract class that define the expected functionality of outer layers
/// Are not aware of outer layers, simply define expected functionality
/// E.g. The Login [UseCase] expects a [Repository] that has login functionality

abstract class FeatureRepository {
  Future<void> doSomething();
}
