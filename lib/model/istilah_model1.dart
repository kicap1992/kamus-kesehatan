class IstilahModel1 {
  String? istilah;
  String? arti;
  String? kategori;

  IstilahModel1({this.istilah, this.arti});

  IstilahModel1.fromJson(Map<String, dynamic> json) {
    istilah = json['ISTILAH KESEHATAN'];
    arti = json['PENGERTIAN'];
    kategori = json['KATEGORI'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ISTILAH KESEHATAN'] = istilah;
    data['PENGERTIAN'] = arti;
    data['KATEGORI'] = kategori;
    return data;
  }
}
