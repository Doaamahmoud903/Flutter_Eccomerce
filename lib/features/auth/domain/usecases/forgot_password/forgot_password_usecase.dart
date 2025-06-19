import 'package:eccomerce_app/features/auth/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class ForgotPasswordUsecase {
  final AuthRepository authRepository;
  ForgotPasswordUsecase(this.authRepository);

  invoke(String email) {
    return authRepository.forgotPassword(email);
  }
}
