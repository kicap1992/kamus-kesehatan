import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../../app/themes/app_colors.dart';
import '../../../../app/themes/app_text.dart';
import './profil_user_view_model.dart';

class ProfilUserView extends StatelessWidget {
  const ProfilUserView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfilUserViewModel>.reactive(
      viewModelBuilder: () => ProfilUserViewModel(),
      onViewModelReady: (ProfilUserViewModel model) async {
        await model.init();
      },
      builder: (
        BuildContext context,
        ProfilUserViewModel model,
        Widget? child,
      ) {
        return WillPopScope(
          onWillPop: () async => false,
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              children: [
                // MyTextFormField(
                //   hintText: 'Cari istilah',
                //   labelText: 'Cari istilah',
                //   controller: model.searchController,
                //   suffixIcon: const Icon(Icons.search),
                //   onChanged: (String value) {
                //     model.searchIstilah();
                //   },
                // ),
                // const SizedBox(
                //   height: 20,
                // ),
                Expanded(
                  child: model.listIstilah == null
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : model.listIstilah!.isEmpty
                          ? const Center(
                              child: Text('Belum ada bookmark'),
                            )
                          : ListView.builder(
                              itemCount: model.listIstilah!.length,
                              itemBuilder: (
                                BuildContext context,
                                int index,
                              ) {
                                return Card(
                                  child: ListTile(
                                    onTap: () => model
                                        .cekSuara(model.listIstilah![index]),
                                    title: Text(
                                      model.listIstilah![index].istilah!
                                          .toUpperCase(),
                                      style: boldTextStyle,
                                    ),
                                    subtitle:
                                        Text(model.listIstilah![index].arti!),
                                    trailing: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            // model.cekSuara(model.listIstilah[index]);
                                            model.openWhatsapp(
                                              model.listIstilah![index],
                                            );
                                          },
                                          child: const Icon(Icons.phone),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            // model.bukaDialogAksi(
                                            //     model.listIstilah[index]);
                                            model.deleteBookmark(
                                              model.listIstilah![index],
                                            );
                                          },
                                          icon:
                                              const Icon(Icons.delete_forever),
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
        // return const Scaffold(
        //   body: Padding(
        //     padding: EdgeInsets.all(30),
        //     child: Column(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       mainAxisSize: MainAxisSize.min,
        //       children: [
        //         Center(
        //           child: CircleAvatar(
        //             radius: 65,
        //             backgroundColor: fontParagraphColor,
        //             child: Icon(
        //               Icons.person,
        //               size: 50,
        //               color: Colors.white,
        //             ),
        //           ),
        //         ),
        //         SizedBox(height: 20),
        //         _ChildWidget(
        //           icon: Icons.person,
        //           text: 'ini nama developer',
        //         ),
        //         SizedBox(height: 20),
        //         _ChildWidget(
        //           icon: Icons.list_alt,
        //           text: 'Kamus Medis Dan Kesehatan',
        //         ),
        //         SizedBox(height: 20),
        //         _ChildWidget(
        //           // icon multiple person
        //           icon: Icons.people,
        //           text: 'Pembimbing 1',
        //         ),
        //         SizedBox(height: 20),
        //         _ChildWidget(
        //           // icon multiple person
        //           icon: Icons.people,
        //           text: 'Pembimbing 2',
        //         ),
        //       ],
        //     ),
        //   ),
        // );
      },
    );
  }
}

// ignore: unused_element
class _ChildWidget extends StatelessWidget {
  const _ChildWidget({
    required this.icon,
    required this.text,
  });

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(width: 30),
        Icon(
          icon,
          size: 30,
          color: mainColor,
        ),
        const SizedBox(width: 40),
        Text(
          text,
          style: regularTextStyle,
        ),
        const Expanded(child: SizedBox(width: 30)),
      ],
    );
  }
}
