// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todos_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TodoFilterNotifier)
const todoFilterProvider = TodoFilterNotifierProvider._();

final class TodoFilterNotifierProvider
    extends $NotifierProvider<TodoFilterNotifier, TodoFilter> {
  const TodoFilterNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'todoFilterProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$todoFilterNotifierHash();

  @$internal
  @override
  TodoFilterNotifier create() => TodoFilterNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TodoFilter value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TodoFilter>(value),
    );
  }
}

String _$todoFilterNotifierHash() =>
    r'51701a053f8495f39aa2084e1df947abaa5d2d23';

abstract class _$TodoFilterNotifier extends $Notifier<TodoFilter> {
  TodoFilter build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<TodoFilter, TodoFilter>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<TodoFilter, TodoFilter>,
              TodoFilter,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(TodosNotifier)
const todosProvider = TodosNotifierProvider._();

final class TodosNotifierProvider
    extends $StreamNotifierProvider<TodosNotifier, List<Todo>> {
  const TodosNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'todosProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$todosNotifierHash();

  @$internal
  @override
  TodosNotifier create() => TodosNotifier();
}

String _$todosNotifierHash() => r'fbc1ce50a099b30763f7ed0844b52624e70bdc1e';

abstract class _$TodosNotifier extends $StreamNotifier<List<Todo>> {
  Stream<List<Todo>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<List<Todo>>, List<Todo>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Todo>>, List<Todo>>,
              AsyncValue<List<Todo>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(filteredTodos)
const filteredTodosProvider = FilteredTodosProvider._();

final class FilteredTodosProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Todo>>,
          AsyncValue<List<Todo>>,
          AsyncValue<List<Todo>>
        >
    with $Provider<AsyncValue<List<Todo>>> {
  const FilteredTodosProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'filteredTodosProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$filteredTodosHash();

  @$internal
  @override
  $ProviderElement<AsyncValue<List<Todo>>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  AsyncValue<List<Todo>> create(Ref ref) {
    return filteredTodos(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<List<Todo>> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<List<Todo>>>(value),
    );
  }
}

String _$filteredTodosHash() => r'bd1452a49a5072fb18ec4d623c88b7a709de9ebf';
