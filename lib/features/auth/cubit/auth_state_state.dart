part of 'auth_state_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthStateInitial extends AuthState {}

final class AuthLoadingState extends AuthState {}

final class AuthSuccessState extends AuthState {}

final class AuthFailedState extends AuthState {}
