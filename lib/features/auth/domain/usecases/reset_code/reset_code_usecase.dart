import 'package:eccomerce_app/features/auth/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class ResetCodeUsecase {
  final AuthRepository authRepository;
  ResetCodeUsecase(this.authRepository);

  invoke(String resetCode) {
    return authRepository.resetCode(resetCode);
  }
}
