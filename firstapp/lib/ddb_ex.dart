PersonsDatabaseHelper._privateConstructor();
static final PersonsDatabaseHelper instance =
    PersonsDatabaseHelper._privateConstructor();
static Database _database;
Future<Database> get database async {
  if (_database != null) return _database;
  _database = await _initDB();
  return _database;
}
_initDB() async {
  WidgetsFlutterBinding.ensureInitialized();
  final database = openDatabase(
    join(await getDatabasesPath(), 'persons_database.db'),
    onCreate: (db, version) {
      return db.execute(
        "CREATE TABLE persons(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, age INTEGER)",
      );
    },
    version: 1,
  );
  return database;
}
