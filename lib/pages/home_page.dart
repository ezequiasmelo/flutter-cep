import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cep/pages/home_controller.dart';
import 'package:flutter_cep/pages/home_state.dart';
import 'package:flutter_cep/widgets/custom_elevated_button.dart';
import 'package:validatorless/validatorless.dart';

import '../widgets/custom_text_form_field.dart';
import 'widgets/rich_text_custom.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeController = HomeController();
  final formKey = GlobalKey<FormState>();
  final cepEC = TextEditingController();

  @override
  void dispose() {
    cepEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeController, HomeState>(
      bloc: homeController,
      listener: (context, state) {
        state.homeStatus.matchAny(
          any: () {},
          failure: (() {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Erro ao buscar endereço'),
              ),
            );
          }),
        );
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Buscar CEP'),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                CustomTextFormField(
                  controller: cepEC,
                  hintText: 'Informe o CEP',
                  validator: Validatorless.required('O campo CEP é necessário'),
                ),
                BlocBuilder<HomeController, HomeState>(
                  bloc: homeController,
                  builder: (context, state) {
                    return CustomElevatedButton(
                      text: 'Buscar',
                      onPressed: () async {
                        final valid = formKey.currentState?.validate() ?? false;
                        if (valid) {
                          homeController.findCep(cepEC.text);
                        }
                      },
                      loading: state.homeStatus == HomeStatus.loading,
                    );
                  },
                ),
                BlocBuilder<HomeController, HomeState>(
                  bloc: homeController,
                  builder: (context, state) {
                    if (state.homeStatus == HomeStatus.loaded) {
                      return Column(
                        children: [
                          RichTextCustom(
                            text1: 'Rua: ',
                            text2: state.enderecoModel!.logradouro,
                          ),
                          RichTextCustom(
                            text1: 'Bairro: ',
                            text2: state.enderecoModel!.bairro,
                          ),
                          RichTextCustom(
                            text1: 'Complemento: ',
                            text2: state.enderecoModel!.complemento,
                          ),
                        ],
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
