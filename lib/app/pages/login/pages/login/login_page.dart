import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_snow_base/flutter_snow_base.dart';
import 'package:mobx/mobx.dart';
import 'package:raro_test/app/constants/routers.dart';
import 'package:raro_test/app/styles/app_color_scheme.dart';
import 'package:raro_test/app/utils/validators.dart';
import 'package:raro_test/app/widgets/button_app/button_app_widget.dart';
import 'package:raro_test/app/widgets/custom_alert_dialog/custom_alert_dialog.dart';
import 'package:raro_test/app/widgets/login/password_text_field_widget.dart';
import 'package:raro_test/app/widgets/logo_app/logo_app_widget.dart';
import 'package:raro_test/app/widgets/text_form_field/text_form_field_widget.dart';
import 'package:raro_test/app/widgets/top_bar_expandable/top_bar_expandable_widget.dart';
import 'package:raro_test/domain/entities/auth/auth_entity.dart';
import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  //use 'controller' variable to access controller
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  ReactionDisposer? disposer;

  @override
  void initState() {
    disposer = autorun((rc) {
      switch (controller.userResource?.status) {
        case Status.loading:
          break;
        case Status.success:
          break;
        case Status.failed:
          CustomAlertDialog.error(
            context,
            title: "Conta incorreta",
            content: "Confira seu login, sua senha e tente novamente.",
          );
          break;
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    disposer!();
    super.dispose();
  }

  Future<void> login() async {
//     if (_formKey.currentState!.validate()) {
      /*await controller.loginWithEmail(
        AuthEntity(
          username: _usernameController.text.toLowerCase(),
          password: _passwordController.text,
        ),
      );*/
       Modular.to.pushNamed(AppRoutes.home);
  //   }
  }

  final spacer = const SizedBox(
    height: 20,
  );

  @override
  Widget build(BuildContext context) {
    bool keyboardVisible = false;

    try {
      keyboardVisible = KeyboardVisibilityProvider.isKeyboardVisible(context);
    } catch (e) {}
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: keyboardVisible ? null : MediaQuery.of(context).size.height,
          child: Column(
            children: [
              TopBarExpandableWidget(
                decoration: BoxDecoration(
                  color: AppColorScheme.primarySwatch,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                ),
                child: LogoAppWidget(),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      spacer,
                      Text(
                        "Olá, bem-vindo!",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 19,
                        ),
                      ),
                      spacer,
                      TextFormFieldWidget(
                        controller: _usernameController,
                        titleLabel: "Digite aqui seu usuário",
                        borderColor: Colors.red,
                        borderError: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(
                            color: AppColorScheme.grey,
                            width: 1.0,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(
                            color: AppColorScheme.grey,
                            width: 1.0,
                          ),
                        ),
                        validator: (String? value) => Validators.string(
                          value: value!,
                          message: "O campo não pode ser vazio",
                        ).toString(),
                        onChanged: (String value) {},
                      ),
                      PasswordTextFieldWidget(
                        controller: _passwordController,
                        label: "Digite sua senha",
                        borderError: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(
                            color: AppColorScheme.grey,
                            width: 1.0,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(
                            color: AppColorScheme.grey,
                            width: 1.0,
                          ),
                        ),
                        validateLenght: false,
                        validateStrongness: false,
                        onSaved: (String value) {},
                        validator: (String value) {
                          return '';
                        },
                        onFieldSubmitted: (String value) {},
                      ),
                      spacer,
                      Observer(builder: (_) {
                        return ButtonAppWidget(
                          onPressed: () {
                            login();
                          },
                          color: AppColorScheme.primarySwatch,
                          colorContent: AppColorScheme.white,
                          text: "Entrar",
//                          loading: controller.userResource?.status == Status.loading,
                        );
                      }),
                    ],
                  ),
                ),
              ),
              if (!keyboardVisible) Spacer(),
              spacer,
              ButtonAppWidget(
                color: AppColorScheme.white,
                colorContent: AppColorScheme.black,
                text: "Esqueci minha senha",
                onPressed: () {
                 Modular.to.pushNamed("/login/recover_password");
                },
                // type: ButtonKidosType.textButton,
              ),
              spacer,
            ],
          ),
        ),
      ),
    );
  }
}
