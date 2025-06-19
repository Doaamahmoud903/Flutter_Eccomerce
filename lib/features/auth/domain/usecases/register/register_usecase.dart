import 'package:eccomerce_app/features/auth/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class RegisterUsecase {
  final AuthRepository authRepository;
  RegisterUsecase(this.authRepository);

  invoke(String name,String email, String password , String rePassword, String phone){
    return authRepository.register(name, email, password, rePassword,phone);
  }
}
