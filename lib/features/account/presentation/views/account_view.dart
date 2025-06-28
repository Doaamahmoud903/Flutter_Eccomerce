import 'package:flutter/material.dart';
import 'package:eccomerce_app/features/account/presentation/views/widgets/account_view_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/di.dart';
import '../manager/account_view_model.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AccountViewModel>(
        create: (context) => getIt<AccountViewModel>()..loadUserData(),
        child: AccountViewBody());
  }
}
