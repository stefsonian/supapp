# supapp — Todo Web App

## Stack
- Flutter + Dart — web (primary), iOS + Android
- Navigation: AutoRoute (router in `lib/src/core/router/`)
- State: Riverpod with code generation (`@riverpod`)
- Models: Freezed for all data classes
- JSON: json_serializable (via build_runner — no manual `dart:convert`)
- DI: Riverpod providers — no get_it
- Remote DB: Supabase (auth + todos table)

## Project structure
```
lib/
  main.dart
  src/
    app.dart
    core/
      router/          # app_router.dart + app_router.gr.dart
      auth/            # Auth state, guards
      providers/       # App-wide providers
      theme/           # ThemeData
    shared/
      widgets/         # Reusable UI components
      utils/           # Shared helpers
    features/
      auth/
        domain/        # AuthState, AuthRepository interface
        data/          # SupabaseAuthRepository
        ui/            # LoginScreen, RegisterScreen
          providers/   # AuthNotifier
      todos/
        domain/        # Todo model, TodoRepository interface
        data/          # SupabaseTodoRepository
        ui/
          todo_list_screen/
            widgets/   # TodoItem, AddTodoField, FilterBar
          providers/   # TodosNotifier
```

## Code generation
After modifying any `@freezed`, `@riverpod`, or `@RoutePage()`:
```
dart run build_runner build --delete-conflicting-outputs
```
Never hand-edit `*.g.dart`, `*.freezed.dart`, or `*.gr.dart`.

## Critical rules
- No `Navigator.push` — use `context.router` (AutoRoute)
- No `print()` — use `debugPrint()`
- `ref.watch` only in `build()` — use `ref.read` in callbacks
- `const` constructors wherever possible
- Trailing commas on all multi-line parameter lists
