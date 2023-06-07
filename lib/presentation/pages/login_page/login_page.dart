import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../constants/const_colors.dart';
import '../../../data/repositories/local_data_repository.dart';
import '../../../domain/core/log.dart';
import '../../../domain/cubit/sign_up_cubit/sign_up_cubit.dart';
import '../../../generated/l10n.dart';
import '../../widgets/button_container.dart';
import '../../widgets/text_container.dart';
import '../home_page/home_page.dart';
import '../interests_page/interests_page.dart';

class LoginPage extends StatelessWidget {
  static const String routeName = 'login';

  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    navigateTo() {
      if (LocalDataRepository.interestsList.isEmpty) {
        context.goNamed(InterestPage.routeName);
      } else {
        context.goNamed(HomePage.routeName);
      }
    }

    signUp(GoogleSignInAccount account) {
      BlocProvider.of<SignUpCubit>(context).onSignUp(
        name: account.displayName ?? '',
        email: account.email,
        imageUrl: account.photoUrl ?? '',
        providerId: account.id,
        provider: 'GOOGLE',
      );
    }

    return Scaffold(
      body: BlocBuilder<SignUpCubit, SignUpState>(
        buildWhen: (previous, current) {
          if (current.signUpModel != null) {
            navigateTo();
          } else if (current.isError) {
            String message = 'Try later';
            if (current.errorModel!.isFriendly) {
              message = current.errorModel!.message;
            }
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: TextContainer(message),
              backgroundColor: Colors.red.shade300,
            ));
          }
          return true;
        },
        builder: (context, state) {
          return SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(width: 32),
                TextContainer(
                  S.current.registerText,
                  textAlign: TextAlign.center,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
                Image.asset('assets/img/login/login.png'),
                const SizedBox(width: 32),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      ButtonContainer(
                        title: S.current.signUp,
                        isLoading: state.isLoading,
                        onTap: () async {
                          GoogleSignIn googleSignIn = GoogleSignIn();
                          var singIn = await googleSignIn.signIn();
                          if (singIn != null) {
                            logInfo(singIn.toString());
                            signUp(singIn);
                          }
                          await googleSignIn.signOut();
                        },
                      ),
                      const SizedBox(height: 8),
                      ButtonContainer(
                        title: S.current.skipBtn,
                        textColor: ConstColors.secondary,
                        background: Theme.of(context).scaffoldBackgroundColor,
                        borderColor: ConstColors.secondary,
                        onTap: state.isLoading
                            ? null
                            : () {
                                navigateTo();
                              },
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
