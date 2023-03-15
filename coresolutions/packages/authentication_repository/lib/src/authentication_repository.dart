import 'dart:async';

enum AuthenticationStatus { unknown, authenticated, unauthenticated, expired }

class AuthenticationRepository {
  final _controller = StreamController<AuthenticationStatus>();

  Stream<AuthenticationStatus> get status async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield AuthenticationStatus.unauthenticated;
    yield* _controller.stream;
  }

  void unknown() {
    _controller.add(AuthenticationStatus.unknown);
  }

  void authenticated() {
    _controller.add(AuthenticationStatus.authenticated);
  }

  void unauthenticated() {
    _controller.add(AuthenticationStatus.unauthenticated);
  }

  void expired() {
    _controller.add(AuthenticationStatus.expired);
  }

  void logOut() {
    _controller.add(AuthenticationStatus.unauthenticated);
  }

  void dispose() => _controller.close();
}
