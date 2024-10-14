part of '/screens/login_screen.dart';

class LoginForm extends StatefulWidget {
  final bool isLoading;

  const LoginForm({super.key, required this.isLoading});

  @override
  LoginFormState createState() => LoginFormState();
}

class LoginFormState extends State<LoginForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePasswordText = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          height: constraints.maxHeight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 55),
              InputSection(
                emailController: _emailController,
                passwordController: _passwordController,
                obscurePasswordText: _obscurePasswordText,
                togglePasswordView: _togglePasswordView,
              ),
              const Spacer(),
              FooterSection(
                isLoading: widget.isLoading,
                handleNextButtonOnTap: _handleNextButtonOnTap,
              ),
            ],
          ),
        );
      },
    );
  }

  void _handleNextButtonOnTap() {
    context.read<AuthenticationBloc>().add(
          LogInEvent(
            loginReq: LoginReq(
              email: _emailController.text,
              password: _passwordController.text,
            ),
          ),
        );
  }

  void _togglePasswordView() {
    setState(() {
      _obscurePasswordText = !_obscurePasswordText;
    });
  }
}
