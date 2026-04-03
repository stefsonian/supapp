import 'package:auto_route/auto_route.dart';

import '../../features/auth/ui/login_screen/login_screen.dart';
import '../../features/todos/ui/todo_list_screen/todo_list_screen.dart';
import 'auth_guard.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  AppRouter({required this.authGuard});

  final AuthGuard authGuard;

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: LoginRoute.page, path: '/login'),
        AutoRoute(
          page: TodoListRoute.page,
          path: '/',
          guards: [authGuard],
          initial: true,
        ),
      ];
}
