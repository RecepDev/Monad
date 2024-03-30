part of 'memes_bloc_bloc.dart';

@immutable
sealed class MemesBlocState {}

final class BlocInitial extends MemesBlocState {}

final class BlocDataLoaded extends MemesBlocState {
  final List<dynamic> listOfMemes;
  BlocDataLoaded(this.listOfMemes);
}

/* final class MemesBlocInitial extends MemesBlocState {} */
