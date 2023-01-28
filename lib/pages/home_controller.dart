import 'package:bloc/bloc.dart';
import 'package:flutter_cep/pages/home_state.dart';
import 'package:flutter_cep/repositories/cep_repository.dart';
import 'package:flutter_cep/repositories/cep_repository_impl.dart';

class HomeController extends Cubit<HomeState> {
  final CepRepository cepRepository = CepRepositoryImpl();

  HomeController() : super(HomeInitial());

  Future<void> findCep(String cep) async {
    try {
      emit(HomeLoading());
      final enderecoModel = await cepRepository.getCep(cep);
      emit(HomeLoaded(enderecoModel: enderecoModel));
    } catch (e) {
      emit(HomeFailure());
    }
  }
}
