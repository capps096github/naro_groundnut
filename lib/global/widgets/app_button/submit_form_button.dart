// Project imports:
import '../../../naro_exporter.dart';

class SubmitFormButton extends ConsumerStatefulWidget {
  const SubmitFormButton({
    super.key,
    required this.form,
  });

  // form
  final AppForm form;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SubmitFormButtonState();
}

class _SubmitFormButtonState extends ConsumerState<SubmitFormButton> {
  // istapped
  bool isButtonTapped = false;

  @override
  Widget build(BuildContext context) {
    // current form
    final thisForm = widget.form;

    final formKey = ref.watch(thisForm.formKeyProvider);

    // show error telling user to fill in all fields
    final cantSubmit = "Can't Submit ${thisForm.title} Form!";

    // TODO add a submit provider that checks if all these fields of this form are filled up
    //  since each form has a different set of fields, we need to check if all the fields are filled up
    //  we will do this in the providers class of this function and thats where we shall check for the form too whether its filled up
    //  so here we shall call is as is form filled up, then we act accordingly

    return CircularProgressAppButton(
      isTapped: isButtonTapped,
      onTap: () async {
        // Unfocus Keyboard
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }

        if (formKey.currentState!.validate()) {
          enableTap();

          await thisForm.submit().then(
            (response) {
              //* Process the response data if internet connection is available
              if (response.statusCode == 200) {
                // * Convert the response to a AppResponse
                AppResponse appResponse = AppResponse.fromJson(response.data);

                if (appResponse.isSuccessful) {
                  printer('Request successful!');

                  showToast(
                    context: context,
                    text: "${thisForm.title} Submitted!",
                    message:
                        "Thank you for your submission. You will be notified when your request is processed.",
                  );
                  disableTap();
                  // clear the form after sign in
                  formKey.currentState!.reset();
                } else {
                  disableTap();
                  // show a toast with error message
                  showErrorToast(
                    context: context,
                    text: cantSubmit,
                    message: appResponse.message,
                  );
                }
              } else {
                disableTap();
                // show a toast with error message
                showErrorToast(
                  context: context,
                  text: "Error: ${response.statusCode}\n$cantSubmit",
                  message: response.statusMessage,
                );
              }
            },
          );
        } else {
          disableTap();
          showErrorToast(
            context: context,
            text: cantSubmit,
            message: "Please fill in all fields in the form!",
          );
        }
      },
      text: "SUBMIT",
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

  void enableTap() {
    setState(() {
      isButtonTapped = true;
    });
  }
}
