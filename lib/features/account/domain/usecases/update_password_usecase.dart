import 'package:injectable/injectable.dart';
import '../repository/account_repository.dart';

@injectable
class UpdatePasswordUsecase{
  final AccountRepository accountRepository;
  UpdatePasswordUsecase(this.accountRepository);
  
  invoke(String currentPassword , String password , String rePassword ,String token){
    return accountRepository.updatePassword(currentPassword, password, rePassword ,token);
  }
}