import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram/bloc/login_cubit/login_cubit.dart';
import 'package:instagram/constants/colors.dart';
import 'package:instagram/presentation/widgets/CustomButton.dart';
import 'package:instagram/presentation/widgets/custom_text.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isEmailSelected = false;
  bool isPasswordSelected = false;
  bool isSecureSelected = false;
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  Color _emailBorderColor = Colors.grey;
  Color _passwordBorderColor = Colors.grey;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Change color for border if focus was changed
    _emailFocusNode.addListener(() {
      setState(() {
        _emailBorderColor =
            _emailFocusNode.hasFocus ? Colors.black : Colors.grey;
        isEmailSelected = _emailFocusNode.hasFocus ? true : false;
      });
    });
    _passwordFocusNode.addListener(() {
      setState(() {
        _passwordBorderColor =
            _passwordFocusNode.hasFocus ? Colors.black : Colors.grey;
        isPasswordSelected = _passwordFocusNode.hasFocus ? true : false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            Navigator.pushNamedAndRemoveUntil(
                context, "/home", (route) => false);
          }
          if (state is LoginError) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.errorMessage)));
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              CustomText(text: "English (india)"),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                  width: 50,
                  height: 50,
                  child: Image.asset(
                    "assets/icons/instagram.png",
                    fit: BoxFit.cover,
                  )),
              const SizedBox(
                height: 40,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  border: Border.all(color: _emailBorderColor),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: TextFormField(
                  controller: emailController,
                  focusNode: _emailFocusNode,
                  decoration: InputDecoration(
                      suffixIcon: isEmailSelected
                          ? IconButton(
                              onPressed: () {
                                emailController.clear();
                              },
                              icon: const Icon(
                                Icons.close,
                                color: Colors.black,
                              ))
                          : null,

                      // hintText: "Username, email address or mobile number",
                      border: InputBorder.none,
                      labelText: "Username, email address or mobile number",
                      floatingLabelStyle: const TextStyle(color: Colors.black),
                      labelStyle: const TextStyle(color: Colors.grey)),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  border: Border.all(color: _passwordBorderColor),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: TextFormField(
                  controller: passwordController,
                  focusNode: _passwordFocusNode,
                  obscureText: isSecureSelected,
                  decoration: InputDecoration(
                      suffixIcon: isPasswordSelected
                          ? IconButton(
                              onPressed: () {
                                setState(() {
                                  isSecureSelected = !isSecureSelected;
                                });
                              },
                              icon: const Icon(
                                Icons.privacy_tip,
                                color: Colors.black,
                              ))
                          : null,

                      // hintText: "Username, email address or mobile number",
                      border: InputBorder.none,
                      labelText: "Password",
                      floatingLabelStyle: const TextStyle(color: Colors.black),
                      labelStyle: const TextStyle(color: Colors.grey)),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  context.read<LoginCubit>().clickHandler(
                      emailController.text, passwordController.text);
                },
                child: CustomButton(
                  text: "Log In",
                  width: MediaQuery.of(context).size.width,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomText(
                text: "Forgotten Password?",
                bold: true,
              ),
              const Spacer(),
              CustomButton(
                text: "Create new account",
                isBorder: true,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                borderColor: kColor.PrimaryColor,
                textColor: kColor.PrimaryColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
