import 'package:flutter/material.dart';

class ProfilePicture extends StatelessWidget {
  final Color? borderColor;
  final double borderThikness;
  final String? avatarUrl;
  final double diameter;

  const ProfilePicture({
    Key? key,
    this.avatarUrl,
    this.diameter = 20,
    this.borderColor,
    this.borderThikness = 5,
  })  : assert(avatarUrl != null, 'Please provide an avatar'),
        super(key: key);

  Widget _buildBorder(Widget child) {
    return CircleAvatar(
      backgroundColor: borderColor,
      radius: diameter + borderThikness,
      child: child,
    );
  }

  Widget _buildProfileAvatarByUrl() {
    return CircleAvatar(
      radius: diameter,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(200),
        child: Image.network(
          avatarUrl!,
          fit: BoxFit.fill,
          width: 105,
          height: 105,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return borderColor == null
        ? _buildProfileAvatarByUrl()
        : _buildBorder(_buildProfileAvatarByUrl());
  }
}
