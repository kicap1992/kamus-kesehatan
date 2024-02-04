// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedDialogGenerator
// **************************************************************************

import 'package:stacked_services/stacked_services.dart';

import '../model/istilah_model.dart';
import 'app.locator.dart';
import '../ui/views/action_dialog/action_dialog_view.dart';
import '../ui/views/nomor_telpon_dialog/nomor_telpon_dialog_view.dart';

enum DialogType {
  actionDialogView,
  nomorTelponDialogView,
}

void setupDialogUi() {
  final dialogService = locator<DialogService>();

  final Map<DialogType, DialogBuilder> builders = {
    DialogType.actionDialogView: (context, request, completer) =>
        ActionDialogView(
            request: request as DialogRequest<IstilahModel>,
            completer: completer),
    DialogType.nomorTelponDialogView: (context, request, completer) =>
        NomorTelponDialogView(request: request, completer: completer),
  };

  dialogService.registerCustomDialogBuilders(builders);
}
