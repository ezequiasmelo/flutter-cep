import 'package:flutter/material.dart';
import 'package:flutter_cep/models/endereco_model.dart';
import 'package:flutter_cep/repositories/cep_repository.dart';
import 'package:flutter_cep/repositories/cep_repository_impl.dart';
import 'package:flutter_cep/widgets/custom_elevated_button.dart';

import '../widgets/custom_text_form_field.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CepRepository cepRepository = CepRepositoryImpl();
  EnderecoModel? enderecoModel;
  var loading = false;

  final formKey = GlobalKey<FormState>();
  final cepEC = TextEditingController();

  @override
  void dispose() {
    cepEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              ),
              CustomElevatedButton(
                text: 'Buscar',
                onPressed: () async {
                  final valid = formKey.currentState?.validate() ?? false;
                  if (valid) {
                    try {
                      setState(() {
                        loading = true;
                      });
                      final endereco = await cepRepository.getCep(cepEC.text);
                      setState(() {
                        loading = false;
                        enderecoModel = endereco;
                      });
                    } catch (e) {
                      setState(() {
                        loading = false;
                        enderecoModel = null;
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Erro ao buscar endereço'),
                        ),
                      );
                    }
                  }
                },
                loading: loading,
              ),
              Visibility(
                visible: loading,
                child: const CircularProgressIndicator(),
              ),
              Visibility(
                visible: enderecoModel != null,
                child: Text(
                    '${enderecoModel?.logradouro} ${enderecoModel?.complemento} ${enderecoModel?.cep}'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
