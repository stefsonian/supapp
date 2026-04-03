# supapp

A simple todo web app built with Flutter Web + Supabase.

## Stack

- **Flutter Web** — UI framework
- **Supabase** — Backend (auth + Postgres database)
- **Riverpod** (code gen) — State management
- **Freezed** — Immutable data classes
- **AutoRoute** — Navigation

## Features

- Email/password authentication
- Create, complete, and delete todos
- Todos synced in real-time to Supabase
- Filter todos: All / Active / Completed

## Getting started

1. Create a Supabase project and run the schema migration in `supabase/migrations/`
2. Copy `.env.example` to `.env` and fill in your Supabase URL + anon key
3. Run `flutter pub get`
4. Run `dart run build_runner build --delete-conflicting-outputs`
5. Run `flutter run -d chrome`
