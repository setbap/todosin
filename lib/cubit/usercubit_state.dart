part of 'usercubit_cubit.dart';

class UsercubitState extends Equatable {
  final Username username;
  final Password password;
  final FormzStatus status;

  const UsercubitState({
    @required this.username,
    @required this.password,
    @required this.status,
  });

  @override
  List<Object> get props => [username, password];

  String get usernameStr => this.username.value;
  String get passwordStr => this.password.value;

  UsercubitState copyWith({
    FormzStatus status,
    Username username,
    Password password,
  }) {
    return UsercubitState(
      status: status ?? this.status,
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }

  @override
  String toString() =>
      "info is username ${username.value} and password ${password.value} ";
}
