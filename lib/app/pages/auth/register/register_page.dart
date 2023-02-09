import 'package:dark_week/app/core/ui/base_state/base_state.dart';
import 'package:dark_week/app/core/ui/styles/text_styler.dart';
import 'package:dark_week/app/core/ui/widgets/delivery_appbar.dart';
import 'package:dark_week/app/core/ui/widgets/delivery_buttom.dart';
import 'package:dark_week/app/pages/auth/register/register_controller.dart';
import 'package:dark_week/app/pages/auth/register/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:validatorless/validatorless.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends BaseState<RegisterPage, RegisterController> {
  final _formKey = GlobalKey<FormState>();

  final _nameEC = TextEditingController();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();

  @override
  void dispose() {
    _nameEC.dispose();
    _emailEC.dispose();
    _passwordEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterController, RegisterState>(
      listener: (context, state) {
        state.status.matchAny(
          any: () => hideLoader(),
          register: () => showLoader(),
          error: () {
            hideLoader();
            showError("Erro ao registrar usuário");
          },
          success: () {
            hideLoader();
            showSuccess("Cadastro realizado com Sucesso");
            Navigator.pop(context);
          },
        );
      },
      child: Scaffold(
        appBar: DeliveryAppbar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "CADASTRAR",
                    style: context.textStyles.textTitle,
                  ),
                  Text(
                    "Preencha os campos abaixo para criar seu cadastro",
                    style: context.textStyles.textMidium.copyWith(
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    decoration: const InputDecoration(labelText: "Nome:"),
                    controller: _nameEC,
                    validator: Validatorless.required("Nome obrigatório"),
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    decoration: const InputDecoration(labelText: "E-mail:"),
                    controller: _emailEC,
                    validator: Validatorless.multiple([
                      Validatorless.required("Email obrigatório"),
                      Validatorless.email("Email inválido!"),
                    ]),
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    decoration: const InputDecoration(labelText: "Senha:"),
                    controller: _passwordEC,
                    obscureText: true,
                    validator: Validatorless.multiple([
                      Validatorless.required("Senha obrigatório"),
                      Validatorless.min(6, "Mínimo 6 caracteres!"),
                    ]),
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    decoration:
                        const InputDecoration(labelText: "Confirma Senha:"),
                    obscureText: true,
                    validator: Validatorless.multiple([
                      Validatorless.required("Confirmar senha obrigatória!"),
                      Validatorless.compare(_passwordEC, "SENHAS NÃO CONFEREM.")
                    ]),
                  ),
                  const SizedBox(height: 30),
                  Center(
                    child: DeliveryButtom(
                      label: "CADASTRAR",
                      onPressed: () {
                        final valid =
                            _formKey.currentState?.validate() ?? false;
                        if (valid) {
                          controller.register(
                              _nameEC.text, _emailEC.text, _passwordEC.text);
                        }
                      },
                      width: double.infinity,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
