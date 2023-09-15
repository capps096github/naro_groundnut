// Project imports:
import '../../../naro_exporter.dart';

class SignUpButton extends ConsumerStatefulWidget {
  const SignUpButton({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpButtonState();
}

class _SignUpButtonState extends ConsumerState<SignUpButton> {
  // istapped
  bool isButtonTapped = false;
  @override
  Widget build(BuildContext context) {
    final signUpFormKey = ref.watch(signUpFormKeyProvider);

    // sign up credentials
    final signUpCredentials = ref.watch(signUpCredentialsProvider);
 
    // is password Confirmed
    final isPasswordConfirmed = ref.watch(isPasswordConfirmedProvider);

    // userServiceProvider
    final userService = ref.watch(userServiceProvider);

    final cropService = ref.watch(cropVariertyServiceProvider);

    return CircularProgressAppButton(
      isTapped: isButtonTapped,
      text: "SIGN UP",
      onTap: isPasswordConfirmed
          ? () async {
              // set the error to an empty string
              ref.read(naroAPIErrorTextProvider.notifier).state = '';

              // Unfocus Keyboard
              FocusScopeNode currentFocus = FocusScope.of(context);
              if (!currentFocus.hasPrimaryFocus) {
                currentFocus.unfocus();
              }

              // validate the form
              // and then authenticate if valid
              if (signUpFormKey.currentState!.validate()) {
                setState(() {
                  isButtonTapped = true;
                });

                // * Sign Up
                await userService
                    .signUp(signUpCredentials: signUpCredentials)
                    .then((response) async {
                  //* Process the response data if internet connection is available
                  if (response.statusCode == 200) {
                    // * Convert the response to a AppResponse
                    AppResponse appResponse = AppResponse.fromJson(response.data);
                    printer(appResponse);
                    if (appResponse.isSuccessful) {
                      printer('Request successful!');
                      printer('Response: ${response.data}');
                      // save the user to local database
                      // in this case appResponse.data is a map
                      // logout first to delete the existing user then save the new user
                      await userService.logout().then((_) async {
                        await userService
                            .save(NaroUser.fromMap(response.data['data']))
                            .then((_) async {
                          printer("User Signed In");
                          // disable tap
                          disableTap();
                          // clear the form after sign in
                          signUpFormKey.currentState!.reset();

                          // get initial crop varieties then go to home
                          await cropService.initializeVariaties().then((_) {
                            // Go to Home
                            popAllAndPushNamed(homePath);
                          });
                        });
                      });
                    } else {
                      // disable tap
                      disableTap();

                      ref.read(naroAPIErrorTextProvider.notifier).state =
                          'Unable to Create Account. Try Again.\n\nCause: ${appResponse.message}';
                    }
                  } else {
                    //Error disable tap
                    disableTap();

                    ref.read(naroAPIErrorTextProvider.notifier).state =
                        'Error Signing Up. Try Again.\n\nCause: ${response.statusMessage}';
                  }
                });
              }
            }
          : () {
              // set the error to tell the user to have matching passwords
              ref.read(naroAPIErrorTextProvider.notifier).state = 'Passwords do not match';
            },
      textColor: naroWhite,
      buttonColor: naroColor,
    );
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
