import 'package:eccomerce_app/features/account/domain/repository/account_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class UpdateUserProfileUsecase{
  final AccountRepository accountRepository;
  UpdateUserProfileUsecase(this.accountRepository);
  invoke(String name , String email ,String token){
    return accountRepository.updateUserProfile(name, email ,token);
  }
}