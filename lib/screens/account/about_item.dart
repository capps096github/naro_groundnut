import '../../naro_exporter.dart';
import 'edit/change_password.dart';
import 'edit/edit_profile.dart';

class AboutItem {
  final IconData icon;
  final String label, tooltip;
  final VoidCallback? onTap;

  // widget
  final Widget? goTo;

  AboutItem({
    required this.icon,
    required this.label,
    this.onTap,
    this.goTo,
    required this.tooltip,
  });
}

// my account
final List<AboutItem> myAccountItems = [
  AboutItem(
    icon: Icons.person,
    label: 'Edit my Profile',
    tooltip: 'View and edit your profile',
    goTo: const EditProfile(),
  ),
  AboutItem(
    icon: Icons.lock,
    label: 'Change Password',
    tooltip: 'Change your password',
    goTo: const ChangePassword(),
  ),
];

// my content and activity
final List<AboutItem> myContentItems = [
  AboutItem(
    icon: Icons.yard,
    label: 'Gardens',
    tooltip: 'View your Gardens',
    goTo: const MyGardens(),
  ),
  AboutItem(
    icon: Icons.shopping_basket_rounded,
    label: 'Products and Services',
    tooltip: 'View your Products and Services',
  ),
  AboutItem(
    icon: Icons.help,
    label: 'Questions',
    tooltip: 'View your questions',
  ),
  AboutItem(
    icon: Icons.chat_bubble_outline,
    label: 'Messages',
    tooltip: 'View your messages',
  ),
];

// support
final List<AboutItem> supportItems = [
  AboutItem(
    icon: Icons.call,
    label: 'NARO Toll Free Line',
    tooltip: 'Call NARO Toll Free Line',
  ),
  AboutItem(
    icon: Icons.list,
    label: 'Important Contacts',
    tooltip: 'View important contacts',
  ),
  AboutItem(
    icon: Icons.security,
    label: 'Privacy Policy',
    tooltip: 'View our privacy policy',
  ),
  AboutItem(
    icon: Icons.crisis_alert_rounded,
    label: 'Report a Technical Problem',
    tooltip: 'Report a Technical Problem',
  ),
];
