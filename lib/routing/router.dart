import 'package:brasil_cripto/config/dependencies.dart';
import 'package:brasil_cripto/routing/routes.dart';
import 'package:brasil_cripto/ui/home/widgets/home_screen.dart';
import 'package:go_router/go_router.dart';

class Router {
  Router._();
  static final GoRouter router = GoRouter(
    initialLocation: Routes.home,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: Routes.home,
        builder: (context, state) {
          return HomeScreen(
            viewModel: getIt(),
          );
        },
      ),
    ],
  );
}
