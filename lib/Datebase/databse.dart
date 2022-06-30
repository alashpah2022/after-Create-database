import 'package:firebase/data_list.dart';
import 'package:sqflite/sqflite.dart';

var database;


void CreateDatabase() async {
   database = await openDatabase
     (
      'missNurse.db', // name of database
      version: 1,

      onCreate: (database, version) async
      {
        print('Database created');
        // When creating the db, create the table
        await database.execute(
            'CREATE TABLE user (id TEXT PRIMARY KEY, name TEXT ,type TEXT, password TEXT, phone TEXT, department TEXT)')
            .then((value){
             print('table created');

           }).catchError((error){

             print('error on create table ${error.toString()}');
        });

        await database.execute(
            'CREATE TABLE patient (id TEXT PRIMARY KEY, name TEXT, age INTEGER, gender TEXT,'
                ' currentDiagnosis TEXT, chronicDiseases TEXT, forbidden TEXT, room TEXT,'
                ' oxygen NUMERIC, temp NUMERIC , bloodPressure TEXT , heartBeats NUMERIC)') // pressure not exist
            .then((value) {
            print('table created');

          }).catchError((error){

            print('error on create table ${error.toString()}');
        });
      },

      onOpen: (database)
      {
          print('Database opened');
         GetUsers(database)
             .then((value) {
           usersData = value;
       });
         GetPatirnts(database)
             .then((value) {
           patientsData = value;
         });
      },);

   /// insert initially to database (IT work :_)
  // database.transaction((txn) async {
  //
  // ///insert users
  //      await txn.rawInsert(
  //        'INSERT INTO user(id, name, type, password, phone, department) VALUES("26909011222727","Hagar AbduSalam", "D", "@Hagar99", "01007358527","Dermatology")');
  //    print('inserted1');
  //
  //    await txn.rawInsert(
  //        'INSERT INTO user(id, name, type, password, phone, department) VALUES("21907011222727","Hosna Sayed", "N", "@Hosna99", "01057358527","Physiotherapy")');
  //    print('inserted2');
  //
  //    await txn.rawInsert(
  //        'INSERT INTO user(id, name, type, password, phone, department) VALUES("22907011222727","Hagar Alaa", "D", "@Hegra99", "01077358527","Internal Medicine")');
  //    print('inserted3');
  //
  //    await txn.rawInsert(
  //        'INSERT INTO user(id, name, type, password, phone, department) VALUES("23907011222727","Sohila Tarek", "N", "@soso99", "01017358527","Cardiology")');
  //    print('inserted4');
  //
  //    await txn.rawInsert(
  //        'INSERT INTO user(id, name, type, password, phone, department) VALUES("24907011222727","Doaa Fakher", "D", "@dodo99", "01047358527","Clinical Pathology")');
  //    print('inserted5');
  //
  //               /////// insert patients
  //
  //    await txn.rawInsert(
  //        'INSERT INTO patient (id , name , age, gender, currentDiagnosis , chronicDiseases, forbidden, room, oxygen, temp, bloodPressure, heartBeats)'
  //            ' VALUES("24907011222728","Samah Morad", "20","F",  "", "","", "A1", 97, 37.2, "120/80", 80)');
  //    print('inserted6');
  //
  //
  //    await txn.rawInsert(
  //        'INSERT INTO patient (id , name , age, gender, currentDiagnosis , chronicDiseases, forbidden, room, oxygen, temp, bloodPressure, heartBeats)'
  //            'VALUES("24907011222721","Karima Mohsen", "49", "F", "", "","", "B2", 98, 37.2, "120/80", 80)');
  //    print('inserted7');
  //
  //
  //    await txn.rawInsert(
  //        'INSERT INTO patient (id , name , age, gender, currentDiagnosis , chronicDiseases, forbidden, room, oxygen, temp, bloodPressure, heartBeats)'
  //            'VALUES("24907011222722","Mamdouh Ahmed", "31", "M", "", "","", "C3", 99, 37.2, "120/80", 90)');
  //    print('inserted8');
  //
  //
  //    await txn.rawInsert(
  //        'INSERT INTO patient (id , name , age, gender, currentDiagnosis , chronicDiseases, forbidden, room, oxygen, temp, bloodPressure, heartBeats)'
  //            ' VALUES("24907011222723","Fahd Sameh", "25","M", "", "","", "A3", 97, 37.2, "120/80", 70)');
  //    print('inserted9');
  //
  //
  //    await txn.rawInsert(
  //        'INSERT INTO patient (id , name , age, gender, currentDiagnosis , chronicDiseases, forbidden, room, oxygen, temp, bloodPressure, heartBeats)'
  //            ' VALUES("24907011222720","Engy Momen", "21","F","", "","","B1", 99, 37.2, "120/80", 80)');
  //    print('inserted10');
  //
  //
  //  });
}

void InsertToDatabase(String id, String name, String type, String password, String phone, String depart) {
   database.transaction((txn) async {
    await txn.rawInsert(
        'INSERT INTO user(id, name ,type, password, phone, department) VALUES($id, $name, $type, $password, $phone, $depart)');
  });
}


Future <List <Map>> GetUsers(database) async
{
  return await database.rawQuery('SELECT * FROM user');
}

Future <List <Map>> GetPatirnts(database) async
{
  return await database.rawQuery('SELECT * FROM patient');
}
