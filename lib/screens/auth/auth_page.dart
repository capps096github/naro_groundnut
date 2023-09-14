import '../../naro_exporter.dart';
import 'forgot/forgot.dart';
import 'login/login.dart';
import 'signup/signup.dart';

class AuthPage {
  // child widget
  final Widget page;

  // question
  final String? question;

  // action
  final String? action;

  /// this is the index of the page to switch to inorder to perform the action e.g if action is login, the page index is the index of the signup page and vice versa
  final int actionPageIndex;

  AuthPage({
    required this.page,
    this.question,
    this.action,
    required this.actionPageIndex,
  });
}

List<AuthPage> authPages = [
  AuthPage(
    page: const LoginScreen(),
    question: "Don't have an account?",
    action: "Sign Up",
    actionPageIndex: 1,
  ),
  AuthPage(
    page: const SignUpScreen(),
    question: "Already have an account?",
    action: "Login",
    actionPageIndex: 0,
  ),
  AuthPage(
    page: const ForgotPasswordScreen(),
    question: "Remember your password?",
    action: "Login",
    actionPageIndex: 0,
  ),
];

/// This provider will return the current auth page
final authPageProvider = Provider<AuthPage>((ref) {
  // get the current index
  final authPageIndex = ref.watch(authPageIndexProvider);
  //
  return authPages[authPageIndex];
});
