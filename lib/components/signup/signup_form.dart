part of '/screens/sign_up_screen.dart';

class SignupInputForm extends StatefulWidget {
  final bool isLoading;
  const SignupInputForm({super.key, required this.isLoading});

  @override
  State<SignupInputForm> createState() => _SignupInputFormState();
}

class _SignupInputFormState extends State<SignupInputForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _obscurePasswordText = true;
  bool _obscureConfirmPasswordText = true;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: SizedBox(
            height: constraints.maxHeight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(
                  height: 55,
                ),
                InputSection(
                  nameController: _nameController,
                  emailController: _emailController,
                  passwordController: _passwordController,
                  confirmPasswordController: _confirmPasswordController,
                  obscurePasswordText: _obscurePasswordText,
                  obscureConfirmPasswordText: _obscureConfirmPasswordText,
                  togglePasswordView: _togglePasswordView,
                  toggleConfirmPasswordView: _toggleConfirmPasswordView,
                ),
                const Spacer(),
                FooterSection(
                  isLoading: widget.isLoading,
                  handleSignUpButtonOnTap: _handleSignUpButtonOnTap,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _handleSignUpButtonOnTap() {
    context.read<AuthenticationBloc>().add(
          SignUpSubmissionEvent(
            signUpReq: SignUpReq(
              fullName: _nameController.text,
              email: _emailController.text,
              password: _passwordController.text,
              confirmPassword: _confirmPasswordController.text,
            ),
          ),
        );
  }

  void _togglePasswordView() {
    setState(() {
      _obscurePasswordText = !_obscurePasswordText;
    });
  }

  void _toggleConfirmPasswordView() {
    setState(() {
      _obscureConfirmPasswordText = !_obscureConfirmPasswordText;
    });
  }
}
