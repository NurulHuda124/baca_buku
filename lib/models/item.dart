class Item {
  late int id;
  late String _judul;
  late String _author;
  late String _teks;

  Item(this._judul, this._author, this._teks);

  Item.map(dynamic obj) {
    this._judul = obj['judul'];
    this._author = obj['author'];
    this._teks = obj['teks'];
  }

  String get judul => _judul;
  String get author => _author;
  String get teks => _teks;

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};

    map['judul'] = _judul;
    map['author'] = _author;
    map['teks'] = _teks;
    return map;
  }

  void setItemId(int id) {
    this.id = id;
  }
}
