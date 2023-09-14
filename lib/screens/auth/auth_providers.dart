// Project imports:
import '../../naro_exporter.dart';

///Current Index of the auth pages
final authPageIndexProvider = StateProvider<int>((_) => 0);

///Sign Up form
final signUpFormKeyProvider = Provider<GlobalKey<FormState>>((_) => GlobalKey<FormState>());

///Sign In Form
final loginFormKeyProvider = Provider<GlobalKey<FormState>>((_) => GlobalKey<FormState>());

///Forgot form
final forgotFormKeyProvider = Provider<GlobalKey<FormState>>((_) => GlobalKey<FormState>());

///whether the email to rest password has been sent
final isResetEmailSentProvider = StateProvider((ref) => false);

/// whether the user has finished welcome or not
/// if the user has finished welcome, then the user will be redirected to the login page
/// else the user will be redirected to the welcome page
// final isWelcomeFinishedProvider = StateProvider((ref) => false);
