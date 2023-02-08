import 'package:dark_week/app/core/ui/styles/text_styler.dart';
import 'package:dark_week/app/core/ui/widgets/delivery_appbar.dart';
import 'package:dark_week/app/core/ui/widgets/delivery_buttom.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DeliveryAppbar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "CADASTRO",
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
                    decoration: const InputDecoration(labelText: "Nome:")),
                const SizedBox(height: 30),
                TextFormField(
                    decoration: const InputDecoration(labelText: "E-mail:")),
                const SizedBox(height: 30),
                TextFormField(
                    decoration: const InputDecoration(labelText: "Senha:")),
                const SizedBox(height: 30),
                TextFormField(
                    decoration:
                        const InputDecoration(labelText: "Confirma Senha:")),
                const SizedBox(height: 30),
                Center(
                  child: DeliveryButtom(
                    label: "CADASTRAR",
                    onPressed: () {
                      //

                      //
                    },
                    width: double.infinity,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
