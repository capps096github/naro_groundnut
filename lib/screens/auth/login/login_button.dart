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

    // login credentials
    final loginCredentials = ref.watch(loginCredentialsProvider);

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
          await userService.login(loginCredentials: loginCredentials).then((response) async {
            //* Process the response data if internet connection is available
            if (response.statusCode == 200) {
              // * Convert the response to a AppResponse
              AppResponse appResponse = AppResponse.fromJson(response.data);

              // print the response and appResponse
              printer('Response: $response');
              printer('AppResponse: $appResponse');

              if (appResponse.isSuccessful) {
                printer('Request successful!');

                // current user
                final appUser = NaroUser.fromMap(response.data['data']);

                // save the user to local database
                // in this case appResponse.data is a map
                await userService.save(appUser).then((_) async {
                  //  update user
                  ref.read(naroUserProvider.notifier).state = appUser;

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
                    'Request Error. Try Again.\n\nCause: ${response.statusCode} Request Unsuccesful ${response.data}';
              }
            } else {
              // disable tap
              disableTap();

              ref.read(naroAPIErrorTextProvider.notifier).state =
                  'Error Logging In. Try Again.\n\nCause: ${response.statusCode} Request Unsuccesful ${response.data}';
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
