import 'package:eccomerce_app/features/auth/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class ResetPasswordUsecase {
  final AuthRepository authRepository;
  ResetPasswordUsecase(this.authRepository);

  invoke(String email , String newPassword) {
    return authRepository.resetPassword(email , newPassword);
  }
}
