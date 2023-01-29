import 'package:bloc/bloc.dart';
import 'package:flutter_cep/pages/home_state.dart';
import 'package:flutter_cep/repositories/cep_repository.dart';
import 'package:flutter_cep/repositories/cep_repository_impl.dart';

class HomeController extends Cubit<HomeState> {
  final CepRepository cepRepository = CepRepositoryImpl();

  HomeController() : super(HomeState());

  Future<void> findCep(String cep) async {
    try {
      emit(state.copyWith(homeStatus: HomeStatus.loading));
      final enderecoModel = await cepRepository.getCep(cep);
      emit(state.copyWith(
        homeStatus: HomeStatus.loaded,
        enderecoModel: enderecoModel,
      ));
    } catch (e) {
      emit(state.copyWith(homeStatus: HomeStatus.failure));
    }
  }
}
