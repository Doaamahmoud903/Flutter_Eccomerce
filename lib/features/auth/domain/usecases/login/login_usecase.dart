import 'package:eccomerce_app/features/auth/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginUsecase {
  final AuthRepository authRepository;
  LoginUsecase(this.authRepository);

  invoke(String email, String password) {
    return authRepository.login( email,  password);
  }
}
