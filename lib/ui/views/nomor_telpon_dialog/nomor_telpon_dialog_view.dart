import 'package:flutter/material.dart';
import 'package:kamus_kesehatan/ui/widgets/my_textformfield.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:validatorless/validatorless.dart';

import './nomor_telpon_dialog_view_model.dart';

class NomorTelponDialogView extends StatelessWidget {
  final DialogRequest? request;
  final Function(DialogResponse)? completer;

  const NomorTelponDialogView({
    Key? key,
    this.request,
    this.completer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<NomorTelponDialogViewModel>.reactive(
      viewModelBuilder: () => NomorTelponDialogViewModel(),
      onViewModelReady: (NomorTelponDialogViewModel model) async {
        await model.init(request!.data);
      },
      builder: (
        BuildContext context,
        NomorTelponDialogViewModel model,
        Widget? child,
      ) {
        return Dialog(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: model.formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  MyTextFormField(
                      controller: model.nomorTelponController,
                      hintText: 'Nomor Telpon',
                      keyboardType: TextInputType.phone,
                      maxLength: 13,
                      validator: Validatorless.multiple([
                        Validatorless.required(
                            'Nomor Telpon tidak boleh kosong'),
                        Validatorless.number('Nomor Telpon harus angka'),
                        Validatorless.min(10, 'Nomor Telpon minimal 10 digit'),
                        Validatorless.regex(
                            RegExp(r'^[0-9]*$'), 'Nomor Telpon tidak valid')
                      ])),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () =>
                            completer!(DialogResponse(confirmed: false)),
                        child: const Text(
                          'Batal',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          if (model.formKey.currentState!.validate()) {
                            model.openWhatsapp();
                          }
                        },
                        child: const Text('Share'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
