import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_order_app/core/navigator/router/app_router.dart';
import 'package:food_order_app/core/resources/theme/colors/theme_color.dart';
import 'package:food_order_app/core/resources/theme/text/app_text_theme.dart';
import 'package:food_order_app/features/grocery/presentation/bloc/grocery_bloc.dart';
import 'package:food_order_app/features/language/presentation/bloc/language_bloc.dart';

import 'core/gen/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    EasyLocalization(
        supportedLocales: const [
          Locale('en', 'US'),
          Locale('vi', 'VN'),
          Locale('fr', 'FR'),
        ],
        path: 'assets/translations',
        fallbackLocale: const Locale('en', 'US'),
        child: const MyApp()),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late LanguageBloc _languageBloc;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          lazy: false,
          create: (context) => GroceryBloc()..add(GroceryGetData()),
        ),
        BlocProvider<LanguageBloc>.value(value: _languageBloc),
      ],
      child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus(); // Dismiss keyboard
        },
        child: BlocListener<LanguageBloc, LanguageState>(
          listenWhen: (previous, current) => previous.locale != current.locale,
          listener: (context, state) async {
            // Update the app's locale when the language state changes
            await context.setLocale(state.locale);
          },
          child: MaterialApp.router(
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            routerConfig: appRouter,
            theme: ThemeData(
              scaffoldBackgroundColor: ThemeColor.white,
              textTheme: AppTextTheme.textTheme,
            ),
            debugShowCheckedModeBanner: false,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _languageBloc.close();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _languageBloc = LanguageBloc();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _languageBloc.add(LanguageChanged(
        context.locale,
      ));
    });
  }
}
