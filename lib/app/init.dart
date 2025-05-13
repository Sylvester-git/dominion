
// class AppInit {
//   static Future<void> preRun() async {
//     WidgetsFlutterBinding.ensureInitialized();
//     // Initialize any necessary services or configurations here
//     // For example, you might want to initialize a database connection,
//     // set up logging, or load configuration files.
//     log("App initialization started...");
//     await Supabase.initialize(
//       url: ConfigServices.get('SUPABASE_URL'),
//       anonKey: ConfigServices.get('SUPABASE_KEY'),
//     );
//     log("App initialization completed.");
//   }
// }
