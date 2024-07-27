import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../model/istilah_model1.dart';
import './action_dialog_view_model.dart';

class ActionDialogView extends StatelessWidget {
  final DialogRequest<IstilahModel1> request;
  final Function(DialogResponse) completer;

  const ActionDialogView({
    Key? key,
    required DialogRequest request,
    required this.completer,
  })  : request = request as DialogRequest<IstilahModel1>,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ActionDialogViewModel>.reactive(
      viewModelBuilder: () => ActionDialogViewModel(),
      onViewModelReady: (ActionDialogViewModel model) async {
        await model.init(request.data);
      },
      builder: (
        BuildContext context,
        ActionDialogViewModel model,
        Widget? child,
      ) {
        return Dialog(
          child: Container(
            padding: const EdgeInsets.all(20),
            // create a row with 2 circle icon , 1 is whataspp icon, 2 is bookmark, no need text
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.green,
                  child: IconButton(
                    icon: const Icon(Icons.phone),
                    onPressed: () {
                      // completer(DialogResponse(confirmed: true));
                      model.openWhatsapp();
                    },
                  ),
                ),
                CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: IconButton(
                    icon: const Icon(Icons.bookmark),
                    onPressed: () {
                      model.addBookmark(request.data!);
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
