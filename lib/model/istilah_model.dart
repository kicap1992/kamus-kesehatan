class IstilahModel {
  String? istilah;
  String? arti;

  IstilahModel({this.istilah, this.arti});

  IstilahModel.fromJson(Map<String, dynamic> json) {
    istilah = json['istilah'];
    arti = json['arti'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['istilah'] = istilah;
    data['arti'] = arti;
    return data;
  }
}
