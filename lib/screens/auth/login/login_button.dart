// Project imports:
import '../../../naro_exporter.dart';

class LogInButton extends ConsumerStatefulWidget {
  const LogInButton({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignInButtonState();
}

class _SignInButtonState extends ConsumerState<LogInButton> {
// istapped
  bool isButtonTapped = false;

  @override
  Widget build(BuildContext context) {
    final signInFormKey = ref.watch(loginFormKeyProvider);
    final email = ref.watch(emailProvider);
    final password = ref.watch(passwordProvider);

    // userServiceProvider
    final userService = ref.watch(userServiceProvider);

    final cropService = ref.watch(cropVariertyServiceProvider);

    return CircularProgressAppButton(
      isTapped: isButtonTapped,
      onTap: () async {
        // reset the error to an empty string
        ref.read(naroAPIErrorTextProvider.notifier).state = '';

        // Unfocus Keyboard
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }

        if (signInFormKey.currentState!.validate()) {
          enableTap();

          // * Sign In
          await userService.login(email: email, password: password).then((response) async {
            //* Process the response data if internet connection is available
            if (response.statusCode == 200) {
              // * Convert the response to a AppResponse
              AppResponse appResponse = AppResponse.fromJson(response.data);

              if (appResponse.isSuccessful) {
                printer('Request successful!');

                // save the user to local database
                // in this case appResponse.data is a map
                await userService.save(NaroUser.fromMap(response.data['data'])).then((_) async {
                  printer("User Signed In");
                  disableTap();

                  // clear the form after sign in
                  signInFormKey.currentState!.reset();

                  // get initial crop varieties then go to home
                  await cropService.initializeVariaties().then((_) {
                    // Go to Home
                    popAllAndPushNamed(homePath);
                  });
                });
              } else {
                // disable tap
                disableTap();

                ref.read(naroAPIErrorTextProvider.notifier).state =
                    'Unable to Log In. Try Again.\n\nCause: ${appResponse.message}';
              }
            } else {
              // disable tap
              disableTap();

              ref.read(naroAPIErrorTextProvider.notifier).state =
                  'Error Logging In. Try Again.\n\nCause: ${response.statusMessage}';
            }
          });
        }
      },
      text: "LOGIN",
      textColor: naroWhite,
      buttonColor: naroColor,
    );
  }

  void enableTap() {
    setState(() {
      isButtonTapped = true;
    });
  }

  /// Disable the button tap
  void disableTap() {
    if (mounted) {
      setState(() {
        isButtonTapped = false;
      });
    }
  }
}
