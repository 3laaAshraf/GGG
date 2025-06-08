abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {}

class LoginFailure extends LoginState {
  final String errorMessage;
  // يمكن إضافة رمز الخطأ في حال الحاجة
  LoginFailure(this.errorMessage);
}

class EmailNotVerified extends LoginState {}
