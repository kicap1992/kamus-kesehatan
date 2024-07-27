import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../../app/themes/app_colors.dart';
import '../../../../app/themes/app_text.dart';
import '../../../widgets/my_textformfield.dart';
import './list_detail_istilah_view_model.dart';

class ListDetailIstilahView extends StatelessWidget {
  const ListDetailIstilahView({super.key, required this.kategori});

  final String kategori;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ListDetailIstilahViewModel>.reactive(
      viewModelBuilder: () => ListDetailIstilahViewModel(),
      onViewModelReady: (ListDetailIstilahViewModel model) async {
        await model.init(kategori);
      },
      builder: (
        BuildContext context,
        ListDetailIstilahViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: mainColor,
            title: Text(
              'List ${model.myFunction.capitalize(kategori)}',
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              children: [
                MyTextFormField(
                  hintText: 'Cari istilah',
                  labelText: 'Cari istilah',
                  controller: model.searchController,
                  suffixIcon: const Icon(Icons.search),
                  onChanged: (String value) {
                    model.searchIstilah();
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: model.listIstilah.isEmpty
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : ListView.builder(
                          itemCount: model.listIstilah.length,
                          itemBuilder: (
                            BuildContext context,
                            int index,
                          ) {
                            return Card(
                              child: ListTile(
                                title: Text(
                                  model.listIstilah[index].istilah!
                                      .toUpperCase(),
                                  style: boldTextStyle,
                                ),
                                subtitle: Text(model.listIstilah[index].arti!),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        model
                                            .cekSuara(model.listIstilah[index]);
                                      },
                                      child: const Icon(Icons.volume_up),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        model.bukaDialogAksi(
                                            model.listIstilah[index]);
                                      },
                                      icon: const Icon(Icons.info),
                                    ),
                                  ],
                                ),
                              ),
                            );
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
