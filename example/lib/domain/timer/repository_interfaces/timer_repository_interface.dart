/// We need a implementation that meets the requirements of every function
/// declaration in out interface for our domain layer to work
abstract class TimerRepositoryInterface {
  Stream<int> tick({required int ticks});
}
