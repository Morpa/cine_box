import 'package:cinebox/ui/core/themes/resource.dart';
import 'package:cinebox/ui/login/commands/login_with_google_command.dart';
import 'package:cinebox/ui/login/login_view_model.dart';
import 'package:cinebox/ui/login/widgets/sign_in_google_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _State();
}

class _State extends ConsumerState<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            R.ASSETS_IMAGES_BG_LOGIN_PNG,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Container(
            constraints: BoxConstraints.expand(),
            color: Colors.black.withAlpha(170),
          ),
          Container(
            constraints: BoxConstraints.expand(),
            padding: const EdgeInsets.only(top: 108),
            child: Column(
              spacing: 48,
              children: [
                Image.asset(R.ASSETS_IMAGES_LOGO_PNG),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Consumer(
                    builder: (_, ref, _) {
                      final state = ref.watch(loginWithGoogleCommandProvider);
                      return SignInGoogleButton(
                        isLoading: state.isLoading,
                        onPressed: () {
                          final viewModel = ref.read(loginViewModelProvider);
                          viewModel.googleLogin();
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
