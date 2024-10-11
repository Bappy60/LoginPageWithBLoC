part of '/screens/login_screen.dart';
class RegisterSection extends StatelessWidget {
  const RegisterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Don\'t have an account?', style: kDefaultTextStyle),
        TextButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SignUpScreen()),
          ),
          child: Text('Register', style: kRegisterTextStyle),
        ),
      ],
    );
  }
}