import 'package:flutter_cep/models/endereco_model.dart';
import 'package:match/match.dart';

part 'home_state.g.dart';

@match
enum HomeStatus {
  initial,
  loading,
  loaded,
  failure,
}

class HomeState {
  final EnderecoModel? enderecoModel;
  final HomeStatus homeStatus;

  HomeState({
    this.homeStatus = HomeStatus.initial,
    this.enderecoModel,
  });

  HomeState copyWith({
    EnderecoModel? enderecoModel,
    HomeStatus? homeStatus,
  }) {
    return HomeState(
      enderecoModel: enderecoModel ?? this.enderecoModel,
      homeStatus: homeStatus ?? this.homeStatus,
    );
  }
}
