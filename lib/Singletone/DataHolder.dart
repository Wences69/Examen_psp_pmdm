import 'package:examen_oscar_rueda/FirestoreObjects/FbPost.dart';

import 'FirebaseAdmin.dart';

class DataHolder {

  static final DataHolder _dataHolder = DataHolder._internal();

  FirebaseAdmin fbadmin=FirebaseAdmin();

  late FbPost selectedPost;

  void initDataHolder() {}

  DataHolder._internal();
  
  factory DataHolder(){
    return _dataHolder;
  }
}