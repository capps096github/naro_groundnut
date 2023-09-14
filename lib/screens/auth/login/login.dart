import '../../../naro_exporter.dart';
import '../components/auth_heading.dart';
import 'login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    //
    return const ExpandedScrollingColumn(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Spacer(),
        PaddedLogo(),
        Spacer(),
        AuthHeader(heading: "Login"),
        VerticalSpace(of: spacing16),
        // LogoutTile(),
        LoginForm(),
        Spacer(),
      ],
    );
  }
}
