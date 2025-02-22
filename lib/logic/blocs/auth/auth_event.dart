abstract class AuthEvent {}



class AppStarted extends AuthEvent {}


class LoginRequested extends AuthEvent {
  final String email, password;
  LoginRequested({required this.email, required this.password});
}

class LogoutRequested extends AuthEvent {}
