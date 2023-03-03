import 'package:dark_week/app/core/ui/helpers/size_extensions.dart';
import 'package:dark_week/app/core/ui/styles/text_styler.dart';
import 'package:dark_week/app/models/payment_type_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_awesome_select/flutter_awesome_select.dart';

class PaymentTypesField extends StatelessWidget {
  final List<PaymentTypeModel> paymentTypes;

  const PaymentTypesField({super.key, required this.paymentTypes});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Column(
        children: [
          Text(
            "Forma de Pagamento",
            style: context.textStyles.textRegular.copyWith(fontSize: 16),
          ),
          SmartSelect<String>.single(
            title: 'FORMA DE PAGAMENTO',
            selectedValue: '',
            modalType: S2ModalType.bottomSheet,
            onChange: (value) {
              //
            },
            //tileBuilde personalisa a apresentação da Seleção de pagamento, funciona sem mas fica feio
            tileBuilder: (context, state) {
              return InkWell(
                onTap: state.showModal,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      width: context.screenWidth,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            state.selected.title ?? 'Selecione pagamento',
                            style: context.textStyles.textRegular,
                          ),
                          const Icon(Icons.arrow_forward_ios_rounded)
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
            choiceItems: S2Choice.listFrom<String, Map<String, String>>(
              source:
                  // paymentTypes
                  //     .map((p) => {"value": p.id.toString(), "title": p.name})
                  //     .toList(),
                  [
                {'value': 'VA', 'title': 'Vale Alimentação'},
                {'value': 'VR', 'title': 'Vale Refeição'},
                {'value': 'CC', 'title': 'Cartão de Crédito'},
              ],

              //title: (index, item) => ' batata ${item['title']}',//customização em 2:03:00
              title: (index, item) => item['title'] ?? '',
              value: (index, item) => item['value'] ?? '',
              group: (index, item) => 'Selecione uma forma de pagamento',
            ),
            choiceType: S2ChoiceType.radios,
            choiceGrouped: true,
            modalFilter: false, //habilita filtro
            placeholder: '',
          )
        ],
      ),
    );
  }
}
