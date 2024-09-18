import 'package:bloc_learning/service_locator.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_core/firebase_core.dart';
import 'common/local_storage/hive/hive_helper.dart';
import 'common/services/storage_service.dart';

class Global {
  static late StorageService storageService;

  static Future init() async {
    setupLocator();
    WidgetsFlutterBinding.ensureInitialized();
    await HiveHelper().init();
     // Initialize the service locator
    // Initialize Firebase
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyB1F-rdst3N8Zcg03iPfHfZRtIT0Ge-NqA",
        authDomain: "firereal-fffc4.firebaseapp.com",
        databaseURL: "https://firereal-fffc4.firebaseio.com",
        projectId: "firereal-fffc4",
        storageBucket: "firereal-fffc4.appspot.com",
        messagingSenderId: "230877096711",
        appId: "1:230877096711:android:5be8a76326c7a47ed9b3a2",
      ),
    );

    // Initialize StorageService
    storageService = await StorageService().init();
  }
}
/**
 * add data await HiveHelper().addData('productsBox', Product(id: 1, name: 'Laptop'));

    get All Data

    List<Product> products = await HiveHelper().getAllData<Product>('productsBox');

    Updating data

    await HiveHelper().updateData('productsBox', 1, Product(id: 1, name: 'Updated Laptop'));


    Deleting data:

    await HiveHelper().deleteDataByKey('productsBox', 1);

    Check if a key exists:
    bool exists = await HiveHelper().containsKey('productsBox', 1);




 * */

