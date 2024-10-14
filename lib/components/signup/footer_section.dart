part of '/screens/sign_up_screen.dart';
class FooterSection extends StatelessWidget {
  final bool isLoading;
  final Function()? _handleSignUpButtonOnTap;

  const FooterSection({
    super.key,
    required this.isLoading,
    required Function()? handleSignUpButtonOnTap,
  }) : _handleSignUpButtonOnTap = handleSignUpButtonOnTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetectorContainer(
          isLoading: isLoading,
          text: 'Sign Up',
          onTap: _handleSignUpButtonOnTap,
        ),
      ],
    );
  }
}
