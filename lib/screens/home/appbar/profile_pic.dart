import 'package:cached_network_image/cached_network_image.dart';

import '../../../naro_exporter.dart';

class UserProfilePic extends ConsumerWidget {
  const UserProfilePic({
    super.key,
  });

  @override
  Widget build(BuildContext context, ref) {
    // current app user
    final naroUser = ref.watch(naroUserProvider) ?? defaultUser;

    // check if avatar is empty
    final avatarIsEmpty = (naroUser.avatar.isEmpty);

    // profile pic
    final profilePic = avatarIsEmpty ? defaultProfilePic : naroUser.avatar;

    // end color
    const endColor = naroSecondaryColor;

    const backgroundColor = naroSecondaryColor;

    return InkWell(
      onTap: () => push(const NaroAccount()),
      customBorder: const CircleBorder(),
      child: Ink(
        child: Stack(
          children: [
            Hero(
              tag: userProfileTag,
              child: Container(
                margin: const EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  color: backgroundColor.withOpacity(.3),
                  border: Border.all(
                    color: endColor.withOpacity(.8),
                    width: 1.5,
                  ),
                  shape: BoxShape.circle,
                ),
                child: CircleAvatar(
                  backgroundColor: naroBackground.withOpacity(.3),
                  backgroundImage: CachedNetworkImageProvider(profilePic),
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              right: 8,
              child: Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: endColor,
                  border: Border.all(
                    color: naroWhite,
                    width: 1.2,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
