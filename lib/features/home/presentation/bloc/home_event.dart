part of 'home_bloc.dart';

sealed class LevelEvent extends Equatable {
  const LevelEvent();

  @override
  List<Object> get props => [];
}

class GetLevelsEvent extends LevelEvent {
  const GetLevelsEvent();
}
