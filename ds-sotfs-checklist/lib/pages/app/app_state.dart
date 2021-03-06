part of 'app_cubit.dart';

enum AppStates { initial, loading, loaded }

@immutable
abstract class AppState extends Equatable {
  final AppStates appStates;

  const AppState(this.appStates);

  AppState copyWith({
    required final AppStates appStates,
  });

  @override
  List<Object?> get props => [appStates];
}

class AppInitial extends AppState {
  const AppInitial(AppStates appStates) : super(appStates);

  @override
  AppState copyWith({required AppStates appStates}) {
    return AppInitial(appStates);
  }
}
