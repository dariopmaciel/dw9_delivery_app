import 'package:dark_week/app/core/ui/helpers/loader.dart';
import 'package:dark_week/app/core/ui/helpers/messages.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//criação de classe abstrata, recebendo 2 tipos genericos onde 1 é uma classe StatefulWidget e 1 é uma classe blocBase que é uma bloc, extendemos State e adicionamos o loader e a mensagem.
abstract class BaseState<T extends StatefulWidget, C extends BlocBase>
    extends State<T> with Loader, Messages {
  late final C controller;

  @override
  void initState() {
    super.initState();
    controller = context.read<C>();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      onReady();
    });
  }

  void onReady() {}
}
